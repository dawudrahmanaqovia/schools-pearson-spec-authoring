<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../../shared/xsl/editing_types.xsl"/>
  <xsl:import href="../../shared/xsl/xopus_instructions.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <!-- block level elements -->

  <xsl:param name="showLearningObject" select="'A2'"/>
  
  <xsl:template match="unit" mode="noshortcuts">
    
    <div class="{name()}">
      <xsl:apply-templates/>
    </div>
    
  </xsl:template>
  
  <xsl:template match="unit">

    <div class="{name()}">
      <xsl:apply-templates/>
    </div>
    <xsl:call-template name="shortcuts"/>
    
  </xsl:template>

  <xsl:template match="criterion_guidance | criterion | teacher_guidance_text | assessment_guidance_text |meta">
    <div class="{name()}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="unit_title">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Unit title:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>


  <xsl:template match="text">
    <span>
      <xsl:apply-templates select="text()"/>
    </span>
  </xsl:template>
  

  <xsl:template match="type">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Unit type:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="number">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Unit Number:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="level">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Level:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="assessment_type">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Assessment type:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="guided_learning_hours">
    <div class="box {name()}">
      <span class="uneditable">
        <xsl:text>Guided learning hours:</xsl:text>
      </span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="introduction">
    <div class="unit_introduction">
      <h2 class="uneditable">Unit Introduction</h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="learning_objectives">

    <div class="{name()}">
      <h2 class="uneditable">Learning Aims and Unit Content</h2>
      <xsl:apply-templates select="learning_objective"/>
    </div>

  </xsl:template>

  <xsl:template match="learning_objective">
    <div class="{name()}">
      <h3 class="editable">
        <xsl:apply-templates select="learning_objective_title/text()"/>
      </h3>
      
      
      <!-- learn_obj_id is needed to implement the hidding although 
             -->
      <!--<xsl:choose>
        <xsl:when test="@learn_obj_id = $showLearningObject">-->
          <xsl:apply-templates select="distinct_objective"/>
          <xsl:apply-templates select="assessment_guidance"/>
          <xsl:apply-templates select="assessment_criteria"/>
          <xsl:apply-templates select="suggested_assignment_outlines"/>
       <!-- </xsl:when>
        <xsl:otherwise>
          <!-\- don't render chapter, but render the title, and make it clickable -\->
          <a href="#" onclick="Editor.getActiveCanvas().setViewParam('showLearningObject', '{@learn_obj_id}');">
            <h3 class="editable">
             Click to Show Learning Object
            </h3>
          </a>
        </xsl:otherwise>
      </xsl:choose>-->
    </div>
  </xsl:template>

  <xsl:template match="distinct_objective">
    <div class="{name()}">
      <span class="blurb">(aim) 'topic header'</span>
      <h4 class="editable">
        <xsl:apply-templates select="distinct_objective_title/text()"/>
      </h4>
      <xsl:apply-templates select="distinct_objective_text"/>
    </div>
  </xsl:template>




  <xsl:template match="teacher_guidance">
    <div class="{name()}">
      <h2 class="uneditable"> Teacher Guidance </h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="distinct_teacher_guidance">
    <div class="{name()}">
      <span class="blurb">Distinct teacher guidance subsection</span>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  
  <xsl:template match="global_assessment_guidance">
    <div class="{name()}">
      <span class="blurb">Aims assessment guidance section prior to potential specific learning aim assessment guidance section </span>
      <h2 class="uneditable">Assessment guidance</h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  

  <xsl:template match="assessment_guidance">
    <div class="{name()}">
      <span class="blurb">Assessment guidance section that is specific to the learning aim prior to the criterion specific assessment guidance </span>
      <h2 class="uneditable">Learning Aim Assessment guidance </h2>
      <xsl:apply-templates/>
    </div>
  </xsl:template>



  <xsl:template match="assessment_criteria">

    <div class="{name()}">

      <h2 class="uneditable">Learning Aim Assessment Criteria</h2>

      <!--<table id="_initials_reference" width="90%" align="center">
        <tbody>
          <tr>
            <td colspan="6">
              <p class="blurb">PLTS: This summary references where applicable, in the square brackets, the elements of the personal, learning and thinking skills applicable in the pass criteria. It identifies opportunities for learners to demonstrate effective application of the referenced elements of the skills.</p>
            </td>
          </tr>
          <tr>
            <td>
              <p class="blurb">IE - independent enquirers</p>
            </td>
            <td>
              <p class="blurb">EP - effective participators</p>
            </td>
            <td>
              <p class="blurb">CT - creative thinkers</p>
            </td>
            <td>
              <p class="blurb">RL - reflective learners</p>
            </td>
            <td>
              <p class="blurb">SM - self-managers</p>
            </td>
            <td>
              <p class="blurb">TW - team workers</p>
            </td>
          </tr>
        </tbody>
      </table>-->

      <div class="level_1_criteria">
        <h4 class="uneditable">Level 1</h4>
        <xsl:apply-templates select="level_1_criteria"/>
      </div>
      <div class="pass_criteria">
        <h4 class="uneditable">Level 2 Pass</h4>
        <xsl:apply-templates select="pass_criteria"/>
      </div>
      <div class="merit_criteria">
        <h4 class="uneditable">Level 2 Merit</h4>
        <xsl:apply-templates select="merit_criteria"/>
      </div>
      <div class="distinction_criteria">
        <h4 class="uneditable">Level 2 Distinction</h4>
        <xsl:apply-templates select="distinction_criteria"/>
      </div>

    </div>
  </xsl:template>




  <xsl:template match="suggested_assignment_outlines">

    <div class="{name()}">

      <h2 class="uneditable">Suggested Assignment Outlines</h2>

      <table width="100%" align="center">
        <thead>
          <tr>
            <td width="15%">
              <h4 class="uneditable">Criteria Covered</h4>
            </td>
            <td width="15%">
              <h4 class="uneditable">Assignment Title</h4>
            </td>
            <td width="50%">
              <h4 class="uneditable">Scenario</h4>
            </td>
            <td width="20">
              <h4 class="uneditable">Assessment Evidence</h4>
            </td>
          </tr>
        </thead>
        <tbody>

          <xsl:apply-templates select="distinct_suggested_assignment_outline"/>

        </tbody>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="distinct_suggested_assignment_outline">

    <tr id="{name()}" height="100%">
      <td valign="top" height="100%">
        <xsl:apply-templates select="criteria_covered"/>
      </td>
      <td valign="top" height="100%">
        <div class="assignment_title">
          <h4 class="editable">
            <xsl:apply-templates select="assignment_title/text()"/>
          </h4>
        </div>
      </td>
      <td valign="top" height="100%">
        <xsl:apply-templates select="scenario"/>
      </td>
      <td valign="top" height="100%">
        <xsl:apply-templates select="assessment_evidence"/>
      </td>
    </tr>
  </xsl:template>



  <xsl:template match="criteria_covered  | scenario | assessment_evidence">
    <div class="{name()}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>



  <xsl:template match="level_1_criteria | pass_criteria | merit_criteria | distinction_criteria">

    <xsl:call-template name="blurb_CamelCase">
      <xsl:with-param name="value" select="name()"/>
    </xsl:call-template>
    <xsl:apply-templates/>

  </xsl:template>


  <xsl:template match="criterion_id">
    <div class="{name()}">
      <span class="uneditable">ID:</span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>
  
  <xsl:template match="GSCE_english">
    <div class="{name()}">
      <span class="uneditable">GSCE English</span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>
  
  <xsl:template match="GSCE_math">
    <div class="{name()}">
      <span class="uneditable">GSCE Math</span>
      <span class="editable">
        <xsl:apply-templates select="text()"/>
      </span>
    </div>
  </xsl:template>
  
  <!--<xsl:template match="PLTS">
    <div class="{name()}">
      <div class="uneditable">Personal, learning and thinking skills</div>
      <span class="editable">
        <xsl:apply-templates select="initials"/>
      </span>
    </div>
  </xsl:template>
  
  
  <xsl:template match="initials">
    <div class="{name()}">
      <span class="uneditable">PLTS Initial:</span>
      <span class="editable">
        <xsl:apply-templates select="initials/text()"/>
      </span>
    </div>
  </xsl:template>-->


  <xsl:template match="level_1_criterion | pass_criterion | merit_criterion | distinction_criterion">
    <div class="{name()}">
      <div class="wrap">
        <xsl:call-template name="blurb_CamelCase">
          <xsl:with-param name="value" select="name()"/>
        </xsl:call-template>
        <!--  <xsl:apply-templates select="value"/>-->
      </div>
      <xsl:apply-templates select="criterion_id"/>
      <xsl:apply-templates select="criterion"/>
      <xsl:apply-templates select="GSCE_english"/>
      <xsl:apply-templates select="GSCE_math"/>
      <h4 class="uneditable">Assessment criterion guidance: </h4>
      <xsl:apply-templates select="criterion_guidance"/>
    </div>
  </xsl:template>


  <xsl:template match="subtitle">
    <h3 class="editable">
      <xsl:apply-templates select="text()"/>
    </h3>
  </xsl:template>





</xsl:stylesheet>
