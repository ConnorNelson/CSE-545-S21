FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y build-essential \
                       netcat \
                       curl

RUN mkdir /submission
WORKDIR /submission

ADD test.sh .
ADD submission.tar.gz .

RUN make

CMD ./test.sh
