<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output name="html"/>
<xsl:template match="/">
<html>
  <head>
    <title>Brukere</title>
  </head>

  <body>

    <table style="border: solid 1px black;width:600px">
    <thead>
    <tr style="background-color:black;color:white">
      <th>Fornavn</th>
      <th>Etternavn</th>
    </tr>
    </thead>

    <tbody>
     <xsl:apply-templates select="brukere/bruker" />
    </tbody>
  
   </table>
  </body>
</html>

</xsl:template>

  <xsl:template match="bruker">
<tr>
<td>
  <xsl:value-of select="@fornavn"/>
</td>
<td>
  <xsl:value-of select="@etternavn"/>
</td>
</tr>
</xsl:template>
</xsl:stylesheet>