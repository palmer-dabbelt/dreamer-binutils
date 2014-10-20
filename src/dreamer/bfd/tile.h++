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

#ifndef LIBDREAMER__BFD__TILE_HXX
#define LIBDREAMER__BFD__TILE_HXX

#include <memory>

namespace dreamer {
    namespace bfd {
        class tile;
        typedef std::shared_ptr<tile> tile_ptr;
    }
}

#include "tile_address.h++"
#include "instruction.h++"
#include <string>
#include <vector>

namespace dreamer {
    namespace bfd {
        class tile {
        private:
            const tile_address _addr;
            std::vector<instruction_ptr> _lo;
            std::vector<instruction_ptr> _hi;

        public:
            tile(const tile_address& addr,
                 std::vector<instruction_ptr> lo,
                 std::vector<instruction_ptr> hi);

            tile(const tile_address& addr,
                 size_t lo_instruction_count,
                 std::vector<instruction_ptr> instructions);

        public:
            const tile_address& address(void) const { return _addr; }
            const std::vector<instruction_ptr> lo(void) const { return _lo; }
            const std::vector<instruction_ptr> hi(void) const { return _hi; }

        public:
        };
    }
}

#endif
