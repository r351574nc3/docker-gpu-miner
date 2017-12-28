FROM ubuntu:16.04

MAINTAINER Leo Przybylski <r351574nc3 at gmail.com>
LABEL description="Ubuntu AMD OpenCL Support"

ENV AMD_DRIVER_VERSION=17.50-511655

WORKDIR /tmp/build

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get -y --no-install-recommends \
        install \
        ca-certificates \
        curl \
        xz-utils

RUN curl -OL curl -OL https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-${AMD_DRIVER_VERSION}.tar.xz -e https://support.amd.com \
    && tar -Jxvf amdgpu-pro-${AMD_DRIVER_VERSION}.tar.xz \
    && ./amdgpu-pro-${AMD_DRIVER_VERSION}/amdgpu-pro-install -y \
    && apt-get -y install rocm-amdgpu-pro \
    && echo 'export LLVM_BIN=/opt/amdgpu-pro/bin' | tee /etc/profile.d/amdgpu-pro.sh

WORKDIR /

RUN rm -rf /tmp/build \
    && apt-get -y remove xz-utils \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log} 

CMD ["/bin/bash"]