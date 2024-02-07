#!/bin/bash
module load samtools/1.3
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/notmerged
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.001.bam SRR6464041_ACAACCsorted20.bam SRR6464052_ACAACCsorted20.bam SRR6464058_ACAACCsorted20.bam SRR6464059_ACAACCsorted20.bam SRR6464060_ACAACCsorted20.bam SRR6464061_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.002.bam SRR6464042_ACAACCsorted20.bam SRR6464062_ACAACCsorted20.bam SRR6464063_ACAACCsorted20.bam SRR6464064_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.003.bam SRR6464043_ACAACCsorted20.bam SRR6464044_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.004.bam SRR6464045_ACAACCsorted20.bam SRR6464046_ACAACCsorted20.bam SRR6464047_ACAACCsorted20.bam SRR6464048_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.005.bam SRR6464049_ACAACCsorted20.bam SRR6464050_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.006.bam SRR6464051_ACAACCsorted20.bam SRR6464053_ACAACCsorted20.bam SRR6464054_ACAACCsorted20.bam SRR6464055_ACAACCsorted20.bam SRR6464056_ACAACCsorted20.bam SRR6464057_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.007.bam SRR6464041_ACAGACsorted20.bam SRR6464052_ACAGACsorted20.bam SRR6464058_ACAGACsorted20.bam SRR6464059_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.008.bam SRR6464062_ACAGACsorted20.bam SRR6464063_ACAGACsorted20.bam SRR6464064_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.009.bam SRR6464043_ACAGACsorted20.bam SRR6464044_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.010.bam SRR6464045_ACAGACsorted20.bam SRR6464046_ACAGACsorted20.bam SRR6464048_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.011.bam SRR6464049_ACAGACsorted20.bam SRR6464050_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.012.bam SRR6464051_ACAGACsorted20.bam SRR6464053_ACAGACsorted20.bam SRR6464054_ACAGACsorted20.bam SRR6464055_ACAGACsorted20.bam SRR6464057_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.013.bam SRR6464041_ACTCACsorted20.bam SRR6464052_ACTCACsorted20.bam SRR6464058_ACTCACsorted20.bam SRR6464059_ACTCACsorted20.bam SRR6464060_ACTCACsorted20.bam SRR6464061_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.014.bam SRR6464042_ACTCACsorted20.bam SRR6464062_ACTCACsorted20.bam SRR6464063_ACTCACsorted20.bam SRR6464064_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.015.bam SRR6464043_ACTCACsorted20.bam SRR6464044_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.016.bam SRR6464045_ACTCACsorted20.bam SRR6464046_ACTCACsorted20.bam SRR6464047_ACTCACsorted20.bam SRR6464048_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.017.bam SRR6464049_ACTCACsorted20.bam SRR6464050_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.018.bam SRR6464051_ACTCACsorted20.bam SRR6464053_ACTCACsorted20.bam SRR6464054_ACTCACsorted20.bam SRR6464055_ACTCACsorted20.bam SRR6464056_ACTCACsorted20.bam SRR6464057_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.019.bam SRR6464041_AGAAGGsorted20.bam SRR6464052_AGAAGGsorted20.bam SRR6464058_AGAAGGsorted20.bam SRR6464059_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.020.bam SRR6464043_AGAAGGsorted20.bam SRR6464044_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.021.bam SRR6464045_AGAAGGsorted20.bam SRR6464046_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.022.bam SRR6464049_AGAAGGsorted20.bam SRR6464050_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.023.bam SRR6464051_AGAAGGsorted20.bam SRR6464053_AGAAGGsorted20.bam SRR6464054_AGAAGGsorted20.bam SRR6464055_AGAAGGsorted20.bam SRR6464057_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.024.bam SRR6464041_AGGATGsorted20.bam SRR6464052_AGGATGsorted20.bam SRR6464058_AGGATGsorted20.bam SRR6464059_AGGATGsorted20.bam SRR6464060_AGGATGsorted20.bam SRR6464061_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.025.bam SRR6464042_AGGATGsorted20.bam SRR6464062_AGGATGsorted20.bam SRR6464063_AGGATGsorted20.bam SRR6464064_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.026.bam SRR6464043_AGGATGsorted20.bam SRR6464044_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.027.bam SRR6464045_AGGATGsorted20.bam SRR6464046_AGGATGsorted20.bam SRR6464047_AGGATGsorted20.bam SRR6464048_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.028.bam SRR6464049_AGGATGsorted20.bam SRR6464050_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.029.bam SRR6464051_AGGATGsorted20.bam SRR6464053_AGGATGsorted20.bam SRR6464054_AGGATGsorted20.bam SRR6464055_AGGATGsorted20.bam SRR6464056_AGGATGsorted20.bam SRR6464057_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.030.bam SRR6464041_ATCAAGsorted20.bam SRR6464052_ATCAAGsorted20.bam SRR6464060_ATCAAGsorted20.bam SRR6464061_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.031.bam SRR6464042_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.032.bam SRR6464043_ATCAAGsorted20.bam SRR6464044_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.033.bam SRR6464045_ATCAAGsorted20.bam SRR6464046_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.034.bam SRR6464049_ATCAAGsorted20.bam SRR6464050_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.035.bam SRR6464051_ATCAAGsorted20.bam SRR6464053_ATCAAGsorted20.bam SRR6464057_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.036.bam SRR6464041_ATCGACsorted20.bam SRR6464052_ATCGACsorted20.bam SRR6464058_ATCGACsorted20.bam SRR6464059_ATCGACsorted20.bam SRR6464060_ATCGACsorted20.bam SRR6464061_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.037.bam SRR6464042_ATCGACsorted20.bam SRR6464062_ATCGACsorted20.bam SRR6464063_ATCGACsorted20.bam SRR6464064_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.038.bam SRR6464043_ATCGACsorted20.bam SRR6464044_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.039.bam SRR6464045_ATCGACsorted20.bam SRR6464046_ATCGACsorted20.bam SRR6464047_ATCGACsorted20.bam SRR6464048_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.040.bam SRR6464049_ATCGACsorted20.bam SRR6464050_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.041.bam SRR6464051_ATCGACsorted20.bam SRR6464053_ATCGACsorted20.bam SRR6464054_ATCGACsorted20.bam SRR6464055_ATCGACsorted20.bam SRR6464056_ATCGACsorted20.bam SRR6464057_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.042.bam SRR6464041_CAAGAGsorted20.bam SRR6464052_CAAGAGsorted20.bam SRR6464058_CAAGAGsorted20.bam SRR6464059_CAAGAGsorted20.bam SRR6464060_CAAGAGsorted20.bam SRR6464061_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.043.bam SRR6464042_CAAGAGsorted20.bam SRR6464062_CAAGAGsorted20.bam SRR6464063_CAAGAGsorted20.bam SRR6464064_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.044.bam SRR6464043_CAAGAGsorted20.bam SRR6464044_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.045.bam SRR6464045_CAAGAGsorted20.bam SRR6464046_CAAGAGsorted20.bam SRR6464047_CAAGAGsorted20.bam SRR6464048_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.046.bam SRR6464049_CAAGAGsorted20.bam SRR6464050_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.047.bam SRR6464051_CAAGAGsorted20.bam SRR6464053_CAAGAGsorted20.bam SRR6464054_CAAGAGsorted20.bam SRR6464055_CAAGAGsorted20.bam SRR6464056_CAAGAGsorted20.bam SRR6464057_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.048.bam SRR6464041_CATGACsorted20.bam SRR6464052_CATGACsorted20.bam SRR6464058_CATGACsorted20.bam SRR6464059_CATGACsorted20.bam SRR6464060_CATGACsorted20.bam SRR6464061_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.049.bam SRR6464042_CATGACsorted20.bam SRR6464062_CATGACsorted20.bam SRR6464063_CATGACsorted20.bam SRR6464064_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.050.bam SRR6464043_CATGACsorted20.bam SRR6464044_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.051.bam SRR6464045_CATGACsorted20.bam SRR6464046_CATGACsorted20.bam SRR6464047_CATGACsorted20.bam SRR6464048_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.052.bam SRR6464049_CATGACsorted20.bam SRR6464050_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.053.bam SRR6464051_CATGACsorted20.bam SRR6464053_CATGACsorted20.bam SRR6464054_CATGACsorted20.bam SRR6464055_CATGACsorted20.bam SRR6464056_CATGACsorted20.bam SRR6464057_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.054.bam SRR6464041_CCATAGsorted20.bam SRR6464052_CCATAGsorted20.bam SRR6464058_CCATAGsorted20.bam SRR6464059_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.055.bam SRR6464062_CCATAGsorted20.bam SRR6464063_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.056.bam SRR6464043_CCATAGsorted20.bam SRR6464044_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.057.bam SRR6464045_CCATAGsorted20.bam SRR6464046_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.058.bam SRR6464049_CCATAGsorted20.bam SRR6464050_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.059.bam SRR6464051_CCATAGsorted20.bam SRR6464053_CCATAGsorted20.bam SRR6464054_CCATAGsorted20.bam SRR6464055_CCATAGsorted20.bam SRR6464056_CCATAGsorted20.bam SRR6464057_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.060.bam SRR6464041_CCTTCGsorted20.bam SRR6464052_CCTTCGsorted20.bam SRR6464058_CCTTCGsorted20.bam SRR6464059_CCTTCGsorted20.bam SRR6464060_CCTTCGsorted20.bam SRR6464061_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.061.bam SRR6464042_CCTTCGsorted20.bam SRR6464062_CCTTCGsorted20.bam SRR6464063_CCTTCGsorted20.bam SRR6464064_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.062.bam SRR6464043_CCTTCGsorted20.bam SRR6464044_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.063.bam SRR6464045_CCTTCGsorted20.bam SRR6464046_CCTTCGsorted20.bam SRR6464047_CCTTCGsorted20.bam SRR6464048_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.064.bam SRR6464049_CCTTCGsorted20.bam SRR6464050_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.065.bam SRR6464051_CCTTCGsorted20.bam SRR6464053_CCTTCGsorted20.bam SRR6464054_CCTTCGsorted20.bam SRR6464055_CCTTCGsorted20.bam SRR6464056_CCTTCGsorted20.bam SRR6464057_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.066.bam SRR6464041_CGGTAGsorted20.bam SRR6464052_CGGTAGsorted20.bam SRR6464058_CGGTAGsorted20.bam SRR6464059_CGGTAGsorted20.bam SRR6464060_CGGTAGsorted20.bam SRR6464061_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.067.bam SRR6464042_CGGTAGsorted20.bam SRR6464062_CGGTAGsorted20.bam SRR6464063_CGGTAGsorted20.bam SRR6464064_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.068.bam SRR6464043_CGGTAGsorted20.bam SRR6464044_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.069.bam SRR6464045_CGGTAGsorted20.bam SRR6464046_CGGTAGsorted20.bam SRR6464047_CGGTAGsorted20.bam SRR6464048_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.070.bam SRR6464049_CGGTAGsorted20.bam SRR6464050_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.071.bam SRR6464051_CGGTAGsorted20.bam SRR6464053_CGGTAGsorted20.bam SRR6464054_CGGTAGsorted20.bam SRR6464055_CGGTAGsorted20.bam SRR6464056_CGGTAGsorted20.bam SRR6464057_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.072.bam SRR6464041_CTATTGsorted20.bam SRR6464052_CTATTGsorted20.bam SRR6464058_CTATTGsorted20.bam SRR6464059_CTATTGsorted20.bam SRR6464060_CTATTGsorted20.bam SRR6464061_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.073.bam SRR6464042_CTATTGsorted20.bam SRR6464062_CTATTGsorted20.bam SRR6464063_CTATTGsorted20.bam SRR6464064_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.074.bam SRR6464043_CTATTGsorted20.bam SRR6464044_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.075.bam SRR6464045_CTATTGsorted20.bam SRR6464046_CTATTGsorted20.bam SRR6464047_CTATTGsorted20.bam SRR6464048_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.076.bam SRR6464049_CTATTGsorted20.bam SRR6464050_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.077.bam SRR6464051_CTATTGsorted20.bam SRR6464053_CTATTGsorted20.bam SRR6464054_CTATTGsorted20.bam SRR6464055_CTATTGsorted20.bam SRR6464056_CTATTGsorted20.bam SRR6464057_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.078.bam SRR6464041_CTCAGCsorted20.bam SRR6464052_CTCAGCsorted20.bam SRR6464058_CTCAGCsorted20.bam SRR6464059_CTCAGCsorted20.bam SRR6464060_CTCAGCsorted20.bam SRR6464061_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.079.bam SRR6464042_CTCAGCsorted20.bam SRR6464062_CTCAGCsorted20.bam SRR6464063_CTCAGCsorted20.bam SRR6464064_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.080.bam SRR6464043_CTCAGCsorted20.bam SRR6464044_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.081.bam SRR6464045_CTCAGCsorted20.bam SRR6464046_CTCAGCsorted20.bam SRR6464047_CTCAGCsorted20.bam SRR6464048_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.082.bam SRR6464049_CTCAGCsorted20.bam SRR6464050_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.083.bam SRR6464051_CTCAGCsorted20.bam SRR6464053_CTCAGCsorted20.bam SRR6464054_CTCAGCsorted20.bam SRR6464055_CTCAGCsorted20.bam SRR6464056_CTCAGCsorted20.bam SRR6464057_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.084.bam SRR6464041_GAAGTCsorted20.bam SRR6464052_GAAGTCsorted20.bam SRR6464058_GAAGTCsorted20.bam SRR6464059_GAAGTCsorted20.bam SRR6464060_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.085.bam SRR6464062_GAAGTCsorted20.bam SRR6464063_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.086.bam SRR6464043_GAAGTCsorted20.bam SRR6464044_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.087.bam SRR6464045_GAAGTCsorted20.bam SRR6464046_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.088.bam SRR6464049_GAAGTCsorted20.bam SRR6464050_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.089.bam SRR6464051_GAAGTCsorted20.bam SRR6464053_GAAGTCsorted20.bam SRR6464054_GAAGTCsorted20.bam SRR6464055_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.090.bam SRR6464041_GCATTCsorted20.bam SRR6464052_GCATTCsorted20.bam SRR6464058_GCATTCsorted20.bam SRR6464059_GCATTCsorted20.bam SRR6464060_GCATTCsorted20.bam SRR6464061_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.091.bam SRR6464042_GCATTCsorted20.bam SRR6464062_GCATTCsorted20.bam SRR6464063_GCATTCsorted20.bam SRR6464064_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.092.bam SRR6464043_GCATTCsorted20.bam SRR6464044_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.093.bam SRR6464045_GCATTCsorted20.bam SRR6464046_GCATTCsorted20.bam SRR6464047_GCATTCsorted20.bam SRR6464048_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.094.bam SRR6464049_GCATTCsorted20.bam SRR6464050_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.095.bam SRR6464051_GCATTCsorted20.bam SRR6464053_GCATTCsorted20.bam SRR6464054_GCATTCsorted20.bam SRR6464055_GCATTCsorted20.bam SRR6464056_GCATTCsorted20.bam SRR6464057_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.096.bam SRR6464052_GGTAACsorted20.bam SRR6464059_GGTAACsorted20.bam SRR6464061_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.097.bam SRR6464062_GGTAACsorted20.bam SRR6464063_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.098.bam SRR6464043_GGTAACsorted20.bam SRR6464044_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.099.bam SRR6464045_GGTAACsorted20.bam SRR6464046_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.100.bam SRR6464049_GGTAACsorted20.bam SRR6464050_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.101.bam SRR6464053_GGTAACsorted20.bam SRR6464056_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.102.bam SRR6464041_GTGAGGsorted20.bam SRR6464052_GTGAGGsorted20.bam SRR6464058_GTGAGGsorted20.bam SRR6464059_GTGAGGsorted20.bam SRR6464060_GTGAGGsorted20.bam SRR6464061_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.103.bam SRR6464042_GTGAGGsorted20.bam SRR6464062_GTGAGGsorted20.bam SRR6464063_GTGAGGsorted20.bam SRR6464064_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.104.bam SRR6464043_GTGAGGsorted20.bam SRR6464044_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.105.bam SRR6464045_GTGAGGsorted20.bam SRR6464046_GTGAGGsorted20.bam SRR6464047_GTGAGGsorted20.bam SRR6464048_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.106.bam SRR6464049_GTGAGGsorted20.bam SRR6464050_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.107.bam SRR6464051_GTGAGGsorted20.bam SRR6464053_GTGAGGsorted20.bam SRR6464054_GTGAGGsorted20.bam SRR6464055_GTGAGGsorted20.bam SRR6464056_GTGAGGsorted20.bam SRR6464057_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.108.bam SRR6464041_GTTGAGsorted20.bam SRR6464052_GTTGAGsorted20.bam SRR6464058_GTTGAGsorted20.bam SRR6464059_GTTGAGsorted20.bam SRR6464060_GTTGAGsorted20.bam SRR6464061_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.109.bam SRR6464042_GTTGAGsorted20.bam SRR6464062_GTTGAGsorted20.bam SRR6464063_GTTGAGsorted20.bam SRR6464064_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.110.bam SRR6464043_GTTGAGsorted20.bam SRR6464044_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.111.bam SRR6464045_GTTGAGsorted20.bam SRR6464046_GTTGAGsorted20.bam SRR6464047_GTTGAGsorted20.bam SRR6464048_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.112.bam SRR6464049_GTTGAGsorted20.bam SRR6464050_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.113.bam SRR6464051_GTTGAGsorted20.bam SRR6464053_GTTGAGsorted20.bam SRR6464054_GTTGAGsorted20.bam SRR6464055_GTTGAGsorted20.bam SRR6464056_GTTGAGsorted20.bam SRR6464057_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.114.bam SRR6464041_TATCTCsorted20.bam SRR6464052_TATCTCsorted20.bam SRR6464058_TATCTCsorted20.bam SRR6464059_TATCTCsorted20.bam SRR6464060_TATCTCsorted20.bam SRR6464061_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.115.bam SRR6464042_TATCTCsorted20.bam SRR6464062_TATCTCsorted20.bam SRR6464063_TATCTCsorted20.bam SRR6464064_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.116.bam SRR6464043_TATCTCsorted20.bam SRR6464044_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.117.bam SRR6464045_TATCTCsorted20.bam SRR6464046_TATCTCsorted20.bam SRR6464047_TATCTCsorted20.bam SRR6464048_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.118.bam SRR6464049_TATCTCsorted20.bam SRR6464050_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.119.bam SRR6464051_TATCTCsorted20.bam SRR6464053_TATCTCsorted20.bam SRR6464054_TATCTCsorted20.bam SRR6464055_TATCTCsorted20.bam SRR6464056_TATCTCsorted20.bam SRR6464057_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.120.bam SRR6464041_TCTCTGsorted20.bam SRR6464052_TCTCTGsorted20.bam SRR6464058_TCTCTGsorted20.bam SRR6464059_TCTCTGsorted20.bam SRR6464060_TCTCTGsorted20.bam SRR6464061_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.121.bam SRR6464042_TCTCTGsorted20.bam SRR6464062_TCTCTGsorted20.bam SRR6464063_TCTCTGsorted20.bam SRR6464064_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.122.bam SRR6464043_TCTCTGsorted20.bam SRR6464044_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.123.bam SRR6464045_TCTCTGsorted20.bam SRR6464046_TCTCTGsorted20.bam SRR6464047_TCTCTGsorted20.bam SRR6464048_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.124.bam SRR6464049_TCTCTGsorted20.bam SRR6464050_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.125.bam SRR6464051_TCTCTGsorted20.bam SRR6464053_TCTCTGsorted20.bam SRR6464054_TCTCTGsorted20.bam SRR6464055_TCTCTGsorted20.bam SRR6464056_TCTCTGsorted20.bam SRR6464057_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.126.bam SRR6464041_TGACAGsorted20.bam SRR6464052_TGACAGsorted20.bam SRR6464058_TGACAGsorted20.bam SRR6464059_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.127.bam SRR6464062_TGACAGsorted20.bam SRR6464063_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.128.bam SRR6464043_TGACAGsorted20.bam SRR6464044_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.129.bam SRR6464045_TGACAGsorted20.bam SRR6464046_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.130.bam SRR6464049_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.131.bam SRR6464051_TGACAGsorted20.bam SRR6464053_TGACAGsorted20.bam SRR6464054_TGACAGsorted20.bam SRR6464055_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.132.bam SRR6464041_TGCTGCsorted20.bam SRR6464052_TGCTGCsorted20.bam SRR6464058_TGCTGCsorted20.bam SRR6464059_TGCTGCsorted20.bam SRR6464060_TGCTGCsorted20.bam SRR6464061_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.133.bam SRR6464042_TGCTGCsorted20.bam SRR6464062_TGCTGCsorted20.bam SRR6464063_TGCTGCsorted20.bam SRR6464064_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.134.bam SRR6464043_TGCTGCsorted20.bam SRR6464044_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.135.bam SRR6464045_TGCTGCsorted20.bam SRR6464046_TGCTGCsorted20.bam SRR6464047_TGCTGCsorted20.bam SRR6464048_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.136.bam SRR6464049_TGCTGCsorted20.bam SRR6464050_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.137.bam SRR6464051_TGCTGCsorted20.bam SRR6464053_TGCTGCsorted20.bam SRR6464054_TGCTGCsorted20.bam SRR6464055_TGCTGCsorted20.bam SRR6464056_TGCTGCsorted20.bam SRR6464057_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.138.bam SRR6464041_TGTAGGsorted20.bam SRR6464052_TGTAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.139.bam SRR6464062_TGTAGGsorted20.bam SRR6464063_TGTAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.140.bam SRR6464043_TGTAGGsorted20.bam SRR6464044_TGTAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.141.bam SRR6464045_TGTAGGsorted20.bam SRR6464046_TGTAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.142.bam SRR6464049_TGTAGGsorted20.bam SRR6464050_TGTAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.143.bam SRR6464051_TGTAGGsorted20.bam SRR6464054_TGTAGGsorted20.bam SRR6464055_TGTAGGsorted20.bam
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/notmerged
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.001.bam SRR6464065_ACAACCsorted20.bam SRR6464073_ACAACCsorted20.bam SRR6464074_ACAACCsorted20.bam SRR6464075_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.002.bam SRR6464081_ACAACCsorted20.bam SRR6464082_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.003.bam SRR6464083_ACAACCsorted20.bam SRR6464084_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.004.bam SRR6464076_ACAACCsorted20.bam SRR6464077_ACAACCsorted20.bam SRR6464078_ACAACCsorted20.bam SRR6464079_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.005.bam SRR6464066_ACAACCsorted20.bam SRR6464067_ACAACCsorted20.bam SRR6464068_ACAACCsorted20.bam SRR6464080_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.006.bam SRR6464085_ACAACCsorted20.bam SRR6464086_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.007.bam SRR6464087_ACAACCsorted20.bam SRR6464088_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.008.bam SRR6464070_ACAACCsorted20.bam SRR6464071_ACAACCsorted20.bam SRR6464072_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.009.bam SRR6464076_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.010.bam SRR6464066_ACAGACsorted20.bam SRR6464068_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.011.bam SRR6464085_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.012.bam SRR6464065_ACTCACsorted20.bam SRR6464073_ACTCACsorted20.bam SRR6464074_ACTCACsorted20.bam SRR6464075_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.013.bam SRR6464081_ACTCACsorted20.bam SRR6464082_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.014.bam SRR6464083_ACTCACsorted20.bam SRR6464084_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.015.bam SRR6464076_ACTCACsorted20.bam SRR6464077_ACTCACsorted20.bam SRR6464078_ACTCACsorted20.bam SRR6464079_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.016.bam SRR6464066_ACTCACsorted20.bam SRR6464067_ACTCACsorted20.bam SRR6464068_ACTCACsorted20.bam SRR6464080_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.017.bam SRR6464085_ACTCACsorted20.bam SRR6464086_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.018.bam SRR6464087_ACTCACsorted20.bam SRR6464088_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.019.bam SRR6464070_ACTCACsorted20.bam SRR6464071_ACTCACsorted20.bam SRR6464072_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.020.bam SRR6464079_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.021.bam SRR6464065_AGGATGsorted20.bam SRR6464073_AGGATGsorted20.bam SRR6464074_AGGATGsorted20.bam SRR6464075_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.022.bam SRR6464081_AGGATGsorted20.bam SRR6464082_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.023.bam SRR6464083_AGGATGsorted20.bam SRR6464084_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.024.bam SRR6464076_AGGATGsorted20.bam SRR6464077_AGGATGsorted20.bam SRR6464078_AGGATGsorted20.bam SRR6464079_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.025.bam SRR6464066_AGGATGsorted20.bam SRR6464067_AGGATGsorted20.bam SRR6464068_AGGATGsorted20.bam SRR6464080_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.026.bam SRR6464085_AGGATGsorted20.bam SRR6464086_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.027.bam SRR6464087_AGGATGsorted20.bam SRR6464088_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.028.bam SRR6464070_AGGATGsorted20.bam SRR6464071_AGGATGsorted20.bam SRR6464072_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.029.bam SRR6464076_ATCAAGsorted20.bam SRR6464077_ATCAAGsorted20.bam SRR6464078_ATCAAGsorted20.bam SRR6464079_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.030.bam SRR6464067_ATCAAGsorted20.bam SRR6464068_ATCAAGsorted20.bam SRR6464080_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.031.bam SRR6464071_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.032.bam SRR6464065_ATCGACsorted20.bam SRR6464073_ATCGACsorted20.bam SRR6464074_ATCGACsorted20.bam SRR6464075_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.033.bam SRR6464081_ATCGACsorted20.bam SRR6464082_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.034.bam SRR6464083_ATCGACsorted20.bam SRR6464084_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.035.bam SRR6464076_ATCGACsorted20.bam SRR6464077_ATCGACsorted20.bam SRR6464078_ATCGACsorted20.bam SRR6464079_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.036.bam SRR6464066_ATCGACsorted20.bam SRR6464067_ATCGACsorted20.bam SRR6464068_ATCGACsorted20.bam SRR6464080_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.037.bam SRR6464085_ATCGACsorted20.bam SRR6464086_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.038.bam SRR6464087_ATCGACsorted20.bam SRR6464088_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.039.bam SRR6464069_ATCGACsorted20.bam SRR6464070_ATCGACsorted20.bam SRR6464071_ATCGACsorted20.bam SRR6464072_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.040.bam SRR6464065_CAAGAGsorted20.bam SRR6464073_CAAGAGsorted20.bam SRR6464074_CAAGAGsorted20.bam SRR6464075_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.041.bam SRR6464081_CAAGAGsorted20.bam SRR6464082_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.042.bam SRR6464083_CAAGAGsorted20.bam SRR6464084_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.043.bam SRR6464076_CAAGAGsorted20.bam SRR6464077_CAAGAGsorted20.bam SRR6464078_CAAGAGsorted20.bam SRR6464079_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.044.bam SRR6464066_CAAGAGsorted20.bam SRR6464067_CAAGAGsorted20.bam SRR6464068_CAAGAGsorted20.bam SRR6464080_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.045.bam SRR6464085_CAAGAGsorted20.bam SRR6464086_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.046.bam SRR6464087_CAAGAGsorted20.bam SRR6464088_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.047.bam SRR6464069_CAAGAGsorted20.bam SRR6464070_CAAGAGsorted20.bam SRR6464071_CAAGAGsorted20.bam SRR6464072_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.048.bam SRR6464065_CATGACsorted20.bam SRR6464073_CATGACsorted20.bam SRR6464074_CATGACsorted20.bam SRR6464075_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.049.bam SRR6464081_CATGACsorted20.bam SRR6464082_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.050.bam SRR6464083_CATGACsorted20.bam SRR6464084_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.051.bam SRR6464076_CATGACsorted20.bam SRR6464077_CATGACsorted20.bam SRR6464078_CATGACsorted20.bam SRR6464079_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.052.bam SRR6464066_CATGACsorted20.bam SRR6464067_CATGACsorted20.bam SRR6464068_CATGACsorted20.bam SRR6464080_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.053.bam SRR6464085_CATGACsorted20.bam SRR6464086_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.054.bam SRR6464087_CATGACsorted20.bam SRR6464088_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.055.bam SRR6464069_CATGACsorted20.bam SRR6464070_CATGACsorted20.bam SRR6464071_CATGACsorted20.bam SRR6464072_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.056.bam SRR6464065_CCATAGsorted20.bam SRR6464074_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.057.bam SRR6464083_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.058.bam SRR6464076_CCATAGsorted20.bam SRR6464078_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.059.bam SRR6464066_CCATAGsorted20.bam SRR6464067_CCATAGsorted20.bam SRR6464068_CCATAGsorted20.bam SRR6464080_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.060.bam SRR6464085_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.061.bam SRR6464087_CCATAGsorted20.bam SRR6464088_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.062.bam SRR6464069_CCATAGsorted20.bam SRR6464070_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.063.bam SRR6464065_CCTTCGsorted20.bam SRR6464073_CCTTCGsorted20.bam SRR6464074_CCTTCGsorted20.bam SRR6464075_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.064.bam SRR6464081_CCTTCGsorted20.bam SRR6464082_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.065.bam SRR6464083_CCTTCGsorted20.bam SRR6464084_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.066.bam SRR6464076_CCTTCGsorted20.bam SRR6464077_CCTTCGsorted20.bam SRR6464078_CCTTCGsorted20.bam SRR6464079_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.067.bam SRR6464066_CCTTCGsorted20.bam SRR6464067_CCTTCGsorted20.bam SRR6464068_CCTTCGsorted20.bam SRR6464080_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.068.bam SRR6464085_CCTTCGsorted20.bam SRR6464086_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.069.bam SRR6464087_CCTTCGsorted20.bam SRR6464088_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.070.bam SRR6464069_CCTTCGsorted20.bam SRR6464070_CCTTCGsorted20.bam SRR6464071_CCTTCGsorted20.bam SRR6464072_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.071.bam SRR6464065_CGGTAGsorted20.bam SRR6464073_CGGTAGsorted20.bam SRR6464074_CGGTAGsorted20.bam SRR6464075_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.072.bam SRR6464081_CGGTAGsorted20.bam SRR6464082_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.073.bam SRR6464083_CGGTAGsorted20.bam SRR6464084_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.074.bam SRR6464076_CGGTAGsorted20.bam SRR6464077_CGGTAGsorted20.bam SRR6464078_CGGTAGsorted20.bam SRR6464079_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.075.bam SRR6464066_CGGTAGsorted20.bam SRR6464067_CGGTAGsorted20.bam SRR6464068_CGGTAGsorted20.bam SRR6464080_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.076.bam SRR6464085_CGGTAGsorted20.bam SRR6464086_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.077.bam SRR6464087_CGGTAGsorted20.bam SRR6464088_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.078.bam SRR6464070_CGGTAGsorted20.bam SRR6464071_CGGTAGsorted20.bam SRR6464072_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.079.bam SRR6464065_CTATTGsorted20.bam SRR6464073_CTATTGsorted20.bam SRR6464074_CTATTGsorted20.bam SRR6464075_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.080.bam SRR6464081_CTATTGsorted20.bam SRR6464082_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.081.bam SRR6464083_CTATTGsorted20.bam SRR6464084_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.082.bam SRR6464076_CTATTGsorted20.bam SRR6464077_CTATTGsorted20.bam SRR6464078_CTATTGsorted20.bam SRR6464079_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.083.bam SRR6464066_CTATTGsorted20.bam SRR6464067_CTATTGsorted20.bam SRR6464068_CTATTGsorted20.bam SRR6464080_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.084.bam SRR6464085_CTATTGsorted20.bam SRR6464086_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.085.bam SRR6464087_CTATTGsorted20.bam SRR6464088_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.086.bam SRR6464070_CTATTGsorted20.bam SRR6464071_CTATTGsorted20.bam SRR6464072_CTATTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.087.bam SRR6464065_CTCAGCsorted20.bam SRR6464073_CTCAGCsorted20.bam SRR6464074_CTCAGCsorted20.bam SRR6464075_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.088.bam SRR6464081_CTCAGCsorted20.bam SRR6464082_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.089.bam SRR6464083_CTCAGCsorted20.bam SRR6464084_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.090.bam SRR6464076_CTCAGCsorted20.bam SRR6464077_CTCAGCsorted20.bam SRR6464078_CTCAGCsorted20.bam SRR6464079_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.091.bam SRR6464066_CTCAGCsorted20.bam SRR6464067_CTCAGCsorted20.bam SRR6464068_CTCAGCsorted20.bam SRR6464080_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.092.bam SRR6464085_CTCAGCsorted20.bam SRR6464086_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.093.bam SRR6464087_CTCAGCsorted20.bam SRR6464088_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.094.bam SRR6464069_CTCAGCsorted20.bam SRR6464070_CTCAGCsorted20.bam SRR6464071_CTCAGCsorted20.bam SRR6464072_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.095.bam SRR6464083_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.096.bam SRR6464065_GCATTCsorted20.bam SRR6464073_GCATTCsorted20.bam SRR6464074_GCATTCsorted20.bam SRR6464075_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.097.bam SRR6464081_GCATTCsorted20.bam SRR6464082_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.098.bam SRR6464083_GCATTCsorted20.bam SRR6464084_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.099.bam SRR6464076_GCATTCsorted20.bam SRR6464077_GCATTCsorted20.bam SRR6464078_GCATTCsorted20.bam SRR6464079_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.100.bam SRR6464066_GCATTCsorted20.bam SRR6464067_GCATTCsorted20.bam SRR6464068_GCATTCsorted20.bam SRR6464080_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.101.bam SRR6464085_GCATTCsorted20.bam SRR6464086_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.102.bam SRR6464087_GCATTCsorted20.bam SRR6464088_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.103.bam SRR6464069_GCATTCsorted20.bam SRR6464070_GCATTCsorted20.bam SRR6464071_GCATTCsorted20.bam SRR6464072_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.104.bam SRR6464067_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.105.bam SRR6464065_GTGAGGsorted20.bam SRR6464073_GTGAGGsorted20.bam SRR6464074_GTGAGGsorted20.bam SRR6464075_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.106.bam SRR6464081_GTGAGGsorted20.bam SRR6464082_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.107.bam SRR6464083_GTGAGGsorted20.bam SRR6464084_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.108.bam SRR6464076_GTGAGGsorted20.bam SRR6464077_GTGAGGsorted20.bam SRR6464078_GTGAGGsorted20.bam SRR6464079_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.109.bam SRR6464066_GTGAGGsorted20.bam SRR6464067_GTGAGGsorted20.bam SRR6464068_GTGAGGsorted20.bam SRR6464080_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.110.bam SRR6464085_GTGAGGsorted20.bam SRR6464086_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.111.bam SRR6464087_GTGAGGsorted20.bam SRR6464088_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.112.bam SRR6464069_GTGAGGsorted20.bam SRR6464070_GTGAGGsorted20.bam SRR6464071_GTGAGGsorted20.bam SRR6464072_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.113.bam SRR6464065_GTTGAGsorted20.bam SRR6464073_GTTGAGsorted20.bam SRR6464074_GTTGAGsorted20.bam SRR6464075_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.114.bam SRR6464081_GTTGAGsorted20.bam SRR6464082_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.115.bam SRR6464083_GTTGAGsorted20.bam SRR6464084_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.116.bam SRR6464076_GTTGAGsorted20.bam SRR6464077_GTTGAGsorted20.bam SRR6464078_GTTGAGsorted20.bam SRR6464079_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.117.bam SRR6464066_GTTGAGsorted20.bam SRR6464067_GTTGAGsorted20.bam SRR6464068_GTTGAGsorted20.bam SRR6464080_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.118.bam SRR6464085_GTTGAGsorted20.bam SRR6464086_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.119.bam SRR6464087_GTTGAGsorted20.bam SRR6464088_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.120.bam SRR6464069_GTTGAGsorted20.bam SRR6464070_GTTGAGsorted20.bam SRR6464071_GTTGAGsorted20.bam SRR6464072_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.121.bam SRR6464065_TATCTCsorted20.bam SRR6464073_TATCTCsorted20.bam SRR6464074_TATCTCsorted20.bam SRR6464075_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.122.bam SRR6464081_TATCTCsorted20.bam SRR6464082_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.123.bam SRR6464083_TATCTCsorted20.bam SRR6464084_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.124.bam SRR6464076_TATCTCsorted20.bam SRR6464077_TATCTCsorted20.bam SRR6464078_TATCTCsorted20.bam SRR6464079_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.125.bam SRR6464066_TATCTCsorted20.bam SRR6464067_TATCTCsorted20.bam SRR6464068_TATCTCsorted20.bam SRR6464080_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.126.bam SRR6464085_TATCTCsorted20.bam SRR6464086_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.127.bam SRR6464087_TATCTCsorted20.bam SRR6464088_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.128.bam SRR6464069_TATCTCsorted20.bam SRR6464070_TATCTCsorted20.bam SRR6464071_TATCTCsorted20.bam SRR6464072_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.129.bam SRR6464065_TCTCTGsorted20.bam SRR6464073_TCTCTGsorted20.bam SRR6464074_TCTCTGsorted20.bam SRR6464075_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.130.bam SRR6464081_TCTCTGsorted20.bam SRR6464082_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.131.bam SRR6464083_TCTCTGsorted20.bam SRR6464084_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.132.bam SRR6464076_TCTCTGsorted20.bam SRR6464077_TCTCTGsorted20.bam SRR6464078_TCTCTGsorted20.bam SRR6464079_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.133.bam SRR6464066_TCTCTGsorted20.bam SRR6464067_TCTCTGsorted20.bam SRR6464068_TCTCTGsorted20.bam SRR6464080_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.134.bam SRR6464085_TCTCTGsorted20.bam SRR6464086_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.135.bam SRR6464087_TCTCTGsorted20.bam SRR6464088_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.136.bam SRR6464069_TCTCTGsorted20.bam SRR6464070_TCTCTGsorted20.bam SRR6464071_TCTCTGsorted20.bam SRR6464072_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.137.bam SRR6464081_TGACAGsorted20.bam SRR6464082_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.138.bam SRR6464087_TGACAGsorted20.bam SRR6464088_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.139.bam SRR6464065_TGCTGCsorted20.bam SRR6464074_TGCTGCsorted20.bam SRR6464075_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.140.bam SRR6464081_TGCTGCsorted20.bam SRR6464082_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.141.bam SRR6464084_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.142.bam SRR6464076_TGCTGCsorted20.bam SRR6464077_TGCTGCsorted20.bam SRR6464078_TGCTGCsorted20.bam SRR6464079_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.143.bam SRR6464066_TGCTGCsorted20.bam SRR6464067_TGCTGCsorted20.bam SRR6464068_TGCTGCsorted20.bam SRR6464080_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.144.bam SRR6464085_TGCTGCsorted20.bam SRR6464086_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.145.bam SRR6464088_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.146.bam SRR6464069_TGCTGCsorted20.bam SRR6464070_TGCTGCsorted20.bam SRR6464071_TGCTGCsorted20.bam SRR6464072_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.147.bam SRR6464075_TGTAGGsorted20.bam
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/notmerged
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.001.bam SRR6464089_ACAACCsorted20.bam SRR6464091_ACAACCsorted20.bam SRR6464092_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.002.bam SRR6464090_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.003.bam SRR6464093_ACAACCsorted20.bam SRR6464094_ACAACCsorted20.bam SRR6464095_ACAACCsorted20.bam SRR6464096_ACAACCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.004.bam SRR6464089_ACAGACsorted20.bam SRR6464091_ACAGACsorted20.bam SRR6464092_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.005.bam SRR6464090_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.006.bam SRR6464093_ACAGACsorted20.bam SRR6464094_ACAGACsorted20.bam SRR6464095_ACAGACsorted20.bam SRR6464096_ACAGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.007.bam SRR6464089_ACTCACsorted20.bam SRR6464091_ACTCACsorted20.bam SRR6464092_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.008.bam SRR6464090_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.009.bam SRR6464093_ACTCACsorted20.bam SRR6464094_ACTCACsorted20.bam SRR6464095_ACTCACsorted20.bam SRR6464096_ACTCACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.010.bam SRR6464089_AGAAGGsorted20.bam SRR6464091_AGAAGGsorted20.bam SRR6464092_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.011.bam SRR6464090_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.012.bam SRR6464093_AGAAGGsorted20.bam SRR6464096_AGAAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.013.bam SRR6464089_AGGATGsorted20.bam SRR6464091_AGGATGsorted20.bam SRR6464092_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.014.bam SRR6464090_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.015.bam SRR6464093_AGGATGsorted20.bam SRR6464094_AGGATGsorted20.bam SRR6464095_AGGATGsorted20.bam SRR6464096_AGGATGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.016.bam SRR6464089_ATCAAGsorted20.bam SRR6464091_ATCAAGsorted20.bam SRR6464092_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.017.bam SRR6464090_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.018.bam SRR6464093_ATCAAGsorted20.bam SRR6464094_ATCAAGsorted20.bam SRR6464095_ATCAAGsorted20.bam SRR6464096_ATCAAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.019.bam SRR6464089_ATCGACsorted20.bam SRR6464091_ATCGACsorted20.bam SRR6464092_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.020.bam SRR6464090_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.021.bam SRR6464093_ATCGACsorted20.bam SRR6464094_ATCGACsorted20.bam SRR6464095_ATCGACsorted20.bam SRR6464096_ATCGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.022.bam SRR6464089_CAAGAGsorted20.bam SRR6464091_CAAGAGsorted20.bam SRR6464092_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.023.bam SRR6464090_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.024.bam SRR6464093_CAAGAGsorted20.bam SRR6464094_CAAGAGsorted20.bam SRR6464095_CAAGAGsorted20.bam SRR6464096_CAAGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.025.bam SRR6464089_CATGACsorted20.bam SRR6464091_CATGACsorted20.bam SRR6464092_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.026.bam SRR6464090_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.027.bam SRR6464093_CATGACsorted20.bam SRR6464094_CATGACsorted20.bam SRR6464095_CATGACsorted20.bam SRR6464096_CATGACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.028.bam SRR6464096_CCATAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.029.bam SRR6464089_CCTTCGsorted20.bam SRR6464091_CCTTCGsorted20.bam SRR6464092_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.030.bam SRR6464090_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.031.bam SRR6464093_CCTTCGsorted20.bam SRR6464094_CCTTCGsorted20.bam SRR6464095_CCTTCGsorted20.bam SRR6464096_CCTTCGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.032.bam SRR6464089_CGGTAGsorted20.bam SRR6464091_CGGTAGsorted20.bam SRR6464092_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.033.bam SRR6464090_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.034.bam SRR6464093_CGGTAGsorted20.bam SRR6464094_CGGTAGsorted20.bam SRR6464095_CGGTAGsorted20.bam SRR6464096_CGGTAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.035.bam SRR6464089_CTCAGCsorted20.bam SRR6464091_CTCAGCsorted20.bam SRR6464092_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.036.bam SRR6464090_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.037.bam SRR6464093_CTCAGCsorted20.bam SRR6464094_CTCAGCsorted20.bam SRR6464095_CTCAGCsorted20.bam SRR6464096_CTCAGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.038.bam SRR6464094_GAAGTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.039.bam SRR6464089_GCATTCsorted20.bam SRR6464091_GCATTCsorted20.bam SRR6464092_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.040.bam SRR6464090_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.041.bam SRR6464093_GCATTCsorted20.bam SRR6464094_GCATTCsorted20.bam SRR6464095_GCATTCsorted20.bam SRR6464096_GCATTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.042.bam SRR6464089_GGTAACsorted20.bam SRR6464091_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.043.bam SRR6464090_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.044.bam SRR6464093_GGTAACsorted20.bam SRR6464096_GGTAACsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.045.bam SRR6464089_GTGAGGsorted20.bam SRR6464091_GTGAGGsorted20.bam SRR6464092_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.046.bam SRR6464090_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.047.bam SRR6464093_GTGAGGsorted20.bam SRR6464094_GTGAGGsorted20.bam SRR6464095_GTGAGGsorted20.bam SRR6464096_GTGAGGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.048.bam SRR6464089_GTTGAGsorted20.bam SRR6464091_GTTGAGsorted20.bam SRR6464092_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.049.bam SRR6464090_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.050.bam SRR6464093_GTTGAGsorted20.bam SRR6464094_GTTGAGsorted20.bam SRR6464095_GTTGAGsorted20.bam SRR6464096_GTTGAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.051.bam SRR6464089_TATCTCsorted20.bam SRR6464091_TATCTCsorted20.bam SRR6464092_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.052.bam SRR6464090_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.053.bam SRR6464093_TATCTCsorted20.bam SRR6464094_TATCTCsorted20.bam SRR6464095_TATCTCsorted20.bam SRR6464096_TATCTCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.054.bam SRR6464089_TCTCTGsorted20.bam SRR6464091_TCTCTGsorted20.bam SRR6464092_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.055.bam SRR6464090_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.056.bam SRR6464093_TCTCTGsorted20.bam SRR6464094_TCTCTGsorted20.bam SRR6464095_TCTCTGsorted20.bam SRR6464096_TCTCTGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.057.bam SRR6464089_TGACAGsorted20.bam SRR6464091_TGACAGsorted20.bam SRR6464092_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.058.bam SRR6464090_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.059.bam SRR6464093_TGACAGsorted20.bam SRR6464094_TGACAGsorted20.bam SRR6464095_TGACAGsorted20.bam SRR6464096_TGACAGsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.060.bam SRR6464089_TGCTGCsorted20.bam SRR6464091_TGCTGCsorted20.bam SRR6464092_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.061.bam SRR6464090_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.062.bam SRR6464093_TGCTGCsorted20.bam SRR6464094_TGCTGCsorted20.bam SRR6464095_TGCTGCsorted20.bam SRR6464096_TGCTGCsorted20.bam
samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.063.bam SRR6464091_TGTAGGsorted20.bam
