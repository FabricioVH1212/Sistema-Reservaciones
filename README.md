# Autor: Fabricio Vindas Hernandez
# Sistema-Reservaciones - Proyecto a cliente(Programación V)

## Introducción
El proyecto consiste en el desarrollo de un "Sistema de Reservaciones" de hospedaje para un hotel, que permite controlar credenciales de acceso, 
conocer las diferentes reservaciones realizadas en el sistema, registrar u modificar una reservación y consultar un detalle de la misma , así como manejar el 
CRUD con las habitaciones del sistema de hotel basado en Trivago.

## Instalación
<hr>
Instrucciones para la instalación del ambiente de desarrollo dev

## Software requerido
-Visual Studio 
-SQL Server

## Proceso de instalación

### SQL-Server

Descargar el instalador de la pagina oficial de [SQL-Server](https://www.microsoft.com/es-es/sql-server/sql-server-downloads) y proceder a la instalacion. 

### Importación de la Base de Datos
Una vez descargado o clonado el repositorio, en la carpeta BD viene el 
script de base de datos que tiene que ser importado para que se cree las tablas
y otros elementos como tal.

### Comprobar la conexión de la Base de datos
En el archivo Web.Config viene el connectionString que tiene
que ser modificado con los datos de su BD para correrlo en en su sistema.

### Mapeo de la Base de Datos
Eliminar los archivos de la carpeta data y volver a hacer el mapeo
en caso de errores, nombres a usar
  *DBMapping (Archivo de mapeo)
  *SistemaReservacionEntities(Archivos con entidades)
  *SistemaReservacionModel(Archivos con los modelos)
 Es importante usar estos nombres al pie de la letra para que no haya problema con el código.
 
 
Para visualizar en el navegador, debemos iniciar el proyecto en el Visual Studio http://localhost:3000


© 2021 GitHub, Inc.<br>
Terms<br>
Privacy<br>
Security<br>
Status<br>
Docs<br>
Contact GitHub
