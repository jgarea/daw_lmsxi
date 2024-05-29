(: 1. El modelo de las impresoras de tipo láser. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/@tipo = "láser"
return $impresora/modelo/text()
:)



(: 2. La marca y modelo (separados por un espacio en blanco) de las impresoras con más de un tamaño. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where count($impresora/tamano) > 1
return concat($impresora/marca, " ", $impresora/modelo)
:)



(: 3. La marca y modelo (separados por un espacio en blanco) de las impresoras con tamaño A3 (pueden tener otros). 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/tamano = "A3"
return concat($impresora/marca, " ", $impresora/modelo)
:)



(: 4. La marca y modelo (separados por un espacio en blanco) de las impresoras con tamaño A3 como único tamaño. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/tamano = "A3" and count($impresora/tamano) = 1
return concat($impresora/marca, " ", $impresora/modelo)
:)



(: 5. El modelo de las impresoras en red. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where exists($impresora/enred)
return $impresora/modelo/text()
:)



(: 6. La cantidad de impresoras guardadas en el fichero XML. 
count(
  for $impresora in doc("impresoras.xml")/impresoras/impresora
  return $impresora
)
:)



(: 7. Las impresoras (elementos <impresora>) compradas en 2018 o después. Los resultados se deben ordenar por año de compra (orden ascendente). 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/@compra >= 2018
order by $impresora/@compra ascending 
return $impresora
:)



(: 8. Las impresoras (elementos <impresora>) con un peso igual o superior a 5 kg. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/peso >= 5
return $impresora
:)



(: 9. Las impresoras (elementos <impresora>) que tienen cartucho con código C-456P. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/cartucho = "C-456P"
return $impresora
:)



(: 10. La impresora (elemento <impresora>) más pesada. 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/peso = max(doc("impresoras.xml")/impresoras/impresora/peso)
return $impresora
:)

(: Alternativa 
for $impresora in doc("impresoras.xml")/impresoras/impresora
where $impresora/peso = max( 
  for $impresora2 in doc("impresoras.xml")/impresoras/impresora/peso
  return $impresora2)
return $impresora
:)

