proc pngeninsttemplate {} {
  cd D:/gpu_test_v3_1122_20110621/gpu_test_20110813/cpu_0
  if { [xload xmp cpu_0.xmp] != 0 } {
    return -1
  }
  if { [catch {run mhs2hdl} result] } {
    return -1
  }
  return 0
}
if { [catch {pngeninsttemplate} result] } {
  exit -1
}
exit $result