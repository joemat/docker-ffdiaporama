FROM ubuntu:trusty

MAINTAINER Joerg Matysiak

RUN apt-get update && apt-get install -y software-properties-common && \
   add-apt-repository ppa:ffdiaporamateam/stable && \
   apt-get update && \
   apt-get install -y ffdiaporama ffdiaporama-texturemate  ffdiaporama-openclipart && \
   apt-get clean      

ENV USERNAME ffdiaporama
ENV AUDIOGROUP audio
# Replace 1000 with your user 
ENV USERID 1000

RUN adduser --uid $USERID --disabled-password --ingroup $AUDIOGROUP $USERNAME

WORKDIR /home/$USERNAME

USER $USERNAME

CMD /usr/bin/ffDiaporama
