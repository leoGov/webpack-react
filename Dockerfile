# Используем базовый образ Node.js
FROM node:20-alpine

# Устанавливаем http-server глобально
RUN npm install -g http-server

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходный код приложения
COPY . .

# Определяем порт, который будет открыт в контейнере
EXPOSE 8080

# Команда для запуска приложения при запуске контейнера
CMD ["http-server", "dist"]
