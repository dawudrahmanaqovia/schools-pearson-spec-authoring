<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="units_specification_layout" mode="noshortcuts">
    <div class="{name()}">
      <p class="blurb">Edit Section: The layout of units in the specification</p>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="units_specification_layout">
    <div class="{name()}">
      <p class="blurb">Edit Section: The layout of units in the specification</p>
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
  </xsl:template>

</xsl:stylesheet>
