<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:sap.com:typesystem:b2b:116:asc-x12" xmlns:tns="urn:sap.com:typesystem:b2b:116:asc-x12" exclude-result-prefixes="tns" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:variable name="vPhaseEDI">
			<xsl:apply-templates mode="mEdiPreProc" select="//M_850"/>
		</xsl:variable>
		<xsl:apply-templates mode="mEdi" select="$vPhaseEDI"/>
	</xsl:template>
	<xsl:template match="node()" mode="mEdiPreProc">
		<xsl:choose>
			<xsl:when test="namespace-uri() =''">
				<xsl:element name="{local-name()}">
					<xsl:apply-templates mode="mEdiPreProc" select="@*|node()"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates mode="mEdiPreProc" select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="@*|comment()|processing-instruction()|text()" mode="mEdiPreProc" priority="1">
		<xsl:copy>
			<xsl:apply-templates mode="mEdiPreProc" select="@*|node()|comment()|processing-instruction()|text()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:S_ST" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_143 = '850'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_ST_gq_850'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:S_CUR" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_98 = 'BY'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_CUR_gq_BY'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:S_REF" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_128 = '11'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_11'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_128 = 'IK'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_IK'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_128 = 'IL'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_IL'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_128 = '8M'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_8M'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_128 = 'EV'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_EV'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_SAC" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_SAC/tns:D_248 = 'S'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_SAC_gq_S'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:S_ITD" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_336 = '01'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_ITD_gq_01'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_336 = '07'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_ITD_gq_07'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_336 = '20'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_ITD_gq_20'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:S_DTM" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_374 = '097'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_DTM_gq_097'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_374 = '999'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_DTM_gq_999'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N9" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_N9/tns:D_128 = 'BAI'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_N9_gq_BAI'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_N1/tns:D_98 = 'BY'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_N1_gq_BY'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:S_N1/tns:D_98 = 'VN'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_N1_gq_VN'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:S_N1/tns:D_98 = '40'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_N1_gq_40'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = 'BY']/tns:S_N1/tns:D_67" mode="mEdi">
		<xsl:choose>
			<xsl:when test="../tns:D_66 = 'ZZ'">
				<xsl:call-template name="Convert_pq_Node">
					<xsl:with-param name="pNodeName" select="'D_67_pq_ZZ'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = 'BY']/tns:S_REF" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_128 = '8M'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_8M'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_128 = '6P'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_REF_gq_6P'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = 'BY']/tns:S_PER" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_366 = 'BD'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_PER_gq_BD'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = 'VN']/tns:S_N1/tns:D_67" mode="mEdi">
		<xsl:choose>
			<xsl:when test="../tns:D_66 = 'ZZ'">
				<xsl:call-template name="Convert_pq_Node">
					<xsl:with-param name="pNodeName" select="'D_67_pq_ZZ'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = '40']/tns:S_N1/tns:D_67" mode="mEdi">
		<xsl:choose>
			<xsl:when test="../tns:D_66 = 'UL'">
				<xsl:call-template name="Convert_pq_Node">
					<xsl:with-param name="pNodeName" select="'D_67_pq_UL'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_N1[tns:S_N1/tns:D_98 = '40']/tns:S_N4/tns:D_310" mode="mEdi">
		<xsl:choose>
			<xsl:when test="../tns:D_309 = '34'">
				<xsl:call-template name="Convert_pq_Node">
					<xsl:with-param name="pNodeName" select="'D_310_pq_34'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:G_CTP" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_CTP/tns:D_236 = 'NET'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_CTP_gq_NET'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:S_MEA" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_738 = 'N'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_MEA_gq_N'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_738 = 'NV'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_MEA_gq_NV'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:D_738 = 'OTT'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_MEA_gq_OTT'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:G_PID" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_PID/tns:D_349 = 'F'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_PID_gq_F'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:G_SCH" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_SCH/tns:D_374 = '070'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_SCH_gq_070'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="./tns:S_SCH/tns:D_374 = '073'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_SCH_gq_073'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:G_N1" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:S_N1/tns:D_98 = '16'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'G_N1_gq_16'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_PO1/tns:G_N1[tns:S_N1/tns:D_98 = '16']/tns:S_N1/tns:D_67" mode="mEdi">
		<xsl:choose>
			<xsl:when test="../tns:D_66 = 'ZZ'">
				<xsl:call-template name="Convert_pq_Node">
					<xsl:with-param name="pNodeName" select="'D_67_pq_ZZ'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/tns:M_850/tns:G_CTT/tns:S_AMT" mode="mEdi">
		<xsl:choose>
			<xsl:when test="./tns:D_522 = 'NP'">
				<xsl:call-template name="Convert_gq_Node">
					<xsl:with-param name="pNodeName" select="'S_AMT_gq_NP'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="printAllNodes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Convert_gq_Node">
		<xsl:param name="pNodeName"/>
		<xsl:if test="$pNodeName != ''">
			<xsl:element name="{$pNodeName}">
				<xsl:apply-templates mode="mEdi" select="@*|node()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Convert_pq_Node">
		<xsl:param name="pNodeName"/>
		<xsl:if test="$pNodeName != ''">
			<xsl:element name="{$pNodeName}">
				<xsl:apply-templates mode="mEdi" select="@*|node()"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Convert_pq_Attr">
		<xsl:param name="pNodeName"/>
		<xsl:if test="$pNodeName != ''">
			<xsl:attribute name="{$pNodeName}"><xsl:value-of select="."/></xsl:attribute>
		</xsl:if>
	</xsl:template>
	<xsl:template match="@*|node()" mode="mEdi" name="printAllNodes">
		<xsl:copy>
			<xsl:apply-templates mode="mEdi" select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
