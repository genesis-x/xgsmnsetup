# XGS Linux Masternode Update Script - Wallet version 1.0.3
# Use this script over an existing GenesisX Masternode, Version 1.0.2

Login to your Linux VPS as root and type these command lines, one by one, then hit enter.  

cd /root  
wget https://github.com/genesis-x/xgsmnsetup/raw/master/xgsudpate.sh  
chmod +x xgsudpate.sh  
bash xgsudpate.sh  

When it is done installing, you can check if your node was updated by using    
genesisx-cli | grep version
