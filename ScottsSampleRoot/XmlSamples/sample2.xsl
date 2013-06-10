<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <xsl:for-each select="Jobs/job">
    	<html><body>
			<!-- Start Resume Listing -->
			<h5><xsl:value-of select="Title"/> - <xsl:value-of select="Company"/> <span><xsl:value-of select="Dates"/> </span> </h5>
			<p>
				<ul>
					<xsl:apply-templates select="Experience"/>
				</ul>									
			</p>
		</body></html>
	</xsl:for-each>

</xsl:template>

<xsl:template match="/Experience/*">
	<xsl:for-each select="Accountibility">
		<li><xsl:value-of select="Accountibility"/></li>
	</xsl:for-each>
 </xsl:template>
 
</xsl:stylesheet>