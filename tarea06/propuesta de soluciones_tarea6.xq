(: Nombre y país de todos los artistas :)
for $x in doc("artistas.xml")/artistas/artista
return <artista>{$x/nombreCompleto, $x/pais}</artista>,

(:El nombre (sin etiquetas) de todos los artistas que nacieron antes de 1500 :)
for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento) <1500
return data($x/nombreCompleto),

(: Nombre de los artistas para los que no hay fecha de nacimiento :)
for $x in doc("artistas.xml")/artistas/artista
where not($x/fallecimiento) 
return $x/nombreCompleto,

(: Una lista HTMl con el nombre de los artistas nacidos en España :)
<ul>
{
for $x in doc("artistas.xml")/artistas/artista
where $x/pais = "España"
return <li>{data($x/nombreCompleto)}</li>
}
</ul>,

(:El número de  artistas nacidos antes de 1500 :)
for $x in doc("artistas.xml")/artistas
let $y := $x/artista[number(nacimiento) < 1600]
return count($y),


(: Modelo de las impresoras de tipo láser :)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/@tipo = "láser"
return ($x/modelo),

(: Marca y modelo de las impresoras con más de un tamaño :)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño) > 1
return <impresora>{$x/marca, $x/modelo}</impresora>,

(: Marca y modelo de las impresoras con tamaño A3 (puede tener otros) :)
for $x in doc("impresoras.xml")/impresoras/impresora
where  $x/tamaño = "A3"
return <impresora>{$x/marca, $x/modelo}</impresora>,

(: Marca y modelo de las impresoras con tamaño A3 como único tamaño:)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño) = 1 and $x/tamaño = "A3"
return <impresora>{$x/marca, $x/modelo}</impresora>,

(: Modelo de las impresoras en red :)
for $x in doc("impresoras.xml")/impresoras/impresora
where$x/enred
return $x/modelo

