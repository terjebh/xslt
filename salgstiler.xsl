<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />


    <xsl:attribute-set name="main.title">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="color">red</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.th">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="background-color">#DDDDDD</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.td">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.bunnlinje">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="logo">
        <xsl:attribute name="background-image">img/logo.png</xsl:attribute>
        <xsl:attribute name="background-color">navy</xsl:attribute>

    </xsl:attribute-set>

</xsl:stylesheet>
