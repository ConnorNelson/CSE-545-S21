#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

color_echo ()
{
    echo -e "$1$2$NC"
}

run_test ()
{
    color_echo $YELLOW "\t[-]  Running test \"$1\"..."
    $2
    if [ $? -eq 0 ]; then
        color_echo $GREEN "\t[✔]  Passed \"$1\""
    else
        color_echo $RED "\t[X]  Failed \"$1\""
    fi
}

start_web_server ()
{
    port=$1
    # nc -lp $port &
    ./normal_web_server $port &
    pid=$!
    sleep 2
    return $pid
}

stop_web_server ()
{
    pid=$1
    kill $pid 2>/dev/null
    wait $pid 2>/dev/null
}

test_listens_to_port ()
{
    port=1337
    start_web_server $port
    pid=$?

    nc -q 1 localhost $port 2>/dev/null </dev/null
    result=$?

    stop_web_server $pid
    return $result
}

test_http_request ()
{
    port=1337
    start_web_server $port
    pid=$?

    curl -ism 1 http://localhost:$port/ | head -n1 | grep -q '^HTTP/1.1 404'
    result=$?

    stop_web_server $pid
    return $result
}

run_test 'Exists' '[ -e ./normal_web_server ]'
run_test 'Executable' '[ -x ./normal_web_server ]'
run_test 'Listens to port' test_listens_to_port
run_test 'Responds to http request' test_http_request
