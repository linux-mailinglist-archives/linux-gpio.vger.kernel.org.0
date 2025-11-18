Return-Path: <linux-gpio+bounces-28685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B220FC6ADC9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B1DD3A31A4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3FC3A1D14;
	Tue, 18 Nov 2025 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OehbFg3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB2393DED;
	Tue, 18 Nov 2025 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485551; cv=fail; b=GEakrr6V/qHtYmC+S9s5hKRDrlOgdeIsmoYJ3hBw2dz8ZwTJKr8ihFLXYTBblFxMSaaJh2HXENscBiZRAfo4+s5IivilMb2LVTZ+hVsE5KEpMbgvLmTNfO9Tcoxlc62nSaIpffxinHnrxLzSsZeJTdjlWKCKGjcC6vivwtwvXn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485551; c=relaxed/simple;
	bh=cUkLuiWHQVPDHPdhHJkvf3LsDaMk4z4DYS5yFH/uRHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4rKBpjUZNez+1G7bcUCr2GAEJXMeg+KWjqP7z84j2Kh3EbQiMSp0f47yUzMohg1TrN/gd+CWPa8SPlZLuqNzZJGOygrrlPQl8LKWz+N2hM201UQWP41SrxUa8nij/QgcbgVWpSMg2QOplRKicZzJfCPQ3ph4sFKD+Al7WQBGFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OehbFg3l; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH3uS9225955;
	Tue, 18 Nov 2025 18:05:19 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrauhjqd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/2WXcyNGgs0ZByqtuPtNl2sFLuU7TgzUxkf47qbV8wWpLPgTNgWC12akst2FQhrjvCNMrBC4IB+rByCmnee9YdoCAdxuixlld476FPRsQgfiJ95Ct9yXO/fjhLy+WFaFnFCPufeBH81keHRdL42TIN4p0Iku9Aqdf2ZbOPB29kijJg14tgrKEZOv0OF0tOUeMn6OPhZiidHAU3Qkd+pQpeQbSVKMRHLTTtBl1QPZNSNWlXrAJ8AobTPZR2sf+P4eR5c82WoP/VJINDT4ok/VG6UwTMWrrrNkpWc3c+9540uPBwm4Ge+gctYN//sw8FIeKE3yEi0PMxEb3NVGe9j2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euu3M7M2nuSQHMlapipBsLk7Y5OQLzSea0fTMCee/8g=;
 b=DkOCA+uh26ZFu9NU7hSfA4Cc9E7p+Iz76I8qiuyZsilffljXerK0W+J6po0t9DZka3JbtS3QD7x6YX3tJJ9TOZpv9D0ZjpLYdVmn5mnmKsUDZ0gxfXutYDe9US4WgNUJJc8P5jFjf6LfP4weVVG8uA2k+LPklYXjxNWtaBpRiGbg5yURPjh0lPNI/ck9rSu8oeX6YZLVZtODsKCFxXYBxqNu394Ycjt5fR/HYb2MPIuEKYOpsQvIMx/TCn399RqKZNBujFS5vLKPgi5ORJ0P9OxwpeXPy3ZYoi5atQzf3Ye1U8rqS3dIx54jKlOkeHmcXbcqBtixOAdPVx909dz80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euu3M7M2nuSQHMlapipBsLk7Y5OQLzSea0fTMCee/8g=;
 b=OehbFg3leFn5rvgFNPOwDKoTUIQmru0bXkzihqpb2Ca3ZbQK5WR0QrPlwL3ZkmkTr0A0imA0EP/Pg+uSdefj23h2BsmKG0Xc/Fqa1Le89tAsbCGjeCcPvwmxZSWt7c5wwxs/OAsyBlmFsWkZEFhrCboZcChB0t8xTcydf3YSq/eQsEb8v3Rw7uEqF+u1lfgfoUTMqm7zjjatrckhXtU1Cjz8ra3LB31L5OOiwat+gDY4pCCdMB/1OBobJcnBfrxiZVscPGXVDAqfgi5A/ZI/QD+Hf27RDRjDXO2rRQCXJtxMrFXgIJqNpfg8idfqtxHEL3fyL1199Et/3FJMkR61rw==
Received: from AS9PR05CA0332.eurprd05.prod.outlook.com (2603:10a6:20b:490::24)
 by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 17:05:14 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::92) by AS9PR05CA0332.outlook.office365.com
 (2603:10a6:20b:490::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 17:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:18 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:53 +0100
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
Subject: [PATCH v2 14/15] arm64: dts: st: add pinctrl to usart2 on stm32mp215f-dk board
Date: Tue, 18 Nov 2025 17:19:35 +0100
Message-ID: <20251118161936.1085477-15-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|VI1PR10MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa06a05-e748-4925-8bed-08de26c4a3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SWz8Z7T3aw9ZlX1UA4x0WjA/Kb0E3bkPlVxLBUA+CdBql1KBYNO9xLThhLYd?=
 =?us-ascii?Q?k5ZS96qZPZ+9Lix6ii5NhThddTRmHgj9cGlPT30VFCHNvvM6vKru5VAJGe77?=
 =?us-ascii?Q?4iiDMH25b+Aq4YnBiABO/U1JobQLvOglFtor969e0CseFkaibK+Cp6uCfv5g?=
 =?us-ascii?Q?ZRJc4AROIJGvd+SWzX6Jbd0sW/HGNMl2ViHiOb0x5mTSVp0soANT7Iv7ozpd?=
 =?us-ascii?Q?ad0ZaCYUiD1WQFGoApH7TdbUuFRFZ5rpp8tsKUCO+kqAqrecvi40CPfNWswi?=
 =?us-ascii?Q?KrAAVa2X7o8CQa/pz2QV5LbQjTgEqVvLANa/UMRYGXqHxrQwtJ7H1YAXPTJH?=
 =?us-ascii?Q?pUIXb96Gw2Ue4iJVWrUiQa2SYo00FiFcuU3SWYICiq6HLBTa2OPP3ffPDNXt?=
 =?us-ascii?Q?6BK6b5CDvFu9FlGf+amVyA/lQ6vqrt0xj3gsy1Vxz9TqE1s1BjlyRTFm5NpN?=
 =?us-ascii?Q?iHhAgFrEa6+3BPxAZa8k9VXBR4SCnhLIerlLeJakEuMATcq3WFB3XCkb14xS?=
 =?us-ascii?Q?AYiiB4m5xPK+eu1SW0sLNciGY1p+aeT76/vloyQUMZXFjzURxadDJbX7jRR6?=
 =?us-ascii?Q?EMl/wQdBDIJXFdni76QHgCN8t/6FHJEEhW4TWENbsp0haqUWaYGc/8xxMld/?=
 =?us-ascii?Q?tTwitav3nwBsFz1Sh+/oJsEH76qFatm0ktW+NO9UxUbCEAbdc1DD0LZr0J7q?=
 =?us-ascii?Q?NCMNweigxZQyYY95VHaAPyowzhM2IgjFBaYJex/Ct3c2MA3OgrDy1c//UGnJ?=
 =?us-ascii?Q?p7gH8rOuUKeqT/8FerGW4BH/n34QUEjqKrZy+iu4Sz9w7UU0V6uDNykjkVKo?=
 =?us-ascii?Q?ibEoXwe7AYHX5QPn8tpStfo1oxdxu6iT+p7ck3rzrvFr8IN4A1lr/NvGZnn9?=
 =?us-ascii?Q?y5+cRGXvhcnSEodZqEk4+esyDGOt22P9r3oUfK1CynPI5unUvQGK2eN66mQH?=
 =?us-ascii?Q?CcZ/w6ci8EMuR3enXEeStYnijB7NaAtgZGszm0TiPhDJgTovbB2a1M3tuKHX?=
 =?us-ascii?Q?MnjkSw5F2qM4VSXJ6HyQlQTiY6Y/fKHFndgv0DDxA7Z7kgkr5yFCxUxOwPK9?=
 =?us-ascii?Q?ur0MkjCKdAPxqtU5UA1U4TZ8M47jfd/t3bqhI655Xl75Fbh7hNfJmPsOFNnu?=
 =?us-ascii?Q?JjLDN9tBaX0VNogn3qhOq8ZU5Acq+SfkR1KOWzQjLbFTLdURnGPl6H1XDoRL?=
 =?us-ascii?Q?SwdxI2hwyULAo2ETPzMUdf3XrO2XFtmlNR2cnamlBM7y+uwOtmqYNjDUHFE+?=
 =?us-ascii?Q?mnx+9Neuf72tY64wm8zBtPNEG54mEFfseYLkOzuK2axQH/+Ur9fxt4+tfCfP?=
 =?us-ascii?Q?iF+Cm24oOBDHPzxOWEyUAxKrnad/i41NdanUzh+iZ95yKo+iQpDkT46IZrgQ?=
 =?us-ascii?Q?AKyWXoBMjwooVg+hp6IQmJPb3mDFppUKNg2muSKqvFP7nYNrZdL5VVPp9oID?=
 =?us-ascii?Q?g4ze3gNFCO7p+DICSn59NQ8woEyCW3K8qO6Zn6+XiOIS0z+9xR0IqeOE2pvO?=
 =?us-ascii?Q?hLgfMGFCswfbBRshRt5IkclVPZvNaiDDtTw7V6/MJesqnE8Do8AkD+hdvJWU?=
 =?us-ascii?Q?nS0vrXtFE0k5Kl/+RjoABNPOU60gNOtmLzqkT3tc?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:13.7512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa06a05-e748-4925-8bed-08de26c4a3e4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3535
X-Authority-Analysis: v=2.4 cv=G5AR0tk5 c=1 sm=1 tr=0 ts=691ca74e cx=c_pps
 a=XXjA0IOz0xiR6FGrblNl1Q==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=EYZ0ZHZ9olU3vQRTPGYA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 7djrH9cwYTWHuulBzbX8Y1PtihD3BW06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfXwG/dS8yocc7E
 xioxiKXD+g5oBNtFG/scIs2U+g2Q2KoTRebKsh6gxloHDyvLOUEs2iBNObjaPbGoptdw7t9w6P4
 0l6bt19AOfAwo1lsBeBn7cN0IgEdM/rWsyIdl2YH1ObtsFIboapSLD/RYjFiW6Jjp0mCIXAi064
 OymQEOavui01F5Kuc3KduN8pX+iKrinmZ99nGjZzWvbZUhHef83M+c0B2YBinXyWisPRNtnZuCV
 bMBpwb24er/wVnysFv1cIzt5SYElipEzFV9v76ftw4qoezFg6tWj4SZqJlwHM//xzayKmUiz8Tz
 IHxTQkGZ0CvivVl7oLtYeIZEehp/46iAf89oWpQGotKCOl6mGmp7Jwejkk7ag7BSf6fBvNkxObm
 m67EofbPL54oqkdvsnTedRQOkXqVFw==
X-Proofpoint-GUID: 7djrH9cwYTWHuulBzbX8Y1PtihD3BW06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

Add the pinctrl properties to the existing node usart2 on the board
stm32mp215f-dk.
While there, add also the boot phase tags to usart2 node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi | 32 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     | 17 ++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
index 7e9b74f3d9d96..01d64a1f0760f 100644
--- a/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
@@ -4,3 +4,35 @@
  * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+&pinctrl {
+	usart2_pins_a: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, AF6)>; /* USART2_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_a: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>; /* USART2_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_a: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0fb..8571dcf427fc4 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -8,6 +8,8 @@
 
 #include "stm32mp215.dtsi"
 #include "stm32mp21xf.dtsi"
+#include "stm32mp21-pinctrl.dtsi"
+#include "stm32mp21xxan-pinctrl.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP215F-DK Discovery Board";
@@ -45,5 +47,20 @@ &arm_wdt {
 };
 
 &usart2 {
+	bootph-all;
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_idle_pins_a>;
+	pinctrl-2 = <&usart2_sleep_pins_a>;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
-- 
2.34.1


