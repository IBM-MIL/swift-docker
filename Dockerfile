FROM ubuntu
MAINTAINER Robert F. Dickerson <rfdickerson@us.ibm.com>

LABEL Description="Image used to create a Linux environment with the Swift 2.2 compiler installed"
RUN apt-get update && apt-get install -y openssh-server
RUN wget https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2016-01-06-a/swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu14.04.tar.gz
RUN tar xzvf swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu14.04.tar.gz
# RUN ./swift-2.2-SNAPSHOT-2016-01-06-a-ubuntu14.04/usr/bin/swiftc