<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:include href="salgstiler.xsl" />

    <xsl:template match="/">

        <fo:root>
            <fo:layout-master-set>

                <fo:simple-page-master master-name="tittelside" xsl:use-attribute-sets="tittelside">
                    <fo:region-body xsl:use-attribute-sets="tittelbody" />
                    <fo:region-before />
                    <fo:region-after extent="1cm" />
                    <fo:region-start extent="1cm" />
                    <fo:region-end extent="1cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="venstreside" xsl:use-attribute-sets="venstreside">
                    <fo:region-body xsl:use-attribute-sets="venstrebody" />
                    <fo:region-before />
                    <fo:region-after extent="1cm" />
                    <fo:region-start extent="1cm" />
                    <fo:region-end extent="1cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="høyreside" xsl:use-attribute-sets="høyreside">
                    <fo:region-body xsl:use-attribute-sets="høyrebody" />
                    <fo:region-before />
                    <fo:region-after extent="1cm" />
                    <fo:region-start extent="1cm" />
                    <fo:region-end extent="1cm" />
                </fo:simple-page-master>

                <fo:page-sequence-master master-name="hovedlayout">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="tittelside" page-position="first" />
                        <fo:conditional-page-master-reference master-reference="venstreside" odd-or-even="even" />
                        <fo:conditional-page-master-reference master-reference="høyreside" odd-or-even="odd" />
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>

            </fo:layout-master-set>

            <fo:page-sequence master-reference="hovedlayout">

                <fo:static-content flow-name="xsl-region-before">
                    <fo:block xsl:use-attribute-sets="logo">
                        <fo:external-graphic src="img/side_topp.png" content-width="21cm" />
                    </fo:block>

                    <fo:block xsl:use-attribute-sets="sidenummer">
                        Side
                        <fo:page-number />
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block xsl:use-attribute-sets="hovedtittel">
                        <xsl:text> Salgsrapport - </xsl:text>
                        <xsl:value-of select="format-date(current-date(),'[D1]. [MNn] [Y1]')"></xsl:value-of>
                    </fo:block>

                    <!-- Hent inn malen med oversikt over salg for menn-->
                    <xsl:apply-templates select="personer">
                        <xsl:with-param name="kjønn" select="'M'" />
                    </xsl:apply-templates>

                    <xsl:text>&#xA;</xsl:text>
                    <!-- Hent inn malen med oversikt over salg for kvinner-->
                    <xsl:apply-templates select="personer">
                        <xsl:with-param name="kjønn" select="'K'" />
                    </xsl:apply-templates>

                    <xsl:text>&#xA;</xsl:text>
                    <!-- Hent inn malen med oversikt over salg etter tjeneste-type-->
                    <xsl:call-template name="salg_per_type" />

                    <!-- Ny side-->
                    <fo:block page-break-after="always" />

                    <!-- Hent inn malen: selgere-->
                    <xsl:call-template name="selgere" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- Sidemaler-->
    <!--  Mal for salg per kjønn-->
    <xsl:template match="personer">

        <xsl:param name="kjønn" />

        <!-- Variabel som gjør om M til Menn og K til Kvinner, til bruk bl.a. i undertittelen og i tabellene-->
        <xsl:variable name="kjønntext">
            <xsl:if test="$kjønn='M'">Menn</xsl:if>
            <xsl:if test="$kjønn='K'">Kvinner</xsl:if>
        </xsl:variable>


        <fo:block xsl:use-attribute-sets="undertittel">
            <xsl:value-of select="$kjønntext"></xsl:value-of>
        </fo:block>

        <!-- Tabell med data for salg - for menn eller kvinner, avhengig av parameteret "kjønn", sortert etter salgssum, synkende  -->
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

                    <xsl:variable name="bgclr">
                        <xsl:choose>
                            <xsl:when test="position() mod 2">#fff</xsl:when>
                            <xsl:otherwise>#EFEFEF</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <fo:table-row background-color="{$bgclr}">

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
                                kr.
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
                            kr.
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


    <!-- Sidemal for salg etter tjeneste-type-->
    <xsl:template name="salg_per_type">

        <fo:block xsl:use-attribute-sets="undertittel">
            <xsl:text>Tjenestetype</xsl:text>
        </fo:block>


        <fo:table table-layout="fixed" width="50%">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell xsl:use-attribute-sets="table.data.th">
                        <fo:block>Type</fo:block>
                    </fo:table-cell>
                    <fo:table-cell xsl:use-attribute-sets="table.data.th">
                        <fo:block>Beløp</fo:block>
                    </fo:table-cell>
                    <fo:table-cell xsl:use-attribute-sets="table.data.th">
                        <fo:block>Antall salg</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-body>

                <!-- Itererer over tjenestetyper og lager en tabellrad for hver type-->
                <xsl:for-each-group select="/personer/person/salg" group-by="@type">
                    <fo:table-row>

                        <fo:table-cell xsl:use-attribute-sets="table.data.td">
                            <fo:block>
                                <xsl:value-of select="@type" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="table.data.td" text-align="right">
                            <fo:block>
                                <xsl:value-of select="sum(current-group())" />
                                kr.
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="table.data.td" text-align="right">
                            <fo:block>
                                <xsl:value-of select="count(current-group())" />
                            </fo:block>
                        </fo:table-cell>

                    </fo:table-row>
                </xsl:for-each-group>
                
                <!-- Totaler-->
                <fo:table-row>

                    <fo:table-cell xsl:use-attribute-sets="table.data.bunnlinje">
                        <fo:block>
                            <xsl:text>Salg totalt: </xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell xsl:use-attribute-sets="table.data.bunnlinje" text-align="right">
                        <fo:block>
                            <xsl:value-of select="sum(/personer/person/salg)" />
                            kr.
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell xsl:use-attribute-sets="table.data.bunnlinje" text-align="right">
                        <fo:block>
                            <xsl:value-of select="count(/personer/person/salg)" />
                        </fo:block>
                    </fo:table-cell>

                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>


    <!-- Sidemal for salg per selger-->
    <xsl:template name="selgere">

        <fo:block xsl:use-attribute-sets="hovedtittel" span="all">
            <xsl:text>Individuelle salg per selger</xsl:text>
        </fo:block>

        <xsl:for-each select="personer/person">
            <xsl:sort select="etternavn" />
            <xsl:sort select="fornavn" />

            <fo:block-container keep-together="always">
                <fo:block xsl:use-attribute-sets="undertittel" keep-with-next="always">
                    <xsl:value-of select="concat(fornavn,' ',etternavn)"></xsl:value-of>
                </fo:block>

                <fo:block>
                Salg:
            </fo:block>

                <fo:block>
                    <!-- Tabell for hver selgers salg-->
                    <fo:table table-layout="fixed" width="100%">

                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell xsl:use-attribute-sets="table.data.th">
                                    <fo:block>Type</fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="table.data.th">
                                    <fo:block>Beløp</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>

                        <fo:table-body>
                            <xsl:for-each select="salg">
                                <fo:table-row>
                                    <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                        <fo:block>
                                            <xsl:value-of select="@type" />
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="table.data.td">
                                        <fo:block text-align="right">
                                            <xsl:value-of select="." />
                                            kr.
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                            </xsl:for-each>


                            <fo:table-row>
                                <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.bunnlinje">
                                    <fo:block>
                                Totalt salg: 
                             </fo:block>
                                </fo:table-cell>

                                <fo:table-cell text-align="right" xsl:use-attribute-sets="table.data.bunnlinje">
                                    <fo:block>
                                        <xsl:value-of select="sum(salg)" />
                                        kr.
                                    </fo:block>
                                </fo:table-cell>

                            </fo:table-row>
                        </fo:table-body>

                    </fo:table>

                </fo:block>
            </fo:block-container>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>