- [1. Indica por qué los siguientes ejemplos XML son incorrectos](#1-indica-por-qué-los-siguientes-ejemplos-xml-son-incorrectos)
  - [1.1. Ejercicio 1a)](#11-ejercicio-1a)
  - [1.2. Ejercicio 1b)](#12-ejercicio-1b)
  - [1.3. Ejercicio 1c)](#13-ejercicio-1c)
  - [1.4. Ejercicio 1d)](#14-ejercicio-1d)
  - [1.5. Ejercicio 1e)](#15-ejercicio-1e)
  - [1.6. Ejercicio 1f)](#16-ejercicio-1f)
  - [1.7. Ejercicio 1g)](#17-ejercicio-1g)
  - [1.8. Ejercicio 1h)](#18-ejercicio-1h)
- [2. Diseñar un documento válido en XML que permita estructurar la información de una agenda de teléfonos, suponer que la información que podemos tener de una persona es su nombre y apellidos, su dirección y sus teléfonos, que pueden ser el teléfono de casa, el móvil y el teléfono del trabajo.](#2-diseñar-un-documento-válido-en-xml-que-permita-estructurar-la-información-de-una-agenda-de-teléfonos-suponer-que-la-información-que-podemos-tener-de-una-persona-es-su-nombre-y-apellidos-su-dirección-y-sus-teléfonos-que-pueden-ser-el-teléfono-de-casa-el-móvil-y-el-teléfono-del-trabajo)
- [3. Diseñar un documento válido en XML que permita estructurar la información de las recetas de cocina de un restaurante y aplicarlo a la siguiente receta de cocina. Hay que hacerlo de modo que un sistema informático pueda realizar búsquedas por ingredientes, cantidad de comensales o nombre de la receta](#3-diseñar-un-documento-válido-en-xml-que-permita-estructurar-la-información-de-las-recetas-de-cocina-de-un-restaurante-y-aplicarlo-a-la-siguiente-receta-de-cocina-hay-que-hacerlo-de-modo-que-un-sistema-informático-pueda-realizar-búsquedas-por-ingredientes-cantidad-de-comensales-o-nombre-de-la-receta)
- [4. Diseñar un documento XML válido que permita estructurar la información para permitir su gestión informática de los alumnos de un modulo del ciclo formativo DAW. Aplicarlo al módulo de Lenguajes de Marcas y Sistemas de Gestión de Información sabiendo que tiene asignadas 4 horas semanales y es de carácter obligatorio. El modulo se imparte entre el 15 de septiembre de 2023 y el 30 de junio de 2024. Hay matriculados dos alumnos:](#4-diseñar-un-documento-xml-válido-que-permita-estructurar-la-información-para-permitir-su-gestión-informática-de-los-alumnos-de-un-modulo-del-ciclo-formativo-daw-aplicarlo-al-módulo-de-lenguajes-de-marcas-y-sistemas-de-gestión-de-información-sabiendo-que-tiene-asignadas-4-horas-semanales-y-es-de-carácter-obligatorio-el-modulo-se-imparte-entre-el-15-de-septiembre-de-2023-y-el-30-de-junio-de-2024-hay-matriculados-dos-alumnos)
- [5. Diseñar Otro ejemplo de los lenguajes de marcas es el formato SVG que nos permite definir gráficos vectoriales visible en navegadores compatibles, vamos a comprobar si eres capaz de generar un archivo SVG y ponerlo a funcionar.](#5-diseñar-otro-ejemplo-de-los-lenguajes-de-marcas-es-el-formato-svg-que-nos-permite-definir-gráficos-vectoriales-visible-en-navegadores-compatibles-vamos-a-comprobar-si-eres-capaz-de-generar-un-archivo-svg-y-ponerlo-a-funcionar)

## 1. Indica por qué los siguientes ejemplos XML son incorrectos
### 1.1. Ejercicio 1a)
``<elemento>Elemento 1</elemento>``

``<elemento>Elemento 2</elemento>``

Tiene que tener solo un elemento raíz, en este caso hay dos.
### 1.2. Ejercicio 1b)
``<elemento>Coche</ELEMENTO>``

El nombre de la etiqueta es sensible a minúsculas y mayúsculas, la etiqueta tiene que
tener el mismo nombre.
### 1.3. Ejercicio 1c)
``<negrita><italica>Texto XML</negrita></italica>``

La étiqueta itálica tiene que cerrarse antes que la etiqueta negrita.
### 1.4. Ejercicio 1d)
``<rango>1 < 5 & 11 > 7</rango>``

Para añadir <, > o & hay que usar entidades. Para utilizarlas, se utilizan el símbolo &,
seguido del identificador de la entidad y ;


```
Caracter reservado Identificador Entidad XML
< lt &lt;
> gt &gt;
" quot &quot;
' apos &apos;
& amp &amp;
```

### 1.5. Ejercicio 1e)
````<XMLfichero>Marcas.xml</XMLfichero>````

No puede comenzar por la cadena xml, ni ninguna de sus versiones en que se cambien
mayúsculas y minúsculas (XML, XmL, xML, etc.).

### 1.6. Ejercicio 1f)
``<![CDATA[ <[[aa]]>]]>``

Dentro de una sección CDATA no se puede escribir la cadena ]]>. En consecuencia, no
se pueden anidar secciones CDATA, es decir, introducir secciones CDATA dentro de
otras.

### 1.7. Ejercicio 1g)
``<user@uo>Pedro@Empleados</user@guo>``

El nombre de la etiqueta no es igual en el inicio y en el cierre.
Para utilizar caracteres especiales (como £, ©, ®, etc.) hay que usar las expresiones
``&#D``; o ``&#H``;, donde D y H se corresponden respectivamente con el número decimal o
hexadecimal asociado al caracter que se quiere representar en el código UNICODE.

### 1.8. Ejercicio 1h)
``<texto>El titular de hoy se basa en esta <subrayado>noticia<subrayado></texto>``

Debería cerrar la etiqueta subrayado (``</subrayado>``) y para que fuera correcto debería
ser de la siguiente forma:
``<texto><subrayado>``El titular de hoy se basa en esta noticia``</subrayado></texto>``

## 2. Diseñar un documento válido en XML que permita estructurar la información de una agenda de teléfonos, suponer que la información que podemos tener de una persona es su nombre y apellidos, su dirección y sus teléfonos, que pueden ser el teléfono de casa, el móvil y el teléfono del trabajo.
Tendremos el elemento raíz agenda el cual tendrá multiples etiquetas contacto, una
por cada persona.
Del contacto guardamos la información del nombre y apellidos, en dirección la
subdividimos en varios apartados para que el acceso a esos datos sea más fácil.
Por último tendremos una etiqueta teléfonos, por cada teléfono del contacto tendrá
su propia etiqueta teléfono. Y le añadimos un atributo tipo para identificar el tipo de
teléfono

## 3. Diseñar un documento válido en XML que permita estructurar la información de las recetas de cocina de un restaurante y aplicarlo a la siguiente receta de cocina. Hay que hacerlo de modo que un sistema informático pueda realizar búsquedas por ingredientes, cantidad de comensales o nombre de la receta
Sopa de cebolla (4 personas)
Ingredientes:
1 Kg. de cebollas.
2 l. de caldo de carne.
100 gr. mantequilla.
1 cucharada de harina.
100 gr. de queso emmental suizo o gruyére rallado.
Pan tostado en rebanadas.
Tomillo.
1 hoja de laurel.
Pimienta.
Proceso:
Pelar y partir las cebollas en rodajas finas.
Rehogarlas con la mantequilla, sal y pimienta a fuego lento hasta que estén
transparentes sin dorarse.
Añadir la harina sin dejar de remover.
Ponerlo en una cazuela con el caldo, el tomillo y el laurel.
Dejar cocer a fuego lento durante unos 15 minutos.
Poner las rebanadas de pan encima, espolvorear el queso y gratinar al horno.

Tenemos la etiqueta raíz que es recetas, esta va a contener múltiples receta. Cada
receta tiene una etiqueta nombre, comensales e ingredientes.
Los ingredientes a su vez están divididos en ingrediente el cual esta formado por una
etiqueta nombre y otra cantidad opcional.
La cantidad a su vez tendrá un atributo para indicarnos el tipo de unidad.

## 4. Diseñar un documento XML válido que permita estructurar la información para permitir su gestión informática de los alumnos de un modulo del ciclo formativo DAW. Aplicarlo al módulo de Lenguajes de Marcas y Sistemas de Gestión de Información sabiendo que tiene asignadas 4 horas semanales y es de carácter obligatorio. El modulo se imparte entre el 15 de septiembre de 2023 y el 30 de junio de 2024. Hay matriculados dos alumnos:
Ana Fernández Gutiérrez con nif 16965696L teléfono
789654321 email ana.fdezgtrrez@hotmail.com, su dirección es C/ El Percebe, 13 de
Santander CP 39302 No hay información sobre las faltas de asistencia o sus notas hasta
el momento.
Pepito Grillo con nif 98765432H teléfono 656566555 email yhyh@yahoo.com, su
dirección es Avd. El Pez, 5 de Suances CP 39401. Su nota es "apto" y no tiene faltas de
asistencia

Cada módulo tendrá la información de u nombre, las horas y el tipo de horas, en este
caso semanales.
Una etiqueta con el carácter, obligatorio, opcional…
Fechas donde se guardarán cada una de las fechas con su correspondiente día mes y
año.
Y por último la información de los alumnos con su nombre apellidos, identificación
(por si tienen nie o pasaporte), teléfono email y dirección (dividida en calle, numero,
población y código postal)
Pueden tener las etiquetas nota y faltas (con una etiqueta falta por cada una) en caso
de que hay información. Son opcionales

## 5. Diseñar Otro ejemplo de los lenguajes de marcas es el formato SVG que nos permite definir gráficos vectoriales visible en navegadores compatibles, vamos a comprobar si eres capaz de generar un archivo SVG y ponerlo a funcionar.
[SVG(jock)](https://marketplace.visualstudio.com/items?itemName=jock.svg)