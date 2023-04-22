<a name="Inicio"></a>    
# Financial Analysis & Web Traffic - Osito Feliz E-commerce [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  ([ES](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Osito_feliz_ecommerce.md#an%C3%A1lisis-financiero--tr%C3%A1fico-web---ecommerce-osito-feliz--es--en) | [EN](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Happy_Teddy_ecommerce.md#financial-analysis--web-traffic---osito-feliz-e-commerce---es--en))
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233751984-9b50e4fe-cefa-48b4-9592-cde79c28a794.png" width=30% height=30%></p>


<a name="Tabla-de-contenido2"></a>
## Tabla de Contenido [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
- [Business Problem](#Problema)
- [Objective](#Objetivo2)
- [Diagram](#Diagrama2)
- [Preliminary Analysis](#Análisis-Previo2)   
- [Sales Analysis](#Análisis-de-Ventas2)
- [Web Traffic Analysis](#Análisis-de-Tráfico-Web2)
- [Advanced Analysis](#Análisis-Avanzado2)
- [Dashboard](#Visualización-en-Looker2)   
- [Conclusions](#Conclusiones2) 
- [Recommendations](#Recomendaciones2) 
 
<a name="Problema"></a>    
## Business Problem [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="justify">The business problem for the online ecommerce company called "Osito Feliz" is that it needs to improve its sales and impact in the market. Despite having 4 very attractive stuffed toy models, the company has not been able to reach its full potential and is in a stagnant situation.
To solve this problem, it has been decided to carry out a data analysis to measure website conversion and better understand product sales and impact. In this way, the aim is to identify areas for improvement and growth opportunities for the company.</p>    
 
<a name="Objetivo2"></a>
## Objective [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="justify">The main objective of the data analysis is to provide detailed information about the company's performance and offer recommendations to improve its positioning in the market. By working closely with the CEO, the marketing director, and the web manager, the data analysis team will seek to provide valuable and detailed insights to drive strategic decision-making and help the company achieve its growth and profitability goals.</p>  

<a name="Diagrama2"></a>
## Diagram [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231031630-6a5f79f0-ac96-449e-bcb2-cac37ca74b03.jpg" width= 60% height=60%></p>    

<a name="Análisis-Previo2"></a>
## Preliminary Analysis [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
Antes de comenzar a responder a las preguntas de negocio que se nos solicita debemos entender las tablas, como están compuestas y como se relacionan.  
Puntos detectados:  

- Rango de tiempo de la tabla de pedidos.
- Si cada pedido de la tabla de pedidos tiene más de 1 elemento por eso se relaciona con la tabla de order_item. Entendemos se relaciona con la tabla items_purchase.   

<!--Análisis personal by HR Tec -->
- [x] Analizando los datos de las diferentes tablas
- _Website_sessions_
```sql
SELECT * FROM ositofeliz.website_sessions;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231341794-4bb784a4-65a3-4329-8e5a-c9ae3ebb3345.png" width =85% height = 85%></p>

- _Orders_
```sql
SELECT * FROM ositofeliz.orders;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231342305-728a42d7-355a-44ee-b324-0e020c4033d4.png"></p>

- _Orders_items_
```sql
SELECT * FROM ositofeliz.order_items;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231343099-5f0a0553-5865-485a-abde-b1fe83cc96ab.png"></p>

- _Products_
```sql
SELECT * FROM ositofeliz.products;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231345504-2578c642-cc0b-48bb-aafd-8fc4a7f2746e.png"></p>



- [x] Analizando periodo de ventas
```sql
SELECT 
MIN(created_at) Primera_venta,
MAX(created_at) Ultima_venta,
DATEDIFF(MAX(created_at),MIN(created_at)) Periodo_ventas
FROM ositofeliz.orders;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231295886-87ebf940-7cb7-4f91-ab20-d6f8ef318532.png"></p>

- [x]  Analizando las ventas, tipo de producto vendidos, cantidad de ventas y ventas netas 
```sql
SELECT 
MIN(price_usd) Precio_minimo,
MAX(price_usd) Precio_maximo,
ROUND(AVG(price_usd),2) Precio_promedio,
COUNT(DISTINCT(primary_product_id)) Tipos_de_producto,
FORMAT(COUNT(order_id),0,'en_US') Cantidad_ventas,
FORMAT(SUM((price_usd-cogs_usd)*items_purchased),2,'en_US') Total_neto
FROM ositofeliz.orders;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231308111-5d6e6bd1-6e04-4db4-ab1e-c4e328c8f7da.png"></p>

- [x] Analizando Porcentaje de venta neta por producto
```sql
SELECT 
product_name Producto,
CONCAT(FORMAT((COUNT(o.order_id) / (SELECT COUNT(order_id) FROM ositofeliz.orders))*100,2),'%') Porcentaje,
FORMAT(SUM((o.price_usd-o.cogs_usd)*o.items_purchased),2,'en_US') Total_neto
FROM ositofeliz.orders o
LEFT JOIN ositofeliz.order_items oi ON o.order_id = oi.order_id
LEFT JOIN ositofeliz.products p ON oi.product_id = p.product_id	
GROUP BY product_name;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231311124-cae904dd-909e-483c-a71d-92544096cc9f.png"></p>


<a name="Análisis-de-Ventas2"></a> 
## Análisis de Ventas [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
1. Queremos saber cuales son las ventas por año y por mes en términos brutos y luego el margen absoluto.  
```sql
SELECT 
MONTH (created_at) as MES, 
year(created_at) as YEAR,
FORMAT(SUM(price_usd*items_purchased),2,'es_ESP') as 'Ventas brutas',
FORMAT(SUM(items_purchased*(price_usd - cogs_usd)),2,'es_ESP') as margen_bruto
FROM orders
group by MONTH (created_at), YEAR
order by YEAR, MES ASC;  
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231339517-7cded103-fe44-4bba-ac3f-06844eca69aa.png"></p>


2. ¿Cuales son las ventas brutas medias de cada mes y año, devuelve los TOP 10? ¿Que puedes observar?
```sql
SELECT 
MONTH(created_at) Mes,
YEAR(created_at) Año,
SUM(price_usd*items_purchased) Ventas_Brutas,
ROUND(AVG(price_usd*items_purchased),2) Ventas_AVG
FROM ositofeliz.orders
GROUP BY Mes, Año
ORDER BY Ventas_AVG DESC, Mes DESC, Año DESC
LIMIT 10;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231339831-8213427a-0b50-4137-9ab5-aa76be26cfcb.png"></p>


3. ¿Cuál es el producto que mas vende en términos monetarios (Ventas brutas)?
```sql
SELECT
product_name Producto,
SUM(o.items_purchased*o.price_usd) Ventas_Brutas 
FROM ositofeliz.orders o
LEFT JOIN ositofeliz.order_items oi ON o.order_id = oi.order_id
LEFT JOIN ositofeliz.products p ON oi.product_id = p.product_id	
GROUP BY Producto
ORDER BY Ventas_Brutas DESC
LIMIT 1;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231349933-2623408e-3b5c-447f-b500-7f2245afd053.png"></p>

4. ¿Cuál es el producto que deja más margen?
```sql
SELECT
product_name Producto,
SUM(o.items_purchased*o.price_usd) Ventas_Brutas,
SUM(o.items_purchased*(o.price_usd-o.cogs_usd)) Margen
FROM ositofeliz.orders o
LEFT JOIN ositofeliz.order_items oi ON o.order_id = oi.order_id
LEFT JOIN ositofeliz.products p ON oi.product_id = p.product_id	
GROUP BY Producto
ORDER BY Margen DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231511665-7ed3e158-321b-49e3-842a-bd91aa2c8fd0.png"></p>
  
5. ¿Podemos saber cúal es la fecha de lanzamiento de cada producto?  
```sql
SELECT
product_name Producto,
DATE(MIN(o.created_at)) Fecha_venta
FROM ositofeliz.orders o
LEFT JOIN ositofeliz.order_items oi ON o.order_id = oi.order_id
LEFT JOIN ositofeliz.products p ON oi.product_id = p.product_id	
GROUP BY Producto;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231517983-b41f01d0-1505-4e54-b07f-61838d529cdd.png"></p>

 
6. Calcula las ventas brutas por año asi como el margen numérico y porcentual de cada producto y ordénalo por producto.
```sql
SELECT
product_name Producto,
YEAR(o.created_at) Año,
SUM(o.items_purchased*o.price_usd) Ventas_Brutas,
SUM(o.items_purchased*(o.price_usd-o.cogs_usd)) Margen_absoluto,
ROUND(SUM(o.items_purchased*(o.price_usd-o.cogs_usd))/SUM(o.items_purchased*o.price_usd)*100,2) Margen_porcentual
FROM ositofeliz.orders o
LEFT JOIN ositofeliz.order_items oi ON o.order_id = oi.order_id
LEFT JOIN ositofeliz.products p ON oi.product_id = p.product_id	
GROUP BY Producto, Año
ORDER BY Ventas_Brutas DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231526681-048a8948-76a3-4837-b078-b36fc69cdaf6.png"></p>  

7. ¿Cuáles son los meses con mayor venta bruta, devuelve los TOP 3?  
 ```sql
SELECT
MONTH(o.created_at) Mes,
YEAR(o.created_at) Año,
SUM(o.items_purchased*o.price_usd) Ventas_Brutas
FROM ositofeliz.orders o
GROUP BY Año, Mes
ORDER BY Ventas_Brutas DESC
LIMIT 3;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231532091-dcea0b53-56d5-4f0d-8d20-af0d80d9e42b.png"></p>  

<a name="Análisis-de-Tráfico-Web2"></a>
## Análisis de Tráfico Web [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)

8. ¿Cuales son los ads(anuncios) o contenidos que han atraído más sesiones
```sql
SELECT 
utm_content Anuncio,
DATEDIFF(MAX(created_at),MIN(created_at)) Duración_Anuncio,
COUNT(website_session_id) Sesiones,
ROUND(COUNT(website_session_id)*365/DATEDIFF(MAX(created_at),MIN(created_at)),0) Sesiones_por_Año
FROM ositofeliz.website_sessions
GROUP BY Anuncio
ORDER BY Sesiones_por_Año DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231552264-ebc7f0f0-881f-4899-934b-6bc2faf7c9c4.png"></p>  

9. ¿Es lo mismo sesiones que usuarios?¿Cuál es la cantidad de usuarios individuales?
```sql
SELECT 
COUNT(website_session_id) Cantidad_sesiones,
SUM(CASE WHEN is_repeat_session = 1 then 1 else 0 end) Sesiones_repetidas,
COUNT(DISTINCT user_id) Cantidad_Usuarios
FROM ositofeliz.website_sessions;
``` 
 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231565182-6c52795d-52ab-44a7-a39b-1eb2ba00a740.png"></p>  

10. ¿Y por source o fuente? Cantidad de usuarios y sesiones?
```sql
SELECT 
utm_source Fuente,
COUNT(DISTINCT user_id) Cantidad_usuarios,
COUNT(website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions
GROUP BY fuente
ORDER BY cantidad_usuarios DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618326-12907a60-09ca-4095-806b-64dcfdc230eb.png"></p>  

11. ¿Cúales son las sources o fuentes que han dado más ventas?
```sql
SELECT 
w.utm_source Canal,
SUM(o.items_purchased*o.price_usd) Ventas_brutas,
SUM(o.items_purchased*(o.price_usd-o.cogs_usd)) Ventas_netas
FROM ositofeliz.website_sessions w 
LEFT JOIN ositofeliz.orders o ON o.website_session_id = w.website_session_id
GROUP BY Canal
ORDER BY Ventas_netas DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618419-fbb35ad0-e19f-4805-acf6-bb6717bf13b9.png"></p>  

12. ¿Cúales son los meses que han atraido más tráfico?
```sql
SELECT 
DATE_FORMAT(created_at,'%M-%Y') Mes_año,
COUNT(website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions
GROUP BY Mes_año
ORDER BY Cantidad_sesiones DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618528-c6bee3b3-8320-4f1c-8fd0-b5b674f6797e.png"></p>  

13. Ya que vimos el mes que ha tenido más trafico, podrías ver de ese mes la cantidad de sesiones que han venido por movil y la cantidad que han venido por ordenador?
```sql
DATE_FORMAT(created_at,'%M-%Y') Mes_año,
device_type Dispositivos,
COUNT(website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions
GROUP BY Dispositivos, Mes_año
HAVING Mes_año = 'November-2012';
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618710-9ad91a1b-6725-4c45-875b-95a0e06b68fe.png"></p>  

14. ¿Qué campañas son las que han dado más margen por productos?      
```sql
SELECT
w.utm_campaign Campaña,
product_name Producto,
SUM(o.items_purchased*(o.price_usd-o.cogs_usd)) Margen
FROM ositofeliz.website_sessions w
INNER JOIN ositofeliz.orders o ON o.website_session_id = w.website_session_id
LEFT JOIN ositofeliz.order_items oi ON oi.order_id = o.order_id
LEFT JOIN ositofeliz.products p ON p.product_id = oi.product_id
GROUP BY Campaña, Producto
ORDER BY Margen DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618802-7ecfba6b-e037-43c4-8342-9b10eb444762.png"></p>    

<a name="Análisis-Avanzado2"></a>
## Análisis avanzado [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  

**Datos relevantes**   
```sql
SELECT
w.utm_campaign Campaña,
product_name Producto,
SUM(o.price_usd*o.items_purchased) Ventas_brutas,
SUM(o.items_purchased*(o.price_usd - o.cogs_usd)) Margen_absoluto,
SUM(o.cogs_usd) Costos,
COUNT(w.utm_campaign) Cantidad_campaña,
COUNT(w.utm_campaign)/(SELECT COUNT(website_session_id) FROM website_sessions) Conversion_campaña,
COUNT(o.order_id) Cantidad_orders,
COUNT(o.order_id)/(SELECT COUNT(website_session_id) FROM website_sessions) Conversion_order
FROM ositofeliz.website_sessions w
INNER JOIN ositofeliz.orders o ON o.website_session_id = w.website_session_id
LEFT JOIN ositofeliz.order_items oi ON oi.order_id = o.order_id
LEFT JOIN ositofeliz.products p ON p.product_id = oi.product_id
GROUP BY Campaña, Producto
ORDER BY Margen_absoluto DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233739320-870082c9-538a-45eb-8dbf-5acf4df038c9.png"></p>  

**Tasa de conversion**   
```sql
SELECT 
EXTRACT(YEAR_MONTH FROM w.created_at) Año_mes,
COUNT(o.order_id)/(SELECT COUNT(website_session_id) FROM website_sessions) Conversion,
COUNT(o.order_id) Conversion_cantidad,
COUNT(w.website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions w
LEFT JOIN ositofeliz.orders o ON w.website_session_id = o.website_session_id
GROUP BY Año_mes;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233739461-f8881ff0-2341-4eaf-b896-183effa707ac.png"></p>  

**Ventas & Margen**   
```sql
SELECT 
EXTRACT(YEAR_MONTH FROM created_at) Año_mes,
SUM(price_usd*items_purchased) Ventas_brutas,
SUM(items_purchased*(price_usd - cogs_usd)) Margen_absoluto,
SUM(cogs_usd) Costos
FROM orders
GROUP BY Año_mes
ORDER BY Año_mes ASC;  
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233739681-a494c42c-48b7-4a23-8903-f80d55c2b994.png"></p>

**Cantidad de ventas e incremento**   
```sql
SELECT 
EXTRACT(YEAR_MONTH FROM created_at) Año_mes,
COUNT(order_id) Cantidad_ventas,
LAG(COUNT(order_id),1,0) OVER (ORDER BY EXTRACT(YEAR_MONTH FROM created_at)) Cantidad_anterior,
COUNT(order_id) - LAG(COUNT(order_id),1,0) OVER (ORDER BY EXTRACT(YEAR_MONTH FROM created_at)) Incremento,
(COUNT(order_id) - LAG(COUNT(order_id),1,0) OVER (ORDER BY EXTRACT(YEAR_MONTH FROM created_at)))/(LAG(COUNT(order_id),1,0) OVER (ORDER BY EXTRACT(YEAR_MONTH FROM created_at))) Tasa_incremento
FROM ositofeliz.orders
GROUP BY Año_mes;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233739820-d8680e4a-e8f6-40aa-a61b-7852288b4006.png"></p>  

**Conversión por Campaña**   
```sql
SELECT
utm_campaign Campaña,
COUNT(o.order_id) Cantidad_Conversion,
COUNT(o.order_id)/(SELECT COUNT(website_session_id) FROM website_sessions) Tasa_conversion,
COUNT(o.order_id)/(SELECT COUNT(order_id) FROM ositofeliz.orders) Porcentaje
FROM ositofeliz.website_sessions w
LEFT JOIN ositofeliz.orders o ON w.website_session_id = o.website_session_id
GROUP BY utm_campaign;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233739936-4fac3ab7-1670-46d1-bffe-aacaf91e6198.png"></p>   

**Conversión por Publicidad**   
```sql
SELECT 
utm_content Publicidad,
COUNT(o.order_id) Cantidad_conversion,
COUNT(o.order_id)/(SELECT COUNT(website_session_id) FROM website_sessions) Tasa_conversion,
COUNT(o.order_id)/(SELECT COUNT(order_id) FROM ositofeliz.orders) Porcentaje
FROM ositofeliz.website_sessions w
LEFT JOIN ositofeliz.orders o ON w.website_session_id = o.website_session_id
GROUP BY utm_content;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233740131-30bcad3a-e736-4800-8900-6b8c5cb4540c.png"></p>    

**Conversión por Buscador**   
```sql
SELECT 
utm_source Buscador,
COUNT(o.order_id) Cantidad_Conversion,
COUNT(o.order_id)/(SELECT COUNT(website_session_id) FROM website_sessions) Tasa_conversion,
COUNT(o.order_id)/(SELECT COUNT(order_id) FROM ositofeliz.orders) Porcentaje
FROM ositofeliz.website_sessions w
LEFT JOIN ositofeliz.orders o ON w.website_session_id = o.website_session_id
GROUP BY utm_source;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233740256-443205b2-b599-491d-84b4-25f63fd00a6f.png"></p>  


<a name="Visualización-en-Looker2"></a>
## Dashboard [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
Visualización en looker
[`Ir al Dashboard`](https://lookerstudio.google.com/reporting/8ac34c00-e322-494c-9817-211743495067/page/gEsMD?s=qrsI1gKtGYI)    
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233752456-920e9e8e-28a0-486f-991b-85cffcc86f06.png"></p>    



<a name="Conclusiones2"></a>
## Conclusiones[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
En cuanto a la cantidad de ventas, se ha observado un incremento gradual favorable durante los meses de abril y noviembre, con un aumento del 66% y 65% respectivamente en comparación con los meses anteriores. Este incremento podría estar correlacionado directamente con la estacionalidad y/o festividades que se celebran durante esos meses, lo cual aumenta la demanda de los ositos.<br><br>
En el análisis se ha evidenciado que la tasa de conversión de la página web es del 4.4%, lo que significa que por cada 15,000 visitantes, uno realiza una compra de un osito. Por otro lado, se ha evaluado que esta tasa de conversión es favorable, ya que se ha obtenido un margen absoluto de $93.47k, que es mayor al costo total de producción individual de cada osito de $59.64k.<br><br>
En el análisis del tráfico web se ha identificado que hay tres principales fuentes de conversión: publicidad, campañas y buscadores web. Se ha observado que la fuente con mayor captación de potenciales clientes es la conversión por campaña, con un total aproximado de 2659 conversiones por este medio. Se ha determinado que la campaña de "Brand Awareness" ha obtenido el mejor rendimiento en comparación con el resto, logrando una tasa de conversión del 80.4% lo que representa un total de 2453 conversiones.<br><br>
Durante el análisis, se ha observado que los productos que han generado ventas son los ositos cariñoso y osito amor por siempre, siendo el primero el que ha generado mayores ingresos. Sin embargo, este resultado no es concluyente al 100% debido a que el lanzamiento del producto "Osito amor por siempre" se realizó en enero del año 2013, nueve meses después del lanzamiento del producto "Osito cariñoso" en marzo del 2012. Por lo tanto, se requiere recopilar más información para realizar un análisis más exhaustivo y determinar si la diferencia en el tiempo de lanzamiento ha tenido algún impacto en las ventas de cada producto."
</p>   

<a name="Recomendaciones2"></a>
## Recomendaciones[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
Basado en el análisis realizado, se sugiere que la empresa realice una planificación y estrategia de marketing específica para los meses de abril y noviembre, aprovechando la posible correlación directa con las festividades y estacionalidad de esos meses. Esto puede ayudar a capitalizar el aumento de la demanda de los ositos y aumentar aún más las ventas. Además, se recomienda seguir monitoreando y evaluando los resultados para ajustar la estrategia según sea necesario.<br><br>
Se sugiere que la empresa continúe enfocándose en aumentar el tráfico a su página web y en mejorar la tasa de conversión. Se podrían considerar estrategias para atraer más visitantes, como aumentar la presencia en redes sociales y publicidad en línea. También se podría analizar la experiencia del usuario en la página web para identificar oportunidades de mejora y optimizar el proceso de compra, se podría utilizar herramientas como el mapa de experiencia de usuario, mapa de empatía, entre otros.<br><br>
Si bien es cierto que la campaña de "Brand Awareness" ha obtenido un buen rendimiento en comparación con las demás, es importante seguir invirtiendo en estrategias de posicionamiento para aumentar la captación de clientes. Sin embargo, también es necesario ser crítico y destacar que el segundo mayor porcentaje de conversión de clientes no se debió a una campaña específica, además obtuvo un porcentaje del 12.8%, lo que representa un total de 392 clientes. Por lo tanto, se recomienda considerar la realización de pruebas A/B para evaluar la efectividad de diferentes campañas y determinar cuáles son las que generan un mayor impacto en la tasa de conversión.<br><br>
Se sugiere realizar un seguimiento detallado de las ventas de los productos "Ositos cariñosos" y "Osito amor por siempre" durante un periodo de al menos un año, para poder comparar su rendimiento a largo plazo y determinar cuál de los dos productos es realmente el que genera mayores ingresos de manera consistente. Además, se podría analizar el impacto de factores externos, como la competencia en el mercado de peluches y las tendencias de consumo, para obtener una visión más completa de la situación.
