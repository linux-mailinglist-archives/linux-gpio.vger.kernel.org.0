Return-Path: <linux-gpio+bounces-26164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A7B57B00
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33788188E766
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37282FE57C;
	Mon, 15 Sep 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KEupE9US"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5830EF8F;
	Mon, 15 Sep 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939110; cv=fail; b=e3DGhFYk1qkUrV1xnYRnLYUrWtujGBX6a5qOidO3FDcIzSd7XZWs3heG3ek7oK/yO1yVLxSi0vWvw11Cc7bzysr07fPXnxuo/riec6gjQ/RSATNiRsMcUO7ritWwx3qHdhdDzTsLRZd6jPo72w6agFHrGbxBtwQWy83d/FSmU5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939110; c=relaxed/simple;
	bh=OOuXCoKrU8xoKeDQCk/09XfRlS5RoVi+zsHikscKnaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzCQxmZudcr2IF1VWFTJcNdL8TwgxdAMcwWn0lckBhsWQDW9VCdWU536lPCDMOnEZcDEwpm2MfuxPcbiWkRi+cTymzxyrP/meWlOjG4IcNbyybxjHlMcr9kjVPO0YoavEwHzXGgj+MHrcW5SWofpqMcwyuufqzHVpVKkSgjkKhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KEupE9US; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqiGOK7VQVTEDDY0TIAuJ2Xi9ewM6aRJtEN49uYRuHKiTvOvesxbVYpF32TzTQhfoe99suPJuYhUoWYt1ZJMZ7U9DJHYzCNWBW7FfazwfBJEL/quWmJm2fXSBJO2B2PQZgXiRaqFfm33okBIqqBZ7XRVkFMj5nEAD70H3InqLJYxUtfj5tGHp3q+No3skCSKq/mh1BdnE/y0hT2kc3pvTeZB338EkAU1DfLDsC4nuGgkzrL3jEuWWGoSsd3VQDOJ/Zpf+RMxzyMvtMf42hCAFYa94M9ZRUnvE5Z9r0UJd5Pf7jFd5dBqvglArwFbt4JQ4r7gdruwbagd1h+XA2hXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2riljR6VKW7mHjqC6peXxjqgsOOpcsnaU2lwqmfT7qo=;
 b=sxefzfc45aqRj9CQAmQe4ORVCdNKES+6OicZmA4s3TKWsM28qV6NWU3xul5xj6VOq84boyUr3/CFZoi5DiNZa1/1sPqGWBqg3P3na+BrM8aCx3CcBsTkhInkXENTtR7ekiczYZ/C5ZLYXwGR+s6Q7c9RYwOqGaWUjXYHYnPpmuWDcgsJ0jrM/cdRHL0af+DjWe60cjEYKZA561GfPclSfdZ3l7A0p516MT4PYTiOeqTbRv4uSSUw/G5ia1VbfFknRfb5cJvxVCerspY4wOei78Fx3KQf7SpENGmWsIGhbEo/43QQ3EOa/JIZnyRIm12+w3/GnVUOdQeQEb5xrdAExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2riljR6VKW7mHjqC6peXxjqgsOOpcsnaU2lwqmfT7qo=;
 b=KEupE9USWrNLfcnHpIJOIhcGeZL3GBLASQl9+7XlEnUTc5aNezOjmknFGET038f92YT0m0PCCuNFCatcHLxlYWdX775APf/AzFL2jlv416UJz4VcddjO9zMpVHucVAEACrN33doGlHS0pQHEFioAzV//GA6HXuT64EKvVuWrQc9jtzmvR9jeTO5qfG0UCe0cjFJDUmMT+R/WydAK+d30IeamohJ+90knW9GPQieyMCbpQ+0lxbBtQ50ODudcoi8pVdzh2fUar3IhXAkvTkGPlm6etSV3Bx5MRRzJezuqnJjf9cr015hJ++GjmFt9+CbMAOnIUqGWXPV6RIzYEXkRzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:25:02 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:25:02 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 7/9] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Mon, 15 Sep 2025 15:23:52 +0300
Message-Id: <20250915122354.217720-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee35c14-6aae-4d06-0f70-08ddf452e4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CFRcvirEWOPbUVu5TZNOPiebVCfChfXH5gul4UxfcG5UOoFGnqZJ+9oYr/h+?=
 =?us-ascii?Q?CL35iBFv9okWbjPwSuFCiWjsHn4WwFb6u81lZzBjK9XVOmYHE4YaJS+99TwU?=
 =?us-ascii?Q?lqN8hpuoDzj+R5GVm/kyDfQSmbJeY/vbZNHvNsL1LVJPEwQ2vqoQiYsIZnbn?=
 =?us-ascii?Q?t000poTP+hSDz+Efby77wq2sDqZpANqN+t142q4D3Kd4suRmoAE3Xi7BHwU6?=
 =?us-ascii?Q?B+wx1kdQi/sZ7tRf0BewnchRMZjVg0hM0OnhH02JdKMdHPoyb/u3nTD7NQSq?=
 =?us-ascii?Q?W0F3mY4w5ejd1279Ek8eX+bCf/RZCjLzkf2MoUzcg3nK2AZiZ3wJ3FzpQETX?=
 =?us-ascii?Q?sGrcReZLaVLdJ7FfI6vPMuPWvKmPnbkZhG+7XUyJkFAnG/EJEIl5KVGl2rxo?=
 =?us-ascii?Q?nqBGQtiOL0l4ekTXiuVMjTvc1GOEEcPZZDybgePefJhdqal+y8Da8xMbsF9D?=
 =?us-ascii?Q?wooxfL0RmboU67Cx6SBNAV5vS0qxlOWt2LfJ02k3SppuKzxoCdnVtOPiDAm7?=
 =?us-ascii?Q?3irRoMEbHNnk32gDaNyRmkoswvL+iYZo9RmMU1qwmLuCgpfrlRUHBgEAfnNC?=
 =?us-ascii?Q?4gwpEi0QaCduZNxdhUVDfBHmcR35D61KgHJm5XtOt65AAnqy7uhhOiQAmyfi?=
 =?us-ascii?Q?cCL+GmQBxAJuTGwf5SvUqHCgdMY803P2NOskauS6QX7Tzqo/LljOBM1Yk0KT?=
 =?us-ascii?Q?RuZB4gjelqtbg51bFPo2LahewoD+Q+ym0JsknxstDdyJI0LJAVwI0AgOrdWY?=
 =?us-ascii?Q?Vq0IuOg/h47bpAwU+VAfX7C5sfI5rgSbraIKAiWNfIBTHmZd5kjGQlGqccVg?=
 =?us-ascii?Q?kmX5mSv/zlTJ+mrT/VjoIbs6mP9CgK+Z80IYRGMLz2jLKxDlIASgWlN0HGeR?=
 =?us-ascii?Q?jRuaOpUyHF4cHQ0kGafr8OWou4FnmBbG6vp2AJAg3QQYaTCyTwJIqMMU9SEs?=
 =?us-ascii?Q?j7SvFNI5YW/dafdpU4qXY2dNEE9QFAhg9JT0Q2JGK9yrjhiEgiu3CLILGdeD?=
 =?us-ascii?Q?ag9bnX3K71d7QFO6cWuksjHIG43rQDqeSMHHlOKp8IIPbLUYiKzM1NSZZhqv?=
 =?us-ascii?Q?Lriuq+hYmAqNORZ47PLzFREO8xVo/4G3+Fwzt20R8UQBoBvK3wQT0v3vg3j+?=
 =?us-ascii?Q?LL/6cnM2HH9yCprlck6t9OS3S3A2wzYB9SQ+58xKhhC3FpC6UUZkBZW7pgGX?=
 =?us-ascii?Q?q8VlGmifMPwr4LvcIfXuT6XrQPpVSIw2GqO3cVjMRJz8urW+Dh4p/LJk5sow?=
 =?us-ascii?Q?6ZO6we9U6FM+et2uOHFiD0/H/NNNJkJb/1TekKZMgZCV1SXTdIQxpBMBBjmR?=
 =?us-ascii?Q?jSpQTK1h3dmsVA95GVns2wnLOx3RapNoBJnWhbOuX5bijWTOcKuY+g306xCu?=
 =?us-ascii?Q?dluIO/eFThbicWhuJzoc3OstWHVrXCBDbJV+H+QwwWqgbDgEGa/tCWfMTNgi?=
 =?us-ascii?Q?mIJwWDLbUdjCSyDKNHDbQvKYI5ZchCJ99ZoNn8q9uuFwx4ABWJnQ/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xwNIVHmnRj56ULPDOWKn9NjuFiS/7gIntC4y0awzRuzpFlGvkTShJ62AMpH?=
 =?us-ascii?Q?VPdblWHh4R3eeSZ3H+5qbmYLKVxAdgSQ0TPfHwHxwuHZxXT0Sm5Xl/+sJMeo?=
 =?us-ascii?Q?+H0RMVIwJNzvVWi1vG2qq1gJNQGy3WFhBw0yU+s4kvaE/0oubfayDP55duRN?=
 =?us-ascii?Q?2bMFFzipIq+Q3oq09gT2nJNLBKCXFowZlHtQQW9Vu92WG5JSAjX/0Z0qG0vn?=
 =?us-ascii?Q?wlCrE0SuVbcYCyor1N18W30xGfkvaJB2JDEP4A3gF5Pr06k4B8lLGW1I52mv?=
 =?us-ascii?Q?FFfdeL0ZWoD0av9Y+Aw+mm/Rayn/dFxik9gUwBwBOb8RjFkFPcHycV/HF4Mt?=
 =?us-ascii?Q?IDTdy5UGd0grWgY+GobpOP1T9ZRbI3Gu1u0poZkcjRwGZOGTkaMvCpnh8MJE?=
 =?us-ascii?Q?fUWGninwHlsdE1Oh28q5lb7KUdvnhY8ubOCpfL2lNA5JVD54i9iYtyWNUu2R?=
 =?us-ascii?Q?4koReyeR7pLuNFd7fIeX9qsp+er09R5aYDk/w8ci2nxFPjsPnOhsvTlABU4i?=
 =?us-ascii?Q?0lrdii34VX8SBeKltIylR70x+HXa4MgXzFyEIRze8RezsUrcUSmvzTYho8vA?=
 =?us-ascii?Q?hQf2bNiJm/QEtp0NnziGluB3xNqvFtW5AFt/AOHlsxZdnnoHeEP6W6O69+Id?=
 =?us-ascii?Q?SZpnpVvAzDAHUAPrLfPFgU3rHxk/ygdNRFdUdOuRQurGVrMUQJY9di+irUED?=
 =?us-ascii?Q?atepPnR/zINJgyvVGPZ5udAa29dhfqQH2JspzKHx/ghFosrB+315M169/Kc1?=
 =?us-ascii?Q?Z9pA0P6MeReJWEtzH++GlEkFraOLadZJFQBrO0o3fgPaQSMG7UMxURt+1+8f?=
 =?us-ascii?Q?SJnsnS7kxmEQMWGjRZhgFc+ZBDwFUx5JeR9wA3Mn9D18xs5+bnG5+oNNCDwZ?=
 =?us-ascii?Q?v2GxmTzgVedVpobf750PkQw8bxf3YmjuS3poWj35UAr2IPBhPRA2Gljgl2VO?=
 =?us-ascii?Q?8uUBz0m31u0EhC/3jRjNNWtOHiIUoxlPQlnGbf5DP1IWstd3WMr7/gGUdcyX?=
 =?us-ascii?Q?s2pw2BAkSzHdGl/PPXEn3eNYH5KdKrxF3ArTL87UE/2lwdyh9sRw4jKWwiDO?=
 =?us-ascii?Q?1b+yfIm942thXDIjVd3HAGNy5VQriTRCm+o2q6mkoodM4u/IqJI7LO5M7MBZ?=
 =?us-ascii?Q?4V5QRE6iRJPITBp2Ooc8+e/6kNvqhDxNjnSobEs8+upcWVYzzGbyKM0qviow?=
 =?us-ascii?Q?7T2Axq0o8jQSp9sN4wpz1TjrgHx55Omck7uEleVjFDw+ZWluFnMg77xJKqXW?=
 =?us-ascii?Q?am5gfFEIiHovl32WyFANjRlI7N6VHW7AiG8tawNB4nWmHiARqVm8NTLX5k7c?=
 =?us-ascii?Q?4cU+xHVup8wFhKcmE0oujqmfcf7MaTIUiSbC2R9JemsuqFv1owHVP72VqNRP?=
 =?us-ascii?Q?ly5d/UdMVad2wpcuy6HDecqcDakUV+pO0GBQLr6n3JawFfkKpVO9xAhut6kV?=
 =?us-ascii?Q?tuoBxS/R72ExBHCW1bgOIE3c0GeE9lwWD5BG3C+GMwjG28pPGKGhZGre7or6?=
 =?us-ascii?Q?2RA88zj0pohzMF33bblhjQZuJtdSTX2DsrLLnmc6TzoYcamTnAsh+9r12pAL?=
 =?us-ascii?Q?oLBplGVjEAA99ydfOqmq3jvIP67pTrZo0EyTqe1u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee35c14-6aae-4d06-0f70-08ddf452e4c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:25:02.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtGVRozTjveREki37CmnzUpagiVry/q2z+yoY0gV3hNwMCNU6FVGVMWLvV/1DbTuEAAxIOfhJZRpHO9kVgmP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

The QIXIS FPGA node is extended so that it describes the GPIO controller
responsible for all the status presence lines on both SFP+ cages as well
as the IO SLOTs present on the board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none

 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 736722b58e77..64133e63da96 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -166,8 +166,20 @@ nand@1,0 {
 
 	fpga: board-control@2,0 {
 		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
 		reg = <0x2 0x0 0x0000100>;
 		ranges = <0 2 0 0x100>;
+
+		stat_pres2: gpio-stat-pres2@c {
+			compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2";
+			reg = <0xc 1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SLOT1", "SLOT2", "SLOT3", "SLOT4", "SLOT5", "SLOT6",
+				"SFP1_MOD_DEF", "SFP2_MOD_DEF";
+		};
 	};
 };
 
-- 
2.25.1


