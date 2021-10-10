<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <xsl:output method="xml" />
    
    <xsl:template match="/">
        
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="content">
                    <fo:region-body region-name="body" margin="3cm,3cm,3cm,3cm" column-count="2" column-gap="4mm"/>
                    <fo:region-before extent="1cm" background-color="silver" /> 
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="content">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel">
                        
                   
                        <fo:block  text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                        
                        <xsl:for-each select="p">
                            
                            <xsl:choose>
                                <xsl:when test="@underheading">
                                    
                                    <fo:block keep-with-next="always" text-align="justify" margin-bottom="2mm" margin-top="2mm" line-height="10pt" font-size="10pt" font-family="serif" font-weight="bold" hyphenate="true" language="nb" country="no">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    
                                </xsl:when>
                                
                                <xsl:when test="position()=1">
                                    <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                                <xsl:when test="position()>1">
                                    <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" >
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                            </xsl:choose>
                            
                        </xsl:for-each>
                    </xsl:for-each>
                    
                    
                    <fo:block span="all"></fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>