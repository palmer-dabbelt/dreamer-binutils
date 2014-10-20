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

#include <dreamer/bfd/object.h++>
#include <cstdio>
#include <cstring>
#include <string>
#include <unistd.h>

static void print_help_text(FILE *out);

int main(int argc, const char **argv)
{
    if (argc == 1) {
        print_help_text(stderr);
        abort();
    }

    std::string input_filename = "";
    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "--help") == 0) {
            print_help_text(stderr);
            return 0;
        } else {
            input_filename = argv[i];
        }
    }

    if (strcmp(input_filename.c_str(), "") == 0) {
        fprintf(stderr, "Provide an input file name\n");
        abort();
    }

    if (access(input_filename.c_str(), R_OK) != 0) {
        fprintf(stderr, "Unable to open input file '%s'\n",
                input_filename.c_str()
            );
        abort();
    }

    auto object = dreamer::bfd::object::read_hex_file(input_filename);
    if (object == NULL) {
        fprintf(stderr, "HEX parsing failed for '%s'\n",
                input_filename.c_str()
            );
        abort();
    }

    for (const auto& tile: object->tiles()) {
        auto mangled_name_str = tile->address().mangled_name();
        auto mangled_name = mangled_name_str.c_str();

        printf("section .text__tile_%s\n\n", mangled_name);

        printf("global _lo_%s\n", mangled_name);
        printf("_lo_%s:\n", mangled_name);
        for (const auto& i: tile->lo())
            printf("\t%s\n", i->to_string().c_str());
        printf("\n");

        printf("global _hi_%s\n", mangled_name);
        printf("_hi_%s:\n", mangled_name);
        for (const auto& i: tile->hi())
            printf("\t%s\n", i->to_string().c_str());
        printf("\n");

        printf("section .data__tile_%s\n\n", mangled_name);
    }

    return 0;
}

void print_help_text(FILE *out)
{
    fprintf(out, "dreamer-objdump <PROGRAM.hex>: Disassembles PROGRAM\n");
    fprintf(out, "  --help: Prints this help text and exits\n");
}
