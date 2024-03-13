<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Tabla de artistas</title>
            </head>
            <body>
                <!-- <h1>Mi pagina</h1> -->
                <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Año de nacimiento</th>
                            <th>Año de fallecimiento</th>
                            <th>País</th>
                            <th>Página web</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="artistas/artista[nacimiento>1500]">
                            <xsl:sort select="nacimiento" _order="ascending">
                                
                            </xsl:sort>
                            <tr>
                                <td><xsl:value-of select="@cod"/></td>
                                <td><xsl:value-of select="nombreCompleto"/></td>
                                <td><xsl:value-of select="nacimiento"/></td>
                                <td><xsl:if test="exists(fallecimiento)">
                                        <xsl:value-of select="fallecimiento"></xsl:value-of>
                                    </xsl:if>
                                    <xsl:if test="not(exists(fallecimiento))">
                                        <xsl:text>Desconocido</xsl:text>
                                    </xsl:if>
                                </td>
                                <td>
                                    <xsl:value-of select="pais"/>
                                </td>
                                <td>
                                    <a target="blank">
                                        <xsl:attribute name="href" select="fichaCompleta"/>
                                        <xsl:text>Saber más</xsl:text>
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>