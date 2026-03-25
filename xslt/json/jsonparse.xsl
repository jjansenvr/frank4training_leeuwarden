<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <!-- Parse JSON inside XML -->
        <xsl:variable name="data" select="parse-json(/json)" />

        <output>
            <voornaam>
                <xsl:value-of select="$data?voornaam"/>
            </voornaam>
            <huisnummer>
                <xsl:value-of select="$data?huisnummer"/>
            </huisnummer>

            <rollen>
                <xsl:for-each select="$data?roles?*">
                    <rol><xsl:value-of select="."/></rol>
                </xsl:for-each>
            </rollen>
        </output>

    </xsl:template>

</xsl:stylesheet>
