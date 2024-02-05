
# GTH Transceiver wizard on ZCU102
Verilog code for GTH transceivers wizard on zcu102 in Vivado 2020.1. There are two wizard blocks in the main code. The first one is set for the RF signals and the second for optical signals through a SFP+ module. Note that although both may look like identical blocks in the code, the MGTREF clock is different for both.

The second file is the data block, to write the bit string in the gth and get the signal out. Note that if you want to use both the wizards, you would need 2 copies of the data blocks.
