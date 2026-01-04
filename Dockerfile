FROM node:18-alpine
WORKDIR /app

# Stiahni celý Postiz z originálneho repa
RUN apk add git
RUN git clone https://github.com/gitroomhq/postiz.git .

# Inštaluj a builduj
RUN npm install
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
