

open https://dashboard.ngrok.com/signup

ngrok authtoken 21LYYZ8g4DDBlxktYosNRPZQMFc_3mSHrgmeWDCJYa8BN5qKN

./gradlew build && docker-compose build

./kubernetes/scripts/deploy-dev-env.bash

