# NOS Masternode Install Script
# Use this script on a fresh install of Ubuntu 16.04 - MUST BE 16.04 x64

Stable and cheap host here https://m.do.co/c/b93026fab810

NOS address if this helped you and you love me: NWrcgc4eSAqrrp5J7XUGiTvY7bZCs9Nify


# Use this script on a fresh install of Ubuntu 16.04 - MUST BE 16.04 x64

# Part 1 - Sending Collateral Coins

1. Open your Windows wallet - MAKE SURE IT IS SYNCED WITH THE NETWORK
2. Go to Tools -> Debug Console
3. Type: getaccountaddress MN# (# is your masternode number you want to use)
4. Send 35000 NOS to this address
5. Go to Tools -> Debug Console
6. Type: masternode outputs (This can take a minute before an output is shown)
7. Type: masternode genkey
7. Save your TX ID (The first number) and your Index Number (Second number, either a 1 or 0)
8. Save your generated key as well as this will be needed in your VPS as your private key
9. Save these with a notepad
10. Close the wallet
11. Move to Part 2 for now

# Part 2 - Getting your Linux VPS Started Up (Read all instructions and follow prompts closely)

1. Connect to your linux vps AS ROOT (AWS USERS USE sudo -i TO LOGIN AS ROOT), copy and paste the following line into your VPS.  Double click to highlight the entire line, copy it, and right click into Putty or Shift + Insert to paste.
```
cd && sudo apt-get -y install git && sudo git clone https://github.com/testiface/nosmnsetup.git && cd nosmnsetup/ && sudo bash install.sh 
```
2. follow the prompts closely and don't mess it up!
3. Move to Part 3

# Part 3 - Editing your Windows Config File

1. Open your wallet
2. Go to Tools -> Open Masternode Configuration File
3. Enter the following on one single line after the example configuration
```<alias> <ip>:7272 <private_key> <tx_id> <index>```
4. It should look something like this:
``` MN1 66.65.43.32:7272 87dfjnKNfdjNlwomdmKKMdkaNIE a3eofJJkdlMlfKokfmalmofO 0```
5. Save and close the file and restart your wallet.

# Part 4 - Starting the Masternode

1. In your wallet, go to Tools -> Debug Console
2. Enter ```startmasternode alias 0 <alias>``` with ```<alias>``` being the name of your masternode from Part 3
3. Enjoy!  You can start this process over again for another MN on a fresh Linux VPS!

# Part 5 - Checking Masternode Status

1. After running the command in step 4, go back to your VPS
2. Enter ```cd``` to get back to your root directory
3. Enter ```marble-cli masternode status```
4. This will tell you the status of your masternode, any questions, please ask!

# Bronate if this helped

*Official NOS Discord: https://discord.gg/US3t6aj

MY NOS ADDRESS: NWrcgc4eSAqrrp5J7XUGiTvY7bZCs9Nify

*Discord in case you need help from me personally: https://discord.gg/MwE4Fuc
  - I support multiple coins, please state which you need help with


# Recommended Tools

- Putty - Easy to use and customizable SSH client.
- SuperPutty - This allows you to have multiple Putty tabs open in one window, allowing you to easily organize and switch between masternode servers.

