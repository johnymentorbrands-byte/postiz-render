FROM node:18-alpine
WORKDIR /app

# Stiahni Postiz ako tar.gz
RUN apk add curl
RUN curl -L https://github.com/gitroomhq/postiz/tarball/main -o postiz.tar.gz && \
    tar -xzf postiz.tar.gz --strip-components=1 && \
    rm postiz.tar.gz

# Inštaluj a builduj
RUN npm install
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
