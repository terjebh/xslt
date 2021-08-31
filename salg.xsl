<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	version="2.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Oversikt over Salg</title>
				<link rel="stylesheet" href="stiler.css"/>
			</head>
			<body>
				<h1>Salgsrapport</h1>
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
		<h2>
			<xsl:if test="$kjønn='M'">Menn</xsl:if>
			<xsl:if test="$kjønn='K'">Kvinner</xsl:if>
		</h2>
		<table class="standard_tabell">
			<thead>
				<tr>
					<th>ID</th>
					<th>Navn</th>
					<th>Epost</th>
					<th>Født</th>
					<th>Sum salg</th>
					<th>Antall salg</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="person[@kjønn=$kjønn]">
					<xsl:sort data-type="text" order="ascending" lang="no" select="etternavn"/>
					<xsl:sort data-type="text" order="ascending" lang="no" select="fornavn"/>
					<tr>
						<td>
							<xsl:value-of select="@id"/>
						</td>
						<td>
							<xsl:value-of select="concat(fornavn,' ',etternavn)"/>
						</td>
						<td id="epost">
							<xsl:value-of select="epost"/>
						</td>
						<td class="center-adjust">
							<xsl:value-of select="fødselsdato"/>
						</td>
						<td class="right-adjust">
							<xsl:value-of select="sum(salg)"/>
						</td>
						<td class="right-adjust">
							<xsl:value-of select="count(salg)"/>
						</td>
					</tr>
				</xsl:for-each>
				<!-- Merk: konteksten er nå: personer  -->
				<tr>
					<td colspan="4">Totalt salg:</td>
					<td class="right-adjust">
						<xsl:value-of select="sum(person[@kjønn=$kjønn]/salg)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>