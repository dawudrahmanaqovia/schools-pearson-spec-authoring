<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>

  <xsl:output method="html" indent="yes"/>


  <xsl:template match="awarding_and_reporting_for_the_qualification" mode="noshortcuts">
    <div class="{name()}">
      <p class="blurb">Edit Section: Awarding and reporting for the qualification</p>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="awarding_and_reporting_for_the_qualification">
    <div class="{name()}">
      <p class="blurb">Edit Section: Awarding and reporting for the qualification</p>
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
  </xsl:template>

</xsl:stylesheet>
