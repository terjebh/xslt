<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:output method="xml" />
    
    <xsl:template match="/" mode="#default">
        
        <fo:root>
            <!-- Layout-->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="bok">
                    <fo:region-body region-name="body" margin="3cm,3cm,3cm,3cm" />
                    <fo:region-before region-name="sidetopp" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="bok" id="{generate-id(.)}">
                <!-- Sidenummerering-->
                <fo:static-content flow-name="sidetopp">
                    <fo:block text-align="right" span="all" margin="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="body">
                    <!-- Sett inn innholdsfortegnelsen-->
                    <fo:block font-size="16pt" font-weight="bold">Innholdsfortegnelse</fo:block>
                    <xsl:apply-templates select="/bok/kapittel" mode="toc"/>
                    <!-- Presenter inholdet i boken-->
                    <xsl:apply-templates select="/bok"/>
                </fo:flow>                           
                
            </fo:page-sequence>   
            
        </fo:root>
        
    </xsl:template>
    
    <!-- Mal for innholdsfortegnelse, nivå kapittel-->
    <xsl:template match="/bok/kapittel" mode="toc">
        <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="{generate-id(.)}">
                <fo:inline> <xsl:value-of select="tittel" /></fo:inline>
                <fo:leader leader-pattern="dots" />
                <fo:page-number-citation ref-id="{generate-id(.)}"/>
            </fo:basic-link>
        </fo:block>
        <xsl:apply-templates select="seksjon" mode="toc" />
    </xsl:template>
    
    <!-- Mal for innholdsfortegnelse, nivå seksjon-->
    <xsl:template match="seksjon" mode="toc">
        <fo:block text-align-last="justify" text-indent="-1em" start-indent="1em">
            <fo:basic-link internal-destination="{generate-id(.)}">
                <fo:inline padding-start="1em"><xsl:value-of select="tittel"/> </fo:inline>
                <fo:leader leader-pattern="dots" />
                <fo:page-number-citation ref-id="{generate-id(.)}"/>
            </fo:basic-link>
        </fo:block>
    </xsl:template>
    
    <!-- Mal for innholdet i boken-->
    <xsl:template match="/bok">

        <xsl:for-each select="kapittel">
            <fo:block page-break-before="always" font-size="30pt" font-weight="bold" space-before="3cm" text-align="center" id="{generate-id(.)}">
               Kapittel <xsl:value-of select="position()"/>
            </fo:block>
            <fo:block font-size="20pt" font-weight="bold" space-before="3cm" text-align="center">
                <xsl:value-of select="tittel"/>
            </fo:block>
            
            <xsl:for-each select="seksjon">
                <fo:block page-break-before="always" space-after="1cm" font-size="16pt" font-weight="bold" id="{generate-id(.)}">
                    <xsl:value-of select="tittel"/>
                </fo:block>
                <fo:block > <xsl:text>Og her er innholdet</xsl:text></fo:block>
            </xsl:for-each>            
       
        </xsl:for-each>
    
    </xsl:template>
    
    
</xsl:stylesheet>