
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "FIR" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -122,-97,-68,-36,0,41,89,142,201,266,335,408,480,550,615,669,709,730,727,697,633,534,396,218,0,-257,-551,-876,-1225,-1591,-1963,-2329,-2675,-2987,-3251,-3448,-3565,-3585,-3493,-3276,-2923,-2424,-1772,-964,0,1117,2380,3779,5298,6921,8626,10389,12185,13986,15762,17483,19120,20644,22028,23246,24275,25097,25695,26059,26181,26059,25695,25097,24275,23246,22028,20644,19120,17483,15762,13986,12185,10389,8626,6921,5298,3779,2380,1117,0,-964,-1772,-2424,-2923,-3276,-3493,-3585,-3565,-3448,-3251,-2987,-2675,-2329,-1963,-1591,-1225,-876,-551,-257,0,218,396,534,633,697,727,730,709,669,615,550,480,408,335,266,201,142,89,41,0,-36,-68,-97,-122
// chanpats: 173
// name: FIR
// filter_type: 0
// rate_change: 0
// interp_rate: 1
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 129
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 16
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 0
// output_width: 36
// output_fract_width: 0
// config_method: 0

const double FIR_coefficients[129] = {-122,-97,-68,-36,0,41,89,142,201,266,335,408,480,550,615,669,709,730,727,697,633,534,396,218,0,-257,-551,-876,-1225,-1591,-1963,-2329,-2675,-2987,-3251,-3448,-3565,-3585,-3493,-3276,-2923,-2424,-1772,-964,0,1117,2380,3779,5298,6921,8626,10389,12185,13986,15762,17483,19120,20644,22028,23246,24275,25097,25695,26059,26181,26059,25695,25097,24275,23246,22028,20644,19120,17483,15762,13986,12185,10389,8626,6921,5298,3779,2380,1117,0,-964,-1772,-2424,-2923,-3276,-3493,-3585,-3565,-3448,-3251,-2987,-2675,-2329,-1963,-1591,-1225,-876,-551,-257,0,218,396,534,633,697,727,730,709,669,615,550,480,408,335,266,201,142,89,41,0,-36,-68,-97,-122};

const xip_fir_v7_2_pattern FIR_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_FIR_config() {
  xip_fir_v7_2_config config;
  config.name                = "FIR";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &FIR_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 129;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = FIR_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_FULL_PRECISION;
  config.output_width        = 36;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config FIR_config = gen_FIR_config();

