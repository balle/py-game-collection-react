FROM node:alpine

RUN apk update
RUN apk upgrade

# RUN addgroup app
# RUN adduser -S -G app app
# USER app

RUN mkdir /code
COPY package.json package-lock.json /code/
WORKDIR /code

RUN npm install

COPY . .

EXPOSE 5173/tcp
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
