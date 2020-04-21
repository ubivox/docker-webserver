FROM litespeedtech/openlitespeed:1.6.12-lsphp74

RUN apt-get update && apt-get install lsphp74-pspell

# Install node
RUN curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs -y