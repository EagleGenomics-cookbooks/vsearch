TOKEN=$1
# USER=$2
# REPO=$3
# PRIVATE=$4

body='{
"request": {
  "branch":"master",
  "message": "Triggered build"
}}'

if [ "$PRIVATE" == "private" ]
then
  url='api.travis-ci.com'
else
  url='api.travis-ci.org'
fi

echo "https:/${url}/repo/${USER}%2F${REPO}/requests"

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token ${TOKEN}" \
  -d "$body" \
  https://api.travis-ci.com/repo/EagleGenomics-cookbooks%2Fvsearch_runnable/requests \
  | tee /tmp/travis-request-output.$$.txt

# https:/${url}/repo/${USER}%2F${REPO}/requests \

if grep -q '"@type": "error"' /tmp/travis-request-output.$$.txt; then
 cat /tmp/travis-request-output.$$.txt
 exit 1
elif grep -q 'access denied' /tmp/travis-request-output.$$.txt; then
 cat /tmp/travis-request-output.$$.txt
 exit 1
fi
