FROM tensorflow/tensorflow:1.11.0-py3

RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.7
RUN apt-get install -y python3.7-dev

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y xvfb
RUN apt-get -y install wget
RUN apt-get -y install vim

EXPOSE 5005

RUN apt-get install -y git
WORKDIR /
RUN git clone https://github.com/koryakinp/mlagents-issue.git
WORKDIR /mlagents-issue
RUN mkdir environemnts
RUN unzip env_Linux_x86_64.zip -d environments/

RUN pip install pipenv
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN pipenv install --python 3.7
RUN pipenv install mlagents_envs==0.9.2

RUN chmod 755 runner.sh
ENTRYPOINT ["./runner.sh"]