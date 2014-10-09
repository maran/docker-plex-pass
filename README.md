docker plex-pass
===========

This is a Dockerfile to set up (https://plex.tv/ "Plex Media Server") - (https://plex.tv/)

This version installs the Plex Pass version of the server. See the
original repo for the normal version.

Build from docker file

```
git clone git@github.com:timhaak/docker-plex.git
cd docker-plex-pass
docker build -t plex-pass .
```

You can also obtain it via:

```
docker pull maran/plex-pass
```

---
Instructions to run:

```
docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 32400:32400  plex
```

The first time it runs, it will initialize the config directory and terminate.

You will need to modify the auto-generated config file to allow connections from your local IP range. This can be done by modifying the file:

*your_config_location*/Library/Application Support/Plex Media Server/Preferences.xml 

and adding ```allowedNetworks="192.168.1.0/255.255.255.0" ``` as a parameter in the <Preferences ...> section.

Start the docker instance again and it will stay as a daemon and listen on port 32400.

Browse to: ```http://*ipaddress*:32400/web``` to run through the setup wizard.

