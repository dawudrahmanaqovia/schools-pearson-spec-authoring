<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>

  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="external_assessment" mode="noshortcuts">
    <div class="{name()}">
      <p class="blurb">Edit Section: External assessment</p>
      <xsl:apply-templates/>
    </div>
  </xsl:template>


  <xsl:template match="external_assessment">
    <div class="{name()}">
      <p class="blurb">Edit Section: External assessment</p>
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
  </xsl:template>

</xsl:stylesheet>
