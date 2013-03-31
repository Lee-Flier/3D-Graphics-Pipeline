if { [xload xmp cpu_0/cpu_0.xmp] != 0 } {
  exit -1
}
set simulator_bak [xget simulator]
set sim_model_bak [xget sim_model]
xset simulator mti
xset sim_model behavioral
if { [catch {run simmodel} result ] } {
   puts "ERROR: xps failed"
   exit -1
}
xset simulator $simulator_bak
xset sim_model $sim_model_bak
exit 0
