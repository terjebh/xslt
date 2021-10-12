<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>
    
    <xsl:template match="p">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="fn">
        <fo:footnote>
            <fo:inline font-size="0.83em" baseline-shift="super">
                <xsl:number level="any" count="fn" format="1)"/>
            </fo:inline>
            <fo:footnote-body>
                <fo:list-block provisional-distance-between-starts="20pt"
                               provisional-label-separation="5pt">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block  font-size="0.83em"
                                       line-height="0.9em">
                                <xsl:number level="any" count="fn" format="1)"/>
                            </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block  font-size="0.83em"
                                       line-height="0.9em">
                                <xsl:apply-templates/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
            </fo:footnote-body>
        </fo:footnote>
    </xsl:template>
    
</xsl:stylesheet>