<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>    
    
    
    <xsl:template match="/personer" >
        <xsl:text>Selgere</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>------------------------</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        
        <xsl:for-each select="person">
            <xsl:number format="1. "/>
            <xsl:value-of select="concat(fornavn,' ',etternavn)"/> 
            <xsl:text>&#xA;</xsl:text>    
        </xsl:for-each>
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>