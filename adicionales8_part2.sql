use empresa2_dam;

/*
a) Muestra los nombres de los empleados para los cuales el atributo NumHi tome un valor no
coincidente con el número de hijos almacenados en la tabla Hijo para ese empleado.
*/
/*  
*/
select *
from empleado E left outer join hijo HI on E.codemp = HI.codemp;

select codEmp, nomemp
from empleado 
where numhi>0 
and not exists (select codemp from hijo where empleado.codemp = hijo.codemp)
;

/*
c) Muestra los nombres de los departamentos y las poblaciones en las que se encuentran, para
los departamentos en los que haya al menos un empleado cuyo salario suponga más del 60%
de la suma salarial de los empleados de ese departamento.
*/

/*Sumatoria Salarios 60% por departamento*/
select coddep, (sum(salemp)*0.6) SumSalarios
from empleado
group by coddep;

select  e.coddep as DepartamentosDondeHayUnEmpleadoConMasDel60porcSalario 
from empleado e 
where e.salemp> (select (sum(salemp)*0.6) SumSalarios
					from empleado ee
					where ee.coddep = e.coddep
					group by coddep);
                    
/*finalizado*/
select D.coddep, D.nomdep, C.pobcen
from centro C right outer join departamento D on C.codcen = D.codcen
where D.coddep in (select  e.coddep
					from empleado e 
					where e.salemp> (select (sum(salemp)*0.6) SumSalarios
										from empleado ee
										where ee.coddep = e.coddep
										group by coddep));

select D.nomdep, C.pobcen
from centro C inner join departamento D on C.codcen = D.codcen
				inner join empleado E on D.coddep= E.coddep
where e.salemp> (select (sum(salemp)*0.6) 
										from empleado 
										where coddep = e.coddep
										group by coddep); 
                                        
/*b) Muestra por cada centro de trabajo su nombre, dirección y población, así como el nombre del
departamento con más presupuesto de dicho centro y tal presupuesto.*/

select 

/*d) Muestra para los departamentos con un presupuesto mayor que la suma de los presupuestos
de todos los departamentos ubicados en Murcia, el nombre del departamento, el nombre de su
director y su presupuesto.*/

/*e) Indica por cada departamento dirigido por un director de centro, su código, nombre, el nombre
de su director y el tipo de director.*/

/*f) Crea una tabla llamada Habilidades que contenga por cada habilidad poseída por al menos dos
empleados, el código de la habilidad, su descripción, el número de empleados que la poseen,
el nivel mínimo de esa habilidad y el nivel máximo. Llame a los atributos de esta tabla
CodHab, DesHab, NumEmp, NivMinHab y NivMaxHab, respectivamente. Muestra luego el
contenido de la tabla.*/


/*g) Para todos los empleados que posean alguna habilidad con nivel superior al nivel medio de
habilidad de los empleados del departamento con nombre Ventas Zona Sur, muestre el nombre
del empleado y por cada una de las habilidades poseídas, la descripción de la habilidad y el
nivel.*/
					
/*h) Para los empleados directores de departamento con salario superior a 1,5 veces el salario
medio de todos los empleados, muestra el nombre del empleado, su salario, el nombre del
departamento en el que trabaja y el nombre del centro en el que está ubicado su departamento.*/