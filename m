Return-Path: <linux-gpio+bounces-8229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64118933244
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 21:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5D6283528
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEAC1A00DF;
	Tue, 16 Jul 2024 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="niGMHGlg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazrln10220001.outbound.protection.outlook.com [52.103.192.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67779195B27;
	Tue, 16 Jul 2024 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.192.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158821; cv=fail; b=Gk+J4yYMuZKU4/hNK6kFpN912h9cNjQmHfPUuH3hwa/BVwHm5iNCao60J+qNzKZNnIxBhaUYy7mlv2avErfxCN2J7pmFp4iIpzmJyr1jvaLY0xWmgL9yKoCO+qXx7wHr5r2gLtQk34tkwaCLE3kshSvIuP6MRJgrMCiT2cHsOcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158821; c=relaxed/simple;
	bh=Xdhi1mFeNkCAUTWAmWwa5ibgWfBBeFYhAnfBnE33NBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0lk9JJzb6AFRAssbvU1czPY2VTbgEpKiYNC2SDUFoKK6zwRHPxCg6dqSnECXxnRNZ8Jttv8aECKCqfLxQ23HOQ+QzEdw3/Xl4Y4g15EEmBQyJHhZncF2pda1T/UWKKk51vJWRLksOQGkWNkSyCzWR3k56ttYanf4Z/gTprd4TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=niGMHGlg; arc=fail smtp.client-ip=52.103.192.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvNT/K1ClexSJlKbeAFng6uzHQStyyxnq2ultgbqdQLBV4ZVSy9zaRxtD3dcPzdYAAzonIaggPs9GTk0J4ab58MJAx/lP7F6tLcy7EzHIlf2ZshmEOLZ9enCKHT8Y71+I3DZKGhh+rZSoR+lAuIVSUVJtnPfoXexxiZRwgPK99AEMb3LYIpb5iJ75Ah2AO5L1ZVMSwogFX90BBlsBOlq3XMamGZiXUXvnsHJ9Peu2aTKxzLW9x8DXlQNTv90G1wkUargpWu/ug7+VZeApcPfIOgr6LwxIOsRuO8JorO2ANkWxA5z0fmZnf8MixUl8A13wLdQkZjTBp+VmO1ublCIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axteFVxlr5lMcdOaQNjpXhpqx75BqWHfJ1Fp56k/a00=;
 b=jpE9rXgJPbo/JT3ftxpibkO2XvYrQqotgamjeHPhcbKzSBZsFxVF/NLaGwTJeWUAQC2Q2yAkT3vbuhtpy0VmVTC1an9grG+4f2xJIVa+WimORHZnOPJ3ImTYDPbCt3O9PVku/+yFjejtXHPcplsHHI/Mpgaxy26Cb0UQDINBRJFqaOfqkSHy0Se1suzycVXLFcdvhEStTiighXg6gNvtdih9yDAXSRbFVy4kVM62iMxVe7Ila/WBqe18/xiRJOQtGrJVsj0sge0sAwm6ahxS8o4i90pgvZdWjfgaIjj9RR0bfcZ0asokbgeESNu0K/JhbCb1+C4u/93DyVx9sbtVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axteFVxlr5lMcdOaQNjpXhpqx75BqWHfJ1Fp56k/a00=;
 b=niGMHGlgc4PU1mBn6WjDZA6/9/WaahmM6BSQVxNacv1AORm+hgLgRjlUa0P8v1Mij4GQXkWgwNuEZOGO1JTnGaeMe6kJlBp8cLibD5YGMrPESW6bfh7IF9lDK2ZJJ+QCiPNhamPJeQe14b08IunawCqIfVkRDPA+WLojyOLHZ0g=
Received: from SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) by TYZPR03MB7748.apcprd03.prod.outlook.com
 (2603:1096:400:427::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 16 Jul
 2024 19:40:15 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::7a) by SG2PR01CA0112.outlook.office365.com
 (2603:1096:4:40::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:12 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5BB335F63D;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 54A84DC148E; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 2/7] pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
Date: Tue, 16 Jul 2024 22:40:03 +0300
Message-ID: <20240716194008.3502068-3-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR03MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: a786a153-d992-40c8-7d9b-08dca5cf1c40
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35950700016|82310400026|7416014|61400799027|48200799018|7093399012|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y2P8siy7l8rFNpVn/vJwH4YxSr1feqU3qo9p8ROe8Y23GrVUKmFVnomYJAEJ?=
 =?us-ascii?Q?ODUE7Ur66GD7lk5X96EgXhjcuLvJcwZW8Siav+MG1310cRe53PnDpg29faRM?=
 =?us-ascii?Q?jbNBXfsRYYl4B/GJvjWf8dDJ3pHHbtAGzjT+VALxjBuZMRcoD1Z0brtXtiZx?=
 =?us-ascii?Q?KyRVkWeIfNnEgV8ZfOqsuu0z9eVHdOcq+731iip4nMI6rmmdZUnHxMAiPZdb?=
 =?us-ascii?Q?9+3wJtFs6o6bL12o1tYRU2pjLp56WGCIm7DhFX03LxoIhvo256huGwnfX7vs?=
 =?us-ascii?Q?Wus08J+2k52K+NjKubAx0lj6H14BmL/DnR8FFR4ZDI/3PcWqYMO61nWc0wpD?=
 =?us-ascii?Q?rmYroTr8poNPSYHF+BcATLT8Dax9aOE8juXw/8eMSyfG/xQKBJH8xvXoF/+D?=
 =?us-ascii?Q?8bJN7Sq9Bq6MdElVu/LFqByX/pjDj7hNuQBdwW3sYp+b/oGproSchzBVmC8/?=
 =?us-ascii?Q?FpVn3okA+HJHWMnvTO2TfzewLpIrZFYiXUXtF+WJKdku1Bwa/dSsHPOqT5xI?=
 =?us-ascii?Q?YxRPbEulIW6dFN2HQoWdkifjfI/yzT1XVo7EfiujK/ZDgnXeIwjEUcpM0Lsg?=
 =?us-ascii?Q?Pe2XxTHzenzKmHW5tNeYR9wvaH+1jNGBk7DPR6Jjeo2Ua2zGlWO/ksa0av0c?=
 =?us-ascii?Q?/nxbgUnMYwOR602zotHEaehv0GqrkE1hhAO8Yt7I7KpD1rEgmb+yj8n5ebJu?=
 =?us-ascii?Q?kcKtkPf/hCmAxET2XHAyISnCwi3V2L+RRZo4c631uim2NAFLdk7zUcPsHoLP?=
 =?us-ascii?Q?QFoO0/5yiZQURXVyP0plsSAz3q/7Uj3f6pkeQ6IlUtaFERAXxkZYrQo2Qj3e?=
 =?us-ascii?Q?Ep1tjAhtyjZ+7V38zljiXkK/dFnQr248JiYQDsroyYlqV7CBotYNx7/eZdKo?=
 =?us-ascii?Q?kTdxjqc3HbK0NkNL3S40lWF5QWscdfv9XeMsOdK6YYUyzbywsR9eSYLJb5ez?=
 =?us-ascii?Q?jJOMedSHhs+uO/gxXpxA2iPKcgdPPr+1oc7etwYhjTz8UtWz9sfUu8/3asaJ?=
 =?us-ascii?Q?9fp/gtTADtl12z+zTS37TCtrmsYPu2IM99nSJrqHd5i/dGNd1gV8zWv7g4d2?=
 =?us-ascii?Q?fazlpZANv8/TzhXp2goK40ROjwipqG8TdbwpwjEYO1RSDEhmlU3ovAPFMuTg?=
 =?us-ascii?Q?9ORJZpEUnbANP7qBU+Z+avg4b73m5buW4BdQdqdGcWn+DIZRI5ezo4QemtA7?=
 =?us-ascii?Q?ClVADh5yegD6fX4BRw+wlzStMdC9CafcJ2sQG1xJ+ysf02LTGzinTaEyIMlr?=
 =?us-ascii?Q?L2jI+c43/N5nPSQuyUQ8FZAjyWzcSHkheWi+/wScwoM+FR/ns1d6P0qX/0uw?=
 =?us-ascii?Q?4aWU0g2WW6N28oJdbUOhucGXd7oHgrxYZTYYsl0pewFyWWmGm45KpFwPc5Mt?=
 =?us-ascii?Q?td/ITJKEUB1XkjwoX0mkU+T6Q6p5QnyfhJGI+Oc5WH6Xd3uVTRzSRLQsK5hx?=
 =?us-ascii?Q?u5MvhVcGP3ePI1xQgL8Tft7I1sEim6hBwgUgJgmLCBDWqDSufq8XQ3obmpIx?=
 =?us-ascii?Q?vI6p9vT9qwkPotI=3D?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(35950700016)(82310400026)(7416014)(61400799027)(48200799018)(7093399012)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:12.9475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a786a153-d992-40c8-7d9b-08dca5cf1c40
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7748

Remove non-existent smb4den abd lpcclk pins, groups and functions on
the Nuvoton NPCM8XX BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index a377d36b0eb0..2df735947d86 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -437,7 +437,6 @@ static const int smb4_pins[]  = { 28, 29 };
 static const int smb4b_pins[] = { 18, 19 };
 static const int smb4c_pins[] = { 20, 21 };
 static const int smb4d_pins[] = { 22, 23 };
-static const int smb4den_pins[] = { 17 };
 static const int smb5_pins[]  = { 26, 27 };
 static const int smb5b_pins[] = { 13, 12 };
 static const int smb5c_pins[] = { 15, 14 };
@@ -570,7 +569,6 @@ static const int spi3cs3_pins[] = { 189 };
 static const int ddc_pins[] = { 204, 205, 206, 207 };
 
 static const int lpc_pins[] = { 95, 161, 163, 164, 165, 166, 167 };
-static const int lpcclk_pins[] = { 168 };
 static const int espi_pins[] = { 95, 161, 163, 164, 165, 166, 167, 168 };
 
 static const int lkgpo0_pins[] = { 16 };
@@ -699,7 +697,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(smb4b), \
 	NPCM8XX_GRP(smb4c), \
 	NPCM8XX_GRP(smb4d), \
-	NPCM8XX_GRP(smb4den), \
 	NPCM8XX_GRP(smb5), \
 	NPCM8XX_GRP(smb5b), \
 	NPCM8XX_GRP(smb5c), \
@@ -808,7 +805,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(spi3cs3), \
 	NPCM8XX_GRP(spi0cs1), \
 	NPCM8XX_GRP(lpc), \
-	NPCM8XX_GRP(lpcclk), \
 	NPCM8XX_GRP(espi), \
 	NPCM8XX_GRP(lkgpo0), \
 	NPCM8XX_GRP(lkgpo1), \
@@ -948,7 +944,6 @@ NPCM8XX_SFUNC(smb4);
 NPCM8XX_SFUNC(smb4b);
 NPCM8XX_SFUNC(smb4c);
 NPCM8XX_SFUNC(smb4d);
-NPCM8XX_SFUNC(smb4den);
 NPCM8XX_SFUNC(smb5);
 NPCM8XX_SFUNC(smb5b);
 NPCM8XX_SFUNC(smb5c);
@@ -1056,7 +1051,6 @@ NPCM8XX_SFUNC(spi3cs2);
 NPCM8XX_SFUNC(spi3cs3);
 NPCM8XX_SFUNC(spi0cs1);
 NPCM8XX_SFUNC(lpc);
-NPCM8XX_SFUNC(lpcclk);
 NPCM8XX_SFUNC(espi);
 NPCM8XX_SFUNC(lkgpo0);
 NPCM8XX_SFUNC(lkgpo1);
@@ -1172,7 +1166,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(smb4b),
 	NPCM8XX_MKFUNC(smb4c),
 	NPCM8XX_MKFUNC(smb4d),
-	NPCM8XX_MKFUNC(smb4den),
 	NPCM8XX_MKFUNC(smb5),
 	NPCM8XX_MKFUNC(smb5b),
 	NPCM8XX_MKFUNC(smb5c),
@@ -1280,7 +1273,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(spi3cs3),
 	NPCM8XX_MKFUNC(spi0cs1),
 	NPCM8XX_MKFUNC(lpc),
-	NPCM8XX_MKFUNC(lpcclk),
 	NPCM8XX_MKFUNC(espi),
 	NPCM8XX_MKFUNC(lkgpo0),
 	NPCM8XX_MKFUNC(lkgpo1),
@@ -1347,7 +1339,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2CSEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1496,7 +1488,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(165,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(166,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(167,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(168,	lpcclk, MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(168,	none, NONE, 0,		espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(169,	scipme, MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(170,	smi, MFSEL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(171,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-- 
2.34.1


