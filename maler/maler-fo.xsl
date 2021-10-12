<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <xsl:output method="xml" />
    
    <xsl:template match="/">
        
        <fo:root>
            <fo:layout-master-set>
                      
                <fo:simple-page-master master-name="cover" page-height="29.7cm" page-width="21.0cm" margin="2cm" margin-top="5.5cm" margin-bottom="1cm" margin-left="2cm" margin-right="1cm">
                    <fo:region-body margin="2cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                    <fo:region-start extent="2cm" />
                    <fo:region-end extent="2cm" />
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="side1" page-height="29.7cm" page-width="21.0cm" margin="2cm" margin-top="1cm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="0cm" column-count="1" column-gap="6.35mm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                    <fo:region-start extent="2cm" />
                    <fo:region-end extent="2cm" />
                </fo:simple-page-master>
                
                               
                <fo:simple-page-master master-name="side2" page-height="29.7cm" page-width="21.0cm" margin-top="11mm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="27mm" column-count="2" column-gap="6.35mm" />
                    <fo:region-before  extent="0mm" display-align="after" />
                    <fo:region-after extent="0cm" />
                    <fo:region-start extent="0cm" />
                    <fo:region-end extent="0cm" />
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="side3" page-height="29.7cm" page-width="21.0cm" margin-top="11mm" margin-bottom="21.4mm" margin-left="20.5mm" margin-right="20.5mm">
                    <fo:region-body margin="0cm" margin-right="0cm" margin-left="0cm" margin-top="27mm" column-count="3" column-gap="6.35mm" />
                    <fo:region-before extent="0mm" display-align="after" />
                    <fo:region-after extent="0cm" />
                    <fo:region-start extent="0cm" />
                    <fo:region-end extent="0cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="side4">
                    <fo:region-body margin="3cm,3cm,3cm,3cm" column-count="4" column-gap="2.5mm"/>
                    <fo:region-before extent="1cm" background-color="silver" /> 
                </fo:simple-page-master>
                
                
            </fo:layout-master-set>

            <!-- her er det definert en page-sequence for hver side, sidne vi ikke har en page-sequence-master -->
            
            <fo:page-sequence master-reference="cover">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="left" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel">
                        
                        <fo:block  text-align="left" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                    </xsl:for-each>
                </fo:flow>
            </fo:page-sequence>
            
            <fo:page-sequence master-reference="side1">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel[position()=1]">
                        
                        <fo:block  text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                        
                        <xsl:for-each select="p">
                            
                            <xsl:choose>
                                <xsl:when test="@underheading">
                                    
                                    <fo:block keep-with-next="always" text-align="justify" margin-bottom="2mm" margin-top="2mm" line-height="10pt" font-size="10pt" font-family="serif" font-weight="bold" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    
                                </xsl:when>
                                
                                <xsl:when test="position()=1">
                                    <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                                <xsl:when test="position()>1">
                                    <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                            </xsl:choose>
                            
                        </xsl:for-each>
                    </xsl:for-each>
                    
                    
                    <fo:block span="all"></fo:block>
                </fo:flow>
            </fo:page-sequence>
            
            
            <fo:page-sequence master-reference="side2">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel[position()=2]">
                        
                        <fo:block  text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                        
                        <xsl:for-each select="p">
                            
                            <xsl:choose>
                                <xsl:when test="@underheading">
                                    
                                    <fo:block keep-with-next="always" text-align="justify" margin-bottom="2mm" margin-top="2mm" line-height="10pt" font-size="10pt" font-family="serif" font-weight="bold" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    
                                </xsl:when>
                                
                                <xsl:when test="position()=1">
                                    <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                                <xsl:when test="position()>1">
                                    <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                            </xsl:choose>
                            
                        </xsl:for-each>
                    </xsl:for-each>
                    
                    
                    <fo:block span="all"></fo:block>
                </fo:flow>
            </fo:page-sequence>
            
            
            <fo:page-sequence master-reference="side3">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel[position()=3]">
                        
                        <fo:block  text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                        
                        <xsl:for-each select="p">
                            
                            <xsl:choose>
                                <xsl:when test="@underheading">
                                    
                                    <fo:block keep-with-next="always" text-align="justify" margin-bottom="2mm" margin-top="2mm" line-height="10pt" font-size="10pt" font-family="serif" font-weight="bold" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    
                                </xsl:when>
                                
                                <xsl:when test="position()=1">
                                    <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                                <xsl:when test="position()>1">
                                    <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                            </xsl:choose>
                            
                        </xsl:for-each>
                    </xsl:for-each>
                    
                    
                    <fo:block span="all"></fo:block>
                </fo:flow>
            </fo:page-sequence>
            
            <fo:page-sequence master-reference="side4">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block text-align="center" font-size="15pt" font-weight="bold" margin-bottom="0.5cm" span="all">
                        <xsl:value-of select="/dokument/tittel"></xsl:value-of>
                    </fo:block>
                    
                    <xsl:for-each select="dokument/kapittel[position()=4]">
                        
                        <fo:block  text-align="center" font-size="14pt" font-weight="bold" span="all" margin-bottom="0.5cm" margin-top="1cm">
                            <xsl:number format="1. "></xsl:number>  <xsl:value-of select="heading"></xsl:value-of>
                        </fo:block>
                        
                        <xsl:for-each select="p">
                            
                            <xsl:choose>
                                <xsl:when test="@underheading">
                                    
                                    <fo:block keep-with-next="always" text-align="justify" margin-bottom="2mm" margin-top="2mm" line-height="10pt" font-size="10pt" font-family="serif" font-weight="bold" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    
                                </xsl:when>
                                
                                <xsl:when test="position()=1">
                                    <fo:block text-align="justify" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                
                                <xsl:when test="position()>1">
                                    <fo:block text-align="justify" text-indent="0.5cm" margin-bottom="1mm" line-height="10pt" font-size="10pt" font-family="serif" hyphenate="true" language="nb" country="no" hyphenation-remain-character-count="4">
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