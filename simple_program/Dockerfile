FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app

ADD simple_program.c .

RUN gcc -fno-stack-protector simple_program.c -o simple_program

RUN useradd -p s3cr3t_p455w0rd admin

CMD /app/simple_program
