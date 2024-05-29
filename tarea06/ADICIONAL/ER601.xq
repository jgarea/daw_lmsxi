(: 1. Título y editorial de todos los libros.
   - Los datos de cada libro deben estar dentro de un elemento <libro>.
   - El título y la editorial de cada libro deben estar separados por un guión medio (-).
for $x in doc("biblioteca.xml")/biblioteca/libros/libro
return <libro>{$x/titulo/text()} - {$x/editorial/text()}</libro>
:)

(: Otra solución
for $x in doc("biblioteca.xml")/biblioteca/libros/libro
return <libro>{ concat($x/titulo/text(), ' - ', $x/editorial/text()) }</libro>
:)

(: 2. El título de todos los libros de menos de 400 páginas.
   - Se debe obtener únicamente los datos, sin etiquetas. 
for $x in doc("biblioteca.xml")/biblioteca/libros/libro
where number($x/paginas) < 400
return data($x/titulo)  
:)


(: Otra solución
    nomalize-space = permite eliminar espacios al principio y final del texto 
for $x in doc("biblioteca.xml")/biblioteca/libros/libro
where number($x/paginas) < 400
return normalize-space($x/titulo/text())
:)

(: 3. La cantidad de libros de más de 400 páginas. 
let $libros := doc("biblioteca.xml")/biblioteca/libros/libro[number(paginas) > 400]
return count($libros)
:)

(: Otra solución
count(
  for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
  where number($libro/paginas) > 400  
  return $libro
)
:)

(: 4. Una lista HTML con el título de los libros de la editorial O'Reilly Media ordenados por título.
<ul>
  {
    for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
    where $libro/editorial = "O'Reilly Media"
    order by $libro/titulo
    return <li>{data($libro/titulo)}</li>
  }
</ul>
:)


(: 5. Título y editorial de los libros de 2018 y 2019.
  - Los datos de cada libro deben estar dentro de un elemento <libro>.
  - El título y la editorial deben ir dentro de los elementos <titulo> y <editorial> respectivamente. 
for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where $libro[@publicacion=2018 or @publicacion=2019]
return <libro>{$libro/titulo, $libro/editorial}</libro>
:)

(: Otra solución
for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where $libro[@publicacion=2018] or $libro[@publicacion=2019]
return <libro>{$libro/titulo} {$libro/editorial}</libro>
:)

(: 6. Título y editorial de los libros con más de un autor.
   - Los datos de cada libro deben estar dentro de un elemento <libro>.
   - El título y la editorial deben ir dentro de los elementos <titulo> y <editorial> respectivamente. 
for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where count($libro/autor) > 1
return <libro>{$libro/titulo, $libro/editorial}</libro>
:)



(: 7. Título y año de publicación de los libros que tienen versión electrónica.
   - Los datos de cada libro deben estar dentro de un elemento <libro>.
   - El título y el año de publicación deben ir dentro de los elementos <titulo> y <fecha-publicacion> respectivamente. 
for 
  $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where 
  $libro/edicionElectronica
return 
  <libro>
    {$libro/titulo}
    <fecha-publicacion>{data($libro/@publicacion)}</fecha-publicacion>
  </libro>
:)

(: 8. Título de los libros que no tienen versión electrónica.
   - Se debe obtener únicamente los datos, sin etiquetas.
for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where not($libro/edicionElectronica)
return $libro/titulo/text()
 :)

(: Observación: si no estamos seguros de que edicionElectronica puede también aparecer como false
for $libro in doc("biblioteca.xml")/biblioteca/libros/libro
where not($libro/edicionElectronica) or $libro/edicionElectronica = "false"
return $libro/titulo/text()
 :)