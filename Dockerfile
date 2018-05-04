FROM debian:stretch
MAINTAINER  Nicolas Wild <nwild@nyxmo.com>
LABEL version "1.0.0"

# Update the package repository and install applications
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get -yqq install \
	git \
	make \
	build-essential \
	binutils-dev \
	curl \
	liblzma-dev \
	zlib1g-dev \
	genisoimage \
	isolinux \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 git://git.ipxe.org/ipxe.git /ipxe

WORKDIR /ipxe/src

COPY defaults.ipxe /ipxe/src
COPY build.sh /ipxe/src
RUN chmod 777 build.sh

RUN ./build.sh

CMD ["./build.sh"]
