for $x in doc("libros.xml")/biblioteca/libros/libro
where not($x/versionElectronica)
return $x/titulo