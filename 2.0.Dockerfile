
FROM anapsix/alpine-java
MAINTAINER Justin Commu

RUN mkdir /allure
RUN mkdir /allure-results
RUN mkdir /allure-report
RUN mkdir /allure-config

RUN apk update && \
	apk add ca-certificates && \
	update-ca-certificates && \
	apk add openssl && \
	apk add unzip

RUN wget https://dl.bintray.com/qameta/generic/io/qameta/allure/allure/2.0.0/allure-2.0.0.tgz
RUN unzip allure-commandline.zip -d /allure
RUN rm allure-commandline.zip
ENV PATH="/allure/bin:${PATH}"
ENV ALLURE_CONFIG="/allure-config/allure.properties"
