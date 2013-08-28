<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:m="http://www.muir.com" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../access_and_recruitment/xsl/stylesheet.xsl"/>
    <xsl:import href="../../annex/xsl/stylesheet.xsl"/>
    <xsl:import href="../../awarding_and_reporting_for_the_qualification/xsl/stylesheet.xsl"/>
    <xsl:import href="../../cover/xsl/stylesheet.xsl"/>
    <xsl:import href="../../edexcel_BTEC_Level_1_Level_2_First/xsl/stylesheet.xsl"/>
    <xsl:import href="../../external_assessment/xsl/stylesheet.xsl"/>
    <xsl:import href="../../further_information_and_useful_publications/xsl/stylesheet.xsl"/>
    <xsl:import href="../../internal_assessment/xsl/stylesheet.xsl"/>
    <xsl:import href="../../introduction/xsl/stylesheet.xsl"/>
    <xsl:import href="../../professional_development_support/xsl/stylesheet.xsl"/>
    <xsl:import href="../../programme_delivery/xsl/stylesheet.xsl"/>
    <xsl:import href="../../qualification_structure/xsl/stylesheet.xsl"/>
    <xsl:import href="../../quality_assurance_of_centres/xsl/stylesheet.xsl"/>
    <xsl:import href="../../unit/xsl/stylesheet.xsl"/>
    <xsl:import href="../../units_specification_layout/xsl/stylesheet.xsl"/>
    <xsl:import href="../../welcome_to_your_BTEC_First/xsl/stylesheet.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>
                    WYSIWYM Specification Full View
                </title>
                <link rel="stylesheet" type="text/css" href="../../access_and_recruitment/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../annex/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../awarding_and_reporting_for_the_qualification/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../cover/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../edexcel_BTEC_Level_1_Level_2_First/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../external_assessment/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../further_information_and_useful_publications/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../internal_assessment/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../introduction/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../professional_development_support/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../programme_delivery/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../qualification_structure/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../quality_assurance_of_centres/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../unit/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../units_specification_layout/css/wysiwym.css"/>
                <link rel="stylesheet" type="text/css" href="../../welcome_to_your_BTEC_First/css/wysiwym.css"/>
            </head>
            <body>

                <xsl:for-each select="collection('../xml/collection.xml')">
                    <xsl:apply-templates mode="noshortcuts"/>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>
    
    <xsl:template priority="1" match="text()">
        <xsl:value-of select="m:charToEntity(.)"/>
    </xsl:template>
    
    <xsl:function as="xs:string" name="m:charToEntity">
       
        <xsl:param as="xs:string?" name="arg"/>
        
        <xsl:sequence
            select="
            replace(replace(replace(replace(replace(replace(replace(replace(
            replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
            replace(replace(replace(replace(replace(replace(replace(replace(replace(
            replace(replace(replace(replace(replace(replace(replace(replace(replace(
            replace(replace(replace(replace(replace(replace(replace(replace(replace(
            replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
            $arg,'’','&#146;'),'“','&#147;'),'”','&#148;'),'®','&#174;'),'™','&#153;')
            ,'—','&#151;'),'·','&#183;'),'','&#59450;'),'–','&#150;'),'é','&#233;')
            ,'¾','&#190;'),'þ','#254;'),'o','&#111;'),'•','&#149;'),'â','&#226;')
            ,'ü','&#252;'),'Ü','&#220;'),'€','&#128;'),'†','&#134;'),'x','&#120;')
            ,'¨','&#168;'),'§','&#167;'),'—','&#8211;'),'ã','&#227;'),'━','&#8212;')
            ,'ă','&#259;'),'©','&#169;'),'í','&#237;'),'è','&#232;'),'ç','&#231;')
            ,'á','&#225;'),'‘','&#145;'),'ý','&#253;'),'‡','&#135;'),'£','&#163;')
            ,'⅞','&#8542;'),'¼','&#188;'),'½','&#189;'),'¾','&#190;'),'´','&#180;')
            ,'ú','&#250;'),'ñ','&#241;'),'ð','&#240;'),'ø','&#248;'),'ó','&#243;')
            ,'ê','&#234;'),'à','&#224;'),'‚','&#130;'),'ƒ','&#131;'),'„','&#132;')
            ,'…','&#133;'),'ˆ','&#136;'),'‰','&#137;'),'Š','&#138;'),'‹','&#139;')
            ,'Œ','&#140;'),'Ž','&#142;'),'˜','&#152;'),'š','&#154;')
            ,'›','&#155;'),'œ','&#156;'),'ž','&#158;'),'Ÿ','&#159;')"/>
    </xsl:function>
    
</xsl:stylesheet>
