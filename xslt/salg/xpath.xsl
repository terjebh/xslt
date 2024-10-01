<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/" >
    <selgere>
    <xsl:for-each select="personer/person[@kjønn='K']">
       <navn> <xsl:value-of select="concat(fornavn,' ',etternavn)"/> </navn>
    </xsl:for-each>
    </selgere>    
    </xsl:template>
    
    
    
</xsl:stylesheet>