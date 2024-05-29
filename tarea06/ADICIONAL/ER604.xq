(: 1. Listar el título de todos los libros.

for $libros in doc("bib.xml")/bib/libro/titulo
return $libros
:)

(: 2. Listar año y título de todos los libros, ordenados por el año.

for $a in doc("bib.xml")/bib/libro
order by $a/@ano
return
  <libro>
    <ano>{data($a/@ano)}</ano>
    {$a/titulo}
  </libro>
:)



(: 3. Listar los libros cuyo precio sea 65.95.

for $a in doc("bib.xml")/bib/libro
where $a/precio = '65.95'
return $a
:)



(: 4. Listar los libros publicados antes del año 2000.

for $a in doc("bib.xml")/bib/libro
where $a/@ano < 2000
return $a
:)



(: 5. Listar año y título de los libros publicados por Addison-Wesley después del año 1992.

for $a in doc("bib.xml")/bib/libro
where $a/editorial = "Addison-Wesley" and $a/@ano > 1991
return
  <libro ano="{ $a/@ano }">
    { $a/titulo }
  </libro>
:)



(: 6. Listar año y título de los libros que tienen más de un autor.

for $a in doc("bib.xml")/bib/libro
where count($a/autor) > 1
return <libro ano="{ $a/@ano }">{ $a/titulo }</libro>
:)


(: 
for $a in doc("bib.xml")/bib/libro
where count($a/autor) > 1
return <libro>{ $a/@ano } { $a/titulo }</libro>
:)

(: 
for $a in doc("bib.xml")/bib/libro
return
  if (count($a/autor) > 1) 
  then <libro ano="{ $a/@ano }">{ $a/titulo }</libro>
  else ()
:)



(: 7. Listar año y título de los libros que tienen no tienen autor.

for $a in doc("bib.xml")/bib/libro
where empty($a/autor)
return <libro ano="{ $a/@ano }">{ $a/titulo }</libro>
:)

(: 
for $a in doc("bib.xml")/bib/libro
where not(exists($a/autor))
return <libro ano="{ $a/@ano }">{ $a/titulo }</libro>
:)


(: 
for $a in doc("bib.xml")/bib/libro
return
  if (count($a/autor) = 0) 
  then <libro ano="{ $a/@ano }">{ $a/titulo }</libro>
  else ()
:)



(: 8. Mostrar los apellidos de los autores que aparecen en el documento, sin repeticiones, ordenados alfabéticamente.

for $a in distinct-values(doc("bib.xml")/bib/libro/autor/apellido) 
order by $a 
return $a
:)


(: 9. Por cada libro, listar agrupado en un elemento <result> su titulo y autores

for $b in doc("bib.xml")/bib/libro 
return 
<result> 
  { $b/titulo }
  <autores>
    { 
      for $a at $i in $b/autor 
      return <autor>{string($a)}</autor> 
    }
  </autores>
</result>
:)



(: 10. Por cada libro, obtener su título y el número de autores, agrupados en un elemento <libro>

for $b in doc("bib.xml")/bib/libro 
return 
  <libro> 
    { $b/titulo }
    <numeroAutores> 
      {count($b/autor)}
    </numeroAutores>
  </libro>
:)


(: 11. Generar un documento HTML con un encabezado de primer nivel que diga «Listado de libros» seguido de una tabla de 3 columnas (titulo, editorial y precio de cada libro). La tabla deberá tener bordes y la primera fila será la cabecera con los nombres de las columnas. El texto de las columnas título y editorial irán alineadas a la izquierda; y el de precio, a la derecha.

<html> 
  <head> 
    <title>Listado de libros</title> 
  </head>
  <body>
    <h1>Listado de libros</h1>
    <table border="1">
      <tr>
        <th>Titulo</th>  
        <th>Editorial</th>  
        <th>Precio</th> 
      </tr>

      { 
        for $a in doc("bib.xml")/bib/libro 
        return 
          <tr> 
            <td style="text-align:left">{ string( $a/titulo ) }</td> 
            <td style="text-align:left">{ string( $a/editorial ) }</td>
            <td style="text-align:right">{ string( $a/precio) }</td>
          </tr> 
      }

      (: No lo pide el enunciado, pero así se podría mostrar el precio medio de los libros :)
      { 
        let $a := doc("bib.xml")/bib/libro 
        return 
          <tr> 
            <td></td>
            <td></td>
            <td>{ avg( $a/precio ) }</td> 
          </tr> 
      } 
    </table> 
  </body> 
</html>
:)



(: 12. Generar un documento HTML con un encabezado de primer nivel que diga «Libros de Stevens» seguido de una tabla de 2 columnas (título y precio de cada libro del autor Stevens). La última fila contiene la suma del precio de todos los libros (se debe utilizar una consulta con una cláusula let).

<html> 
  <head> 
    <title>Libros de Stevens</title> 
  </head>
  <body>
    <h1>Libros de Stevens</h1>
    <table border="1">
      <tr> 
        <th>Titulo</th>
        <th>Precio</th>
      </tr>

      { 
        for $a in doc("bib.xml")/bib/libro 
        where $a/autor/apellido="Stevens"
        return 
        <tr> 
          <td>{$a/titulo}</td>
          <td>{$a/precio}</td>
        </tr>
      } 

      <tr>
        <td colspan="2">
          {
            let $a := doc("bib.xml")/bib/libro[autor/apellido="Stevens"]
            return sum( $a/precio )
          } 
        </td>
      </tr>
    </table> 
  </body> 
</html>

:)