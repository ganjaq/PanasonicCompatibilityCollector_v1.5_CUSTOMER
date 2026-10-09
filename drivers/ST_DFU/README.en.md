# ST DFU driver

[Polski](README.md) · [Deutsch](README.de.md)

ST Tube 3.0.6.1 package from DfuSe v3.0.6, Driver/Win10. Includes unchanged STtube.inf, sttube.cat and STTub30.sys for x86 and x64. DPInst is neither included nor required by this installer.

## Installation

1. Keep the complete folder, including x86/x64. Do not install during READ BACKUP or FLASH.
2. Run **Install_DFU.cmd** and approve installation and the Windows administrator prompt.
3. Connect a supported display in DFU mode, then select **REFRESH USB DFU** in Customer.

The installer uses PnPUtil supplied with Windows. It does not flash firmware, install DPInst, change the COM driver or disable driver signature enforcement. It adds the complete original ST package and installs it on matching devices; it does not restrict the original INF to a single model. The complete installer procedure, including its final USB interface check, requires Windows 10 version 1903 or later, x86/x64, or Windows 11 x64. Adding the driver with PnPUtil alone is available from Windows 10 version 1607. Compatibility with all later systems has not been tested. ARM64 is unsupported.

Installation without a connected display confirms that the package was added, not that the display was detected. Windows Code 28 means a driver is not installed. Other device errors may not be resolved by reinstalling. Do not replace this driver with WinUSB without changing and testing Customer's communication layer.

## Rights and source

STTub30.sys: Copyright (C) STMicroelectronics 2015. STDFU.dll and STTubeDevice30.dll in the main application folder retain their Copyright © 2018 notices. ST components are governed by the complete [SLA0044 Rev5/February 2018](SLA0044.txt), not the application's own license. The license text and vendor files remain unchanged. All ST conditions apply, including use only on or in combination with microcontrollers/microprocessors manufactured by or for ST. This does not confirm compatibility with every display or imply ST endorsement.

[Official ST DfuSe package](https://www.st.com/en/development-tools/stsw-stm32080.html) · [Microsoft PnPUtil documentation](https://learn.microsoft.com/en-us/windows-hardware/drivers/devtest/pnputil-command-syntax)
