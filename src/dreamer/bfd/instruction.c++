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
      _has_debug(false),
      _debug("")
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
    std::stringstream ss;

    auto netoutname = [&](void)
        {
            auto W = _bits.inst.out & 0x1 ? "W" : "";
            auto N = _bits.inst.out & 0x2 ? "N" : "";
            auto E = _bits.inst.out & 0x4 ? "E" : "";
            auto S = _bits.inst.out & 0x8 ? "S" : "";
            std::stringstream ss;
            ss << W << N << E << S;
            return ss.str();
        };

    auto netinname = [&](void)
        {
            switch (_bits.inst.in) {
            case 0: return "W";
            case 1: return "N";
            case 2: return "E";
            case 3: return "S";
            }
            abort();
        };

    auto netdest = [&](void) -> std::string
        {
            if (_bits.inst.di == 31)
                return netoutname();

            std::stringstream ss;
            ss << "x" << _bits.inst.di;
            return ss.str();
        };

    auto netsrc = [&](int reg) -> std::string
        {
            if (reg == 31)
                return netinname();

            std::stringstream ss;
            ss << "x" << reg;
            return ss.str();
        };

    auto netd = [&](void) { return netsrc(_bits.inst.di); };
    auto netx = [&](void) { return netsrc(_bits.inst.xi); };
    auto nety = [&](void) { 
        if (_bits.inst.iy == 0)
            return netsrc(_bits.inst.yi);
        else
            return std::to_string(_bits.inst.yi);
    };
    auto netz = [&](void) { return netsrc(_bits.inst.zi); };

    auto widthapos = [&](int width) -> std::string
        {
            if (width == 0)
                return "";

            std::stringstream ss;
            ss << "'" << width;
            return ss.str();
        };

    auto zw = [&](void) { return widthapos(_bits.inst.zi); };

    auto y_is_const_zero = [&](void)
        { return _bits.inst.iy == 1 && _bits.inst.yi == 0; };

    switch (_bits.inst.op) {
    case 0:
        ss << "nop";
        break;

    case 2:
        ss << netdest() << " = lit " << _bits.lit.lit;
        break;

    case 10:
        ss << netdest() << " = eq " << netx() << " " << nety();
        break;

    case 12:
        ss << netdest() << " = mux " << netx() << " " << nety() << " " << netz();
        break;

    case 14:
        ss << netdest() << " = rsh" << zw() << " " << netx() << " " << nety();
        break;

    case 17:
        ss << netdest() << " = cat" << zw() << " " << netx() << " " << nety();
        break;

    case 18:
        if (y_is_const_zero() == true)
            ss << netdest() << " = " << netx();
        else
            ss << netdest() << " = add " << netx() << " " << nety();
        break;

    case 19:
        ss << netdest() << " = sub " << netx() << " " << nety();
        break;

    case 22:
        ss << netdest() << " = mul" << zw() << " " << netx() << " " << nety();
        break;

    case 24:
        ss << netdest() << " = ld " << netx() << " " << nety();
        break;

    case 25:
        ss << "st " << netd() << " " << nety() << " " << netz();
        break;

    case 26:
        ss << netdest() << " = ldi " << _bits.inst.xi;
        break;

    case 27:
        ss << "sti " << netx() << " " << _bits.inst.yi;
        break;

    default:
        fprintf(stderr, "Unknown opcode: '%d'\n", _bits.inst.op);
        abort();
        break;
    }

    if ((_bits.inst.di != 31) && (_bits.inst.out != 0))
        ss << " ; " << netoutname() << " <- " << netinname();
    else
        ss << " ";

    return ss.str();
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
