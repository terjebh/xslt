<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<html>
			<head>
				<title>Boktittel</title>
			</head>
			<body>
				<h1>Boktittel</h1>
				<!--Kapittel 1-->
				<xsl:call-template name="kapittel">
					<xsl:with-param name="nummer" select="'kapittel1.xml'"/>
				</xsl:call-template>
				<!--Kapittel 2-->
				<xsl:call-template name="kapittel">
					<xsl:with-param name="nummer" select="'kapittel2.xml'"/>
				</xsl:call-template>
				<!--Kapittel 3-->
				<xsl:call-template name="kapittel">
					<xsl:with-param name="nummer" select="'kapittel3.xml'"/>
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="kapittel">
		<xsl:param name="nummer"/>
		<xsl:for-each select="document($nummer)/kapittel">
			<xsl:text>&#xA;</xsl:text>
			<h2>
				<xsl:value-of select="@tittel"/>
			</h2>
			<xsl:text>&#xA;</xsl:text>
			<xsl:for-each select="avsnitt">
				<p>
					<xsl:value-of select="."/>
				</p>
				<xsl:text>&#xA;</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>