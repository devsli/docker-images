FROM ubuntu:latest

RUN sed -i 's/archive/ru.archive/g' /etc/apt/sources.list \
 && apt-get update                                        \
 && apt-get install -y default-jre npm nodejs-legacy      \
                       bzip2 --no-install-recommends      \
 && apt-get clean                                         \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN npm install -g phantomjs-prebuilt

CMD ["npm", "run", "protractor"]
