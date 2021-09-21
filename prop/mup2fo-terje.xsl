<?xml version="1.0" encoding="utf-8"?>
<!--Dette er tidlig versjon, testet på 125 2(020-2021)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:include href="propstiler.xsl" />
    <xsl:output method="xml" indent="yes" />

    <xsl:template name="parseNumber">
        <xsl:param name="data" />
        <xsl:param name="is-float" select="false()" /> <!-- has this already been determined to be a non-integer -->
        <xsl:if test="string-length($data) &gt; 0">
            <xsl:if test="(substring($data,1,1)&gt;-1) or ((substring($data,1,1) = '.') and (not($is-float)) )">
                <xsl:value-of select="substring($data,1,1)" />

            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/">
        <!--
<xsl:attribute-set name="CELLSTYLE">
  <xsl:attribute name="font-family">
    New York, Times New Roman, Times, serif
  </xsl:attribute>
  <xsl:attribute name="font-size">12pt</xsl:attribute>
</xsl:attribute-set>
-->
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="smuss" page-height="29.7cm" page-width="21.0cm" margin="2cm" margin-top="5.5cm" margin-bottom="1cm" margin-left="1cm" margin-right="1cm">
                    <fo:region-body margin="3cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="2cm" />
                    <fo:region-start extent="2cm" />
                    <fo:region-end extent="2cm" />
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

            <!--Her kommer selve innholdet hentet fra kjerneformatet-->
            <!--Første smusstittelside, hvor tittel er 38pt-->
            <fo:page-sequence master-reference="smuss" initial-page-number="1">

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block>
                        Laget med AGP:
                        <xsl:value-of select="document(&apos;http://xobjex.com/service/date.xsl&apos;)/date/utc/@rfc-822" />
                        <fo:page-number />
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body" text-align="center">
                    <fo:block font-family="UniMyriad Bold" font-weight="normal" font-size="38pt">
                        <xsl:value-of select="//section/h1 [@class='K-TIT-PUBLIKASJONSTITTEL FORSIDE hode']" />
                    </fo:block>
                    <fo:block linefeed-treatment="preserve" font-family="UniCentury Old Style" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="//section/h3 [@class='K-TIT-SESJON FORSIDE sesjon']" />
                        <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.5pt" />
                    </fo:block>
                    <fo:block linefeed-treatment="preserve" font-family="UniCentury Old Style" font-weight="normal" font-size="24pt" line-height="125%">
                        <xsl:value-of select="//section/h2 [@class='K-TIT-TITTEL FORSIDE tittel']" />
                    </fo:block>
                    <!--<fo:block>
            <xsl:value-of select="//section/p"/>
          </fo:block>-->
                </fo:flow>

            </fo:page-sequence>
            <!--Her er tittelside 2, evt. etter innholdet hvor kapitlene følger fortløpende-->
            <fo:page-sequence master-reference="hoyre-venstre">
                <!--Spesifisering av hode på venstresider-->
                <fo:static-content flow-name="left-hode">
                    <fo:block-container>
                        <fo:block margin-top="0mm" margin-left="0mm" text-align="left">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt">
                                <fo:page-number />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="-5.2mm" text-align="center">
                            <fo:inline font-family="UniMyriad Bold" font-weight="normal" font-size="10.678pt">
                                <xsl:value-of select="//head/meta[@name='hode']/@content" />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="-5mm" text-align="right">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt">
                                <xsl:value-of select="//head/meta[@name='tidsperiode']/@content" />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="0mm" text-align="center">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="8.542pt">
                                <xsl:value-of select="//head/meta[@name='tittel']/@content" />
                            </fo:inline>
                        </fo:block>
                    </fo:block-container>
                </fo:static-content>
                <!--Spesifisering av hode på høyresider-->
                <fo:static-content flow-name="right-hode">
                    <fo:block-container>
                        <fo:block margin-top="0mm" text-align="left">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt">
                                <xsl:value-of select="//head/meta[@name='tidsperiode']/@content" />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="-5.2mm" text-align="center">
                            <fo:inline font-family="UniMyriad Bold" font-weight="normal" font-size="10.678pt">
                                <xsl:value-of select="//head/meta[@name='hode']/@content" />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="-5mm" margin-left="0mm" text-align="right">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt">
                                <fo:page-number />
                            </fo:inline>
                        </fo:block>
                        <fo:block margin-top="0mm" text-align="center">
                            <fo:inline font-family="UniCentury Old Style" font-weight="normal" font-size="8.542pt">
                                <xsl:value-of select="//head/meta[@name='tittel']/@content" />
                            </fo:inline>
                        </fo:block>
                    </fo:block-container>

                </fo:static-content>
                <!--Dette er tittelsiden-->

                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" span="all" margin-bottom="16.3mm">
                        <fo:external-graphic content-height="27.147mm" content-width="84.245mm" src="url(file:///C:/fop/KMD1KB00.jpg)"></fo:external-graphic>
                    </fo:block>
                    <fo:block font-family="UniMyriad Bold" text-align="center" span="all" font-weight="normal" font-size="34.168pt" line-height="100%">
                        <xsl:value-of select="//section/h1 [@class='K-TIT-PUBLIKASJONSTITTEL FORSIDE hode']" />
                    </fo:block>
                    <fo:block linefeed-treatment="preserve" text-align="center" span="all" font-family="UniCentury Old Style" font-weight="normal" font-size="16pt" line-height="140%" margin-bottom="-1.7mm">
                        <xsl:value-of select="//section/h3 [@class='K-TIT-SESJON FORSIDE sesjon']" />
                    </fo:block>
                    <fo:block span="all" text-align="center">
                        <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.5pt" />
                    </fo:block>
                    <fo:block linefeed-treatment="preserve" text-align="center" span="all" font-family="UniCentury Old Style" font-weight="normal" font-size="21.355pt" line-height="120%" margin-top="4.5mm">
                        <xsl:value-of select="//section/h2 [@class='K-TIT-TITTEL FORSIDE tittel']" />
                    </fo:block>
                    <fo:block linefeed-treatment="preserve" text-align="center" span="all" font-family="UniCentury Old Style" font-weight="normal" font-style="italic" font-size="10.678pt" line-height="120%" margin-top="23pt" margin-bottom="25pt">
                        <xsl:value-of select="//section/p" />
                    </fo:block>
                    <!--Her kommer selve innholdet, inn på samme side som tittelside, med tilråding-->
                    <!--Overskrift 1-->
                    <!--Indent kan ikke brukes her, da det også tar nummeret, start-indent="26pt"-->

                    <xsl:for-each select="//section [@class='K-DEL-KAPITTEL krnl_chapter']">

                        <fo:block font-family="UniMyriad Bold" font-weight="normal" font-size="12.813pt" margin-top="13pt" margin-bottom="-7pt">
                            <xsl:value-of select="h2" />

                        </fo:block>
                        <fo:block>
                            <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.5pt" />
                        </fo:block>
                        <xsl:for-each select="p">
                            <!-- Tekstinnrykk, men ikke første avsnitt-->
                            <xsl:if test="position()=1">
                                <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="100%">
                                    <xsl:value-of select="." />
                                </fo:block>
                            </xsl:if>

                            <xsl:if test="position()>1">
                                <fo:block font-family="UniCentury Old Style" text-indent="5.65mm" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="100%">
                                    <xsl:value-of select="." />
                                </fo:block>
                            </xsl:if>

                        </xsl:for-each>
                    </xsl:for-each>


                    <!--Test av Listefunksjon for overskrift 1 
          <fo:list-block>
            <xsl:for-each select="//section [@class='K-DEL-KAPITTEL krnl_chapter']">

              <fo:list-item margin-top="10pt">
                <fo:list-item-label>
                  <fo:block font-family="UniMyriad Bold" font-weight="normal" font-size="11.211pt" line-height="100%" margin-top="10pt">

                <xsl:value-of select="h2 [translate(.,translate(., '012', ''), '')]"/>

                  </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="26pt">

                  <fo:block> -->
                    <!--<xsl:value-of select="h2"/>-->
                    <!--</fo:block>
                  <fo:block>
                    <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="0.5pt"/>
                  </fo:block>
                  <xsl:for-each select="p">
                    <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%">
                      <xsl:value-of select="."/>
                    </fo:block>
                </xsl:for-each>

                </fo:list-item-body>
              </fo:list-item>

            </xsl:for-each>
          </fo:list-block> 
          -->


                    <!--Overskrift 2-->
                    <xsl:for-each select="//section [@class='K-DEL-SEKSJON krnl_chapter']">

                        <fo:block font-family="UniMyriad Bold" font-weight="normal" font-size="11.211pt" line-height="114%" margin-top="10pt">
                            <xsl:value-of select="h2" />
                        </fo:block>
                        <xsl:for-each select="p">
                             <!-- Tekstinnrykk, men ikke første avsnitt-->
                             <xsl:if test="position()=1">
                            <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="100%">
                                <xsl:value-of select="." />
                            </fo:block>
                             </xsl:if>
                             <xsl:if test="position()>1">
                            <fo:block font-family="UniCentury Old Style" text-indent="5.65mm" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="100%">
                                <xsl:value-of select="." />
                            </fo:block>
                             </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <!--Tilråding hentes ut, h3 skal ikke være med på print-->
                    <xsl:for-each select="//section [@class='K-DEL-TILRSTAD krnl_chapter']">
                        <xsl:for-each select="p">
                            <xsl:choose>
                                <xsl:when test="@class='K-TILRDEP'">
                                    <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="100%" start-indent="5.65mm" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>

                                <xsl:when test="@class='K-TILRAR'">
                                    <fo:block font-family="UniCentury Old Style" text-align="center" font-weight="normal" font-size="10.678pt" line-height="100%" letter-spacing="5pt" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                <xsl:otherwise>

                                    <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>

                                    <fo:block span="all" text-align="center">
                                        <fo:leader leader-pattern="rule" leader-length="36mm" rule-style="solid" rule-thickness="0.5pt" />
                                    </fo:block>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:for-each select="//div [@class='K-DEL-KONGESIDE']">
                        <xsl:for-each select="p">
                            <xsl:choose>
                                <xsl:when test="@class='K-KONGE'">
                                    <fo:block font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt" line-height="120%" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                <xsl:when test="@class='K-STADFESTER'">
                                    <fo:block span="all" text-align="center" font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt" line-height="120%" letter-spacing="5pt" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                </xsl:when>
                                <xsl:otherwise>
                                    <fo:block span="all" font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" margin-top="12.813pt">
                                        <xsl:value-of select="." />
                                    </fo:block>
                                    <fo:block span="all" text-align="center">
                                        <fo:leader leader-pattern="rule" leader-length="36mm" rule-style="solid" rule-thickness="0.5pt" margin-top="12.813pt" />
                                    </fo:block>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:for-each select="//section [@class='K-DEL-AVSLDEL krnl_section']">
                        <xsl:for-each select="//section [@class='K-DEL-VEDTAK krnl_chapter']">

                            <fo:block linefeed-treatment="preserve" text-align="center" span="all" font-family="UniMyriad Bold" font-weight="normal" font-size="17.084pt" line-height="120%" margin-top="0pt">
                                <xsl:value-of select="h2" />
                            </fo:block>
                            <xsl:for-each select="div [@class='K-DEL-VEDTAKDELER']">
                                <xsl:for-each select="div [@class='K-DEL-VEDTAKDEL']">
                                    <fo:block text-align="center" font-family="UniCentury Old Style" font-weight="normal" font-size="10.678pt" line-height="120%" margin-top="12.813pt">
                                        <xsl:value-of select="h2" />
                                    </fo:block>
                                    <xsl:for-each select="p">
                                        <!-- Tekstinnrykk, men ikke første avsnitt-->
                                        <xsl:if test="position()=1">
                                            <fo:block font-family="UniCentury Old Style" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="90%">
                                                <xsl:value-of select="." />
                                            </fo:block>
                                        </xsl:if>
                                        <xsl:if test="position()>1">
                                            <fo:block font-family="UniCentury Old Style" text-indent="5.65mm" text-align="justify" font-weight="normal" font-size="10.678pt" line-height="120%" word-spacing.minimum="30%" word-spacing.maximum="150%" word-spacing.optimum="90%">
                                                <xsl:value-of select="." />
                                            </fo:block>
                                       </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <!-- For å plassere vedtakene i begge spalter-->
                                <fo:block span="all"></fo:block>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>