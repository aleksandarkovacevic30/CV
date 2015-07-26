<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="no" standalone="yes" indent="yes"/>
<xsl:template match="CV">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
<!--	      <script src='https://code.jquery.com/jquery-1.9.1.min.js'/>-->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>Circulum Vitae</title>
		<link href="templates/css/cv_neat.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="page-wrap">
			<xsl:call-template name="contact"/>	
	        <div class="clear"></div><div class="space"></div>
			<xsl:call-template name="objective"/>	
		<div class="space"></div>
	        <div class="clear"></div>
			<xsl:call-template name="education">
			</xsl:call-template>	
			<xsl:call-template name="experience">
			</xsl:call-template>	
			<div class="page-break"/>
			<xsl:call-template name="skills">
			</xsl:call-template>	
			<xsl:call-template name="lang">
			</xsl:call-template>
			<xsl:call-template name="awards">
			</xsl:call-template>	
			<xsl:call-template name="activities">
			</xsl:call-template>
		</div>
	</body>
	</html>
</xsl:template>
<xsl:template name="contact">
        <img id="pic">
		<xsl:attribute name="alt">Photo of <xsl:value-of select="Contact/Name"/></xsl:attribute>
		<xsl:attribute name="src"><xsl:value-of select="Contact/Photo"/></xsl:attribute>
		</img>
        <div id="contact-info" class="vcard">
            <!-- Microformats! -->
            <h1 class="fn"><xsl:value-of select="Contact/Name"/></h1>
            <p class="header">
                <div class="label">Email: <a class="value">
				<xsl:attribute name="href">mailto:<xsl:value-of select='Contact/Email'/></xsl:attribute>
				<xsl:value-of select='Contact/Email'/></a></div>
                 <div class="label">Url: <a class="value">
				<xsl:attribute name="href">http://<xsl:value-of select='Contact/www'/></xsl:attribute>
				<xsl:value-of select='Contact/www'/></a></div>

            </p>
        </div>
</xsl:template>
<xsl:template name="objective">
        <div id="objective">
            <p><xsl:value-of select="Objective"/></p>
        </div>
</xsl:template>
<xsl:template name="education">
       <h2 class="fn">Education</h2>
       <dl>
            <dd class="space"></dd>
	<xsl:for-each select="Education/event">
<dt>
    		<xsl:value-of select="startDate"/>
    <xsl:if test="endDate!=''"> - <xsl:value-of select="endDate"/></xsl:if>
</dt>
		<dd>
		<h2><a target="_blank">
<xsl:attribute name="href"><xsl:value-of select="Url"/></xsl:attribute><xsl:value-of select="Place"/></a></h2>
		<p>
		<xsl:if test="title!=''"><strong>Degree:</strong><xsl:value-of select="title"/><br/></xsl:if>
		<xsl:if test="summary!=''"><i><xsl:value-of select="summary"/></i></xsl:if>
		</p>
		</dd>
		<dd class="clear"></dd>
</xsl:for-each>
		<dd class="space"></dd>
		</dl>
</xsl:template>
<xsl:template name="experience">
       <h2 class="fn">Experience</h2>
       <dl>
            <dd class="space"></dd>
	<xsl:for-each select="Experience/event">
		<dt><xsl:value-of select="startDate"/> - <xsl:value-of select="endDate"/></dt>
		<dd>
		<h2><div class="experienceplace"><a target="_blank">
<xsl:attribute name="href"><xsl:value-of select="Url"/></xsl:attribute>
<xsl:value-of select="Place"/></a>,</div><div class="experiencelocation"><xsl:value-of select="Location"/></div></h2>
		<p>
		<xsl:if test="title!=''"><strong>Position: </strong> <xsl:value-of select="title"/><br/></xsl:if>


<!-- here put skills in!-->
		

		<xsl:if test="summary!=''"><a class="summary" href="#">
			<xsl:attribute name="onclick">$('#<xsl:value-of select="id"/>').toggle();return false;</xsl:attribute>
			Summary
			</a><div class="summary">
			<xsl:attribute name="id"><xsl:value-of select="id"/></xsl:attribute>
			<xsl:value-of select="summary"/></div></xsl:if>
<br/>
<xsl:variable name="id" select="id"/>
<xsl:for-each select="//Skills/Category">
	<xsl:variable name="i" select="position()" />
	<xsl:for-each select="Skill">
			<xsl:for-each select="usedIn">
<!--			<xsl:variable name="$usedIn" select="text()"/>-->
				<xsl:variable name="usedInVar" select="text()" />
				<xsl:if test="$usedInVar = $id">
		        <div>
				    <xsl:attribute name="class">skill post-it small color-<xsl:value-of select="$i"/></xsl:attribute>
			  		<xsl:call-template name="skill">
					    <xsl:with-param name="skillName" select="../@Name"/>
			    		<xsl:with-param name="skillUrl" select="../@Url"/>
					    <xsl:with-param name="skillComment" select="../@Comment"/>
					</xsl:call-template>
				</div>
				<xsl:if test="@newLine"><div class="space1"/></xsl:if>
				</xsl:if>
			</xsl:for-each>
	</xsl:for-each>
</xsl:for-each>
</p>	
<div class="space5"/>
		</dd>
		<dd class="clear"></dd>
</xsl:for-each>
		<dd class="space"></dd>
		</dl>
</xsl:template>

<xsl:template name="skills">
  <h2 class="fn">Skills</h2>
<xsl:for-each select="Skills/Category">
	<xsl:variable name="i" select="position()" />
<div class="space5"/>
  <h3><xsl:value-of select="@name"/></h3>
<div class="space1"/>
<div class="categorySkillLine">
<xsl:for-each select="Skill">
              <div>
    <xsl:attribute name="class">skill post-it normal color-<xsl:value-of select="$i"/></xsl:attribute>              	
  <xsl:call-template name="skill">
    <xsl:with-param name="skillName" select="@Name"/>
    <xsl:with-param name="skillUrl" select="@Url"/>
    <xsl:with-param name="skillComment" select="@Comment"/>
  </xsl:call-template>
<xsl:if test="position() != last()" >,</xsl:if>
</div>
<xsl:if test="@newLine"><div class="space1"/></xsl:if>
</xsl:for-each>
</div>
</xsl:for-each>
<div class="space10"/>
<div class="space10"/>
</xsl:template>

<xsl:template name="skill">
<xsl:param name="skillName"/>
<xsl:param name="skillUrl"/>
<xsl:param name="skillComment"/>
    <xsl:attribute name="tooltip"><xsl:value-of select="$skillComment"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="$skillUrl">
	  <a target="_blank">
	  <xsl:attribute name="href"><xsl:value-of select="$skillUrl"/></xsl:attribute>
	  <xsl:value-of select="$skillName"/></a>
      </xsl:when>
      <xsl:otherwise>
	  <xsl:value-of select="$skillName"/>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="awards">
       <h2 class="fn">Awards</h2>
       <dl>
            <dd class="space"></dd>
	<xsl:for-each select="Awards/event">
		<dt><xsl:value-of select="startDate"/> - <xsl:value-of select="endDate"/></dt>
		<dd>
		<xsl:value-of select="summary"/>
		</dd>
		<dd class="clear"></dd>
</xsl:for-each>
		<dd class="space"></dd>
		</dl>
</xsl:template>

<xsl:template name="lang">
       <h2 class="fn">Languages</h2>
	<xsl:for-each select="Languages/Language">
<div class="language"><div class="name"><xsl:value-of select="."/></div><div class="level">(<xsl:value-of select="@level"/>)</div></div>
</xsl:for-each>
<div class="space10"/>
</xsl:template>

<xsl:template name="activities">
       <h2 class="fn">Activities</h2>
	<xsl:for-each select="Activities/event">
	<div class="activities">- <xsl:value-of select="summary"/></div>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>