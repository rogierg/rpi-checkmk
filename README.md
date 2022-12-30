# CheckMK-ARM
checkmk as a docker container for ARM[hf/v7/v8]/ devices such as the raspberry pi, and Oracle Ampere A1 Compute.


Working docker compose file is in the repository. Other wise you can run the following.

### arm64[v8/aarch64] (Based on ubuntu:jammy)

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-arm64:latest`

### arm32[v7/hf] (Based on debian:bullseye)

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-armhf:latest`


## TODO
- [X] Github actions
- [X] Specify default site name
- [X] Better Startup/entry Points
- [X] Work on building 32bit arm/v7/hf based on bullseye (Possibly test it on jammy)
    - [X] Add variables/args for distro, as well as cmk version
- [X] Example compose file and run commands.
