TOKEN=$(travis token --org)

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
  https://api.travis-ci.com/repo/EagleGenomics-cookbooks%2Fvsearch_runnable/requests

