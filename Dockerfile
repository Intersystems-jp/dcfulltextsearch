ARG IMAGE=containers.intersystems.com/intersystems/iris-community-arm64:2022.1.0.209.0
ARG IMAGE=containers.intersystems.com/intersystems/iris-community-arm64:2022.2.0.368.0
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2022.1.0.209.0
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2022.2.0.368.0
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  src src
COPY  csp $ISC_PACKAGE_INSTALLDIR/csp/user/
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
