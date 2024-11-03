# Ejercicio-03.11.2024-Bash-ASO_DHJ
Ejercicio realizado para la clase. (P4: [OBLIGATORIA, EVALUABLE]: Examen Curso pasado)

# pingServersDHJ.sh

## Descripción
`pingServersDHJ.sh` es un script Bash que verifica el estado de los servidores listados en un archivo de texto. Comprueba si los servidores responden a peticiones de `ping`, muestra un informe en la consola y, si se solicita, guarda el informe en un archivo con un nombre específico.

Este script fue desarrollado por **David Hernández Jiménez** como parte de un examen práctico en la asignatura **Administración de Sistemas Operativos - 2º ASIR**.

## Características
- Verificación de la existencia del archivo de entrada.
- Comprobación de conectividad con `ping`.
- Generación de un informe detallado con estadísticas.
- Opción para guardar el informe en un archivo de texto.
- Estructuración con funciones para mayor claridad y mantenimiento.

## Formato del archivo de entrada
El archivo de entrada debe seguir este formato:
```txt
NOMBRE_SERVIDOR:IP_ADDRESS
PIKACHU:172.26.0.23
BULBASAUR:172.26.0.50
CHARMANDER:172.26.0.33
SQUIRTLE:172.26.0.48
Ejemplo de uso
Ejecuta el script con el siguiente comando:
./pingServersDHJ.sh -file servers.txt


Estructura del informe
El script genera un informe con la siguiente estructura:

*****************************************************
SERVER STATUS - DATE: 11/11/2022 10:15
*****************************************************
PIKACHU: UP
BULBASAUR: DOWN
CHARMANDER: UP
SQUIRTLE: DOWN
*****************************************************
STATISTICS
*****************************************************
4 - - > Servidores Analizados
2 - - > Servidores UP
2 - - > Servidores DOWN
*****************************************************
END REPORT - BY David Hernández Jiménez
*****************************************************

Guardar el informe
El script pregunta al usuario si desea guardar el informe. Si la respuesta es afirmativa, el archivo se guarda con un nombre como:


serverStatus-DHJ-ddMMYYYY-HH:MM.txt
Parámetros
-file: Nombre del archivo de entrada. Ejemplo:


./pingServersDHJ.sh -file servers.txt
Manejo de errores
Archivo no especificado: Se muestra un mensaje y se termina la ejecución.
Archivo no encontrado: Muestra un mensaje de error y termina la ejecución.


Cómo contribuir
Haz un fork del repositorio.

Crea una rama (git checkout -b feature-nueva-funcion).
Haz un commit (git commit -m 'Añadida nueva función').
Haz push a la rama (git push origin feature-nueva-funcion).
Abre un Pull Request.

Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

Autor
David Hernández Jiménez
