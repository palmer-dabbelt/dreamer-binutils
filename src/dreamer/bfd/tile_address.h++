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

#ifndef LIBDREAMER__BFD__TILE_ADDRESS_HXX
#define LIBDREAMER__BFD__TILE_ADDRESS_HXX

#include <memory>

namespace dreamer {
    namespace bfd {
        class tile_address;
        typedef std::shared_ptr<tile_address> tile_address_ptr;
    }
}

#include <string>

namespace dreamer {
    namespace bfd {
        class tile_address {
        private:
            size_t _x;
            size_t _y;

        public:
            tile_address(size_t x, size_t y);

        public:
            std::string mangled_name(void) const;
        };
    }
}

#endif
