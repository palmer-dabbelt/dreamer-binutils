#include "tmpdir.bash"

FORMAT="--jrb"

cat >>input.hex <<"EOF"
VERSION 5
INS = 4
Histogram::io_data_in_3/32 @ (1, 3)[0]
Histogram::io_data_in_2/32 @ (1, 2)[0]
Histogram::io_data_in_1/32 @ (1, 1)[0]
Histogram::io_data_in_0/32 @ (1, 0)[0]
OUTS = 4
Histogram::io_count_out_3/32 @ (4, 3)[0]
Histogram::io_count_out_2/32 @ (4, 2)[0]
Histogram::io_count_out_1/32 @ (4, 1)[0]
Histogram::io_count_out_0/32 @ (4, 0)[0]
REGS = 0
MEMS = 16
Histogram:Row_3:Tile_3::bins @ (4, 3)[992 : 1023]
Histogram:Row_3:Tile_2::bins @ (3, 3)[992 : 1023]
Histogram:Row_3:Tile_1::bins @ (2, 3)[992 : 1023]
Histogram:Row_3:Tile_0::bins @ (1, 3)[992 : 1023]
Histogram:Row_2:Tile_3::bins @ (4, 2)[992 : 1023]
Histogram:Row_2:Tile_2::bins @ (3, 2)[992 : 1023]
Histogram:Row_2:Tile_1::bins @ (2, 2)[992 : 1023]
Histogram:Row_2:Tile_0::bins @ (1, 2)[992 : 1023]
Histogram:Row_1:Tile_3::bins @ (4, 1)[992 : 1023]
Histogram:Row_1:Tile_2::bins @ (3, 1)[992 : 1023]
Histogram:Row_1:Tile_1::bins @ (2, 1)[992 : 1023]
Histogram:Row_1:Tile_0::bins @ (1, 1)[992 : 1023]
Histogram:Row_0:Tile_3::bins @ (4, 0)[992 : 1023]
Histogram:Row_0:Tile_2::bins @ (3, 0)[992 : 1023]
Histogram:Row_0:Tile_1::bins @ (2, 0)[992 : 1023]
Histogram:Row_0:Tile_0::bins @ (1, 0)[992 : 1023]
INITS = 0
DIMS (4, 4)
TILE @ (1, 0) NUM_LO_INSTS = 28
0x1000f800 Histogram:Row_0:Tile_0::bins
0x10408000 Histogram:Row_0:Tile_0::bin__lit_hi__1
0x10800000 Histogram:Row_0:Tile_0::bin__lit_lo__1
0x88421400 Histogram:Row_0:Tile_0::bin__lit_cat__1
0xd0800000
0x90c50000 Histogram:Row_0::io_data_in
0x90c70000 Histogram:Row_0:Tile_0::io_data_in
0xb0460800 Histogram:Row_0:Tile_0::bin
0x90c70000 Histogram:Row_0:Tile_0::io_data_out
0x97c70004
0x90ff0010
0xb1021800 Histogram:Row_0:Tile_0::tile
0x51090000 T141
0xb1421800 T135
0x91bf0010
0x918d0000 Histogram:Row_0:Tile_0::io_count_in
0xb0ca1980 T136
0x70c70000 T137
0x98421800 Histogram:Row_0:Tile_0::local_bin
0x70c30140 T142
0x90c60000 T143_add
0x70430140 T138
0x90020000 T139_add
0xc0010800 T139
0x60480180 T156
0x90430000 Histogram:Row_0:Tile_0::io_count_out
0x97c30004
0x90010800 T140
0xc8001900 T143
TILE @ (2, 0) NUM_LO_INSTS = 27
0x1000f800 Histogram:Row_0:Tile_1::bins
0x907f0000
0x90430000 Histogram:Row_0:Tile_1::io_data_in
0x90830000 Histogram:Row_0:Tile_1::io_data_out
0x97c50004
0x10808000 Histogram:Row_0:Tile_1::bin__lit_hi__1
0x10c00000 Histogram:Row_0:Tile_1::bin__lit_lo__1
0x88841c00 Histogram:Row_0:Tile_1::bin__lit_cat__1
0xb0421000 Histogram:Row_0:Tile_1::bin
0x90bf0010
0xb0c21000 Histogram:Row_0:Tile_1::tile
0x50c70800 T132
0xb1021000 T126
0xb0881180 T127
0x70850000 T128
0x98421000 Histogram:Row_0:Tile_1::local_bin
0x90bf0000
0x90850000 Histogram:Row_0:Tile_1::io_count_in
0x71030140 T133
0x91080000 T134_add
0x70430140 T129
0x90020000 T130_add
0xc0010800 T130
0x60460080 T157
0x90430000 Histogram:Row_0:Tile_1::io_count_out
0x97c30004
0x90010800 T131
0xc80020c0 T134
TILE @ (3, 0) NUM_LO_INSTS = 27
0x1000f800 Histogram:Row_0:Tile_2::bins
0x10408000 Histogram:Row_0:Tile_2::bin__lit_hi__1
0x90bf0000
0x90850000 Histogram:Row_0:Tile_2::io_data_in
0x90c50000 Histogram:Row_0:Tile_2::io_data_out
0x97c70004
0x10c00000 Histogram:Row_0:Tile_2::bin__lit_lo__1
0x88421c00 Histogram:Row_0:Tile_2::bin__lit_cat__1
0xb0440800 Histogram:Row_0:Tile_2::bin
0x90bf0010
0xb0c21000 Histogram:Row_0:Tile_2::tile
0x50c71000 T123
0xb1021000 T117
0xb0881180 T118
0x70850000 T119
0x98421000 Histogram:Row_0:Tile_2::local_bin
0x70830140 T124
0x90840000 T125_add
0x70430140 T120
0x913f0000
0x91090000 Histogram:Row_0:Tile_2::io_count_in
0x90020000 T121_add
0xc0010800 T121
0x60460100 T158
0x90430000 Histogram:Row_0:Tile_2::io_count_out
0x97c30004
0x90010800 T122
0xc80010c0 T125
TILE @ (4, 0) NUM_LO_INSTS = 26
0x1000f800 Histogram:Row_0:Tile_3::bins
0x10408000 Histogram:Row_0:Tile_3::bin__lit_hi__1
0x10800000 Histogram:Row_0:Tile_3::bin__lit_lo__1
0x90ff0000
0x90c70000 Histogram:Row_0:Tile_3::io_data_in
0x88421400 Histogram:Row_0:Tile_3::bin__lit_cat__1
0x90bf0010
0xb0460800 Histogram:Row_0:Tile_3::bin
0xb0c21000 Histogram:Row_0:Tile_3::tile
0x50c71800 T114
0xb1021000 T108
0xb0881180 T109
0x913f0000
0x91090000 Histogram:Row_0:Tile_3::io_count_in
0x70850000 T110
0x98421000 Histogram:Row_0:Tile_3::local_bin
0x70830140 T115
0x90840000 T116_add
0x70430140 T111
0x90020000 T112_add
0xc0010800 T112
0x60460100 T159
0x90430000 Histogram:Row_0:Tile_3::io_count_out
0x90430000 Histogram:Row_0::io_count_out
0xd8020000 Histogram::io_count_out_0
0x90010800 T113
0xc80010c0 T116
TILE @ (1, 1) NUM_LO_INSTS = 30
0x1000f800 Histogram:Row_1:Tile_0::bins
0x10408000 Histogram:Row_1:Tile_0::bin__lit_hi__1
0x10800000 Histogram:Row_1:Tile_0::bin__lit_lo__1
0x88421400 Histogram:Row_1:Tile_0::bin__lit_cat__1
0xd0800000
0x90c50000 Histogram:Row_1::io_data_in
0x90c70000 Histogram:Row_1:Tile_0::io_data_in
0xb0460800 Histogram:Row_1:Tile_0::bin
0x90c70000 Histogram:Row_1:Tile_0::io_data_out
0x97c70004
0x90ff0010
0x97c70008
0xb1021800 Histogram:Row_1:Tile_0::tile
0x51090000 T105
0x917f0010
0x97cb0008
0x914b0000 Histogram:Row_1:Tile_0::io_count_in
0xb1821800 T99
0xb0cc1980 T100
0x70c70000 T101
0x98421800 Histogram:Row_1:Tile_0::local_bin
0x70c30140 T106
0x90c60000 T107_add
0x70430140 T102
0x90020000 T103_add
0xc0010800 T103
0x60480140 T152
0x90430000 Histogram:Row_1:Tile_0::io_count_out
0x97c30004
0x90010800 T104
0xc8001900 T107
TILE @ (2, 1) NUM_LO_INSTS = 28
0x1000f800 Histogram:Row_1:Tile_1::bins
0x907f0000
0x90430000 Histogram:Row_1:Tile_1::io_data_in
0x90830000 Histogram:Row_1:Tile_1::io_data_out
0x97c50004
0x10808000 Histogram:Row_1:Tile_1::bin__lit_hi__1
0x10c00000 Histogram:Row_1:Tile_1::bin__lit_lo__1
0x88841c00 Histogram:Row_1:Tile_1::bin__lit_cat__1
0xb0421000 Histogram:Row_1:Tile_1::bin
0x90bf0010
0x97c50008
0xb0c21000 Histogram:Row_1:Tile_1::tile
0x50c70800 T96
0xb1021000 T90
0xb0881180 T91
0x70850000 T92
0x98421000 Histogram:Row_1:Tile_1::local_bin
0x70830140 T97
0x90840000 T98_add
0x913f0000
0x91090000 Histogram:Row_1:Tile_1::io_count_in
0x70430140 T93
0x90020000 T94_add
0xc0010800 T94
0x60460100 T153
0x90430000 Histogram:Row_1:Tile_1::io_count_out
0x97c30004
0x90010800 T95
0xc80010c0 T98
TILE @ (3, 1) NUM_LO_INSTS = 28
0x1000f800 Histogram:Row_1:Tile_2::bins
0x10408000 Histogram:Row_1:Tile_2::bin__lit_hi__1
0x90bf0000
0x90850000 Histogram:Row_1:Tile_2::io_data_in
0x90c50000 Histogram:Row_1:Tile_2::io_data_out
0x97c70004
0x10c00000 Histogram:Row_1:Tile_2::bin__lit_lo__1
0x88421c00 Histogram:Row_1:Tile_2::bin__lit_cat__1
0x90ff0010
0x97c70008
0xb0440800 Histogram:Row_1:Tile_2::bin
0xb0821800 Histogram:Row_1:Tile_2::tile
0x50851000 T87
0xb1021800 T81
0xb0c81980 T82
0x70c70000 T83
0x98421800 Histogram:Row_1:Tile_2::local_bin
0x70c30140 T88
0x913f0000
0x91090000 Histogram:Row_1:Tile_2::io_count_in
0x90c60000 T89_add
0x70430140 T84
0x90020000 T85_add
0xc0010800 T85
0x60440100 T154
0x90430000 Histogram:Row_1:Tile_2::io_count_out
0x97c30004
0x90010800 T86
0xc8001880 T89
TILE @ (4, 1) NUM_LO_INSTS = 27
0x1000f800 Histogram:Row_1:Tile_3::bins
0x10408000 Histogram:Row_1:Tile_3::bin__lit_hi__1
0x10800000 Histogram:Row_1:Tile_3::bin__lit_lo__1
0x90ff0000
0x913f0010
0x97c90008
0x90c70000 Histogram:Row_1:Tile_3::io_data_in
0x88421400 Histogram:Row_1:Tile_3::bin__lit_cat__1
0xb0460800 Histogram:Row_1:Tile_3::bin
0xb0822000 Histogram:Row_1:Tile_3::tile
0x50851800 T78
0xb0c22000 T72
0x917f0000
0x914b0000 Histogram:Row_1:Tile_3::io_count_in
0xb0c62180 T73
0x70c70000 T74
0x98421800 Histogram:Row_1:Tile_3::local_bin
0x70c30140 T79
0x90c60000 T80_add
0x70430140 T75
0x90020000 T76_add
0xc0010800 T76
0x60440140 T155
0x90430000 Histogram:Row_1:Tile_3::io_count_out
0x90430000 Histogram:Row_1::io_count_out
0xd8020000 Histogram::io_count_out_1
0x90010800 T77
0xc8001880 T80
TILE @ (1, 2) NUM_LO_INSTS = 30
0x1000f800 Histogram:Row_2:Tile_0::bins
0x10408000 Histogram:Row_2:Tile_0::bin__lit_hi__1
0x10800000 Histogram:Row_2:Tile_0::bin__lit_lo__1
0x88421400 Histogram:Row_2:Tile_0::bin__lit_cat__1
0xd0800000
0x90c50000 Histogram:Row_2::io_data_in
0x90c70000 Histogram:Row_2:Tile_0::io_data_in
0xb0460800 Histogram:Row_2:Tile_0::bin
0x90c70000 Histogram:Row_2:Tile_0::io_data_out
0x97c70004
0x90ff0010
0x97c70008
0xb1021800 Histogram:Row_2:Tile_0::tile
0x51090000 T69
0x917f0010
0x97cb0008
0x914b0000 Histogram:Row_2:Tile_0::io_count_in
0xb1821800 T63
0xb0cc1980 T64
0x70c70000 T65
0x98421800 Histogram:Row_2:Tile_0::local_bin
0x70c30140 T70
0x90c60000 T71_add
0x70430140 T66
0x90020000 T67_add
0xc0010800 T67
0x60480140 T148
0x90430000 Histogram:Row_2:Tile_0::io_count_out
0x97c30004
0x90010800 T68
0xc8001900 T71
TILE @ (2, 2) NUM_LO_INSTS = 28
0x1000f800 Histogram:Row_2:Tile_1::bins
0x907f0000
0x90430000 Histogram:Row_2:Tile_1::io_data_in
0x90830000 Histogram:Row_2:Tile_1::io_data_out
0x97c50004
0x10808000 Histogram:Row_2:Tile_1::bin__lit_hi__1
0x10c00000 Histogram:Row_2:Tile_1::bin__lit_lo__1
0x88841c00 Histogram:Row_2:Tile_1::bin__lit_cat__1
0xb0421000 Histogram:Row_2:Tile_1::bin
0x90bf0010
0x97c50008
0xb0c21000 Histogram:Row_2:Tile_1::tile
0x50c70800 T60
0xb1021000 T54
0xb0881180 T55
0x70850000 T56
0x98421000 Histogram:Row_2:Tile_1::local_bin
0x70830140 T61
0x90840000 T62_add
0x70430140 T57
0x913f0000
0x91090000 Histogram:Row_2:Tile_1::io_count_in
0x90020000 T58_add
0xc0010800 T58
0x60460100 T149
0x90430000 Histogram:Row_2:Tile_1::io_count_out
0x97c30004
0x90010800 T59
0xc80010c0 T62
TILE @ (3, 2) NUM_LO_INSTS = 28
0x1000f800 Histogram:Row_2:Tile_2::bins
0x10408000 Histogram:Row_2:Tile_2::bin__lit_hi__1
0x90bf0000
0x90850000 Histogram:Row_2:Tile_2::io_data_in
0x90c50000 Histogram:Row_2:Tile_2::io_data_out
0x97c70004
0x90ff0010
0x97c70008
0x11000000 Histogram:Row_2:Tile_2::bin__lit_lo__1
0x88422400 Histogram:Row_2:Tile_2::bin__lit_cat__1
0xb0440800 Histogram:Row_2:Tile_2::bin
0xb0821800 Histogram:Row_2:Tile_2::tile
0x50851000 T51
0xb1021800 T45
0xb0c81980 T46
0x70c70000 T47
0x913f0000
0x91090000 Histogram:Row_2:Tile_2::io_count_in
0x98421800 Histogram:Row_2:Tile_2::local_bin
0x70c30140 T52
0x90c60000 T53_add
0x70430140 T48
0x90020000 T49_add
0xc0010800 T49
0x60440100 T150
0x90430000 Histogram:Row_2:Tile_2::io_count_out
0x97c30004
0x90010800 T50
0xc8001880 T53
TILE @ (4, 2) NUM_LO_INSTS = 27
0x1000f800 Histogram:Row_2:Tile_3::bins
0x10408000 Histogram:Row_2:Tile_3::bin__lit_hi__1
0x90bf0010
0x97c50008
0x90ff0000
0x90c70000 Histogram:Row_2:Tile_3::io_data_in
0x11000000 Histogram:Row_2:Tile_3::bin__lit_lo__1
0x88422400 Histogram:Row_2:Tile_3::bin__lit_cat__1
0xb0460800 Histogram:Row_2:Tile_3::bin
0xb0c21000 Histogram:Row_2:Tile_3::tile
0x50c71800 T42
0xb1021000 T36
0x917f0000
0x914b0000 Histogram:Row_2:Tile_3::io_count_in
0xb0881180 T37
0x70850000 T38
0x98421000 Histogram:Row_2:Tile_3::local_bin
0x70830140 T43
0x90840000 T44_add
0x70430140 T39
0x90020000 T40_add
0xc0010800 T40
0x60460140 T151
0x90430000 Histogram:Row_2:Tile_3::io_count_out
0x90430000 Histogram:Row_2::io_count_out
0xd8020000 Histogram::io_count_out_2
0x90010800 T41
0xc80010c0 T44
TILE @ (1, 3) NUM_LO_INSTS = 30
0x1000f800 Histogram:Row_3:Tile_0::bins
0x10408000 Histogram:Row_3:Tile_0::bin__lit_hi__1
0x10800000 Histogram:Row_3:Tile_0::bin__lit_lo__1
0x88421400 Histogram:Row_3:Tile_0::bin__lit_cat__1
0xd0800000
0x90c50000 Histogram:Row_3::io_data_in
0x90c70000 Histogram:Row_3:Tile_0::io_data_in
0xb0460800 Histogram:Row_3:Tile_0::bin
0x90c70000 Histogram:Row_3:Tile_0::io_data_out
0x97c70004
0x90ff0020
0x97c70008
0xb1021800 Histogram:Row_3:Tile_0::tile
0x51090000 T33
0x917f0020
0x97cb0008
0x914b0000 Histogram:Row_3:Tile_0::io_count_in
0xb1821800 T27
0xb0cc1980 T28
0x70c70000 T29
0x98421800 Histogram:Row_3:Tile_0::local_bin
0x70c30140 T34
0x90c60000 T35_add
0x70430140 T30
0x90020000 T31_add
0xc0010800 T31
0x60480140 T144
0x90430000 Histogram:Row_3:Tile_0::io_count_out
0x97c30004
0x90010800 T32
0xc8001900 T35
TILE @ (2, 3) NUM_LO_INSTS = 29
0x1000f800 Histogram:Row_3:Tile_1::bins
0x907f0000
0x90430000 Histogram:Row_3:Tile_1::io_data_in
0x90830000 Histogram:Row_3:Tile_1::io_data_out
0x97c50004
0x10808000 Histogram:Row_3:Tile_1::bin__lit_hi__1
0x10c00000 Histogram:Row_3:Tile_1::bin__lit_lo__1
0x88841c00 Histogram:Row_3:Tile_1::bin__lit_cat__1
0xb0421000 Histogram:Row_3:Tile_1::bin
0x90bf0020
0x97c50001
0x97c50008
0xb0c21000 Histogram:Row_3:Tile_1::tile
0x50c70800 T24
0xb1021021 T18
0xb0881180 T19
0x70850000 T20
0x98421000 Histogram:Row_3:Tile_1::local_bin
0x70830140 T25
0x90840000 T26_add
0x70430140 T21
0x913f0000
0x91090000 Histogram:Row_3:Tile_1::io_count_in
0x90020000 T22_add
0xc0010800 T22
0x60460100 T145
0x90430000 Histogram:Row_3:Tile_1::io_count_out
0x97c30004
0x90010800 T23
0xc80010c0 T26
TILE @ (3, 3) NUM_LO_INSTS = 30
0x1000f800 Histogram:Row_3:Tile_2::bins
0x10408000 Histogram:Row_3:Tile_2::bin__lit_hi__1
0x90bf0000
0x90ff0020
0x97c70001
0x97c70008
0x90850000 Histogram:Row_3:Tile_2::io_data_in
0x91050000 Histogram:Row_3:Tile_2::io_data_out
0x97c90004
0x00000021
0x11000000 Histogram:Row_3:Tile_2::bin__lit_lo__1
0x88422400 Histogram:Row_3:Tile_2::bin__lit_cat__1
0xb0440800 Histogram:Row_3:Tile_2::bin
0xb0821800 Histogram:Row_3:Tile_2::tile
0x50851000 T15
0xb1021800 T9
0x917f0000
0x914b0000 Histogram:Row_3:Tile_2::io_count_in
0xb0c81980 T10
0x70c70000 T11
0x98421800 Histogram:Row_3:Tile_2::local_bin
0x70c30140 T16
0x90c60000 T17_add
0x70430140 T12
0x90020000 T13_add
0xc0010800 T13
0x60440140 T146
0x90430000 Histogram:Row_3:Tile_2::io_count_out
0x97c30004
0x90010800 T14
0xc8001880 T17
TILE @ (4, 3) NUM_LO_INSTS = 29
0x1000f800 Histogram:Row_3:Tile_3::bins
0x10400800 T0__lit__1
0x97c30001
0x97c30008
0x10808000 Histogram:Row_3:Tile_3::bin__lit_hi__1
0x10c00000 Histogram:Row_3:Tile_3::bin__lit_lo__1
0x88841c00 Histogram:Row_3:Tile_3::bin__lit_cat__1
0x97c50001
0x90ff0000
0x90c70000 Histogram:Row_3:Tile_3::io_data_in
0xb0c61000 Histogram:Row_3:Tile_3::bin
0xb1060800 Histogram:Row_3:Tile_3::tile
0x51091800 T6
0xb1460800 T0
0x91bf0000
0x918d0000 Histogram:Row_3:Tile_3::io_count_in
0xb14a0980 T1
0x714b0000 T2
0x98c62800 Histogram:Row_3:Tile_3::local_bin
0x71470140 T7
0x914a0000 T8_add
0x70c70140 T3
0x90060000 T4_add
0xc0010800 T4
0x60c80180 T147
0x90c70000 Histogram:Row_3:Tile_3::io_count_out
0x90c70000 Histogram:Row_3::io_count_out
0xd8060000 Histogram::io_count_out_3
0x90010800 T5
0xc8002900 T8
EOF

cat >>output.gold <<"EOF"
TILE @ (1,0)
000: x0 = lit 992  // Histogram:Row_0:Tile_0::bins
001: x1 = lit 512  // Histogram:Row_0:Tile_0::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_0:Tile_0::bin__lit_lo__1
003: x1 = cat'16 x1 x2  // Histogram:Row_0:Tile_0::bin__lit_cat__1
004: x2 = ldi 0 
005: x3 = x2  // Histogram:Row_0::io_data_in
006: x3 = x3  // Histogram:Row_0:Tile_0::io_data_in
007: x1 = mul x3 x1  // Histogram:Row_0:Tile_0::bin
008: x3 = x3  // Histogram:Row_0:Tile_0::io_data_out
009: E = x3 
010: x3 = N 
011: x4 = mul x1 x3  // Histogram:Row_0:Tile_0::tile
012: x4 = eq x4 0  // T141
013: x5 = mul x1 x3  // T135
014: x6 = N 
015: x6 = x6  // Histogram:Row_0:Tile_0::io_count_in
016: x3 = mul'6 x5 x3  // T136
017: x3 = rsh x3 0  // T137
018: x1 = sub x1 x3  // Histogram:Row_0:Tile_0::local_bin
019: x3 = rsh'5 x1 0  // T142
020: x3 = add x3 x0  // T143_add
021: x1 = rsh'5 x1 0  // T138
022: x0 = add x1 x0  // T139_add
023: x0 = ld x0 1  // T139
024: x1 = mux x4 x0 x6  // T156
025: x1 = x1  // Histogram:Row_0:Tile_0::io_count_out
026: E = x1 
027: x0 = add x0 1  // T140
028: st x0 x3 x4  // T143
TILE @ (2,0)
000: x0 = lit 992  // Histogram:Row_0:Tile_1::bins
001: x1 = W 
002: x1 = x1  // Histogram:Row_0:Tile_1::io_data_in
003: x2 = x1  // Histogram:Row_0:Tile_1::io_data_out
004: E = x2 
005: x2 = lit 512  // Histogram:Row_0:Tile_1::bin__lit_hi__1
006: x3 = lit 0  // Histogram:Row_0:Tile_1::bin__lit_lo__1
007: x2 = cat'16 x2 x3  // Histogram:Row_0:Tile_1::bin__lit_cat__1
008: x1 = mul x1 x2  // Histogram:Row_0:Tile_1::bin
009: x2 = N 
010: x3 = mul x1 x2  // Histogram:Row_0:Tile_1::tile
011: x3 = eq x3 1  // T132
012: x4 = mul x1 x2  // T126
013: x2 = mul'6 x4 x2  // T127
014: x2 = rsh x2 0  // T128
015: x1 = sub x1 x2  // Histogram:Row_0:Tile_1::local_bin
016: x2 = W 
017: x2 = x2  // Histogram:Row_0:Tile_1::io_count_in
018: x4 = rsh'5 x1 0  // T133
019: x4 = add x4 x0  // T134_add
020: x1 = rsh'5 x1 0  // T129
021: x0 = add x1 x0  // T130_add
022: x0 = ld x0 1  // T130
023: x1 = mux x3 x0 x2  // T157
024: x1 = x1  // Histogram:Row_0:Tile_1::io_count_out
025: E = x1 
026: x0 = add x0 1  // T131
027: st x0 x4 x3  // T134
TILE @ (3,0)
000: x0 = lit 992  // Histogram:Row_0:Tile_2::bins
001: x1 = lit 512  // Histogram:Row_0:Tile_2::bin__lit_hi__1
002: x2 = W 
003: x2 = x2  // Histogram:Row_0:Tile_2::io_data_in
004: x3 = x2  // Histogram:Row_0:Tile_2::io_data_out
005: E = x3 
006: x3 = lit 0  // Histogram:Row_0:Tile_2::bin__lit_lo__1
007: x1 = cat'16 x1 x3  // Histogram:Row_0:Tile_2::bin__lit_cat__1
008: x1 = mul x2 x1  // Histogram:Row_0:Tile_2::bin
009: x2 = N 
010: x3 = mul x1 x2  // Histogram:Row_0:Tile_2::tile
011: x3 = eq x3 2  // T123
012: x4 = mul x1 x2  // T117
013: x2 = mul'6 x4 x2  // T118
014: x2 = rsh x2 0  // T119
015: x1 = sub x1 x2  // Histogram:Row_0:Tile_2::local_bin
016: x2 = rsh'5 x1 0  // T124
017: x2 = add x2 x0  // T125_add
018: x1 = rsh'5 x1 0  // T120
019: x4 = W 
020: x4 = x4  // Histogram:Row_0:Tile_2::io_count_in
021: x0 = add x1 x0  // T121_add
022: x0 = ld x0 1  // T121
023: x1 = mux x3 x0 x4  // T158
024: x1 = x1  // Histogram:Row_0:Tile_2::io_count_out
025: E = x1 
026: x0 = add x0 1  // T122
027: st x0 x2 x3  // T125
TILE @ (4,0)
000: x0 = lit 992  // Histogram:Row_0:Tile_3::bins
001: x1 = lit 512  // Histogram:Row_0:Tile_3::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_0:Tile_3::bin__lit_lo__1
003: x3 = W 
004: x3 = x3  // Histogram:Row_0:Tile_3::io_data_in
005: x1 = cat'16 x1 x2  // Histogram:Row_0:Tile_3::bin__lit_cat__1
006: x2 = N 
007: x1 = mul x3 x1  // Histogram:Row_0:Tile_3::bin
008: x3 = mul x1 x2  // Histogram:Row_0:Tile_3::tile
009: x3 = eq x3 3  // T114
010: x4 = mul x1 x2  // T108
011: x2 = mul'6 x4 x2  // T109
012: x4 = W 
013: x4 = x4  // Histogram:Row_0:Tile_3::io_count_in
014: x2 = rsh x2 0  // T110
015: x1 = sub x1 x2  // Histogram:Row_0:Tile_3::local_bin
016: x2 = rsh'5 x1 0  // T115
017: x2 = add x2 x0  // T116_add
018: x1 = rsh'5 x1 0  // T111
019: x0 = add x1 x0  // T112_add
020: x0 = ld x0 1  // T112
021: x1 = mux x3 x0 x4  // T159
022: x1 = x1  // Histogram:Row_0:Tile_3::io_count_out
023: x1 = x1  // Histogram:Row_0::io_count_out
024: sti x1 0  // Histogram::io_count_out_0
025: x0 = add x0 1  // T113
026: st x0 x2 x3  // T116
TILE @ (1,1)
000: x0 = lit 992  // Histogram:Row_1:Tile_0::bins
001: x1 = lit 512  // Histogram:Row_1:Tile_0::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_1:Tile_0::bin__lit_lo__1
003: x1 = cat'16 x1 x2  // Histogram:Row_1:Tile_0::bin__lit_cat__1
004: x2 = ldi 0 
005: x3 = x2  // Histogram:Row_1::io_data_in
006: x3 = x3  // Histogram:Row_1:Tile_0::io_data_in
007: x1 = mul x3 x1  // Histogram:Row_1:Tile_0::bin
008: x3 = x3  // Histogram:Row_1:Tile_0::io_data_out
009: E = x3 
010: x3 = N 
011: S = x3 
012: x4 = mul x1 x3  // Histogram:Row_1:Tile_0::tile
013: x4 = eq x4 0  // T105
014: x5 = N 
015: S = x5 
016: x5 = x5  // Histogram:Row_1:Tile_0::io_count_in
017: x6 = mul x1 x3  // T99
018: x3 = mul'6 x6 x3  // T100
019: x3 = rsh x3 0  // T101
020: x1 = sub x1 x3  // Histogram:Row_1:Tile_0::local_bin
021: x3 = rsh'5 x1 0  // T106
022: x3 = add x3 x0  // T107_add
023: x1 = rsh'5 x1 0  // T102
024: x0 = add x1 x0  // T103_add
025: x0 = ld x0 1  // T103
026: x1 = mux x4 x0 x5  // T152
027: x1 = x1  // Histogram:Row_1:Tile_0::io_count_out
028: E = x1 
029: x0 = add x0 1  // T104
030: st x0 x3 x4  // T107
TILE @ (2,1)
000: x0 = lit 992  // Histogram:Row_1:Tile_1::bins
001: x1 = W 
002: x1 = x1  // Histogram:Row_1:Tile_1::io_data_in
003: x2 = x1  // Histogram:Row_1:Tile_1::io_data_out
004: E = x2 
005: x2 = lit 512  // Histogram:Row_1:Tile_1::bin__lit_hi__1
006: x3 = lit 0  // Histogram:Row_1:Tile_1::bin__lit_lo__1
007: x2 = cat'16 x2 x3  // Histogram:Row_1:Tile_1::bin__lit_cat__1
008: x1 = mul x1 x2  // Histogram:Row_1:Tile_1::bin
009: x2 = N 
010: S = x2 
011: x3 = mul x1 x2  // Histogram:Row_1:Tile_1::tile
012: x3 = eq x3 1  // T96
013: x4 = mul x1 x2  // T90
014: x2 = mul'6 x4 x2  // T91
015: x2 = rsh x2 0  // T92
016: x1 = sub x1 x2  // Histogram:Row_1:Tile_1::local_bin
017: x2 = rsh'5 x1 0  // T97
018: x2 = add x2 x0  // T98_add
019: x4 = W 
020: x4 = x4  // Histogram:Row_1:Tile_1::io_count_in
021: x1 = rsh'5 x1 0  // T93
022: x0 = add x1 x0  // T94_add
023: x0 = ld x0 1  // T94
024: x1 = mux x3 x0 x4  // T153
025: x1 = x1  // Histogram:Row_1:Tile_1::io_count_out
026: E = x1 
027: x0 = add x0 1  // T95
028: st x0 x2 x3  // T98
TILE @ (3,1)
000: x0 = lit 992  // Histogram:Row_1:Tile_2::bins
001: x1 = lit 512  // Histogram:Row_1:Tile_2::bin__lit_hi__1
002: x2 = W 
003: x2 = x2  // Histogram:Row_1:Tile_2::io_data_in
004: x3 = x2  // Histogram:Row_1:Tile_2::io_data_out
005: E = x3 
006: x3 = lit 0  // Histogram:Row_1:Tile_2::bin__lit_lo__1
007: x1 = cat'16 x1 x3  // Histogram:Row_1:Tile_2::bin__lit_cat__1
008: x3 = N 
009: S = x3 
010: x1 = mul x2 x1  // Histogram:Row_1:Tile_2::bin
011: x2 = mul x1 x3  // Histogram:Row_1:Tile_2::tile
012: x2 = eq x2 2  // T87
013: x4 = mul x1 x3  // T81
014: x3 = mul'6 x4 x3  // T82
015: x3 = rsh x3 0  // T83
016: x1 = sub x1 x3  // Histogram:Row_1:Tile_2::local_bin
017: x3 = rsh'5 x1 0  // T88
018: x4 = W 
019: x4 = x4  // Histogram:Row_1:Tile_2::io_count_in
020: x3 = add x3 x0  // T89_add
021: x1 = rsh'5 x1 0  // T84
022: x0 = add x1 x0  // T85_add
023: x0 = ld x0 1  // T85
024: x1 = mux x2 x0 x4  // T154
025: x1 = x1  // Histogram:Row_1:Tile_2::io_count_out
026: E = x1 
027: x0 = add x0 1  // T86
028: st x0 x3 x2  // T89
TILE @ (4,1)
000: x0 = lit 992  // Histogram:Row_1:Tile_3::bins
001: x1 = lit 512  // Histogram:Row_1:Tile_3::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_1:Tile_3::bin__lit_lo__1
003: x3 = W 
004: x4 = N 
005: S = x4 
006: x3 = x3  // Histogram:Row_1:Tile_3::io_data_in
007: x1 = cat'16 x1 x2  // Histogram:Row_1:Tile_3::bin__lit_cat__1
008: x1 = mul x3 x1  // Histogram:Row_1:Tile_3::bin
009: x2 = mul x1 x4  // Histogram:Row_1:Tile_3::tile
010: x2 = eq x2 3  // T78
011: x3 = mul x1 x4  // T72
012: x5 = W 
013: x5 = x5  // Histogram:Row_1:Tile_3::io_count_in
014: x3 = mul'6 x3 x4  // T73
015: x3 = rsh x3 0  // T74
016: x1 = sub x1 x3  // Histogram:Row_1:Tile_3::local_bin
017: x3 = rsh'5 x1 0  // T79
018: x3 = add x3 x0  // T80_add
019: x1 = rsh'5 x1 0  // T75
020: x0 = add x1 x0  // T76_add
021: x0 = ld x0 1  // T76
022: x1 = mux x2 x0 x5  // T155
023: x1 = x1  // Histogram:Row_1:Tile_3::io_count_out
024: x1 = x1  // Histogram:Row_1::io_count_out
025: sti x1 0  // Histogram::io_count_out_1
026: x0 = add x0 1  // T77
027: st x0 x3 x2  // T80
TILE @ (1,2)
000: x0 = lit 992  // Histogram:Row_2:Tile_0::bins
001: x1 = lit 512  // Histogram:Row_2:Tile_0::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_2:Tile_0::bin__lit_lo__1
003: x1 = cat'16 x1 x2  // Histogram:Row_2:Tile_0::bin__lit_cat__1
004: x2 = ldi 0 
005: x3 = x2  // Histogram:Row_2::io_data_in
006: x3 = x3  // Histogram:Row_2:Tile_0::io_data_in
007: x1 = mul x3 x1  // Histogram:Row_2:Tile_0::bin
008: x3 = x3  // Histogram:Row_2:Tile_0::io_data_out
009: E = x3 
010: x3 = N 
011: S = x3 
012: x4 = mul x1 x3  // Histogram:Row_2:Tile_0::tile
013: x4 = eq x4 0  // T69
014: x5 = N 
015: S = x5 
016: x5 = x5  // Histogram:Row_2:Tile_0::io_count_in
017: x6 = mul x1 x3  // T63
018: x3 = mul'6 x6 x3  // T64
019: x3 = rsh x3 0  // T65
020: x1 = sub x1 x3  // Histogram:Row_2:Tile_0::local_bin
021: x3 = rsh'5 x1 0  // T70
022: x3 = add x3 x0  // T71_add
023: x1 = rsh'5 x1 0  // T66
024: x0 = add x1 x0  // T67_add
025: x0 = ld x0 1  // T67
026: x1 = mux x4 x0 x5  // T148
027: x1 = x1  // Histogram:Row_2:Tile_0::io_count_out
028: E = x1 
029: x0 = add x0 1  // T68
030: st x0 x3 x4  // T71
TILE @ (2,2)
000: x0 = lit 992  // Histogram:Row_2:Tile_1::bins
001: x1 = W 
002: x1 = x1  // Histogram:Row_2:Tile_1::io_data_in
003: x2 = x1  // Histogram:Row_2:Tile_1::io_data_out
004: E = x2 
005: x2 = lit 512  // Histogram:Row_2:Tile_1::bin__lit_hi__1
006: x3 = lit 0  // Histogram:Row_2:Tile_1::bin__lit_lo__1
007: x2 = cat'16 x2 x3  // Histogram:Row_2:Tile_1::bin__lit_cat__1
008: x1 = mul x1 x2  // Histogram:Row_2:Tile_1::bin
009: x2 = N 
010: S = x2 
011: x3 = mul x1 x2  // Histogram:Row_2:Tile_1::tile
012: x3 = eq x3 1  // T60
013: x4 = mul x1 x2  // T54
014: x2 = mul'6 x4 x2  // T55
015: x2 = rsh x2 0  // T56
016: x1 = sub x1 x2  // Histogram:Row_2:Tile_1::local_bin
017: x2 = rsh'5 x1 0  // T61
018: x2 = add x2 x0  // T62_add
019: x1 = rsh'5 x1 0  // T57
020: x4 = W 
021: x4 = x4  // Histogram:Row_2:Tile_1::io_count_in
022: x0 = add x1 x0  // T58_add
023: x0 = ld x0 1  // T58
024: x1 = mux x3 x0 x4  // T149
025: x1 = x1  // Histogram:Row_2:Tile_1::io_count_out
026: E = x1 
027: x0 = add x0 1  // T59
028: st x0 x2 x3  // T62
TILE @ (3,2)
000: x0 = lit 992  // Histogram:Row_2:Tile_2::bins
001: x1 = lit 512  // Histogram:Row_2:Tile_2::bin__lit_hi__1
002: x2 = W 
003: x2 = x2  // Histogram:Row_2:Tile_2::io_data_in
004: x3 = x2  // Histogram:Row_2:Tile_2::io_data_out
005: E = x3 
006: x3 = N 
007: S = x3 
008: x4 = lit 0  // Histogram:Row_2:Tile_2::bin__lit_lo__1
009: x1 = cat'16 x1 x4  // Histogram:Row_2:Tile_2::bin__lit_cat__1
010: x1 = mul x2 x1  // Histogram:Row_2:Tile_2::bin
011: x2 = mul x1 x3  // Histogram:Row_2:Tile_2::tile
012: x2 = eq x2 2  // T51
013: x4 = mul x1 x3  // T45
014: x3 = mul'6 x4 x3  // T46
015: x3 = rsh x3 0  // T47
016: x4 = W 
017: x4 = x4  // Histogram:Row_2:Tile_2::io_count_in
018: x1 = sub x1 x3  // Histogram:Row_2:Tile_2::local_bin
019: x3 = rsh'5 x1 0  // T52
020: x3 = add x3 x0  // T53_add
021: x1 = rsh'5 x1 0  // T48
022: x0 = add x1 x0  // T49_add
023: x0 = ld x0 1  // T49
024: x1 = mux x2 x0 x4  // T150
025: x1 = x1  // Histogram:Row_2:Tile_2::io_count_out
026: E = x1 
027: x0 = add x0 1  // T50
028: st x0 x3 x2  // T53
TILE @ (4,2)
000: x0 = lit 992  // Histogram:Row_2:Tile_3::bins
001: x1 = lit 512  // Histogram:Row_2:Tile_3::bin__lit_hi__1
002: x2 = N 
003: S = x2 
004: x3 = W 
005: x3 = x3  // Histogram:Row_2:Tile_3::io_data_in
006: x4 = lit 0  // Histogram:Row_2:Tile_3::bin__lit_lo__1
007: x1 = cat'16 x1 x4  // Histogram:Row_2:Tile_3::bin__lit_cat__1
008: x1 = mul x3 x1  // Histogram:Row_2:Tile_3::bin
009: x3 = mul x1 x2  // Histogram:Row_2:Tile_3::tile
010: x3 = eq x3 3  // T42
011: x4 = mul x1 x2  // T36
012: x5 = W 
013: x5 = x5  // Histogram:Row_2:Tile_3::io_count_in
014: x2 = mul'6 x4 x2  // T37
015: x2 = rsh x2 0  // T38
016: x1 = sub x1 x2  // Histogram:Row_2:Tile_3::local_bin
017: x2 = rsh'5 x1 0  // T43
018: x2 = add x2 x0  // T44_add
019: x1 = rsh'5 x1 0  // T39
020: x0 = add x1 x0  // T40_add
021: x0 = ld x0 1  // T40
022: x1 = mux x3 x0 x5  // T151
023: x1 = x1  // Histogram:Row_2:Tile_3::io_count_out
024: x1 = x1  // Histogram:Row_2::io_count_out
025: sti x1 0  // Histogram::io_count_out_2
026: x0 = add x0 1  // T41
027: st x0 x2 x3  // T44
TILE @ (1,3)
000: x0 = lit 992  // Histogram:Row_3:Tile_0::bins
001: x1 = lit 512  // Histogram:Row_3:Tile_0::bin__lit_hi__1
002: x2 = lit 0  // Histogram:Row_3:Tile_0::bin__lit_lo__1
003: x1 = cat'16 x1 x2  // Histogram:Row_3:Tile_0::bin__lit_cat__1
004: x2 = ldi 0 
005: x3 = x2  // Histogram:Row_3::io_data_in
006: x3 = x3  // Histogram:Row_3:Tile_0::io_data_in
007: x1 = mul x3 x1  // Histogram:Row_3:Tile_0::bin
008: x3 = x3  // Histogram:Row_3:Tile_0::io_data_out
009: E = x3 
010: x3 = E 
011: S = x3 
012: x4 = mul x1 x3  // Histogram:Row_3:Tile_0::tile
013: x4 = eq x4 0  // T33
014: x5 = E 
015: S = x5 
016: x5 = x5  // Histogram:Row_3:Tile_0::io_count_in
017: x6 = mul x1 x3  // T27
018: x3 = mul'6 x6 x3  // T28
019: x3 = rsh x3 0  // T29
020: x1 = sub x1 x3  // Histogram:Row_3:Tile_0::local_bin
021: x3 = rsh'5 x1 0  // T34
022: x3 = add x3 x0  // T35_add
023: x1 = rsh'5 x1 0  // T30
024: x0 = add x1 x0  // T31_add
025: x0 = ld x0 1  // T31
026: x1 = mux x4 x0 x5  // T144
027: x1 = x1  // Histogram:Row_3:Tile_0::io_count_out
028: E = x1 
029: x0 = add x0 1  // T32
030: st x0 x3 x4  // T35
TILE @ (2,3)
000: x0 = lit 992  // Histogram:Row_3:Tile_1::bins
001: x1 = W 
002: x1 = x1  // Histogram:Row_3:Tile_1::io_data_in
003: x2 = x1  // Histogram:Row_3:Tile_1::io_data_out
004: E = x2 
005: x2 = lit 512  // Histogram:Row_3:Tile_1::bin__lit_hi__1
006: x3 = lit 0  // Histogram:Row_3:Tile_1::bin__lit_lo__1
007: x2 = cat'16 x2 x3  // Histogram:Row_3:Tile_1::bin__lit_cat__1
008: x1 = mul x1 x2  // Histogram:Row_3:Tile_1::bin
009: x2 = E 
010: W = x2 
011: S = x2 
012: x3 = mul x1 x2  // Histogram:Row_3:Tile_1::tile
013: x3 = eq x3 1  // T24
014: x4 = mul x1 x2 ; W <- E // T18
015: x2 = mul'6 x4 x2  // T19
016: x2 = rsh x2 0  // T20
017: x1 = sub x1 x2  // Histogram:Row_3:Tile_1::local_bin
018: x2 = rsh'5 x1 0  // T25
019: x2 = add x2 x0  // T26_add
020: x1 = rsh'5 x1 0  // T21
021: x4 = W 
022: x4 = x4  // Histogram:Row_3:Tile_1::io_count_in
023: x0 = add x1 x0  // T22_add
024: x0 = ld x0 1  // T22
025: x1 = mux x3 x0 x4  // T145
026: x1 = x1  // Histogram:Row_3:Tile_1::io_count_out
027: E = x1 
028: x0 = add x0 1  // T23
029: st x0 x2 x3  // T26
TILE @ (3,3)
000: x0 = lit 992  // Histogram:Row_3:Tile_2::bins
001: x1 = lit 512  // Histogram:Row_3:Tile_2::bin__lit_hi__1
002: x2 = W 
003: x3 = E 
004: W = x3 
005: S = x3 
006: x2 = x2  // Histogram:Row_3:Tile_2::io_data_in
007: x4 = x2  // Histogram:Row_3:Tile_2::io_data_out
008: E = x4 
009: nop ; W <- E
010: x4 = lit 0  // Histogram:Row_3:Tile_2::bin__lit_lo__1
011: x1 = cat'16 x1 x4  // Histogram:Row_3:Tile_2::bin__lit_cat__1
012: x1 = mul x2 x1  // Histogram:Row_3:Tile_2::bin
013: x2 = mul x1 x3  // Histogram:Row_3:Tile_2::tile
014: x2 = eq x2 2  // T15
015: x4 = mul x1 x3  // T9
016: x5 = W 
017: x5 = x5  // Histogram:Row_3:Tile_2::io_count_in
018: x3 = mul'6 x4 x3  // T10
019: x3 = rsh x3 0  // T11
020: x1 = sub x1 x3  // Histogram:Row_3:Tile_2::local_bin
021: x3 = rsh'5 x1 0  // T16
022: x3 = add x3 x0  // T17_add
023: x1 = rsh'5 x1 0  // T12
024: x0 = add x1 x0  // T13_add
025: x0 = ld x0 1  // T13
026: x1 = mux x2 x0 x5  // T146
027: x1 = x1  // Histogram:Row_3:Tile_2::io_count_out
028: E = x1 
029: x0 = add x0 1  // T14
030: st x0 x3 x2  // T17
TILE @ (4,3)
000: x0 = lit 992  // Histogram:Row_3:Tile_3::bins
001: x1 = lit 32  // T0__lit__1
002: W = x1 
003: S = x1 
004: x2 = lit 512  // Histogram:Row_3:Tile_3::bin__lit_hi__1
005: x3 = lit 0  // Histogram:Row_3:Tile_3::bin__lit_lo__1
006: x2 = cat'16 x2 x3  // Histogram:Row_3:Tile_3::bin__lit_cat__1
007: W = x2 
008: x3 = W 
009: x3 = x3  // Histogram:Row_3:Tile_3::io_data_in
010: x3 = mul x3 x2  // Histogram:Row_3:Tile_3::bin
011: x4 = mul x3 x1  // Histogram:Row_3:Tile_3::tile
012: x4 = eq x4 3  // T6
013: x5 = mul x3 x1  // T0
014: x6 = W 
015: x6 = x6  // Histogram:Row_3:Tile_3::io_count_in
016: x5 = mul'6 x5 x1  // T1
017: x5 = rsh x5 0  // T2
018: x3 = sub x3 x5  // Histogram:Row_3:Tile_3::local_bin
019: x5 = rsh'5 x3 0  // T7
020: x5 = add x5 x0  // T8_add
021: x3 = rsh'5 x3 0  // T3
022: x0 = add x3 x0  // T4_add
023: x0 = ld x0 1  // T4
024: x3 = mux x4 x0 x6  // T147
025: x3 = x3  // Histogram:Row_3:Tile_3::io_count_out
026: x3 = x3  // Histogram:Row_3::io_count_out
027: sti x3 0  // Histogram::io_count_out_3
028: x0 = add x0 1  // T5
029: st x0 x5 x4  // T8
EOF

#include "harness.bash"
