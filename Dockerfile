FROM node:20-bookworm-slim
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN cd client && npm ci --include=dev --no-audit --no-fund && npm run build
ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "start"]
