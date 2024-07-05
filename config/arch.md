## ArchLinux


# Programs

Sway!
Alacritty
Tmux
Ranger
Nvim
Startship 


# Wifi > Iwctl 

# Connect
device list 
station wlan0 get-networks
station wlan0 connect <name>
<pass>


# Wifi > NetworkManager

# Install
sudo pacman -S networkmanager

# Configuration
nmcli d 
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <name> password <pass>


# Bluetooth 

# Install
sudo pacman -S bluez bluez-utils  (bluez-tool - Interface)

# Configuration
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
bluetoothctl

# Bluetooth > Comands
power on
agent on
default-agent 
scan on
devices
trust <read code connect - reference to device>
pair <read code connect - reference to device>
connect <read code connect - reference to device>

# Document
Alert > sudo nvum /etc/bluetooth/main.conf

Police > #AutoEnable=false > AutoEnable=true


# UFW - Firewall
sudo pacman -S ufw

sudo ufw enable #Activad


# Programas para estudar!

//zed 
//zellij
//tmux

# Caminhos dos Arquivos!

.config/sway/config
.config/alacritty/alacritty.toml


