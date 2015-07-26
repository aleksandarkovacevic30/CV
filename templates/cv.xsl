<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="no" standalone="yes" indent="yes"/>
<xsl:template match="CV">
<html>
<head>
<xsl:call-template name="load_css"/>
<xsl:call-template name="load_scripts"/>
<title>Circulum Vitae</title>
</head>
<body>
<xsl:call-template name="CV"/>
</body>
</html>
</xsl:template>

<xsl:template name="load_css">

<link rel="stylesheet" href="templates/css/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="templates/css/main.css" type="text/css" />
<style>
table.cv {
width: 100%;
border-collapse: collapse;
}
.cvtitle{
padding-top:1em;
padding-left:2em;
font-size:1.5em;
}
.time.cv {
vertical-align:top;
width: 15%
}
.title.cv {
border-left:1px solid #000;
padding-left:1em;
padding-bottom:2em;
vertical-align:top;
width: 85%; /* Not necessary, since only 70% width remains */
}
.description.cv {
padding-left:1em;
font-style:italic;
font-size:90%;
width: 85%; /* Not necessary, since only 70% width remains */
}
.skill.skills{
font-size:85%;
font-weight:bold;
}
.description.skills{
font-size:75%;
font-style:italic;
}
.subtitle.inline{
font-size:78%;
font-style:italic;
}
div.inline { float:left; }
.break { clear:both; }
.clearTitle { padding-top:1em;
padding-bottom:1em;
}
#cvStart{
font-size:80%;
}
</style>
</xsl:template>

<xsl:template name="load_scripts">
<script type="text/javascript" src="templates/js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="templates/js/jquery-ui.js"></script>
<script type="text/javascript" src="templates/js/site.js"></script>	
<script>
$(document).ready(function (){
 $("#accordion").accordion({
   autoHeight: false,
   collapsible: true
});
 
});

</script>
</xsl:template>

<xsl:template name="CV">
  <div id="cvStart">
  <xsl:call-template name="createCVwrapper"/>
</div>
</xsl:template>

  <xsl:template name="createCVwrapper">
<div class="ui-accordion ui-widget ui-helper-reset ui-accordion-icons">
 <h3 class="ui-accordion-header ui-helper-reset ui-state-active ui-corner-top">
   <div class="cvtitle">Circulum Vitae</div></h3>
 <div id="first" class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active">
	<xsl:call-template name="Contact"/>
</div>
	<div id="accordion">
	<xsl:call-template name="Education"/>
	<xsl:call-template name="Experience"/>
<!--	<xsl:call-template name="Skills"/>-->

</div>

</div>  
  </xsl:template>
  <xsl:template name="Contact">
  <p>
	<table width="100%" class="cv">
		<tr>
			<td>
				<table>
					<tr>
						<td>Name:</td>
						<td><xsl:value-of select="Contact/Name"/></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><xsl:value-of select="Contact/Email"/></td>
					</tr>
				</table>
			</td>
			<td align="center">
				<img id="thumbs">
					<xsl:attribute name="src"><xsl:value-of select="Contact/Photo"/></xsl:attribute>
				</img>
			</td>
		</tr>
	</table>
  </p>
  
  </xsl:template>

<xsl:template name="Education">
 <h3><a href="#">Education</a></h3>
 <div>
<table class="cv">
<tbody>
<xsl:for-each select="//Education/event">
	<tr>
		<td class="time cv"><xsl:value-of select="startDate"/>-<xsl:value-of select="endDate"/></td>
		<td class="title cv">
		<xsl:if test="summary!=''"><xsl:value-of select="summary"/><br/></xsl:if>
		<xsl:value-of select="Place"/><br/>
		<xsl:if test="title!=''">Degree: <xsl:value-of select="title"/></xsl:if>
		</td>
	</tr>
</xsl:for-each>
</tbody>
</table>
</div>
</xsl:template>

<xsl:template name="Experience">
 <h3><a href="#">Work Experience</a></h3>
 <div>
<table class="cv">
<tbody>
<xsl:for-each select="//Experience/event">
<tr>
<td class="time cv"><xsl:value-of select="startDate"/>-<xsl:value-of select="endDate"/></td>
<td class="title cv"><xsl:value-of select="title"/> at <xsl:value-of select="Place"/>
  <div class="description cv"><xsl:value-of select="summary"/></div>
  </td>
<td/>
</tr>
</xsl:for-each>
</tbody>
</table>
</div>
</xsl:template>

<xsl:template name="Skills">
 <h3><a href="#">Skills</a></h3>
 <div>
<xsl:for-each select="//SkillCategoryOrder/Category">
<xsl:variable name="category" select="."/>
<div class="clearTitle"><xsl:value-of select="$category"/>:</div>
	<xsl:for-each select="//Skills/Skill[@Category=$category]">
		<div class="skills skill inline"> <xsl:value-of select="@Name"/> </div>
		<xsl:if test="@Level"><div class="skills description inline">(<xsl:value-of select="@Level"/>),</div></xsl:if>
		<xsl:if test="not(@Level)"><div class="skills description inline">, </div></xsl:if>
	</xsl:for-each>
<br/>
</xsl:for-each>
</div>
</xsl:template>

<xsl:template name="Awards">
 <h3><a href="#">Awards</a></h3>
 <div>
<table class="cv">
<tbody>
<xsl:for-each select="//Awards/event">
<tr>
<td class="time cv"><xsl:value-of select="startDate"/>-<xsl:value-of select="endDate"/></td>
<td class="title cv"><div class="description cv"><xsl:value-of select="summary"/></div>
  </td>
</tr>
</xsl:for-each>
</tbody>
</table>
 </div>
</xsl:template>


</xsl:stylesheet>


<!--
<div class="skills skill inline">C/C++,C#, Java 6</div><div class="skills description inline">(Expert)</div>
<div class="skills skill inline">, MATLAB</div><div class="skills description inline">(Expert)</div>
<div class="break"></div>
<div class="skills skill inline">Prolog</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, Asm86</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="skills skill inline">Perl</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, Python</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, LaTeX</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">Doxygen, JFlex, Java CUP, Subversion (SVN), GDB Debugger</div>
<div class="break"></div>
<div class="clearTitle">Web Development:</div>
<div class="skills skill inline">Spring Framework</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, Java 6 EE</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, PHP 4</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="skills skill inline">Javascript &amp; tools (jQuery, jQuery UI, ...)</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, CSS styling</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="skills skill inline">XSLT transformations</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, XSD,XML,WSDL</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="skills skill inline">Apache FOP</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, Apache Velocity Templates</div><div class="skills description inline">(Intermediate)</div>
<div class="skills skill inline">, WSO2 ESB</div><div class="skills description inline">(Intermediate)</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">Eclipse, IBM Rational Application Developer, ant, maven</div>
<div class="break"></div>
<div class="clearTitle">Embedded Networking Systems:</div>
<div class="break"></div>
<div class="inline subtitle">Hardware Platforms:</div>
<div class="skills skill inline">TelosB, MICA2, MICAz, BSNv2, Lego RCX/NXT</div>
<div class="break"></div>
<div class="inline subtitle">Programming:</div>
<div class="skills skill inline">TinyOS/NesC, MantisOS/C</div>
<div class="break"></div>
<div class="inline subtitle">Simulators:</div>
<div class="skills skill inline">TOSSIM, WSIM</div>
<div class="break"></div>
<div class="clearTitle">Wireless Technologies:</div>
<div class="skills skill inline">GSM, UMTS, IEEE 802.11, Bluetooth, IEEE 802.15.4</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">QUALNET simulator</div>
<div class="break"></div>
<div class="clearTitle">Hardware Proficiency</div>
<div class="inline subtitle">Measurement devices:</div>
<div class="skills skill inline">RF Spectrum Analyzer, Vector Signal Generator, RF Network Analyzer</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">R&amp;S ROMES Measurement Software</div>

<div class="break"></div>
<div class="clearTitle">Internet Technologies:</div>
<div class="skills skill inline">IP Application Layer Protocols (SNMP, SLP, HTTP), WS-* Specification</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">AdventNet Java SnmpAPI, Apache HTTP server, IBM Websphere server</div>
<div class="break"></div>

<div class="clearTitle">Databases</div>
<div class="break"></div>
<div class="inline subtitle">Programming:</div>
<div class="skills skill inline">SQL</div>
<div class="break"></div>
<div class="inline subtitle">Tools:</div>
<div class="skills skill inline">mySQL, ErWin, BpWin</div>
<div class="break"></div>
<div class="clearTitle">Operating Systems:</div>
<div class="skills skill inline">Linux, Windows</div>
<div class="break"></div>
<div class="inline subtitle">Scripting:</div>
<div class="skills skill inline">Bash (linux), Batch (windows)</div>
<div class="break"></div>
<div class="clearTitle">Miscellaneous:</div>
<div class="break"></div>
<div class="inline subtitle">Software:</div>
<div class="skills skill inline">MS Office (Word, Powerpoint, Excel, Visio, OneNote, Project), Adobe Photoshop</div>

</div>
 <h3><a href="#">Extracurricular Activities</a></h3>
 <div>
<table class="cv">
<tbody>
<tr>
<td class="time cv">Since 2008</td>
<td class="title cv">Learning acoustic and bass guitar.</td>
<td/>
</tr>
<tr>
<td class="time cv">2004-2006</td>
<td class="title cv">Attended school for latino and ballroom dance.
  <div class="description cv">Passed for gold category in the Dance Unity of Belgrade</div>
</td>
</tr>
<tr>
<td class="time cv">1991-1997,2000-2002</td>
<td class="title cv">Attended Music School, for violin and solo singing.
  <div class="description cv">Passed for gold category in the Dance Unity of Belgrade</div>
</td>
</tr>
<tr>
<td class="time cv">1997-2001</td>
<td class="title cv">Member of the greatest and most successful Serbian Academic Choir "Branko Krsmanovic," Belgrade.
  <div class="description cv">Performed at concerts in several European countries.</div>
</td>
</tr>
<tr>
<td class="time cv"></td>
<td class="title cv">Great interest in psychology, history, and music. Sports: basketball, squash and hiking.
</td>
</tr>
</tbody>
</table>
 </div>
 <h3><a href="#">Languages</a></h3>
 <div>
<table class="cv">
<tbody>
<tr>
<td class="time cv">Serbian:</td>
<td class="title cv">Mother Tongue</td>
<td/>
</tr>
<tr>
<td class="time cv">English:</td>
<td class="title cv">Fluent.</td>
</tr>
<tr>
<td class="time cv">German:</td>
<td class="title cv">Good Command.</td>
</tr>
<tr>
<td class="time cv">Dutch:</td>
<td class="title cv">Basic Understanding and Speaking.</td>
</tr>
<tr>
<td class="time cv">Russian:</td>
<td class="title cv">Basic Knowledge.</td>
</tr>

</tbody>
</table>
 </div> 
-->