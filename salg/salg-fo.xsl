<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:include href="salgstiler.xsl" />

    <xsl:template match="/">

        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master xsl:use-attribute-sets="side" master-name="rapportside">
                    <fo:region-body />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="tittelside" page-height="29.7cm" page-width="21.0cm" margin="2cm" margin-top="1cm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="0cm" column-count="2" column-gap="6.35mm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                    <fo:region-start extent="2cm" />
                    <fo:region-end extent="2cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="right" page-height="29.7cm" page-width="21.0cm" margin-top="11mm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="27mm" column-count="2" column-gap="6.35mm" />
                    <fo:region-before region-name="right-hode" extent="0mm" display-align="after" />
                    <fo:region-after extent="0cm" />
                    <fo:region-start extent="0cm" />
                    <fo:region-end extent="0cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="left" page-height="29.7cm" page-width="21.0cm" margin-top="11mm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="27mm" column-count="2" column-gap="6.35mm" />
                    <fo:region-before region-name="left-hode" extent="0mm" display-align="after" />
                    <fo:region-after extent="0cm" />
                    <fo:region-start extent="0cm" />
                    <fo:region-end extent="0cm" />
                </fo:simple-page-master>

                <fo:page-sequence-master master-name="hoyre-venstre">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="tittelside" page-position="first" />
                        <fo:conditional-page-master-reference master-reference="left" odd-or-even="even" />
                        <fo:conditional-page-master-reference master-reference="right" odd-or-even="odd" />
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
                
            </fo:layout-master-set>

            <fo:page-sequence master-reference="rapportside">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block xsl:use-attribute-sets="logo">
                        <fo:external-graphic src="../img/side_topp.png" content-width="600pt" margin="0mm" space-before="0mm" />
                    </fo:block>

                    <fo:block xsl:use-attribute-sets="sidenummer">
                        Side
                        <fo:page-number></fo:page-number>
                    </fo:block>


                    <fo:block xsl:use-attribute-sets="hovedtittel">
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

                    <xsl:call-template name="selgere" />

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


        <fo:block xsl:use-attribute-sets="undertittel">
            <xsl:value-of select="$kjønntext"></xsl:value-of>
        </fo:block>

        <fo:table table-layout="fixed" width="100%">
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
                    <xsl:sort data-type="text" order="descending" lang="no" select="sum(salg)" />
                    <xsl:sort data-type="text" order="ascending" lang="no" select="etternavn" />
                    <xsl:sort data-type="text" order="ascending" lang="no" select="fornavn" />

                    <fo:table-row>

                        <fo:table-cell xsl:use-attribute-sets="table.data.td">
                            <fo:block text-align="center">
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
                            <xsl:value-of select="lower-case($kjønntext)" />
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


    <xsl:template name="selgere">

        <fo:block xsl:use-attribute-sets="hovedtittel">
            <xsl:text>Selgere</xsl:text>
        </fo:block>

        <xsl:for-each select="personer/person">
            <xsl:sort select="etternavn" />
            <xsl:sort select="fornavn" />

            <fo:block xsl:use-attribute-sets="undertittel">
                <xsl:value-of select="concat(fornavn,' ',etternavn)"></xsl:value-of>
            </fo:block>

            <fo:block xsl:use-attribute-sets="table.data.td">
                Salg: <xsl:value-of select="salg"></xsl:value-of>
            </fo:block>


        </xsl:for-each>


    </xsl:template>


</xsl:stylesheet>