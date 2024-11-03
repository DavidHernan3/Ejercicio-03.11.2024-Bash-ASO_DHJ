#!/bin/bash


# Nombre del script: pingServersDHJ.sh
# Autor: David Hernández Jiménez
# Script Checker de estado de los servidores especificados en un archivo y presenta un informe detallado + amigable. (V1)


# Mostrar el informe en pantalla
function mostrar_informe {
    echo "*****************************************************"
    echo "REPORTE DE ESTADO DE SERVIDORES - FECHA: $(date '+%d/%m/%Y %H:%M')"
    echo "*****************************************************"
   
    for server in "${servers[@]}"; do
        nombre=$(echo "$server" | cut -d':' -f1)
        ip=$(echo "$server" | cut -d':' -f2)
       
        # Verificamos si el servidor responde al ping
        if ping -c 1 -W 1 "$ip" &>/dev/null; then
            echo "$nombre: UP"
            ((up_count++))
        else
            echo "$nombre: DOWN"
            ((down_count++))
        fi
    done
   
    echo "*****************************************************"
    echo "ESTADÍSTICAS"
    echo "*****************************************************"
    echo "${#servers[@]} servidores analizados."
    echo "$up_count servidores están funcionando (UP)."
    echo "$down_count servidores no respondieron (DOWN)."
    echo "*****************************************************"
    echo "FIN DEL REPORTE - Por David Hernández Jiménez"
    echo "*****************************************************"
}


# Verificación parámetros de entrada
if [[ "$1" != "-file" || -z "$2" ]]; then
    echo "Hola, parece que olvidaste indicar el archivo con los servidores."
    echo "Uso correcto: $0 -file nombre_del_archivo"
    echo "Por favor, intenta de nuevo pasando el archivo como segundo argumento. Gracias."
    exit 1
fi


archivo="$2"


# Comprobamos si el archivo existe o no
if [[ ! -f "$archivo" ]]; then
    echo "Error: No pude encontrar el archivo '$archivo'. Asegúrate de que el nombre es correcto y que el archivo está en el lugar adecuado."
    exit 2
fi


# Cargamos el contenido del archivo en un ""array""
mapfile -t servers < "$archivo"


# Inicializamos contadores
up_count=0
down_count=0


# Mostramos el informe en pantalla
echo "Comenzando a analizar los servidores. Esto podría tardar unos segundos..."
mostrar_informe


# Preguntamos al usuario si desea guardar el informe en un archivo
read -p "¿Te gustaría guardar este informe en un archivo de texto para futuras referencias? (sí/no): " respuesta
if [[ "$respuesta" == "sí" || "$respuesta" == "si" ]]; then
    nombre_archivo="serverStatus-DHJ-$(date '+%d%m%Y-%H:%M').txt"
    mostrar_informe > "$nombre_archivo"
    echo "Informe guardado con exito. Puedes encontrarlo en '$nombre_archivo'."
    echo "Gracias por usar este script,"
    echo "Hecho por David. Espero que te haya resultado útil."
else
    echo "No se ha guardado el informe. Si lo necesitas más tarde, siempre puedes ejecutar el script de nuevo."
fi
