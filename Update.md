# XGS Linux Masternode Update Script - Wallet version 1.0.3
# Use this script over an existing GenesisX Masternode, Version 1.0.2

Login to your Linux VPS as root. Copy these command lines, paste them into the vps/terminal/console, then hit enter:  

cd /root  
wget https://github.com/genesis-x/xgsmnsetup/raw/master/xgsudpate.sh  
chmod +x xgsudpate.sh  
bash xgsudpate.sh  

When it is done installing, you can check if your node was updated by using:

genesisx-cli | grep version  

You should get  
GenesisX Core RPC client version v1.3.0.0-722fb98-dirty
