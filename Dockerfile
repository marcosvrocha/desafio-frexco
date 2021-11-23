FROM node:16.13 as frexco-frontend

WORKDIR /app
 
COPY package*.json ./
 
RUN yarn

COPY . .
 
EXPOSE 3000
 
RUN yarn build

FROM nginx:1.20.2-alpine

COPY --from=frexco-frontend /app/build/ /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


