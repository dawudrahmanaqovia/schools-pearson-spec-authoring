<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>
  
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="introduction" mode="noshortcuts">
    <div class="{name()}">
      <h1 class="blurb">Introduction</h1>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="introduction">
    <div class="{name()}">
      <h1 class="blurb">Introduction</h1>
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
  </xsl:template>
  
  <xsl:template match="preface">
    <div class="{name()}">
      <p class="blurb">Preface</p>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="btec_first_section1 | btec_first_section2 | btec_first_section3  | btec_first_section4  | btec_first_section5  | btec_first_section6">
    <div class="{name()}">
      <span class="blurb">
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text" select="name()"/>
          <xsl:with-param name="replace" select="'btec_first_s'" />
          <xsl:with-param name="with" select="'S'"/>
        </xsl:call-template>
   <!--     
        <xsl:value-of select="translate(name(),'btec_first_section','Section')"/>--></span>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$with"/>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text"
            select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template match="BTEC_first_suite_of_qualifications_table">
    <div class="{name()}">
      <table width="90%" align="center">
        <thead>
          <tr><th colspan="4"><span class="blurb">The BTEC first suite of qualifications table would later be rendered into checkmark style</span></th></tr>
          <tr>
            <th class="uneditable">Qualification</th>
            <th class="uneditable">Award</th>
            <th class="uneditable">Certificate</th>
            <th class="uneditable">Extended Certificate</th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="BTEC_first_suite_of_qualifications_row"/>
        </tbody>
      </table>
    </div>
  </xsl:template>
  
  
  <xsl:template match="BTEC_first_suite_of_qualifications_row">
    
    <tr class="{name()}">
      <xsl:apply-templates/>
    </tr>
    
  </xsl:template>
  
  <xsl:template match="qualification | award | certificate | extended_certificate ">
    
    <td class="{name()}">
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </td>
    
  </xsl:template>
  
  
  <xsl:template match="qualification_unit">
    <div class="{name()}">
      <div class="uneditable">
        <xsl:text>Qualification</xsl:text>
      </div>
      <xsl:apply-templates select="qtitle"/>
      <xsl:apply-templates select="qnumber"/>
    </div>
  </xsl:template>
  
  
  <xsl:template match="qtitle">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Title:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>
  
  
  <xsl:template match="qnumber">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Number:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

</xsl:stylesheet>
