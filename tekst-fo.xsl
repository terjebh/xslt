<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    <xsl:output method="xml" />

    <xsl:include href="salgstiler.xsl" />

    <xsl:preserve-space elements="*" />
    <xsl:template match="/">

        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master margin="5mm 10mm 5mm 10mm" master-name="content">
                    <fo:region-body region-name="body" margin-top="0.5cm" column-count="2" />
                </fo:simple-page-master>

            </fo:layout-master-set>

            <fo:page-sequence master-reference="content">

                <fo:flow flow-name="body">
                    <fo:block text-align="right" span="all">
                        Side
                        <fo:page-number></fo:page-number>
                    </fo:block>

                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/vedtaksforslag"></xsl:value-of>
                    </fo:block>

                    <fo:block text-align="center" font-size="15pt" font-weight="bold" span="all" margin-bottom="1cm">
                        <xsl:value-of select="/dokument/heading"></xsl:value-of>
                    </fo:block>


                    <xsl:for-each select="/dokument/forslag">
                        <fo:block text-align="center" margin-bottom="0mm" line-height="10pt" font-size="10pt">
                            <xsl:number format="I"></xsl:number>
                        </fo:block>
                        <fo:block text-align="justify" linefeed-treatment="preserve" margin= "0mm" line-height="10pt" font-size="10pt" font-family="serif">
                            <xsl:value-of select="avsnitt"></xsl:value-of>
                        </fo:block>
                        
                    </xsl:for-each>

                    <fo:block text-align="center" font-size="15pt" font-weight="bold" span="all"></fo:block>
                </fo:flow>

            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
                 