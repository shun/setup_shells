# install paper icon theme
sudo add-apt-repository ppa:snwh/pulp
sudo apt update -y
sudo apt install -y paper-icon-theme
sudo apt install -y paper-icon-theme paper-cursor-theme paper-gtk-theme

# install arc-thme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
wget -nv https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O /tmp/Release.key
sudo apt-key add - < /tmp/Release.key
sudo apt update
sudo apt install -y arc-theme

