## Tabla de Contenido
- [Problema de negocio](#Problema-de-negocio)
- [Objetivo](#Objetivo)
- [Diagrama](#Diagrama)
- [Análisis Previo](#Análisis-Previo)   
- [Visualización en Looker](#Visualización-en-Looker)   
- [Texto invisible](#texto-invisible)
- [Texto invisible](#texto2)  

## Tabla de Contenido
- [Problema de negocio](#Problema)
- [Objetivo](#Objetivo)
- [Diagrama](#Diagrama)
- [Análisis Previo](#Análisis-Previo)   
- [Visualización en Looker](#Visualización-en-Looker)   
- [Texto invisible](#texto-invisible)
- [Texto invisible](#texto2)

<a name="Problema"></a><p align="right">.</p>    
## Problema de negocio [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)
<p align="justify"> El problema de negocio para la empresa de ecommerce online llamada "Osito Feliz" es que necesita mejorar sus ventas y su impacto en el mercado. A pesar de contar con 4 modelos de peluches muy atractivos, la empresa no ha logrado alcanzar su máximo potencial y se encuentra en una situación estancada.
Para solucionar este problema, se ha decidido llevar a cabo un análisis de datos para medir la conversión de la web y entender mejor las ventas e impacto de los productos. De esta manera, se busca identificar las áreas de mejora y las oportunidades de crecimiento para la empresa.</p>  
<a name="texto2"></a><p align="right">.</p>  

## Objetivo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)
<p align="justify">El objetivo principal del análisis de datos es proporcionar información detallada sobre el rendimiento de la empresa y ofrecer recomendaciones para mejorar su posicionamiento en el mercado. Al trabajar en estrecha colaboración con el CEO, el director de marketing y el Gerente de la web, el equipo de análisis de datos buscará proporcionar información valiosa y detallada para impulsar la toma de decisiones estratégicas y ayudar a la empresa a alcanzar sus objetivos de crecimiento y rentabilidad.</p>
  
## Diagrama [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)
<p align="center"> <img src="https://user-images.githubusercontent.com/116538899/231031630-6a5f79f0-ac96-449e-bcb2-cac37ca74b03.jpg"></p>  

## Análisis Previo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)
Antes de comenzar a responder a las preguntas de negocio que se nos solicita debemos entender las tablas, como están compuestas y como se relacionan.  
Puntos detectados:  

- Rango de tiempo de la tabla de pedidos.
- Si cada pedido de la tabla de pedidos tiene más de 1 elemento por eso se relaciona con la tabla de order_item. Entendemos se relaciona con la tabla items_purchase.

## Análisis de Ventas [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)
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
2. ¿Cuales son las ventas brutas medias de cada mes y año, devuelve los TOP 10? ¿Que puedes observar?
3. ¿Cuál es el producto que mas vende en términos monetarios (Ventas brutas)?
4. ¿Cuál es el producto que deja más margen?
5. ¿Podemos saber cúal es la fecha de lanzamiento de cada producto?
6. Calcula las ventas brutas por año asi como el margen numérico y porcentual de cada producto y ordénalo por producto.
7. ¿Cuáles son los meses con mayor venta bruta, devuelve los TOP 3?  

## Análisis de Tráfico Web [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)

8. ¿Cuales son los ads(anuncios) o contenidos que han atraído más sesiones?
9. Es lo mismo sesiones que usuarios?¿Cuál es la cantidad de usuarios individuales?
10. ¿Y por source o fuente? Cantidad de usuarios y sesiones?
11. ¿Cúales son las sources o fuentes que han dado más ventas?
12. ¿Cúales son los meses que han atraido más tráfico?
13. Ya que vimos el mes que ha tenido más trafico, podrías ver de ese mes la cantidad de sesiones que han venido por movil y la cantidad que han venido por ordenador?
14. ¿Qué campañas son las que han dado más margen por productos?      
| [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido)  | 
| :--------  |   


<a name="texto-invisible"></a>
<div style="background-color: black;">
<!-- Texto invisible -->
<span style="color: negro;">texto</span>
</div>  
<span style="color:black">Este texto faeffo</span>

<span style="color:black">Este texto es negro</span>
  
  
### Visualización en Looker 




