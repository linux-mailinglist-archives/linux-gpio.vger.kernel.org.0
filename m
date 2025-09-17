Return-Path: <linux-gpio+bounces-26296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA76B7E5B3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8402D3B8305
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFC8331AEF;
	Wed, 17 Sep 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="koyIvbq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD6331ACE;
	Wed, 17 Sep 2025 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099915; cv=fail; b=affIGaUIPIBGc5uPIXjMLgKKfbysZEb0so3abUpVIoyf73oFvusDUtoYlJcIfCDKaubxqFwysVvLkizrFEYadrtHypEBxzzcrtqr8mGnuGG1CiqOl6v73izJqYxM35rM5V0RicJJSNYc1GLHj/RUCQFP7PZdHIhySwBxDCSIArM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099915; c=relaxed/simple;
	bh=KbQDEkikIuOdfDVYqEdxgxKeNEp9mGmbOn4lq/Ukr14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EFHtdOeq10DnWaqaubo80cHtUOtrLUiumwECLoxl8Pzq/rKRft0hkZBPaseutzP6jBAkbKm4fGPrYnTZR7ERjC0n0W+G2FVYf4gzh/QUY6FMX/wkFl0r5Xv8dNnJvGfbMnH5CAN28/9uOnCLXsoi1vmNboWxFs9H31HoVpyRrek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=koyIvbq5; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCmpqXlC226UnWoSqdvnmlaIrBiwF4JyLgzFnnjrzlImlPwwQti+uykExw1GzB0jr+VEJjgVuGDsQinMtH1sv3qmPVd6HSFCqyCbYisc/OPAbHABrxjnyHogJkMfdXd2LOZu82ICRv92OZt30ttw8TlceOS/fnNBpZQeP7Dg8A3dfuedXCV2lkJ5ZznxvrpF50M5pZrn39/pvUG1Wa5eWGgq3VGJQlNIz7C2eZKND0Kt+8VPwc3eX1J4DRFEsD0RhhZXxY/JuH1kURNOfJ57hm8NS9CvMoahs1ryFDcpRNB/UTr2myP9j4o3u65mabmhcVdUdjsR2cNcs8gvjjUg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9l1C67wjgaP3jaqEofu+MTY6FKNG3B0FR05/nb/90c=;
 b=F0HQXsSyDe/CyQHkyrYiG95PGGc9uQZj0fqptKojwxjQDgaNeBSOuLZdAL3UMMdG9ymwMICX8M3e2tVQlQI1kqaJyAUI4K3Yl67wgssMlAAw7KdHnPR5k1vt0EElkH14y4ju7hZD74tOGPDtXNia6aTNGJNwu0rV1A8WymW0lWApPsL0eYSAl4orMkJvoMd/ohzrO0tDbygphlynKRm1xswXaZXezPX32qu54oPGVsStL2KfSa4MF938L6eqQadXwHVML4D+P6Kp20uC2l5TmWGnhP9VaDghCQnGY/WIJvw1Aikdqu77IbBlG1EgsMpCEyOYkb7VrmbGnhktG5TJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9l1C67wjgaP3jaqEofu+MTY6FKNG3B0FR05/nb/90c=;
 b=koyIvbq5S43Mar6PxSW35HgnV0UuEgWGUAlEF60RVxkY00QeCNjpoFHuIxgnOBRRlAz6RDLZIxVFgXmICHrc6YzPv+Aichf6TcyqFERaAWZeBk9wilXXfwamOZ3iimmGyZLxHPkTsnjqUQIl69p5ed7gWZxQn+/ZynP/IUfPF2IsujUt9CnRcf0V414IpD0cMJdLgM4fOhqgtdFnLZhpBysixBO14Ld23Qpckd/iYu/DEJMO8H3zbfsjG134DSeGD2TE3DyNNstV2ntrqmZBd+WQSiPOhMl69tCA3mnNOd0qn3dclb/kludFma4yeYMrZCk+vN2jVmD12Fg7oHB2VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:08 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:08 +0000
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
Subject: [PATCH v3 09/10] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Wed, 17 Sep 2025 12:04:21 +0300
Message-Id: <20250917090422.870033-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::30) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9cd5e6-aac0-4521-c8f8-08ddf5c94cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mmYtfMNCOG0wb5BZbP2+fVNjmFg1tNmhaHQlbFvZeythrXDznm/4tp+q9Ztm?=
 =?us-ascii?Q?vC4RjoK/pRFpWZhFayO1go/ifEEXkqTVBiQ9ZKsUtlGMGEe5Tsule0JlW/LR?=
 =?us-ascii?Q?s6ZI0xc3JwOOVwzKuwL1TNdL4lrfF+Y+EVZLpgY375Od93KsBwtxWFUPpamq?=
 =?us-ascii?Q?r1Ie6QeK5h1pGoGCyQwRvWFSYCTSkUc4M50W18uDhMGi2+vJqHKWTDfEJ912?=
 =?us-ascii?Q?h6muN938sxat5nakbvKeiaXT03yYVAG+vltHvunb3Va+LRByhk9w0pbNoTBc?=
 =?us-ascii?Q?sHcSHCR79C0ynOmqztK3ea4tCY2JFAvP+QJY9jdH0XLy88hXr7P1O9uAq+EX?=
 =?us-ascii?Q?R1Hij8S94e1e4JlgBnOJMPw7dCrNatvhypOmydxkUl6plA73U+OuzxmgtGpm?=
 =?us-ascii?Q?hfBpb8IaFgS5a3c4zCtv+AYHSPe/jtweYhejw8+uWw0ZYxnECh55RSOeHEQV?=
 =?us-ascii?Q?tkDf5bJubyHMAJg7/94H/1cJf9Q63Z3Gn5Zqy8FkwROSyQHtPHSCk4TKEt54?=
 =?us-ascii?Q?WEN5HENJ8YJHscoKhj5qyNHtnmRHxoUC2sOeNqhWQpn0QpywTl/Rw8SAR8E4?=
 =?us-ascii?Q?kUraE1xI3b0NBMcaryvL0/4rO95hA5e5BX7kqpN+qRPbmnFbVdxzG46E5621?=
 =?us-ascii?Q?jwSYZ/cW0IoX33w6969ruBeUkIqsIbFS2vGRoZHGLTHTbkEJZpaX7n2lcudO?=
 =?us-ascii?Q?a1JUWe/ZfieWQFDwY730vgpA8wHdD5wuDc/onGIa/7jrDyF56B/TSCiup6PT?=
 =?us-ascii?Q?Op4U+GnFvBBjuqzklaDXqx/nfTYBD4dyLTGaprW492ss3ZVdXbAzc0yhLBHf?=
 =?us-ascii?Q?0ki3CHkM4lkxrcgJdqtmh0X7ueLqmiA+KW7c3CZJ1Zk5DhXkmLBDNZeIX1wm?=
 =?us-ascii?Q?U1JpcSfNtCQyuDnKeEf3Cmnpt4X6nPK3teeZbYJVqM0d+Rox3OGmWL1XH/VN?=
 =?us-ascii?Q?oe9+krDLRRAvZfTvTGq0HdoGRhlcAfJickvOGrGD5JI3iV+Y03cQyFB4DjWg?=
 =?us-ascii?Q?ZS0Fm0z37chf7LpnZRkdEvd//nMEnn1z2nTxhuKy/tfZZB+N0U1V+5GlAktn?=
 =?us-ascii?Q?c64x5arDElFV9EL39m0TnPmgFKXH97t+bo6qffKbFrfQsISVPt0dcFSiwd1H?=
 =?us-ascii?Q?2DRrebT2j1TG2u0rQXB0uf/3Iw/3B+2PZJf8TD80og2fOFgW1+LNzxHjOWkD?=
 =?us-ascii?Q?EShQa20i5mjhT6xhxCibyYSAhn3VCz8KBqDnO0Tu0qTMn2LOtU8YmkMpJ/O0?=
 =?us-ascii?Q?xpHk9hj0xjZ3MSoUTEvVuUqRDilwy1cUNyGfmyt10iNWI8r7F7eeEfinkmXe?=
 =?us-ascii?Q?NznF2EbITLN0+Wn4vDRyO957NbM1D7ZORA9/f0CoInuAsbESWW8hAY2C6ssm?=
 =?us-ascii?Q?Y6rsQai+Rv5JTLkUAZhFvUI34Y5tqvypm1pK+cxbBTLm/mSH5Co5Hrv0crVx?=
 =?us-ascii?Q?r21c+5HL2TZNhVuLc2ZqvH4LwGB/eo97oQF3i306Kw/iamPk+evmZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JIhxRdyHEbeiIvYrnvbwwecv6uCxNwbe9/SpW3P+lLvHvPzYhxgloYgyMkLF?=
 =?us-ascii?Q?S5EwRjhksyYLBgk4KDpo9BelvmseTEllsu/fNQ53RWCdoDcnTZwIqjOO7nuX?=
 =?us-ascii?Q?WPdxZ2MTG1SJDgthnjgWl7gPdjGGMyNg+WonrRG9ypo9aM76l5YStaxD5xx/?=
 =?us-ascii?Q?gKuS4xYlnFXgcgeaoHy0b+gLkJZDBuTH6eZxWYIu6Bmng9Uo39plHzk/Aeh0?=
 =?us-ascii?Q?JaoWhkqoBT0BrEHSHlkNs0CW/5WnBY+GlsfuNRLXScCIoslWm5savFbdCWje?=
 =?us-ascii?Q?jB/4yawCZqb5zeFCmnjBEpf82vsyS0HUMdPt/E3h4wv5qHBq+8k/3hYPBvqn?=
 =?us-ascii?Q?ljR0q6er7Pwc0xmKfcjdFb/kunXYmiribKg/3zIRbUbNKRuJqEgHV7Lkjcq+?=
 =?us-ascii?Q?Fsj5C8DlkMk+gklp4IH7zXnlG3bqLH/6omE1D1vx0pRzgp+IFKMZX6ALAERh?=
 =?us-ascii?Q?xbBEDgh4hI/32mErHh9uA/BOKpIPGpYtQAxo0J+r5YdJnosQELftun684ggF?=
 =?us-ascii?Q?LymfguLv8auSErl8B03Kw6h7Y4Hpy9IBqb1wbBM2ceJI+rt+WzvQKoYgYx8g?=
 =?us-ascii?Q?2K5cg8pGIw3+U7jvnuzxAxlgpLcfNXWbWoLM1L2xNLH9+wSqu6gm38HMlWPZ?=
 =?us-ascii?Q?KzwnoSzlNrIT1HxB7ryJoKzyM3DQ54uGMn5UOtwcW7gw2U022tT4fGBEqSmG?=
 =?us-ascii?Q?onkyiGzD13ffUYwHKe+oqpR7uO2S6t4mstD0DSbM3MlN78u4h/7dXVYF/HZr?=
 =?us-ascii?Q?Bjh+qfnUg7B0m4a3iOyN3q70zZH6zO5/7ABwTnNFKCx5nXGp7RdVnAUqB3Wh?=
 =?us-ascii?Q?Ghwlafb9HAj6j4/Phkv/j+xsVEWzUY6zW6eGLf718buIeP8DtVQSm19t9efb?=
 =?us-ascii?Q?PXHNxKA/F3TNTqgJJZTSr4A6pDClzUynKhlrsMDixfkG9Al5NLuIytW4lbrw?=
 =?us-ascii?Q?Fl2nQgyEdBMf0Witz+KCPxH8Lo3sFvakAjoX1zy5SzK4A2HjdQMpmY51BgmY?=
 =?us-ascii?Q?pHKc3rkaASi8Mh61gIzVUC6L86Yv7nKsfy7dQfeh5f2KLDO/iAMhWaTaGkIQ?=
 =?us-ascii?Q?QwXcFA5lZ6vzu5hStGgGoKl2Ykc+MV/Tf+XXkmIl+Uhs0o+xtHOJUElqnSKH?=
 =?us-ascii?Q?+FOVpuXjhQiDOo9tEIj8kkiEwxOOLEj2moeqV+Ot5QBMTdcJsNRSyUDxatGr?=
 =?us-ascii?Q?llWGtWj1BNJGRAGgfkg++r/inaGDBKeQnYwevAbGQzTCH8AMN1h4lqokEutB?=
 =?us-ascii?Q?BmMbsTiEGILhpFUahS5gK0Zt6dUU7SHzbTMHsRATYBB9J8c6TZnSzTrZGlmG?=
 =?us-ascii?Q?DPJsIJ3kkrsfU51AVppWJPQXFtNWwE4ZOIMewzDBKYrxwQa+p1uLLAIBUwQv?=
 =?us-ascii?Q?SF9JFjaWCrgzBeKhR2JgBgvruig3fri3LO1XjOTJHgQk1FLmG3iOPTOykaDs?=
 =?us-ascii?Q?T3WL3d28n3tGR53F32Uov7C7dFxBct+eNmVVOeU55pCJnPLz1VGkNRFNYyHd?=
 =?us-ascii?Q?MwESUYvhb9p61qRC2qfzJ9Lf6DZeS7nYfj5ufdBLDjD+86humU84O2j5XC+v?=
 =?us-ascii?Q?6uNg/4jDz75nVO0ORu1Nf7Hm8zZRS7odDC9LAF2L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9cd5e6-aac0-4521-c8f8-08ddf5c94cdf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:08.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lMT/4Kv4KqwdiPlLReW9jF5lpjn2NId5WR2ceHZPKYs8l6DoDsTaPjkXpr42A+QQdMXx5eBzNthQ0jnbsiDHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 4ede1295f29d..1c1ed0c5f016 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp3: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp3_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &crypto {
@@ -236,6 +258,31 @@ temperature-sensor@4d {
 				vcc-supply = <&sb_3v3>;
 			};
 		};
+
+		i2c@7 {
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@75 {
+				compatible = "nxp,pca9547";
+				reg = <0x75>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp2_i2c: i2c@4 {
+					reg = <0x4>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp3_i2c: i2c@5 {
+					reg = <0x5>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


