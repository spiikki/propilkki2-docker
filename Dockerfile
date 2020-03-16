FROM ubuntu:bionic

RUN mkdir /pilkki
WORKDIR /pilkki

RUN apt update && apt -yy upgrade
RUN apt install -yy wget gnupg2
RUN wget -O - http://procyon.ddns.net:8080/propilkki_pub.gpg.key | apt-key add -
RUN echo "deb http://procyon.ddns.net:8080/repos/apt/ubuntu bionic main" | tee -a /etc/apt/sources.list
RUN apt update
RUN apt install pp2host
COPY pp2host.conf /etc/pp2host/.
COPY autohost.ini /etc/pp2host/static/.
COPY autoscript.txt /etc/pp2host/static/.
COPY run_game.sh run_game.sh
ENTRYPOINT bash /pilkki/run_game.sh