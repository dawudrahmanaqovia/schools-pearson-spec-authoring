<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:import href="stylesheet.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="unit">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>
                    <xsl:value-of select="title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../../css/wysiwym.css"/>
            </head>
            <body>
                <div class="{name()}">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
