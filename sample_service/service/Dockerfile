FROM python:3.8

RUN apt-get update && apt-get install -y socat

RUN useradd -ms /bin/bash --uid 31337 chall
USER chall
WORKDIR /home/chall

CMD cd service/rw && socat tcp-l:4242,reuseaddr,fork exec:"../ro/service"