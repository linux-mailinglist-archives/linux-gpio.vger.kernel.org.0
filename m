Return-Path: <linux-gpio+bounces-8231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A43933249
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 21:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2D6B1F2393B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 19:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4851A08D5;
	Tue, 16 Jul 2024 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="BQKjcbs5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazrln10222016.outbound.protection.outlook.com [52.103.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDA1A08A2;
	Tue, 16 Jul 2024 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158826; cv=fail; b=qwpor+lLIHuhTY4ADnbNHIkPD0EU+TA0y4eAeVO882h6Ib+9X7CtO0tfAwUEYTbYGF7EnJ06uqJ1EO/9w7cHEl4zE1wWdzRNzN10fbHeIsOPEJAGMeA3EPsiSMVldyO98+z1NhynTHcxhYYehmyhvj1JPpnA53WrcGopl+vyUjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158826; c=relaxed/simple;
	bh=y1gEcqGkOzu1CSW5h46a31dxVK2B+02THP7tVLXL46A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ka5oYPryAvNS5M6uJ1Z3VP+osvh6zAPpHaNCJ+E5xWHFup+L96G/vQtBcG6eIWQo5eYcGHqbkyphV9vm+iYrIqNIEtJYtjFQ8Pc3EUc3tPmSAAK4zyn/GvAX4hi/grTDvVPtUCrECttcrTrWqxWtJ58NSIUkiovJfbQ1nSwdL90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=BQKjcbs5; arc=fail smtp.client-ip=52.103.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiZSr5VXyeSnLLm6rN6pznK++yUEdBelds5oxEanI1IehHVhBImKtRBclM+rwA8C4DI1V6u+Luw8R4yAe1iIHGoiAQGMOwDqijFUlms7tx8aIZjFRr0jGMFIMfnRiJTQCyFvzadLsdT2FfsAVQO7kDxqefVzJpjVGqU6JXkgekgZOuKo7TZRPfS4KrPgaxIkWyO/U6QXcFzNPtPJUI+y6QNNNrPDo/sV4iN0fSXduTMypgAsNce3g3VrA7x7bMWSidZdbZ0PlCezkice+MGOSEj7dEkcy22QAucTwgHN2WryMCGJR1IHGNCASL/2gT4fRP0bC04rjxSvTjueB/St3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTb399/UzKOz6U9cMk+Ehas+hZoLWAE6laDq+xbgiKE=;
 b=Z/LROPtkV0jdUCtOTQakvcajoueU2fGEvg7U8RhztMk7aLtmUZDxJRbqAF/Ui3CzbP0icDUe4jKRoRlxC8Ctx/dwnlWPRpbEINs/idkIWgfL7oQXWuCE94wrVpFzUkmp3DJJAQexsD4YbPm9l5YN7s5hCkclYrN1mPn0jtY/RSk+vS07vPIn0CUdrOc+3OHVqA9tjV95RB6iSqybLTRqtKxfeXgGfpfzcze6URGkMLi9iUJRZeA2XHsvgdPPw0UgwRp+IOS0S63lBNB+RtpoRC3/rsUTlKz5hva/qMyXwMKtbB9CRv0fc4tWriX5aZCo3vgPXnzZn0/bd1b2sdHTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTb399/UzKOz6U9cMk+Ehas+hZoLWAE6laDq+xbgiKE=;
 b=BQKjcbs5KNyqo0X9wCG1eXs8Nt9GyNx3C1Xw5xY11TcFMcLOG/El2JTxw6WpSPBDJNg8a0yGcnr6DuyXllNJMH/kv0MRpTlh/z/JrdWIeYb9ZgnagTug2Zw58FE23owZ8+8dyHiXTUNRO8NUO4jKKEbBifLjBuDZJb0JfNWiLkE=
Received: from SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18) by
 TYZPR03MB7273.apcprd03.prod.outlook.com (2603:1096:400:1f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 19:40:20 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::3) by SG2PR06CA0186.outlook.office365.com
 (2603:1096:4:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:18 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:13 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:13 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 7847F5F64E;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 74D8DDC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 5/7] pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
Date: Tue, 16 Jul 2024 22:40:06 +0300
Message-ID: <20240716194008.3502068-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716194008.3502068-1-tmaimon77@gmail.com>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TYZPR03MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f0a03c-7f6d-47d9-6247-08dca5cf1f61
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7093399012|35950700016|61400799027|48200799018|7416014|82310400026|376014|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kuGQ68Zt4Qs4++jmXth61N+xh0mYDeHOwMnyT/CquKwB+6T6pZzzPBWKcu7K?=
 =?us-ascii?Q?jMj9aTYAQbAYHNLbY5V1DTcN6XTKnYdlrMlvnkDC6FW6Khv+Gr45nnFvX7Rx?=
 =?us-ascii?Q?f7zMCKgOKYtcORMoKMswkaYMcxkbV+47BNaUAIvJLevxWM6pw1i7+D4gSVbm?=
 =?us-ascii?Q?awl7re5RQQjBeB3QY1ekseCXgF/Nmi0JxYg4q5u+yuMn5qrIchdlV3s/hEXS?=
 =?us-ascii?Q?+rqo48V44HbklVR0yGcy38M4FJdqieosDsCGhP9Pph0XUkHjElZ0SoF2oLO6?=
 =?us-ascii?Q?8ptc+IEAAoJ6aGGzJq6pNvBmd0tqRukyNVRzLRDFq7EyOpaRA5AtUi4nbQIo?=
 =?us-ascii?Q?1EqaSMRXlbSg/6zkdigWtWOIBmeTKMbdDlUjOLWhzxy6MspfgnNqe677s4KX?=
 =?us-ascii?Q?xM0n07ikYpnxPLLzoxowE2qAfw7qcY+50Xba9WhwjtxFIJYK+H0VknjFiTqj?=
 =?us-ascii?Q?X1Lj0Ers+R3ZSxLER9hk0Pw+RujG869bXUdlMBc7HJIX8aFKgd365qCBZlJJ?=
 =?us-ascii?Q?o4MkE3xFqkAK8nNiA3HSZUIXeXVatx3HDotEwd9+xN3JfWt/i5lfrRu5f2Zx?=
 =?us-ascii?Q?X+lhQXJwF1hycekZOJN2DvSsKXI1/0cTNJ0zCAPcJRPseMepnn5uZ8+VUxGC?=
 =?us-ascii?Q?z2tz6A7atydlIwoURDYr9ElEFcsq0gNTeadlug4hNACz/dcxv8UHARczap5F?=
 =?us-ascii?Q?BH0iZ/ngST9hhkHW6M9ch4a5bR9+SfjkMt30tTAZH4fL+UWRbHNRyR5v0cuc?=
 =?us-ascii?Q?K5aWQx2hHsYIMdVAL1jvZenWu68R1PW/nxoLA39DpeIXLVnbmOQjX+Qloq+F?=
 =?us-ascii?Q?7JKofn/tsRAYctWtubDYvyN33VvltW0XhTBGDdE0NVqhWpNEG+rlSh2xApUK?=
 =?us-ascii?Q?KM7mXMGIB/UtACO8LGG7beJgcVhZR/377D2vGLDw8muRXDkwoqXJCKFgOEb/?=
 =?us-ascii?Q?Iu2q/CNCsAWEJDDXuWP51XmGSUXGTCDx5OTlz1ZgQtShDh+W4RrLQ91r9kP5?=
 =?us-ascii?Q?KGoWcjHmpXWlEb51QSuTzNrURQiZBWqqN26I9gYZTQXwh438uFszf6gEwP4L?=
 =?us-ascii?Q?V9Jtt4l+qEwgfuZG1+RLjmo3JmslMdHO3eX/joq9BkY4U+ZAM/HtUEp1MNDG?=
 =?us-ascii?Q?vUHTzgRrweGmqkI0AdkNE6bDyfWjoe8ktbeTtn9HIVmaMMWdU92umqaUtcY1?=
 =?us-ascii?Q?9tjaHA2fwAF9Y2MUqVXXLwOZeXqb5a4vUbcZUyOKxOugQIxMTzhflh5uMaHd?=
 =?us-ascii?Q?X4k+mOUJyo2av9s/xejVfwWXSFZJaqt7Yd+xWeDRW/z05XvrPrA7lAU1L0SI?=
 =?us-ascii?Q?YnFdRu19DNnG5BVitMK/VeOPsQup3Vv0vCyTn4VvgrTK2XXTSdPB6QdZAvwM?=
 =?us-ascii?Q?hrbK5eWoJFUDdRs6D9e6xuOWceAJje5PO775zmoW4/lXr25eSDhM9pauR9Le?=
 =?us-ascii?Q?KTvfuJpfU4dfpxdq9lbeRpL8x7O0G8TnvkLP1jgC5emKrIdCXVrr0a93bBRF?=
 =?us-ascii?Q?Ck1SdpYK8OmhrTE=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7093399012)(35950700016)(61400799027)(48200799018)(7416014)(82310400026)(376014)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:18.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f0a03c-7f6d-47d9-6247-08dca5cf1f61
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7273

Add pin 250 to DDR pins group on the Nuvoton NPCM8xx BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 4e02d1a68f39..bc947d0d6ede 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -515,7 +515,7 @@ static const int rg2_pins[] = { 110, 111, 112, 113, 208, 209, 210, 211, 212,
 static const int rg2mdio_pins[] = { 216, 217 };
 
 static const int ddr_pins[] = { 110, 111, 112, 113, 208, 209, 210, 211, 212,
-	213, 214, 215, 216, 217 };
+	213, 214, 215, 216, 217, 250 };
 
 static const int iox1_pins[] = { 0, 1, 2, 3 };
 static const int iox2_pins[] = { 4, 5, 6, 7 };
@@ -1562,6 +1562,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(245,	i3c2, MFSEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(246,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(247,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(250,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(253,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC1 power */
 	NPCM8XX_PINCFG(254,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC2 power */
-- 
2.34.1


