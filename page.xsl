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
                        flex-direction: column;
                        align-items: center;
                        font-family: sans-serif;
                    }
                    #main {
                        display: grid;
                        grid-template-areas:
                            "Header"
                            "Address"
                            "Map"
                            "Services"
                        ;
                        align-content: stretch;
                        padding: 5px;
                        background-color: #d2d2d2;
                        border: 3px solid #58a786;
                        border-radius: 10px;
                        font-size: 20px;
                        width: 50%;
                        min-width: 500px;
                    }
                    header {
                        grid-area: Header;
                        text-align: center;
                        border-bottom: 3px solid #58a786;
                    }
                    #me {
                        grid-area: Address;
                        display: flex;
                        flex-direction: row;
                        justify-content: space-around;
                    }
                    #map {
                        grid-area: Map;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                    }
                    #serv {
                        grid-area: Services;
                        margin: 0 auto;
                    }
                    ul {
                        list-style: none;
                    }
                    a {
                        text-align: center;
                        width: auto;
                        padding: 5px 10px;
                        color: black;
                        border-radius: 20px;
                        background-color: #58a786;
                        text-decoration: none;
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
                    <div id="map">
                        <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=15.236186385154726%2C52.732923275596804%2C15.240665674209597%2C52.73437200336738&amp;layer=mapnik&amp;marker=52.73364764550006%2C15.23842602968216" style="border: 1px solid #58a786"></iframe><br/><small><a href="https://www.openstreetmap.org/?mlat=52.73365&amp;mlon=15.23843#map=19/52.73365/15.23843">Wyświetl większą mapę</a></small>
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
        <h1><xsl:value-of select="name" /></h1>
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
            <xsl:value-of select="code" /><br/>
            <xsl:value-of select="city" />
        </div>
    </xsl:template>
</xsl:stylesheet>