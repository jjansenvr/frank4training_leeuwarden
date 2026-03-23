<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
  
  <xsl:output method="xml" indent="yes"/>
 
  <xsl:template match="/">
      <brief>
        <adresregel_1><xsl:value-of select="concat(persoon/voornaam,' ',persoon/achternaam)"/></adresregel_1>
        <adresregel_2><xsl:value-of select="persoon/adressen/adres[@type='werk']/straat"/><xsl:text> </xsl:text><xsl:value-of select="persoon/adressen/adres[@type='werk']/huisnummer"/></adresregel_2>
        <adresregel_3><xsl:value-of select="persoon/adressen/adres[@type='werk']/(postcode,plaats)"/></adresregel_3> 
      </brief>
  </xsl:template>
</xsl:stylesheet>