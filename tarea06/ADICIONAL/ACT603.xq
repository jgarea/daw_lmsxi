(: 1. Nombre y país (separados por un espacio en blanco) de todos los artistas. 
for $artista in doc("artistas.xml")/artistas/artista
return concat($artista/nombre, " ", $artista/pais)
:)



(: 2. El nombre de los artistas que nacieron antes de 1500. 
for $artista in doc("artistas.xml")/artistas/artista
where $artista/nacimiento < 1500
return $artista/nombre/text()
:)



(: 3. Nombre de los artistas que no han fallecido ordenados por orden alfabético. Los artistas vivos son aquellos que no tienen el elemento <fallecimiento>. 
for $artista in doc("artistas.xml")/artistas/artista
where not($artista/fallecimiento)
order by $artista/nombre ascending
return $artista/nombre/text()
:)

(: Alternativa
for $artista in doc("artistas.xml")/artistas/artista
where not(exists($artista/fallecimiento))
order by $artista/nombre ascending
return $artista/nombre/text()
:)


(: 4. Nombre y año de fallecimiento (separados por un espacio en blanco) de los artistas que han fallecido. Los artistas fallecidos son aquellos que tienen el elemento <fallecimiento>. 
for $artista in doc("artistas.xml")/artistas/artista
where exists($artista/fallecimiento)
return concat($artista/nombre, " ", $artista/fallecimiento)
:)



(: 5. Una lista HTML no ordenada con el nombre de los artistas nacidos en España. 
<ul>
{
  for $artista in doc("artistas.xml")/artistas/artista
  where $artista/pais = "España"
  return <li>{$artista/nombre/text()}</li>
}
</ul>
:)

(: Alternativa sin repetir artistas 
<ul>
{
    for $a in distinct-values(
    for $artista in doc("artistas.xml")/artistas/artista
    where $artista/pais = "España"
    return $artista/nombre/text()
  )
  return <li>{$a}</li>
}
</ul>
:)


(: 6. Nombre e identificador (separados por un espacio en blanco) de los artistas italianos. 
for $artista in doc("artistas.xml")/artistas/artista
where $artista/pais = "Italia"
return concat($artista/nombre, " ", $artista/@id)
:)



(: 7. La cantidad de artistas nacidos antes de 1600. 
count(
  for $artista in doc("artistas.xml")/artistas/artista
  where $artista/nacimiento < 1600
  return $artista
)
:)



(: 8. Los nombres de los artistas cuyo nombre empieza por P. 
for $artista in doc("artistas.xml")/artistas/artista
where starts-with($artista/nombre, "P")
return $artista/nombre/text()
:)



(: 9. El último artista (elemento <artista>) fallecido. 
for $artista in doc("artistas.xml")/artistas/artista
where 
  exists($artista/fallecimiento) and 
  $artista/fallecimiento = max(doc("artistas.xml")/artistas/artista/fallecimiento)
return $artista
:)



(: 10. El nombre de todos los artistas que tienen una longitud de nombre de más de 15 caracteres. 
for $artista in doc("artistas.xml")/artistas/artista
where string-length($artista/nombre) > 15
return $artista/nombre/text()
:)


