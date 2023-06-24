#Caso de uso - Sandia Clothing
#Análisis de Ventas

#1 ¿Cuál fue la cantidad total vendida de todos los productos?
SELECT
SUM(qty) Cantidad_Total
FROM sandia_clothing.ventas;

#2 ¿Cuál es el ingreso total generado por todos los productos antes de los descuentos?
SELECT
SUM(qty) Cantidad_Total,
SUM(precio) Precio_Total,
SUM(qty*precio) Ventas_brutas
FROM sandia_clothing.ventas;

#3 ¿Cuál es el ingreso medio  generado por todos los productos antes de descuentos?
SELECT
AVG(qty*precio) Ingreso_medio
FROM sandia_clothing.ventas;

#4 ¿Cuál es el ingreso total generado por cada producto antes de los descuentos?
SELECT
nombre_producto Producto,  
SUM(v.qty*v.precio) Ingreso_total
FROM ventas v
LEFT JOIN producto_detalle pd ON v.id_producto = pd.id_producto
GROUP BY nombre_producto
ORDER BY Ingreso_total DESC;


#5 ¿Cuál fue el monto total del descuento para todos los productos?
SELECT 
SUM(descuento) Descuento_total
FROM sandia_clothing.ventas;

#6 ¿Cuál fue el monto total del descuento por cada producto?
SELECT
nombre_producto Producto,  
SUM(v.descuento) Descuento_total
FROM ventas v
LEFT JOIN producto_detalle pd ON v.id_producto = pd.id_producto  
GROUP BY nombre_producto
ORDER BY Descuento_total DESC;

# Análisis de Transacciones
#1 ¿Cuántas transacciones únicas hubo? (El campo de transacciones es el id_txn de la tabla ventas)
SELECT 
COUNT(DISTINCT(id_txn)) Transacciones_unicas
FROM sandia_clothing.ventas;

#2 ¿Cuáles son las ventas totales brutas de cada transacción?
SELECT 
id_txn Transacciones_unicas,
SUM(qty*precio) Ventas_Totales
FROM sandia_clothing.ventas
GROUP BY Transacciones_unicas
ORDER BY Ventas_Totales DESC;

#3 ¿Qué cantidad de productos totales se compran en cada transacción?
SELECT
id_txn Transacciones_unicas,
SUM(qty) Cantidad_total
FROM sandia_clothing.ventas
GROUP BY Transacciones_unicas;

#4 ¿Ordena el resultado anterior de mayor a menor cantidad de productos?
SELECT
id_txn Transacciones_unicas,
SUM(qty) Cantidad_total
FROM sandia_clothing.ventas
GROUP BY Transacciones_unicas
ORDER BY Cantidad_total DESC;

#5 ¿Cuál es el valor de descuento promedio por transacción?
SELECT
id_txn Transacciones_unicas,
SUM(descuento) Descuento_Total,
AVG(descuento) Descuento_promedio
FROM sandia_clothing.ventas
GROUP BY Transacciones_unicas;

#6 ¿Cuál es el ingreso promedio neto para transacciones de miembros “t”?
SELECT
id_txn Transacciones,
miembro,
AVG(qty*precio-descuento) Ventas_netas
FROM sandia_clothing.ventas
WHERE miembro = 't'
GROUP BY id_txn
ORDER BY Ventas_netas DESC;

#Análisis de Producto
#1 ¿Cuáles son los 3 productos principales por ingresos totales antes del descuento? 
#(Devuelve el nombre del producto haciendo un LEFT JOIN para traer el nombre y no el código)
SELECT
pd.nombre_producto,
SUM(v.qty*v.precio) Ingreso_Total
FROM sandia_clothing.ventas v
LEFT JOIN producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY nombre_producto
ORDER BY Ingreso_Total DESC
LIMIT 3;

#2 ¿Cuál es la cantidad total, los ingresos y el descuento de cada segmento de producto?
SELECT
pd.nombre_segmento,
SUM(v.qty) Cantidad_total,
SUM(v.descuento) Descuento,
SUM(v.qty*v.precio-v.descuento) Ingresos
FROM sandia_clothing.ventas v
LEFT JOIN sandia_clothing.producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY pd.nombre_segmento
ORDER BY Ingresos DESC;

#3 ¿Cuál es el producto más vendido para cada segmento? #falta
SELECT
pd.nombre_segmento,
pd.nombre_producto,
SUM(v.qty) Cantidad_total,
SUM(v.precio) Precio_total,
SUM(v.descuento) Descuento,
SUM(v.qty*v.precio-v.descuento) Ventas_netas
FROM sandia_clothing.ventas v
LEFT JOIN sandia_clothing.producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY pd.nombre_segmento, pd.nombre_producto
ORDER BY nombre_segmento, Ventas_netas DESC;

#4 ¿Cuál es la cantidad total, los ingresos y el descuento para cada categoría?
SELECT
pd.nombre_categoria,
-- pd.nombre_producto,
SUM(v.qty) Cantidad_total,
SUM(v.precio) Precio_total,
SUM(v.descuento) Descuento,
SUM(v.qty*v.precio-v.descuento) Ventas_netas
FROM sandia_clothing.ventas v
LEFT JOIN sandia_clothing.producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY pd.nombre_categoria
ORDER BY Nombre_categoria, Ventas_netas;

#5¿Cuál es el producto más vendido de cada categoría? #falta
SELECT
pd.nombre_categoria,
pd.nombre_producto,
SUM(v.qty*v.precio-v.descuento) Ventas_netas
FROM sandia_clothing.ventas v
LEFT JOIN sandia_clothing.producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY pd.nombre_categoria, pd.nombre_producto
ORDER BY Ventas_netas DESC
LIMIT 2;

#6 ¿Cuáles son los 5 productos que menos venden?
SELECT
pd.nombre_producto,
SUM(v.qty*v.precio-v.descuento) Ventas_netas
FROM sandia_clothing.ventas v
LEFT JOIN producto_detalle pd ON pd.id_producto = v.id_producto
GROUP BY nombre_producto
ORDER BY Ventas_netas ASC
LIMIT 5;

#7 ¿Cúal es la cantidad de productos vendidos para la categoría ‘Mujer’?
SELECT
pd.nombre_categoria,
SUM(v.qty) Cantidad_total,
SUM(v.precio) Precio_total,
SUM(v.descuento) Descuento,
SUM(v.qty*v.precio-v.descuento) Ventas_netas
FROM sandia_clothing.ventas v
LEFT JOIN sandia_clothing.producto_detalle pd ON pd.id_producto = v.id_producto
WHERE pd.nombre_categoria = 'Mujer'
GROUP BY pd.nombre_categoria
ORDER BY Nombre_categoria, Ventas_netas DESC;