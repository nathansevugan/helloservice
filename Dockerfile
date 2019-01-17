FROM ubuntu:latest

MAINTAINER ranganathan.sevuganchetty@sabre.com

# Define environment variables.


USER root

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN apt-get install curl -y
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh

RUN mkdir /app

WORKDIR /app

COPY ./helloservice.py /app
COPY ./requirements.txt /app

RUN pip install -r requirements.txt


# install flask
RUN python --version
RUN pip install Flask


# run as non-root user

USER 1001

# Default http port
EXPOSE 5000


ENTRYPOINT ["python"]
CMD ["helloservice.py"]

#CMD [ "python", "./helloservice.py" ]
#CMD  [ "sh", "-c", "python /usr/src/app/helloservice.py&"]


