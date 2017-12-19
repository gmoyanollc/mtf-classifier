<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:fn="http://metadata.ces.mil/dse/ns/usmc/mc2sa/tsoa/mtf/ensit/0.1/function"
   exclude-result-prefixes="xs xd saxon fn" version="3.0">

   <xsl:param name="paramDocumentUri6040"/>
   <xsl:param name="paramTransformUriBase"/>
   
   <xsl:import href="mtfClassFunction.xsl"/>

   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Sep 17, 2015</xd:p>
         <xd:p><xd:b>Author:</xd:b> g</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>
   <xsl:output indent="yes" method="xml"/>

<!--   <xsl:variable name="varMtfClassGraphUri"
      select="resolve-uri('../../transform/classifyUsmtf/mtfClassGraph.xml')"/>-->
   <xsl:variable name="varMtfClassGraphUri"
      select="concat($paramTransformUriBase, '/mtfClassGraph.xml')"/>

   <!-- Base XML Schema file is 'message.xsd' as published by USMTF Mil-Std-6040. -->

<!--   <xsl:variable name="nsIsm">urn:us:gov:ic:ism:v2</xsl:variable>
   <xsl:variable name="nsMtfStructure">urn:mtf:mil:6040b:ensit:B.1.01.12:structure</xsl:variable>
   <xsl:variable name="nsMtfText">urn:mtf:mil:6040b:ensit:B.1.01.12:text</xsl:variable>
-->
   <xsl:variable name="varNamespace">
      <!-- first item shall be the local and target namespace -->
      <!-- prefix shall have dependencies, therefore shall not change -->
      <!-- namespace shall not have dependencies, therefore may change -->
      <Namespace prefix="mtfstructure" schemaLocation="mtfStructure.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:structure</Namespace><!-- 1 -->
      <Namespace prefix="mtfactivity" schemaLocation="mtfActivity.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:activity</Namespace><!-- 2 -->
      <Namespace prefix="mtfentity" schemaLocation="mtfEntity.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:entity</Namespace><!-- 3 -->
      <Namespace prefix="mtfidentifier" schemaLocation="mtfIdentifier.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:identifier</Namespace><!-- 4 -->
      <Namespace prefix="mtfintel" schemaLocation="mtfIntel.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:intel</Namespace><!-- 5 -->
      <Namespace prefix="mtflocation" schemaLocation="mtfLocation.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:location</Namespace><!-- 6 -->
      <Namespace prefix="mtftext" schemaLocation="mtfText.xsd"
         >urn:mtf:mil:6040b:ensit:B.1.01.12:text</Namespace><!-- 7 -->
      <Namespace prefix="ism" schemaLocation="IC-ISM-v2.xsd"
         >urn:us:gov:ic:ism:v2</Namespace>
   </xsl:variable>
   
   <xsl:variable name="varDocumentUri6040Messages">
      <xsl:value-of select="resolve-uri(concat($paramDocumentUri6040, '/messages.xsd'), base-uri(.))"/>
   </xsl:variable>
   
   <xsl:variable name="varDocumentUri6040Sets">
      <xsl:value-of select="resolve-uri(concat($paramDocumentUri6040, '/sets.xsd'), base-uri(.))"/>
   </xsl:variable>
   
   <xsl:variable name="varDocumentUri6040Fields">
      <xsl:value-of select="resolve-uri(concat($paramDocumentUri6040, '/fields.xsd'), base-uri(.))"/>
   </xsl:variable>
   
   <xsl:variable name="varDocumentUri6040Composites">
      <xsl:value-of select="resolve-uri(concat($paramDocumentUri6040, '/composites.xsd'), base-uri(.))"/>
   </xsl:variable>
   
   <xsl:template match="node() | @*">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="*:schema">
      <xsl:copy copy-namespaces="no">
         <!--<xsl:namespace name="" select="$nsMtfStructure"/>
         <xsl:namespace name="mtfstructure" select="$nsMtfStructure"/>
         <xsl:namespace name="mtftext" select="$nsMtfText"/>
         <xsl:namespace name="ism" select="$nsIsm"/>-->
         <xsl:namespace name="" select="$varNamespace/Namespace[1]"/>
         <xsl:namespace name="{$varNamespace/Namespace[1]/@prefix}"
            select="$varNamespace/Namespace[1]"/>
         <!--<xsl:namespace name="{$varNamespace/Namespace[2]/@prefix}"
            select="$varNamespace/Namespace[2]"/>
         <xsl:namespace name="{$varNamespace/Namespace[3]/@prefix}"
            select="$varNamespace/Namespace[3]"/>-->
         <xsl:namespace name="{$varNamespace/Namespace[4]/@prefix}"
            select="$varNamespace/Namespace[4]"/>
         <!--<xsl:namespace name="{$varNamespace/Namespace[5]/@prefix}"
            select="$varNamespace/Namespace[5]"/>-->
         <!--<xsl:namespace name="{$varNamespace/Namespace[6]/@prefix}"
            select="$varNamespace/Namespace[6]"/>-->
         <xsl:namespace name="{$varNamespace/Namespace[7]/@prefix}"
            select="$varNamespace/Namespace[7]"/>
         <xsl:namespace name="{$varNamespace/Namespace[8]/@prefix}"
            select="$varNamespace/Namespace[8]"/>
         <xsl:copy-of select="./@* except @targetNamespace"/>
         <!--<xsl:attribute name="targetNamespace" select="$nsMtfStructure"/>-->
         <xsl:attribute name="targetNamespace" select="$varNamespace/Namespace[1]"/>
         
<!--         <xs:import namespace="urn:us:gov:ic:ism:v2" schemaLocation="IC-ISM-v2.xsd"/>
         <xs:import namespace="urn:mtf:mil:6040b:ensit:B.1.01.12:text" schemaLocation="mtfText.xsd"/>
-->
         <xsl:text>&#xA;</xsl:text><!-- linefeed -->
         <xsl:comment>&#x20;&#x20;required for xml namespace attributes such as xml:space&#x20;&#x20;</xsl:comment>
         <xsl:text>&#xA;</xsl:text>
         <xs:import namespace="http://www.w3.org/XML/1998/namespace"
            schemaLocation="http://www.w3.org/2001/03/xml.xsd"/>
         <!--<xs:import namespace="{$varNamespace/Namespace[2]}"
            schemaLocation="{$varNamespace/Namespace[2]/@schemaLocation}"/>
         <xs:import namespace="{$varNamespace/Namespace[3]}"
            schemaLocation="{$varNamespace/Namespace[3]/@schemaLocation}"/>-->
         <xs:import namespace="{$varNamespace/Namespace[4]}"
            schemaLocation="{$varNamespace/Namespace[4]/@schemaLocation}"/>
         <!--<xs:import namespace="{$varNamespace/Namespace[5]}"
            schemaLocation="{$varNamespace/Namespace[5]/@schemaLocation}"/>-->
         <!--<xs:import namespace="{$varNamespace/Namespace[6]}"
            schemaLocation="{$varNamespace/Namespace[6]/@schemaLocation}"/>-->
         <xs:import namespace="{$varNamespace/Namespace[7]}"
            schemaLocation="{$varNamespace/Namespace[7]/@schemaLocation}"/>
         <xs:import namespace="{$varNamespace/Namespace[8]}"
            schemaLocation="{$varNamespace/Namespace[8]/@schemaLocation}"/>
         
         <xsl:apply-templates select="./*:annotation"/>
         <xsl:apply-templates select="//*:attribute"/>
         <!--<xsl:apply-templates select="//*:schema" mode="groupElement"/>
            <xsl:apply-templates select="//*:schema" mode="groupComplexType"/>-->
         <!-- USMTF message structure attributes and simple type only -->
<!--         <xsl:apply-templates select="document(resolve-uri('./sets.xsd', base-uri(.)))/*:schema"
            mode="groupAttribute"/>
         <xsl:apply-templates select="document(resolve-uri('./sets.xsd', base-uri(.)))//*:schema"
            mode="groupElement"/>
         <xsl:apply-templates select="document(resolve-uri('./sets.xsd', base-uri(.)))//*:schema"
            mode="groupComplexType"/>
         <xsl:apply-templates select="document(resolve-uri('./fields.xsd', base-uri(.)))//*:schema" 
            mode="groupSimpleType"/>
         <xsl:apply-templates
            select="document(resolve-uri('./fields.xsd', base-uri(.)))//*:schema"
            mode="groupComplexType"/>-->
         <!--<xsl:apply-templates
            select="document(resolve-uri('./composites.xsd', base-uri(.)))//*:schema"
            mode="groupSimpleType"/>
         <xsl:apply-templates
            select="document(resolve-uri('./composites.xsd', base-uri(.)))//*:schema"
            mode="groupComplexType"/>-->
         <xsl:apply-templates select="document($varDocumentUri6040Sets)//*:schema"
            mode="groupAttribute"/>
         <xsl:apply-templates select="document($varDocumentUri6040Sets)//*:schema"
            mode="groupElement"/>
         <xsl:apply-templates select="document($varDocumentUri6040Sets)//*:schema"
            mode="groupComplexType"/>
         <xsl:apply-templates
            select="document($varDocumentUri6040Fields)//*:schema"
            mode="groupSimpleType"/>
         <xsl:apply-templates
            select="document($varDocumentUri6040Fields)//*:schema"
            mode="groupComplexType"/>
         <!--<xsl:apply-templates
            select="document($varDocumentUri6040Composites)//*:schema"
            mode="groupSimpleType"/>
         <xsl:apply-templates
            select="document($varDocumentUri6040Composites)//*:schema"
            mode="groupComplexType"/>-->
      </xsl:copy>
   </xsl:template>

   <!-- USMTF message structure attributes -->
   <xsl:template match="*:schema" mode="groupAttribute">
      <xsl:for-each-group select="//*:attribute" group-by="@name">
         <xsl:sort select="current-grouping-key()"/>
         <xsl:for-each-group select="current-group()" group-by="@fixed">
            <xsl:sort select="current-grouping-key()"/>
            <xsl:apply-templates select=".[1]"/>
         </xsl:for-each-group>
      </xsl:for-each-group>
   </xsl:template>
   
   <xsl:template match="*:schema" mode="groupElement">
      <xsl:for-each-group
         select="saxon:evaluate(fn:getNodeCriteriaSelect('element', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))"
         group-by="@name">
         <xsl:sort select="current-grouping-key()"/>
         <!-- select one item from each group -->
         <xsl:apply-templates select=".[1]"/>
      </xsl:for-each-group>
   </xsl:template>
   
   <xsl:template match="*:schema" mode="groupComplexType">
      <!--  select distinct components that match namespace prefix criterion values  -->
      <!--<xsl:for-each-group 
         select="//*:complexType[contains(@name, 'BaseType')]"
         group-by="@name">-->
      <xsl:for-each-group
         select="saxon:evaluate(fn:getNodeCriteriaSelect('complexType', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))"
         group-by="@name">
         <xsl:sort select="current-grouping-key()"/>
         <!-- select one item from each group -->
         <xsl:apply-templates select=".[1]"/>
      </xsl:for-each-group>
   </xsl:template>
   
   <xsl:template match="*:schema" mode="groupSimpleType">
      <!--<xsl:for-each-group 
         select="//*:simpleType[contains(@name, 'Date') or contains(@name, 'Security') or contains(@name, 'Suffix') or contains(@name, 'Time')]"
         group-by="@name">-->
      <!--  select distinct components that match namespace prefix criterion values  -->
      <xsl:for-each-group
         select="saxon:evaluate(fn:getNodeCriteriaSelect('simpleType', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))"
         group-by="@name">
         <xsl:sort select="current-grouping-key()"/>
         <!-- select one item from each group -->
         <xsl:apply-templates select=".[1]"/>
      </xsl:for-each-group>
   </xsl:template>

   <xsl:template match="*:annotation">
      <xsl:copy-of select="." copy-namespaces="no"/>
   </xsl:template>

   <xsl:template
      match="*:attribute[@name = 'mtfid' or @name = 'segSeq' or @name = 'setid' or @name = 'setSeq' or @name = 'ffirnFudn' or @name = 'ffseq' or @name = 'ffSeq']">
      <xsl:copy copy-namespaces="no">
         <xsl:copy-of select="@* except @name"/>
         <xsl:attribute name="name" select="concat(@name, @fixed)"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="*:element">
      <xsl:copy copy-namespaces="no">
         <xsl:choose>
            <xsl:when test="matches(@type, ':')">
               <xsl:copy-of select="./@* except (@type, @minOccurs, @maxOccurs)"/>
               <!-- add appropriate prefix -->
               <xsl:choose>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[1]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[2]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[2]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[3]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[3]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[4]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[4]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[5]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[5]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[6]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[6]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:when
                     test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[7]/@prefix, $varMtfClassGraphUri))">
                     <xsl:attribute name="type"
                        select="concat($varNamespace/Namespace[7]/@prefix, ':', tokenize(@type, ':')[last()])"
                     />
                  </xsl:when>
                  <xsl:otherwise>
                     <!-- remove prefix -->
                     <xsl:attribute name="type" select="tokenize(@type, ':')[last()]"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy-of select="./@* except (@minOccurs, @maxOccurs)"/>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="*:extension">
      <xsl:copy copy-namespaces="no">
         <xsl:copy-of select="./@* except @base"/>
         <!-- add appropriate prefix -->
         <xsl:choose>
<!--            <xsl:when test="contains(@base, 'Amplification') or contains(@base, 'Narrative') or contains(@base, 'Text')">
               <xsl:variable name="tokenNs" select="tokenize($nsMtfText, ':')"/>
               <xsl:attribute name="base" select="concat($tokenNs[2], $tokenNs[last()], ':', tokenize(@base, ':')[last()])"/>
            </xsl:when>
            <xsl:when test="contains(@base, 'BaseType')">
               <xsl:variable name="tokenNs" select="tokenize($nsMtfStructure, ':')"/>
               <xsl:attribute name="base" select="concat($tokenNs[2], $tokenNs[last()], ':', tokenize(@base, ':')[last()])"/>
            </xsl:when>-->
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[1]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[2]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[2]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[3]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[3]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[4]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[4]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[5]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[5]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[6]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[6]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:when
               test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[7]/@prefix, $varMtfClassGraphUri))">
               <xsl:attribute name="base"
                  select="concat($varNamespace/Namespace[7]/@prefix, ':', tokenize(@base, ':')[last()])"
               />
            </xsl:when>
            <xsl:otherwise>
               <!-- remove prefix -->
               <xsl:attribute name="base" select="tokenize(@base, ':')[last()]"/>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
