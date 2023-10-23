# Build local monorepo image
# docker build --no-cache -t  flowise .

# Run image
# docker run -d -p 3000:3000 flowise

FROM flowiseai/flowise:latest
RUN apk add --update libc6-compat python3 make g++
# needed for pdfjs-dist
RUN apk add --no-cache build-base cairo-dev pango-dev

# Install Chromium
RUN apk add --no-cache chromium

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
# Set environment variables for customization
ENV LANGCHAIN_TRACING_V2=true
ENV LANGCHAIN_ENDPOINT=https://api.smith.langchain.com
ENV LANGCHAIN_API_KEY=your_api_key
ENV LANGCHAIN_PROJECT=your_project
ENV DEBUG=true
ENV LOG_LEVEL=debug 
ENV TOOL_FUNCTION_BUILTIN_DEP=crypto,fs
ENV TOOL_FUNCTION_EXTERNAL_DEP=moment,lodash 
WORKDIR /usr/src/packages

EXPOSE 3000

CMD [ "yarn", "start" ]
