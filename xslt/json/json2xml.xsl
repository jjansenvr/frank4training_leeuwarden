<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <!-- Parse JSON inside XML -->
        <xsl:variable name="data" select="json-to-xml(/json)" />

        <output>
            <voornaam>
                <xsl:value-of select="$data/fn:map/fn:string[@key='voornaam']"/>
            </voornaam>
            <huisnummer>
                <xsl:value-of select="$data/fn:map/fn:number[@key='huisnummer']"/>
            </huisnummer>

            <rollen>
                
                <xsl:for-each select="$data/fn:map/fn:array[@key='roles']/fn:string">
                    <role><xsl:value-of select="."/></role>
                </xsl:for-each>
            </rollen>
        </output>

    </xsl:template>

</xsl:stylesheet>
