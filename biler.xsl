<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />
<xsl:template match="/">
Biler totalt: <xsl:value-of select="count(biler/merke/bil)" />
<xsl:text></xsl:text>
<xsl:for-each select="biler/merke">
Fabrikant: <xsl:value-of select="@fabrikant" /> 
Biler: <xsl:value-of select="count(bil)" />
    <xsl:text>
    </xsl:text>
<xsl:for-each select="bil">
    <xsl:number format="a"></xsl:number><xsl:text> </xsl:text> 
    <xsl:value-of select="." />
    <xsl:text>
    </xsl:text>
</xsl:for-each>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>