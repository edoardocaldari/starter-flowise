FROM flowiseai/flowise:latest
RUN apk add --update libc6-compat python3 make g++
# needed for pdfjs-dist
RUN apk add --no-cache build-base cairo-dev pango-dev

# Install Chromium
RUN apk add --no-cache chromium

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV DEBUG=true
ENV LOG_LEVEL=debug 
ENV TOOL_FUNCTION_BUILTIN_DEP=crypto,fs
ENV TOOL_FUNCTION_EXTERNAL_DEP=moment,lodash 
WORKDIR /usr/src/packages

EXPOSE 3000

CMD [ "yarn", "start" ]
