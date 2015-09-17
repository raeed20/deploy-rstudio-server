sudo add-apt-repository "deb https://cran.rstudio.com/bin/linux/ubuntu trusty/"
gpg --keyserver keyserver.ubuntu.com --recv E084DAB9
gpg --export --armor E084DAB9 | sudo apt-key add - && sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install r-base-dev
sudo apt-get --assume-yes install gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.484-amd64.deb
sudo gdebi -n rstudio-server-0.99.484-amd64.deb
sudo adduser rstudio --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "rstudio:server" | sudo chpasswd
sudo echo "www-port=80" >> /etc/rstudio/rserver.conf
sudo rstudio-server verify-installation
