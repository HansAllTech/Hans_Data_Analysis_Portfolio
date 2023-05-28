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

**Nuevo Diagrama**  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235796810-2720600f-c6eb-4597-919b-d5baae753d21.png" width= 60% height=60%>
</p>    

### Parte III - Análisis de los datos de las tabla  

2. Crear la tabla de productos a partir de los datos en crudo.
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Insertar los campos a la nueva tabla  

**Inserción de valores a tabla dim_producto**     
```sql
INSERT INTO learndata.dim_producto
SELECT
id AS id_producto,
sku AS sku_producto,
nombre AS nombre_producto, 
publicado AS publicado_producto,
inventario AS inventario_producto,
precio_normal AS precio_normal_producto,
categorias AS categoria_producto
FROM learndata_crudo.raw_productos_wocommerce;
```  

<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235800584-99aaefbe-74fe-4ed8-b4fe-c845153d8236.png">
</p>    



3. Crear la tabla de clientes a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Convertir el campo date_created que viene como timestamp a solo fecha
    4. Extraer del campo billing, todos los descriptivos del cliente que necesitamos aprendiendo a parsear un JSON. 
    5. Insertar los campos a la nueva tabla   

**Inserción de valores a tabla dim_clientes**     
```sql
INSERT INTO learndata.dim_clientes
SELECT 
id AS id_cliente,
STR_TO_DATE(date_created, '%d/%m/%Y %H:%i:%s' ) AS fecha_creacion_cliente,
JSON_VALUE(billing,'$[0].first_name') AS nombre_cliente, 
JSON_VALUE(billing,'$[0].last_name') AS apellido_cliente,
JSON_VALUE(billing,'$[0].email') AS email_cliente,
JSON_VALUE(billing,'$[0].phone') AS telefono_cliente,
JSON_VALUE(billing,'$[0].Region') AS region_cliente,
JSON_VALUE(billing,'$[0].country') AS pais_cliente,
JSON_VALUE(billing,'$[0].postcode') AS codigo_postal_cliente,
JSON_VALUE(billing,'$[0].address_1') AS direccion_cliente
FROM learndata_crudo.raw_clientes_wocommerce;
```  

<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235809344-4feb0b46-a0cb-4873-b091-9b43d1d6691e.png">
</p>    


4. Crear la tabla de pedidos a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Sustituir el nombre del producto por el id.
    4. Normalizar la columna método de pago.
    5. Convertir a date la columna fecha_pedido
    6. Redondear decimales de la columna coste_articulo a enteros
    7. Insertamos los pedidos a la tabla

```sql
# Sku errores
SELECT
DISTINCT sku
FROM learndata_crudo.raw_pedidos_wocommerce;
```  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235987844-4958b12c-2299-459f-8bdb-02afe4ab2b31.png">
</p>    


```sql
# Diferentes tipos de pago
SELECT
DISTINCT titulo_metodo_de_pago
FROM learndata_crudo.raw_pedidos_wocommerce;
```  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235988179-dbeb3595-81c4-4c00-a589-3338ff95632c.png">
</p>  


```sql
# Error de doble numero de pedido
SELECT 
* 
FROM learndata_crudo.raw_pedidos_wocommerce
WHERE numero_de_pedido = '41624';
```  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235988377-614255cb-ed68-4dd7-8933-d3fbd55332f6.png">
</p>  


```sql
# Eliminamos el duplicado
DELETE
FROM learndata_crudo.raw_pedidos_wocommerce
WHERE numero_de_pedido = '41624' AND `id cliente` = '1324';
```  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235988887-71d33256-e2ef-4965-ae93-8eb5469f5eb0.png">
</p>   



**Inserción de valores a tabla fac_pedidos**   
```sql
INSERT INTO learndata.fac_pedidos
SELECT
numero_de_pedido AS id_pedido,
CASE WHEN dp.sku_producto IS NULL THEN 3 ELSE dp.sku_producto END AS sku_producto,
estado_de_pedido AS estado_pedido,
DATE(fecha_de_pedido) AS fecha_pedido,
`id cliente` AS id_cliente,
CASE WHEN titulo_metodo_de_pago LIKE '%Stripe%' THEN 'Stripe' ELSE 'Tarjeta' END AS tipo_pago_pedido,
coste_articulo AS costo_pedido,
importe_de_descuento_del_carrito AS importe_de_descuento_pedido,
importe_total_pedido AS importe_total_pedido,
cantidad AS cantidad_pedido,
cupon_articulo AS codigo_cupon_pedido
FROM learndata_crudo.raw_pedidos_wocommerce rpe
LEFT JOIN learndata.dim_producto dp ON  dp.nombre_producto = rpe.nombre_del_articulo;
```  

<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235835155-f07199cb-75b7-45e3-911b-f075b72c8ca1.png">
</p>    

<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/235990366-400885b1-03c5-4bcd-9ae8-884a7fe9478e.png">
</p>  

Nota:  
```sql  
# En caso de no poder insertar valores por el formato date, usar la siguiente configuración antes de insert.
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';
```  

5. Crear la tabla de cobros de stripe a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Obtener el número de pedido con la función RIGHT. Quitar el numero de pedido de la descripción que es lo que nos va a permitir unir esta tabla con otras
    4. Pasar a timestamp el campo “created”
    5. Reemplazar las commas por puntos
    6. Convertir el número a decimal con dos lugares despues de la comma.
    7. Insertar tabla en nueva  

**Inserción de valores a tabla fac_pedidos**   
```sql
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';
INSERT INTO learndata.fac_pagos_stripe (fecha_pago,id_pedido,importe_pago,moneda_pago,comision_pago,neto_pago,tipo_pago)
SELECT
TIMESTAMP(created) AS fecha_pago,
RIGHT(description,5) AS id_pedido,
amount AS importe_pago,
currency AS moneda_pago,
CAST(REPLACE (fee,',','.') AS DECIMAL(10,2)) AS comision_pago,
CAST(REPLACE (net,',','.') AS DECIMAL (10,2)) AS neto_pago,
type AS tipo_pago
FROM learndata_crudo.raw_pagos_stripe;
```  

<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/236005853-7ecbc34b-8cff-463c-bcb6-23e5f04b6d42.png">
</p>    
  
<p align="center">
<img src="https://user-images.githubusercontent.com/116538899/236006162-97a54338-2448-4c08-aada-3a6323af2bb8.png">
</p>
  
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
