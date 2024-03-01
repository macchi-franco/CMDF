<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="text"/>
    <!--<xsl:variable name="documents" select="collection('../notices/?select=tei_*.xml;recurse=yes')"/>-->
    <!--C:\Users\stutzmann\Dropbox\Faller-stage\CMDF\xsl-->
    <!--    C:\Users\stutzmann\Github\CMDF -->
    <xsl:variable name="documents" select="collection('../../../../Github/CMDF/?select=*.xml;recurse=yes')"/>
    
    
    <xsl:template match="/">
        <xsl:text>notice&#09;settlement&#09;repository&#09;idno&#09;</xsl:text>
        <xsl:text>summary&#09;@material&#09;material&#09;support/watermark&#09;</xsl:text>
        <xsl:text>measure[@type='composition']/@quantity&#09;measure[@type='composition']&#09;height/@quantity&#09;height&#09;width/@quantity&#09;width&#09;justification/height/@quantity&#09;justification/height&#09;justification/width/@quantity&#09;justification/width&#09;</xsl:text>
        <xsl:text>collation/formula&#09;collation/desc&#09;collation/watermark&#09;signatures&#09;catchwords&#09;</xsl:text>
        <xsl:text>layout/@columns&#09;layout/@writtenLines&#09;layout/desc[@ruling]&#09;</xsl:text>
        <xsl:text>handDesc&#09;scriptDesc</xsl:text>
        <xsl:text>count(decoNote)&#09;count(decoNote/@rend)&#09;decoDesc&#09;bindingDesc&#09;</xsl:text>
        <xsl:text>origDate/@notBefore&#09;origDate/@notAfter&#09;origDate/@when&#09;origDate&#09;</xsl:text>
        <xsl:text>count(history/provenance)&#09;orgName&#09;persName&#09;</xsl:text>
        <xsl:text>&#x0A;</xsl:text>
<!--        
            <xsl:value-of select="document('https://gestion-projets.irht.cnrs.fr/svn/st-omer/sources/catalogues/notices/biblio-saint-omer.xml')//biblStruct"/>      -->
<!--        <xsl:value-of select="document('https://raw.githubusercontent.com/oriflamms/Fontenay/master/Fontenay.xml')//note"/>-->
        
<!--        
        
        ${xpath_eval(document(https://gestion-projets.irht.cnrs.fr/svn/st-omer/sources/catalogues/notices/biblio-saint-omer.xml)//biblStruct[contains(., "${xpath_eval(./@sameAs)}")][1]/concat("#", @xml:id))}
        -->
            <xsl:for-each select="$documents">
                <xsl:variable name="notice" select="tokenize(base-uri(), '/')[last()]"/>
                <xsl:for-each select=".//TEI/teiHeader/fileDesc/sourceDesc/listWit/witness/msDesc">
                    <xsl:value-of select="./position()"/>
                    <xsl:value-of select="$notice"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="msIdentifier/settlement"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="msIdentifier/repository"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="msIdentier/idno"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="msContents/summary/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    
                    <!-- support -->
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/@material"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/support/material/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/support/material//watermark/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/string-join(measure[@type='composition']/@quantity, '|')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/measure[@type='composition']/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='leaf']/height/@quantity"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='leaf']/height/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='leaf']/width/@quantity"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='leaf']/width/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='justification']/height/@quantity"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='justification']/height/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='justification']/width/@quantity"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/extent/dimensions[@type='justification']/width/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/collation/formula/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/collation/desc/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/collation/watermark/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/collation/signatures/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/supportDesc/collation/catchwords/replace(normalize-space(.), ';', ',')"/><xsl:text>&#09;</xsl:text>
                    
                    <!-- layout -->
                    <xsl:value-of select="physDesc/objectDesc/layoutDesc/layout/@columns"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/layoutDesc/layout/@writtenLines"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/layoutDesc/layout/desc[@ruling]"/><xsl:text>&#09;</xsl:text>
                    <!-- handDesc -->
                    <xsl:value-of select="physDesc/objectDesc/handDesc/normalize-space(string-join(replace(handNote, ';', ','), '|'))"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/scriptDesc/normalize-space(string-join(replace(scriptNote, ';', ','), '|'))"/><xsl:text>&#09;</xsl:text>
                    <!-- decoDesc -->
                    <xsl:value-of select="physDesc/objectDesc/decoDesc/count(decoNote)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/decoDesc/count(decoNote/@rend)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="physDesc/objectDesc/decoDesc/normalize-space(string-join(replace(decoNote, ';', ','), '|'))"/><xsl:text>&#09;</xsl:text>
                    <!-- bindingDesc -->
                    <xsl:value-of select="physDesc/objectDesc/bindingDesc"/><xsl:text>&#09;</xsl:text>
                    
                    <!-- history -->
                    <xsl:value-of select="history/origin/origDate/@notBefore"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="history/origin/origDate/@notAfter"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="history/origin/origDate/@when"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="history/origin/origDate/normalize-space(.)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(history/provenance)"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="history/provenance/string-join(orgName/normalize-space(replace(., ';', ',')), '|')"/><xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="history/provenance/string-join(persName/normalize-space(replace(., ';', ',')), '|')"/><xsl:text>&#09;</xsl:text>
                    <xsl:text>&#x0A;</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:template>
        


</xsl:stylesheet>
