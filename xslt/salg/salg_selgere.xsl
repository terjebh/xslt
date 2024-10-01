<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html"/>
	<xsl:param name="menn" select="'M'"/>
	<xsl:param name="kvinner" select="'K'"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Dette er personer</title>
				<link rel="stylesheet" href="stiler.css"/>
			</head>
			<body>
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'M'"/>
				</xsl:apply-templates>
				<p/>
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'K'"/>
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="personer">
		<xsl:param name="kjønn"/>
		
		<xsl:if test="$kjønn='M'">
			<h2>Menn</h2>
		</xsl:if>
		
		<xsl:if test="$kjønn='K'">
			<h2>Kvinner</h2>
		</xsl:if>
		
		<table class="standard_tabell">
			<thead>
				<tr>
					<th>ID</th>
					<th>Navn</th>
					<th>Tel</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="person[@kjønn=$kjønn]">
				<xsl:sort  data-type="text" select="etternavn" lang="no"></xsl:sort>
					<tr>
						<td>
							<xsl:value-of select="@id"/>
						</td>
						<td>
							<xsl:value-of select="concat(fornavn,' ',etternavn)"/>
						</td>
						<td>
							<xsl:value-of select="tel"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>