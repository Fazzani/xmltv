FROM debian 
ENV GITHUB_API_TOKEN apikey

RUN apt-get -qq -y update && apt-get -y install xmltv-util

WORKDIR /work

COPY merge.sh .

VOLUME ["/work"]

ENTRYPOINT tv_merge *.xmltv