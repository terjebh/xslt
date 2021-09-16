<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:preserve-space elements="*" />
    <xsl:template match="/">

        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master margin="5mm 10mm 5mm 10mm" master-name="my-page">

                    <fo:region-body margin="1cm" />

                </fo:simple-page-master>
            </fo:layout-master-set>

            <xsl:apply-templates select="personer">
                <xsl:with-param name="kjønn" select="'M'" />
            </xsl:apply-templates>

            <xsl:text>&#xA;</xsl:text>

            <xsl:apply-templates select="personer">
                <xsl:with-param name="kjønn" select="'K'" />
            </xsl:apply-templates>

        </fo:root>

    </xsl:template>


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


    <xsl:template match="personer">

        <xsl:param name="kjønn" />

        <xsl:variable name="kjønntext">
            <xsl:if test="$kjønn='M'">Menn</xsl:if>
            <xsl:if test="$kjønn='K'">Kvinner</xsl:if>
        </xsl:variable>

        <fo:page-sequence master-reference="my-page">
            <fo:flow flow-name="xsl-region-body">
                <fo:block>Side: <fo:page-number></fo:page-number> </fo:block>
                <fo:block font-size="18pt" font-family="verdana" color="red" space-before="5mm" space-after="5mm">
                    <xsl:text>Salgsrapport - </xsl:text>
                    <xsl:value-of select="format-date(current-date(),'[D1]. [MNn] [Y1]')"></xsl:value-of>
                </fo:block>

                <fo:block font-size="16pt" font-family="verdana" color="navy" space-before="5mm" space-after="5mm">
                    <xsl:value-of select="$kjønntext"></xsl:value-of>
                </fo:block>

                <fo:table table-layout="fixed" width="500pt">
                    <table-column column-width="50pt" column-number="3"></table-column>
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th" width="20pt">
                                <fo:block>ID</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th">
                                <fo:block>Navn</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th" width="130pt">
                                <fo:block>Epost</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th">
                                <fo:block>Født</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th">
                                <fo:block>Sum Salg</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.th" width="50pt">
                                <fo:block>Antall</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>

                    <fo:table-body>

                        <xsl:for-each select="person[@kjønn=$kjønn]">
                            <xsl:sort data-type="text" order="ascending" lang="no" select="etternavn" />
                            <xsl:sort data-type="text" order="ascending" lang="no" select="fornavn" />

                            <fo:table-row>

                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="@id" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="concat(fornavn,' ',etternavn)" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="epost" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="fødselsdato" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="sum(salg)" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                    <fo:block>
                                        <xsl:value-of select="count(salg)" />
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>

                        </xsl:for-each>

                        <!-- Merk: konteksten er nå: personer  -->
                        <fo:table-row>
                            <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="table.data.td">
                                <fo:block>
                                    Totalt salg
                                    <xsl:value-of select="$kjønntext"></xsl:value-of>
                                    :
                                </fo:block>
                            </fo:table-cell>

                            <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                <fo:block>
                                    <xsl:value-of select="sum(person[@kjønn=$kjønn]/salg)" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                <fo:block>
                                    <xsl:value-of select="count(person[@kjønn=$kjønn]/salg)" />
                                </fo:block>
                            </fo:table-cell>

                        </fo:table-row>

                    </fo:table-body>
                </fo:table>
            </fo:flow>
        </fo:page-sequence>

    </xsl:template>

</xsl:stylesheet>