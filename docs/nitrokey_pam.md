
## Install U2F PAM

```
# pacman -S pam-u2f
```

## Register Nitrokeys

```bash
sudo -i
mkdir -p /etc/Nitrokey
chmod 755 /etc/Nitrokey
# NOTE: insert first nitrokey
pamu2fcfg --username architect --pin-verification > /etc/Nitrokey/u2f_keys
# NOTE: insert second nitrokey
pamu2fcfg --nouser --pin-verification >> /etc/Nitrokey/u2f_keys
chmod 644 /etc/Nitrokey/u2f_keys
```

## Configure PAM

Add the following line at the top of `/etc/pam.d/system-auth`:

```
auth    sufficient    pam_u2f.so    authfile=/etc/Nitrokey/u2f_keys cue prompt
```
