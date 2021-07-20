# Debian/Ubuntu v16.04 or v18.04 x64 Linux Masternode Build Instructions:
===================================================

You need to be running a headless daemon in linux, you can make following these instructions:

In windows or mac wallet go to debug console in the tools tab and type:

`getnewaddress MN1`

take this address and send exactly 5000 XGS to this (MN1 Address) address and when it is confirmed with at least with 6 confirmations, type in debug console:

`masternode genkey`
and
`masternode outputs`

take note of this information and place in a text file, later on we will need them.

Next is to choose a VPS provider. We highly recommend Contabo (https://contabo.com/en/vps/) $5 service, as a reliable VPS provider. You can also choose Vultr (https://www.vultr.com/?ref=7623826).

In the linux VPS after you have successfully logged in, create a swap file which will help the VPS run later on in its life.

`fallocate -l 2G /swapfile`

`chmod 600 /swapfile`

download the GenesisX daemon which will be the latest version:

`wget https://github.com/genesis-x/genesis-x/releases/download/v1.5.0/genesisx-1.5.0-linux.zip`

Install unzip by typing

`apt install unzip`

Unzip the GenesisX zip file

`unzip genesisx-1.5.0-linux.zip`

now we need modify daemon conf:

`cd .genesisx`

`nano genesisx.conf`

You will need to add this info in your genesisx.conf file

`rpcuser=CREATE_YOUR_OWN_USERNAME
rpcpassword=CREATE_YOUR_OWN_PASSWORD
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
maxconnections=256
masternode=1
externalip=YOUR_VPS_IP_GOES_HERE
masternodeaddr=YOUR_VPS_IP_GOES_HERE:5555
masternodeprivkey=xxxxxxxxxxxxxxxxx` (that you put in the text file you created earlier)

`Ctrl+X` then press `y` and then `Enter`

Then you are ready to start the GenesisX Server.

Type `genesisxd` and the server will begin.

To get the block height of your masternode type in `tail -f ~/.genesisx/debug.log` and Match the block height with that of the GenesisX Explorer at `explorer.genesisx.network`and you will know that it has fully synced.

Now we come back to your windows/mac wallet, go to tools, and open masternode conf file and add:

MN1 IP:PORT masternodekey masternodeouputs txnumber

EXAMPLE: `MN1 YOUR_VPS_IP_GOES_HERE:5555 7NEGGttKZojkAzViEYXXXxKTFdAtC2uSiMg8NSFqYVBtN6mYdU 7a1ebb4baadf9ff39bbbfc2d58fd57ff15b65a5096069c8XXX3fb4cb5c 1`

Save masternode conf file close the wallet and then reopen the wallet. 

In the masternode tab click START ALIAS on the new masternode.

Thanks for following!!!

GenesisX Team
