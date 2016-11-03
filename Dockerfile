FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV REDIS_HOST redis

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test && dpkg -i ./front50-web/build/distributions/*.deb

CMD ["/opt/front50/bin/front50"]
