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

#ifndef LIBDREAMER__BFD__OBJECT__HXX
#define LIBDREAMER__BFD__OBJECT__HXX

#include <memory>

namespace dreamer { 
    namespace bfd {
        class object;
        typedef std::shared_ptr<object> object_ptr;
    }
}

#include "tile.h++"
#include <string>
#include <vector>

namespace dreamer {
    namespace bfd {
        /* Represents the contents of a single object file, along with
         * mechanisms to serialize and deserialize these files */
        class object {
        private:
            std::vector<tile_ptr> _tiles;

        public:
            /* Creates a new in-memory object representation, given
             * every tile in the system that has code. */
            object(const std::vector<tile_ptr>& tiles);

        public:
            const std::vector<tile_ptr>& tiles(void) const { return _tiles; }

        public:
            /* Creates a new object by reading a HEX file that
             * represents a single program. */
            static object_ptr read_hex_file(const std::string& filename);
            static object_ptr read_hex_file(FILE *file);
        };
    }
}

#endif
