-makelib ies/xil_defaultlib -sv \
  "E:/Softwares/Vivado/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "E:/Softwares/Vivado/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xbip_utils_v3_0_7 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/axi_utils_v2_0_3 \
  "../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies/fir_compiler_v7_2_7 \
  "../../../ipstatic/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../Design/IP_Core/FIR/FIR/sim/FIR.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

