#!/bin/bash

# Archivo que contiene la lista de comandos wget (generado previamente)
file="lista.txt"
URL="https://raw.githubusercontent.com/PIBSAS/samp/main/"

# Verificar si el archivo de lista existe
if [ ! -f "$file" ]; then
    echo "The '$file' doesnt exist."
    exit 1
fi

# Directorio de descarga (Music folder)
music="$HOME/Music"

# Crear la carpeta Music si no existe
if [ ! -d "$music" ]; then
    mkdir -p "$music"
    echo "Carpeta '${music}' creada."
else
    echo "La carpeta '${music}' ya existe."
fi

# Leer la lista y ejecutar wget para cada línea
while IFS= read -r linea; do
    echo "Downloading: $linea"
    eval "$linea"
done < "$file"

echo "Complete."
