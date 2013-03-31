////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: float18_mult_translation.v
// /___/   /\     Timestamp: Sun Sep 26 15:37:34 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog D:\xiao\test\tmp\_cg\float18_mult_translation.ngc D:\xiao\test\tmp\_cg\float18_mult_translation.v 
// Device	: 5vlx110tff1136-1
// Input file	: D:/xiao/test/tmp/_cg/float18_mult_translation.ngc
// Output file	: D:/xiao/test/tmp/_cg/float18_mult_translation.v
// # of Modules	: 1
// Design Name	: float18_mult_translation
// Xilinx        : d:\Xilinx\10.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module float18_mult_translation (
  rdy, operation_rfd, overflow, invalid_op, operation_nd, clk, underflow, a, b, result
);
  output rdy;
  output operation_rfd;
  output overflow;
  output invalid_op;
  input operation_nd;
  input clk;
  output underflow;
  input [17 : 0] a;
  input [17 : 0] b;
  output [17 : 0] result;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire NlwRenamedSignal_sig00000025;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire \blk00000003/sig00000144 ;
  wire \blk00000003/sig00000143 ;
  wire \blk00000003/sig00000142 ;
  wire \blk00000003/sig00000141 ;
  wire \blk00000003/sig00000140 ;
  wire \blk00000003/sig0000013f ;
  wire \blk00000003/sig0000013e ;
  wire \blk00000003/sig0000013d ;
  wire \blk00000003/sig0000013c ;
  wire \blk00000003/sig0000013b ;
  wire \blk00000003/sig0000013a ;
  wire \blk00000003/sig00000139 ;
  wire \blk00000003/sig00000138 ;
  wire \blk00000003/sig00000137 ;
  wire \blk00000003/sig00000136 ;
  wire \blk00000003/sig00000135 ;
  wire \blk00000003/sig00000134 ;
  wire \blk00000003/sig00000133 ;
  wire \blk00000003/sig00000132 ;
  wire \blk00000003/sig00000131 ;
  wire \blk00000003/sig00000130 ;
  wire \blk00000003/sig0000012f ;
  wire \blk00000003/sig0000012e ;
  wire \blk00000003/sig0000012d ;
  wire \blk00000003/sig0000012c ;
  wire \blk00000003/sig0000012b ;
  wire \blk00000003/sig0000012a ;
  wire \blk00000003/sig00000129 ;
  wire \blk00000003/sig00000128 ;
  wire \blk00000003/sig00000127 ;
  wire \blk00000003/sig00000126 ;
  wire \blk00000003/sig00000125 ;
  wire \blk00000003/sig00000124 ;
  wire \blk00000003/sig00000123 ;
  wire \blk00000003/sig00000122 ;
  wire \blk00000003/sig00000121 ;
  wire \blk00000003/sig00000120 ;
  wire \blk00000003/sig0000011f ;
  wire \blk00000003/sig0000011e ;
  wire \blk00000003/sig0000011d ;
  wire \blk00000003/sig0000011c ;
  wire \blk00000003/sig0000011b ;
  wire \blk00000003/sig0000011a ;
  wire \blk00000003/sig00000119 ;
  wire \blk00000003/sig00000118 ;
  wire \blk00000003/sig00000117 ;
  wire \blk00000003/sig00000116 ;
  wire \blk00000003/sig00000115 ;
  wire \blk00000003/sig00000114 ;
  wire \blk00000003/sig00000113 ;
  wire \blk00000003/sig00000112 ;
  wire \blk00000003/sig00000111 ;
  wire \blk00000003/sig00000110 ;
  wire \blk00000003/sig0000010f ;
  wire \blk00000003/sig0000010e ;
  wire \blk00000003/sig0000010d ;
  wire \blk00000003/sig0000010c ;
  wire \blk00000003/sig0000010b ;
  wire \blk00000003/sig0000010a ;
  wire \blk00000003/sig00000109 ;
  wire \blk00000003/sig00000108 ;
  wire \blk00000003/sig00000107 ;
  wire \blk00000003/sig00000106 ;
  wire \blk00000003/sig00000105 ;
  wire \blk00000003/sig00000104 ;
  wire \blk00000003/sig00000103 ;
  wire \blk00000003/sig00000102 ;
  wire \blk00000003/sig00000101 ;
  wire \blk00000003/sig00000100 ;
  wire \blk00000003/sig000000ff ;
  wire \blk00000003/sig000000fe ;
  wire \blk00000003/sig000000fd ;
  wire \blk00000003/sig000000fc ;
  wire \blk00000003/sig000000fb ;
  wire \blk00000003/sig000000fa ;
  wire \blk00000003/sig000000f9 ;
  wire \blk00000003/sig000000f8 ;
  wire \blk00000003/sig000000f7 ;
  wire \blk00000003/sig000000f6 ;
  wire \blk00000003/sig000000f5 ;
  wire \blk00000003/sig000000f4 ;
  wire \blk00000003/sig000000f3 ;
  wire \blk00000003/sig000000f2 ;
  wire \blk00000003/sig000000f1 ;
  wire \blk00000003/sig000000f0 ;
  wire \blk00000003/sig000000ef ;
  wire \blk00000003/sig000000ee ;
  wire \blk00000003/sig000000ed ;
  wire \blk00000003/sig000000ec ;
  wire \blk00000003/sig000000eb ;
  wire \blk00000003/sig000000ea ;
  wire \blk00000003/sig000000e9 ;
  wire \blk00000003/sig000000e8 ;
  wire \blk00000003/sig000000e7 ;
  wire \blk00000003/sig000000e6 ;
  wire \blk00000003/sig000000e5 ;
  wire \blk00000003/sig000000e4 ;
  wire \blk00000003/sig000000e3 ;
  wire \blk00000003/sig000000e2 ;
  wire \blk00000003/sig000000d1 ;
  wire \blk00000003/sig000000d0 ;
  wire \blk00000003/sig000000cf ;
  wire \blk00000003/sig000000ce ;
  wire \blk00000003/sig000000cd ;
  wire \blk00000003/sig000000cc ;
  wire \blk00000003/sig000000cb ;
  wire \blk00000003/sig000000ca ;
  wire \blk00000003/sig000000c9 ;
  wire \blk00000003/sig000000c8 ;
  wire \blk00000003/sig000000c7 ;
  wire \blk00000003/sig000000c6 ;
  wire \blk00000003/sig000000c5 ;
  wire \blk00000003/sig000000c4 ;
  wire \blk00000003/sig000000c3 ;
  wire \blk00000003/sig000000c2 ;
  wire \blk00000003/sig000000c1 ;
  wire \blk00000003/sig000000c0 ;
  wire \blk00000003/sig000000bf ;
  wire \blk00000003/sig000000be ;
  wire \blk00000003/sig000000bd ;
  wire \blk00000003/sig000000bc ;
  wire \blk00000003/sig000000bb ;
  wire \blk00000003/sig000000ba ;
  wire \blk00000003/sig000000b9 ;
  wire \blk00000003/sig000000b8 ;
  wire \blk00000003/sig000000b7 ;
  wire \blk00000003/sig000000b6 ;
  wire \blk00000003/sig000000b5 ;
  wire \blk00000003/sig000000b4 ;
  wire \blk00000003/sig000000b3 ;
  wire \blk00000003/sig000000b2 ;
  wire \blk00000003/sig000000b1 ;
  wire \blk00000003/sig000000b0 ;
  wire \blk00000003/sig000000af ;
  wire \blk00000003/sig000000ae ;
  wire \blk00000003/sig000000ad ;
  wire \blk00000003/sig000000ac ;
  wire \blk00000003/sig000000ab ;
  wire \blk00000003/sig000000aa ;
  wire \blk00000003/sig000000a9 ;
  wire \blk00000003/sig000000a8 ;
  wire \blk00000003/sig000000a7 ;
  wire \blk00000003/sig000000a6 ;
  wire \blk00000003/sig000000a5 ;
  wire \blk00000003/sig000000a4 ;
  wire \blk00000003/sig000000a3 ;
  wire \blk00000003/sig000000a2 ;
  wire \blk00000003/sig000000a1 ;
  wire \blk00000003/sig000000a0 ;
  wire \blk00000003/sig0000009f ;
  wire \blk00000003/sig0000009e ;
  wire \blk00000003/sig0000009d ;
  wire \blk00000003/sig0000009c ;
  wire \blk00000003/sig0000009b ;
  wire \blk00000003/sig00000094 ;
  wire \blk00000003/sig00000093 ;
  wire \blk00000003/sig00000092 ;
  wire \blk00000003/sig00000091 ;
  wire \blk00000003/sig00000090 ;
  wire \blk00000003/sig0000008f ;
  wire \blk00000003/sig0000008e ;
  wire \blk00000003/sig0000008d ;
  wire \blk00000003/sig0000008c ;
  wire \blk00000003/sig0000008b ;
  wire \blk00000003/sig0000008a ;
  wire \blk00000003/sig00000089 ;
  wire \NlwRenamedSig_OI_blk00000003/sig00000088 ;
  wire \blk00000003/sig0000007b ;
  wire \blk00000003/sig0000003f ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000006_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_P<47>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_P<46>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_P<45>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_P<44>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_P<43>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<0>_UNCONNECTED ;
  assign
    rdy = NlwRenamedSignal_sig00000025,
    operation_rfd = \NlwRenamedSig_OI_blk00000003/sig00000088 ,
    overflow = sig0000003b,
    invalid_op = sig0000003c,
    sig00000001 = a[17],
    sig00000002 = a[16],
    sig00000003 = a[15],
    sig00000004 = a[14],
    sig00000005 = a[13],
    sig00000006 = a[12],
    \blk00000003/sig00000089  = a[11],
    \blk00000003/sig0000008a  = a[10],
    \blk00000003/sig0000008b  = a[9],
    \blk00000003/sig0000008c  = a[8],
    \blk00000003/sig0000008d  = a[7],
    \blk00000003/sig0000008e  = a[6],
    \blk00000003/sig0000008f  = a[5],
    \blk00000003/sig00000090  = a[4],
    \blk00000003/sig00000091  = a[3],
    \blk00000003/sig00000092  = a[2],
    \blk00000003/sig00000093  = a[1],
    \blk00000003/sig00000094  = a[0],
    sig00000013 = b[17],
    sig00000014 = b[16],
    sig00000015 = b[15],
    sig00000016 = b[14],
    sig00000017 = b[13],
    sig00000018 = b[12],
    \blk00000003/sig0000009b  = b[11],
    \blk00000003/sig0000009c  = b[10],
    \blk00000003/sig0000009d  = b[9],
    \blk00000003/sig0000009e  = b[8],
    \blk00000003/sig0000009f  = b[7],
    \blk00000003/sig000000a0  = b[6],
    \blk00000003/sig000000a1  = b[5],
    \blk00000003/sig000000a2  = b[4],
    \blk00000003/sig000000a3  = b[3],
    \blk00000003/sig000000a4  = b[2],
    \blk00000003/sig000000a5  = b[1],
    \blk00000003/sig000000a6  = b[0],
    result[17] = sig00000028,
    result[16] = sig00000029,
    result[15] = sig0000002a,
    result[14] = sig0000002b,
    result[13] = sig0000002c,
    result[12] = sig0000002d,
    result[11] = sig0000002e,
    result[10] = sig0000002f,
    result[9] = sig00000030,
    result[8] = sig00000031,
    result[7] = sig00000032,
    result[6] = sig00000033,
    result[5] = sig00000034,
    result[4] = sig00000035,
    result[3] = sig00000036,
    result[2] = sig00000037,
    result[1] = sig00000038,
    result[0] = sig00000039,
    NlwRenamedSignal_sig00000025 = operation_nd,
    sig00000027 = clk,
    underflow = sig0000003a;
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  MUXF7   \blk00000003/blk00000082  (
    .I0(\blk00000003/sig00000144 ),
    .I1(\blk00000003/sig00000143 ),
    .S(\blk00000003/sig00000134 ),
    .O(sig0000002e)
  );
  LUT6 #(
    .INIT ( 64'h88888988CCCCCDCC ))
  \blk00000003/blk00000081  (
    .I0(\blk00000003/sig00000136 ),
    .I1(\blk00000003/sig00000135 ),
    .I2(\blk00000003/sig00000140 ),
    .I3(\blk00000003/sig00000108 ),
    .I4(\blk00000003/sig00000133 ),
    .I5(\blk00000003/sig00000123 ),
    .O(\blk00000003/sig00000144 )
  );
  LUT5 #(
    .INIT ( 32'hFABAFFFF ))
  \blk00000003/blk00000080  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000123 ),
    .I2(\blk00000003/sig00000135 ),
    .I3(\blk00000003/sig00000136 ),
    .I4(\blk00000003/sig0000011f ),
    .O(\blk00000003/sig00000143 )
  );
  MUXF7   \blk00000003/blk0000007f  (
    .I0(\blk00000003/sig00000142 ),
    .I1(\blk00000003/sig00000141 ),
    .S(\blk00000003/sig00000132 ),
    .O(\blk00000003/sig00000140 )
  );
  LUT4 #(
    .INIT ( 16'hDDD5 ))
  \blk00000003/blk0000007e  (
    .I0(\blk00000003/sig00000131 ),
    .I1(\blk00000003/sig00000138 ),
    .I2(\blk00000003/sig000000b8 ),
    .I3(\blk00000003/sig00000126 ),
    .O(\blk00000003/sig00000142 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000001 ))
  \blk00000003/blk0000007d  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig00000126 ),
    .I2(\blk00000003/sig0000012f ),
    .I3(\blk00000003/sig0000012c ),
    .I4(\blk00000003/sig00000129 ),
    .I5(\blk00000003/sig00000131 ),
    .O(\blk00000003/sig00000141 )
  );
  INV   \blk00000003/blk0000007c  (
    .I(\blk00000003/sig000000b8 ),
    .O(\blk00000003/sig00000109 )
  );
  INV   \blk00000003/blk0000007b  (
    .I(\blk00000003/sig00000132 ),
    .O(\blk00000003/sig000000f4 )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \blk00000003/blk0000007a  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000131 ),
    .O(\blk00000003/sig0000013f )
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000079  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000105 ),
    .O(sig0000002f)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000078  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000102 ),
    .O(sig00000030)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000077  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig000000ff ),
    .O(sig00000031)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000076  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig000000fc ),
    .O(sig00000032)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000075  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig000000f9 ),
    .O(sig00000033)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000074  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig0000011b ),
    .O(sig00000034)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000073  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000119 ),
    .O(sig00000035)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000072  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000116 ),
    .O(sig00000036)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000071  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000113 ),
    .O(sig00000037)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk00000070  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig00000110 ),
    .O(sig00000038)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  \blk00000003/blk0000006f  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000140 ),
    .I5(\blk00000003/sig0000010d ),
    .O(sig00000039)
  );
  LUT6 #(
    .INIT ( 64'hEAAAAAAAAAAAAAAA ))
  \blk00000003/blk0000006e  (
    .I0(\blk00000003/sig00000135 ),
    .I1(sig00000003),
    .I2(sig00000002),
    .I3(sig00000004),
    .I4(sig00000005),
    .I5(sig00000006),
    .O(\blk00000003/sig0000013a )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFF02 ))
  \blk00000003/blk0000006d  (
    .I0(\blk00000003/sig00000131 ),
    .I1(\blk00000003/sig00000133 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000134 ),
    .I4(\blk00000003/sig00000135 ),
    .O(\blk00000003/sig00000139 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000006c  (
    .I0(\blk00000003/sig00000133 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000136 ),
    .I3(\blk00000003/sig00000135 ),
    .O(\blk00000003/sig0000013d )
  );
  LUT6 #(
    .INIT ( 64'h1110111011101111 ))
  \blk00000003/blk0000006b  (
    .I0(\blk00000003/sig00000135 ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000133 ),
    .I3(\blk00000003/sig00000136 ),
    .I4(\blk00000003/sig00000132 ),
    .I5(\blk00000003/sig00000131 ),
    .O(\blk00000003/sig0000013e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk0000006a  (
    .I0(\blk00000003/sig0000012f ),
    .O(\blk00000003/sig000000f1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk00000069  (
    .I0(\blk00000003/sig0000012c ),
    .O(\blk00000003/sig000000ee )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk00000068  (
    .I0(\blk00000003/sig00000129 ),
    .O(\blk00000003/sig000000eb )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk00000067  (
    .I0(\blk00000003/sig00000126 ),
    .O(\blk00000003/sig000000e8 )
  );
  LUT6 #(
    .INIT ( 64'hA8A8A8A8A888A8A8 ))
  \blk00000003/blk00000066  (
    .I0(\blk00000003/sig0000013f ),
    .I1(\blk00000003/sig00000132 ),
    .I2(\blk00000003/sig00000138 ),
    .I3(\blk00000003/sig000000b8 ),
    .I4(\blk00000003/sig0000010a ),
    .I5(\blk00000003/sig00000126 ),
    .O(sig0000003b)
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  \blk00000003/blk00000065  (
    .I0(\blk00000003/sig000000c5 ),
    .I1(\blk00000003/sig000000c6 ),
    .I2(\blk00000003/sig0000007b ),
    .O(\blk00000003/sig000000e6 )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000003/blk00000064  (
    .I0(\blk00000003/sig0000013e ),
    .I1(\blk00000003/sig000000f5 ),
    .I2(\blk00000003/sig0000013b ),
    .O(sig00000029)
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000003/blk00000063  (
    .I0(\blk00000003/sig0000013e ),
    .I1(\blk00000003/sig000000f3 ),
    .I2(\blk00000003/sig0000013b ),
    .O(sig0000002a)
  );
  LUT5 #(
    .INIT ( 32'h327732F7 ))
  \blk00000003/blk00000062  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c5 ),
    .I2(\blk00000003/sig0000007b ),
    .I3(\blk00000003/sig000000c6 ),
    .I4(\blk00000003/sig000000c4 ),
    .O(\blk00000003/sig000000e3 )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000003/blk00000061  (
    .I0(\blk00000003/sig0000013e ),
    .I1(\blk00000003/sig000000f0 ),
    .I2(\blk00000003/sig0000013b ),
    .O(sig0000002b)
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000003/blk00000060  (
    .I0(\blk00000003/sig0000013e ),
    .I1(\blk00000003/sig000000ed ),
    .I2(\blk00000003/sig0000013b ),
    .O(sig0000002c)
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \blk00000003/blk0000005f  (
    .I0(\blk00000003/sig0000013e ),
    .I1(\blk00000003/sig000000ea ),
    .I2(\blk00000003/sig0000013b ),
    .O(sig0000002d)
  );
  LUT6 #(
    .INIT ( 64'h0000002000F000F0 ))
  \blk00000003/blk0000005e  (
    .I0(\blk00000003/sig0000010a ),
    .I1(\blk00000003/sig0000013c ),
    .I2(\blk00000003/sig0000013d ),
    .I3(\blk00000003/sig00000131 ),
    .I4(\blk00000003/sig000000b8 ),
    .I5(\blk00000003/sig00000132 ),
    .O(sig0000003a)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \blk00000003/blk0000005d  (
    .I0(\blk00000003/sig0000012f ),
    .I1(\blk00000003/sig0000012c ),
    .I2(\blk00000003/sig00000129 ),
    .I3(\blk00000003/sig00000126 ),
    .O(\blk00000003/sig0000013c )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk0000005c  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c5 ),
    .I2(\blk00000003/sig000000c4 ),
    .O(\blk00000003/sig0000010b )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk0000005b  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c4 ),
    .I2(\blk00000003/sig000000c3 ),
    .O(\blk00000003/sig0000010e )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk0000005a  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c3 ),
    .I2(\blk00000003/sig000000c2 ),
    .O(\blk00000003/sig00000111 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000059  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c2 ),
    .I2(\blk00000003/sig000000c1 ),
    .O(\blk00000003/sig00000114 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000058  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c1 ),
    .I2(\blk00000003/sig000000c0 ),
    .O(\blk00000003/sig00000117 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000057  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000c0 ),
    .I2(\blk00000003/sig000000bf ),
    .O(\blk00000003/sig0000011a )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000056  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000bf ),
    .I2(\blk00000003/sig000000be ),
    .O(\blk00000003/sig000000f7 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000055  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000be ),
    .I2(\blk00000003/sig000000bd ),
    .O(\blk00000003/sig000000fa )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000054  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000bd ),
    .I2(\blk00000003/sig000000bc ),
    .O(\blk00000003/sig000000fd )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000053  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000bc ),
    .I2(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig00000100 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000052  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000bb ),
    .I2(\blk00000003/sig000000ba ),
    .O(\blk00000003/sig00000103 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000051  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig000000ba ),
    .I2(\blk00000003/sig000000b9 ),
    .O(\blk00000003/sig00000106 )
  );
  LUT6 #(
    .INIT ( 64'hCCCFCCC0CCDFCC80 ))
  \blk00000003/blk00000050  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig00000139 ),
    .I2(\blk00000003/sig00000138 ),
    .I3(\blk00000003/sig00000132 ),
    .I4(\blk00000003/sig0000013a ),
    .I5(\blk00000003/sig00000126 ),
    .O(\blk00000003/sig0000013b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004f  (
    .I0(sig00000018),
    .I1(sig00000006),
    .O(\blk00000003/sig00000124 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004e  (
    .I0(sig00000017),
    .I1(sig00000005),
    .O(\blk00000003/sig00000127 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004d  (
    .I0(sig00000016),
    .I1(sig00000004),
    .O(\blk00000003/sig0000012a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004c  (
    .I0(sig00000015),
    .I1(sig00000003),
    .O(\blk00000003/sig0000012d )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000003/blk0000004b  (
    .I0(\blk00000003/sig0000012f ),
    .I1(\blk00000003/sig0000012c ),
    .I2(\blk00000003/sig00000129 ),
    .O(\blk00000003/sig00000138 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000003/blk0000004a  (
    .I0(\blk00000003/sig00000094 ),
    .I1(\blk00000003/sig00000093 ),
    .I2(\blk00000003/sig00000092 ),
    .I3(\blk00000003/sig00000091 ),
    .I4(\blk00000003/sig00000090 ),
    .I5(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig0000011c )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000003/blk00000049  (
    .I0(\blk00000003/sig000000a6 ),
    .I1(\blk00000003/sig000000a5 ),
    .I2(\blk00000003/sig000000a4 ),
    .I3(\blk00000003/sig000000a3 ),
    .I4(\blk00000003/sig000000a2 ),
    .I5(\blk00000003/sig000000a1 ),
    .O(\blk00000003/sig00000120 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000003/blk00000048  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008d ),
    .I2(\blk00000003/sig0000008c ),
    .I3(\blk00000003/sig0000008b ),
    .I4(\blk00000003/sig0000008a ),
    .I5(\blk00000003/sig00000089 ),
    .O(\blk00000003/sig0000011e )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000003/blk00000047  (
    .I0(\blk00000003/sig000000a0 ),
    .I1(\blk00000003/sig0000009f ),
    .I2(\blk00000003/sig0000009e ),
    .I3(\blk00000003/sig0000009d ),
    .I4(\blk00000003/sig0000009c ),
    .I5(\blk00000003/sig0000009b ),
    .O(\blk00000003/sig00000122 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000046  (
    .I0(sig00000014),
    .I1(sig00000002),
    .O(\blk00000003/sig00000130 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \blk00000003/blk00000045  (
    .I0(sig00000014),
    .I1(sig00000015),
    .I2(sig00000017),
    .I3(sig00000016),
    .I4(sig00000018),
    .O(\blk00000003/sig00000135 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \blk00000003/blk00000044  (
    .I0(sig00000003),
    .I1(sig00000002),
    .I2(sig00000004),
    .I3(sig00000005),
    .I4(sig00000006),
    .O(\blk00000003/sig00000134 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000003/blk00000043  (
    .I0(sig00000014),
    .I1(sig00000015),
    .I2(sig00000016),
    .I3(sig00000017),
    .I4(sig00000018),
    .O(\blk00000003/sig00000133 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000003/blk00000042  (
    .I0(sig00000002),
    .I1(sig00000003),
    .I2(sig00000004),
    .I3(sig00000005),
    .I4(sig00000006),
    .O(\blk00000003/sig00000136 )
  );
  LUT6 #(
    .INIT ( 64'h0000022000000FF0 ))
  \blk00000003/blk00000041  (
    .I0(\blk00000003/sig00000123 ),
    .I1(\blk00000003/sig00000136 ),
    .I2(sig00000001),
    .I3(sig00000013),
    .I4(\blk00000003/sig00000137 ),
    .I5(\blk00000003/sig00000135 ),
    .O(sig00000028)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  \blk00000003/blk00000040  (
    .I0(\blk00000003/sig0000011f ),
    .I1(\blk00000003/sig00000134 ),
    .I2(\blk00000003/sig00000133 ),
    .O(\blk00000003/sig00000137 )
  );
  LUT6 #(
    .INIT ( 64'hAF80008080800080 ))
  \blk00000003/blk0000003f  (
    .I0(\blk00000003/sig0000011f ),
    .I1(\blk00000003/sig00000133 ),
    .I2(\blk00000003/sig00000134 ),
    .I3(\blk00000003/sig00000135 ),
    .I4(\blk00000003/sig00000123 ),
    .I5(\blk00000003/sig00000136 ),
    .O(sig0000003c)
  );
  XORCY   \blk00000003/blk0000003e  (
    .CI(\blk00000003/sig0000012e ),
    .LI(\blk00000003/sig00000130 ),
    .O(\blk00000003/sig00000132 )
  );
  MUXCY   \blk00000003/blk0000003d  (
    .CI(\blk00000003/sig0000012e ),
    .DI(sig00000014),
    .S(\blk00000003/sig00000130 ),
    .O(\blk00000003/sig00000131 )
  );
  XORCY   \blk00000003/blk0000003c  (
    .CI(\blk00000003/sig0000012b ),
    .LI(\blk00000003/sig0000012d ),
    .O(\blk00000003/sig0000012f )
  );
  MUXCY   \blk00000003/blk0000003b  (
    .CI(\blk00000003/sig0000012b ),
    .DI(sig00000015),
    .S(\blk00000003/sig0000012d ),
    .O(\blk00000003/sig0000012e )
  );
  XORCY   \blk00000003/blk0000003a  (
    .CI(\blk00000003/sig00000128 ),
    .LI(\blk00000003/sig0000012a ),
    .O(\blk00000003/sig0000012c )
  );
  MUXCY   \blk00000003/blk00000039  (
    .CI(\blk00000003/sig00000128 ),
    .DI(sig00000016),
    .S(\blk00000003/sig0000012a ),
    .O(\blk00000003/sig0000012b )
  );
  XORCY   \blk00000003/blk00000038  (
    .CI(\blk00000003/sig00000125 ),
    .LI(\blk00000003/sig00000127 ),
    .O(\blk00000003/sig00000129 )
  );
  MUXCY   \blk00000003/blk00000037  (
    .CI(\blk00000003/sig00000125 ),
    .DI(sig00000017),
    .S(\blk00000003/sig00000127 ),
    .O(\blk00000003/sig00000128 )
  );
  XORCY   \blk00000003/blk00000036  (
    .CI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .LI(\blk00000003/sig00000124 ),
    .O(\blk00000003/sig00000126 )
  );
  MUXCY   \blk00000003/blk00000035  (
    .CI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .DI(sig00000018),
    .S(\blk00000003/sig00000124 ),
    .O(\blk00000003/sig00000125 )
  );
  MUXCY   \blk00000003/blk00000034  (
    .CI(\blk00000003/sig00000121 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000122 ),
    .O(\blk00000003/sig00000123 )
  );
  MUXCY   \blk00000003/blk00000033  (
    .CI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000120 ),
    .O(\blk00000003/sig00000121 )
  );
  MUXCY   \blk00000003/blk00000032  (
    .CI(\blk00000003/sig0000011d ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000011e ),
    .O(\blk00000003/sig0000011f )
  );
  MUXCY   \blk00000003/blk00000031  (
    .CI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000011c ),
    .O(\blk00000003/sig0000011d )
  );
  XORCY   \blk00000003/blk00000030  (
    .CI(\blk00000003/sig00000118 ),
    .LI(\blk00000003/sig0000011a ),
    .O(\blk00000003/sig0000011b )
  );
  MUXCY   \blk00000003/blk0000002f  (
    .CI(\blk00000003/sig00000118 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000011a ),
    .O(\blk00000003/sig000000f6 )
  );
  XORCY   \blk00000003/blk0000002e  (
    .CI(\blk00000003/sig00000115 ),
    .LI(\blk00000003/sig00000117 ),
    .O(\blk00000003/sig00000119 )
  );
  MUXCY   \blk00000003/blk0000002d  (
    .CI(\blk00000003/sig00000115 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000117 ),
    .O(\blk00000003/sig00000118 )
  );
  XORCY   \blk00000003/blk0000002c  (
    .CI(\blk00000003/sig00000112 ),
    .LI(\blk00000003/sig00000114 ),
    .O(\blk00000003/sig00000116 )
  );
  MUXCY   \blk00000003/blk0000002b  (
    .CI(\blk00000003/sig00000112 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000114 ),
    .O(\blk00000003/sig00000115 )
  );
  XORCY   \blk00000003/blk0000002a  (
    .CI(\blk00000003/sig0000010f ),
    .LI(\blk00000003/sig00000111 ),
    .O(\blk00000003/sig00000113 )
  );
  MUXCY   \blk00000003/blk00000029  (
    .CI(\blk00000003/sig0000010f ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000111 ),
    .O(\blk00000003/sig00000112 )
  );
  XORCY   \blk00000003/blk00000028  (
    .CI(\blk00000003/sig0000010c ),
    .LI(\blk00000003/sig0000010e ),
    .O(\blk00000003/sig00000110 )
  );
  MUXCY   \blk00000003/blk00000027  (
    .CI(\blk00000003/sig0000010c ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000010e ),
    .O(\blk00000003/sig0000010f )
  );
  XORCY   \blk00000003/blk00000026  (
    .CI(\blk00000003/sig000000e4 ),
    .LI(\blk00000003/sig0000010b ),
    .O(\blk00000003/sig0000010d )
  );
  MUXCY   \blk00000003/blk00000025  (
    .CI(\blk00000003/sig000000e4 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000010b ),
    .O(\blk00000003/sig0000010c )
  );
  XORCY   \blk00000003/blk00000024  (
    .CI(\blk00000003/sig00000107 ),
    .LI(\blk00000003/sig00000109 ),
    .O(\blk00000003/sig0000010a )
  );
  MUXCY   \blk00000003/blk00000023  (
    .CI(\blk00000003/sig00000107 ),
    .DI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .S(\blk00000003/sig00000109 ),
    .O(\blk00000003/sig000000e7 )
  );
  XORCY   \blk00000003/blk00000022  (
    .CI(\blk00000003/sig00000104 ),
    .LI(\blk00000003/sig00000106 ),
    .O(\blk00000003/sig00000108 )
  );
  MUXCY   \blk00000003/blk00000021  (
    .CI(\blk00000003/sig00000104 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000106 ),
    .O(\blk00000003/sig00000107 )
  );
  XORCY   \blk00000003/blk00000020  (
    .CI(\blk00000003/sig00000101 ),
    .LI(\blk00000003/sig00000103 ),
    .O(\blk00000003/sig00000105 )
  );
  MUXCY   \blk00000003/blk0000001f  (
    .CI(\blk00000003/sig00000101 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000103 ),
    .O(\blk00000003/sig00000104 )
  );
  XORCY   \blk00000003/blk0000001e  (
    .CI(\blk00000003/sig000000fe ),
    .LI(\blk00000003/sig00000100 ),
    .O(\blk00000003/sig00000102 )
  );
  MUXCY   \blk00000003/blk0000001d  (
    .CI(\blk00000003/sig000000fe ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000100 ),
    .O(\blk00000003/sig00000101 )
  );
  XORCY   \blk00000003/blk0000001c  (
    .CI(\blk00000003/sig000000fb ),
    .LI(\blk00000003/sig000000fd ),
    .O(\blk00000003/sig000000ff )
  );
  MUXCY   \blk00000003/blk0000001b  (
    .CI(\blk00000003/sig000000fb ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000fd ),
    .O(\blk00000003/sig000000fe )
  );
  XORCY   \blk00000003/blk0000001a  (
    .CI(\blk00000003/sig000000f8 ),
    .LI(\blk00000003/sig000000fa ),
    .O(\blk00000003/sig000000fc )
  );
  MUXCY   \blk00000003/blk00000019  (
    .CI(\blk00000003/sig000000f8 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000fa ),
    .O(\blk00000003/sig000000fb )
  );
  XORCY   \blk00000003/blk00000018  (
    .CI(\blk00000003/sig000000f6 ),
    .LI(\blk00000003/sig000000f7 ),
    .O(\blk00000003/sig000000f9 )
  );
  MUXCY   \blk00000003/blk00000017  (
    .CI(\blk00000003/sig000000f6 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000f7 ),
    .O(\blk00000003/sig000000f8 )
  );
  XORCY   \blk00000003/blk00000016  (
    .CI(\blk00000003/sig000000f2 ),
    .LI(\blk00000003/sig000000f4 ),
    .O(\blk00000003/sig000000f5 )
  );
  XORCY   \blk00000003/blk00000015  (
    .CI(\blk00000003/sig000000ef ),
    .LI(\blk00000003/sig000000f1 ),
    .O(\blk00000003/sig000000f3 )
  );
  MUXCY   \blk00000003/blk00000014  (
    .CI(\blk00000003/sig000000ef ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000f1 ),
    .O(\blk00000003/sig000000f2 )
  );
  XORCY   \blk00000003/blk00000013  (
    .CI(\blk00000003/sig000000ec ),
    .LI(\blk00000003/sig000000ee ),
    .O(\blk00000003/sig000000f0 )
  );
  MUXCY   \blk00000003/blk00000012  (
    .CI(\blk00000003/sig000000ec ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000ee ),
    .O(\blk00000003/sig000000ef )
  );
  XORCY   \blk00000003/blk00000011  (
    .CI(\blk00000003/sig000000e9 ),
    .LI(\blk00000003/sig000000eb ),
    .O(\blk00000003/sig000000ed )
  );
  MUXCY   \blk00000003/blk00000010  (
    .CI(\blk00000003/sig000000e9 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000eb ),
    .O(\blk00000003/sig000000ec )
  );
  XORCY   \blk00000003/blk0000000f  (
    .CI(\blk00000003/sig000000e7 ),
    .LI(\blk00000003/sig000000e8 ),
    .O(\blk00000003/sig000000ea )
  );
  MUXCY   \blk00000003/blk0000000e  (
    .CI(\blk00000003/sig000000e7 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000e8 ),
    .O(\blk00000003/sig000000e9 )
  );
  MUXCY   \blk00000003/blk0000000d  (
    .CI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig000000e6 ),
    .O(\blk00000003/sig000000e5 )
  );
  MUXCY   \blk00000003/blk0000000c  (
    .CI(\blk00000003/sig000000e5 ),
    .DI(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig0000003f ),
    .O(\blk00000003/sig000000e2 )
  );
  MUXCY   \blk00000003/blk0000000b  (
    .CI(\blk00000003/sig000000e2 ),
    .DI(\NlwRenamedSig_OI_blk00000003/sig00000088 ),
    .S(\blk00000003/sig000000e3 ),
    .O(\blk00000003/sig000000e4 )
  );
  DSP48E #(
    .ACASCREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .MREG ( 0 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ),
    .MASK ( 48'hFFFFFFFFF800 ))
  \blk00000003/blk00000006  (
    .CARRYIN(\blk00000003/sig0000003f ),
    .CEA1(\blk00000003/sig0000003f ),
    .CEA2(\blk00000003/sig0000003f ),
    .CEB1(\blk00000003/sig0000003f ),
    .CEB2(\blk00000003/sig0000003f ),
    .CEC(\blk00000003/sig0000003f ),
    .CECTRL(\blk00000003/sig0000003f ),
    .CEP(\blk00000003/sig0000003f ),
    .CEM(\blk00000003/sig0000003f ),
    .CECARRYIN(\blk00000003/sig0000003f ),
    .CEMULTCARRYIN(\blk00000003/sig0000003f ),
    .CLK(sig00000027),
    .RSTA(\blk00000003/sig0000003f ),
    .RSTB(\blk00000003/sig0000003f ),
    .RSTC(\blk00000003/sig0000003f ),
    .RSTCTRL(\blk00000003/sig0000003f ),
    .RSTP(\blk00000003/sig0000003f ),
    .RSTM(\blk00000003/sig0000003f ),
    .RSTALLCARRYIN(\blk00000003/sig0000003f ),
    .CEALUMODE(\blk00000003/sig0000003f ),
    .RSTALUMODE(\blk00000003/sig0000003f ),
    .PATTERNBDETECT(\NLW_blk00000003/blk00000006_PATTERNBDETECT_UNCONNECTED ),
    .PATTERNDETECT(\blk00000003/sig0000007b ),
    .OVERFLOW(\NLW_blk00000003/blk00000006_OVERFLOW_UNCONNECTED ),
    .UNDERFLOW(\NLW_blk00000003/blk00000006_UNDERFLOW_UNCONNECTED ),
    .CARRYCASCIN(\blk00000003/sig0000003f ),
    .CARRYCASCOUT(\NLW_blk00000003/blk00000006_CARRYCASCOUT_UNCONNECTED ),
    .MULTSIGNIN(\blk00000003/sig0000003f ),
    .MULTSIGNOUT(\NLW_blk00000003/blk00000006_MULTSIGNOUT_UNCONNECTED ),
    .A({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \NlwRenamedSig_OI_blk00000003/sig00000088 , \blk00000003/sig00000089 , \blk00000003/sig0000008a 
, \blk00000003/sig0000008b , \blk00000003/sig0000008c , \blk00000003/sig0000008d , \blk00000003/sig0000008e , \blk00000003/sig0000008f , 
\blk00000003/sig00000090 , \blk00000003/sig00000091 , \blk00000003/sig00000092 , \blk00000003/sig00000093 , \blk00000003/sig00000094 }),
    .PCIN({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .B({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\NlwRenamedSig_OI_blk00000003/sig00000088 , \blk00000003/sig0000009b , \blk00000003/sig0000009c , \blk00000003/sig0000009d , \blk00000003/sig0000009e 
, \blk00000003/sig0000009f , \blk00000003/sig000000a0 , \blk00000003/sig000000a1 , \blk00000003/sig000000a2 , \blk00000003/sig000000a3 , 
\blk00000003/sig000000a4 , \blk00000003/sig000000a5 , \blk00000003/sig000000a6 }),
    .C({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .CARRYINSEL({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .OPMODE({\blk00000003/sig0000003f , \NlwRenamedSig_OI_blk00000003/sig00000088 , \NlwRenamedSig_OI_blk00000003/sig00000088 , 
\blk00000003/sig0000003f , \NlwRenamedSig_OI_blk00000003/sig00000088 , \blk00000003/sig0000003f , \NlwRenamedSig_OI_blk00000003/sig00000088 }),
    .BCIN({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .ALUMODE({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .PCOUT({\NLW_blk00000003/blk00000006_PCOUT<47>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<46>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<45>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<44>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<43>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<41>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<40>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<39>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<38>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<37>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<35>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<34>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<33>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<32>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<31>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<29>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<28>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<27>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<26>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<25>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<23>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<22>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<21>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<20>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<19>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<17>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<16>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<15>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<14>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<13>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<11>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<10>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<9>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<8>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<7>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<5>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<4>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_PCOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_PCOUT<0>_UNCONNECTED }),
    .P({\NLW_blk00000003/blk00000006_P<47>_UNCONNECTED , \NLW_blk00000003/blk00000006_P<46>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_P<45>_UNCONNECTED , \NLW_blk00000003/blk00000006_P<44>_UNCONNECTED , \NLW_blk00000003/blk00000006_P<43>_UNCONNECTED , 
\blk00000003/sig000000a7 , \blk00000003/sig000000a8 , \blk00000003/sig000000a9 , \blk00000003/sig000000aa , \blk00000003/sig000000ab , 
\blk00000003/sig000000ac , \blk00000003/sig000000ad , \blk00000003/sig000000ae , \blk00000003/sig000000af , \blk00000003/sig000000b0 , 
\blk00000003/sig000000b1 , \blk00000003/sig000000b2 , \blk00000003/sig000000b3 , \blk00000003/sig000000b4 , \blk00000003/sig000000b5 , 
\blk00000003/sig000000b6 , \blk00000003/sig000000b7 , \blk00000003/sig000000b8 , \blk00000003/sig000000b9 , \blk00000003/sig000000ba , 
\blk00000003/sig000000bb , \blk00000003/sig000000bc , \blk00000003/sig000000bd , \blk00000003/sig000000be , \blk00000003/sig000000bf , 
\blk00000003/sig000000c0 , \blk00000003/sig000000c1 , \blk00000003/sig000000c2 , \blk00000003/sig000000c3 , \blk00000003/sig000000c4 , 
\blk00000003/sig000000c5 , \blk00000003/sig000000c6 , \blk00000003/sig000000c7 , \blk00000003/sig000000c8 , \blk00000003/sig000000c9 , 
\blk00000003/sig000000ca , \blk00000003/sig000000cb , \blk00000003/sig000000cc , \blk00000003/sig000000cd , \blk00000003/sig000000ce , 
\blk00000003/sig000000cf , \blk00000003/sig000000d0 , \blk00000003/sig000000d1 }),
    .BCOUT({\NLW_blk00000003/blk00000006_BCOUT<17>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<15>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<13>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<11>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<9>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<7>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<5>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<0>_UNCONNECTED }),
    .ACIN({\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , 
\blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f , \blk00000003/sig0000003f }),
    .ACOUT({\NLW_blk00000003/blk00000006_ACOUT<29>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<27>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<25>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<23>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<21>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<19>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<17>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<15>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<13>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<11>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<9>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<7>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<5>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({\NLW_blk00000003/blk00000006_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_CARRYOUT<0>_UNCONNECTED })
  );
  VCC   \blk00000003/blk00000005  (
    .P(\NlwRenamedSig_OI_blk00000003/sig00000088 )
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig0000003f )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

// synthesis translate_on
