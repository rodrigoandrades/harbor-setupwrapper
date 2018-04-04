FROM photon:2.0

WORKDIR /

RUN tdnf install -y gzip tar python python-setuptools && \
    curl -O -L https://storage.googleapis.com/harbor-releases/release-1.4.0/harbor-online-installer-v1.4.0.tgz && \
    tar -xvf harbor-online-installer-v1.4.0.tgz && \
    rm harbor-online-installer-v1.4.0.tgz

WORKDIR /harbor

ADD ./harbor-setupwrapper.sh .
ADD ./harbor-entrypoint-db.sh .

RUN chmod +x harbor-setupwrapper.sh