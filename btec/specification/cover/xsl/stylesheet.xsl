<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <!-- block level elements -->

  <xsl:param name="showLearningObject" select="'A2'"/>


  <xsl:template match="cover_pages" mode="noshortcuts">
    <div class="{name()}">
      <h1 class="uneditable">Cover Pages</h1>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="cover_pages">
    <div class="{name()}">
      <h1 class="uneditable">Cover Pages</h1>
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
  </xsl:template>

  <xsl:template match="front_cover">

    <div class="{name()}">
      <h2 class="uneditable">Front Cover</h2>
      <xsl:choose>
        <xsl:when test="//cover_image">
          <xsl:apply-templates select="cover_image"/>
        </xsl:when>
        <xsl:otherwise>
          <div class="box {name()}">
            <span class="uneditable">
              <xsl:text>Right click to insert front cover image:</xsl:text>
            </span>
          </div>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="subject"/>
      <xsl:apply-templates select="first_teaching_month"/>
      <xsl:apply-templates select="first_teaching_year"/>
    </div>

  </xsl:template>


  <xsl:template match="inside_cover">
    <div class="{name()}">
      <h2 class="uneditable">Inside Cover</h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>



  <xsl:template match="cover_image">

    <div class="box {name()}">

      <div class="box {name()}">
        <span class="uneditable">
          <xsl:text>Cover Image SRC:</xsl:text>
        </span>
        <span class="editable">
          <xsl:value-of select="@src"/>
        </span>
      </div>

      <div class="box">
        <img src="{@src}">
          <xsl:if test="@width">
            <xsl:attribute name="width">
              <xsl:value-of select="@width"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@height">
            <xsl:attribute name="height">
              <xsl:value-of select="@height"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@halign and @halign!='none'">
            <xsl:attribute name="align">
              <xsl:value-of select="@halign"/>
            </xsl:attribute>
            <xsl:attribute name="class">align-<xsl:value-of select="@halign"/></xsl:attribute>
          </xsl:if>
        </img>
      </div>
    </div>

  </xsl:template>

  <xsl:template match="version">

    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Version:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>

  </xsl:template>

  <xsl:template match="subject">

    <div class="box {name()}">
      <div class="blurb">Subject</div>
      <span class="uneditable">
        <xsl:text>BTEC Level 1/Level 2 First Diploma in:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>

  </xsl:template>


  <xsl:template match="publication_code">

    <div class="box {name()}">
      <div class="blurb">See Jeni if you do not have this as she has ordered this</div>
      <span class="uneditable">
        <xsl:text>Publication Code:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>


  <xsl:template match="publication_stage">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Publication Stage:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>


  <xsl:template match="first_teaching_year">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>First Teaching Year:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>


  <xsl:template match="first_teaching_month">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>First Teaching Month:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="issue_number">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Issue Number:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

</xsl:stylesheet>
