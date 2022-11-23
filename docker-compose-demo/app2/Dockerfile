FROM ubuntu:20.04
RUN apt -qq -y update \
	&& apt -qq -y upgrade
ENV APP /app
RUN mkdir $APP
RUN apt update
RUN apt-get install build-essential python3-dev -y
RUN apt-get install python3-pip -y
WORKDIR $APP
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
ENTRYPOINT [ "python3" ]
CMD [ "run.py" ]