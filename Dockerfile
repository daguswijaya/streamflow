FROM node:18

# Set direktori kerja
WORKDIR /app

# Install ffmpeg dan sqlite
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg sqlite3 libsqlite3-dev wget && rm -rf /var/lib/apt/lists/*

# Salin file dependensi dan kode aplikasi
COPY package*.json ./
RUN npm install
COPY . .

# Expose port yang akan digunakan oleh aplikasi
EXPOSE 5000

# Jalankan aplikasi
CMD ["src/server.js"]
