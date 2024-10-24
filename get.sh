#!/bin/bash

# Archivo que contiene la lista de comandos wget (generado previamente)
file="lista.txt"

# Verificar si el archivo de lista existe
if [ ! -f "$file" ]; then
    echo "The '$file' doesnt exist."
    exit 1
fi

# Directorio de descarga (Music folder)
get="$HOME/Music"

# Crear la carpeta Music si no existe
if [ ! -d "$get" ]; then
    mkdir -p "$get"
    echo "Carpeta '${get}' creada."
else
    echo "La carpeta '${get}' ya existe."
fi

# Leer la lista y ejecutar wget para cada línea
while IFS= read -r linea; do
    echo "Downloading: $linea"
    eval "$linea"
done < "$file"

echo "Complete."
