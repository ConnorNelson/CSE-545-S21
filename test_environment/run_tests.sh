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


color_echo $BLUE "[+]  Creating .tar.gz of submission..."
tar czv -C submission -f submission.tar.gz $(ls submission)

color_echo $BLUE "[+]  Building docker container..."
docker build -t test_environment .

color_echo $BLUE "[+]  Running tests..."
docker run -it --rm test_environment

color_echo $BLUE "[+]  DONE!"
