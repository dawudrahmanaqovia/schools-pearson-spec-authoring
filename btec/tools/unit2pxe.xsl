<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:b="http://kode1100.com/btec"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://kode1100.com/btec"
    exclude-result-prefixes="xs math xd h"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 3, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> lech@kode1100.com</xd:p>
            <xd:p>A simple stylesheet to convert a single BTEC Unit document to PXE-compliant XHTML</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="b:unit">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head><xsl:value-of select="b:title"/></head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="b:description">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>