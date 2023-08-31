IFS=$'\n' read -d '' -r -a lines <<< "$1"
OUTPUT=""
for COOKIE in "${lines[@]}"
do
  MESSAGE=$(curl -H "cookie:${COOKIE}" -H 'content-type:application/json;charset=UTF-8' -d '{"token": "glados.one"}' -X POST 'https://glados.rocks/api/user/checkin' | grep -Eo '"message":"[^"]*"')
  OUTPUT+="$MESSAGE   "
  STATUS=$(curl -H "cookie:${COOKIE}" -X GET 'https://glados.rocks/api/user/status' | grep -Eo '"leftDays":"[^"]*"')
  OUTPUT+="$STATUS   "
done
echo "$OUTPUT"
