FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -yy -q \
    install \
    iptables \
    ca-certificates \
    file \
    util-linux \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cp /usr/bin/nsenter /nsenter

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -yy -q \
    install curl \
    && mkdir -p /opt/cni/bin \
    && curl -L https://github.com/appc/cni/releases/download/v0.3.0/cni-v0.3.0.tgz | tar zxv -C /opt/cni/bin \
    && DEBIAN_FRONTEND=noninteractive apt-get remove curl -y \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY hyperkube /hyperkube
RUN chmod a+rx /hyperkube

COPY master.yml /etc/kubernetes/manifests/master.yml
