(: 1. Los títulos de los libros con la etiqueta <titulo>.

for $titulo in doc("libreria.xml")/libreria/libro/titulo/text()
return <titulo>{$titulo}</titulo>
:)


(: 2. Los libros cuyo precio sea menor o igual a 30.

for $libro in doc("libreria.xml")/libreria/libro
where $libro/precio <= 30
return $libro
:)


(: 3. Solo el título de los libros cuyo precio sea menor o igual a 30.

for $libro in doc("libreria.xml")/libreria/libro
where $libro/precio <= 30
return $libro/titulo
:)


(: 4. Solo el título sin atributos de los libros cuyo precio sea menor o igual a 30.

for $libro in doc("libreria.xml")/libreria/libro
where $libro/precio <= 30
return data($libro/titulo)
:)


(: 5. El título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con la etiqueta <lib2005>.

for $libro in doc("libreria.xml")/libreria/libro
where $libro/año=2005
return <lib2005>{$libro/titulo,$libro/autor}</lib2005>
:)



(: 6. Los años de publicación, primero con for y luego con let para comprobar la diferencia entre ellos. Etiquetar la salida con <publicacion>.

for $libro in doc("libreria.xml")/libreria/libro
return <publicacion>{data($libro/año)}</publicacion>
:)


(: 7. Los libros ordenados primero por el atributo categoria y luego por titulo en una sola consulta.

for $libro in doc("libreria.xml")/libreria/libro
order by $libro/@categoria,$libro/titulo
return $libro
:)


(: 8. La cantidad de libros. Se debe etiquetar con <total>.

<total>{ count(for $libro in doc("libreria.xml")/libreria/libro return $libro) }</total>
:)



(: 9. Los títulos de los libros y, al final, una etiqueta con el número total de libros.

let $total := count (doc("libreria.xml")/libreria/libro),
  $titulos := (
    for $libro in doc("libreria.xml")/libreria/libro/titulo 
    return <titulo>{$libro/text()}</titulo>
  ) 
return 
  <resultado>
    {$titulos}
    <total_libros>{$total}</total_libros>
  </resultado>
:)


(: 10. El precio mínimo y máximo de los libros.

let $max := max(doc("libreria.xml")/libreria/libro/precio), 
    $min := min(doc("libreria.xml")/libreria/libro/precio)
return
<resultado>
  <max>{$max}</max>
  <min>{$min}</min>
</resultado>
:)


(: 11. El título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordenarlos por precio con IVA.

for $libro in doc("libreria.xml")/libreria/libro
let $precio_iva := ($libro/precio * 1.21)
order by $precio_iva
return 
<libro>
  <titulo>{$libro/titulo/text()}</titulo>
  <precio>{$libro/precio/text()} €</precio>
  <precio_iva>{$precio_iva} €</precio_iva>
</libro>
:)


(: 12. La suma total de los precios de los libros. Se debe etiquetar con <total>.
let $libros := doc("libreria.xml")/libreria/libro
return <total>{sum($libros/precio)}</total>
:)


(: 13. Cada uno de los precios de los libros y, al final, una nueva etiqueta con la suma de los precios.
let $libros := doc("libreria.xml")/libreria/libro
return <precios>
{$libros/precio}
<total>{sum($libros/precio)}</total>
</precios>
:)


(: 14. El título y el número de autores que tiene cada título en etiquetas diferentes.
for $libro in doc("libreria.xml")/libreria/libro
return 
  <libro>
    {$libro/titulo}
    <autores>{count($libro/autor)}</autores>
  </libro>
:)


(: 15. En la misma etiqueta, el título y, entre paréntesis, el número de autores que tiene ese título.
for $libro in doc("libreria.xml")/libreria/libro
return <libro>{$libro/titulo/text()} ({count($libro/autor)})</libro>
:)

(: 16. Los libros escritos en años que terminen en "3".
for $libro in doc("libreria.xml")/libreria/libro
where ends-with($libro/año, "3")
return $libro
:)


(: 17. Los libros cuya categoría empiece por "C".
for $libro in doc("libreria.xml")/libreria/libro
where starts-with($libro/@categoria, "C")
return $libro
:)



(: 18. Los libros que tengan una "X" mayúscula o minúscula en el título ordenados de manera descendente.
for $libro in doc("libreria.xml")/libreria/libro
where contains($libro/titulo, "x") or contains($libro/titulo, "X")
order by $libro/titulo descending
return $libro
:)

(: 19. El título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.
for $libro in doc("libreria.xml")/libreria/libro
return <libro>
  {$libro/titulo}
  <caracteres>{string-length($libro/titulo)}</caracteres>
</libro>
:)


(: 20. Todos los años en los que se ha publicado un libro eliminando los repetidos. Se deben etiquetar con <año>.
for $año in distinct-values(doc("libreria.xml")/libreria/libro/año)
return <año>{$año}</año>
:)


(: 21. Todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.
for $autor in distinct-values(doc("libreria.xml")/libreria/libro/autor)
order by string-length($autor)
return <autor>{$autor}</autor>
:)


(: 22. Los títulos en una tabla de HTML.
<table>
{
  for $libro in doc("libreria.xml")/libreria/libro
  return 
    <tr>
      <td>{$libro/titulo/text()}</td>
    </tr>
}
</table>  
:) 