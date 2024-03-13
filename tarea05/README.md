# Documentación
## Juan Eugenio Antón Area
## Configuración previa
1. Instalar extension XSLT/XPath VSCODE
2. Instalar node.js
3. Instalar Saxon-JS
```
npm init -yes
npm install --save-dev xslt3
```

Terminal -> Configurar tarea de compilacion predeterminada

xslt-js Saxon-JS Transform (NEW)

task.json
```json
{
	"version": "2.0.0",
	"tasks": [
		{
			"type": "xslt-js",
			"label": "xslt-js: DEMO1",
			"nodeModulesFolder": "${workspaceFolder}/node_modules",
			"xsltFile": "${workspaceFolder}/${relativeFile}",
			"xmlSource": "${workspaceFolder}/${relativeFileDirname}/${fileBasenameNoExtension}.xml",
			"resultPath": "${workspaceFolder}/${relativeFileDirname}/${fileBasenameNoExtension}.html",
			"parameters": [
				{
					"name": "val1",
					"value": "ejemplo de parametro"
				}
			],
			"group": {
				"kind": "build",
				"isDefault": true
			},
			"problemMatcher": [
				"$saxon-xslt-js"
			]
		}
	]
}
```

PAra ejecutar desde el archivo xslt:
`` CTRL+SHIFT+B ``

En caso de usar artistas de una forma más simple:
```
npx xslt3 -xsl:artistas.xslt -s:artistas.xml -o:artistas.html -t
```

### Instalar XPath Notebook for Visual Studio Code
.xbook para trabajar con xpath
xpather.com
para trabajar con xpath

## Decisiones tomadas
* Aplicamos una plantilla a la raiz del documento, y trabajamos con un ``for-each`` a los artistas descendientes de artista y con un nacimiento mayo que 1500.
* Paso siguiente los ordenamos por nacimiento.
* Recogemos cada uno de los elementos en un **td**
* En caso de que no existe el elemento **fallecimiento** agregamos el texto Desconocido con ``xsl:text``. Comprobamos que existe o no con el método ``exist()`` y ``not(exist())`` mediante un ``xsl:if``
* Para agregar el href al **a** lo hacemos con ``xsl:attribute``
