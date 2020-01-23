FROM debian:buster
MAINTAINER Alexis BIZON
LABEL	name="plantuml_cmake" \
	version="v1.0"

ENV	OUTPUT_TYPE=svg \
	ENTRYPOINT_PLANTUML_FILE=in.uml \
	DEBIAN_FRONTEND=noninteractive

RUN	apt-get -y update && \
	apt-get -y install plantuml && \
	apt-get -y install python && \
	apt-get -y install graphviz && \
	apt-get -y install cmake && \
	apt-get -y install make

RUN	apt-get -y install ca-certificate && \
	apt-get -y install wget

RUN     mkdir /plantuml

RUN	wget "https://netix.dl.sourceforge.net/project/plantuml/plantuml.jar" -O /plantuml/plantuml.jar 

COPY	entrypoint.sh /

VOLUME	["/plantuml/user_content"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
