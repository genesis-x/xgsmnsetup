#!/bin/bash

#set -exuo pipefail
# This is great for testing and debug and doesn't need to be in the finakl script
# In essence, it'll show the commands being executed and will halt the script if anything fails

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

clear
echo -e "${YELLOW}${BOLD}
 _______                           __               ___ ___ 
|     __|.-----.-----.-----.-----.|__|.-----.______|   |   |
|    |  ||  -__|     |  -__|__ --||  ||__ --|______|-     -|
|_______||_____|__|__|_____|_____||__||_____|      |___|___|                                                           
${NC}
\tMasternode Update Script by Chockblain
\t**************************************\n\n"

echo -e "${GREEN}==>${NC} Checking your system before updating your Masternode."
sleep 2

# Doing some quick tests
GENESISXD=$(command -v genesisxd)
GENESISXCLI=$(command -v genesisx-cli)
INSTALLED=$(echo $?)

if [ ! ${INSTALLED} -eq 0 ]; then
    echo -e "${RED}${BOLD}==>${NC} ${BOLD}Genesis-X Daemon not found. Check it is installed and try again.${NC}"
    exit 1 
fi

if [ ! -d /root/.genesisx ]; then
    echo -e "${RED}${BOLD}==>${NC} ${BOLD}Genesis-X not found in the expected location '/root/.genesisx'. Aborting update.${NC}"
    exit 1 
fi


# Stopping Masternode
echo -e "${GREEN}==>${NC} Stopping Genesis-X Masternode process."
${GENESISXCLI} stop > /dev/null
ps -C genesisxd > /dev/null
RUNNING=$(echo $?)
while [ $RUNNING -eq 0 ]; do
    sleep 5
    ps -C genesisxd > /dev/null
    RUNNING=$(echo $?)
done
echo -e "    Masternode process stopped successfully.\n"


# Let's create a backup just in case
echo -e "${GREEN}==>${NC} Creating a backup of your wallet.dat."
DATE=$(date "+%F")
cp /root/.genesisx/wallet.dat /root/wallet.dat.${DATE}
echo -e "    Backup located at ${YELLOW}/root/wallet.dat.${DATE}${NC}.\n"


# Installing new update.
echo -e "${GREEN}==>${NC} Downloading new binaries. This can take a while depending on the network speed."
wget -q https://github.com/genesis-x/genesis-x/files/2799605/genesisx-linux.zip
echo -e "    Done."

echo -e "${GREEN}==>${NC} Installing new binaries."
tar --overwrite -C /usr/local/bin/ -zxf /tmp/GenesisX-1.3.0-x86_64-linux.tar.gz
echo -e "    Done."

#STARTING GENESIS X SERVER
echo -e "${GREEN}==>${NC} Starting Genesis-X. Please be patient."
${GENESISXD} > /dev/null

ps -C genesisxd > /dev/null
RUNNING=$(echo $?)
while [ $RUNNING -eq 1 ]; do
    sleep 5   
    ps -C genesisxd > /dev/null
    ps -C ${GENESISXD} > /dev/null
    RUNNING=$(echo $?)
done

sleep 20
echo -e "    The server has now started.\n"
echo -e "${GREEN}==>${NC} Current version is: \n $(${GENESISXCLI} getinfo | grep -i version)\n"
echo -e "${GREEN}==>${NC} You can check the status of your masternode by running ${GREEN} genesisx-cli masternode status${NC}\n\
    If it isn't status 4, please start it from your cold wallet again.\n"
echo -e "\n ${YELLOW}.:: THANK YOU FOR TAKING THE TIME TO UPGRADE TO GENESISX WALLET V1.4.0, IT IS NOW COMPLETE! ::.${NC}"
