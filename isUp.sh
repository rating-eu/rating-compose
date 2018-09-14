echo Testing if $1 is UP

http_code=$(curl -LI $1 -o /dev/null -w '%{http_code}\n' -s)

if [ ${http_code} -eq 200 ]; then
    exit 0
else
    exit 1
fi
