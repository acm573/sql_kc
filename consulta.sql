-- Autor: César Armando Cruz Mendoza

select b.nombre as modelo, c.nombre as marca, d.nombre as grupo, a.fecha_compra, a.matricula, e.nombre as color, 
		a.kilometraje, f.nombre as aseguradora, a.numero_poliza 
from acm.vehiculos a, acm.modelos b, acm.marcas c, acm.grupos d, acm.colores e, acm.aseguradoras f
where a.id_modelo = b.id_modelo and 
b.id_marca = c.id_marca and 
c.id_grupo = d.id_grupo and
a.id_color = e.id_color and 
a.id_aseguradora = f.id_aseguradora;

