<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version='1.0'>


  <xsl:output method="xml" />

  <xsl:template match="/">

    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="side" margin="0.5cm">
          <fo:region-body margin="2cm" />
          <fo:region-before extent="1cm" background-color="silver" margin="0.5cm" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="side">

        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="right" margin-right="0.5cm" margin-top="0.5cm">
            Side
            <fo:page-number />
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">

          <fo:block text-align="center" font-size="14pt" border-bottom="solid 1px black" space-after="1cm">Lister</fo:block>

          <!-- Liste med tall-nummerering-->
          <xsl:apply-templates select="ol">
            <xsl:with-param name="nummer" select="'1'" />
          </xsl:apply-templates>
          <!-- Liste med liten bokstav-nummerering-->
          <xsl:apply-templates select="ol">
            <xsl:with-param name="nummer" select="'a)'" />
          </xsl:apply-templates>
          <!-- Liste med stor bokstav-nummerering-->
          <xsl:apply-templates select="ol">
            <xsl:with-param name="nummer" select="'A.'" />
          </xsl:apply-templates>
          <!-- Liste med romertall-nummerering-->
          <xsl:apply-templates select="ol">
            <xsl:with-param name="nummer" select="'I'" />
          </xsl:apply-templates>
          <!-- Liste med *-nummerering-->
          <xsl:apply-templates select="ol">
            <xsl:with-param name="nummer" select="'*'" />
          </xsl:apply-templates>


        </fo:flow>
      </fo:page-sequence>

    </fo:root>
  </xsl:template>

  <xsl:template match="ol">
    <xsl:param name="nummer" />
    <fo:block>
      Nummerering:
      <xsl:value-of select="$nummer"></xsl:value-of>
    </fo:block>
    <fo:list-block provisional-distance-between-starts="10mm" provisional-label-separation="10mm" space-after="1cm">
      <xsl:for-each select="item">
        <fo:list-item>
          <fo:list-item-label start-indent="5mm" end-indent="label-end()">
            <fo:block>
              <xsl:choose>
                <xsl:when test="$nummer='*'">
                  *
              </xsl:when>
                <xsl:otherwise>
                  <xsl:number format="{$nummer}" />
                </xsl:otherwise>
              </xsl:choose>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body start-indent="body-start()">
            <fo:block>
              <xsl:value-of select="."></xsl:value-of>
            </fo:block>
          </fo:list-item-body>
        </fo:list-item>
      </xsl:for-each>
    </fo:list-block>

  </xsl:template>

</xsl:stylesheet>