declare function minPrice($p as xs:decimal?,$d as xs:decimal?) as xs:decimal? 
  { 
  let $disc := ($p * $d) div 100 
  return ($p - $disc) 
  };

  <minPrice>{minPrice($libros/precio,$libros/descuento)}</minPrice>