NVIDIA Firmware Update Utility (Version 5.427.0)
Simplified Version For OEM Only
Copyright (C) 1993-2017, NVIDIA Corporation. All rights reserved.

This version adds support for:

DRIVE PX 2 AutoChauffeur
Quadro GV100
Quadro P500
TITAN V 
Tesla V100-FHHL-16GB


Build Information
  - Build Date: Dec 18 2017
  - Build Time: 13:28:01
  - Build CL: 23298568

-- Primary Commands --
Update VBIOS firmware:           nvflash [options] <filename>
Save VBIOS firmware to file:     nvflash [options] --save <filename>
Display firmware bytes:          nvflash [options] --display [bytes]
Check for supported EEPROM:      nvflash [options] --check
Display VBIOS version:           nvflash [options] --version [<filename>]
List adapters:                   nvflash [options] --list
Compare adapter firmware:        nvflash [options] --compare <filename>
Verify adapter firmware:         nvflash [options] --verify <filename>
Verify adapter IFR firmware:     nvflash [options] --verify --ifronly <filename>
Display GPU ECID:                nvflash [options] --ecid
Display License information:     nvflash [options] --licinfo <filename>
Generate a License Request File: nvflash [options] --licreq <filename>,<reqType>
Provide a HULK license file:     nvflash [options] --license <filename>
List out all the PCI devices:    nvflash [options] --lspci
Access PCI Configure register:   nvflash [options] --setpci
Display Build information:       nvflash [options] --buildinfo
Display MCU version:             nvflash [options] --querygmac
Update MCU firmware:             nvflash [options] --proggmac
Save MCU firmware to file:       nvflash [options] --savegmac
List MCUs:                       nvflash [options] --listgmac
Write protect EEPROM:            nvflash [options] --protecton
Remove write protect:            nvflash [options] --protectoff

Update Inforom firmware:         nvflash [options] --flashinforom <filename>.ifr
Save Inforom firmware to file:   nvflash [options] --save <filename>.ifr
Backup InfoROM to embedded IB:   nvflash [options] --backupinforom
Restore InfoROM from embedded IB:nvflash [options] --recoverinforom
Read Inforom OBD info to file:   nvflash [options] --rdobd <filename>
Read Inforom OEM info to file:   nvflash [options] --rdoem <filename>
Update Inforom OEM info:         nvflash [options] --wroem <filename>
Read uGPU license file to file:  nvflash [options] --rdulf <filename>
Update uGPU license file to IR:  nvflash [options] --wrulf <filename>
Display help screen for LIC OP:  nvflash [options] --lichelp
Read HULK license file to file:  nvflash [options] --rdhlk <filename>
Update HULK license file to IR:  nvflash [options] --wrhlk <filename>
Flash a license file:            nvflash [options] --licflash <filename>
Read UPR object to file:         nvflash [options] --rdupr <filename>
Flash a UPR file:                nvflash [options] --wrupr <compute|graphics>.upr
List the GPU mode:               nvflash [options] --listgpumodes
Set the GPU mode to graphics:    nvflash [options] --gpumode graphics
Set the GPU mode to compute:     nvflash [options] --gpumode compute
Add a power policy entry:        nvflash [options] --addpp TGP limitRated 250000
Delete a power policy:           nvflash [options] --delpp TGP limitRated
List all current power policies: nvflash [options] --listpp

-- Commands and Options -- 
help            ? [pp]             Display help screen. pp for additional
                                   help on power policies descriptions.
save            b <filename>       Read EEPROM and save to <filename>.
compare         k <filename>       Read EEPROM and compare with <filename>.
verify          h <filename>       Verify <filename> matches EEPROM if flashed.
version         v <filename>       Display firmware version information
                                   (if no filename, acts on display adapter).
check           c                  Check for supported EEPROM.
list            a                  List all NVIDIA display adapters found in
                                   the system.
protecton       w                  Write protect EEPROM (only on some EEPROM's)
protectoff      r                  Remove EEPROM write protect (only on some
                                   EEPROM's).
                                   
license           <license file>   Provide a license file for updating VBIOS.
licinfo                            Display license file content. license file
                                   is provided by --license option.
                                   
ecid                               Display GPU ECID. 
licreq            <file>,<reqType> Generate a License Request File by
                                   specifying <reqType> to submit to Nvidia.
                                   
lspci                              List all the PCI devices in the system.
setpci            <R.W>[=D[:M]]    Read/Write PCI Config register.
    Format is: <REG.WIDTH>[=DATA[:MASK]]
    Read  operation: <REG.WIDTH>
    Write operation: <REG.WIDTH>=DATA[:MASK]
                                   
proggmac          <filename>       Flash the application image to GMAC MCU.
savegmac          <filename>       Read back the GMAC application image and
                                   save to <filename>.
                                   
listgmac                           List all the GMAC devices in the system
querygmac         [<filename>]     Display the GMAC application version
                                   (if no filename, acts on display adapter).
                                   
buildinfo                          Display build information for this tool.
display         d [bytes]          Display 256 the first bytes of the EEPROM
                                   (default is 256 bytes).
                                   
createlic                          Create the License placeholder.
updateuefi      u <filename>       Update only the UEFI portion of the ROM 
                                   image from <filename>.
                                   
fullrecovery      [foldername]     Auto full recovery ROM from the backups.
gpumode           graphics|compute Set the GPU mode to be either graphics or compute.
listgpumodes                       List the GPU mode of all NVIDIA adapters in the system.
addpp             <policy> attr V  Add a power policy. See '--help pp' for more details.
delpp             <policy> attr    Delete a power policy. See '--help pp' for more details.
listpp                             List all current power policies. See '--help pp' for more details.
flashinforom      <filename>       Flash InfoROM with data from <filename>.
backupinforom                      Backup InfoROM data to the embedded recovery
                                   image.
                                   
recoverinforom  R                  Restore InfoROM from embedded recovery image.
licflash          <filename>       Flash a license file.
lichelp                            Display help screen for license operations.
rdhlk             <filename>       Read HULK license file object to file.
wrhlk             <filename>       Install unlock license into EEPROM.
rdoem             <filename>       Read OEM object to <filename>.
wroem             <filename>       Write OEM object from <filename> to Inforom.
rdulf             <filename>       Read uGPU license file object to file.
wrulf             <filename>       Write uGPU license file object from file to Inforom.
rdupr             <filename>       Read uGPU Personality Request object to file.
wrupr             <filename>       Write uGPU Personality Request from file to Inforom.
rdobd             <filename> [csv] Read OBD object to <filename> with optional csv format.
rmhlk                              Erase contents of the HULK object
skipmcuidchecks                    Allow to skip the IDs mismatch when flash MCU to an non-generic image.
offsysplxfilter                    Turn off system PLX bridge device filtering.
outfilepath       <output path>    Specify the location where the output file
                                   should be saved. Works only with commands
                                   '--gpumode' and '--listgpumodes'.
mergeinforom                       Merge InfoROM block if required.
reboot          y                  Reboot the PC after other tasks completed.
filterdevid     f <value>[,<mask>] Filter device list by device ID and optional
                                   mask.
                                   
reversefilterid U <value>          Remove item from the device ID list if
                                   specified device ID is matched.
                                   
upgradeonly                        Only allow upgrading of firmware based on
                                   version.
                                   
overridesub     6                  Allow firmware and adapter PCI subsystem ID
                                   mismatch.
                                   
index           i <index>          Force a specific device index.
pcisegbus       B [<seg#>:]<bus#>: Select a specific device by using a specified
                                   segment# and bus#. The following format
                                   is allowed, <seg#>:<bus#>:<dev#>.<func#>.
                                   All numbers are hexadecimal. The segment#
                                   can be optional, and has a default value(0)
                                   if no input value.The dev# and the func# 
                                   can be omitted for the --pcisegbus command.
auto            A                  When possible, execute the specified command
                                   without user intervention.
silence         s                  Silence all audio beeps.
beep            !                  Beep to signal updating progress.
nolight         l                  Do not light keyboard LEDs.
override        o <level>          Override safety check level:
   default  unknown EEPROM | NV adapter aborts application.
   level=1  unknown EEPROM acceptable for read operations.
   level=2  unknown NV adapter acceptable for read operations.
   level=3  Combined effect of 1,2 (cannot write to unknown EEPROM or adapter).
                                   
log             L <log file>       Create a log file in truncat mode ( or add option --append in append mode )
nopowerchk      p                  Skip power level check.
offswdriver     S                  Turn off automatic switch driver state.
append                             Write log file in append mode.
guidcheck         <GUID>           Check if Build GUID match with VBIOS image
                                   before proceeding.
fullbackup        [foldername]     Backup the existing ROM from display
                                   adapter prior to flash.

Use a single dash ("-") to use the single letter version of a command.
Use a double dash ("--") to use the longer descriptive version of a command.
Use equals ("=") to specify parameters, with separating commas (",").

-- Sample Usage --
nvflash --index=1 nv30nz.rom
-- Supported EEPROM's --
Atmel      AT24CM02 2048Kx1S     1.7-5.5V, 256B page,  4k blk, ID=(00,10F5)
  AMD    AM29LV001B  128Kx8         2.7vV,   1B page, 16k blk, ID=(01,006D)
  AMD     AM29LV010  128Kx8         2.7vV,   1B page, 16k blk, ID=(01,006E)
  AMD    AM29LV001T  128Kx8         2.7vV,   1B page, 16k blk, ID=(01,00ED)
   CY     S25FS064S 65536Kx1S   1.65-1.95V, 256B page, 64k blk, ID=(01,0217)
   CY     S25FL208K 8192Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(01,4014)
Atmel      AT49F512   64Kx8  5.0,3.0,2.7V,   1B page,  0k blk, ID=(1F,0003)
Atmel     AT49F001T  128Kx8          5.0V,   1B page,  0k blk, ID=(1F,0004)
Atmel      AT49F001  128Kx8          5.0V,   1B page,  0k blk, ID=(1F,0005)
Atmel  AT49BV/LV010  128Kx8      2.7-3.6V,   1B page,  0k blk, ID=(1F,0017)
Atmel AT29LV/BV010A  128Kx8          3.0V, 128B page,  0k blk, ID=(1F,0035)
Atmel     AT29LV512   64Kx8          3.0V, 128B page,  0k blk, ID=(1F,003D)
Atmel     AT25F1024 1024Kx1S     2.7-3.6V, 256B page, 32k blk, ID=(1F,0040)
Atmel      AT29C512   64Kx8          5.0V, 128B page,  0k blk, ID=(1F,005D)
Atmel     AT25F1024 1024Kx1S     2.7-3.6V, 256B page, 32k blk, ID=(1F,0060)
Atmel     AT25F2048 2048Kx1S     2.7-3.6V, 256B page, 64k blk, ID=(1F,0063)
Atmel      AT25F512  512Kx1S     2.7-3.6V, 128B page, 32k blk, ID=(1F,0065)
Atmel      AT49F010  128Kx8          5.0V,   1B page,  0k blk, ID=(1F,0087)
Atmel     AT29C010A  128Kx8          5.0V, 128B page,  0k blk, ID=(1F,00D5)
Atmel     AT25DF021 2048Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(1F,4300)
Adest    AT25DF021A 2048Kx1S    1.65-3.6V, 256B page,  4k blk, ID=(1F,4301)
Atmel     AT25DF041 4096Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(1F,4401)
Adest    AT25DF041B 4096Kx1S    1.65-3.6V, 256B page,  4k blk, ID=(1F,4402)
Adest     AT25DL081 8192Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(1F,4502)
Atmel     AT25FS010 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(1F,6601)
Atmel     AT25SF041 4096Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(1F,8401)
   ST        M25P05  512Kx1S     2.7-3.6V, 128B page, 32k blk, ID=(20,0005)
   ST        M25P10 1024Kx1S     2.7-3.6V, 128B page, 32k blk, ID=(20,0010)
   ST      M29W512B   64Kx8      2.7-3.6V,   1B page,  0k blk, ID=(20,0027)
  Num      M25P10-A 1024Kx1S     2.3-3.6V, 256B page, 32k blk, ID=(20,2011)
  Num        M25P20 2048Kx1S     2.3-3.6V, 256B page, 64k blk, ID=(20,2012)
   MU   N25Q016A11E 16384Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(20,BB15)
 AMIC       A25L512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(37,3010)
 AMIC       A25L010 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(37,3011)
 AMIC       A25L020 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(37,3012)
 AMIC       A25L040 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(37,3013)
uChip      25AA320A    4Kx8S     1.8-5.5V,  32B page,  0k blk, ID=(47,8747)
 XLNX XCF128XFTG64C 8192Kx16 9.5,8.5,2.0,1.7V,   8B page, 128k blk, ID=(49,016B)
 Tenx      ICE25P05  512Kx1S     2.7-3.6V, 128B page, 32k blk, ID=(5E,0001)
  PMC     Pm25LD512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(7F,9D20)
  PMC     Pm25LD010 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(7F,9D21)
  PMC     Pm25LD020 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(7F,9D22)
  PMC     Pm25LQ020 2048Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(7F,9D42)
  PMC     Pm25LQ040 4096Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(7F,9D43)
  PMC     Pm25LV020 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(7F,9D7D)
  PMC     Pm25LV040 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(7F,9D7E)
 PUYA       P25Q40L 4096Kx1S      1.65-2V, 256B page,  4k blk, ID=(85,6013)
  PMC     Pm39LV512   64Kx8      3.0-3.6V,   1B page,  4k blk, ID=(9D,001B)
  PMC     Pm39LV010  128Kx8      3.0-3.6V,   1B page,  4k blk, ID=(9D,001C)
  PMC     Pm25LV512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(9D,007B)
  PMC     Pm25LV010 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(9D,007C)
 ISSI     IS25WQ020 2048Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(9D,1152)
 ISSI     IS25WQ040 4096Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(9D,1253)
 ISSI     IS25WP080 8192Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(9D,7014)
   FM       FM25F02 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(A1,3112)
   FM       FM25F04 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(A1,3113)
  SST    SST29EE010  128Kx8          5.0V, 128B page,  0k blk, ID=(BF,0007)
  SST SST29LE/VE010  128Kx8      2.9,2.7V, 128B page,  0k blk, ID=(BF,0008)
  SST SST29LE/VE512   64Kx8      2.9,2.7V, 128B page,  0k blk, ID=(BF,003D)
  SST    SST45VF010 1024Kx1S     3.0-3.6V,   1B page,  4k blk, ID=(BF,0042)
  SST    SST25LF020 2048Kx1S     3.0-3.6V, 256B page,  4k blk, ID=(BF,0043)
  SST    SST25LF040 4096Kx1S     3.0-3.6V, 256B page,  4k blk, ID=(BF,0044)
  SST    SST25VF512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(BF,0048)
  SST    SST25VF010 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(BF,0049)
  SST    SST29EE512   64Kx8          5.0V, 128B page,  0k blk, ID=(BF,005D)
  SST    SST39SF010  128Kx8          5.0V,   1B page,  4k blk, ID=(BF,00B5)
  SST    SST39VF512   64Kx8      2.7-3.6V,   1B page,  4k blk, ID=(BF,00D4)
  SST    SST39VF010  128Kx8      2.7-3.6V,   1B page,  4k blk, ID=(BF,00D5)
  SST   SST25VF020B 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(BF,258C)
uChip   SST26WF080B 8192Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(BF,2658)
   MX     MX29F001T  128Kx8          5.0V,   1B page,  0k blk, ID=(C2,0018)
   MX     MX29F001B  128Kx8          5.0V,   1B page,  0k blk, ID=(C2,0019)
   MX      MX25L512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C2,2010)
   MX     MX25L1005 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C2,2011)
   MX     MX25L2005 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C2,2012)
   MX    MX25L4005A 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C2,2013)
   MX    MX25L8073E 8192Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C2,2014)
   MX    MX25U2033E 2048Kx1S    1.65-2.0V, 256B page,  4k blk, ID=(C2,2532)
   MX    MX25U4033E 4096Kx1S    1.65-2.0V, 256B page,  4k blk, ID=(C2,2533)
   MX MX25U8033E-MX25U8035F 8192Kx1S    1.65-2.0V, 256B page,  4k blk, ID=(C2,2534)
   GD      GD25Q512  512Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C8,4010)
   GD       GD25Q10 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C8,4011)
   GD       GD25Q20 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C8,4012)
   GD       GD25Q40 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(C8,4013)
   GD     GD25LQ20B 2048Kx1S   1.65-2.00V, 256B page,  4k blk, ID=(C8,6012)
   GD     GD25LQ40B 4096Kx1S   1.65-2.00V, 256B page,  4k blk, ID=(C8,6013)
   GD     GD25LQ80B 8192Kx1S   1.65-2.00V, 256B page,  4k blk, ID=(C8,6014)
WBond       W39L010  128Kx8          3.3V,   1B page,  4k blk, ID=(DA,0031)
WBond       W39L512   64Kx8          3.3V,   1B page,  4k blk, ID=(DA,0038)
WBond      W29C011A  128Kx8          5.0V, 128B page,  0k blk, ID=(DA,00C1)
WBond      W29EE512   64Kx8          5.0V, 128B page,  0k blk, ID=(DA,00C8)
WBond      W25X05CL  512Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(EF,3010)
WBond       W25X10A 1024Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(EF,3011)
WBond       W25X20A 2048Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(EF,3012)
WBond       W25X40A 4096Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(EF,3013)
WBond       W25X80A 8192Kx1S     2.7-3.6V, 256B page,  4k blk, ID=(EF,3014)
WBond      W25Q80BV 8192Kx1S     2.3-3.6V, 256B page,  4k blk, ID=(EF,4014)
WBond      W25Q20EW 2048Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(EF,6012)
WBond      W25Q40EW 4096Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(EF,6013)
WBond      W25Q80EW 8192Kx1S   1.65-1.95V, 256B page,  4k blk, ID=(EF,6014)