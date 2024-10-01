<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="personer"/>
	</xsl:template>
	<xsl:template match="personer">
		<navneliste>
			
			<xsl:for-each select="person">
				<xsl:for-each select="@*">
				<xsl:copy/>
				</xsl:for-each>
				
			</xsl:for-each>
		</navneliste>
	</xsl:template>
</xsl:stylesheet>