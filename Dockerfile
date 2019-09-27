FROM tensorflow/tensorflow:1.14.0-py3
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y xvfb
RUN apt-get -y install wget
RUN apt-get install unzip

EXPOSE 5005
RUN pip install mlagents_envs==0.9.2

RUN apt-get install -y git

RUN git clone https://github.com/koryakinp/mlagents-issue.git
WORKDIR /mlagents-issue

RUN chmod 755 runner.sh
ENTRYPOINT ["./runner.sh"]