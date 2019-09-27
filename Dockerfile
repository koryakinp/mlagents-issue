FROM tensorflow/tensorflow:1.14.0-py3
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y xvfb
RUN apt-get -y install wget
RUN apt-get install unzip

EXPOSE 5005
RUN pip install mlagents_envs==0.9.2

RUN mkdir mlagents
WORKDIR /mlagents

RUN wget https://github.com/koryakinp/MLDriver/releases/download/2.0/MLDriver_Linux_x86_64.zip
RUN mkdir environments
RUN unzip MLDriver_Linux_x86_64.zip -d environments/

RUN wget https://gist.github.com/koryakinp/afaeacb021bfb342d20b8cbdacdece9f/raw/cde75e28d5a5f9ac4e6419698d34300ac1d134d7/main.py

ENTRYPOINT ["/bin/bash"]
CMD ["runner.sh"]