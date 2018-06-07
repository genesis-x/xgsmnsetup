#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*       XGS Masternode        *"
echo "*           SETUP             *"
echo "*            BY               *"
echo "*           Gabi              *"
echo "*      forked from Tpot       *"
echo "*                             *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IP==$(curl -s4 icanhazip.com)
echo -e "${GREEN}Please enter your private key: (Copy from Windows and right click to paste and press enter)${NC}" 
read KEY
sleep 2
echo ""
echo ""
echo -e "${RED}PLEASE WAIT FOR INSTALL!${NC}"
sleep 5

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano unrar unzip -y
sudo apt-get install libboost-all-dev libevent-dev software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libpthread-stubs0-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt install -y make build-essential libtool software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev \
bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev libdb5.3++ unzip libzmq5

sleep 2
echo -e "${GREEN}Creating swap file!${NC}"
sleep 5 
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd
sleep 2
echo -e "${GREEN}Adding ports to the ${RED}FIREWALL!${NC}"
sleep 5
sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 5555/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sleep 2
echo ""
echo ""
echo -e "${GREEN}Moving files to the right directories${NC}"
sudo chmod +x /root/xgsmnsetup/genesisxd /root/xgsmnsetup/genesisx-cli
sudo mv /root/xgsmnsetup/genesisxd /root/xgsmnsetup/genesisx-cli /usr/local/bin
echo ""
echo ""
sleep 2
echo -e "${GREEN}Creating the ${RED}Configuration File Now${NC}"
sleep 2
sudo mkdir /root/.genesisx
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /root/.genesisx/genesisx.conf.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /root/.genesisx/genesisx.conf.conf
echo "rpcallowip=127.0.0.1" >> /root/.genesisx/genesisx.conf.conf
echo "listen=1" >> /root/.genesisx/genesisx.conf.conf
echo "server=1" >> /root/.genesisx/genesisx.conf.conf
echo "daemon=1" >> /root/.genesisx/genesisx.conf.conf
echo "maxconnections=250" >> /root/.genesisx/genesisx.conf.conf
echo "masternode=1" >> /root/.genesisx/genesisx.conf.conf
echo "masternodeaddr$IP:5555" >> /root/.genesisx/genesisx.conf.conf
echo "externalip$IP:5555" >> /root/.genesisx/genesisx.conf.conf
echo "masternodeprivkey=$KEY" >> /root/.genesisx/genesisx.conf.conf
echo -e "${GREEN}STARTING THE DAEMON${NC}"
cd /root
sudo genesisxd
sleep 2
echo ""
echo ""
echo -e "Thank you for installing the XGS daemon.  Please move onto the ${RED}NEXT${NC} step."
