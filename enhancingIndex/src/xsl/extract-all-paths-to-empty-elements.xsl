<?xml version="1.0" encoding="UTF-8"?>

<!-- give lists of paths: 
    https://stackoverflow.com/questions/953197
    /how-do-you-output-the-current-element-path-in-xslt-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"    >

    <xsl:output indent="yes" method="text"></xsl:output>
    <xsl:strip-space elements="*"/>
    
  <!-- FOR A COLLECTION  
      
      <xsl:template match="/">
        <xsl:for-each select="collection('./?select=*.xml;recurse=yes')">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>-->
    
    <xsl:template match="/">
        <xsl:variable name="all-paths">
            <xsl:apply-templates select="." mode="extract-paths"></xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="all-paths-and-occurrences">
        <xsl:for-each select="$all-paths//tei:p">
            <xsl:variable name="path" select="."/>
                <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:value-of select="."/>;<xsl:value-of select="count($all-paths//tei:p[.= $path])"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:variable>
         <xsl:for-each-group select="$all-paths-and-occurrences//tei:p" group-by="." >
            <xsl:sort select="."></xsl:sort>
            <xsl:value-of select="."/><xsl:text>
</xsl:text>
        </xsl:for-each-group>
        </xsl:template>
    <xsl:template match="//*[not(node())]" mode="extract-paths">
        <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:for-each select="ancestor-or-self::*">
            <xsl:value-of select="concat('/',local-name())"/>
        </xsl:for-each>
        </xsl:element>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    
    
</xsl:stylesheet>