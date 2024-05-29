(: 1. Cada uno de los nombres de los bailes con la etiqueta <losbailes>.
:)
for $baile in doc("bailes.xml")/bailes/baile
return <losbailes>{$baile/nombre/text()}</losbailes>



(: 
for $baile in doc("bailes.xml")/bailes/baile/nombre
return <losbailes>{$baile/text()}</losbailes>
:)


(: 2. Los nombres de los bailes seguidos con el número de plazas entre paréntesis, ambos dentro de la misma etiqueta <losbailes>.

for $baile in doc("bailes.xml")/bailes/baile
return <losbailes>{$baile/nombre/text()} ({$baile/plazas/text()})</losbailes>
:)

(: 3. Los nombres de los bailes cuyo precio sea mayor de 30.
for $baile in doc("bailes.xml")/bailes/baile
where $baile/precio > 30
return $baile/nombre/text()
:)


(: 4. Los nombres de los bailes cuyo precio sea mayor de 30 y la moneda euro.

for $baile in doc("bailes.xml")/bailes/baile
where $baile/precio > 30 and $baile/precio/@moneda = "euro"
return $baile/nombre/text()
:)

(: 5. Los nombres y la fecha de comienzo de los bailes que comiencen el mes de enero (utiliza para buscarlo la cadena de texto /1/).

for $baile in doc("bailes.xml")/bailes/baile
where contains($baile/comienzo, "/1/")
return 
  <baile>
    {$baile/profesor}
    {$baile/comienzo}
  </baile>
:)


(: 
for $baile in doc("bailes.xml")/bailes/baile
where contains($baile/comienzo, "/1/")
return concat($baile/profesor/text(), ' ', $baile/comienzo/text())
:)

(: 6. Los nombres de los profesores y la sala en la que dan clase, ordenados por sala.

for $baile in doc("bailes.xml")/bailes/baile
order by $baile/sala
return 
  <baile>
    {$baile/profesor}
    {$baile/sala}
  </baile>
:)


(: 7. Los nombres de los profesores, eliminando los repetidos y acompañando cada nombre con todas las salas en la que da clase. Ordenar por nombre.

for $profesor in distinct-values(doc("bailes.xml")/bailes/baile/profesor)
let $salas := doc("bailes.xml")/bailes/baile[profesor=$profesor]/sala
order by $profesor
return 
  <profesores>
    <nombre>{$profesor}</nombre>
    {$salas}
  </profesores>
:)


(: 8. La media de los precios de todos los bailes.

let $baile := doc("bailes.xml")/bailes/baile
return <media>{avg($baile/precio)}</media>
:)

(: 
let $baile := doc("bailes.xml")/bailes/baile
return avg($baile/precio)
:)

(: 
let $precios := doc("bailes.xml")/bailes/baile/precio
return avg($precios)
:)

(: 
avg(
  for $precio in doc("bailes.xml")/bailes/baile/precio
  return $precio
)
:)


(: 9. La suma de los precios de los bailes de la sala 1.

sum(
  for $baile in doc("bailes.xml")/bailes/baile
  where $baile/sala="1"
  return $baile/precio
)
:)

(: 10. La cantidad de plazas ofertadas por el profesor Jesus Lozano.

<plazas>
  {
    sum(
      for $baile in doc("bailes.xml")/bailes/baile
      where $baile/profesor="Jesus Lozano"
      return $baile/plazas
    )
  }
</plazas>
:)


(: 11. El dinero que ganaría la profesora Laura Mendiola si se completaran todas las plazas de su baile, sabiendo que solo tiene un baile.

for $baile in doc("bailes.xml")/bailes/baile
where $baile/profesor="Laura Mendiola"
return $baile/plazas * $baile/precio
:)


(: 12. El dinero que ganaría el profesor Jesus Lozano si se completaran todas las plazas de su baile, pero mostrando el beneficio de cada baile por separado.

for $baile in doc("bailes.xml")/bailes/baile
where $baile/profesor = "Jesus Lozano"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
:)

(: 13. Mostrar el dinero que ganaría la profesora Laura (no conocemos su apellido) si se completaran todas las plazas de su baile.

for $baile in doc("bailes.xml")/bailes/baile
where starts-with($baile/profesor, "Laura")
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
:)

(: 14. El nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile.

for $baile in doc("bailes.xml")/bailes/baile
order by $baile/nombre
return 
  <baile>
    {$baile/nombre}
    <precio>{$baile/precio/text()}</precio>
    <fam_numerosa>{$baile/precio * 0.85}</fam_numerosa>
  </baile>
:)

(: 15. Todos los datos de cada baile excepto la fecha de comienzo y de fin.

for $baile in doc("bailes.xml")/bailes/baile
return 
  <baile>
    {
      $baile/* 
      except $baile/comienzo 
      except $baile/fin
    }
  </baile>
:)

(: 16. En una tabla de HTML, los nombres de los bailes y su profesor, cada uno en una fila.

<table> 
  {
    for $baile in doc("bailes.xml")/bailes/baile
    return 
      <tr>
        <td>{$baile/nombre/text()}</td>
        <td>{$baile/profesor/text()}</td>
      </tr>
  } 
</table>
:)