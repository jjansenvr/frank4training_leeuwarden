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
  <xsl:variable name="domainLookup" select="document('../xml/lookup_landen.xml')" />
  <xsl:template match="/">
    <output>
      <xsl:element name="landnaam">
        <xsl:call-template name="lookup">
          <xsl:with-param name="lookupValue" select="landcode"/>
          <xsl:with-param name="lookupName" select="'Landen'"/>
        </xsl:call-template>
      </xsl:element>    
      <xsl:element name="landnummerprefix">
        <xsl:call-template name="lookup">
          <xsl:with-param name="lookupValue" select="landcode"/>
          <xsl:with-param name="lookupName" select="'LandNummers'"/>
        </xsl:call-template>
      </xsl:element>
    </output>   
  </xsl:template>
  
  
  <xsl:template name="lookup">
    <xsl:param name="lookupValue"/>
    <xsl:param name="lookupName"/>
    <xsl:choose>
      <xsl:when test="$domainLookup/domains/domain[@name=$lookupName]/value[@from=$lookupValue]/@to">
        <xsl:value-of select="$domainLookup/domains/domain[@name=$lookupName]/value[@from=$lookupValue]/@to"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$domainLookup/domains/domain[@name=$lookupName]/default/@to"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>