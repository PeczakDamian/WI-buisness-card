<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xml" indent="yes" encoding="UTF-8" />
    <xsl:template match="card">
        <html>
            <head>
                <title>Buisness card</title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                    }
                    body {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        font-family: sans-serif;
                    }
                    #main {
                        display: grid;
                        grid-template-areas:
                            "Header"
                            "Address"
                            "Services"
                        ;
                        grid-template-rows:
                            2rem
                            auto
                            auto
                        ;
                        grid-template-column: 100%;
                        align-content: stretch;
                        padding: 5px;
                        background-color: rgb(255, 255, 200);
                        -webkit-print-color-adjust: exact;
                        font-size: 15px;
                        border: 1px solid black;
                        width: 9cm;
                        height: 5cm;
                    }
                    header {
                        grid-area: Header;
                        text-align: center;
                    }
                    #me {
                        grid-area: Address;
                        display: flex;
                        flex-direction: row;
                        justify-content: space-around;
                    }
                    #serv {
                        margin: 0 auto;
                        grid-area: Services;
                    }
                    ul {
                        list-style: none;
                    }
                </style>
            </head>
            <body>
                <div id="main">
                    <header>
                        <xsl:apply-templates select="company"/>
                    </header>
                    <div id="me">
                        <xsl:apply-templates select="me"/>
                    </div>
                    <div id="serv">
                        Nasze usługi:
                        <xsl:apply-templates select="services"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="company">
        <h2><xsl:value-of select="name" /></h2>
    </xsl:template>
    <xsl:template match="me">
        <div>
            <xsl:value-of select="name" /><xsl:text> </xsl:text>
            <xsl:value-of select="surname" /><br/>
            <xsl:apply-templates select="address"/>
        </div>
        <div>
            Kontakt:<br/>
            <xsl:value-of select="phone" /><br/>
            <xsl:value-of select="mail" /><br/>
        </div>
    </xsl:template>
    <xsl:template match="services">
        <ul>
        <xsl:for-each select="service">
            <li>
                <xsl:value-of select="id" />.
                <xsl:value-of select="desc" />
            </li>
        </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="address">
        <div>
            ul. <xsl:value-of select="st" /><br/>
            <xsl:value-of select="code" /><xsl:text> </xsl:text>
            <xsl:value-of select="city" /><br/>
            <xsl:value-of select="cords" />
        </div>
    </xsl:template>
</xsl:stylesheet>