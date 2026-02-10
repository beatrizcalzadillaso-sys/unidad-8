use empresa_dam;

/*a) Indica por cada departamento su nombre y localidad, así como el número de empleados que
trabajan en él y su salario medio redondeado a dos decimales, ordenando el resultado por
salario medio.*/

select d.nomdep, 
		d.localidad, 
		count(e.numemp) as CantEmp, 
        round(avg(e.salario), 2) as salarioMedio
from departamento d join empleado e on d.numdep = e.numdep
group by d.numdep
order by salarioMedio desc;


/*b) Indica por cada departamento y puesto, el nombre del departamento y el puesto así como el
salario medio y la comisión media de los empleados que desempeñan ese puesto en ese
departamento. Ordena el resultado por salario medio de mayor a menor.*/
		/*dos criterios de agrupamiento en una misma sentencia*/
select d.NomDep as NombreDep, e.puesto, round(avg(e.salario), 2) as SalarioMed, round(avg(e.comision),2) as ComisionMed
from departamento d join empleado e on d.numdep = e.numdep
group by NombreDep, e.puesto
order by SalarioMed desc;

/*c) Visualiza por cada puesto de los empleados del departamento de Ventas, el nombre del puesto
y la suma de salarios de los empleados con dicho puesto.*/

select e.puesto as Puesto, sum(e.salario) as SumSalario
from departamento d inner join empleado e on d.numdep = e.numdep
where d.NomDep like "ventas"
group by e.puesto;

/*d) Visualiza el número de empleados de cada departamento cuyo oficio sea empleado, indicando
el nombre del departamento y el número de empleados.*/

select d.nomdep as Nomdep, count(e.numdep) as CantidadEmpleados
from departamento d inner join empleado e on d.numdep = e.numdep
where e.puesto like "empleado"
group by Nomdep;

/*e) Muestra para todos los departamentos su nombre y localidad y además el número de
empleados que trabajan en él. Si en un departamento no trabaja ningún empleado, deberá
ponerse un 0 en el número de empleados.*/