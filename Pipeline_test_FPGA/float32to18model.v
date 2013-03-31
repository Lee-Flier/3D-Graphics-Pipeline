////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: float32to18model.v
// /___/   /\     Timestamp: Tue Jun 21 22:44:10 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog D:\gpu_test_v3_1122_20110621\gpu_test_v3_1122_20110428\tmp\_cg\float32to18model.ngc D:\gpu_test_v3_1122_20110621\gpu_test_v3_1122_20110428\tmp\_cg\float32to18model.v 
// Device	: 5vlx110tff1136-1
// Input file	: D:/gpu_test_v3_1122_20110621/gpu_test_v3_1122_20110428/tmp/_cg/float32to18model.ngc
// Output file	: D:/gpu_test_v3_1122_20110621/gpu_test_v3_1122_20110428/tmp/_cg/float32to18model.v
// # of Modules	: 1
// Design Name	: float32to18model
// Xilinx        : C:\Xilinx\10.1\ISE
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

module float32to18model (
  sclr, rdy, overflow, operation_nd, clk, underflow, a, result
);
  input sclr;
  output rdy;
  output overflow;
  input operation_nd;
  input clk;
  output underflow;
  input [31 : 0] a;
  output [17 : 0] result;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
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
  wire \blk00000003/sig000000e1 ;
  wire \blk00000003/sig000000e0 ;
  wire \blk00000003/sig000000df ;
  wire \blk00000003/sig000000de ;
  wire \blk00000003/sig000000dd ;
  wire \blk00000003/sig000000dc ;
  wire \blk00000003/sig000000db ;
  wire \blk00000003/sig000000da ;
  wire \blk00000003/sig000000d9 ;
  wire \blk00000003/sig000000d8 ;
  wire \blk00000003/sig000000d7 ;
  wire \blk00000003/sig000000d6 ;
  wire \blk00000003/sig000000d5 ;
  wire \blk00000003/sig000000d4 ;
  wire \blk00000003/sig000000d3 ;
  wire \blk00000003/sig000000d2 ;
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
  wire \blk00000003/sig0000009a ;
  wire \blk00000003/sig00000099 ;
  wire \blk00000003/sig00000098 ;
  wire \blk00000003/sig00000097 ;
  wire \blk00000003/sig00000096 ;
  wire \blk00000003/sig00000095 ;
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
  wire \blk00000003/sig00000088 ;
  wire \blk00000003/sig00000087 ;
  wire \blk00000003/sig00000086 ;
  wire \blk00000003/sig00000085 ;
  wire \blk00000003/sig00000084 ;
  wire \blk00000003/sig00000083 ;
  wire \blk00000003/sig00000082 ;
  wire \blk00000003/sig00000081 ;
  wire \blk00000003/sig00000080 ;
  wire \blk00000003/sig0000007f ;
  wire \blk00000003/sig0000007e ;
  wire \blk00000003/sig0000007d ;
  wire \blk00000003/sig0000007c ;
  wire \blk00000003/sig0000007b ;
  wire \blk00000003/sig0000007a ;
  wire \blk00000003/sig00000079 ;
  wire \blk00000003/sig00000078 ;
  wire \blk00000003/sig00000077 ;
  wire \blk00000003/sig00000076 ;
  wire \blk00000003/sig00000075 ;
  wire \blk00000003/sig00000074 ;
  wire \blk00000003/sig00000073 ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk000000be_Q15_UNCONNECTED ;
  wire \NLW_blk00000003/blk000000bc_Q15_UNCONNECTED ;
  wire \NLW_blk00000003/blk000000ba_Q15_UNCONNECTED ;
  wire \NLW_blk00000003/blk000000b8_Q15_UNCONNECTED ;
  wire \NLW_blk00000003/blk000000b6_Q15_UNCONNECTED ;
  assign
    sig00000023 = sclr,
    rdy = sig00000038,
    overflow = sig00000037,
    sig00000001 = a[31],
    sig00000002 = a[30],
    sig00000003 = a[29],
    sig00000004 = a[28],
    sig00000005 = a[27],
    sig00000006 = a[26],
    sig00000007 = a[25],
    sig00000008 = a[24],
    sig00000009 = a[23],
    sig0000000a = a[22],
    sig0000000b = a[21],
    sig0000000c = a[20],
    sig0000000d = a[19],
    sig0000000e = a[18],
    sig0000000f = a[17],
    sig00000010 = a[16],
    sig00000011 = a[15],
    sig00000012 = a[14],
    sig00000013 = a[13],
    sig00000014 = a[12],
    sig00000015 = a[11],
    sig00000016 = a[10],
    sig00000017 = a[9],
    sig00000018 = a[8],
    sig00000019 = a[7],
    sig0000001a = a[6],
    sig0000001b = a[5],
    sig0000001c = a[4],
    sig0000001d = a[3],
    sig0000001e = a[2],
    sig0000001f = a[1],
    sig00000020 = a[0],
    result[17] = sig00000024,
    result[16] = sig00000025,
    result[15] = sig00000026,
    result[14] = sig00000027,
    result[13] = sig00000028,
    result[12] = sig00000029,
    result[11] = sig0000002a,
    result[10] = sig0000002b,
    result[9] = sig0000002c,
    result[8] = sig0000002d,
    result[7] = sig0000002e,
    result[6] = sig0000002f,
    result[5] = sig00000030,
    result[4] = sig00000031,
    result[3] = sig00000032,
    result[2] = sig00000033,
    result[1] = sig00000034,
    result[0] = sig00000035,
    sig00000021 = operation_nd,
    sig00000022 = clk,
    underflow = sig00000036;
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000bf  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000117 ),
    .Q(\blk00000003/sig000000de )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk000000be  (
    .A0(\blk00000003/sig0000003a ),
    .A1(\blk00000003/sig0000003a ),
    .A2(\blk00000003/sig0000003a ),
    .A3(\blk00000003/sig0000003a ),
    .CE(\blk00000003/sig0000003b ),
    .CLK(sig00000022),
    .D(sig00000002),
    .Q(\blk00000003/sig00000117 ),
    .Q15(\NLW_blk00000003/blk000000be_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000bd  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000116 ),
    .Q(\blk00000003/sig00000112 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk000000bc  (
    .A0(\blk00000003/sig0000003a ),
    .A1(\blk00000003/sig0000003a ),
    .A2(\blk00000003/sig0000003a ),
    .A3(\blk00000003/sig0000003a ),
    .CE(\blk00000003/sig0000003b ),
    .CLK(sig00000022),
    .D(sig00000006),
    .Q(\blk00000003/sig00000116 ),
    .Q15(\NLW_blk00000003/blk000000bc_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000bb  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000115 ),
    .Q(\blk00000003/sig00000110 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk000000ba  (
    .A0(\blk00000003/sig0000003a ),
    .A1(\blk00000003/sig0000003a ),
    .A2(\blk00000003/sig0000003a ),
    .A3(\blk00000003/sig0000003a ),
    .CE(\blk00000003/sig0000003b ),
    .CLK(sig00000022),
    .D(sig00000008),
    .Q(\blk00000003/sig00000115 ),
    .Q15(\NLW_blk00000003/blk000000ba_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b9  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000114 ),
    .Q(\blk00000003/sig0000010f )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk000000b8  (
    .A0(\blk00000003/sig0000003a ),
    .A1(\blk00000003/sig0000003a ),
    .A2(\blk00000003/sig0000003a ),
    .A3(\blk00000003/sig0000003a ),
    .CE(\blk00000003/sig0000003b ),
    .CLK(sig00000022),
    .D(sig00000009),
    .Q(\blk00000003/sig00000114 ),
    .Q15(\NLW_blk00000003/blk000000b8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b7  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000113 ),
    .Q(\blk00000003/sig00000111 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk000000b6  (
    .A0(\blk00000003/sig0000003a ),
    .A1(\blk00000003/sig0000003a ),
    .A2(\blk00000003/sig0000003a ),
    .A3(\blk00000003/sig0000003a ),
    .CE(\blk00000003/sig0000003b ),
    .CLK(sig00000022),
    .D(sig00000007),
    .Q(\blk00000003/sig00000113 ),
    .Q15(\NLW_blk00000003/blk000000b6_Q15_UNCONNECTED )
  );
  INV   \blk00000003/blk000000b5  (
    .I(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000008a )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk000000b4  (
    .I0(sig00000009),
    .I1(sig00000007),
    .I2(sig00000006),
    .I3(sig00000008),
    .O(\blk00000003/sig000000e3 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000b3  (
    .I0(\blk00000003/sig00000112 ),
    .O(\blk00000003/sig000000dc )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000b2  (
    .I0(\blk00000003/sig00000111 ),
    .O(\blk00000003/sig000000da )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000b1  (
    .I0(\blk00000003/sig00000110 ),
    .O(\blk00000003/sig000000d8 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000b0  (
    .I0(\blk00000003/sig0000010f ),
    .O(\blk00000003/sig000000d6 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000af  (
    .I0(\blk00000003/sig00000082 ),
    .O(\blk00000003/sig000000d4 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000ae  (
    .I0(\blk00000003/sig00000081 ),
    .O(\blk00000003/sig000000d1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000ad  (
    .I0(\blk00000003/sig00000080 ),
    .O(\blk00000003/sig000000ce )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000ac  (
    .I0(\blk00000003/sig0000007f ),
    .O(\blk00000003/sig000000cb )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000ab  (
    .I0(\blk00000003/sig0000007e ),
    .O(\blk00000003/sig000000c8 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000aa  (
    .I0(\blk00000003/sig0000007d ),
    .O(\blk00000003/sig000000c5 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a9  (
    .I0(\blk00000003/sig00000088 ),
    .O(\blk00000003/sig000000bf )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a8  (
    .I0(\blk00000003/sig00000087 ),
    .O(\blk00000003/sig000000bd )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a7  (
    .I0(\blk00000003/sig00000086 ),
    .O(\blk00000003/sig000000bb )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a6  (
    .I0(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig000000b9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a5  (
    .I0(\blk00000003/sig00000084 ),
    .O(\blk00000003/sig000000b7 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk000000a4  (
    .I0(\blk00000003/sig00000083 ),
    .O(\blk00000003/sig000000b5 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000003/blk000000a3  (
    .I0(\blk00000003/sig000000fc ),
    .I1(\blk00000003/sig000000fe ),
    .I2(\blk00000003/sig00000102 ),
    .O(\blk00000003/sig0000010e )
  );
  FDS #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000a2  (
    .C(sig00000022),
    .D(\blk00000003/sig0000010e ),
    .S(\blk00000003/sig000000f4 ),
    .Q(\blk00000003/sig000000a4 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk000000a1  (
    .I0(\blk00000003/sig00000109 ),
    .I1(\blk00000003/sig000000ad ),
    .O(\blk00000003/sig0000010d )
  );
  FDS   \blk00000003/blk000000a0  (
    .C(sig00000022),
    .D(\blk00000003/sig0000010d ),
    .S(\blk00000003/sig00000106 ),
    .Q(sig00000036)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000003/blk0000009f  (
    .I0(\blk00000003/sig00000108 ),
    .I1(\blk00000003/sig000000ad ),
    .O(\blk00000003/sig0000010c )
  );
  FDS   \blk00000003/blk0000009e  (
    .C(sig00000022),
    .D(\blk00000003/sig0000010c ),
    .S(\blk00000003/sig00000104 ),
    .Q(sig00000037)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000003/blk0000009d  (
    .I0(\blk00000003/sig0000007c ),
    .I1(\blk00000003/sig0000007d ),
    .O(\blk00000003/sig000000c3 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk0000009c  (
    .I0(\blk00000003/sig0000007d ),
    .I1(\blk00000003/sig0000007c ),
    .O(\blk00000003/sig000000c2 )
  );
  LUT3 #(
    .INIT ( 8'h04 ))
  \blk00000003/blk0000009b  (
    .I0(\blk00000003/sig000000f7 ),
    .I1(\blk00000003/sig000000a0 ),
    .I2(\blk00000003/sig000000a4 ),
    .O(\blk00000003/sig000000a3 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \blk00000003/blk0000009a  (
    .I0(\blk00000003/sig000000a0 ),
    .I1(\blk00000003/sig000000a4 ),
    .O(\blk00000003/sig00000095 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \blk00000003/blk00000099  (
    .I0(\blk00000003/sig000000a0 ),
    .I1(\blk00000003/sig000000a4 ),
    .O(\blk00000003/sig000000a1 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000003/blk00000098  (
    .I0(sig00000007),
    .I1(sig00000006),
    .I2(sig00000008),
    .O(\blk00000003/sig0000010a )
  );
  LUT6 #(
    .INIT ( 64'h0000000000004000 ))
  \blk00000003/blk00000097  (
    .I0(sig00000002),
    .I1(sig00000003),
    .I2(sig00000004),
    .I3(sig00000005),
    .I4(sig00000006),
    .I5(\blk00000003/sig0000010b ),
    .O(\blk00000003/sig00000101 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000003/blk00000096  (
    .I0(sig00000007),
    .I1(sig00000008),
    .I2(sig00000009),
    .O(\blk00000003/sig0000010b )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000003/blk00000095  (
    .I0(\blk00000003/sig00000076 ),
    .I1(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig00000089 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk00000094  (
    .I0(\blk00000003/sig0000008f ),
    .I1(\blk00000003/sig00000076 ),
    .O(\blk00000003/sig00000075 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAA8A8A8 ))
  \blk00000003/blk00000093  (
    .I0(sig00000002),
    .I1(sig00000003),
    .I2(sig00000005),
    .I3(sig00000009),
    .I4(\blk00000003/sig0000010a ),
    .I5(sig00000004),
    .O(\blk00000003/sig000000fb )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000008 ))
  \blk00000003/blk00000092  (
    .I0(sig00000002),
    .I1(\blk00000003/sig0000010a ),
    .I2(sig00000009),
    .I3(sig00000003),
    .I4(sig00000005),
    .I5(sig00000004),
    .O(\blk00000003/sig000000ff )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000091  (
    .I0(sig00000020),
    .I1(sig0000001f),
    .I2(sig0000001e),
    .I3(sig0000001d),
    .O(\blk00000003/sig000000e7 )
  );
  LUT5 #(
    .INIT ( 32'hFFFE5554 ))
  \blk00000003/blk00000090  (
    .I0(\blk00000003/sig000000f4 ),
    .I1(\blk00000003/sig000000fc ),
    .I2(\blk00000003/sig000000fe ),
    .I3(\blk00000003/sig00000102 ),
    .I4(\blk00000003/sig000000f5 ),
    .O(\blk00000003/sig000000f8 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000008f  (
    .I0(sig0000001c),
    .I1(sig0000001b),
    .I2(sig0000001a),
    .I3(sig00000019),
    .O(\blk00000003/sig000000e9 )
  );
  LUT4 #(
    .INIT ( 16'h0444 ))
  \blk00000003/blk0000008e  (
    .I0(\blk00000003/sig000000f4 ),
    .I1(\blk00000003/sig000000fc ),
    .I2(\blk00000003/sig000000f3 ),
    .I3(\blk00000003/sig000000fe ),
    .O(\blk00000003/sig00000103 )
  );
  LUT4 #(
    .INIT ( 16'h0444 ))
  \blk00000003/blk0000008d  (
    .I0(\blk00000003/sig000000f4 ),
    .I1(\blk00000003/sig00000100 ),
    .I2(\blk00000003/sig000000f3 ),
    .I3(\blk00000003/sig000000fe ),
    .O(\blk00000003/sig00000107 )
  );
  LUT4 #(
    .INIT ( 16'h0444 ))
  \blk00000003/blk0000008c  (
    .I0(\blk00000003/sig000000f4 ),
    .I1(\blk00000003/sig00000102 ),
    .I2(\blk00000003/sig000000f3 ),
    .I3(\blk00000003/sig000000fe ),
    .O(\blk00000003/sig000000f6 )
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  \blk00000003/blk0000008b  (
    .I0(\blk00000003/sig0000008f ),
    .I1(\blk00000003/sig0000008d ),
    .I2(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000008e )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \blk00000003/blk0000008a  (
    .I0(\blk00000003/sig000000fe ),
    .I1(\blk00000003/sig000000f3 ),
    .I2(\blk00000003/sig000000f4 ),
    .O(\blk00000003/sig00000105 )
  );
  LUT3 #(
    .INIT ( 8'h8C ))
  \blk00000003/blk00000089  (
    .I0(\blk00000003/sig000000f5 ),
    .I1(\blk00000003/sig000000f9 ),
    .I2(\blk00000003/sig000000f4 ),
    .O(\blk00000003/sig000000fa )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000088  (
    .I0(\blk00000003/sig0000008d ),
    .I1(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000008c )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000003/blk00000087  (
    .I0(\blk00000003/sig00000079 ),
    .I1(\blk00000003/sig00000076 ),
    .O(\blk00000003/sig00000073 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk00000086  (
    .I0(sig00000021),
    .I1(\blk00000003/sig00000074 ),
    .O(\blk00000003/sig00000077 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000085  (
    .I0(sig00000018),
    .I1(sig00000017),
    .I2(sig00000016),
    .I3(sig00000015),
    .O(\blk00000003/sig000000eb )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000084  (
    .I0(sig00000014),
    .I1(sig00000013),
    .I2(sig00000012),
    .I3(sig00000011),
    .O(\blk00000003/sig000000ed )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \blk00000003/blk00000083  (
    .I0(sig00000020),
    .I1(sig0000001f),
    .I2(sig0000001e),
    .I3(sig0000001d),
    .I4(sig0000001c),
    .I5(sig0000001b),
    .O(\blk00000003/sig00000092 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000082  (
    .I0(sig00000007),
    .I1(sig00000006),
    .I2(sig00000009),
    .I3(sig00000008),
    .O(\blk00000003/sig000000df )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000081  (
    .I0(sig00000010),
    .I1(sig0000000f),
    .I2(sig0000000e),
    .I3(sig0000000d),
    .O(\blk00000003/sig000000ef )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000080  (
    .I0(sig00000002),
    .I1(sig00000005),
    .I2(sig00000004),
    .I3(sig00000003),
    .O(\blk00000003/sig000000e5 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000007f  (
    .I0(sig00000005),
    .I1(sig00000004),
    .I2(sig00000003),
    .I3(sig00000002),
    .O(\blk00000003/sig000000e1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000007e  (
    .I0(sig0000001a),
    .I1(sig00000019),
    .I2(sig00000018),
    .I3(sig00000017),
    .O(\blk00000003/sig00000091 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \blk00000003/blk0000007d  (
    .I0(sig0000000c),
    .I1(sig0000000b),
    .I2(sig0000000a),
    .O(\blk00000003/sig000000f1 )
  );
  LUT4 #(
    .INIT ( 16'h1555 ))
  \blk00000003/blk0000007c  (
    .I0(sig00000002),
    .I1(sig00000005),
    .I2(sig00000004),
    .I3(sig00000003),
    .O(\blk00000003/sig000000fd )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000007b  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000f6 ),
    .Q(\blk00000003/sig00000109 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000007a  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000107 ),
    .Q(\blk00000003/sig00000108 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000079  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000105 ),
    .Q(\blk00000003/sig00000106 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000078  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000103 ),
    .Q(\blk00000003/sig00000104 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000077  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig00000101 ),
    .Q(\blk00000003/sig00000102 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000076  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000ff ),
    .Q(\blk00000003/sig00000100 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000075  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000fd ),
    .Q(\blk00000003/sig000000fe )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000074  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000fb ),
    .Q(\blk00000003/sig000000fc )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000073  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000fa ),
    .Q(\blk00000003/sig00000093 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000072  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(sig00000001),
    .Q(\blk00000003/sig000000f9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000071  (
    .C(sig00000022),
    .D(\blk00000003/sig000000f8 ),
    .Q(\blk00000003/sig000000a0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000070  (
    .C(sig00000022),
    .D(\blk00000003/sig000000f6 ),
    .Q(\blk00000003/sig000000f7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006f  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000f2 ),
    .Q(\blk00000003/sig000000f5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006e  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000e6 ),
    .Q(\blk00000003/sig000000f4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006d  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000e2 ),
    .Q(\blk00000003/sig000000f3 )
  );
  MUXCY   \blk00000003/blk0000006c  (
    .CI(\blk00000003/sig000000f0 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000f1 ),
    .O(\blk00000003/sig000000f2 )
  );
  MUXCY   \blk00000003/blk0000006b  (
    .CI(\blk00000003/sig000000ee ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000ef ),
    .O(\blk00000003/sig000000f0 )
  );
  MUXCY   \blk00000003/blk0000006a  (
    .CI(\blk00000003/sig000000ec ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000ed ),
    .O(\blk00000003/sig000000ee )
  );
  MUXCY   \blk00000003/blk00000069  (
    .CI(\blk00000003/sig000000ea ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000eb ),
    .O(\blk00000003/sig000000ec )
  );
  MUXCY   \blk00000003/blk00000068  (
    .CI(\blk00000003/sig000000e8 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000e9 ),
    .O(\blk00000003/sig000000ea )
  );
  MUXCY   \blk00000003/blk00000067  (
    .CI(\blk00000003/sig0000003b ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000e7 ),
    .O(\blk00000003/sig000000e8 )
  );
  MUXCY   \blk00000003/blk00000066  (
    .CI(\blk00000003/sig000000e4 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000e5 ),
    .O(\blk00000003/sig000000e6 )
  );
  MUXCY   \blk00000003/blk00000065  (
    .CI(\blk00000003/sig0000003b ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000e3 ),
    .O(\blk00000003/sig000000e4 )
  );
  MUXCY   \blk00000003/blk00000064  (
    .CI(\blk00000003/sig000000e0 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000e1 ),
    .O(\blk00000003/sig000000e2 )
  );
  MUXCY   \blk00000003/blk00000063  (
    .CI(\blk00000003/sig0000003b ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000df ),
    .O(\blk00000003/sig000000e0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000062  (
    .C(sig00000022),
    .D(\blk00000003/sig000000c7 ),
    .Q(\blk00000003/sig0000009e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000061  (
    .C(sig00000022),
    .D(\blk00000003/sig000000ca ),
    .Q(\blk00000003/sig0000009d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000060  (
    .C(sig00000022),
    .D(\blk00000003/sig000000cd ),
    .Q(\blk00000003/sig0000009c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005f  (
    .C(sig00000022),
    .D(\blk00000003/sig000000d0 ),
    .Q(\blk00000003/sig0000009b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005e  (
    .C(sig00000022),
    .D(\blk00000003/sig000000d3 ),
    .Q(\blk00000003/sig0000009a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005d  (
    .C(sig00000022),
    .D(\blk00000003/sig000000d5 ),
    .Q(\blk00000003/sig00000099 )
  );
  XORCY   \blk00000003/blk0000005c  (
    .CI(\blk00000003/sig000000dd ),
    .LI(\blk00000003/sig000000de ),
    .O(\blk00000003/sig000000a2 )
  );
  XORCY   \blk00000003/blk0000005b  (
    .CI(\blk00000003/sig000000db ),
    .LI(\blk00000003/sig000000dc ),
    .O(\blk00000003/sig000000a5 )
  );
  MUXCY   \blk00000003/blk0000005a  (
    .CI(\blk00000003/sig000000db ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000dc ),
    .O(\blk00000003/sig000000dd )
  );
  XORCY   \blk00000003/blk00000059  (
    .CI(\blk00000003/sig000000d9 ),
    .LI(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000a6 )
  );
  MUXCY   \blk00000003/blk00000058  (
    .CI(\blk00000003/sig000000d9 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000db )
  );
  XORCY   \blk00000003/blk00000057  (
    .CI(\blk00000003/sig000000d7 ),
    .LI(\blk00000003/sig000000d8 ),
    .O(\blk00000003/sig000000a7 )
  );
  MUXCY   \blk00000003/blk00000056  (
    .CI(\blk00000003/sig000000d7 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000d8 ),
    .O(\blk00000003/sig000000d9 )
  );
  XORCY   \blk00000003/blk00000055  (
    .CI(\blk00000003/sig000000ab ),
    .LI(\blk00000003/sig000000d6 ),
    .O(\blk00000003/sig000000a8 )
  );
  MUXCY   \blk00000003/blk00000054  (
    .CI(\blk00000003/sig000000ab ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000d6 ),
    .O(\blk00000003/sig000000d7 )
  );
  XORCY   \blk00000003/blk00000053  (
    .CI(\blk00000003/sig000000d2 ),
    .LI(\blk00000003/sig000000d4 ),
    .O(\blk00000003/sig000000d5 )
  );
  MUXCY   \blk00000003/blk00000052  (
    .CI(\blk00000003/sig000000d2 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000d4 ),
    .O(\blk00000003/sig000000b4 )
  );
  XORCY   \blk00000003/blk00000051  (
    .CI(\blk00000003/sig000000cf ),
    .LI(\blk00000003/sig000000d1 ),
    .O(\blk00000003/sig000000d3 )
  );
  MUXCY   \blk00000003/blk00000050  (
    .CI(\blk00000003/sig000000cf ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000d1 ),
    .O(\blk00000003/sig000000d2 )
  );
  XORCY   \blk00000003/blk0000004f  (
    .CI(\blk00000003/sig000000cc ),
    .LI(\blk00000003/sig000000ce ),
    .O(\blk00000003/sig000000d0 )
  );
  MUXCY   \blk00000003/blk0000004e  (
    .CI(\blk00000003/sig000000cc ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000ce ),
    .O(\blk00000003/sig000000cf )
  );
  XORCY   \blk00000003/blk0000004d  (
    .CI(\blk00000003/sig000000c9 ),
    .LI(\blk00000003/sig000000cb ),
    .O(\blk00000003/sig000000cd )
  );
  MUXCY   \blk00000003/blk0000004c  (
    .CI(\blk00000003/sig000000c9 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000cb ),
    .O(\blk00000003/sig000000cc )
  );
  XORCY   \blk00000003/blk0000004b  (
    .CI(\blk00000003/sig000000c6 ),
    .LI(\blk00000003/sig000000c8 ),
    .O(\blk00000003/sig000000ca )
  );
  MUXCY   \blk00000003/blk0000004a  (
    .CI(\blk00000003/sig000000c6 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000c8 ),
    .O(\blk00000003/sig000000c9 )
  );
  XORCY   \blk00000003/blk00000049  (
    .CI(\blk00000003/sig000000c4 ),
    .LI(\blk00000003/sig000000c5 ),
    .O(\blk00000003/sig000000c7 )
  );
  MUXCY   \blk00000003/blk00000048  (
    .CI(\blk00000003/sig000000c4 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000c5 ),
    .O(\blk00000003/sig000000c6 )
  );
  MUXCY   \blk00000003/blk00000047  (
    .CI(\blk00000003/sig0000007b ),
    .DI(\blk00000003/sig000000c2 ),
    .S(\blk00000003/sig000000c3 ),
    .O(\blk00000003/sig000000c4 )
  );
  XORCY   \blk00000003/blk00000046  (
    .CI(\blk00000003/sig000000c1 ),
    .LI(\blk00000003/sig0000003a ),
    .O(\blk00000003/sig000000aa )
  );
  XORCY   \blk00000003/blk00000045  (
    .CI(\blk00000003/sig000000c0 ),
    .LI(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig000000ac )
  );
  MUXCY   \blk00000003/blk00000044  (
    .CI(\blk00000003/sig000000c0 ),
    .DI(\blk00000003/sig0000003b ),
    .S(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig000000c1 )
  );
  XORCY   \blk00000003/blk00000043  (
    .CI(\blk00000003/sig000000be ),
    .LI(\blk00000003/sig000000bf ),
    .O(\blk00000003/sig000000ae )
  );
  MUXCY   \blk00000003/blk00000042  (
    .CI(\blk00000003/sig000000be ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000bf ),
    .O(\blk00000003/sig000000c0 )
  );
  XORCY   \blk00000003/blk00000041  (
    .CI(\blk00000003/sig000000bc ),
    .LI(\blk00000003/sig000000bd ),
    .O(\blk00000003/sig000000af )
  );
  MUXCY   \blk00000003/blk00000040  (
    .CI(\blk00000003/sig000000bc ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000bd ),
    .O(\blk00000003/sig000000be )
  );
  XORCY   \blk00000003/blk0000003f  (
    .CI(\blk00000003/sig000000ba ),
    .LI(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig000000b0 )
  );
  MUXCY   \blk00000003/blk0000003e  (
    .CI(\blk00000003/sig000000ba ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig000000bc )
  );
  XORCY   \blk00000003/blk0000003d  (
    .CI(\blk00000003/sig000000b8 ),
    .LI(\blk00000003/sig000000b9 ),
    .O(\blk00000003/sig000000b1 )
  );
  MUXCY   \blk00000003/blk0000003c  (
    .CI(\blk00000003/sig000000b8 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000b9 ),
    .O(\blk00000003/sig000000ba )
  );
  XORCY   \blk00000003/blk0000003b  (
    .CI(\blk00000003/sig000000b6 ),
    .LI(\blk00000003/sig000000b7 ),
    .O(\blk00000003/sig000000b2 )
  );
  MUXCY   \blk00000003/blk0000003a  (
    .CI(\blk00000003/sig000000b6 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000b7 ),
    .O(\blk00000003/sig000000b8 )
  );
  XORCY   \blk00000003/blk00000039  (
    .CI(\blk00000003/sig000000b4 ),
    .LI(\blk00000003/sig000000b5 ),
    .O(\blk00000003/sig000000b3 )
  );
  MUXCY   \blk00000003/blk00000038  (
    .CI(\blk00000003/sig000000b4 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig000000b5 ),
    .O(\blk00000003/sig000000b6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000037  (
    .C(sig00000022),
    .D(\blk00000003/sig000000b3 ),
    .Q(\blk00000003/sig00000098 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000036  (
    .C(sig00000022),
    .D(\blk00000003/sig000000b2 ),
    .Q(\blk00000003/sig00000097 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000035  (
    .C(sig00000022),
    .D(\blk00000003/sig000000b1 ),
    .Q(\blk00000003/sig00000096 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000034  (
    .C(sig00000022),
    .D(\blk00000003/sig000000b0 ),
    .Q(\blk00000003/sig00000094 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000033  (
    .C(sig00000022),
    .D(\blk00000003/sig000000af ),
    .Q(\blk00000003/sig000000a9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000032  (
    .C(sig00000022),
    .D(\blk00000003/sig000000ae ),
    .Q(\blk00000003/sig0000009f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000031  (
    .C(sig00000022),
    .D(\blk00000003/sig000000ac ),
    .Q(\blk00000003/sig000000ad )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000030  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig000000aa ),
    .Q(\blk00000003/sig000000ab )
  );
  FDRS   \blk00000003/blk0000002f  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a9 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig0000002b)
  );
  FDRS   \blk00000003/blk0000002e  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a8 ),
    .R(\blk00000003/sig000000a3 ),
    .S(\blk00000003/sig000000a4 ),
    .Q(sig00000029)
  );
  FDRS   \blk00000003/blk0000002d  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a7 ),
    .R(\blk00000003/sig000000a3 ),
    .S(\blk00000003/sig000000a4 ),
    .Q(sig00000028)
  );
  FDRS   \blk00000003/blk0000002c  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a6 ),
    .R(\blk00000003/sig000000a3 ),
    .S(\blk00000003/sig000000a4 ),
    .Q(sig00000027)
  );
  FDRS   \blk00000003/blk0000002b  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a5 ),
    .R(\blk00000003/sig000000a3 ),
    .S(\blk00000003/sig000000a4 ),
    .Q(sig00000026)
  );
  FDRS   \blk00000003/blk0000002a  (
    .C(sig00000022),
    .D(\blk00000003/sig000000a2 ),
    .R(\blk00000003/sig000000a3 ),
    .S(\blk00000003/sig000000a4 ),
    .Q(sig00000025)
  );
  FDRS   \blk00000003/blk00000029  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009f ),
    .R(\blk00000003/sig000000a0 ),
    .S(\blk00000003/sig000000a1 ),
    .Q(sig0000002a)
  );
  FDRS   \blk00000003/blk00000028  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009e ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000035)
  );
  FDRS   \blk00000003/blk00000027  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009d ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000034)
  );
  FDRS   \blk00000003/blk00000026  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009c ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000033)
  );
  FDRS   \blk00000003/blk00000025  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009b ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000032)
  );
  FDRS   \blk00000003/blk00000024  (
    .C(sig00000022),
    .D(\blk00000003/sig0000009a ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000031)
  );
  FDRS   \blk00000003/blk00000023  (
    .C(sig00000022),
    .D(\blk00000003/sig00000099 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000030)
  );
  FDRS   \blk00000003/blk00000022  (
    .C(sig00000022),
    .D(\blk00000003/sig00000098 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig0000002f)
  );
  FDRS   \blk00000003/blk00000021  (
    .C(sig00000022),
    .D(\blk00000003/sig00000097 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig0000002e)
  );
  FDRS   \blk00000003/blk00000020  (
    .C(sig00000022),
    .D(\blk00000003/sig00000096 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig0000002d)
  );
  FDRS   \blk00000003/blk0000001f  (
    .C(sig00000022),
    .D(\blk00000003/sig00000094 ),
    .R(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig0000002c)
  );
  FDRS   \blk00000003/blk0000001e  (
    .C(sig00000022),
    .D(\blk00000003/sig00000093 ),
    .R(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig0000003a ),
    .Q(sig00000024)
  );
  MUXCY   \blk00000003/blk0000001d  (
    .CI(\blk00000003/sig0000003a ),
    .DI(\blk00000003/sig0000003b ),
    .S(\blk00000003/sig00000092 ),
    .O(\blk00000003/sig00000090 )
  );
  MUXCY   \blk00000003/blk0000001c  (
    .CI(\blk00000003/sig00000090 ),
    .DI(\blk00000003/sig0000003b ),
    .S(\blk00000003/sig00000091 ),
    .O(\blk00000003/sig0000007a )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001b  (
    .C(sig00000022),
    .CE(\blk00000003/sig00000089 ),
    .D(\blk00000003/sig0000008e ),
    .R(sig00000023),
    .Q(\blk00000003/sig0000008f )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001a  (
    .C(sig00000022),
    .CE(\blk00000003/sig00000089 ),
    .D(\blk00000003/sig0000008c ),
    .R(sig00000023),
    .Q(\blk00000003/sig0000008d )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000019  (
    .C(sig00000022),
    .CE(\blk00000003/sig00000089 ),
    .D(\blk00000003/sig0000008a ),
    .R(sig00000023),
    .Q(\blk00000003/sig0000008b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000018  (
    .C(sig00000022),
    .D(sig0000000a),
    .Q(\blk00000003/sig00000088 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000017  (
    .C(sig00000022),
    .D(sig0000000b),
    .Q(\blk00000003/sig00000087 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000016  (
    .C(sig00000022),
    .D(sig0000000c),
    .Q(\blk00000003/sig00000086 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000015  (
    .C(sig00000022),
    .D(sig0000000d),
    .Q(\blk00000003/sig00000085 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000014  (
    .C(sig00000022),
    .D(sig0000000e),
    .Q(\blk00000003/sig00000084 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000013  (
    .C(sig00000022),
    .D(sig0000000f),
    .Q(\blk00000003/sig00000083 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000012  (
    .C(sig00000022),
    .D(sig00000010),
    .Q(\blk00000003/sig00000082 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000011  (
    .C(sig00000022),
    .D(sig00000011),
    .Q(\blk00000003/sig00000081 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000010  (
    .C(sig00000022),
    .D(sig00000012),
    .Q(\blk00000003/sig00000080 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000f  (
    .C(sig00000022),
    .D(sig00000013),
    .Q(\blk00000003/sig0000007f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000e  (
    .C(sig00000022),
    .D(sig00000014),
    .Q(\blk00000003/sig0000007e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000d  (
    .C(sig00000022),
    .D(sig00000015),
    .Q(\blk00000003/sig0000007d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000c  (
    .C(sig00000022),
    .D(sig00000016),
    .Q(\blk00000003/sig0000007c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000b  (
    .C(sig00000022),
    .CE(\blk00000003/sig0000003b ),
    .D(\blk00000003/sig0000007a ),
    .Q(\blk00000003/sig0000007b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000a  (
    .C(sig00000022),
    .D(\blk00000003/sig00000078 ),
    .Q(\blk00000003/sig00000079 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000009  (
    .C(sig00000022),
    .D(\blk00000003/sig00000077 ),
    .Q(\blk00000003/sig00000078 )
  );
  FDSE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000008  (
    .C(sig00000022),
    .CE(\blk00000003/sig00000075 ),
    .D(\blk00000003/sig0000003a ),
    .S(sig00000023),
    .Q(\blk00000003/sig00000076 )
  );
  FDR #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000007  (
    .C(sig00000022),
    .D(\blk00000003/sig0000003b ),
    .R(sig00000023),
    .Q(\blk00000003/sig00000074 )
  );
  FDR   \blk00000003/blk00000006  (
    .C(sig00000022),
    .D(\blk00000003/sig00000073 ),
    .R(sig00000023),
    .Q(sig00000038)
  );
  VCC   \blk00000003/blk00000005  (
    .P(\blk00000003/sig0000003b )
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig0000003a )
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
