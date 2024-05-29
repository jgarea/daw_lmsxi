(: 1. Una lista que contiene, para cada receta, el elemento <titulo> de la receta y un elemento <calorias> que contenga el número de calorías.
<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    return
      <receta>
      { 
        $r/titulo, 
        <calorias>{number($r/nutricion/@caloria)}</calorias>
      }
      </receta>
  }
</recetas>
:)



(: 2. Una lista similar a la primera, ordenada según las calorías.

<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    order by number($r/nutricion/@caloria)
    return
      <receta>
      { 
        $r/titulo,
        <calorias>{number($r/nutricion/@caloria)}</calorias>
      }
      </receta>
  }
</recetas>
:)



(: 3. Una lista similar a la primera, ordenada alfabéticamente según el título.

<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    order by string($r/titulo)
    return
      <receta>
      { 
        $r/titulo,
        <calorias>{number($r/nutricion/@caloria)}</calorias>
      }
      </receta>
  }
</recetas>
:)



(: 4. Una lista similar a la primera, ordenada según el contenido de grasa.

<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    let $grasa := number($r/nutricion/@grasa || $r/nutricion/@grasas)
    order by $grasa
    return
      <receta>
      {
        $r/titulo,
        <calorias>{number($r/nutricion/@caloria)}</calorias>
      }
      </receta>
  }
</recetas>
:)



(: 5. Una lista similar a la primera, con el título como atributo y las calorías como contenido.

<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    order by string($r/titulo)
    return
      <receta titulo="{$r/titulo}">
      {
        <calorias>{number($r/nutricion/@caloria)}</calorias>
      }
      </receta>
  }
</recetas>
:)



(: 6. Una lista que contenga para cada receta, el título como atributo y cada uno de los ingredientes de nivel superior (sin añadir los ingredientes que están dentro de otros ingredientes).

<recetas>
  { 
    for $r in doc("recetas.xml")/recetas/receta
    return
      <receta title="{$r/titulo}">
      { 
        for $i in $r/ingrediente
        return
          <ingrediente>
            {string($i/@nombre)}
          </ingrediente>
      }
    </receta> 
  }
</recetas>
:)


(: 7. Una lista con cada una de las recetas que contengan el ingrediente harina. Poner el título de la receta como atributo del elemento receta.

<recetas>
{ 
  for $r in doc("recetas.xml")/recetas/receta
  where $r//ingrediente/@nombre="harina"
  return <receta title="{$r/titulo}"></receta>
}
</recetas>
:)


(: 8. Una lista de todas aquellas recetas que tengan un ingrediente llamado relleno y este contenga en su interior más de 5 elementos ingrediente. La lista resultante estará formada por elementos receta que contienen un atributo titulo con el valor del elemento titulo de la receta. Además, dentro de cada elemento receta habrá elementos ingrediente con el nombre de cada uno de los ingredientes.

<recetas>
{ 
  for $r in doc("recetas.xml")/recetas/receta
  for $i in $r/ingrediente
  where $i/@nombre="relleno" and count($i/ingrediente) > 5
  return
    <receta title="{$r/titulo}">
      {
        for $f in $i/ingrediente
        return <ingrediente>{data($f/@nombre)}</ingrediente>
      }
    </receta>
}
</recetas>
:)



(: 9. for $receta in doc("recetas.xml")/recetas/receta
where 
  $receta/ingrediente/@nombre='relleno' and 
  count($receta/ingrediente[@nombre='relleno']/ingrediente) > 5
return
  <receta title="{$receta/titulo}">
    {
      for $ingrediente in $receta/ingrediente[@nombre='relleno']/ingrediente
      return <ingrediente>{data($ingrediente/@nombre)}</ingrediente>
    }
  </receta>
:)

