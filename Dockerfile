FROM ubuntu:trusty

MAINTAINER Joerg Matysiak

## install ffdiaporama from ppa
## install all available fonts 
RUN apt-get update && apt-get install -y software-properties-common && \
   add-apt-repository ppa:ffdiaporamateam/stable && \
   apt-get update && \
   apt-get install -y ffdiaporama ffdiaporama-texturemate  ffdiaporama-openclipart && \
   apt-get install $(apt-cache search  ^fonts-  | cut -f1 '-d ') && \
   apt-get clean      

ARG USERNAME=ffdiaporama
ARG AUDIOGROUP=29
ARG USERID=1000

RUN export AUDIOGROUP_NAME=$(sed -e  's/^\([^:]*\):.*:'${AUDIOGROUP}':.*$/\1/p' -n /etc/group); \
       if [ -z "$AUDIOGROUP_NAME" ]; then \
                addgroup --gid $AUDIOGROUP ffd_audio; \
		export AUDIOGROUP_NAME=ffd_audio; \
       fi; \
       adduser --uid $USERID --disabled-password --ingroup $AUDIOGROUP_NAME $USERNAME

WORKDIR /home/$USERNAME

USER $USERNAME

CMD /usr/bin/ffDiaporama
