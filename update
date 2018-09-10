#!/bin/bash

set -exuo pipefail
# This is great for testing and debug and doesn't need to be in the finakl script
# In essence, it'll show the commands being executed and will halt the script if anything fails

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${YELLOW}${BOLD}
 _______                           __               ___ ___ 
|     __|.-----.-----.-----.-----.|__|.-----.______|   |   |
|    |  ||  -__|     |  -__|__ --||  ||__ --|______|-     -|
|_______||_____|__|__|_____|_____||__||_____|      |___|___|                                                           
${NC}
\tMasternode Update Script by Chockblain
\t**************************************"

echo -e "${GREEN}==>${NC} Checking your system before updating your Masternode."
sleep 2

GENESISXD=$(command -v genesisxd)
GENESISXCLI=$(command -v genesisx-cli)
INSTALLED=$(echo $?)

if [ ! ${INSTALLED} -eq 0 ]; then
    # If we couldn't find the daemon and cli, most likely it isn't installed and the rest will fail
    # Best to check and fail gracefully
    echo -e "${RED}${BOLD}==>${NC} ${BOLD}Genesis-X Daemon not found. Check it is installed and try again.${NC}"
    exit 1 
fi

if [ ! -d /root/.genesisx ]; then
    # If we can't find this directory, it most likely means that Genesis-x wasn't installed
    # through the install script and things aren't in the expected location. Again, fail grcefully.
    echo -e "${RED}${BOLD}==>${NC} ${BOLD}Genesis-X not found in the expected location '/root/.genesisx'. Aborting update.${NC}"
    exit 1 
fi

echo -e "${GREEN}==>${NC} Stopping Genesis-X Masternode process."
${GENESISX-CLI} stop
#Checking to see if server has stopped properly
# 0 means OK, as in it found a process. 
# 1 means "error" in this case, it found no process which is what we want
ps -C ${GENESISXD} > /dev/null
RUNNING=$(echo $?)
while [ $RUNNING -eq 0]; do
    sleep 5
    ps -C ${GENESISXD} > /dev/null
    RUNNING=$(echo $?)
done

echo -e "    Masternode process stopped successfully.\n"

# Let's create a backup just in case
echo -e "${GREEN}==>${NC} Creating a backup of your wallet.dat."
DATE=$(date "+%F")
cp /root/.genesisx/wallet.dat /root/wallet.dat.${DATE}
echo -e "    Backup located at ${YELLOW}/root/wallet.dat.${DATE}${NC}.\n"

# #Installing new update.
echo -e "${GREEN}==>${NC} Downloading new binaries. This can take a while depending on the network speed."
# wget the crap out of this thing :-)

echo -e "${GREEN}==>${NC} Installing new binaries."
# Will depend on the downloaded content and how it's structured. Will need to look at this when it's ready
# chmod +x ${GENESISXD}
# mv etc..

#STARTING GENESIS X SERVER
echo -e "${GREEN}==>${NC} Starting Genesis-X. Please be patient."
${GENESISXD}

ps -C ${GENESISXD} > /dev/null
RUNNING=$(echo $?)
while [ $RUNNING -eq 1]; do
    sleep 5   
    ps -C ${GENESISXD} > /dev/null
    RUNNING=$(echo $?)
done

sleep 5 # Give it some time to load...
STATUS=$(${GENESISXCLI} masternode status)
echo -e "    The server has now started. Current status is:\n\n${STATUS}\n"
echo -e "${YELLOW}THANK YOU FOR TAKING THE TIME TO UPGRADE TO GENESISX WALLET V1.3.0, IT IS NOW COMPLETE!${NC}"
