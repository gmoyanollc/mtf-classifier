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

    <!--<xsl:variable name="varMtfClassGraphUri"
        select="resolve-uri('../../transform/classifyUsmtf/mtfClassGraph.xml')"/>-->
    <xsl:variable name="varMtfClassGraphUri"
        select="concat($paramTransformUriBase, '/mtfClassGraph.xml')"/>

    <!-- Base XML Schema file is 'messages.xsd' as published by USMTF Mil-Std-6040. -->

    <xsl:variable name="varNamespace">
        <!-- first item shall be the local and target namespace -->
        <!-- prefix shall have dependencies, therefore shall not change -->
        <!-- namespace shall not have dependencies, therefore may change -->
        <Namespace prefix="mtfentity" schemaLocation="mtfEntity.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:entity</Namespace><!-- 1 -->
        <Namespace prefix="mtfactivity" schemaLocation="mtfActivity.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:activity</Namespace><!-- 2 -->
        <Namespace prefix="mtfidentifier" schemaLocation="mtfIdentifier.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:identifier</Namespace><!-- 3 -->
        <Namespace prefix="mtfintel" schemaLocation="mtfIntel.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:intel</Namespace><!-- 4 -->
        <Namespace prefix="mtflocation" schemaLocation="mtfLocation.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:location</Namespace><!-- 5 -->
        <Namespace prefix="mtfmeasure" schemaLocation="mtfMeasure.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:measure</Namespace><!-- 6 -->
        <Namespace prefix="mtfstructure" schemaLocation="mtfStructure.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:structure</Namespace><!-- 7 -->
        <Namespace prefix="mtftext" schemaLocation="mtfText.xsd"
            >urn:mtf:mil:6040b:ensit:B.1.01.12:text</Namespace><!-- 8 -->
        <Namespace prefix="ism" schemaLocation="IC-ISM-v2.xsd"
            >urn:us:gov:ic:ism:v2</Namespace><!-- 9 -->
    </xsl:variable>

    <!--<xsl:variable name="varDocumentUri6040Messages">
        <xsl:value-of select="base-uri(.)"/>
    </xsl:variable>
    
    <xsl:variable name="varDocumentUri6040Sets">
        <xsl:value-of select="resolve-uri('./sets.xsd', base-uri(.))"/>
    </xsl:variable>
    
    <xsl:variable name="varDocumentUri6040Fields">
        <xsl:value-of select="resolve-uri('./fields.xsd', base-uri(.))"/>
    </xsl:variable>
    
    <xsl:variable name="varDocumentUri6040Composites">
        <xsl:value-of select="resolve-uri('./composites.xsd', base-uri(.))"/>
    </xsl:variable>-->
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
            <xsl:namespace name="" select="$varNamespace/Namespace[1]"/>
            <xsl:namespace name="{$varNamespace/Namespace[1]/@prefix}"
                select="$varNamespace/Namespace[1]"/>
            <xsl:namespace name="{$varNamespace/Namespace[2]/@prefix}"
                select="$varNamespace/Namespace[2]"/>
            <xsl:namespace name="{$varNamespace/Namespace[3]/@prefix}"
                select="$varNamespace/Namespace[3]"/>
            <xsl:namespace name="{$varNamespace/Namespace[4]/@prefix}"
                select="$varNamespace/Namespace[4]"/>
            <xsl:namespace name="{$varNamespace/Namespace[5]/@prefix}"
                select="$varNamespace/Namespace[5]"/>
            <xsl:namespace name="{$varNamespace/Namespace[6]/@prefix}"
                select="$varNamespace/Namespace[6]"/>
            <xsl:namespace name="{$varNamespace/Namespace[7]/@prefix}"
                select="$varNamespace/Namespace[7]"/>
            <xsl:namespace name="{$varNamespace/Namespace[8]/@prefix}"
                select="$varNamespace/Namespace[8]"/>
            <xsl:namespace name="{$varNamespace/Namespace[9]/@prefix}"
                select="$varNamespace/Namespace[9]"/>
            <xsl:copy-of select="./@* except @targetNamespace"/>
            <xsl:attribute name="targetNamespace" select="$varNamespace/Namespace[1]"/>

            <!--<xsl:text>&#xA;</xsl:text><!-\- linefeed -\->
            <xsl:comment>&#x20;&#x20;required for xml namespace attributes such as xml:space&#x20;&#x20;</xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xs:import namespace="http://www.w3.org/XML/1998/namespace"
                schemaLocation="http://www.w3.org/2001/03/xml.xsd"/>-->
            <xs:import namespace="{$varNamespace/Namespace[2]}"
                schemaLocation="{$varNamespace/Namespace[2]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[3]}"
                schemaLocation="{$varNamespace/Namespace[3]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[4]}"
                schemaLocation="{$varNamespace/Namespace[4]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[5]}"
                schemaLocation="{$varNamespace/Namespace[5]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[6]}"
                schemaLocation="{$varNamespace/Namespace[6]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[7]}"
                schemaLocation="{$varNamespace/Namespace[7]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[8]}"
                schemaLocation="{$varNamespace/Namespace[8]/@schemaLocation}"/>
            <xs:import namespace="{$varNamespace/Namespace[9]}"
                schemaLocation="{$varNamespace/Namespace[9]/@schemaLocation}"/>

            <xsl:apply-templates select="./*:annotation"/>
            <!--<xsl:apply-templates select="//*:schema" mode="groupElement"/>
            <xsl:apply-templates select="//*:schema" mode="groupComplexType"/>-->
            <!--<xsl:apply-templates select="document(resolve-uri('./sets.xsd', base-uri(.)))//*:schema"
                mode="groupElement"/>
            <xsl:apply-templates select="document(resolve-uri('./sets.xsd', base-uri(.)))//*:schema"
                mode="groupComplexType"/>
            <xsl:apply-templates
                select="document(resolve-uri('./fields.xsd', base-uri(.)))//*:schema"
                mode="groupSimpleType"/>
            <xsl:apply-templates
                select="document(resolve-uri('./fields.xsd', base-uri(.)))//*:schema"
                mode="groupComplexType"/>
            <xsl:apply-templates
                select="document(resolve-uri('./composites.xsd', base-uri(.)))//*:schema"
                mode="groupSimpleType"/>
            <xsl:apply-templates
                select="document(resolve-uri('./composites.xsd', base-uri(.)))//*:schema"
                mode="groupComplexType"/>-->
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
            <xsl:apply-templates
                select="document($varDocumentUri6040Composites)//*:schema"
                mode="groupSimpleType"/>
            <xsl:apply-templates
                select="document($varDocumentUri6040Composites)//*:schema"
                mode="groupComplexType"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*:schema" mode="groupElement">
        <!--  select distinct components that match namespace prefix criterion values  -->
        <xsl:for-each-group
            select="saxon:evaluate(fn:getNodeCriteriaSelect('element', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))"
            group-by="@name">
            <xsl:sort select="current-grouping-key()"/>
            <!-- select one item from each group -->
            <!--<xsl:apply-templates select=".[1]"/>-->
            <xsl:call-template name="globalElement"/>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="*:schema" mode="groupComplexType">
        <!--  select distinct components that match namespace prefix criterion values  -->
        <xsl:for-each-group
            select="saxon:evaluate(fn:getNodeCriteriaSelect('complexType', $varNamespace/Namespace[1]/@prefix, $varMtfClassGraphUri))"
            group-by="@name">
            <xsl:sort select="current-grouping-key()"/>
            <!-- select one item from each group -->
            <xsl:apply-templates select=".[1]"/>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="*:schema" mode="groupSimpleType">
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
                        <xsl:when
                            test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[8]/@prefix, $varMtfClassGraphUri))">
                            <xsl:attribute name="type"
                                select="concat($varNamespace/Namespace[8]/@prefix, ':', tokenize(@type, ':')[last()])"
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
  
    <xsl:template name="globalElement">
        <!-- global Element exception processing -->
        <!-- select one item from the group -->
        <xsl:copy copy-namespaces="no" select=".[1]">
            <xsl:choose>
                <xsl:when test="matches(@type, ':')">
                    <xsl:copy-of
                        select=".[1]/@* except (@type, @minOccurs, @maxOccurs)"/>
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
                        <xsl:when
                            test="saxon:evaluate(fn:getAttributeCriteriaTest('type', $varNamespace/Namespace[8]/@prefix, $varMtfClassGraphUri))">
                            <xsl:attribute name="type"
                                select="concat($varNamespace/Namespace[8]/@prefix, ':', tokenize(@type, ':')[last()])"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- remove prefix -->
                            <xsl:attribute name="type" select="tokenize(@type, ':')[last()]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of
                        select="./@* except (@minOccurs, @maxOccurs)"/>
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
                <xsl:when
                    test="saxon:evaluate(fn:getAttributeCriteriaTest('base', $varNamespace/Namespace[8]/@prefix, $varMtfClassGraphUri))">
                    <xsl:attribute name="base"
                        select="concat($varNamespace/Namespace[8]/@prefix, ':', tokenize(@base, ':')[last()])"
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
