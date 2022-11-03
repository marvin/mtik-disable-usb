# install script
:put "CREATING USB Script"
/system script remove [/system script find name="MSN-disable-usb"]
/system script
add dont-require-permissions=no name=MSN-disable-usb policy=\
    read,write,policy source="/system routerboard usb power-reset duration=360\
    0s\r\
    \n:log info \"USB disable timer has been reset\""

# install scheduler
/system scheduler remove [/system scheduler find name="MSN-disable-usb-onstart"]
/system scheduler remove [/system scheduler find name="MSN-disable-usb-hourly"]
/system scheduler
add name=MSN-disable-usb-onstart on-event="/system script run MSN-disable-usb\
    \r\
    \n:log info \"USB has been disabled after reboot!\"" policy=\
    read,write,policy,test start-time=startup
add interval=60m name=MSN-disable-usb-hourly on-event="/system script run MSN-d\
    isable-usb\r\
    \n:log info \"Script disable-usb has been run\"" policy=\
    read,write,policy,test start-time=startup

# run script
:put "Running Script..."
/system script run [/system script find name="MSN-disable-usb"]
:put "Installation Finished!"
