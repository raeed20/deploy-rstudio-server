DISTRIB=$(lsb_release -sc)
sudo add-apt-repository "deb https://cran.rstudio.com/bin/linux/ubuntu $DISTRIB/"
gpg --keyserver keyserver.ubuntu.com --recv E084DAB9
gpg --export --armor E084DAB9 | sudo apt-key add - && sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install r-base-dev
sudo apt-get --assume-yes install gdebi-core
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
wget https://download2.rstudio.org/rstudio-server-0.99.484-amd$ARCH.deb
sudo gdebi -n rstudio-server-0.99.484-amd$ARCH.deb
sudo adduser $1 --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "$1:$2" | sudo chpasswd
sudo echo "www-port=$3" >> /etc/rstudio/rserver.conf
sudo rstudio-server verify-installation
