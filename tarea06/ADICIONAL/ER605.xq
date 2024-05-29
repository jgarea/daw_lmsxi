(: 1. Cada uno de los nombres de las categorias con la etiqueta <categoria>.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
return $tutorial/categoria/text()
:)



(: 2. Los títulos de los tutoriales con el número de visitas entre paréntesis, ambos dentro de la misma etiqueta <lostutoriales>.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
return 
  <lostutoriales>
    {$tutorial/titulo/text()} ({$tutorial/visitas/text()}) 
  </lostutoriales>
:)



(: 3. Los nombres de los tutoriales con menos de 2000 visitas.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
where $tutorial/visitas < 2000
return $tutorial/titulo/text()
:)


(: 4. Los nombres de los tutoriales de XML con más de 30.000 visitas.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
where contains($tutorial/titulo, 'XML') and $tutorial/visitas > 30000
return $tutorial/titulo/text()

(: 
for $tutorial in //tutorial
where where $tutorial/categoria = "XML" and $tutorial/visitas > 30000
return $tutorial/titulo/text()
:)



(: 5. El número total de visitas.

sum(
  for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
  return $tutorial/visitas
)
:)



(: 6. Los nombres de las categorías distintas, cada una en una etiqueta <categoriasdistintas>

for $categoria in distinct-values(doc("tutoriales.xml")/tutoriales/tutorial/categoria)
return <categoriasdistintas>{$categoria}</categoriasdistintas>
:)



(: 7. Nombres y apellidos de los autores eliminando los repetidos y acompañados cada nombre por todos sus tutoriales, ordenados alfabéticamente por nombre de autor. Cada autor en una etiqueta <autor> que contendrá una etiqueta <nombreyapellidos> y una etiqueta <titulo>.

for $autor in distinct-values(doc("tutoriales.xml")/tutoriales/tutorial/autor)
for $tutoriales in doc("tutoriales.xml")/tutoriales/tutorial
order by $autor ascending
where $tutoriales/autor = $autor
return 
  <autor>
    <nombreyapellidos>{$autor}</nombreyapellidos>
    <titulo>{$tutoriales/titulo}</titulo>
  </autor>
:)



(: 8. La media de vistas de los tutoriales, dentro de una etiqueta <media>

<media>
  {
    avg(for $visitas in doc("tutoriales.xml")/tutoriales/tutorial/visitas
    return $visitas)
  }
</media>
:)


(: 9. Número total de tutoriales de XML etiquetados dentro de una etiqueta <totaltutoriales>

<totaltutoriales>
  {
    count(
      for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
      where $tutorial/categoria = "XML"
      return $tutorial
    )
  }
</totaltutoriales>
:)


(: 10. El nombre del tutorial y su categoría, ordenado por el nombre de cada categoría.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
order by $tutorial/categoria ascending
return 
<tutorial>
  {$tutorial/categoria}
  {$tutorial/titulo}
</tutorial>
:)


(: 11. Todos los datos de cada tutorial excepto las visitas.

for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
return 
<tutorial>
  {$tutorial/titulo}
  <autor>
    {$tutorial/autor/nombre}
    {$tutorial/autor/apellidos}
  </autor>
  {$tutorial/categoria}
</tutorial>
:)


(: 12. En una tabla de HTML de dos columnas, el título de los tutoriales y los nombres de los autores.

<table>
  {
    for $tutorial in doc("tutoriales.xml")/tutoriales/tutorial
    return 
      <tr>
        <td>{$tutorial/titulo/text()}</td>
        <td>{$tutorial/autor/nombre/text()}</td>
      </tr>
  }
</table>
:)

