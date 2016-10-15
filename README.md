## Usage

### On mac:
- Insert rasp pi sd card into mac
- `brew install pv ssh-copy-id`
- `git clone https://github.com/hypriot/flash`
- `cd flash/Darwin`
- `./flash --hostname print https://downloads.hypriot.com/hypriotos-rpi-v1.0.0.img.zip` (or latest release)
- When complete, install sd card into rpi and power on
- `ssh-copy-id -i .ssh/id_rsa.pub pirate@black-pearl.local` (default password is hypriot)
- Disable password logins: `PasswordAuthentication no` in /etc/ssh/sshd_config

Note: You may have to enable password logins on your mac os client temporarily to complete these steps.
- `systemctl restart ssh.service`

### On rpi:

- `cd /opt`
- `sudo git clone https://github.com/ryansch/docker-cups-rpi cups`
- `sudo cp /opt/cups/cups.service /etc/systemd/system/`
- `sudo systemctl enable /etc/systemd/system/cups.service`
- `sudo systemctl start cups.service`

### On mac:

- Visit 'http://print.local:631' with your browser

Default administration credentials are print/print.
