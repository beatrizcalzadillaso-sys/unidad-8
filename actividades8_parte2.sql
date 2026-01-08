use empresa_dam;

select *
from empleado;

select *
from departamento;

/*a) Muestra el nombre, puesto, salario y fecha de ingreso de los empleados que desempeñen el
mismo puesto que Esther Gómez Bilbao o que tengan un salario mayor o igual que el de
Albert Rius García.*/

select nomemp, puesto, salario, fecingreso
from empleado
where puesto like (select puesto from empleado where nomemp like '%Esther Gomez%')
    or salario >= (select salario from empleado where nomemp like '%Albert Rius%');

/*b) Muestra los nombres y puestos de los empleados que tienen el mismo puesto que el
empleado apellidado Jiménez, excluido este.*/

select puesto 
from empleado 
where nomemp like '%Jimenez%';

select nomemp, puesto
from empleado 
where puesto like (select puesto 
from empleado 
where nomemp like '%Jimenez%');

/*c) Visualiza los nombres de los departamentos en los que el salario medio es mayor o igual que
la media de todos los salarios.*/


