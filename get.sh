#!/bin/bash

# URL base
URL="https://raw.githubusercontent.com/PIBSAS/samp/main/"
file="${URL}lista.txt"

# Verificar si el archivo de lista existe en el servidor
if ! curl --head --silent --fail "$file" > /dev/null; then
    echo "The '$file' doesn't exist."
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

# Descargar el archivo de lista
curl -o lista.txt "$file"

# Leer la lista y ejecutar wget para cada línea
while IFS= read -r linea; do
    echo "Downloading: $linea"
    eval "$linea"
done < lista.txt

# Limpieza
rm lista.txt

echo "Complete."
