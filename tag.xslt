<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="tag[@k[.='ID']]">
    <tag k="CLC:ID">
      <xsl:attribute name="v">
        <xsl:value-of select="@v" />
      </xsl:attribute>
    </tag>

    <tag k="source" v="CLC06" />
    <tag k="source:name" v="Corine Land Cover 2006 version 15" />
    <tag k="source:ref" v="http://www.eea.europa.eu/data-and-maps/data/clc-2006-vector-data-version-1" />
  </xsl:template>

  <xsl:template match="tag[@k[.='code_06']]">
    <tag k="CLC:code_06">
      <xsl:attribute name="v">
        <xsl:value-of select="@v" />
      </xsl:attribute>
    </tag>

    <xsl:choose>
      <xsl:when test="@v='311'">
        <tag k="landuse" v="forest" />
        <tag k="wood" v="deciduous" />

      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tag[@k[.='Shape_Leng']]" />
  <xsl:template match="tag[@k[.='area_ha']]" />
  <xsl:template match="tag[@k[.='Area_Ha']]" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
