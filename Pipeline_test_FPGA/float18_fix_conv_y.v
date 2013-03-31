////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: float18_fix_conv_y.v
// /___/   /\     Timestamp: Sun Sep 26 21:24:32 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog D:\xiao\test\tmp\_cg\float18_fix_conv_y.ngc D:\xiao\test\tmp\_cg\float18_fix_conv_y.v 
// Device	: 5vlx110tff1136-1
// Input file	: D:/xiao/test/tmp/_cg/float18_fix_conv_y.ngc
// Output file	: D:/xiao/test/tmp/_cg/float18_fix_conv_y.v
// # of Modules	: 1
// Design Name	: float18_fix_conv_y
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

module float18_fix_conv_y (
  sclr, ce, rdy, operation_rfd, overflow, invalid_op, operation_nd, clk, a, result
);
  input sclr;
  input ce;
  output rdy;
  output operation_rfd;
  output overflow;
  output invalid_op;
  input operation_nd;
  input clk;
  input [17 : 0] a;
  output [8 : 0] result;
  
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
  wire NlwRenamedSignal_sig00000013;
  wire NlwRenamedSig_OI_sig00000014;
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
  wire \blk00000003/sig00000072 ;
  wire \blk00000003/sig00000071 ;
  wire \blk00000003/sig00000070 ;
  wire \blk00000003/sig0000006f ;
  wire \blk00000003/sig0000006e ;
  wire \blk00000003/sig0000006d ;
  wire \blk00000003/sig0000006c ;
  wire \blk00000003/sig0000006b ;
  wire \blk00000003/sig0000006a ;
  wire \blk00000003/sig00000069 ;
  wire \blk00000003/sig00000068 ;
  wire \blk00000003/sig00000067 ;
  wire \blk00000003/sig00000066 ;
  wire \blk00000003/sig00000065 ;
  wire \blk00000003/sig00000064 ;
  wire \blk00000003/sig00000063 ;
  wire \blk00000003/sig00000062 ;
  wire \blk00000003/sig00000061 ;
  wire \blk00000003/sig00000060 ;
  wire \blk00000003/sig0000005f ;
  wire \blk00000003/sig0000005e ;
  wire \blk00000003/sig0000005d ;
  wire \blk00000003/sig0000005c ;
  wire \blk00000003/sig0000005b ;
  wire \blk00000003/sig0000005a ;
  wire \blk00000003/sig00000059 ;
  wire \blk00000003/sig00000058 ;
  wire \blk00000003/sig00000057 ;
  wire \blk00000003/sig00000056 ;
  wire \blk00000003/sig00000055 ;
  wire \blk00000003/sig00000054 ;
  wire \blk00000003/sig00000053 ;
  wire \blk00000003/sig00000052 ;
  wire \blk00000003/sig00000051 ;
  wire \blk00000003/sig00000050 ;
  wire \blk00000003/sig0000004f ;
  wire \blk00000003/sig0000004e ;
  wire \blk00000003/sig0000004d ;
  wire \blk00000003/sig0000004c ;
  wire \blk00000003/sig0000004b ;
  wire \blk00000003/sig0000004a ;
  wire \blk00000003/sig00000049 ;
  wire \blk00000003/sig00000048 ;
  wire \blk00000003/sig00000047 ;
  wire \blk00000003/sig00000046 ;
  wire \blk00000003/sig00000025 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000055_Q_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000054_Q_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000052_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk0000004f_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk0000004c_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000022_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk0000001b_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000016_O_UNCONNECTED ;
  assign
    sig00000016 = sclr,
    sig00000017 = ce,
    rdy = NlwRenamedSignal_sig00000013,
    operation_rfd = NlwRenamedSig_OI_sig00000014,
    overflow = sig00000021,
    invalid_op = sig00000022,
    sig00000001 = a[17],
    sig00000002 = a[16],
    sig00000003 = a[15],
    sig00000004 = a[14],
    sig00000005 = a[13],
    sig00000006 = a[12],
    sig00000007 = a[11],
    sig00000008 = a[10],
    sig00000009 = a[9],
    sig0000000a = a[8],
    sig0000000b = a[7],
    sig0000000c = a[6],
    sig0000000d = a[5],
    sig0000000e = a[4],
    sig0000000f = a[3],
    sig00000010 = a[2],
    sig00000011 = a[1],
    sig00000012 = a[0],
    result[8] = sig00000018,
    result[7] = sig00000019,
    result[6] = sig0000001a,
    result[5] = sig0000001b,
    result[4] = sig0000001c,
    result[3] = sig0000001d,
    result[2] = sig0000001e,
    result[1] = sig0000001f,
    result[0] = sig00000020,
    NlwRenamedSignal_sig00000013 = operation_nd,
    sig00000015 = clk;
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  MUXF7   \blk00000003/blk00000096  (
    .I0(\blk00000003/sig000000c3 ),
    .I1(\blk00000003/sig000000c2 ),
    .S(\blk00000003/sig00000088 ),
    .O(\blk00000003/sig00000081 )
  );
  LUT6 #(
    .INIT ( 64'h5747564613031202 ))
  \blk00000003/blk00000095  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000085 ),
    .I3(sig0000000d),
    .I4(sig0000000e),
    .I5(\blk00000003/sig000000b2 ),
    .O(\blk00000003/sig000000c3 )
  );
  LUT6 #(
    .INIT ( 64'h5554454411100100 ))
  \blk00000003/blk00000094  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000085 ),
    .I3(sig0000000c),
    .I4(sig0000000b),
    .I5(\blk00000003/sig000000b2 ),
    .O(\blk00000003/sig000000c2 )
  );
  INV   \blk00000003/blk00000093  (
    .I(sig00000002),
    .O(\blk00000003/sig00000069 )
  );
  LUT6 #(
    .INIT ( 64'h1514050411100100 ))
  \blk00000003/blk00000092  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000088 ),
    .I3(sig0000000b),
    .I4(sig00000009),
    .I5(sig00000007),
    .O(\blk00000003/sig000000c1 )
  );
  LUT6 #(
    .INIT ( 64'h5551554044514440 ))
  \blk00000003/blk00000091  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(sig00000008),
    .I3(\blk00000003/sig00000088 ),
    .I4(sig0000000c),
    .I5(sig0000000a),
    .O(\blk00000003/sig000000c0 )
  );
  MUXF7   \blk00000003/blk00000090  (
    .I0(\blk00000003/sig000000c0 ),
    .I1(\blk00000003/sig000000c1 ),
    .S(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig0000007d )
  );
  LUT5 #(
    .INIT ( 32'h99A99AAA ))
  \blk00000003/blk0000008f  (
    .I0(sig00000001),
    .I1(\blk00000003/sig0000008e ),
    .I2(\blk00000003/sig0000008b ),
    .I3(\blk00000003/sig000000bc ),
    .I4(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig00000047 )
  );
  LUT6 #(
    .INIT ( 64'hAAA9AAA99A99AAA9 ))
  \blk00000003/blk0000008e  (
    .I0(sig00000001),
    .I1(\blk00000003/sig0000008e ),
    .I2(\blk00000003/sig00000088 ),
    .I3(\blk00000003/sig000000bd ),
    .I4(\blk00000003/sig000000b3 ),
    .I5(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000004d )
  );
  LUT5 #(
    .INIT ( 32'h33FF020A ))
  \blk00000003/blk0000008d  (
    .I0(\blk00000003/sig0000006d ),
    .I1(\blk00000003/sig0000006a ),
    .I2(\blk00000003/sig000000ab ),
    .I3(\blk00000003/sig000000ac ),
    .I4(\blk00000003/sig00000097 ),
    .O(\blk00000003/sig000000b4 )
  );
  LUT6 #(
    .INIT ( 64'h0030FC300020EC20 ))
  \blk00000003/blk0000008c  (
    .I0(\blk00000003/sig000000be ),
    .I1(\blk00000003/sig0000006d ),
    .I2(\blk00000003/sig00000097 ),
    .I3(\blk00000003/sig000000ac ),
    .I4(\blk00000003/sig0000006a ),
    .I5(\blk00000003/sig000000b6 ),
    .O(\blk00000003/sig000000bf )
  );
  LUT6 #(
    .INIT ( 64'hFAFAA888FFFFFFFF ))
  \blk00000003/blk0000008b  (
    .I0(\blk00000003/sig0000009d ),
    .I1(sig00000009),
    .I2(\blk00000003/sig0000009a ),
    .I3(sig00000008),
    .I4(sig0000000a),
    .I5(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000b9 )
  );
  LUT6 #(
    .INIT ( 64'hFAFAA888FFFFFFFF ))
  \blk00000003/blk0000008a  (
    .I0(\blk00000003/sig0000009d ),
    .I1(sig0000000d),
    .I2(\blk00000003/sig0000009a ),
    .I3(sig0000000c),
    .I4(sig0000000e),
    .I5(\blk00000003/sig00000062 ),
    .O(\blk00000003/sig000000ba )
  );
  LUT5 #(
    .INIT ( 32'hFFFF2232 ))
  \blk00000003/blk00000089  (
    .I0(\blk00000003/sig000000b4 ),
    .I1(\blk00000003/sig000000b1 ),
    .I2(\blk00000003/sig00000077 ),
    .I3(sig00000001),
    .I4(\blk00000003/sig000000bf ),
    .O(sig00000021)
  );
  LUT5 #(
    .INIT ( 32'hFFFFBFFF ))
  \blk00000003/blk00000088  (
    .I0(\blk00000003/sig000000ae ),
    .I1(sig00000001),
    .I2(\blk00000003/sig00000085 ),
    .I3(\blk00000003/sig00000088 ),
    .I4(\blk00000003/sig000000b5 ),
    .O(\blk00000003/sig000000be )
  );
  LUT6 #(
    .INIT ( 64'hA9AAA9AAA9AA999A ))
  \blk00000003/blk00000087  (
    .I0(sig00000001),
    .I1(\blk00000003/sig0000008e ),
    .I2(\blk00000003/sig0000008b ),
    .I3(\blk00000003/sig000000b2 ),
    .I4(\blk00000003/sig00000088 ),
    .I5(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000050 )
  );
  LUT6 #(
    .INIT ( 64'hAAA9AAA9AAA9AAAA ))
  \blk00000003/blk00000086  (
    .I0(sig00000001),
    .I1(\blk00000003/sig00000088 ),
    .I2(\blk00000003/sig0000008b ),
    .I3(\blk00000003/sig0000008e ),
    .I4(sig00000007),
    .I5(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000059 )
  );
  LUT5 #(
    .INIT ( 32'hAAAAAAA9 ))
  \blk00000003/blk00000085  (
    .I0(sig00000001),
    .I1(\blk00000003/sig00000088 ),
    .I2(\blk00000003/sig00000085 ),
    .I3(\blk00000003/sig0000008e ),
    .I4(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000005c )
  );
  LUT5 #(
    .INIT ( 32'h00401151 ))
  \blk00000003/blk00000084  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig00000088 ),
    .I2(\blk00000003/sig000000b3 ),
    .I3(\blk00000003/sig0000008b ),
    .I4(\blk00000003/sig000000bd ),
    .O(\blk00000003/sig0000007e )
  );
  LUT5 #(
    .INIT ( 32'h04152637 ))
  \blk00000003/blk00000083  (
    .I0(\blk00000003/sig00000085 ),
    .I1(\blk00000003/sig0000008b ),
    .I2(sig00000007),
    .I3(sig0000000b),
    .I4(sig0000000a),
    .O(\blk00000003/sig000000bd )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \blk00000003/blk00000082  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig000000bb ),
    .I3(\blk00000003/sig000000bc ),
    .O(\blk00000003/sig0000007c )
  );
  LUT5 #(
    .INIT ( 32'hFDADF8A8 ))
  \blk00000003/blk00000081  (
    .I0(\blk00000003/sig00000088 ),
    .I1(sig00000007),
    .I2(\blk00000003/sig00000085 ),
    .I3(sig00000008),
    .I4(sig00000009),
    .O(\blk00000003/sig000000bc )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000080  (
    .I0(\blk00000003/sig00000088 ),
    .I1(\blk00000003/sig00000085 ),
    .I2(sig0000000b),
    .I3(sig0000000c),
    .I4(sig0000000d),
    .I5(sig0000000a),
    .O(\blk00000003/sig000000bb )
  );
  LUT6 #(
    .INIT ( 64'h028A139B46CE57DF ))
  \blk00000003/blk0000007f  (
    .I0(\blk00000003/sig000000a3 ),
    .I1(\blk00000003/sig000000a0 ),
    .I2(\blk00000003/sig000000b9 ),
    .I3(\blk00000003/sig000000b8 ),
    .I4(\blk00000003/sig000000b7 ),
    .I5(\blk00000003/sig000000ba ),
    .O(\blk00000003/sig00000082 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \blk00000003/blk0000007e  (
    .I0(\blk00000003/sig0000009a ),
    .I1(\blk00000003/sig00000066 ),
    .I2(\blk00000003/sig0000009d ),
    .O(\blk00000003/sig000000b8 )
  );
  LUT5 #(
    .INIT ( 32'hFAA8FA88 ))
  \blk00000003/blk0000007d  (
    .I0(\blk00000003/sig0000009d ),
    .I1(sig00000011),
    .I2(\blk00000003/sig0000009a ),
    .I3(sig00000012),
    .I4(sig00000010),
    .O(\blk00000003/sig000000b7 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000007c  (
    .I0(sig0000000a),
    .I1(sig00000009),
    .I2(sig00000008),
    .I3(sig00000007),
    .O(\blk00000003/sig00000072 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000007b  (
    .I0(sig0000000e),
    .I1(sig0000000d),
    .I2(sig0000000c),
    .I3(sig0000000b),
    .O(\blk00000003/sig00000070 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000007a  (
    .I0(sig00000012),
    .I1(sig00000011),
    .I2(sig00000010),
    .I3(sig0000000f),
    .O(\blk00000003/sig0000006e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk00000079  (
    .I0(sig00000001),
    .O(\blk00000003/sig0000005f )
  );
  LUT4 #(
    .INIT ( 16'h66A6 ))
  \blk00000003/blk00000078  (
    .I0(sig00000001),
    .I1(\blk00000003/sig00000081 ),
    .I2(\blk00000003/sig00000082 ),
    .I3(\blk00000003/sig0000007c ),
    .O(\blk00000003/sig000000aa )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000077  (
    .I0(sig00000012),
    .I1(sig00000011),
    .I2(sig00000010),
    .I3(sig0000000f),
    .O(\blk00000003/sig00000061 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000076  (
    .I0(sig0000000e),
    .I1(sig0000000d),
    .I2(sig0000000c),
    .I3(sig0000000b),
    .O(\blk00000003/sig00000063 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000075  (
    .I0(sig0000000a),
    .I1(sig00000009),
    .I2(sig00000008),
    .I3(sig00000007),
    .O(\blk00000003/sig00000065 )
  );
  LUT5 #(
    .INIT ( 32'hC3C0C1C0 ))
  \blk00000003/blk00000074  (
    .I0(\blk00000003/sig00000077 ),
    .I1(\blk00000003/sig000000b1 ),
    .I2(\blk00000003/sig000000b4 ),
    .I3(\blk00000003/sig00000060 ),
    .I4(sig00000001),
    .O(sig00000018)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk00000073  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig0000005e ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig00000019)
  );
  LUT5 #(
    .INIT ( 32'h7FFFFFFF ))
  \blk00000003/blk00000072  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000091 ),
    .I3(\blk00000003/sig00000094 ),
    .I4(\blk00000003/sig00000097 ),
    .O(\blk00000003/sig000000b6 )
  );
  LUT5 #(
    .INIT ( 32'hAAAAAAA8 ))
  \blk00000003/blk00000071  (
    .I0(sig0000000f),
    .I1(sig00000012),
    .I2(sig00000011),
    .I3(sig00000010),
    .I4(sig0000000e),
    .O(\blk00000003/sig000000b5 )
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk00000070  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig0000005b ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001a)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006f  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig00000058 ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001b)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006e  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig00000055 ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001c)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006d  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig00000052 ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001d)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006c  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig0000004f ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001e)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006b  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig0000004c ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig0000001f)
  );
  LUT5 #(
    .INIT ( 32'h55554544 ))
  \blk00000003/blk0000006a  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig00000049 ),
    .I2(sig00000001),
    .I3(\blk00000003/sig00000077 ),
    .I4(\blk00000003/sig000000b4 ),
    .O(sig00000020)
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000069  (
    .I0(\blk00000003/sig00000085 ),
    .I1(\blk00000003/sig00000088 ),
    .I2(sig00000009),
    .I3(sig00000008),
    .I4(sig0000000a),
    .I5(sig00000007),
    .O(\blk00000003/sig000000b2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000068  (
    .I0(sig00000001),
    .I1(\blk00000003/sig0000007d ),
    .O(\blk00000003/sig0000004a )
  );
  LUT6 #(
    .INIT ( 64'h1111101011011000 ))
  \blk00000003/blk00000067  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000088 ),
    .I3(sig00000007),
    .I4(\blk00000003/sig000000b3 ),
    .I5(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000078 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk00000066  (
    .I0(\blk00000003/sig00000085 ),
    .I1(sig00000009),
    .I2(sig00000008),
    .O(\blk00000003/sig000000b3 )
  );
  LUT5 #(
    .INIT ( 32'h11150004 ))
  \blk00000003/blk00000065  (
    .I0(\blk00000003/sig0000008e ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig00000085 ),
    .I3(\blk00000003/sig00000088 ),
    .I4(\blk00000003/sig000000b2 ),
    .O(\blk00000003/sig0000007f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000064  (
    .I0(sig00000001),
    .I1(\blk00000003/sig00000078 ),
    .O(\blk00000003/sig00000053 )
  );
  LUT5 #(
    .INIT ( 32'hEEFE4454 ))
  \blk00000003/blk00000063  (
    .I0(\blk00000003/sig000000ad ),
    .I1(\blk00000003/sig000000b0 ),
    .I2(\blk00000003/sig000000ab ),
    .I3(\blk00000003/sig00000097 ),
    .I4(sig00000001),
    .O(\blk00000003/sig000000b1 )
  );
  LUT4 #(
    .INIT ( 16'hFA8A ))
  \blk00000003/blk00000062  (
    .I0(\blk00000003/sig0000006d ),
    .I1(sig00000001),
    .I2(\blk00000003/sig000000ac ),
    .I3(\blk00000003/sig0000006a ),
    .O(\blk00000003/sig000000b0 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \blk00000003/blk00000061  (
    .I0(sig00000009),
    .I1(sig0000000a),
    .I2(sig0000000b),
    .I3(sig0000000c),
    .I4(sig0000000d),
    .I5(\blk00000003/sig000000af ),
    .O(\blk00000003/sig000000ae )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \blk00000003/blk00000060  (
    .I0(sig0000000e),
    .I1(sig00000007),
    .I2(sig00000008),
    .O(\blk00000003/sig000000af )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \blk00000003/blk0000005f  (
    .I0(\blk00000003/sig000000ae ),
    .I1(sig0000000f),
    .I2(sig00000010),
    .I3(sig00000012),
    .I4(sig00000011),
    .O(\blk00000003/sig000000ac )
  );
  LUT4 #(
    .INIT ( 16'h0444 ))
  \blk00000003/blk0000005e  (
    .I0(\blk00000003/sig0000006d ),
    .I1(\blk00000003/sig00000097 ),
    .I2(\blk00000003/sig0000006a ),
    .I3(\blk00000003/sig000000ac ),
    .O(\blk00000003/sig000000ad )
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk0000005d  (
    .I0(\blk00000003/sig0000006a ),
    .I1(\blk00000003/sig0000006d ),
    .I2(\blk00000003/sig000000ac ),
    .O(sig00000022)
  );
  LUT6 #(
    .INIT ( 64'h0101111001010100 ))
  \blk00000003/blk0000005c  (
    .I0(\blk00000003/sig0000008b ),
    .I1(\blk00000003/sig0000008e ),
    .I2(\blk00000003/sig00000085 ),
    .I3(sig00000008),
    .I4(\blk00000003/sig00000088 ),
    .I5(sig00000007),
    .O(\blk00000003/sig00000079 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000005b  (
    .I0(sig00000001),
    .I1(\blk00000003/sig00000079 ),
    .O(\blk00000003/sig00000056 )
  );
  LUT5 #(
    .INIT ( 32'h01010100 ))
  \blk00000003/blk0000005a  (
    .I0(\blk00000003/sig00000088 ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig0000008e ),
    .I3(sig00000007),
    .I4(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig0000007a )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000059  (
    .I0(\blk00000003/sig00000088 ),
    .I1(\blk00000003/sig00000085 ),
    .I2(\blk00000003/sig0000008e ),
    .I3(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000007b )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEEEEEEEA ))
  \blk00000003/blk00000058  (
    .I0(\blk00000003/sig00000091 ),
    .I1(\blk00000003/sig0000008e ),
    .I2(\blk00000003/sig00000085 ),
    .I3(\blk00000003/sig00000088 ),
    .I4(\blk00000003/sig0000008b ),
    .I5(\blk00000003/sig00000094 ),
    .O(\blk00000003/sig000000ab )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000057  (
    .I0(sig00000006),
    .I1(sig00000005),
    .I2(sig00000004),
    .I3(sig00000003),
    .O(\blk00000003/sig0000006b )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000056  (
    .I0(sig00000006),
    .I1(sig00000005),
    .I2(sig00000004),
    .I3(sig00000003),
    .O(\blk00000003/sig00000067 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000055  (
    .C(sig00000015),
    .CE(sig00000017),
    .D(\blk00000003/sig000000a9 ),
    .Q(\NLW_blk00000003/blk00000055_Q_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000054  (
    .C(sig00000015),
    .CE(sig00000017),
    .D(\blk00000003/sig00000096 ),
    .Q(\NLW_blk00000003/blk00000054_Q_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk00000053  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig000000aa ),
    .O(\blk00000003/sig00000073 )
  );
  XORCY   \blk00000003/blk00000052  (
    .CI(\blk00000003/sig000000a7 ),
    .LI(\blk00000003/sig000000a8 ),
    .O(\NLW_blk00000003/blk00000052_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk00000051  (
    .CI(\blk00000003/sig000000a7 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig000000a8 ),
    .O(\blk00000003/sig000000a9 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000050  (
    .I0(\blk00000003/sig00000025 ),
    .I1(\blk00000003/sig00000025 ),
    .O(\blk00000003/sig000000a8 )
  );
  XORCY   \blk00000003/blk0000004f  (
    .CI(\blk00000003/sig000000a5 ),
    .LI(\blk00000003/sig000000a6 ),
    .O(\NLW_blk00000003/blk0000004f_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk0000004e  (
    .CI(\blk00000003/sig000000a5 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig000000a7 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000004d  (
    .I0(\blk00000003/sig00000025 ),
    .I1(\blk00000003/sig00000025 ),
    .O(\blk00000003/sig000000a6 )
  );
  XORCY   \blk00000003/blk0000004c  (
    .CI(\blk00000003/sig000000a2 ),
    .LI(\blk00000003/sig000000a4 ),
    .O(\NLW_blk00000003/blk0000004c_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk0000004b  (
    .CI(\blk00000003/sig000000a2 ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig000000a4 ),
    .O(\blk00000003/sig000000a5 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000004a  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000002),
    .O(\blk00000003/sig000000a4 )
  );
  XORCY   \blk00000003/blk00000049  (
    .CI(\blk00000003/sig0000009f ),
    .LI(\blk00000003/sig000000a1 ),
    .O(\blk00000003/sig000000a3 )
  );
  MUXCY   \blk00000003/blk00000048  (
    .CI(\blk00000003/sig0000009f ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig000000a1 ),
    .O(\blk00000003/sig000000a2 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000047  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000003),
    .O(\blk00000003/sig000000a1 )
  );
  XORCY   \blk00000003/blk00000046  (
    .CI(\blk00000003/sig0000009c ),
    .LI(\blk00000003/sig0000009e ),
    .O(\blk00000003/sig000000a0 )
  );
  MUXCY   \blk00000003/blk00000045  (
    .CI(\blk00000003/sig0000009c ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000009e ),
    .O(\blk00000003/sig0000009f )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000044  (
    .I0(\blk00000003/sig00000025 ),
    .I1(sig00000004),
    .O(\blk00000003/sig0000009e )
  );
  XORCY   \blk00000003/blk00000043  (
    .CI(\blk00000003/sig00000099 ),
    .LI(\blk00000003/sig0000009b ),
    .O(\blk00000003/sig0000009d )
  );
  MUXCY   \blk00000003/blk00000042  (
    .CI(\blk00000003/sig00000099 ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig0000009b ),
    .O(\blk00000003/sig0000009c )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000041  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000005),
    .O(\blk00000003/sig0000009b )
  );
  XORCY   \blk00000003/blk00000040  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .LI(\blk00000003/sig00000098 ),
    .O(\blk00000003/sig0000009a )
  );
  MUXCY   \blk00000003/blk0000003f  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000098 ),
    .O(\blk00000003/sig00000099 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000003e  (
    .I0(\blk00000003/sig00000025 ),
    .I1(sig00000006),
    .O(\blk00000003/sig00000098 )
  );
  XORCY   \blk00000003/blk0000003d  (
    .CI(\blk00000003/sig00000093 ),
    .LI(\blk00000003/sig00000095 ),
    .O(\blk00000003/sig00000097 )
  );
  MUXCY   \blk00000003/blk0000003c  (
    .CI(\blk00000003/sig00000093 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000095 ),
    .O(\blk00000003/sig00000096 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000003b  (
    .I0(\blk00000003/sig00000025 ),
    .I1(\blk00000003/sig00000025 ),
    .O(\blk00000003/sig00000095 )
  );
  XORCY   \blk00000003/blk0000003a  (
    .CI(\blk00000003/sig00000090 ),
    .LI(\blk00000003/sig00000092 ),
    .O(\blk00000003/sig00000094 )
  );
  MUXCY   \blk00000003/blk00000039  (
    .CI(\blk00000003/sig00000090 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000092 ),
    .O(\blk00000003/sig00000093 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000038  (
    .I0(\blk00000003/sig00000025 ),
    .I1(\blk00000003/sig00000025 ),
    .O(\blk00000003/sig00000092 )
  );
  XORCY   \blk00000003/blk00000037  (
    .CI(\blk00000003/sig0000008d ),
    .LI(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig00000091 )
  );
  MUXCY   \blk00000003/blk00000036  (
    .CI(\blk00000003/sig0000008d ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig00000090 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000035  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000002),
    .O(\blk00000003/sig0000008f )
  );
  XORCY   \blk00000003/blk00000034  (
    .CI(\blk00000003/sig0000008a ),
    .LI(\blk00000003/sig0000008c ),
    .O(\blk00000003/sig0000008e )
  );
  MUXCY   \blk00000003/blk00000033  (
    .CI(\blk00000003/sig0000008a ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000008c ),
    .O(\blk00000003/sig0000008d )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000032  (
    .I0(\blk00000003/sig00000025 ),
    .I1(sig00000003),
    .O(\blk00000003/sig0000008c )
  );
  XORCY   \blk00000003/blk00000031  (
    .CI(\blk00000003/sig00000087 ),
    .LI(\blk00000003/sig00000089 ),
    .O(\blk00000003/sig0000008b )
  );
  MUXCY   \blk00000003/blk00000030  (
    .CI(\blk00000003/sig00000087 ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig00000089 ),
    .O(\blk00000003/sig0000008a )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000002f  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000004),
    .O(\blk00000003/sig00000089 )
  );
  XORCY   \blk00000003/blk0000002e  (
    .CI(\blk00000003/sig00000084 ),
    .LI(\blk00000003/sig00000086 ),
    .O(\blk00000003/sig00000088 )
  );
  MUXCY   \blk00000003/blk0000002d  (
    .CI(\blk00000003/sig00000084 ),
    .DI(NlwRenamedSig_OI_sig00000014),
    .S(\blk00000003/sig00000086 ),
    .O(\blk00000003/sig00000087 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000002c  (
    .I0(NlwRenamedSig_OI_sig00000014),
    .I1(sig00000005),
    .O(\blk00000003/sig00000086 )
  );
  XORCY   \blk00000003/blk0000002b  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .LI(\blk00000003/sig00000083 ),
    .O(\blk00000003/sig00000085 )
  );
  MUXCY   \blk00000003/blk0000002a  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000083 ),
    .O(\blk00000003/sig00000084 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000029  (
    .I0(\blk00000003/sig00000025 ),
    .I1(sig00000006),
    .O(\blk00000003/sig00000083 )
  );
  LUT4 #(
    .INIT ( 16'h758A ))
  \blk00000003/blk00000028  (
    .I0(\blk00000003/sig00000081 ),
    .I1(\blk00000003/sig0000007c ),
    .I2(\blk00000003/sig00000082 ),
    .I3(sig00000001),
    .O(\blk00000003/sig00000080 )
  );
  MUXCY   \blk00000003/blk00000027  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000080 ),
    .O(\blk00000003/sig00000046 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000026  (
    .I0(\blk00000003/sig0000007c ),
    .I1(\blk00000003/sig0000007d ),
    .I2(\blk00000003/sig0000007e ),
    .I3(\blk00000003/sig0000007f ),
    .O(\blk00000003/sig00000074 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000025  (
    .I0(\blk00000003/sig00000078 ),
    .I1(\blk00000003/sig00000079 ),
    .I2(\blk00000003/sig0000007a ),
    .I3(\blk00000003/sig0000007b ),
    .O(\blk00000003/sig00000076 )
  );
  MUXCY   \blk00000003/blk00000024  (
    .CI(\blk00000003/sig00000075 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000076 ),
    .O(\blk00000003/sig00000077 )
  );
  MUXCY   \blk00000003/blk00000023  (
    .CI(\blk00000003/sig00000073 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000074 ),
    .O(\blk00000003/sig00000075 )
  );
  MUXCY   \blk00000003/blk00000022  (
    .CI(\blk00000003/sig00000071 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000072 ),
    .O(\NLW_blk00000003/blk00000022_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk00000021  (
    .CI(\blk00000003/sig0000006f ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000070 ),
    .O(\blk00000003/sig00000071 )
  );
  MUXCY   \blk00000003/blk00000020  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000006e ),
    .O(\blk00000003/sig0000006f )
  );
  MUXCY   \blk00000003/blk0000001f  (
    .CI(\blk00000003/sig0000006c ),
    .DI(\blk00000003/sig00000025 ),
    .S(sig00000002),
    .O(\blk00000003/sig0000006d )
  );
  MUXCY   \blk00000003/blk0000001e  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000006b ),
    .O(\blk00000003/sig0000006c )
  );
  MUXCY   \blk00000003/blk0000001d  (
    .CI(\blk00000003/sig00000068 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000069 ),
    .O(\blk00000003/sig0000006a )
  );
  MUXCY   \blk00000003/blk0000001c  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000067 ),
    .O(\blk00000003/sig00000068 )
  );
  MUXCY   \blk00000003/blk0000001b  (
    .CI(\blk00000003/sig00000066 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000025 ),
    .O(\NLW_blk00000003/blk0000001b_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk0000001a  (
    .CI(\blk00000003/sig00000064 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000065 ),
    .O(\blk00000003/sig00000066 )
  );
  MUXCY   \blk00000003/blk00000019  (
    .CI(\blk00000003/sig00000062 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig00000064 )
  );
  MUXCY   \blk00000003/blk00000018  (
    .CI(NlwRenamedSig_OI_sig00000014),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig00000062 )
  );
  XORCY   \blk00000003/blk00000017  (
    .CI(\blk00000003/sig0000005d ),
    .LI(\blk00000003/sig0000005f ),
    .O(\blk00000003/sig00000060 )
  );
  MUXCY   \blk00000003/blk00000016  (
    .CI(\blk00000003/sig0000005d ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000005f ),
    .O(\NLW_blk00000003/blk00000016_O_UNCONNECTED )
  );
  XORCY   \blk00000003/blk00000015  (
    .CI(\blk00000003/sig0000005a ),
    .LI(\blk00000003/sig0000005c ),
    .O(\blk00000003/sig0000005e )
  );
  MUXCY   \blk00000003/blk00000014  (
    .CI(\blk00000003/sig0000005a ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000005c ),
    .O(\blk00000003/sig0000005d )
  );
  XORCY   \blk00000003/blk00000013  (
    .CI(\blk00000003/sig00000057 ),
    .LI(\blk00000003/sig00000059 ),
    .O(\blk00000003/sig0000005b )
  );
  MUXCY   \blk00000003/blk00000012  (
    .CI(\blk00000003/sig00000057 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000059 ),
    .O(\blk00000003/sig0000005a )
  );
  XORCY   \blk00000003/blk00000011  (
    .CI(\blk00000003/sig00000054 ),
    .LI(\blk00000003/sig00000056 ),
    .O(\blk00000003/sig00000058 )
  );
  MUXCY   \blk00000003/blk00000010  (
    .CI(\blk00000003/sig00000054 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000056 ),
    .O(\blk00000003/sig00000057 )
  );
  XORCY   \blk00000003/blk0000000f  (
    .CI(\blk00000003/sig00000051 ),
    .LI(\blk00000003/sig00000053 ),
    .O(\blk00000003/sig00000055 )
  );
  MUXCY   \blk00000003/blk0000000e  (
    .CI(\blk00000003/sig00000051 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000053 ),
    .O(\blk00000003/sig00000054 )
  );
  XORCY   \blk00000003/blk0000000d  (
    .CI(\blk00000003/sig0000004e ),
    .LI(\blk00000003/sig00000050 ),
    .O(\blk00000003/sig00000052 )
  );
  MUXCY   \blk00000003/blk0000000c  (
    .CI(\blk00000003/sig0000004e ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000050 ),
    .O(\blk00000003/sig00000051 )
  );
  XORCY   \blk00000003/blk0000000b  (
    .CI(\blk00000003/sig0000004b ),
    .LI(\blk00000003/sig0000004d ),
    .O(\blk00000003/sig0000004f )
  );
  MUXCY   \blk00000003/blk0000000a  (
    .CI(\blk00000003/sig0000004b ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000004d ),
    .O(\blk00000003/sig0000004e )
  );
  XORCY   \blk00000003/blk00000009  (
    .CI(\blk00000003/sig00000048 ),
    .LI(\blk00000003/sig0000004a ),
    .O(\blk00000003/sig0000004c )
  );
  MUXCY   \blk00000003/blk00000008  (
    .CI(\blk00000003/sig00000048 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig0000004a ),
    .O(\blk00000003/sig0000004b )
  );
  XORCY   \blk00000003/blk00000007  (
    .CI(\blk00000003/sig00000046 ),
    .LI(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000049 )
  );
  MUXCY   \blk00000003/blk00000006  (
    .CI(\blk00000003/sig00000046 ),
    .DI(\blk00000003/sig00000025 ),
    .S(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000048 )
  );
  VCC   \blk00000003/blk00000005  (
    .P(NlwRenamedSig_OI_sig00000014)
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig00000025 )
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
