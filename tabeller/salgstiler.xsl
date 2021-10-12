<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:attribute-set name="tittelside">
        <xsl:attribute name="page-height">29.7cm</xsl:attribute>
        <xsl:attribute name="page-width">21.0cm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tittelbody">
        <xsl:attribute name="margin">3cm,1.5cm,3cm,1.5cm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="venstreside">
        <xsl:attribute name="page-height">29.7cm</xsl:attribute>
        <xsl:attribute name="page-width">21.0cm</xsl:attribute>
        <xsl:attribute name="margin-top">0cm</xsl:attribute>
        <xsl:attribute name="margin-bottom">0cm</xsl:attribute>
        <xsl:attribute name="margin-left">0cm</xsl:attribute>
        <xsl:attribute name="margin-right">0cm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="venstrebody">
        <xsl:attribute name="margin">3cm,2.5cm,3cm,1.5cm</xsl:attribute>
        <xsl:attribute name="column-count">2</xsl:attribute>
        <xsl:attribute name="column-gap">5mm</xsl:attribute>
    </xsl:attribute-set>


    <xsl:attribute-set name="høyreside">
        <xsl:attribute name="page-height">29.7cm</xsl:attribute>
        <xsl:attribute name="page-width">21.0cm</xsl:attribute>
        <xsl:attribute name="margin-top">0cm</xsl:attribute>
        <xsl:attribute name="margin-bottom">0cm</xsl:attribute>
        <xsl:attribute name="margin-left">0cm</xsl:attribute>
        <xsl:attribute name="margin-right">0cm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="høyrebody">
        <xsl:attribute name="margin">3cm,1.5cm,3cm,2.5cm</xsl:attribute>
        <xsl:attribute name="column-count">2</xsl:attribute>
        <xsl:attribute name="column-gap">5mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="logo">
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sidenummer">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="margin-right">5mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="hovedtittel">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="color">#194189</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="margin-top">5mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">5mm</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="undertittel">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="color">#194189</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="space-before">5mm</xsl:attribute>
        <xsl:attribute name="space-after">2mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.th">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="background-color">#ccc</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">2pt</xsl:attribute>
        <xsl:attribute name="padding-end">2pt</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
        <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.td">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="display-align">center</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">2pt</xsl:attribute>
        <xsl:attribute name="padding-end">2pt</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.data.bunnlinje">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">2pt</xsl:attribute>
        <xsl:attribute name="padding-end">2pt</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
    </xsl:attribute-set>


</xsl:stylesheet>