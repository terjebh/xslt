<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method="html" />
	<xsl:template match="/">
		<html>
			<head>
				<title>Oversikt over Salg</title>
				<link rel="stylesheet" href="salg.css" />
			</head>
			<body>
				<h1>
					Salgsrapport -
					<xsl:value-of select="format-date(current-date(),'[D1]. [MNn] [Y1]')"></xsl:value-of>
				</h1>
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'M'" />
				</xsl:apply-templates>
				<p />
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'K'" />
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="personer">
		<xsl:param name="kjønn" />
		<xsl:variable name="kjønntext">
			<xsl:if test="$kjønn='M'">Menn</xsl:if>
			<xsl:if test="$kjønn='K'">Kvinner</xsl:if>
		</xsl:variable>
		<h2>
			<xsl:value-of select="$kjønntext"></xsl:value-of>
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
					<xsl:sort data-type="text" order="ascending" lang="no" select="etternavn" />
					<xsl:sort data-type="text" order="ascending" lang="no" select="fornavn" />
					<tr>
						<td>
							<xsl:value-of select="@id" />
						</td>
						<td>
							<xsl:value-of select="concat(fornavn,' ',etternavn)" />
						</td>
						<td id="epost">
							<xsl:value-of select="epost" />
						</td>
						<td class="center-adjust">
							<xsl:value-of select="fødselsdato" />
						</td>
						<td class="right-adjust">
							<xsl:value-of select="sum(salg)" />
						</td>
						<td class="right-adjust">
							<xsl:value-of select="count(salg)" />
						</td>
					</tr>
				</xsl:for-each>
				<!-- Merk: konteksten er nå: personer  -->
				<tr class="bunnlinje">
					<td colspan="4">Totalt salg <xsl:value-of select="$kjønntext"></xsl:value-of>: </td>
					<td class="right-adjust">
						<xsl:value-of select="sum(person[@kjønn=$kjønn]/salg)" />
					</td>
					<td class="right-adjust">
						<xsl:value-of select="count(person[@kjønn=$kjønn]/salg)" />
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>