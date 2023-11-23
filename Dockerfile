FROM ubuntu:22.04
LABEL org.opencontainers.image.authors="Rohan Singh <rohan@washington.edu>,Tristan Crichton <stan@tcrichton.co.uk>"
 

ENV DEBIAN_FRONTEND noninteractive

# defaults for debify
ENV APTLY_DISTRIBUTION unstable
ENV APTLY_COMPONENT main
ENV KEYSERVER keyserver.ubuntu.com

ENV GNUPGHOME /.gnupg

# install aptly and xz-utils
RUN apt-get update && \
    apt-get install -y aptly xz-utils && \
    apt-get clean

ADD debify.sh /debify.sh
ENTRYPOINT ["/debify.sh"]
