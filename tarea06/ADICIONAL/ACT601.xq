(: 1. Los usuarios (elementos <usuario>) con identificador igual o inferior a 20. 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/id <= 20
return $usuario
:)



(: 2. Los usuarios (elementos <usuario>) que tienen una edad entre 20 y 30 (incluidos). 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/edad >= 20 and $usuario/edad <= 30
return $usuario
:)



(: 3. Los usuarios (elementos <usuario>) de España (ES) e Italia (IT). 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario[pais = "ES" or pais = "IT"]
return $usuario
:)

(: Alternativa 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/pais = "ES" or $usuario/pais = "IT"
return $usuario
:)


(: 4. Los usuarios (elementos <usuario>) que tiene un email con extensión .com. 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/contains(email, ".com")
return $usuario
:)

(: Alternativa 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/pais = "ES" or $usuario/pais = "IT"
return $usuario
:)

(: 5. Los usuarios (elementos <usuario>) que tienen un nombre de 5 caracteres o menos. 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario[string-length(nombre)<=5]
return $usuario
:)



(: 6. El nombre y apellidos (separados por un espacio en blanco) de los usuarios de francia (FR). 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario[pais = "FR"]
return concat($usuario/nombre, " ", $usuario/apellido)
:)



(: 7. La lista completa de los países (códigos de 2 letras mayúsculas) de los usuarios almacenados en el documento XML. Los países no deben aparecer repetidos. 
for $pais in distinct-values(doc("usuarios.xml")/usuarios/usuario/pais)
return $pais
:)

(: Alternativa 
distinct-values(for $pais in doc("usuarios.xml")/usuarios/usuario/pais
return $pais)
:)



(: 8. Los usuarios (elementos <usuario>) con identificador superior a 50 y con edad igual o inferior a 80 años. 
for $usuario in /doc("usuarios.xml")/usuarios/usuario
where $usuario/id <= 20
return $usuario
:)

(: Alternativa
for $usuario in doc("usuarios.xml")/usuarios/usuario[id>50 and edad <=80]
return $usuario
:)


(: 9. La media de edad de los usuarios. 
let $usuario := /doc("usuarios.xml")/usuarios/usuario/edad
return avg($usuario)
:)

(: Alternativa 
avg(
  for $usuario in doc("usuarios.xml")/usuarios/usuario/edad
  return $usuario
)
:)


(: 10. La cantidad de usuarios guardados en el documento XML. 
count(
  for $usuario in doc("usuarios.xml")/usuarios/usuario
  return $usuario
)
:)


