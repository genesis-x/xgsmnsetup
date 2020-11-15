# GenesisX_MN_Script
Installation Script for Installing up to 4 GenesisX Masternodes (XGS Version 1.5.0)

This script is for use on fresh installations of Ubuntu 16.04 x64 only; or Ubuntu 16.04 x64 installations that were installed by other Sburns/NullEntry (Github = https://github.com/sburns1369).  All scripts where tested on a Vultr VPS $10 servers with enabled Ipv6. If you would like more, you need to consider bigger and more expensive server costs.

Shameless Referral link for sburns = https://www.vultr.com/?ref=7846384

Script improvements where pushed with the latest update.  If you have 3 masternodes, and want to have 4, select the installation script for 4 (assuming they where installed previously with my scripts) and it will detect the first 3 masternodes, and than prompt and build a 4th masternode, etc.

If all your masternodes go offline, just re-run the script to restart them as well.  So if you want to restart 4 masternodes, select 4, and it will stop and re-start them.

*********  Quick Start - Experienced Users ***************

Copy and Paste:

bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/GenesisX_MN_Script/master/xgs.sh)

Hit "y" to start and select the amount of MN you would like to install.
Wait about 5 minutes, and hit enter when prompted about 5 minutes in (programming dependencies installation)

Sync time is around 3 hours for one masternodes
Sync time was over 10 hours for all four.

Check MN 1
genesisx-cli -datadir=/home/genesisx/.genesisx mnsync status
Check MN 2
genesisx-cli -datadir=/home/genesisx2/.genesisx mnsync status
Check MN 3
genesisx-cli -datadir=/home/genesisx3/.genesisx mnsync status
Check MN 4
genesisx-cli -datadir=/home/genesisx4/.genesisx mnsync status
and so on and so on.

**********  Full Set Up **********

- Open a new Notepad on your PC
- Open your Windows or Mac wallet
- Wait for it to fully Sync to the network (Your coins may not appear till fully syncronised)
- Click "Receive" tab
- Enter MN1 under label
- Hit "Request Payment"
- A small window should open and hit "Copy Address"
- Paste the address in the fresh Notepad

***Repeat that process 4 times, if making 4 masternodes, I suggest MN2, MN3, MN4 for logical reasons as label) ***

Now send the collateral of exactly 5000 coins, do not include transmission cost in the send amount
  -it will be automatically deducted.
Wait for each transaction to have 6 confirmations.
  -you can hold your cursor over the transactions under "transactions" to see number of confirms

Go to Tools -> Debug Console
Type: masternode outputs
   -Copy the TX ID (First set of numbers) and Index Numbers (Either 1 or a 0, after TX ID) to a notepad file.

Save all these on a notepad for adding to the masternode configuration file later.

Connect to your Linux VPS as root

Copy and Paste the command below

bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/GenesisX_MN_Script/master/xgs.sh)

Follow on Screen Directions
Hit "y" to start and select the amount of MN you would like to install.
Wait about 5 minutes, and hit enter when prompted about 5 minutes in (programming dependencies installation)
This process will generate a set of IP addresses and genkeys for each MN you installed.
Put the numbers in the notepad file you made earlier combining them with the TX ID and TX output like so.
  e.g MN01 98.456.15.885:5555 xxxxxxit9Bf3X9Z1movYXtYXxxxxxxxxqNscHQxbN363Mb3bCPo xxxxxxxxxd35dc068fd43ac068fbd42f2d7cdcab139d3e010cf0e5xxxxxxxx1d 0
      MN02 [2q02:xxxx:2030:4328:10]:5555 xxxxxxaBn7DrP9ts7nExG5qbbUR13xxxxxxxxxxxgXa8Lsbk9ym xxxxxxxx7adb4fbd6ce0e56072cc1c703a1af7xxxxxxxxb919bde90a4553174a 0
      MN03 [2q02:xxxx:2044:8749:15]:5555 xxxxxxxzr8EDzoUBoXtqFXbBFkUi8xxxxxxxxj7kFqDsUdd3CAS d9f4a9bf4d428638fxxxxxxx3c589ef9cb4b2fab9c9b13817891fabf7c197ee4 1
      MN04 [2q02:xxxx:2099:4157:99]:5555 xxxxxot3FrB4W5YmSczxq59Dxxxxxxxxxxxk1EJ96UHa4vcLnVt abb7xxxxxxxxx2b10ccaccdf6ea9e6536f06b0172a977c16c94c3a8xxxxxxxx1 1
It will around 2 hours roughly for it to fully sync.
  -Longer if you are doing more nodes.
While we wait we can configure the Windows Wallet.
Go back to (or open) your windows wallet.
Click on "Tools"
Select "Masternode Configuration File" from the list.
In the Notepad that Opens titled "masternode.conf" follow the example in it.
Enter the combined MN configurations as stated in the above example.
Hit enter, and enter the information for the next Masternode, if your entering more than 1.
Once complete, save the file and close.

Close the Wallet

 -Make sure you close it, not just minimize it.
 
Re-open the wallet

Click the Masternode tab and you should see all your Masternodes there
If they do not appear, double check your work in the masternode.conf
go back to your VPS and occasionally check the Masternodes Sync'ing status with the commands...

To Check MN 1

genesisx-cli -datadir=/home/genesisx/.genesisx mnsync status

To Check MN 2

genesisx-cli -datadir=/home/genesisx2/.genesisx mnsync status

To Check MN 3

genesisx-cli -datadir=/home/genesisx3/.genesisx mnsync status

To Check MN 4

genesisx-cli -datadir=/home/genesisx4/.genesisx mnsync status

We are watching for the "IsBlockchainSynced" to equals true, not false.
This will take some time, relax.
Once  "IsBlockchainSynced" : true
Go back to the Wallet and hit "Start all"
It may take around another 15 to 20 minutes, or even instantly to activate the Masternode.

You can check the status of your masternodes with the commands below

To Check MN 1

genesisx-cli -datadir=/home/genesisx/.genesisx masternode status

To Check MN 2

genesisx-cli -datadir=/home/genesisx2/.genesisx masternode status

To Check MN 3

genesisx-cli -datadir=/home/genesisx3/.genesisx masternode status

To Check MN 4

genesisx-cli -datadir=/home/genesisx4/.genesisx masternode status

Need help? Have a suggestion? Have a request?
Find Sburns1369#1584 on his Discord - https://discord.gg/YhJ8v3g or the XGS team members on our community discord https://discord.gg/QVZM4RJwVn

Tips are always appreciated and go straight to the developer.
XGS address: GZXonqnH2cjPgQZL59urDZS2CBzxPzoQ1j
LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H
BTC address: 32FzghE1yUZRdDmCkj3bJ6vJyXxUVPKY93
