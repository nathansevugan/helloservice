FROM ubuntu:latest

MAINTAINER ranganathan.sevuganchetty@sabre.com

# Define environment variables.


#USER root

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN mkdir /app

WORKDIR /app

COPY ./helloservice.py /app
COPY ./requirements.txt /app

RUN pip install -r requirements.txt


# install flask
RUN python --version
RUN pip install Flask


# run as non-root user


ENTRYPOINT ["python"]
CMD ["helloservice.py"]

#CMD [ "python", "./helloservice.py" ]
#CMD  [ "sh", "-c", "python /usr/src/app/helloservice.py&"]


# Default http port
EXPOSE 5000
