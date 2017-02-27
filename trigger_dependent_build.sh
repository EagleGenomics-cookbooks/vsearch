TOKEN=$(travis token --org)

echo "TOKEN=$TOKEN"

body='{
"request": {
  "branch":"master",
  "message": "test"
}}'

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token ${TOKEN}" \
  -d "$body" \
  https://api.travis-ci.org/repo/EagleGenomics-cookbooks%2Fvsearch_runnable/requests \
  | tee /tmp/travis-request-output.$$.txt

if grep -q '"@type": "error"' /tmp/travis-request-output.$$.txt; then
 cat /tmp/travis-request-output.$$.txt
 exit 1
elif grep -q 'access denied' /tmp/travis-request-output.$$.txt; then
 cat /tmp/travis-request-output.$$.txt
 exit 1
fi
