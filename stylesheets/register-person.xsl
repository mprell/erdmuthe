<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    
    <xsl:output encoding="UTF-8" method="html" indent="no"/>
    
    <xsl:preserve-space elements="*"/>
    
    
    
    <xsl:template match="tei:TEI">
        
        <html>
            <head>
                <meta content="text/html; charset=utf-8" />
                <title>Personenregister</title>
                
                <style type="text/css" class="transcription">
                    .transcription
                    
                    font-face {
                    font-family:Helvetica Neue,Arial,sans-serif;
                    }
                    
                    a:link {
                    text-decoration: none;
                    }
                    
                    a:visited {}
                    
                    a:hover {
                    color: #FFBF00;
                    }
                    
                    a:active {
                    color: #FF0000;
                    }
                    
                    .linebreak_none 
                    br {
                    display: none;
                    }
                    
                </style>
                
            </head>
            
            <body>
                <div id="doc_header">
                    <div style="margin-bottom:0.2em;padding:20px;letter-spacing:0.3em;font-family:Helvetica Neue,Arial,sans-serif;font-size:18pt;">Personenregister</div>
                    <hr style="margin:0;padding:0;height:1px;"/>
                    <br/>
                </div>
                
                <div id="content"
                    style="
                    font-family:Helvetica Neue,Arial,sans-serif;
                    font-size:14pt;
                    margin-left:20px; 
                    margin-right:20px;
                    padding:10px;">
                    <xsl:apply-templates select="tei:text/tei:body/*"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <br/>
        <span style="font-weight:bold; font-size:larger;"><xsl:apply-templates/></span>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <br/>
        
            <xsl:choose>
                <xsl:when test="tei:idno[@type='GND']">
            <span style="font-weight:bold;">
                
                <xsl:if test="tei:persName/tei:surname and tei:persName/tei:forename">
                    <xsl:value-of select="tei:persName/tei:surname[not(@type='maiden')]"/><xsl:text>, </xsl:text><xsl:value-of select="tei:persName/tei:forename"/>
                </xsl:if>
                <xsl:if test="tei:persName/tei:surname and not(tei:persName/tei:forename)">
                    <xsl:value-of select="tei:persName/tei:surname"/>
                </xsl:if>
                <xsl:if test="tei:persName/tei:forename and not(tei:persName/tei:surname)">
                    <xsl:value-of select="tei:persName/tei:forename"/>
                </xsl:if>
                <xsl:if test="tei:persName/tei:name">
                    <xsl:value-of select="tei:persName/tei:name"/>
                </xsl:if>
                <xsl:if test="tei:persName/tei:addName">
                    <xsl:text> (</xsl:text><xsl:value-of select="tei:persName/tei:addName"/><xsl:text>)</xsl:text>
                    <xsl:if test="tei:persName/tei:roleName">
                        <xsl:value-of select="tei:persName/tei:roleName"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="tei:persName/tei:surname[@type='maiden']">
                    <xsl:text> (geb. </xsl:text><xsl:value-of select="tei:persName/tei:surname[@type='maiden']"/><xsl:text>)</xsl:text>
                </xsl:if>
            </span>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="tei:idno"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <span title="Link zur GND"><xsl:text> [GND]</xsl:text></span>
                    </a>
            
        </xsl:when>
            <xsl:otherwise>
                <span style="font-weight:bold;">
                <xsl:if test="tei:persName/tei:surname and tei:persName/tei:forename">
                    <xsl:value-of select="tei:persName/tei:surname[not(@type='maiden')]"/><xsl:text>, </xsl:text><xsl:value-of select="tei:persName/tei:forename"/>
            </xsl:if>
            <xsl:if test="tei:persName/tei:surname and not(tei:persName/tei:forename)">
                <xsl:value-of select="tei:persName/tei:surname"/>
            </xsl:if>
            <xsl:if test="tei:persName/tei:forename and not(tei:persName/tei:surname)">
                <xsl:value-of select="tei:persName/tei:forename"/>
            </xsl:if>
            <xsl:if test="tei:persName/tei:name">
                <xsl:value-of select="tei:persName/tei:name"/>
            </xsl:if>
                <xsl:if test="tei:persName/tei:addName">
                    <xsl:text> (</xsl:text><xsl:value-of select="tei:persName/tei:addName"/><xsl:text>)</xsl:text></xsl:if>
                <xsl:if test="tei:persName/tei:roleName">
                    <xsl:value-of select="tei:persName/tei:roleName"/>
                </xsl:if>
                <xsl:if test="tei:persName/tei:surname[@type='maiden']">
                    <xsl:text> (geb. </xsl:text><xsl:value-of select="tei:persName/tei:surname[@type='maiden']"/><xsl:text>)</xsl:text>
                </xsl:if>
                </span>
            </xsl:otherwise>
        </xsl:choose>
        
        
        <xsl:if test="tei:birth and tei:death">
            <xsl:text> (&#x2217;</xsl:text>
            <xsl:value-of select="tei:birth/tei:placeName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:birth/tei:date/@when"/>
            <xsl:text> | &#x2020;</xsl:text>
            <xsl:value-of select="tei:death/tei:placeName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:death/tei:date/@when"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
        
        <xsl:if test="tei:sex[@value='M']">
            <xsl:text> &#x2642;</xsl:text>
        </xsl:if>
        
        <xsl:if test="tei:sex[@value='F']">
            <xsl:text> &#x2640;</xsl:text>
        </xsl:if>

        <xsl:if test="tei:note[@type='bio']">
            <div style="margin-left:20px;">
                <span style="font-style:italic;"><xsl:text>Biographisches: </xsl:text>
                </span><xsl:value-of select="tei:note[@type='bio']/tei:p"/>
            </div>
        </xsl:if>

        <xsl:if test="tei:note[@type='references']/tei:ref">
            <div style="margin-left:60px;">
                <xsl:for-each select="tei:note[@type='references']/tei:ref[@target]">
                    <xsl:sort select="tei:date" order="ascending" data-type="number"/>
                    <xsl:sort select="self::tei:ref" order="ascending" data-type="text"/>
                    <xsl:text>&#x2022; </xsl:text>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="@target"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <span title="Link zum Brief"><xsl:apply-templates/></span>
                    </a>
                    <br/>
                </xsl:for-each>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:ref[@target]">
        <xsl:if test="not(parent::tei:note[@type='references'])">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">_self</xsl:attribute>
            <xsl:apply-templates/>
        </a>
        </xsl:if>

    </xsl:template>
    
    <xsl:template match="tei:anchor">
        <a>
            <xsl:attribute name="name">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:text> </xsl:text>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:if test="@rend ='larger'">
            <span style="font-size:1.3em;"><xsl:apply-templates/></span>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
