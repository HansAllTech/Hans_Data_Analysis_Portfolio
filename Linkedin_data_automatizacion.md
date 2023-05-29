<a name="Inicio"></a>    
# Automatización, Limpieza y Análisis - Linkedin Data [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2) ([ES](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/E-Learning_Cursos_Online.md#limpieza-de-datos---e-learning-cursos-online--es--en) | [EN](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/E-Learning_Online_Courses.md#data-cleaning---e-learning-online-courses--es--en))
  
<p align = 'center'><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241485467-97a1c50d-1fe4-49d0-a83f-b7b3f8bc7b2c.png" width ="25%"></p>
  
<a name="Tabla-de-contenido2"></a>
## Tabla de Contenido [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
- [Problema de negocio](#Problema)
- [Objetivo](#Objetivo2)  
- [Cliente](#Cliente2)
- [Diagrama](#Diagrama2)
- [La Solución](#La-solucion2)
- [Análisis Previo](#Análisis-Previo2)
- [Ejecución](#Ejecución2)   
- [Conclusiones](#Conclusiones2) 
- [Recomendaciones](#Recomendaciones2) 

<a name="Problema"></a>    
## Problema de negocio [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align='justify'>
En nuestro negocio, nos enfrentamos al desafío de extraer conclusiones significativas sobre el mercado laboral en el ámbito de los datos. Para abordar este problema, hemos obtenido información a través de una descarga de datos obtenida mediante webscraping. Sin embargo, antes de utilizar estos datos, es crucial llevar a cabo un proceso de validación para garantizar su precisión y confiabilidad. Una vez validados, nuestro objetivo es llegar a conclusiones específicas y relevantes que nos brinden una comprensión profunda del mercado laboral relacionado con los datos.  
 </p> 
Este problema empresarial implica los siguientes pasos clave:  

<blockquote class="tabulacion">
<p align='justify'>1. Validación de datos: Implementar un proceso riguroso de validación para asegurarnos de que los datos obtenidos a través del webscraping sean correctos y estén libres de errores.</p>  
<p align='justify'>2. Análisis de mercado laboral: Realizar un análisis exhaustivo de los datos validados para identificar tendencias, patrones y oportunidades en el mercado laboral relacionado con los datos.</p>
<p align='justify'>3. Conclusiones y recomendaciones: Extraer conclusiones significativas basadas en el análisis realizado y utilizarlas para tomar decisiones estratégicas, identificar áreas de mejora o desarrollar estrategias de contratación efectivas.
Al abordar este problema de negocio, esperamos obtener una comprensión profunda y precisa del mercado laboral en el mundo de los datos, lo que nos permitirá tomar decisiones informadas y estratégicas para el crecimiento y éxito de nuestra organización.</p>
</blockquote>

<a name="Objetivo2"></a>
## Objetivo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align='justify'>
El objetivo principal de nuestro proyecto es extraer conclusiones relevantes sobre el mercado laboral en el mundo de los datos. Para lograrlo, contamos con información obtenida a través de una descarga de datos mediante webscraping. Sin embargo, antes de llegar a conclusiones, debemos validar la integridad y precisión de los datos recolectados. Una vez completada la validación, nos enfocaremos en analizar y explorar los datos con el fin de identificar patrones, tendencias y puntos clave del mercado laboral en el ámbito de los datos. Estas conclusiones nos permitirán obtener una comprensión más profunda y precisa de este mercado, y nos ayudarán a tomar decisiones estratégicas y orientadas al crecimiento en este sector en constante evolución.
</p>  

<a name="Cliente2"></a>
## El Cliente[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
Somos analistas de datos y queremos analizar el mercado laboral en éstos roles. Para eso estamos obtieniendo datos de los puestos de trabajo que figuran en linkedin en áreas de análisis de datos para distintos países.


 |<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241487791-af150f5c-3f47-4956-9729-0fd594194731.png"> |<p align="justify">Linkedin: Es una red social profesional donde muchas empresas publican ofertas de trabajo.</p> | 
| :------------------------------------------------| :-------------------------------------------------| 




<a name="Diagrama2"></a>
## Diagrama [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="center">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241489016-25e9235c-e528-4c41-ba2c-83e7e5b06844.png" width= 60% height=60%>
</p>    

<a name="La-solucion2"></a>
## La solución [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
El primer paso es limpiar los datos y crear nuevas tablas con los datos limpios. El segundo paso será automatizar esa limpieza con un SP que se ejecute de forma diaria y nos actualice la información en la nueva tabla.   

<a name="Análisis-Previo2"></a>
## Análisis Previo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
1. ¿Que tipo de datos tenemos?  
2. ¿Que limpieza observamos que podríamos hacer?   
3. ¿Como validamos datos?  
  
<a name="Ejecución2"></a>    
## Ejecución [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
### Parte I - Crear tabla linkedin_data + SP de recarga de datos  
1. Cargar la base de datos  “linkedin_data”  
```sql
CREATE DATABASE  IF NOT EXISTS `linkedin_data`
```   

2. Crear tabla linkedin_ofertas 
```sql
CREATE TABLE linkedin_data.linkedin_ofertas (
id_oferta INT PRIMARY KEY,
fecha_actualizacion DATETIME,
nombre_empresa VARCHAR (200),
fecha_busqueda_oferta_linkedin DATETIME,
fecha_publicacion_oferta DATE,
ubicacion_oferta VARCHAR(200),
search_id_oferta INT,
titulo_oferta VARCHAR (200),
fecha_actualizacion_sp DATETIME
)
```  

3. Modificar las restricciones de la fecha ejecutuando la siguiente sentencia:   
```sql
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';)
``` 
   
4. Definir la consulta que va a dejar los datos como queremos. (limpiarlos)  
```sql
INSERT INTO linkedin_data.linkedin_ofertas
SELECT 
id AS id_oferta,
_fivetran_synced AS fecha_actualizacion,
company_name AS nombre_empresa,
STR_TO_DATE(date, '%Y-%m-%d %H:%i:%s') AS fecha_busqueda_oferta_linkedin,
date_published AS fecha_publicacion_oferta,
location AS ubicacion_oferta,
searches AS search_id_oferta,
title AS titulo_oferta,
NOW() fecha_actualizacion_sp
FROM linkedin_data.raw_linkedin_results
WHERE True
# AND _fivetran_synced is not null 
AND fecha_actualizacion > DATE_SUB(CURDATE(),INTERVAL 1 DAY) #opcion 1
AND id NOT IN (SELECT id_oferta FROM linkedin_data.linkedin_ofertas); #opcion 2
```   

5. Crear un stored procedure con la query de limpieza que inserte datos en la tabla.
```sql
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_table_linkedin_ofertas`()
BEGIN
INSERT INTO linkedin_data.linkedin_ofertas
SELECT 
id AS id_oferta,
_fivetran_synced AS fecha_actualizacion,
company_name AS nombre_empresa,
STR_TO_DATE(date, '%Y-%m-%d %H:%i:%s') AS fecha_busqueda_oferta_linkedin,
date_published AS fecha_publicacion_oferta,
location AS ubicacion_oferta,
searches AS search_id_oferta,
title AS titulo_oferta,
NOW() fecha_actualizacion_sp
FROM linkedin_data.raw_linkedin_results
WHERE True
# AND _fivetran_synced is not null 
AND fecha_actualizacion > DATE_SUB(CURDATE(),INTERVAL 1 DAY) #opcion 1
AND id NOT IN (SELECT id_oferta FROM linkedin_data.linkedin_ofertas); #opcion 2
END$$
DELIMITER ;
```  

6. Crear el evento que ejecute el SP de forma diaria   

```sql
CREATE 
EVENT `update_table_linkedin_ofertas`
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(NOW() + INTERVAL 1 MINUTE)
DO CALL update_table_linkedin_ofertas();
```   
    
### Parte II - Crear tabla linkedin_busquedas + SP de recarga de datos     

1. Crear tabla linkedin_busquedas  

```sql   
CREATE TABLE linkedin_busquedas (
	id_busqueda INT PRIMARY KEY,
    fecha_busqueda DATETIME,
    fecha_actualizacion DATETIME,
    keyword_busqueda VARCHAR(200),
    pais_busqueda VARCHAR(200),
    n_resultados_busqueda INT,
    fecha_actualizacion_sp DATETIME
)
```   

2. Modificar las restricciones de la fecha ejecutuando la siguiente sentencia   

```sql
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';)
```   

3. Definir la consulta que va a dejar los datos como queremos. (limpiarlos)
```sql
SELECT    
	id as id_busqueda,
	timestamp(STR_TO_DATE(date,"%Y-%m-%d %H:%i:%s")) AS fecha_busqueda_1, -- posible solucion
	DATE_FORMAT(STR_TO_DATE(date,"%Y-%m-%d %H:%i:%s"),'%Y-%m-%d %H:%i:%s') AS fecha_busqueda,
	DATE_FORMAT(STR_TO_DATE(_fivetran_synced,"%Y-%m-%d %H:%i:%s"),'%Y-%m-%d %H:%i:%s') AS fecha_actualizacion,   
	keyword as keyword_busqueda,   location AS pais_busqueda, 
    cast(REPLACE(REPLACE(n_results,",",""),"+","") as UNSIGNED) AS n_resultados_busqueda,
    NOW() AS fecha_actualizacion_sp
	FROM linkedin_data.raw_linkedin_searches;
```  

4. Crear un stored procedure con la query de limpieza que inserte datos en la tabla.
```sql
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_table_linkedin_busquedas`()
BEGIN

SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';
INSERT INTO linkedin_data.linkedin_busquedas
SELECT
	id as id_busqueda,
	-- timestamp(STR_TO_DATE(date,"%Y-%m-%d %H:%i:%s")) AS fecha_busqueda_1, -- posible solucion
	DATE_FORMAT(STR_TO_DATE(date,"%Y-%m-%d %H:%i:%s"),'%Y-%m-%d %H:%i:%s') AS fecha_busqueda,
	DATE_FORMAT(STR_TO_DATE(_fivetran_synced,"%Y-%m-%d %H:%i:%s"),'%Y-%m-%d %H:%i:%s') AS fecha_actualizacion,   
	keyword AS keyword_busqueda,   location AS pais_busqueda, 
    cast(REPLACE(REPLACE(n_results,",",""),"+","") as UNSIGNED) AS n_resultados_busqueda,
    NOW() AS fecha_actualizacion_sp
	FROM linkedin_data.raw_linkedin_searches;
END$$
DELIMITER ;
```  

5. Crear el evento que ejecute el SP de forma diaria
```sql
CREATE 
EVENT `update_table_linkedin_busquedas`
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(NOW() + INTERVAL 1 MINUTE)
DO CALL update_table_linkedin_busquedas();
```  

### Parte III - Análisis de los datos de las tabla  

1. ¿Cúales son las empresas con mayor cantidad de ofertas?  
```sql
SELECT 
nombre_empresa,
COUNT(*) Cantidad_ofertas
FROM linkedin_data.linkedin_ofertas
GROUP BY nombre_empresa
ORDER BY Cantidad_ofertas DESC;
```  
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241493688-0c82d3a0-c7cf-455d-9da7-8bbf595f3ceb.png"></p>  

2. ¿Que cantidad de ofertas tenemos en la tabla por ubicación?
```sql  
SELECT
ubicacion_oferta,
COUNT(search_id_oferta) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY ubicacion_oferta
ORDER BY Cantidad DESC;
```
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241494955-97be510d-10bc-4489-b86b-610bc57e0136.png"></p>    
  
3. ¿Que cantidad de ofertas tenemos por día publicados? 
```sql  
SELECT
fecha_publicacion_oferta, 
COUNT(search_id_oferta) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY fecha_publicacion_oferta
ORDER BY Cantidad DESC;
``` 
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241495172-0db490b8-47b8-43fb-99fa-2ea4fdca4c52.png"></p>    

4. ¿Cúales son los top 10 títulos de roles que se usan para publicar ofertas?
```sql  
SELECT 
titulo_oferta,
COUNT(*) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY titulo_oferta
ORDER BY Cantidad DESC
LIMIT 10;
``` 
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241495301-2be6bd80-ce1d-4a9f-af56-0c189409f49b.png"></p>       
  
5. ¿Cúales con las 5 ubicaciones con mayor cantidad de ofertas?
```sql
SELECT 
ubicacion_oferta,
COUNT(*) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY ubicacion_oferta
ORDER BY Cantidad DESC
LIMIT 5;
``` 
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241495531-5cc5492f-c67f-4251-b79d-8a88fe843060.png"></p>       

6. ¿Cuantas ofertas de trabajo hay combinando keyword con título oferta? ¿Puedes devolver la cantidad agregando por ambos campos?  
```sql
SELECT
b.keyword_busqueda,
o.titulo_oferta,
COUNT(*) Cantidad_ofertas
FROM linkedin_data.linkedin_ofertas o
LEFT JOIN linkedin_data.linkedin_busquedas b ON o.search_id_oferta = b.id_busqueda
GROUP BY o.titulo_oferta, b.keyword_busqueda
ORDER BY Cantidad_ofertas DESC;
```   
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241496678-0327c59a-21ed-472c-aa9b-7f9c140640d8.png"></p>          

7. ¿Cuantos puestos tenemos como junior, puedes traer la cantidad por título de oferta?
```sql
SELECT 
Titulo_oferta, 
COUNT(*) Cantidad
FROM linkedin_data.linkedin_ofertas
WHERE titulo_oferta REGEXP 'JR|Junior|Intern|Entry'
GROUP BY titulo_oferta
ORDER BY Cantidad DESC;
```   
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241496983-6665bc90-d411-46c5-bfec-0de42157a5fb.png"></p> 
 
8. ¿Puedes ahora devolver la cantidad de ofertas con el título junior, pero por país?
```sql
SELECT
b.pais_busqueda,
o.titulo_oferta,
COUNT(*) Cantidad_ofertas
FROM linkedin_data.linkedin_ofertas o
LEFT JOIN linkedin_data.linkedin_busquedas b ON o.search_id_oferta = b.id_busqueda
WHERE titulo_oferta REGEXP 'JR|Junior|Intern|Entry'
GROUP BY b.pais_busqueda
ORDER BY Cantidad_ofertas DESC;
```
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241497368-3a6ee363-9dc5-4127-b390-23948202c866.png"></p>  

9. Podemos saber la cantidad de ofertas publicadas por mes y keyword? ¿Que meses son mas top y con. que keywords?
```sql
SELECT
b.keyword_busqueda,
MONTH(o.fecha_publicacion_oferta) Mes,
COUNT(*) Cantidad_ofertas
FROM linkedin_data.linkedin_ofertas o
LEFT JOIN linkedin_data.linkedin_busquedas b ON o.search_id_oferta = b.id_busqueda
GROUP BY b.keyword_busqueda, Mes 
ORDER BY Mes ASC, Cantidad_ofertas DESC;
```   
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241497545-d5c2a807-ac65-4f81-8df0-893fbdcb68c2.png"></p>  


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<!--  
<a name="Conclusiones2"></a>
## Conclusiones[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify">  
1. Dentro del análisis se puede observar que existen distintos tipos de SKU para un mismo tipo de producto, que en este caso es el curso de Power BI. Esto podría deberse a una mala extracción de información de la fuente de origen.
<br><br>
2. Se puede apreciar que existen diferentes tipos de métodos de pago y se está brindando información adicional e innecesaria acerca de las tarjetas, lo cual puede representar un riesgo para la protección de los datos de los usuarios.
<br><br>
3. Se pudo observar que existe un duplicado en el número de pedido 41624, lo cual es un error inaceptable ya que podría ser considerado como una venta fraudulenta.
</p>
  
<a name="Recomendaciones2"></a>
## Recomendaciones[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
1.  Se recomienda conversar con el equipo de levantamiento de información para determinar la incorrecta extracción de la fuente de origen en relación a la variación de los SKU para un mismo curso de Power BI, y así encontrar una solución adecuada.
<br><br>  
2. Se recomienda filtrar todos los medios de pago con el fin de obtener únicamente los resultados de pago con tarjeta y en efectivo, con el objetivo de agilizar el análisis y salvaguardar la protección de los datos de los clientes. 
<br><br> 
3. Se debe informar al equipo encargado de la extracción de datos y al área de finanzas sobre la existencia de dos pedidos con el mismo número (41624). Es necesario determinar si se trata de un error en el proceso de venta o si se trata de una posible venta fraudulenta. Por lo tanto, se debe proceder con precaución y se recomienda llevar a cabo una investigación detallada para resolver este problema y evitar futuras inconsistencias.
</p>

-->
