create database guia2BDD;
use guia2bdd;
create table departamento(
codigo int primary key,
nombre varchar(100),
presupuesto double,
gastos double
);
create table empleado(
codigo int primary key,
nif varchar(9),
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
codigoDepartamento int,
constraint fkDep foreign key (codigoDepartamento) references departamento(codigo)
);
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

use guia2BDD;

-- 1. Lista el primer apellido de todos los empleados
select apellido1 from empleado;

--  Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
select * from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
select nombre,apellido1 from empleado;

-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
select codigoDepartamento from empleado;

/* 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado,
 eliminando los códigos que aparecen repetidos.*/
select distinct codigoDepartamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
select concat (nombre, ' ', apellido1, ' ', apellido2) as nombreYApellidos from empleado;

/* 8. Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en mayúscula.*/
select upper (concat (nombre, ' ', apellido1, ' ', apellido2)) as nombreYApellidosMayus from empleado;

/*9. Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en minúscula.*/
select lower (concat (nombre, ' ', apellido1, ' ', apellido2)) as nombreYApellidosMinus from empleado;

/*10.Lista el código de los empleados junto al nif, pero el nif deberá aparecer en
dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.*/
select codigoDepartamento, left(nif, 8) as digitosNif, right(nif,1) as letraNif from empleado;

/*11. Lista el nombre de cada departamento y el valor del presupuesto actual del
que dispone. Para calcular este dato tendrá que restar al valor del
presupuesto inicial (columna presupuesto) los gastos que se han generado
(columna gastos). Tenga en cuenta que en algunos casos pueden existir
valores negativos. Utilice un alias apropiado para la nueva columna columna
que está calculando.*/
select nombre, (presupuesto - gastos) as presupuestoActual from departamento;

-- 12.Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, (presupuesto - gastos) as presupuestoActual from departamento order by presupuestoActual asc;

-- 13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre asc;

-- 14.Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento order by nombre desc;

/*15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma
alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
nombre.*/
select apellido1, apellido2, nombre from empleado order by apellido1 asc, apellido2 asc, nombre asc;

-- 16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by presupuesto desc limit 3;

-- 17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto asc limit 3;

-- 18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gastos from departamento order by gastos desc limit 2;

-- 19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gastos from departamento order by gastos asc limit 2;

/*20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
columnas de la tabla empleado.*/
select * from empleado limit 5 offset 2;

/*21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto mayor o igual a 150000 euros.*/
select nombre, presupuesto from departamento where presupuesto>=150000;

/*22.Devuelve una lista con el nombre de los departamentos y el gasto, de
aquellos que tienen menos de 5000 euros de gastos.*/
select nombre, gastos from departamento where gastos<5000;

/*23.Devuelve una lista con el nombre de los departamentos y el presupesto, de
aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar
el operador BETWEEN.*/
select nombre, presupuesto from departamento where presupuesto>100000 && presupuesto<200000;

/*24.Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.*/
select nombre, presupuesto from departamento where presupuesto<100000 or presupuesto>200000;

/*25.Devuelve una lista con el nombre de los departamentos que tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/
select nombre, presupuesto from departamento where presupuesto between 100000 and 200000;

/*26.Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/
select nombre, presupuesto from departamento where presupuesto not between 100000 and 200000;

/*27.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean mayores que
el presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos>presupuesto;

/*28.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean menores que
el presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos<presupuesto;

/*29.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean iguales al
presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos=presupuesto;

-- 30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;

-- 31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL
select * from empleado where apellido2 is not null;

-- 32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2='lopez';

/* 33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno.
Sin utilizar el operador IN.*/
select * from empleado where apellido2='diaz' or  apellido2='moreno';

/*34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o
Moreno. Utilizando el operador IN.*/
select * from empleado where apellido2 in ('diaz','moreno');

/*35.Lista los nombres, apellidos y nif de los empleados que trabajan en el
departamento 3.*/
select nombre, apellido1, apellido2, nif from empleado where codigoDepartamento=3;

/*36.Lista los nombres, apellidos y nif de los empleados que trabajan en los
departamentos 2, 4 o 5.*/
select nombre, apellido1, apellido2, nif from empleado where codigoDepartamento in (2,4,5);




-- Consultas multitabla (Composición interna)

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select *
from empleado e
inner join departamento d
on e.codigoDepartamento = d.codigo;

/*2. Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
del departamento (en orden alf*/
select *
from empleado e
inner join departamento  d
on e.codigoDepartamento = d.codigo
order by d.nombre asc;

/*3. Devuelve un listado con el código y el nombre del departamento, solamente
de aquellos departamentos que tienen empleados.*/
select d.codigo,d.nombre
from departamento d
inner join empleado e
on d.codigo = e.codigoDepartamento;

/*4. Devuelve un listado con el código, el nombre del departamento y el valor del
presupuesto actual del que dispone, solamente de aquellos departamentos
que tienen empleados. El valor del presupuesto actual lo puede calcular
restando al valor del presupuesto inicial (columna presupuesto) el valor de los
gastos que ha generado (columna gastos).*/
select d.codigo,d.nombre,(d.presupuesto - d.gastos) as presupuestoActual
from departamento d
inner join empleado e
on d.codigo = e.codigoDepartamento;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select d.nombre
from departamento d
inner join empleado e
on d.codigo = e.codigoDepartamento
where e.nif = '38382980M';

--  6 Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select d.nombre
from departamento d
inner join empleado e
on d.codigo = e.codigoDepartamento
where e.nombre = 'Pepe' and e.apellido1 = 'Ruiz' and e.apellido2 = 'Santana';

/*7. Devuelve un listado con los datos de los empleados que trabajan en el
departamento de I+D. Ordena el resultado alfabéticamente.*/
select *
from empleado e
where e.codigoDepartamento = (select codigo from departamento where nombre = 'I+D')
order by e.nombre, e.apellido1, e.apellido2;

select *
from empleado e
inner join departamento d
on e.codigoDepartamento = d.codigo
where d.nombre = 'I+D'
order by e.nombre asc, e.apellido1 asc, e.apellido2 asc;

/*8. Devuelve un listado con los datos de los empleados que trabajan en el
departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
alfabéticamente.*/
select *
from empleado e
inner join departamento d
on e.codigoDepartamento = d.codigo
where d.nombre = 'I+D' or d.nombre = 'Sistemas' or d.nombre = 'Contabilidad'
order by e.nombre asc, e.apellido1 asc, e.apellido2 asc;

/*9. Devuelve una lista con el nombre de los empleados que tienen los
departamentos que no tienen un presupuesto entre 100000 y 200000 euros.*/

select e.nombre, e.apellido1, e.apellido2
from empleado e
inner join departamento d
on e.codigoDepartamento = d.codigo
where d.presupuesto <100000 or d.presupuesto > 200000;

/*10.Devuelve un listado con el nombre de los departamentos donde existe algún
empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe
mostrar nombres de departamentos que estén repetidos.*/
select distinct d.nombre
from departamento d
inner join empleado e
on e.codigoDepartamento = d.codigo
where e.apellido2 is NUll;




-- Consultas multitabla (Composición externa)

/*1. Devuelve un listado con todos los empleados junto con los datos de los
departamentos donde trabajan. Este listado también debe incluir los
empleados que no tienen ningún departamento asociado.*/
select *
from empleado e
left join departamento d
on e.codigoDepartamento = d.codigo;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select *
from empleado e
left join departamento d
on e.codigoDepartamento = d.codigo
where d.codigo is null;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select *
from departamento d
left join empleado e
on d.codigo = e.codigoDepartamento
where e.codigoDepartamento is null;

/*4. Devuelve un listado con todos los empleados junto con los datos de los
departamentos donde trabajan. El listado debe incluir los empleados que no
tienen ningún departamento asociado y los departamentos que no tienen
ningún empleado asociado. Ordene el listado alfabéticamente por el nombre
del departamento.*/
select *, d.nombre as nombre_departamento
from empleado e
left join departamento d
on e.codigoDepartamento = d.codigo
union
select *, d.nombre as nombre_departamento
from empleado e
right join departamento d
on e.codigoDepartamento = d.codigo
order by nombre_departamento;

/*5. Devuelve un listado con los empleados que no tienen ningún departamento
asociado y los departamentos que no tienen ningún empleado asociado.
Ordene el listado alfabéticamente por el nombre del departamento.*/
select *, d.nombre as nombre_departamento
from empleado e
left join departamento d
on e.codigoDepartamento = d.codigo
where d.codigo is null
union
select *, d.nombre as nombre_departamento
from empleado e
right join departamento d
on e.codigoDepartamento = d.codigo
where e.codigoDepartamento is null;
