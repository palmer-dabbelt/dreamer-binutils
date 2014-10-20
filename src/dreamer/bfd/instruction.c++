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

#include "instruction.h++"
#include <algorithm> 
#include <cctype>
#include <cstring>
#include <functional> 
#include <locale>
#include <sstream>
using namespace dreamer::bfd;

// http://stackoverflow.com/questions/216823/whats-the-best-way-to-trim-stdstring
static inline std::string rtrim(const std::string &s_in) {
    std::string s = s_in;
    s.erase(std::find_if(s.rbegin(), s.rend(), std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
    return s;
}

instruction::instruction(union inst bits)
    : _bits(bits),
      _has_debug(false)
{
}

instruction::instruction(union inst bits, const std::string debug)
    : _bits(bits),
      _has_debug(true),
      _debug(debug)
{
}

bool instruction::sanity_check(void) const
{
    return true;
}

std::string instruction::to_string(void) const
{
    auto to_hex_string = [&]() -> std::string
        {
            std::stringstream ss;
            ss << std::hex << _bits.bits;
            std::string out;
            ss >> out;
            return std::string("0x") + out;
        };

    if (this->has_debug() == true)
        return to_hex_string() + " " + this->debug();
    else
        return to_hex_string();
}

instruction_ptr instruction::parse_hex(const std::string hex)
{
    union inst bits;
    {
        std::stringstream ss;
        ss << std::hex << hex;
        ss >> bits.bits;
    }

    if (strstr(hex.c_str(), " ") == NULL) {
        auto out = std::make_shared<instruction>(bits);
        if (out->sanity_check() == false)
            return NULL;
        return out;
    } else {
        std::string debug = rtrim(strstr(hex.c_str(), " ") + 1);
        auto out = std::make_shared<instruction>(bits, debug);
        if (out->sanity_check() == false)
            return NULL;
        return out;
    }
}
