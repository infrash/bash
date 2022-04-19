curl -o /dev/null -s -w "%{http_code}\n" "$1"
#curl -sL -w "%{http_code}" "$1"
