#!/bin/bash

TELEGRAM_BOT_TOKEN=
TELEGRAM_CHAT_ID=

API_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

TIME="10"

if [ "$CI_JOB_STATUS" = "failed" ]; then
    var_status="❌"
elif [ "$CI_JOB_STATUS" = "success" ]; then
    var_status="✅"
fi

MESSAGE+="Project: $CI_PROJECT_TITLE%0A"
MESSAGE+="Branch: $CI_COMMIT_REF_SLUG%0A"
MESSAGE+="Pipeline: $CI_PIPELINE_ID%0A"
MESSAGE+="Stage: $CI_JOB_STAGE%0A"
MESSAGE+="Status: $CI_JOB_STATUS $var_status%0A"
MESSAGE+="Job: $CI_JOB_NAME%0A"

curl -s --max-time $TIME \
    -d "chat_id=$TELEGRAM_CHAT_ID" \
    -d "disable_web_page_preview=1" \
    -d "text=$MESSAGE" \
    "$API_URL" > /dev/null
