# rpi-checkmk
Check_mk 2.0 as a docker container for Raspberry Pi (Arm[hf/v7/v8])


Working docker compose file is in the repository. Other wise you can run the following.

### arm64

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-arm64:latest`

### arm[v7/hf]

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-armhf:latest`


## Currently Working on streamlining builds and initial set, env variables etc
- [X] Specify default site name
- [X] Better Startup/entry Points
- [X] Work on building 32bit arm/v7/hf based on bullseye (Possibly test it on jammy)
    - [X] Add variables/args for distro, as well as cmk version
- [X] Example compose file and run commands.
