#build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm","run","start"]

# run phase
FROM nginx
#port mapping
EXPOSE 80
# build 폴더 복사 , 다른 phase 에서 가져옴
# from , destination
COPY --from=builder /app/build /usr/share/nginx/html
#start 는 디폴트
