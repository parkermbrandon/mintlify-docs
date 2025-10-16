# AIO Software Suite Changelog

All notable changes to the AIO Software Suite will be documented in this file.

## Version History

### 4.3.2 (Current Release)

The current installer version is 4.3.2, which includes software version 4.3 and the latest firmware updates.

### Version 4.3

#### Interface Module Firmware
- Fixed channel names for S and H modules
- Support for more module configurations
- Fixed issues with AIO-Sv2 and AIO-Lv2 modules initialization
- Improved RMS metering
- Added enable/disable control for output limiter
- Automatically save and restore the audio clock source

#### Control Panel Application
- Added Direct2D renderer for improved performance and appearance
- Fixed C module AUX IN not updating
- More flexible control layout (vertical channel stack if the window is narrow and tall)
- Streamlined meter controls

#### CLI + API
- Complete rework of API + CLI for new command syntax and support for all AIO modules

### Version 4.1

#### Interface Module Firmware
- Automatically load T module firmware
- Automatically save and restore T module configuration
- Fixed issue with channel labeling for AT & LT configurations
- Fixed startup issues with AT & LT configurations
- Added support for T1 configuration
- Added support for larger future firmware images
- Output meters are now calculated before the output calibration scaling

#### AIO-T Module Firmware
- Major firmware rewrite for reliability and timing fixes

#### Control Panel Application
- dBFS meters in RMS mode now read 0 dB for full-scale sine output
- Fixed channel naming for units with empty module slots
- Fixed restoring the window size
- Fixed restoring meter modes & units
- Fixed TDM incorrect bits per word configuration
- Fixed channel layout for AIO-AT and AIO-LT configurations
- Changed AIO-S and AIO-H current monitor meters to read in milliamperes instead of ampere
- Added decibel ampere meters for AIO-S and AIO-H current monitor

#### Windows Driver
- Add support for Windows 11 22H2
- Fix for capturing audio with larger ASIO buffer sizes

### Version 4.0.0

- Initial release of integrated installer with updated Control Panel and firmware

---

## System Requirements

### Minimum Requirements
- **OS:** Windows 10 version 1903 or later (64-bit)
- **Processor:** Intel Core i3 or AMD equivalent
- **RAM:** 4GB
- **Storage:** 500MB available space
- **USB:** USB 2.0 port

### Recommended Requirements
- **OS:** Windows 11 (64-bit)
- **Processor:** Intel Core i5 or AMD equivalent
- **RAM:** 8GB or more
- **Storage:** 1GB available space
- **USB:** USB 3.0 port or higher

---

© 2022 Echo Test + Measurement