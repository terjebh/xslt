<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <xsl:output method="xml" />
    
    <xsl:template match="/">
        
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="content">
                    <fo:region-body region-name="body" margin="3cm,3cm,3cm,3cm" column-count="2" />
                    <fo:region-before extent="2cm" background-color="yellow"  />
                    <fo:region-after extent="2cm" background-color="green"  />
                    <fo:region-start extent="2cm" background-color="silver" />
                    <fo:region-end extent="2cm" background-color="red" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="content">
                
                <!-- region-before-->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block-container  margin-top="8mm">
                        <fo:block text-align="center" font-weight="bold">
                            Dette er  <fo:inline font-style="italic">region-before</fo:inline>  
                        </fo:block>
                        <fo:block text-align="right" >
                            Side  <fo:page-number />
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>
                
                <!-- region-after-->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" margin-top="8mm" font-weight="bold" >
                        Dette er  <fo:inline font-style="italic">region-after</fo:inline>  
                    </fo:block>
                </fo:static-content>
                
                <!-- region-start-->
                <fo:static-content flow-name="xsl-region-start" margin-left="8mm" >
                    <fo:block-container  reference-orientation="90" font-weight="bold">
                        <fo:block text-align="center">
                            Dette er  <fo:inline font-style="italic">region-start</fo:inline>  
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>
                
                 <!-- region-end-->
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block-container  reference-orientation="-90" font-weight="bold"  margin-left="8mm">
                        <fo:block text-align="center">
                            Dette er  <fo:inline font-style="italic">region-end</fo:inline>  
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>
                
                
                <fo:flow flow-name="body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/vedtaksforslag"></xsl:value-of>
                    </fo:block>
                    
                    <fo:block text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="1cm">
                        <xsl:value-of select="/dokument/heading"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="/dokument/forslag">
                        <fo:block text-align="center" margin-bottom="0mm" line-height="10pt" font-size="10pt">
                            <xsl:number format="I"></xsl:number>
                        </fo:block>
                        <xsl:for-each select="avsnitt">
                            <xsl:if test="position()=1">
                                <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif">
                                    <xsl:value-of select="."></xsl:value-of>
                                    <xsl:text>:</xsl:text>
                                </fo:block>
                            </xsl:if>
                            
                            <xsl:if test="position()>1">
                                <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif">
                                    <xsl:value-of select="."></xsl:value-of>
                                </fo:block>
                            </xsl:if>
                            
                        </xsl:for-each>
                        
                    </xsl:for-each>
                    
                    <fo:block span="all"></fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>