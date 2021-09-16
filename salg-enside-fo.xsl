<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:include href="salgstiler.xsl" />

    <xsl:preserve-space elements="*" />
    <xsl:template match="/">

        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master margin="5mm 10mm 5mm 10mm" master-name="rapportside">

                    <fo:region-body margin="1cm" />

                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="rapportside">
                <fo:flow flow-name="xsl-region-body">

                    <fo:block text-align="right">
                        Side
                        <fo:page-number></fo:page-number>
                    </fo:block>

                     <fo:block  xsl:use-attribute-sets="logo">
                        <fo:external-graphic src="img/side_topp.png"  content-width="500pt" />
                    </fo:block>
                    
                    <fo:block text-align="center" xsl:use-attribute-sets="main.title">
                        <xsl:text> Salgsrapport - </xsl:text>
                        <xsl:value-of select="format-date(current-date(),'[D1]. [MNn] [Y1]')"></xsl:value-of>
                    </fo:block>


                    <xsl:apply-templates select="personer">
                        <xsl:with-param name="kjønn" select="'M'" />
                    </xsl:apply-templates>

                    <xsl:text>&#xA;</xsl:text>

                    <xsl:apply-templates select="personer">
                        <xsl:with-param name="kjønn" select="'K'" />
                    </xsl:apply-templates>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>

    </xsl:template>

    <xsl:template match="personer">

        <xsl:param name="kjønn" />

        <xsl:variable name="kjønntext">
            <xsl:if test="$kjønn='M'">Menn</xsl:if>
            <xsl:if test="$kjønn='K'">Kvinner</xsl:if>
        </xsl:variable>


        <fo:block font-size="16pt" xsl:use-attribute-sets="main.subtitle">
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
                        <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.td">
                            <fo:block>
                                <xsl:value-of select="sum(salg)" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.td">
                            <fo:block>
                                <xsl:value-of select="count(salg)" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>

                </xsl:for-each>

                <!-- Merk: konteksten er nå: personer  -->
                <fo:table-row>
                    <fo:table-cell text-align="right" number-columns-spanned="4" xsl:use-attribute-sets="table.data.bunnlinje">
                        <fo:block>
                            Totalt salg
                            <xsl:value-of select="$kjønntext"></xsl:value-of>
                            :
                        </fo:block>
                    </fo:table-cell>

                    <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.bunnlinje">
                        <fo:block>
                            <xsl:value-of select="sum(person[@kjønn=$kjønn]/salg)" />
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.bunnlinje">
                        <fo:block>
                            <xsl:value-of select="count(person[@kjønn=$kjønn]/salg)" />
                        </fo:block>
                    </fo:table-cell>

                </fo:table-row>

            </fo:table-body>
        </fo:table>


    </xsl:template>

</xsl:stylesheet>