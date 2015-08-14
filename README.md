# My system settings
Repository created to store settings and scripts and remember some tips and tricks.

## Remote access to UFRGS servers

### UFRGS proxy
Run the script [proxy_ufrgs.sh](proxy_ufrgs.sh)

Configure the browser to use proxy with the following settings:

ip:	127.0.0.1

port:	3128

### SSH connection to portal.inf.ufgrs.br
Run the script [ssh_ufrgs.sh](ssh_ufrgs.sh)

### Tunnel to a specific machine passing through portal.inf.ufrgs.br
Run the script [tunnel_ufrgs.sh](tunnel_ufrgs.sh)

In another terminal, access the remote machine with:

ssh -p 2222 <username>@localhost

Or send/receive files with:

scp [-r] -p 2222 <username>@localhost:/<path>/<to>/<file> <local>/<place>

### Eduroam access 
Edit the file [eduroam_ufrgs](eduroam_ufrgs)

Change:

WIRELESS_INTERFACE: wireless interface. (ip addr shows all network interfaces available)

ID: your university`s id (for UFRGS students the id is a number like 00XXXXXX)

PASSWORD: your university`s password

Move the file to /etc/netctl/

Connect to the eduroam network.


