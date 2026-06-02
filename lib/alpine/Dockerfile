# Fetch base image
FROM alpine

# Set Environment Variables
ENV USER="dev" \
	HOME="/home/dev" \
	LOCAL="/usr/local" \
	TMP="/tmp"
ENV	BIN="${LOCAL}/bin" \
	LIB="${LOCAL}/lib" \
	WS="${HOME}/workspace"

# Switch to user dev
RUN adduser dev -D --shell /bin/sh
USER dev
RUN mkdir -p ${WS}
