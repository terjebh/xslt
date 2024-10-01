<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/" mode="#all">
        <salg>
            <oppsummering>
                <totalsalg><xsl:value-of select="sum(//salg)"/></totalsalg>
                <salgMenn><xsl:value-of select="sum(/personer/person[@kjønn='M']/salg)"/></salgMenn>
                <salgKvinner><xsl:value-of select="sum(/personer/person[@kjønn='K']/salg)"/></salgKvinner>
            </oppsummering>
            
            <xsl:apply-templates select="/personer/person">
                <xsl:sort select="sum(salg)" data-type="number" order="descending"/>
            </xsl:apply-templates>
            
        </salg>
    </xsl:template>
    
    <xsl:template match="/personer/person">
        
        <selger>
            <fornavn><xsl:value-of select="fornavn" /></fornavn>
            <etternavn><xsl:value-of select="etternavn" /></etternavn>
            <salg> <xsl:value-of select="sum(salg)" /> </salg>
        </selger>
        
    </xsl:template>
    
    
</xsl:stylesheet>