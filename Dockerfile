FROM node:18-alpine
WORKDIR /app

# Stiahni Postiz ako ZIP
RUN apk add unzip curl
RUN curl -L https://github.com/gitroomhq/postiz/archive/refs/heads/main.zip -o postiz.zip && \
    unzip postiz.zip && \
    mv postiz-main/* . && \
    rm -rf postiz.zip postiz-main

# Inštaluj a builduj
RUN npm install
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
