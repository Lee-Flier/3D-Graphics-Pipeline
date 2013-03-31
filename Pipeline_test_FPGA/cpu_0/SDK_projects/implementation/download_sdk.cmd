setMode -bscan
setCable -p auto
identify
assignfile -p 5 -file ./SDK_projects/implementation/download_sdk.bit
program -p 5
quit
