cd D:/xiao/test/cpu_0
if { [xload new cpu_0.xmp] != 0 } {
  exit -1
}
xset arch virtex5
xset dev xc5vlx110t
xset package ff1136
xset speedgrade -1
if { "unspecified" != "unspecified" } {
   xset hier unspecified
}
set xpsArch [xget arch]
if { ! [ string equal -nocase $xpsArch "virtex5" ] } {
   puts "Device Family setting in XPS ($xpsArch) does not match Device Family setting in ISE (virtex5)"
   exit -1
}
set xpsDev [xget dev]
if { ! [ string equal -nocase $xpsDev "xc5vlx110t" ] } {
   puts "Device setting in XPS ($xpsDev) does not match Device setting in ISE (xc5vlx110t)"
   exit -1
}
set xpsPkg [xget package]
if { ! [ string equal -nocase $xpsPkg "ff1136" ] } {
   puts "Package setting in XPS ($xpsPkg) does not match Package setting in ISE (ff1136)"
   exit -1
}
set xpsSpd [xget speedgrade]
if { ! [ string equal -nocase $xpsSpd "-1" ] } {
   puts "Speed Grade setting in XPS ($xpsSpd) does not match Speed Grade setting in ISE (-1)"
   exit -1
}
xset topinst cpu_0_i
xset hdl verilog
xset intstyle ise
save proj
exit
