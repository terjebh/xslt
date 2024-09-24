<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Biler</title>
</head>
<body>


<h2>Biler totalt: <xsl:value-of select="count(biler/merke/bil)" /></h2>

<p />
<xsl:for-each select="biler/merke">
<h3>Fabrikant: <xsl:value-of select="@fabrikant" /></h3> 
<table border="1">
<th style="background:black;color:white">Biler: <xsl:value-of select="count(bil)" /></th>
   <p />
<xsl:for-each select="bil">

<tr><td>
    <xsl:number format="a"></xsl:number><xsl:text> </xsl:text> 
    <xsl:value-of select="." />
    </td>
</tr>

</xsl:for-each>
</table>
</xsl:for-each>


</body>
</html>


</xsl:template>
</xsl:stylesheet>