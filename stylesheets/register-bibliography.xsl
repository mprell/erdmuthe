<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    
    <xsl:output encoding="UTF-8" method="html" indent="no"/>
    
    <xsl:preserve-space elements="*"/>
    
    
    
    <xsl:template match="tei:TEI">
        
        <html>
            <head>
                <meta content="text/html; charset=utf-8" />
                <title>Bibliographie</title>
                
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
                    <div style="margin-bottom:0.2em;padding:20px;letter-spacing:0.3em;font-family:Helvetica Neue,Arial,sans-serif;font-size:18pt;">Bibliographie</div>
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
        <br/>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <br/>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="@target">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:if test="@rend='bold'">
            <span style="font-weight:bold">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
