#!/bin/bash

TELEGRAM_BOT_TOKEN=""
TELEGRAM_USER_ID=""
TIME="120"
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

if [ "$CI_JOB_STATUS" == "success" ]; then
  STATUS="🟢 Passed!"
elif [ "$CI_JOB_STATUS" == "failed" ]; then
  STATUS="🔴 Failed!"
fi

TEXT="Project:+$CI_PROJECT_NAME%0AStage:+$CI_JOB_STAGE+$STATUS%0A\
  $CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID"
curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&\
disable_web_page_preview=1&text=$TEXT" $URL > /dev/null


if [ "$CI_JOB_STATUS" == "success" ] && [ "$CI_JOB_STAGE" == "deploy" ]; then
  PIPELINE="🟢 Pipeline Passed!"
  curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&text=$PIPELINE" $URL > /dev/null
elif [ "$CI_JOB_STATUS" == "failed" ]; then
  PIPELINE="🔴 Pipeline Failed!"
  curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&text=$PIPELINE" $URL > /dev/null
fi
