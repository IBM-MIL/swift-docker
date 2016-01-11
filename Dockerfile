FROM ubuntu:15.10
MAINTAINER Mobile Innovation Lab

LABEL Description="Image used to create a Linux environment with the Swift 2.2 compiler installed"

# Linux OS dependencies
RUN apt-get update
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get install -y libhttp-parser-dev
RUN apt-get install -y gcc-4.8
RUN apt-get install -y g++-4.8
RUN apt-get install -y libcurl3
RUN apt-get install -y libkqueue-dev
RUN apt-get install -y openssh-server
RUN apt-get install -y libkqueue-dev
RUN apt-get install -y automake
RUN apt-get install -y libbsd-dev
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y libtool
RUN apt-get install -y clang

# Install Swift
RUN wget https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2016-01-06-a/swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu15.10.tar.gz
RUN tar xzvf swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu15.10.tar.gz
ENV PATH /swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu15.10/usr/bin:$PATH
RUN swiftc -h

# Clone and install libdispatch
RUN git clone -b opaque-pointer git://github.com/seabaylea/swift-corelibs-libdispatch
RUN `cd swift-corelibs-libdispatch && sh ./autogen.sh && ./configure && make && make install`
