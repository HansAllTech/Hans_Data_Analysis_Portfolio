<a name="Inicio"></a>    
# Limpieza de datos - E-Learning Cursos Online [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2) ([ES](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/edit/main/E-Learning_Cursos_Online.md) | [EN](https://github.com/HansAllTech/Hans_Data_Analysis_Portfolio/edit/main/E-Learning_Cursos_Online.md))
  
<p align = 'center'><img src="https://user-images.githubusercontent.com/116538899/235765262-8acfe1d1-a637-4ef7-adeb-b1880368c671.jpg" width ="25%"></p>
  
  
  
<a name="Tabla-de-contenido2"></a>
## Tabla de Contenido [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
- [Problema de negocio](#Problema)
- [Objetivo](#Objetivo2)
- [Diagrama](#Diagrama2)
- [Análisis Previo](#Análisis-Previo2)
- [Ejecución](#Ejecución2)   
- [Análisis de Ventas](#Análisis-de-Ventas2)
- [Análisis de Tráfico Web](#Análisis-de-Tráfico-Web2)
- [Análisis Avanzado](#Análisis-Avanzado2)
- [Dashboard](#Visualización-en-Looker2)   
- [Conclusiones](#Conclusiones2) 
- [Recomendaciones](#Recomendaciones2)   


<a name="Problema"></a>    
## Problema de negocio [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align='justify'>
El problema de negocio de LearnData es que actualmente no tiene un sistema establecido para capturar, analizar y tomar decisiones basadas en sus principales métricas financieras. Sin contar con un sistema eficaz, la empresa no puede identificar las áreas que necesitan mejoras o tomar decisiones informadas que impulsen el crecimiento de la empresa. Además, sin un proceso de captura de datos adecuado, los datos en crudo generados por la web del negocio podrían estar incompletos, ser inexactos o contener duplicados, lo que dificultaría aún más el análisis y la toma de decisiones.
</p>  
  
<a name="Objetivo2"></a>
## Objetivo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
Realizar una limpieza de datos para asegurar que los datos en crudo relacionados con clientes, pagos, pedidos y productos estén completos, sean precisos y no contengan duplicados, lo que permitirá una mayor precisión en el análisis y una toma de decisiones más informada en cuanto a la gestión de clientes y ventas. Además, la empresa debe invertir en el desarrollo e implementación de un sistema que pueda capturar y analizar estos datos de manera eficiente y efectiva para que la empresa pueda tomar decisiones informadas y basadas en datos para mejorar su desempeño en términos de gestión de clientes y ventas.
</p>

<a name="Diagrama2"></a>
## Diagrama [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
<p align="center"><img src="https://user-images.githubusercontent.com/116538899/235769297-9446a0b7-0ce3-47b4-b7dd-0b3eac8e6c61.png" width= 60% height=60%></p>    
 
 
<a name="Análisis-Previo2"></a>
## Análisis Previo [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)
1. ¿Que fuentes de datos tiene la empresa?
   <p align='justify'>La empresa utiliza wordpress con un plugin de wocommerce como plataforma de venta de sus cursos online y luego cuenta con stripe como pasarela de pagos a de más de los pagos de tarjeta de crédito.</p>
2. ¿En que formato se descargan los datos?    
   <p align='justify'> Los datos crudos los tendremos en csv directamente descargados de las fuentes.</p>
3. ¿Que datos tenemos?    
   <p align='justify'>Tenemos datos de los productos osea cursos que se venden, los clientes, de los pedidos y de los pagos recibidos por stripe.</p>
4. Modelo de datos    
   <p align='justify'>Tenemos la tabla de pedidos que se relaciona con la de clientes y productos mediante SKU_producto e id_cliente y por otro lado tenemos la tabla      la de pagos de stripe que la relacionaremos con la de pedidos por el numero de pedido.</p><br>   
5. Análisis exploratorio de las tablas.  

<a name="Ejecución2"></a>    
## Ejecución [![Texto](https://user-images.githubusercontent.com/116538899/231064143-c080de13-8be9-4321-8694-e62539263f5a.png)](#Tabla-de-contenido2)  
1. Crear una nueva base de datos en MYSQL llamada “learndata” + tablas:
    1. dim_clientes; dim_producto;fac_pedidos; fac_pagos_stripe

```sql
# Creación de base de datos
CREATE SCHEMA learndata;

# Creación de Tabla dim_clientes
CREATE TABLE dim_clientes (
	id_cliente INT,
    fecha_creacion_cliente DATE,
    nombre_cliente VARCHAR(100),
    apellido_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    telefono_cliente VARCHAR(100),
    region_cliente VARCHAR(100),
    pais_cliente VARCHAR(100),
    codigo_postal_cliente VARCHAR(100),
    direccion_cliente VARCHAR(255),
    PRIMARY KEY (id_cliente)
    );
    
# Creación de Tabla dim_product
CREATE TABLE dim_producto (
    id_producto INT,
    sku_producto INT,
    nombre_producto VARCHAR(200),
    publicado_producto BOOLEAN,
    inventario_producto VARCHAR(100),
    precio_normal_producto INT,
    categoria_producto VARCHAR(100),
    PRIMARY KEY (sku_producto)
    );

# Creación de Tabla fac_pedidos
CREATE TABLE fac_pedidos (
	id_pedido INT,
    sku_producto INT,
    estado_pedido VARCHAR(50),
	fecha_pedido DATE,
    id_cliente INT,
    tipo_pago_pedido VARCHAR(50),
    coto_pedido INT,
    importe_de_descuento_pedido DECIMAL(10,0),
    importe_total_pedido INT,
    cantidad_pedido INT,
    codigo_cupon_pedido VARCHAR(100),
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES dim_clientes (id_cliente),
    FOREIGN KEY (sku_producto) REFERENCES dim_producto (sku_producto)
    );
    
# Creación de Tabla fac_pagos_stripe
CREATE TABLE fac_pagos_stripe (
	id_pago INT,
	fecha_pago DATETIME(6),
    id_pedido INT,
    importe_pago INT,
    moneda_pago VARCHAR(5),
    comision_pago DECIMAL(10,2),
    neto_pago DECIMAL(10,2),
    tipo_pago VARCHAR(50),
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_pedido) REFERENCES fac_pedidos (id_pedido)
    ) 
```
   
2. Crear la tabla de productos a partir de los datos en crudo.
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Insertar los campos a la nueva tabla 
3. Crear la tabla de clientes a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Convertir el campo date_created que viene como timestamp a solo fecha
    4. Extraer del campo billing, todos los descriptivos del cliente que necesitamos aprendiendo a parsear un JSON. 
    5. Insertar los campos a la nueva tabla 
4. Crear la tabla de pedidos a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Sustituir el nombre del producto por el id.
    4. Normalizar la columna método de pago.
    5. Convertir a date la columna fecha_pedido
    6. Redondear decimales de la columna coste_articulo a enteros
    7. Insertamos los pedidos a la tabla
5. Crear la tabla de cobros de stripe a partir de los datos en crudo
    1. Chequear como vienen los datos
    2. Cambiar los nombres de los campos
    3. Obtener el número de pedido con la función RIGHT. Quitar el numero de pedido de la descripción que es lo que nos va a permitir unir esta tabla con otras
    4. Pasar a timestamp el campo “created”
    5. Reemplazar las commas por puntos
    6. Convertir el número a decimal con dos lugares despues de la comma.
    7. Insertar tabla en nueva
