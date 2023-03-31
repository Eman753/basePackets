#!/bin/bash

# Script d'installation automatique de paquets de base pour un nouveau serveur

# Vérifier que le fichier est fourni en entrée
if [ -z "$1" ]; then
  echo "Veuillez fournir un fichier en entrée."
  exit 1
fi

# Vérifier que le fichier existe
if [ ! -f "$1" ]; then
  echo "Le fichier spécifié n'existe pas."
  exit 1
fi

# On met à jour la liste de paquets
apt-get update

# On vérifie que la miste à jour de la liste des paquets fonctionne
if [ ! $? -eq 0 ]
then
	echo "La mise à jour de la liste des paquets a echoué"
	exit 1
fi

# Installer les paquets
while read -r package; do
  apt-get install -y "$package"
done < "$1"
