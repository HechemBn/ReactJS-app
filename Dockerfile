<<<<<<< HEAD
=======
# Utiliser une image Node pour construire l'application
>>>>>>> 610e1e4c7e1ad2ddea2f0debeb63f4c38b4f78c0
FROM node:14-alpine AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du code source
COPY . .

# Build de l'application React
RUN npm run build

# Utiliser Nginx pour servir l'application
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
