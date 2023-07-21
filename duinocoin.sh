#!/bin/bash

/bin/ping -c2 "1.1.1.1" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    exit 1
else
    unset $BALANCE
    unset $WORKERS
    unset $NUMBER_WORKERS
    unset $BANNER

    TOKEN="YOUR_TOKEN"
    CHATID="YOUR_CHATID"
    WALLET="YOUR_USER_WALLET"

    api_telegram="https://api.telegram.org/bot$TOKEN/sendMessage?parse_mode=HTML"
    api_duinocoin=$(curl -s -X GET https://server.duinocoin.com/users/$WALLET -H "Accept: application/json" | jq .)

    BALANCE=$(echo $api_duinocoin | jq '.result.balance.balance')
    BALANCE_FORMAT=$(echo "scale=2; $BALANCE/1" | bc -l)
    WORKERS=$(echo $api_duinocoin | jq '.result.miners' | jq '.[].identifier' | tr -d '"')
    NUMBER_WORKERS=$(echo $api_duinocoin | jq -r '.result.miners' | jq -r '.[].identifier' | wc -l)

    function sendMessage() {
        curl -s -X POST $api_telegram -d chat_id=$CHATID -d text="$(printf "<b>$BANNER</b>\n\n \
			Balance: $BALANCE_FORMAT\n \
			Nº Workers $NUMBER_WORKERS\n \
			Names workers:\n<code>$WORKERS</code>")" >/dev/null 2>&1
    }

    if [ $NUMBER_WORKERS -ne 0 ]; then
        BANNER="ᕲ DuinoCoin ✅"
        sendMessage
        exit 0
    else
        BANNER="ᕲ DuinoCoin ❌"
        sendMessage
        exit 1
    fi
fi
