<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:import href="CamelCase.xsl"/>
    
    <xsl:template match="section1 | section2 | section3 | section4 | section5 | section6 | text">
        <div class="{name()}">
            <span class="blurb"><xsl:value-of select="name()"/></span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="link">
        <a><xsl:apply-templates select="@*|node()"/></a>
    </xsl:template> 
   
 
    
    <xsl:template match="image">
        
        <div class="box {name()}">
            
            <div class="box {name()}">
                <span class="uneditable">
                    <xsl:text>Image SRC:</xsl:text>
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
    
    
    <xsl:template match="title">
        <div class="{name()}">
            <span><xsl:apply-templates select="text()"/></span>
        </div>
    </xsl:template>
    
    
    <xsl:template match="paragraph | list_description | description">
        <p class="editable">
            <xsl:apply-templates select="@*|node()"/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="describedlist">
        <div class="{name()}">
          <!--  <span class="blurb">Described List</span>-->
            <!--<xsl:apply-templates select="list_description"/>
            <xsl:apply-templates select="unorderedlist | orderedlist"/>-->
            
        <p class="editable">
            <xsl:apply-templates select="@*|node()"/>
        </p>    
                
        </div>
    </xsl:template>
   
   
       <xsl:template match="describedlist/paragraph | describedlist/description">
			<p class="editable">
				<xsl:apply-templates select="@*|node()"/>
			</p>                
        </xsl:template>
    
    
    <xsl:template match="generated_table_reference">
        <div class="box {name()}">
            <div class="blurb">An automatically generated table reference lets the system know where to insert a particular table that is automatically generated in a later processing stage</div>
            <span class="uneditable">
                <xsl:text>Automatically Generated Table Reference: </xsl:text>
            </span>
            <span class="editable">
                <xsl:apply-templates select="text()"/>
            </span>
        </div>
    </xsl:template>
    
   
    <!-- Render inline elements -->
    
    <xsl:template match="strong">
        <b>
            <xsl:apply-templates select="node()"/>
        </b>
    </xsl:template>
    
    <xsl:template match="emphasis">
        <i>
            <xsl:apply-templates select="node()"/>
        </i>
    </xsl:template>
    
    <xsl:template match="underline">
        <u>
            <xsl:apply-templates select="node()"/>
        </u>
    </xsl:template>
    
    <xsl:template match="subscript">
        <sub>
            <xsl:apply-templates select="node()"/>
        </sub>
    </xsl:template>
    
    <xsl:template match="superscript">
        <sup>
            <xsl:apply-templates select="node()"/>
        </sup>
    </xsl:template>
    
    
    <!-- List Elements -->
    
    <xsl:template match="unorderedlist">
        <ul>
            <xsl:apply-templates select="item"/>
        </ul>
    </xsl:template>
    
    
    <xsl:template match="orderedlist">
        <ol><xsl:apply-templates select="item"/></ol>
    </xsl:template> 
    
    
    
    <xsl:template match="item">
        <li class="editable">
            <xsl:apply-templates select="*"/>
        </li>
    </xsl:template>
    
    
    <xsl:template name="blurb_CamelCase">
        <xsl:param name="value"/>
        <div class="blurb">
            
            <xsl:call-template name="CamelCase">
                <xsl:with-param name="text" select="translate($value,'_',' ')"/>
            </xsl:call-template>
            
        </div>
    </xsl:template>
    
  <!--  <xsl:template match="table">
        <div align="center">
            <table border="0">
                
                <xsl:copy-of select="@cellpadding"/>
                
                <xsl:attribute name="width"><!-\- literal width on table elm fails in Firefox xslt -\->
                    <xsl:value-of select="@width"/>
                    <xsl:text>%</xsl:text>
                </xsl:attribute>
                
              
                
                <!-\- Default the cellpadding attribute to 0. -\->
                <xsl:choose>
                    <xsl:when test="@cellspacing">
                        <xsl:copy-of select="@cellspacing"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="cellspacing">0</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:apply-templates select="tbody"/>
            </table>
            <xsl:apply-templates select="caption"/>
        </div>
    </xsl:template>
    
    <xsl:template match="caption">
        <div class="caption">
            <xsl:apply-templates select="node()"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody>
                      
            <xsl:apply-templates select="tr"/>
        </tbody>
    </xsl:template>
    
    <xsl:template match="tr">
        <tr>
            <!-\- Add an even or odd class to each row so we can alternate the row colors. -\->
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">evenorodd_odd</xsl:when>
                    <xsl:otherwise>evenorodd_even</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="td|th"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="td|th">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@rowspan"/>
            <xsl:copy-of select="@colspan"/>
             <xsl:attribute name="valign">top</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
 -->
    
    <!-- Render table -->
    
    <xsl:template match="table">
        <div align="center">
            <table border="0" width="{@width}%">
                <xsl:copy-of select="@cellpadding"/>
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="@color">color_<xsl:value-of select="@color" /></xsl:when>
                        <xsl:otherwise>color_grey</xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="@border"> border_<xsl:value-of select="@border" /></xsl:when>
                        <xsl:otherwise> border_no</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                
                <!-- Default the cellpadding attribute to 0. -->
                <xsl:choose>
                    <xsl:when test="@cellspacing">
                        <xsl:copy-of select="@cellspacing"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="cellspacing">0</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:apply-templates select="caption|tbody"/>
            </table>
        </div>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody>
            <xsl:attribute name="class">
                <xsl:text>rowcoloring_</xsl:text><xsl:choose><xsl:when test="../@alternaterowcolor='true' or ../@alternaterowcolor='1'">alternate</xsl:when><xsl:otherwise>normal</xsl:otherwise></xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="tr"/>
        </tbody>
    </xsl:template>
    
    <xsl:template match="tr">
        <tr>
            <!-- Add an even or odd class to each row so we can alternate the row colors. -->
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">evenorodd_odd</xsl:when>
                    <xsl:otherwise>evenorodd_even</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:apply-templates select="td|th"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="td|th">
        <xsl:element name="{local-name()}" namespace="http://www.w3.org/1999/xhtml">
            <xsl:copy-of select="@rowspan"/>
            <xsl:copy-of select="@colspan"/>
            <xsl:copy-of select="@bgcolor"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Copy attributes by default -->
    <xsl:template match="@*">
        <xsl:copy-of select="." />
    </xsl:template>
    
    <xsl:template match="@align">
        <xsl:attribute name="class">
            <xsl:text>align-</xsl:text>
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    
</xsl:stylesheet>