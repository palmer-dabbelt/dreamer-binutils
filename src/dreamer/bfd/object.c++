/*
 * Copyright (C) 2014 Palmer Dabbelt
 *   <palmer.dabbelt@eecs.berkeley.edu>
 *
 * This file is part of dreamer-binutils.
 * 
 * dreamer-binutils is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * dreamer-binutils is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with dreamer-binutils.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "object.h++"
#include <cstdio>
#include <cstring>
#include <vector>
#include <unistd.h>
using namespace dreamer::bfd;

#ifndef BUFFER_SIZE
#define BUFFER_SIZE 1024
#endif

object::object(const std::vector<tile_ptr>& tiles)
    : _tiles(tiles)
{
}

object_ptr object::read_hex_file(const std::string& filename)
{
    auto file = fopen(filename.c_str(), "r");
    if (file == NULL) {
        fprintf(stderr, "Unable to open file '%s'\n", filename.c_str());
        return NULL;
    }

    auto out = read_hex_file(file);

    fclose(file);
    return out;
}

object_ptr object::read_hex_file(FILE *file)
{
    char line[BUFFER_SIZE];

    if (fgets(line, BUFFER_SIZE, file) == NULL) {
        fprintf(stderr, "Got empty HEX file\n");
        return NULL;
    }

    {
        int version;
        if (sscanf(line, "VERSION %d\n", &version) != 1) {
            fprintf(stderr, "Require VERSION as first line\n");
            return NULL;
        }

        if (version != 5) {
            fprintf(stderr, "Only handles version 5 of HEX files\n");
            fprintf(stderr, "  Got 'VERSION %d'\n", version);
            return NULL;
        }
    }

    /* Variables for the parser. */
    long long line_number = 1;

    std::vector<std::string> unlinked_ins;
    std::vector<std::string> unlinked_outs;
    std::vector<std::string> unlinked_mems;
    std::vector<std::string> unlinked_regs;
    std::vector<std::string> unlinked_inits;

    std::vector<dreamer::bfd::tile_ptr> tiles;

    bool dims_set = false;
    struct {
        int x, y;
    } dims;

    /* Helper functions for the parser. */
    auto fetch_lines_for_later =
        [&](int count, FILE *in, std::vector<std::string>& out)
        {
            char line[BUFFER_SIZE];

            for (int i = 0; i < count; ++i) {
                if (fgets(line, BUFFER_SIZE, in) == NULL) {
                    fprintf(stderr, "Unable to read line\n");
                    return true;
                }

                out.push_back(line);
                line_number++;
            }

            return false;
        };

    /* The actual main parser logic. */
    while (fgets(line, BUFFER_SIZE, file) != NULL) {
        /* We've got this odd combination of a line-oriented file
         * format and one that's _not_ line oriented -- essentially
         * what it boils down to is that */
    reparse_line:
        if (line[0] == '\0')
            break;

        line_number++;

        /* Many of the input formats mean we actually want to go and
         * save things for later parsing. */
        int count;
        if (sscanf(line, "INS = %d\n", &count) == 1) {
            if (fetch_lines_for_later(count, file, unlinked_ins) == true)
                return NULL;
            continue;
        }
        if (sscanf(line, "OUTS = %d\n", &count) == 1) {
            if (fetch_lines_for_later(count, file, unlinked_outs) == true)
                return NULL;
            continue;
        }
        if (sscanf(line, "REGS = %d\n", &count) == 1) {
            if (fetch_lines_for_later(count, file, unlinked_regs) == true)
                return NULL;
            continue;
        }
        if (sscanf(line, "MEMS = %d\n", &count) == 1) {
            if (fetch_lines_for_later(count, file, unlinked_mems) == true)
                return NULL;
            continue;
        }
        if (sscanf(line, "INITS = %d\n", &count) == 1) {
            if (fetch_lines_for_later(count, file, unlinked_inits) == true)
                return NULL;
            continue;
        }

        int lo, x, y;
        if (sscanf(line, "TILE @ (%d, %d) NUM_LO_INSTS = %d\n", &x, &y, &lo) == 3) {
            std::vector<instruction_ptr> instructions;
            while (fgets(line, BUFFER_SIZE, file) != NULL) {
                line_number++;

                if (strncmp(line, "0x", 2) != 0)
                    break;

                auto inst = instruction::parse_hex(line);
                if (inst == NULL) {
                    fprintf(stderr, "Unable to parse instruction at %lld: %s\n",
                            line_number,
                            line
                        );
                    return NULL;
                }

                instructions.push_back(inst);
                line[0] = '\0';
            }

            auto address = tile_address(x, y);
            auto t = std::make_shared<tile>(address, lo, instructions);
            tiles.push_back(t);

            goto reparse_line;
            abort();
        }

        /* Some input formats just set something special on one single
         * line. */
        if (sscanf(line, "DIMS (%d, %d)\n", &dims.x, &dims.y) == 2) {
            if (dims_set == true) {
                fprintf(stderr, "DIMS set twice at %lld\n", line_number);
                return NULL;
            }

            dims_set = true;
            continue;
        }

        fprintf(stderr, "Unknown line %llu: %s\n",
                line_number,
                line
            );
        return NULL;
    }

    /* Now that the parser has finished, we need to construct the
     * relevant DREAMER object representation and return it. */
    return std::make_shared<object>(tiles);
}
