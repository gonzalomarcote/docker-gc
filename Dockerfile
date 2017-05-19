# Dcoker image for gc "Garbage Collector"
FROM gliderlabs/alpine:3.2
LABEL version="0.1" project="cbyg" type="garbage-collector"
ENV REFRESHED_AT 2017051900
MAINTAINER Gonzalo Marcote "gonzalomarcote@gmail.com"

RUN apk --update add \
	docker \
	&& rm -rf /var/cache/apk/*

RUN echo "30 15 * * *	/bin/docker-gc" >> /etc/crontabs/root
ADD docker-gc /bin/docker-gc

CMD ["crond", "-f"]
