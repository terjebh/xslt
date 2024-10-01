<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:output method="xml" indent="yes"/>
	<xsl:variable name="ukedager" select="document('ukedager.xml')"/>
	<xsl:template match="/">
		<personer>
		<xsl:apply-templates select="/personer/person">
		<xsl:sort data-type="text"  lang="nb-NO" select="concat(fornavn,' ',etternavn)"></xsl:sort>
		</xsl:apply-templates>
		
		</personer>
	</xsl:template>
	<xsl:template match="/personer/person">
		
		<person>
		<navn><xsl:value-of select="concat(fornavn,' ',etternavn)"/></navn>
		<xsl:variable name="ukedagTall" select="dag"></xsl:variable>
		<xsl:variable name="ukedag" select="$ukedager/ukedager/ukedag[@indeks=$ukedagTall]"/>
		<xsl:copy-of select="dag"></xsl:copy-of>
		<ukedag><xsl:value-of select="dag"/></ukedag>
		<ukedagNavn><xsl:value-of select="$ukedag" /></ukedagNavn>
		</person>
	</xsl:template>
</xsl:stylesheet>