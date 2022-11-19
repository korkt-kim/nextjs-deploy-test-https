FROM node:16.13.2-alpine

WORKDIR /usr/src/app

# RUN npm install -g pm2

COPY package.json ./
COPY package-lock.json ./

RUN npm install


COPY . .

RUN npm run build

EXPOSE 80
CMD ["npm", "start"]

