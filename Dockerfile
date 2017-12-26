FROM alpine:latest
LABEL maintainer="gwaewion@gmail.com"
EXPOSE 5000

RUN apk update
RUN apk add python3 python3-dev git openssh gcc musl-dev libffi-dev openssl-dev
RUN pip3 install --upgrade pip
RUN pip3 install flask jwt bson pymongo pyyaml
RUN ssh-keygen -N "" -q -f /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN git clone https://github.com/gwaewion/vetopytter-core.git 

WORKDIR /vetopytter-core

CMD ["python3", "-B", "VetoPytter.py"]
