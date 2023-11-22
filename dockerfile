#Choose the image
FROM python:3.11-slim

#Define an environment variable
ENV APP \app

WORKDIR $APP

#Set X-server for GUI in a container. I didn`t install poetry or requirements because we don`t have dependencies except python3.11
RUN apt-get update && apt-get install -y libtk8.6 x11-apps xvfb

ENV DISPLAY=:99

#Copy all files to a directory
COPY . .

#This one should launch X-server when container is started.
CMD Xvfb :99  -screen 0 1024×768×16 & export DISPLAY=:99 && python \main.py