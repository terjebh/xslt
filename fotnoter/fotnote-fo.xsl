<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>
    
  <xsl:output method="xml" />
    
    <xsl:template match="/p">
        
        <fo:root>
            <fo:layout-master-set> 
                      
                <fo:simple-page-master master-name="cover" page-height="29.7cm" page-width="21.0cm" margin="2cm" margin-top="5.5cm" margin-bottom="1cm" margin-left="2cm" margin-right="1cm">
                    <fo:region-body margin="2cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                    <fo:region-start extent="2cm" />
                    <fo:region-end extent="2cm" />
                </fo:simple-page-master>  
        </fo:layout-master-set>
</fo:root>

  <fo:page-sequence master-reference="cover">
                
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" span="all" margin-top="5mm" margin-right="5mm">
                        Side  <fo:page-number />
                    </fo:block>
                </fo:static-content>
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
           
                <fo:flow flow-name="xsl-region-body">
                    
          </fo:flow>
    </fo:page-sequence>      
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