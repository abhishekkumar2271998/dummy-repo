# Fetch base image
FROM zamstation/alpine

# Process Arguments
ARG version=11 \
	version8BelowPrefix=""

# Set Environment Variables
ENV JAVA_VERSION=${version} \
	JAVA_HOME="/usr/lib/jvm/java-${version8BelowPrefix}${version}-openjdk"
ENV	PATH="${PATH}:${JAVA_HOME}/bin"

# Install JDK
USER root
RUN apk add openjdk${JAVA_VERSION} --no-cache

# Cleanup
USER dev
