<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    
    <xsl:output encoding="UTF-8" method="html" indent="no"/>
    
    <xsl:preserve-space elements="*"/>
    
    
    
    <xsl:template match="tei:TEI">
        
        <html>
            <head>
                <meta content="text/html; charset=utf-8" />
                <title>Organisationenregister</title>
                
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
                    <div style="margin-bottom:0.2em;padding:20px;letter-spacing:0.3em;font-family:Helvetica Neue,Arial,sans-serif;font-size:18pt;">Organisationenregister</div>
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
    
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:orgName">
        <br/>
        <span style="font-weight:bold;">
            <xsl:apply-templates/>
        </span>
                <xsl:if test="@ref">
                    
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="@ref"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <xsl:text> [GND]</xsl:text>
                    </a>
                    
                </xsl:if>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <div style="margin-left:60px;">
            <xsl:for-each select="tei:ref[@target]">
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
    </xsl:template>
    
</xsl:stylesheet>