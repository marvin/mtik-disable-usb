MikroTik Disable USB script
================

Because of known issues with USB being vulnerable to USB attacks and the missing option of disabling USB i created a script and scheduler to handle USB Power.
USB can be disable with a power command but it has a timer so the timer needs to be reset every X seconds/minutes.
The script will run on reboot to disable USB and after that run every 60 minutes to reset the usb timer.
This script does not give you 100% protection neither do we take any responsibilities for any damage done to your devices by this script or any attackers. 

## Install / Start

Just log in to your MikroTik and paste the following command

    /tool fetch url=xxx;
    /import file-name=install.rsc"
