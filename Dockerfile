FROM node:16.13.2-alpine

WORKDIR /usr/src/app

RUN npm install -g pm2

COPY package.json ./
COPY package-lock.json ./

RUN npm install


COPY . .

RUN npm run build

EXPOSE 8080
CMD ["pm2", "start", "npm", "--name", "\"nextjs\"", "--interpreter", "bash", "--", "start", "--port=8080"]