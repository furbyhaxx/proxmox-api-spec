ARG DISTRO
ARG PROXMOX_VERSION

ENV DEBIAN_FRONTEND=noninteractive

FROM debian:${DISTRO}

# 1. Add proxmox repo, key and update repo index
RUN mkdir -p /etc/apt/sources.list.d \
    echo "deb http://download.proxmox.com/debian/pve ${DISTRO} pve-no-subscription" >/etc/apt/sources.list.d/pve-install-repo.list \
    if [ "${DISTRO}" = "buster" ] ; then wget https://enterprise.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg ; fi \
    if [ "${DISTRO}" = "stretch" ] ; then wget https://enterprise.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg ; fi \
    if [ "${DISTRO}" = "jessie" ] ; then wget https://enterprise.proxmox.com/debian/proxmox-ve-release-4.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-4.x.gpg ; fi \
    if [ "${DISTRO}" != "buster" && "${DISTRO}" != "jessie" && "${DISTRO}" != "stretch" ] ; then wget https://enterprise.proxmox.com/debian/proxmox-release-${DISTRO}.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-${DISTRO}.gpg ; fi \
    apt-get update > /dev/null 2>&1

# 2. Install wget and optionally libjson-perl
RUN apt-get install -y wget && \
    if [ "${DISTRO}" = "buster" || "${DISTRO}" = "stretch" ] ; then apt-get install -y libjson-perl ; fi

# for testing
#RUN echo proxmox-ve=${PROXMOX_VERSION} || true

# 3. Install Proxmox VE
RUN no | apt-get install -y proxmox-ve=${PROXMOX_VERSION} || true

COPY . /app
