Return-Path: <linux-gpio+bounces-26385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A540B89AA9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EC116BF0C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1AB313292;
	Fri, 19 Sep 2025 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWcO47YV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4044C3112A1;
	Fri, 19 Sep 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288389; cv=fail; b=cEmW2HsPzejbXV5XkJQQe0hgu+diUCcwfduAYB/pBHTFHPCLC84rfTI70EvpLUFCEuL56vdsufnh0LP7PTT8Olw+mRLlf/b6jrN+ClHzkhhHRbkA1/pJsLB4ZL7HcFWDpgP0JBG1rdc4wHAxSaZCHGWrIFOc9kM5AIsBCRUdhLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288389; c=relaxed/simple;
	bh=7hujZRE5v1g1T8EiCVbwf5J6SDPBiZuVYJfgvaQ5oGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hlH4zar7/m2O16s8C+b3Aa5LbTjqBFkk2H3hrgAQgsftJsyn43LayMwwrDlR3gM8TxHnWhmapOsepBswV+95F3m6CLMGBaYdn/z1k9IH4VWcJtbQC14x58TdBN9fo8B4qQW3YrnF6+CwFd9x03dphMlZbOvJUsKKl8P8sRnd9ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWcO47YV; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMWCheZkvaZ8k27bNpHHOdZ36T5z82qidqOC9D3s12rN/meaFECr9GVMgaMe9RbdmPVuEoDZdt1680tXS5EsQ935VsE9udLdyd0CXOEGDZjOxuiwtTTzPOqvSCeceO5yAL/PIDzrgd2nxFQxdzWFpWXqudcI6riJLoIKSS4dvmopYIVdaZGZOqsV8PhM1czFSyLqfAyKTh/y7afOjoilQDFBpQWxT3McQsC/jHBS5Ni+pKniPrfxt8Mjp4kiXjDOIKgw1M19f4lY/g5U8XcttJejdGx3yz/p+S1IX965jdidLb/t2noSO4hWNz1S3chuv+uUOBWyCvu0knpKeOOEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SFDsSyQdOhcMSQam3NJH1Rr5UK97PnHf10eJQqJlak=;
 b=wVWrtdkmoCbK0m6V3UOpXBrSbHku6OxiivUeX8a9B6ygdCoEQ6L8AXeYfjQDSsMAk6sP5KToL4AqIkpsPYsVriMF8lWteKIOtWGEYkLv4NRRhw3ib7ygCk4p4uXN7LC24N6f68JrMpCP5x0eGBDJA0byiNfOV7lengND5WN/Rt8CS0pzHkdte5erSXhmmgXL0A/S5TiXje1maltTQk/aP32fBM6OUfKXcdmyt85wGsfsn/SAW7Ng+oPTc3EgKkjl5ZuWsCJ+iri/P717I06+5yaXH67f1YEMHVZMHb3IUTzcF4cPrLofO9QB1NLIeRsmo3WDVSCE86nMICYhaP88Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SFDsSyQdOhcMSQam3NJH1Rr5UK97PnHf10eJQqJlak=;
 b=GWcO47YVo3jOChf2qU2rQzpKXe1UX1Jj5tM6kKnHBjYvfqYCgnXIJc1dUfHMgLc5N11y4/Z6x4R17s6D1gBU6cTZjlvS1kKnQT5VJAFsXWRN2X2oTS6pDJdHjkQ6qYQN+uSNVdCRQWEeKokC9OSa/aHhEc31cfxCLRY3gWu6ykqpklV+nAWg3btNb5zF0Z0/Jo+YKS14SW9HEv1J6sDn3M/KhK59Zgc9VPIX6X6uS0nKpv1oT7jbbaaNvaPX2RE1dcRxTh00EfH2LQ6sZ9wM32gHc2+bXDsQNKgZTcmkiA8qpLA/scJxtgZFD4yyMoZxAeyGUycEFl2KUH45BuPjxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PA3PR04MB11227.eurprd04.prod.outlook.com (2603:10a6:102:4ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:24 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:24 +0000
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
Subject: [PATCH v4 10/11] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Fri, 19 Sep 2025 16:25:14 +0300
Message-Id: <20250919132515.1895640-11-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0040.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PA3PR04MB11227:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c3535b-86b8-4c04-a20a-08ddf7802155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kurKXUlw/b0lSZwO6QfLiKB2WBxV/7r4ZR3JFAmVGxmcFF59hqyiF5eTXQdm?=
 =?us-ascii?Q?Ogu0SWXNfBjsytW6ZXEh+qvBneQZC2DqusnWKBZ/KM92msvgPY27ZwTFLSfJ?=
 =?us-ascii?Q?1KI8BQMMgi0pcn1h5+twBU/VDGvl75ywZG5mcsyJpTNN8B5stnrnfPj39bq4?=
 =?us-ascii?Q?TBa3UwqGkpDhQIkFcCcR5wFAFsm3xF+3iFdhB+EFsov9o8SmDNU/spzDDFaV?=
 =?us-ascii?Q?vkZaAxQdQXeC0j2vCPezO98OLptym1PYu7MtlZu5gfRt9LkgDP4/c0tWjT0J?=
 =?us-ascii?Q?kjmA5tlujsx13rBevUm2DSEmqBEA83+UklZ/JW1Dqju7WBf91LYwiTG3Vb19?=
 =?us-ascii?Q?kvEwcoqBleXXJeqEDBlrKzUAJKI6gvfSv90IcK+Y8VsJ9yQJ+8tKtcx4iObk?=
 =?us-ascii?Q?ZtdzAyr/5PxwZSRbROQFoq+ROBglVBG1xWX+AuHeSiefzEYRFLRkOtV1nWIB?=
 =?us-ascii?Q?0lzDaBj5zDnOIQAOKOevcPEyp+GPJejwuvirEI9tg1LE38a3nGJdMkMYIUOF?=
 =?us-ascii?Q?8BwlRh0UsvsxcZb+8PT9AmOTicryrbdSbguRhS+YHCjfXRVppvNoNywNkzdT?=
 =?us-ascii?Q?sXoX0tefSLUVkbbq8BPIx4zL1nmsSAV6RPs0UGNvVDmSr3fu9xuz9ZFYkvfg?=
 =?us-ascii?Q?cZYeB0B3XIUy1Z0b24asK+jn/C5YfyjMQddpuhWbAHRkWy08aXSr1Nc8biL3?=
 =?us-ascii?Q?PtF2P9IVqdlzyR9ziiF4sxbUoCF/f/TfGEHznL8s6L3DR6jrIWPqJZZ7gPkW?=
 =?us-ascii?Q?eD5kGwyyyP6GVsQ8AsQwdV6bGX8WIArBuujjRhKZB4n9ZTFbcClaopIas2+n?=
 =?us-ascii?Q?tbECpYMtvQhKhsb6CAo0WDWbbkYqerwnXHZU9VF5ta0JZ/AAXhFuy2rcwy+/?=
 =?us-ascii?Q?07oleV9ucSE7Gikqz0J7x7vik8hdxjru34he1HWc9tTlBpuOQBhqlwXgoL1E?=
 =?us-ascii?Q?0kL/Yzjqqkcd6tJWfFF4OU8ajILSWsqXUxQ8qWQK8hRgBBCpFzglDunKs1xs?=
 =?us-ascii?Q?Bkjbh93dkx7rbvjiAtqfVUSJWCaKTAOnMxlix54tlq+vv878x73nhQpPM+1P?=
 =?us-ascii?Q?u+cKg4CdH96x1ilJTZl6bq19bD6fCccV7nkdWTsw1XYfVKgV2dDNRZ7/Rn/J?=
 =?us-ascii?Q?QCFBFG+WgLa3TSQCe0uyescRG3kt5CMqKE1pb5X+MLVCz9MP4LUAI0vuUWnU?=
 =?us-ascii?Q?LvhiSaMX5enrVyxbb0rON6rjOjl41/XOmqeY8KjjzCLPP7unLW0+c50ifTMz?=
 =?us-ascii?Q?r2aJ/LBx6+YcDFhGibcjXPmtKLoL93YsA9jbQb2Yd0RRgButlPfrYr5MFJpc?=
 =?us-ascii?Q?c7QTtt48LaYlfBoltl7kVR0nASNDcvnzc4rTAxRsY6NY2tQHvszYXgSbVvJi?=
 =?us-ascii?Q?fbtbUGVC37JTnkPyAvEb+Oi9WKWR5rZd3xPwRPohEgl39uHCEDbIJ0pQYsl5?=
 =?us-ascii?Q?oJXzPh5Xiib63+PIWe/qY2nmyG8kxoOnmIYEP7wT5xpf8Q1RWobAkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JI6QMrXRCRdtMiLhLu0tkzL6hOybd7onhSf/TA+abIAAO63qf+AM6wc4umNi?=
 =?us-ascii?Q?Sam9A8VfX/Rm90ZejAnvj6WdYuNwXrqFD8jA4m6VTHGIiHTg/TK1Gcz9wHYH?=
 =?us-ascii?Q?o0qI/Y7T3hG+83yUI0TQNZbOV6MazOHVLy4zzKd+z/n7anwfspYrFtoCepTs?=
 =?us-ascii?Q?fXdBfBxIY1v5WN0/m3VbAQa2sMlFbd+1Jb66LHroc448+VhtNKb1nlZ0GrGW?=
 =?us-ascii?Q?do6LnUVrG8W+QRrn5ih7LU1US6S8JDJ3FK7vBr2JeC3DAIrqQIxHv0Q3/xV7?=
 =?us-ascii?Q?YiVr7bhqaqDvUj6eiNZ4EDQmIHIXokwleLIgTKHayI1S8RtZ7Th6i2vZnApb?=
 =?us-ascii?Q?72BHmM5GJ31iscaK3UuaRzddBg8juLjGLQObreo6jGkx0N9QEP9/5SWhAqRm?=
 =?us-ascii?Q?KjTpxJEMhGWn3NuwwO+cw6yiNHrrFXNGoC4wZPzwpXYAHK4dcXG+A85VJmRL?=
 =?us-ascii?Q?EzbziJbyuDQ47L8dOi7fe1tBRWJRyiGclSG+K1B4zwwSRmJzawmtAbZ7EvpN?=
 =?us-ascii?Q?p2+1HFWoBpjJg5ANJYCniI1Dom8csl9mGZjjYPkZfxbJz7zYNwjZpZLjjj4k?=
 =?us-ascii?Q?CB3EVxqSIc3yVA4Jm1J8KPRcCJ+F2yXJvhRrzw7zI3ke0NGfMha/5A5A9Jrj?=
 =?us-ascii?Q?d555GzWO/BcizeOxnG73f6A+D5FzAKUhjCEMQeuK+y+VKPob/tUpZkASGHqK?=
 =?us-ascii?Q?pLH44OuIjLMgEzH1W4wCeCbumrzd4WroZ1C0SXSadr8qnEJkKBQ8tjiwx6Mc?=
 =?us-ascii?Q?uH68kpnKT5ISQVNhWUCafcfmecs3PRWzK+mcXmFl1Awndp03bGIfEWDxzWNc?=
 =?us-ascii?Q?KyiYkUuhY7AHE1k1PWBDL+yv0R5UM6/wG/ng0mOooBoxEUsM4Iy5td/tg7Wv?=
 =?us-ascii?Q?V7l02lq9HBgVKh0fpumv3N2MLNkSSVS7xs/zp9ACBBXxvcKUFPbTVnFBCGCm?=
 =?us-ascii?Q?u2Ah4VuSWfQrl45/feN5Z8NffNKjHeX6qP4iCGCy1VgBs/TV+IeIB8evTm1H?=
 =?us-ascii?Q?XP0Vk+9229z0CEKQi3+hEitjfW0C1WVOk0A7X1/FFstd30Oix3ZX08jIH7qD?=
 =?us-ascii?Q?fbN/9GrwVXFgi3pcnq12llMgKmb7aZcsoaCZz4spCYTUApgLoo2+sBmOzn5d?=
 =?us-ascii?Q?8hT5oWT+J0woRlixjVcNPluo8Q7PQeX+9d14Nk+xRZ7p4yj8AVRRiuA2Gp2L?=
 =?us-ascii?Q?4SmbJdPWIgK/NVebm0MUalDqrVvaAMfNxH+/Idfw8alDV9ab8n8VWqOTzB2P?=
 =?us-ascii?Q?aFLkl4HWjzsimGI5MVjCHxXhnYk+Zabmv1se0uhxH65wDbmS7+MRuNPtxEXd?=
 =?us-ascii?Q?52nMgAwWLoHYMLEPFiwCSzptkpOAoPEFBkKT5+LdxxKkoAZ2u1l8d6RuKwlq?=
 =?us-ascii?Q?u6N1WgwZJcwAdTeJKwxG76l/cxD7G6vZgBBI0c2W9ZL/sIKnIIeKuMam4s+t?=
 =?us-ascii?Q?OZyuhkA0Ho7eIxLqdi0BpQGoQMoM0UQuKfVRDVSuycHr9BOIxB783pkhWvau?=
 =?us-ascii?Q?yOQ/q0Vv95PeOFbCh4Lrbo0W/VKq9VxwUPTkJg3oPyXBXyu/tBXR0JwjvGlR?=
 =?us-ascii?Q?HlVbaG4Xn3pGhovmP0Qz0KY0HOWta3TtuJOQQERL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c3535b-86b8-4c04-a20a-08ddf7802155
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:24.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w71mTc7BAZ1vlRdhqa6m4GEnI2W/+6ASi8eBJ/1wtuRAcL/DLlPKp98e1/yP5ebbjCwS/iGN9IwWP9N43BPYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11227

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none

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


