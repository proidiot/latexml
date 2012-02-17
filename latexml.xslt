<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:attribute-set name="documentclass">
  <xsl:attribute name="name">
   documentclass
  </xsl:attribute>
  <xsl:attribute name="nl2">
   1
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="document">
  <xsl:attribute name="name">
   document
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="usepackage">
  <xsl:attribute name="name">
   usepackage
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="maketitle">
  <xsl:attribute name="name">
   maketitle
  </xsl:attribute>
  <xsl:attribute name="gr">
   0
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="title">
  <xsl:attribute name="name">
   title
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="texml-escape">
  <xsl:attribute name="escape">
   0
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="newline">
  <xsl:attribute name="cat">
   nl
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="newline">
  <xsl:attribute name="cat">
   nl?
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="author">
  <xsl:attribute name="name">
   author
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="date">
  <xsl:attribute name="name">
   date
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="today">
  <xsl:attribute name="name">
   today
  </xsl:attribute>
  <xsl:attribute name="gr">
   0
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="abstract">
  <xsl:attribute name="name">
   abstract
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="section">
  <xsl:attribute name="name">
   section
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="subsection">
  <xsl:attribute name="name">
   subsection
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="subsubsection">
  <xsl:attribute name="name">
   subsubsection
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="paragraph">
  <xsl:attribute name="name">
   paragraph
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="subparagraph">
  <xsl:attribute name="name">
   subparagraph
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="figure">
  <xsl:attribute name="name">
   figure
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="caption">
  <xsl:attribute name="name">
   caption
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="lstinputlisting">
  <xsl:attribute name="name">
   lstinputlisting
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="lstlisting">
  <xsl:attribute name="name">
   lstlisting
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="lstset">
  <xsl:attribute name="name">
   lstset
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="includegraphics">
  <xsl:attribute name="name">
   includegraphics
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="enumerate">
  <xsl:attribute name="name">
   enumerate
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="item">
  <xsl:attribute name="name">
   item
  </xsl:attribute>
  <xsl:attribute name="gr">
   0
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="itemize">
  <xsl:attribute name="name">
   itemize
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="description">
  <xsl:attribute name="name">
   description
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:attribute-set name="appendix">
  <xsl:attribute name="name">
   appendix
  </xsl:attribute>
 </xsl:attribute-set>

 <xsl:template match="/document">
  <xsl:element name="TeXML">
   <xsl:element name="env" use-attribute-sets="documentclass">
    <xsl:apply-templates select="opt" />
    <xsl:element name="parm">
     <xsl:value-of select="@class" />
    </xsl:element>
   </xsl:element>
   <xsl:if test="/document//code">
    <xsl:element name="cmd" use-attribute-sets="usepackage">
     <xsl:element name="parm">
      <xsl:text>listings</xsl:text>
     </xsl:element>
    </xsl:element>
   </xsl:if>
   <xsl:if test="/document//image">
    <xsl:element name="cmd" use-attribute-sets="usepackage">
     <xsl:element name="parm">
      <xsl:text>graphicx</xsl:text>
     </xsl:element>
    </xsl:element>
   </xsl:if>
   <xsl:apply-templates select="package" />
   <xsl:element name="env" use-attribute-sets="document">
    <xsl:apply-templates select="title|author|date" />
    <xsl:if test="@title-page = 1">
     <xsl:element name="cmd" use-attribute-sets="maketitle" />
    </xsl:if>
    <xsl:apply-templates />
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//opt">
  <xsl:element name="opt">
   <xsl:value-of select="." />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/package">
  <xsl:element name="cmd" use-attribute-sets="usepackage">
   <xsl:apply-templates select="opt" />
   <xsl:element name="parm">
    <xsl:value-of select="@name" />
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/title">
  <xsl:element name="cmd" use-attribute-sets="title">
   <xsl:element name="parm">
    <xsl:apply-templates />
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//latex">
  <xsl:element name="TeXML" use-attribute-sets="texml-escape">
   <xsl:value-of select="." />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//newline">
  <xsl:choose>
   <xsl:when test="@force = 1">
    <xsl:element name="spec" use-attribute-sets="newline" />
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="spec" use-attribute-sets="newline-q" />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="/document/author">
  <xsl:element name="cmd" use-attribute-sets="author">
   <xsl:element name="parm">
    <xsl:apply-templates />
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/date">
  <xsl:element name="cmd" use-attribute-sets="date">
   <xsl:element name="parm">
    <xsl:choose>
     <xsl:when test="@today = 1">
      <xsl:element name="cmd" use-attribute-sets="today" />
     </xsl:when>
     <xsl:otherwise>
      <xsl:apply-templates />
     </xsl:otherwise>
    </xsl:choose>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/abstract">
  <xsl:element name="env" use-attribute-sets="abstract">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/section">
  <xsl:element name="env" use-attribute-sets="section">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/section/section">
  <xsl:element name="env" use-attribute-sets="subsection">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/section/section/section">
  <xsl:element name="env" use-attribute-sets="subsubsection">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/section/section/section/section">
  <xsl:element name="env" use-attribute-sets="paragraph">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/section/section/section/section/section">
  <xsl:element name="env" use-attribute-sets="subparagraph">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//figure">
  <xsl:element name="env" use-attribute-sets="figure">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//figure/caption">
  <xsl:element name="cmd" use-attribute-sets="caption">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//code">
  <xsl:choose>
   <xsl:when test="@src">
    <xsl:element name="cmd" use-attribute-sets="lstinputlisting">
     <xsl:element name="opt">
      <xsl:if test="@frame = 1">
       <xsl:text>frame=single,</xsl:text>
      </xsl:if>
      <xsl:text>language=</xsl:text>
      <xsl:value-of select="@lang" />
     </xsl:element>
     <xsl:element name="parm">
      <xsl:value-of select="@src" />
     </xsl:element>
    </xsl:element>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="cmd" use-attribute-sets="lstset">
     <xsl:element name="parm">
      <xsl:if test="@frame = 1">
       <xsl:text>frame=single,</xsl:text>
      </xsl:if>
      <xsl:text>language=</xsl:text>
      <xsl:value-of select="@lang" />
     </xsl:element>
     <xsl:element name="env" use-attribute-sets="lstlisting">
      <xsl:value-of select="." />
     </xsl:element>
    </xsl:element>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="/document//image">
  <xsl:element name="cmd" use-attribute-sets="includegraphics">
   <xsl:element name="parm">
    <xsl:value-of select="@src" />
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//olist">
  <xsl:element name="env" use-attribute-sets="enumerate">
   <xsl:apply-templates select="item" />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//(olist|ulist|dlist)/item">
  <xsl:element name="cmd" use-attribute-sets="item">
   <xsl:choose>
    <xsl:when test="title">
     <xsl:apply-templates select="title" />
    </xsl:when>
    <xsl:when test="@title">
     <xsl:element name="opt">
      <xsl:value-of select="@title" />
     </xsl:element>
    </xsl:when>
   </xsl:choose>
  </xsl:element>
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="/document//item/title">
  <xsl:element name="opt">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//ulist">
  <xsl:element name="env" use-attribute-sets="itemize">
   <xsl:apply-templates select="item" />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document//dlist">
  <xsl:element name="env" use-attribute-sets="description">
   <xsl:apply-templates select="item" />
  </xsl:element>
 </xsl:template>

 <xsl:template match="/document/appendix">
  <xsl:element name="env" use-attribute-sets="appendix">
   <xsl:apply-templates />
  </xsl:element>
 </xsl:template>

</xsl:stylesheet>
