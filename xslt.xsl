<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document">
	<xsl:template match="wkdoc:document">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="content" 
				page-width="397mm" 
				page-height="210mm"
				margin="3mm">
					<fo:region-body/>
				</fo:simple-page-master>
			</fo:layout-master-set>				
			
			<fo:page-sequence master-reference="content">
				<fo:flow flow-name="xsl-region-body">
					<fo:block
					font-weight="bold"
					font-size="14px"
					margin-bottom="1.5%">
						<xsl:value-of select="heading"/>
					</fo:block>
					<fo:block
					font-size="11px">
						<xsl:value-of select="wkdoc:level/para"/>
					</fo:block>	
					<fo:block
					font-weight="bold"
					margin-top="1%"
					margin-bottom="1%"
					font-size="11px">
						<xsl:for-each select="wkdoc:level/para/bold">
							<fo:block
							margin-top="1%"
							margin-bottom="1%"
							font-size="11px">
								<xsl:value-of select="."/>
							</fo:block>	
						</xsl:for-each>						
					</fo:block>
					<fo:block
					font-style="italic"
					margin-top="1%"
					margin-bottom="1%"
					font-size="10px">
						<xsl:value-of select="wkdoc:level/para/italic"/>
					</fo:block>	
					<fo:block
					font-weight="bold"
					margin-top="1.5%"
					font-size="12px">
						<xsl:value-of select="wkdoc:level/wkdoc:level/h1/bold"/>
					</fo:block>	
					<xsl:for-each select="wkdoc:level/wkdoc:level/para">
						<fo:block
						margin-top="0.3%"
						font-size="10px">
							<xsl:value-of select="."/>
						</fo:block>
					</xsl:for-each>
					<xsl:for-each select="wkdoc:level/wkdoc:level/block-quote">
						<fo:block
						font-weight="bold"
						font-style="italic"
						margin-bottom="0.8%"
						font-size="10px"
						margin-left="3%">
							<xsl:value-of select="para/italic/bold"/>
						</fo:block>
						<xsl:call-template name="list"/>
					</xsl:for-each>"
				</fo:flow>
			</fo:page-sequence>
		</fo:root> 
	</xsl:template>
	
	<xsl:template name="list">
		<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<xsl:for-each select="unordered-list/list-item">
				<fo:block
				font-style="italic"
				margin-left="6%"
				font-size="10px"
				margin-bottom="0.4%"
				margin-top="0.4%">
					<xsl:value-of select="para/italic"/>
				</fo:block>
				<xsl:for-each select="note/para/italic">
					<fo:block
					background-color="#f4f4f4"
					padding-top="3%"
					padding-bottom="2%"
					margin-top="1.1%"
					margin-bottom="1.1%"
					margin-left="6%"
					border="solid grey 0.3mm"
					font-size="10px">
						<xsl:value-of select="."/>
					</fo:block>
				</xsl:for-each>
				<xsl:for-each select="unordered-list/list-item">
					<fo:block
					font-style="italic"
					margin-left="9%"
					font-size="10px"
					margin-bottom="0.4%"
					margin-top="0.4%">
						<xsl:value-of select="para/italic"/>
					</fo:block>
					<xsl:for-each select="note/para/italic">
						<fo:block
						background-color="#f4f4f4"
						padding-top="2%"
						padding-bottom="1%"
						margin-top="2%"
						margin-bottom="0.5%"
						margin-left="9%"
						border="solid grey 0.3mm"
						font-size="10px">
							<xsl:value-of select="."/>
						</fo:block>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>		