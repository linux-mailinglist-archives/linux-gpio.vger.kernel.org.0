Return-Path: <linux-gpio+bounces-28676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707EC6AA01
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C0D27366FC2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404AC3730D2;
	Tue, 18 Nov 2025 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="H+xJZCau"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5336CDE5;
	Tue, 18 Nov 2025 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482830; cv=fail; b=ei3adiIJBfJLA5vrU/3nAT33b7sfNqg6NQHzQipd2oR0MumUoRjvnyxrIWivlWkk6nEE2jt+v8jzmGwdaQ0OhZupqf9SvJqyfEq8NPNUw3RBTsqEhw4/Kd4FH35abgAMA06QZrE+8yhY0VJz3KK8cIya0BzSz5CRs7emvhyNZl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482830; c=relaxed/simple;
	bh=wbAZfs4A6aF0Tl/9yirNaZq0vog0UooWbecUMqbKtJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sr2BB/NVzcAtoCHLwOV8WyylNNyKJslxiKpeJw+8drVmFSc2ftjFFXOuSEdVgS3JwmJFZ7r8QGqrSh6DpqoJLgaoYyvfae0hJyBgXWCGLAI94eOxPiGiMW/rxRbXAlYpdRDmQHvj2zFcb6bUly+fQM+Hz0guFyfc9igBLBf5Ybk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=H+xJZCau; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG5gBh083289;
	Tue, 18 Nov 2025 17:20:01 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub8vfp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikNhiQnvSZW864Afogw3a8abg0eIvaXc5ecrsuspGV0PPbIuyJn8McColJ0TvMTIfPFOMwFhph2qthn/N2px1MmHf3rnNXz2tDFc5/8QkHM4S1tSYKQixaUE7QdVYC/ai5L8oUcnBT2dJlQxrV0Vmdu/lra3RerY8xcW0ppTZ13+1FAkz2h7LfOygnEV43rfbIhGm55I4UK+rTEbRI7+i9+JK25U0O2OAUdlryucOqeR1gWtrjXRNCrg3wp1PslKZ5mJLnlC16+ERvK7zoQq8lp7ehbj7mv1/vx3/OTJKaBqthrdFl1wPV8FZpNCwaXSde761R1KrEoGHn5EfghM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GLIcFyx9EhIETWM64wPPTQl/MMkvmKG/BPvLBEq16M=;
 b=jJnRJ00W4V81kd1of+f/LRcmd3TAAK9qAQCWucuKdoU/PIrrbAFu/w7jFa9gj6Pr0D+z/UImoCAepVB7LDAiBQexaDDvClfYMCo+Z+3E8HKpXScUS+4G9vtVYoms4QO5trd13Y2iR6mlfjMvoKEXnMpjGrE9HMoZFPql80YXKrzE5N2AC2ZHfn8VrEaoNBstUCDNwwtFAsGPoaJg80w2QqD8W7wYyRKF/YFM/Gms3jlUzfldbUvawO0/FaZe37Nr7VeUX2YRQsvVQaEhY/dNtEnMMhOM1talIAREM6ZCpScxd0qvxVH4KII4l9NVsDro8NfW+3oYfwrjCu0ysKb7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GLIcFyx9EhIETWM64wPPTQl/MMkvmKG/BPvLBEq16M=;
 b=H+xJZCauHxAvnhSEl0+e6ITo9OQe+iNaQrXPMWEV8EKltdN+53atWjPPL+5PHnBqdM4JuXbcb0NIRaiz45H97cQ5rFrX+gioMo0TfSOV8zrqPQi66U4CgWyvbAL599oONYjqfkzu00LMal1q5QgQ2cPI8QA2RlOEM5Mu5qpoUgE3AOZcVvCy6I+wKawXXX9A/h1NmN5LUoEI8Vj+usd9ZmTysqOq+J2brxvs+IrCFT9uYUnwr3sCh30GUU70Mpl4mSGgNzt2GAdTlQqgu7lMcwiVal5BnD+szyThj5lCwRunfH+gRTl4eP1/MGoO05igoGF1vHizbsIUL9Nw+9HpoA==
Received: from DU2PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:10:232::23)
 by DB8PR10MB3546.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:19:59 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::4a) by DU2PR04CA0078.outlook.office365.com
 (2603:10a6:10:232::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:05 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:50 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>
Subject: [PATCH v2 11/15] arm64: dts: st: add interrupt to optee node on stm32mp21
Date: Tue, 18 Nov 2025 17:19:32 +0100
Message-ID: <20251118161936.1085477-12-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|DB8PR10MB3546:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8438ab-0878-4e1c-84f0-08de26be51fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3QEBNh18Z3LgwvJUwKoqo/ODMjPcqlJ8qjWIm6vQZxBZzx849IzpkH7xoU3H?=
 =?us-ascii?Q?dQG61LR/zIkz8X6ZxG2bzuMlEwj30WGdU+oQ67yaoSkXZHTf/cQNWqTQFKrM?=
 =?us-ascii?Q?gG+d1G4krkDmzeBFnAtwCexPaba1Hh2Usylvbm+TJH0B6klJdIX1gqNgvD1S?=
 =?us-ascii?Q?P0UC45+PkF1WDXfaC3mltqdRjG0wMXBNQ+ruDodJxki45GFe4S0zWtYCz5xw?=
 =?us-ascii?Q?TPTFaifVTFBRRBJtbasQ6ZzgEcidtqSTr/GneMIcuZrLElTAUGQLpPlZIVdP?=
 =?us-ascii?Q?tfphQ3RiuYyTOK9TrpMX5XXKueFUbSzrUGGPtnI6BwyKAQaWszkDtT+RVFJD?=
 =?us-ascii?Q?EcmzbmtkaTgs5VL48m0z63y+wAUSRPDKz+s8YlQ3mXvlOAepLGWK0D5lAv+R?=
 =?us-ascii?Q?UUKWC/fTBIX/RzORknuWmu+zqa7Zjc9Hp1eZLHfSMPeBazePzJ+jpMX4SG2K?=
 =?us-ascii?Q?kdcXpb0kr9y9hZLofl1KY8QtPoVD8TGj3723cMOwufgeRgiVVSohvg+huJDG?=
 =?us-ascii?Q?Z12R8k1HNLU13XSAnpeQRqxKtd+Gb3EXHu2XrYg2O4LsM8bu56PH0T9g2bgQ?=
 =?us-ascii?Q?iYxf6qKiuOWG92VGDyKPefnyFTsrQQqfK/Su0vfbxVSJNsfsEIUl+oCa6Yv+?=
 =?us-ascii?Q?9mvHqq+KJzn3Dp++dPh8FFJ7TBUVqjLG7UUMFWBYMkTXah4g1o+nTWKXKzes?=
 =?us-ascii?Q?c/63JIGn+FQe6gRdcqxVIrV2ocHAMXDl+3mcLjYMoesIMe3ho0trUOLqKeUZ?=
 =?us-ascii?Q?biNAIQTSiswDu5PKXgQU0X3yPTPqyetarJ149HEuo1uGoz4eyJ8GQkpwJ0Bq?=
 =?us-ascii?Q?PxOs02UPvA9ggtMhSM8mGuFDKMaBXMCfoXIHXgZpa2MXzP9wnFZ6ipkfEFU/?=
 =?us-ascii?Q?PAW73bxOstdn780sK8tZCANVBW0PDddN/4hnkK1m3l1ljVJkV6AHLrtmg85E?=
 =?us-ascii?Q?BxqbCe9/r14Np+y7Q4V/r+/Q9L9gL/DgG+XW/BKbakWwA/R8RerGM8X1P6kz?=
 =?us-ascii?Q?omd7h7JUf7eYuEI4H80tHaxOvLL8swCph5sqgCzuhDc03Tfx6rK+mXDb7h8N?=
 =?us-ascii?Q?8F2GcFSU2uqkq+oYTcowajzlUjWkD5qJvYDPaubgbqaeA7Wjk98jCTrswONa?=
 =?us-ascii?Q?nl/N7u3HK8eqsmF8RbuBwoyQ9WvBbUpXPhg8hosEN19xhTeNZk4wC5PmrSSZ?=
 =?us-ascii?Q?bJhg+HNOPReR36Ewlp9oQ3tDpdrboPNh7KeplzI1Z9Ml6SXzJweRvU791J5L?=
 =?us-ascii?Q?kI3Pye+Bb+/XTwRIEci3EpctWFUSlzYRwJQL2wZVj0+u1PxyT6HRIke1USEU?=
 =?us-ascii?Q?urF/8dhBoI0jXx58FnCiEW7p/ApNlZi5OekKoPeO4VGBM2Svhdx6qcfGXZZw?=
 =?us-ascii?Q?qmAy7dOTRkWPwFjzg74Lu6dK0sArIM3W5o5SCeOEuf+xqaI+WaTS1GifdMtb?=
 =?us-ascii?Q?O5B7nVdpQVkUDsPxdY66gAtYkANC2gB46HcQOiFZctgmoxXaPNNc10N0JTy/?=
 =?us-ascii?Q?FpHzO1+BoaLj6cQC1avwcHdcXAhwwOsxcixbY2fL6YYSryxfL+4EvhdaMIZH?=
 =?us-ascii?Q?GmsUUzfdcslI7Bdobrk=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:59.3131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8438ab-0878-4e1c-84f0-08de26be51fc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3546
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691c9cb1 cx=c_pps
 a=ONFZitE3lwABM3c1Gptufw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=iQRJ_PghLySHL8lwOgMA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 82L7NIdpa9lSN2Plq_QcnLetUphglcQC
X-Proofpoint-GUID: 82L7NIdpa9lSN2Plq_QcnLetUphglcQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfXwhZID+mwjJJD
 aaMdeOPPgxFf65czmZ7URAhsfGU3VMGhTUZhJ54YYHD+maagBKe4jfppNfbfF3uLs1eilShBLbN
 gYElcDFmtLrzI3tSFe89+IsCYsHSBZvkq7K9HD+mUxYugnn6WCgvIV6UYx9smaT/FJHc2NYCnT6
 xFBkaCiqAn3pxfgIvd1jHavJkCv/DkdUAOC/KkVUf5yeHBqW2KgykuomUvvtBhoDs2jpzhzdGVU
 oHCxPbdrTk7FrGFMDrb4KraoGYL35deBGQFeJ3Lc3ti703+1V8ihKR0voAxMj8hZs9ZbaSjDIpN
 XKNvSWlLtc5Pe2LTBRTEuzzt8kot9YyKWuKGnl32V5BHvnTmMaJXnU+SbYooZIVYN1ylHOjfE35
 Yl94N8v9GBSdnQUa75MMldGKESuOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

To allow accessing clocks and reset through SCMI, provide the
interrupt property to the optee node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index bf888d60cd4f0..1f234c987dbca 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -50,6 +50,8 @@ firmware {
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		scmi: scmi {
-- 
2.34.1


