FROM node:18

# Set direktori kerja
WORKDIR /app

# Install ffmpeg dan pm2
RUN apt update && apt install -y ffmpeg

# Salin file dependensi dan kode aplikasi
COPY package*.json ./
RUN npm install
COPY . .

# Expose port yang akan digunakan oleh aplikasi
EXPOSE 5000

# Jalankan aplikasi
CMD ["src/server.js"]
