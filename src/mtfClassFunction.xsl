<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:fn="http://metadata.ces.mil/dse/ns/usmc/mc2sa/tsoa/mtf/ensit/0.1/function"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 15, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> g</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:function name="fn:getGlobalizationSelect">
        <!-- sample incoming values: "attribute", "complexType", "element", "extension", "simpleType" -->
        <!-- deprecated by function getSelect -->
        <xsl:param name="paramSchemaComponent"/>
        <xsl:param name="paramCriterion"/>
        
        <xsl:sequence select="concat('//*:', $paramSchemaComponent, '[contains(@name, &quot;', string-join((for $i in 1 to count($paramCriterion/*) return $paramCriterion/Criterion[$i]), '&quot;) or contains(@name, &quot;'), '&quot;)]')"/>
    </xsl:function>
    
    <xsl:function name="fn:getNodeCriteriaSelect">
        
        <!-- sample incoming values: "attribute", "complexType", "element", "extension", "simpleType" -->
        <!-- supercedes varCriterion declaration in globalization stylesheet -->
        <xsl:param name="paramSchemaComponent"/>
        <xsl:param name="paramNsPrefix"/>
        <xsl:param name="paramMtfClassGraphUri"/>
        <!-- build select string from criterion values assigned to a namespace prefix -->
        <xsl:variable name="varCriterionSelect" select="concat('document(&quot;', $paramMtfClassGraphUri, '&quot;)/Class/', $paramNsPrefix, '/*')"/>
        <!-- build return select string containing criterion values -->
        <xsl:value-of select="         
                concat('//*:', $paramSchemaComponent, '[contains(@name, &quot;'
                    , string-join(
                    (for $i in 1 to count(saxon:evaluate($varCriterionSelect)) 
                    return saxon:evaluate($varCriterionSelect)[$i])
                    , '&quot;) or contains(@name, &quot;')
                    , '&quot;)]')"/>
        
    </xsl:function>
    
    <xsl:function name="fn:getAttributeCriteriaTest">
        <!-- sample incoming values: "base", "type" -->
        <!-- supercedes hard-coding critiera in globalization stylesheet instructions -->
        <xsl:param name="paramAttributeName"/>
        <xsl:param name="paramNsPrefix"/>
        <xsl:param name="paramMtfClassGraphUri"/>
        <!-- build test string from criterion values assigned to a namespace prefix -->
        <xsl:variable name="varCriterionSelect" select="concat('document(&quot;', $paramMtfClassGraphUri, '&quot;)/Class/', $paramNsPrefix, '/*')"/>
        <xsl:value-of select="concat('contains(@', $paramAttributeName, ', &quot;'
            , string-join(
            (for $i in 1 to count(saxon:evaluate($varCriterionSelect)) 
                return saxon:evaluate($varCriterionSelect)[$i])
                , concat('&quot;) or contains(@', $paramAttributeName, ', &quot;'))
            , '&quot;)')"/>
    </xsl:function>
    
</xsl:stylesheet>