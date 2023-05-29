<a name="Inicio"></a>    
# Automation, Cleaning, and Analysis - Linkedin Data [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2) ([ES](https://github.com/https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Linkedin_data_automatizacion.md#automatizaci%C3%B3n-limpieza-y-an%C3%A1lisis---linkedin-data--es--en) | [EN](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/blob/main/Linkedin_data_automation.md#automation-cleaning-and-analysis---linkedin-data--es--en))
  
<p align = 'center'><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241485467-97a1c50d-1fe4-49d0-a83f-b7b3f8bc7b2c.png" width ="25%"></p>
  
<a name="Tabla-de-contenido2"></a>
## Table of content [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
- [Business Problem](#Problema)
- [Objetive](#Objetivo2)  
- [Client](#Cliente2)
- [Diagram](#Diagrama2)
- [Solution](#La-solucion2)
- [Preliminary Analysis](#Análisis-Previo2)
- [Execution](#Ejecución2)   
- [Conclusions](#Conclusiones2) 
- [Recommendations](#Recomendaciones2) 

<a name="Problema"></a>    
## Business Problem [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align='justify'>In our business, we face the challenge of deriving meaningful insights about the job market in the field of data. To address this issue, we have obtained information through a data download obtained via web scraping. However, before using this data, it is crucial to undergo a validation process to ensure its accuracy and reliability. Once validated, our goal is to reach specific and relevant conclusions that provide us with a deep understanding of the data-related job market.
</p> 
This business problem involves the following key steps: 

<blockquote class="tabulacion">
<p align='justify'>1. Data Validation: Implementing a rigorous validation process to ensure that the data obtained through web scraping is accurate and free of errors.</p>  
<p align='justify'>2. Labor Market Analysis: Conducting a comprehensive analysis of the validated data to identify trends, patterns, and opportunities in the data-related job market.</p>
<p align='justify'>3. Conclusions and Recommendations: Extract meaningful conclusions based on the conducted analysis and utilize them to make strategic decisions, identify areas for improvement, or develop effective hiring strategies. By addressing this business problem, we aim to gain a deep and accurate understanding of the job market in the data field, enabling us to make informed and strategic decisions for the growth and success of our organization.</p>
</blockquote>

<a name="Objetivo2"></a>
## Objetive [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align='justify'>
The main objective of our project is to extract relevant conclusions about the job market in the data field. To achieve this, we have obtained information through a data download using web scraping. However, before reaching conclusions, we need to validate the integrity and accuracy of the collected data. Once the validation is complete, we will focus on analyzing and exploring the data to identify patterns, trends, and key insights in the data job market. These conclusions will allow us to gain a deeper and more accurate understanding of this market and help us make strategic and growth-oriented decisions in this constantly evolving sector.
</p>  

<a name="Cliente2"></a>
## Client[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
We are data analysts and we want to analyze the job market in these roles. To do so, we are gathering data from job postings listed on LinkedIn in the field of data analysis for various countries.


 |<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241487791-af150f5c-3f47-4956-9729-0fd594194731.png"> |<p align="justify">Linkedin: It is a professional social network where many companies post job listings.</p> | 
| :------------------------------------------------| :-------------------------------------------------| 


<a name="Diagrama2"></a>
## Diagram [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="center">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241489016-25e9235c-e528-4c41-ba2c-83e7e5b06844.png" width= 60% height=60%>
</p>    

<a name="La-solucion2"></a>
## Solution [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
The first step is to clean the data and create new tables with the clean data. The second step will be to automate that cleaning process with a stored procedure (SP) that runs daily and updates the information in the new table.  

<a name="Análisis-Previo2"></a>
## Preliminary Analysis [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)

1. What type of data do we have?
2. What cleaning do we observe that we could do?
3. How do we validate data?

  
<a name="Ejecución2"></a>    
## Execution [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
### Parte I - Create table "linkedin_data" + Data reload stored procedure (SP)
1. Load the database. “linkedin_data”  
```sql
CREATE DATABASE  IF NOT EXISTS `linkedin_data`
```   

2. Create linkedin_ofertas table
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

3. Modify the date constraints by executing the following statement:  
```sql
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';)
``` 
   
4. Define the query that will leave the data as desired. (limpiarlos)  
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

5. Create a stored procedure with the cleaning query that inserts data into the table.
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

6. Create the event that executes the stored procedure daily.  

```sql
CREATE 
EVENT `update_table_linkedin_ofertas`
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(NOW() + INTERVAL 1 MINUTE)
DO CALL update_table_linkedin_ofertas();
```   
    
### Parte II - Create table "linkedin_searches" + Data reload stored procedure (SP)

1. Create linkedin_busquedas table 

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

2. Modify the date constraints by executing the following statement: 

```sql
SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';)
```   

3. Define the query that will clean the data and leave it as desired.
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

4. Create a stored procedure with the cleaning query that inserts data into the table.
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

5. Create the event that executes the stored procedure daily.
```sql
CREATE 
EVENT `update_table_linkedin_busquedas`
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(NOW() + INTERVAL 1 MINUTE)
DO CALL update_table_linkedin_busquedas();
```  

### Parte III - Data analysis of the table.

1. What are the companies with the highest number of job listings?
```sql
SELECT 
nombre_empresa,
COUNT(*) Cantidad_ofertas
FROM linkedin_data.linkedin_ofertas
GROUP BY nombre_empresa
ORDER BY Cantidad_ofertas DESC;
```  
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241493688-0c82d3a0-c7cf-455d-9da7-8bbf595f3ceb.png"></p>  

2. How many job listings do we have in the table per location?
```sql  
SELECT
ubicacion_oferta,
COUNT(search_id_oferta) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY ubicacion_oferta
ORDER BY Cantidad DESC;
```
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241494955-97be510d-10bc-4489-b86b-610bc57e0136.png"></p>    
  
3. How many job listings do we have published per day?
```sql  
SELECT
fecha_publicacion_oferta, 
COUNT(search_id_oferta) Cantidad
FROM linkedin_data.linkedin_ofertas
GROUP BY fecha_publicacion_oferta
ORDER BY Cantidad DESC;
``` 
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241495172-0db490b8-47b8-43fb-99fa-2ea4fdca4c52.png"></p>    

4. What are the top 10 job title roles used for job postings?
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
  
5. What are the top 5 locations with the highest number of job listings?
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

6. How many job listings are there when combining the keyword with the job title? Can you provide the count by aggregating both fields?
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

7. How many positions do we have labeled as "junior"? Can you retrieve the count by job title?
```sql
SELECT 
Titulo_oferta, 
COUNT(*) Cantidad
FROM linkedin_data.linkedin_ofertas
WHERE titulo_oferta REGEXP 'JR|Junior|Intern|Entry'
GROUP BY titulo_oferta
ORDER BY Cantidad DESC;
```   
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241792960-652e07bf-134f-4f51-80af-a0383253bc57.png"></p> 
 
8. Can you now provide the count of job listings with the title "junior" by country?
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
<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/116538899/241793152-ec58edf4-c022-482e-89e8-a2107d867772.png"></p>  

9. Can we determine the count of job listings published per month and keyword? Which months are the top ones and with which keywords?
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

<a name="Conclusiones2"></a>
## Conclusions[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify">  
1. In the development of systems and applications, it is necessary to check scheduled events to determine their enablement and prevent overlaps. This verification ensures that stored procedures are executed smoothly, avoiding scheduling conflicts and ensuring that events are properly configured for their successful execution.
<br><br>
2. The top 3 most used keywords in the field of data analysis and the role of business analyst are: "business intelligence," "data analysis," and "business analyst." These keywords reflect the importance of gathering, analyzing, and utilizing data to make informed decisions. Data analysis involves exploring datasets to identify patterns and trends, while a business analyst is responsible for business analysis and data-driven decision-making. These keywords indicate the growing demand for business intelligence and data analysis.
<br><br>
3. In the current job market, there is a noticeable availability of job opportunities for junior-level positions in the countries of Mexico and Spain. With a total of 73 job listings in Mexico and 61 job listings in Spain, these numbers reflect an active demand from companies seeking young and talented professionals who can kickstart their careers and gain experience in various sectors. This trend demonstrates an openness to integrating new talent into the job market, presenting an interesting opportunity for those seeking their first employment or aiming to give an initial boost to their professional paths.
</p>
  
<a name="Recomendaciones2"></a>
## Recomendaciones[![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
<p align="justify"> 
1.  To check scheduled events and ensure that stored procedures run smoothly, it is recommended to use the code SHOW EVENTS to verify all events. Additionally, ALTER EVENT can be used to enable or disable a specific event if desired. Finally, if you wish to remove an event, you can use DROP EVENT.
<br><br>  
2. Based on the obtained results, it is recommended to delve deeper into the analysis of the identified keywords: "business intelligence," "data analysis," and "business analyst." It is important to explore the trends associated with these keywords, as well as the opportunities and challenges that arise in the field of data analysis and the role of business analysts. This will allow understanding how these trends impact the industry and the skills required by professionals. 
<br><br> 
3. Based on the data obtained, it is recommended for young professionals seeking job opportunities to actively consider the available offers in the job markets of Mexico and Spain. This favorable trend of a high number of job listings for junior-level positions indicates an active demand from companies in hiring young and growing talent. It is suggested to take advantage of this situation by applying for these vacancies and seizing the opportunity to gain experience in various sectors.
</p>


