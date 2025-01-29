ARG DISTRO=bookworm

FROM debian:${DISTRO}

ARG DISTRO=bookworm

RUN apt-get update && apt-get install -y wget

ARG DISTRO=bookworm

# Debian Buster: install perl JSON module
RUN if [ "${DISTRO}" = "buster" ] ; then apt-get install -y libjson-perl ; fi

RUN mkdir -p /etc/apt/sources.list.d && \
    echo "deb http://download.proxmox.com/debian/pve ${DISTRO} pve-no-subscription" >/etc/apt/sources.list.d/pve-install-repo.list && \
    wget https://enterprise.proxmox.com/debian/proxmox-release-${DISTRO}.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-${DISTRO}.gpg || true && \
    wget https://enterprise.proxmox.com/debian/proxmox-ve-release-4.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-4.x.gpg && \
    wget https://enterprise.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg && \
    wget https://enterprise.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \
    apt-get update

ARG PROXMOX_VERSION

# for testing
#RUN echo proxmox-ve=${PROXMOX_VERSION} || true

RUN yes | apt-get install -y proxmox-ve=${PROXMOX_VERSION} || true

COPY . /app
