<a name="Inicio"></a>    
# Financial Analysis & Web Traffic - Osito Feliz E-commerce [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  ([ES](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Osito_feliz_ecommerce.md#an%C3%A1lisis-financiero--tr%C3%A1fico-web---ecommerce-osito-feliz--es--en) | [EN](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Happy_Teddy_ecommerce.md#financial-analysis--web-traffic---osito-feliz-e-commerce---es--en))
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233751984-9b50e4fe-cefa-48b4-9592-cde79c28a794.png" width=30% height=30%></p>


<a name="Tabla-de-contenido2"></a>
## Table of content [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
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
Before starting to answer the business questions that we are asked, we must understand the tables, how they are composed, and how they relate to each other.
Detected points:  

- Time range of the orders table.
- If each order in the orders table has more than 1 item, it relates to the order_item table. We understand it relates to the items_purchase table.   

<!--Análisis personal by HR Tec -->
- [x] Analyzing the data from the different tables.
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



- [x] Analyzing sales period
```sql
SELECT 
MIN(created_at) Primera_venta,
MAX(created_at) Ultima_venta,
DATEDIFF(MAX(created_at),MIN(created_at)) Periodo_ventas
FROM ositofeliz.orders;
```
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231295886-87ebf940-7cb7-4f91-ab20-d6f8ef318532.png"></p>

- [x]  Analyzing sales, type of products sold, quantity of sales, and net sales.
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

- [x] Analyzing Net Sales Percentage by Product.
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
## Sales Analysis [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
1. We want to know the sales by year and by month in gross terms and then the absolute margin.  
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


2. What are the average gross sales for each month and year, return the TOP 10? What can you observe?
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


3. What is the product that sells the most in monetary terms (gross sales)?
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

4. What is the product with the highest profit margin?
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
  
5. Can we know the release date of each product?
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

 
6. Calculate gross sales by year as well as the numerical and percentage margin for each product, and sort it by product.
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

7. Which are the months with the highest gross sales, return the TOP 3? 
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
## Web Traffic Analysis [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)

8. What are the ads or contents that have attracted the most sessions?
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

9. Is sessions the same as users? What is the number of individual users?
```sql
SELECT 
COUNT(website_session_id) Cantidad_sesiones,
SUM(CASE WHEN is_repeat_session = 1 then 1 else 0 end) Sesiones_repetidas,
COUNT(DISTINCT user_id) Cantidad_Usuarios
FROM ositofeliz.website_sessions;
``` 
 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231565182-6c52795d-52ab-44a7-a39b-1eb2ba00a740.png"></p>  

10. And by source or channel? Number of users and sessions?
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

11. What are the sources that have generated the most sales?
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

12. What are the months that have attracted the most traffic?
```sql
SELECT 
DATE_FORMAT(created_at,'%M-%Y') Mes_año,
COUNT(website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions
GROUP BY Mes_año
ORDER BY Cantidad_sesiones DESC;
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618528-c6bee3b3-8320-4f1c-8fd0-b5b674f6797e.png"></p>  

13. Since we saw the month that has had the most traffic, could you see for that month the number of sessions that have come from mobile and the number that have come from desktop?
```sql
DATE_FORMAT(created_at,'%M-%Y') Mes_año,
device_type Dispositivos,
COUNT(website_session_id) Cantidad_sesiones
FROM ositofeliz.website_sessions
GROUP BY Dispositivos, Mes_año
HAVING Mes_año = 'November-2012';
``` 
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/231618710-9ad91a1b-6725-4c45-875b-95a0e06b68fe.png"></p>  

14. What campaigns have yielded the highest margin per product?      
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
## Advanced analysis [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  

**Relevant data**   
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

**Conversion rate**   
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

**Sales & Margin**   
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

**Number of sales and increase**   
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

**Conversion by Campaign**   
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

**Conversion by Advertisement**   
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

**Conversion by Search Engine**   
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
 Looker Visualization
[`Ir al Dashboard`](https://lookerstudio.google.com/reporting/8ac34c00-e322-494c-9817-211743495067/page/gEsMD?s=qrsI1gKtGYI)    
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/233752456-920e9e8e-28a0-486f-991b-85cffcc86f06.png"></p>    



<a name="Conclusiones2"></a>
## Conclusions[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
Regarding the sales volume, a favorable gradual increase has been observed during the months of April and November, with a 66% and 65% increase respectively compared to the previous months. This increase could be directly correlated with the seasonality and/or festivities celebrated during those months, which increases the demand for teddy bears.<br><br>
The analysis has shown that the conversion rate of the website is 4.4%, which means that for every 15,000 visitors, one purchases a teddy bear. On the other hand, it has been evaluated that this conversion rate is favorable, as an absolute margin of $93.47k has been obtained, which is higher than the total individual production cost of each teddy bear, which is $59.64k.<br><br>
In the web traffic analysis, three main sources of conversion have been identified: advertising, campaigns, and web search engines. It has been observed that the source with the highest potential customer acquisition is the conversion by campaign, with an approximate total of 2,659 conversions through this channel. It has been determined that the "Brand Awareness" campaign has performed the best compared to the others, achieving a conversion rate of 80.4%, representing a total of 2,453 conversions.<br><br>
During the analysis, it has been observed that the products that have generated sales are the "Ositos cariñosos" and "Osito amor por siempre", with the former generating higher revenues. However, this result is not 100% conclusive due to the fact that the launch of the "Osito amor por siempre" product was done in January 2013, nine months after the launch of the "Ositos cariñosos" product in March 2012. Therefore, more information is required to conduct a more thorough analysis and determine if the difference in launch time has had any impact on the sales of each product.
</p>   

<a name="Recomendaciones2"></a>
## Recomendations[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
Based on the analysis conducted, it is suggested that the company creates a specific marketing plan and strategy for the months of April and November, taking advantage of the possible direct correlation with the holidays and seasonality of those months. This can help capitalize on the increase in demand for the teddy bears and further increase sales. Additionally, it is recommended to continue monitoring and evaluating the results to adjust the strategy as needed.<br><br>
It is suggested that the company continue to focus on increasing traffic to their website and improving the conversion rate. Strategies to attract more visitors could be considered, such as increasing social media presence and online advertising. The user experience on the website could also be analyzed to identify opportunities for improvement and optimize the purchasing process, using tools such as the user experience map, empathy map, among others.<br><br>
While it is true that the "Brand Awareness" campaign has performed well compared to others, it is important to continue investing in positioning strategies to increase customer acquisition. However, it is also necessary to be critical and highlight that the second highest percentage of customer conversion was not due to a specific campaign, but rather obtained a percentage of 12.8%, which represents a total of 392 customers. Therefore, it is recommended to consider conducting A/B testing to evaluate the effectiveness of different campaigns and determine which ones have a greater impact on the conversion rate.<br><br>
It is suggested to closely monitor the sales of "Ositos cariñosos" and "Osito amor por siempre" products for a period of at least one year to compare their long-term performance and determine which of the two products consistently generates greater revenue. Additionally, the impact of external factors such as competition in the stuffed toy market and consumption trends could be analyzed to obtain a more complete picture of the situation.</p>

