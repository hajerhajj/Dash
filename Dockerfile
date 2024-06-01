# Utilisez l'image officielle de Python comme base
FROM python:3.10

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers de l'application dans le conteneur
COPY . /app

# Installez les dépendances
RUN apt-get update && apt-get install -y libpq-dev && pip install psycopg2-binary
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Exécutez makemigrations lors de la construction de l'image
RUN python manage.py makemigrations

# Exposez le port utilisé par Django
EXPOSE 8092

# Commande pour lancer l'application Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8092"]
