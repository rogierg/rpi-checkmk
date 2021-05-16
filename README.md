# rpi-checkmk
Check_mk 2.0 as a docker container for Raspberry Pi/ARM7

This dockerfile provides a runnable version of Check_mk 2.0 for the ARM7 architecture, based on chrisss404/check-mk-arm with some ideas from hbel/rpi-omd.

The installed omd environment is called `mon` and will be published on port 5000

If you want to persist your configuration, make sure to provide a volume for /omd/sites

To run a container:
`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 rogierg/rpi-checkmk:latest`

## Building
Clone my repository:
`git clone https://github.com/rogierg/rpi-checmk`
Build:
`sudo docker build -t rogierg/rpi-checkmk:0.0.1`
