<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>
  <xsl:output method="html" indent="yes"/>


 
  <xsl:template match="annex" mode="noshortcuts">
    <div class="{name()}">
      <p class="blurb">Edit Section: annex</p>
      <xsl:apply-templates/>
    </div>
    
  </xsl:template>
  
  <xsl:template match="annex">
    <div class="{name()}">
      <p class="blurb">Edit Section: annex</p>
      <xsl:apply-templates/>
    </div>

  </xsl:template>

  <xsl:template match="annex_letter">

    <div class="box {name()}">
      <div class="box {name()}">
        <span class="uneditable">
          <xsl:text>annex Letter:</xsl:text>
        </span>
        <span class="editable">
          <xsl:value-of select="text()"/>
        </span>
      </div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
