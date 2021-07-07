# DuinoCoinTelegramBot

Create bot, and get token:
- https://t.me/botfather

Get chat ID:
- https://t.me/myidbot

add the token, chat id and username of your wallet account

Assign execution permissions
`chmod a+x duinocoin.sh`

Launch script
`./duinocoin.sh`

Add cron, in this example, it runs every hour, every day of the week.  
`crontab -e`

`00 * * * *  /path/to/script/duinocoin.sh >/dev/null 2>&1`
