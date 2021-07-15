# DuinoCoinTelegramBot

### Create bot, and get token bot:
- https://t.me/botfather

### Get chat ID:
- https://t.me/myidbot

Change in the script, the variables token, id and the username of your duinocoin wallet.

```
TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_CHAT_ID"
WALLET="YOUR_USERNAME_WALLET"
```

### Install package
`sudo apt install -y jq`

### Assign execution permissions
`chmod a+x duinocoin.sh`

### Launch script
`./duinocoin.sh`

### Add cron, in this example, it runs every hour, every day of the week.  
`crontab -e`

`00 * * * *  /path/to/script/duinocoin.sh >/dev/null 2>&1`




donate DUCO's: azagramac :coffee:
