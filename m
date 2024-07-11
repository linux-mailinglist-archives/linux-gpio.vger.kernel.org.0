Return-Path: <linux-gpio+bounces-8194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3092F2F3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 02:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81FE3282CCB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 00:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50CF804;
	Fri, 12 Jul 2024 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="CwjWssd7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01rlnn2049.outbound.protection.outlook.com [40.95.110.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748F621;
	Fri, 12 Jul 2024 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.110.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720743415; cv=fail; b=jNf227pxkULvYHyWkWCZa+L4a1Yk3znJJn2wIMtQLDejXLF9eoGTKbzywN42sUP79rgDSgB91s4SwnCVEYjPrOhxnO+YgnZHPefdzWszWAZs7zAig6g8p7WStTe9GJncn+Eia6teI69ufIl8F2bwQGaP656DPC4L4orhbeWiE8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720743415; c=relaxed/simple;
	bh=yGEAZzWqh0SCy1gsGW/uTNTThBEleHH/YDCTg4Pq8bI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SC3TWWTRbXbjDjMpTm9BX5wP2kdoQPhuyqnOgNik6vVMa+Su0u0H/zm84Xh/PpBU6lG3eH/WVK316rg05/7DESS0ztnogJbJF6JPb8bcKrh+5IB3DRrVN6jd+/LXFuKHonhnr+DLqnaNNkX+luh4gS1PktUKS37gMhQxGKHixFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=CwjWssd7; arc=fail smtp.client-ip=40.95.110.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxHamRcbq9MgZLrCHQ51yRirMNUkCPFO5KaZTDtYUpEnzJnG4CVNKlzpMommxVEVJcO2FsKYzFs0eRBD04baIHkxOr5ve/9DLetEy6f/fljF13uM8CzZFyM8DOv5buhhDkOY6Kk2veJou/5IcVpf1UOIB2hTrAN92poJ2g1GOoMNb8ltA0G95qEtCQxGs8QIVsDyl5KeXVF4hUnq7BJf62eo/3PZ4/t3rVldh5/dHQH52vmmaKewrbDqNGWYP6CuYabn2s6ht3W/bndowCM1wjH8jiU1x+kCTjyLvODfEzvYGPv3YXGLsRfFwyUrz1Wj042vlS7kpB4hco3/i9ccig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUYdpjAWagJtDyEJecc9DX4KvWoDMI4RSSkzdf5MXqQ=;
 b=mzkwrxXkCkHVy9VQyrA7lHrkI33xqWHqHULnIhKjRDRY6UW6az1cB95b1ci0HQStX8liimg6lmBwuQKEP34CwF0qo7iXQA0dqWsPrvVacYJ9FNnqeZDWHPZqcqbc20laCiYADUl3XqHwriukGw6RFoVdpDHPeXdXlCHYrjr/QD27HbUoL2bTCPZ0GGFgQL4fYGCi8a7O6Ksh7SEIjfzEwpf5N6cMerzesTT64o0AxW/yKpZfpis3o5ClAq+dqgtD5RdXgotAjhuR12typLYlOyaIMUbv1OjpADCewkwwjxPblHjZ26QB4azu92kIhJvwtRMQg8WZaomcnOheRMTZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUYdpjAWagJtDyEJecc9DX4KvWoDMI4RSSkzdf5MXqQ=;
 b=CwjWssd7P91h3b0f6kQghvTUBED4VYlzY5dya20X0DMuVlnpMv+M6lvhgY4IpBwEcaVIleXeOh5OVfE1TyqlkmacTlk9oZIM7cRtIy5Bu8qJ/+IoQUV8JqYrXZz44m7EK062N4l6ThgQaQMWrRkb5AtbT/8zbQytnl86pQTiGoM=
Received: from SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) by SEZPR03MB8568.apcprd03.prod.outlook.com
 (2603:1096:101:21a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 19:38:00 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::e6) by SI2PR01CA0005.outlook.office365.com
 (2603:1096:4:191::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 19:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:37:59 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:57 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:57 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:57 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 08FC65F676;
	Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 090DFDC0F7F; Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 3/7] pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
Date: Thu, 11 Jul 2024 22:37:45 +0300
Message-ID: <20240711193749.2397471-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711193749.2397471-1-tmaimon77@gmail.com>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SEZPR03MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfc9074-4db9-4001-7546-08dca1e0f88d
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|82310400026|376014|7093399012|35950700016|48200799018|61400799027|35450700002;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UW4spy9S1i4Hr33qSV2sncfMORNZCsml8Os+Xgod3QHNtN/Z8H6ZiYsuOJa6?=
 =?us-ascii?Q?c1JuJ+WSa7/Y3bsqMhtv9wXkphq0mfMP2uxvk9DGNDyIPP5VweQqvSd0dwJL?=
 =?us-ascii?Q?3bpPUJT5iLXuQQgsz2r9ORtRJoAFeMFxFauoiYNuUkoD+pAB5kirmZa6GXiw?=
 =?us-ascii?Q?RlTU5pKYRABHXYb8EaPUtqBwYLKEfkVx5A4B8uoWuDmvIjb3QVEBy/paNIzO?=
 =?us-ascii?Q?TYep2/9g5GXaPIvK8qFGXjioFADq5LtxAY4XnoNJN4zlFMbn3DSbCNT+PN0x?=
 =?us-ascii?Q?XNAH+8NFbQxEA+3uYkQCWc+a43CPXO9rXwvnh93TKrRi+o1UJeFjYoov6bXq?=
 =?us-ascii?Q?8Qa/XfoTDyqiFxwqvEHBHY6yCrPDH3E+jD+97CRgd81xTYFI7aSgbEIvBwFe?=
 =?us-ascii?Q?1IllBTZH+zYFshndxLMfOlz06vYgBiN13YNg36tjt6mlHf2GWmGa2oU/nzw/?=
 =?us-ascii?Q?S7Pbd3V6CCyAzOSIDCJocsBp6TVHV6StiZ4q6EpcprHWXWXvFAkij2jmPzFw?=
 =?us-ascii?Q?Mt+ZCrbkxQiyvhqxH0+U8rhIFJCwrM0WahyVHHmeFtcVD8KrMbyqcZBaf1wv?=
 =?us-ascii?Q?UdvVeDBlhZ3VHkO9Myp4YnBD0ZOXeM3VQGTLhzeEfGOqFvX33XSSNQig8/kI?=
 =?us-ascii?Q?snluiycluQB2l4wejUaI1xubXskYvMoNE9REtzj9L1YG5Z95sW6ZDgCmbJeT?=
 =?us-ascii?Q?dvSecVSHFr1Y42XI4E7RAYhmn6fSIOnqNOHwhkWSzRVN4p9g5qFWRL3u1VTa?=
 =?us-ascii?Q?Q0bxMcqD3VRy8zlzHzGWZgTKbG0/803mDCXJLR9ozZ+k6PAEhS0ZEZc2GWe7?=
 =?us-ascii?Q?l8rE5huwmwi3hKHhvOhC0a+1Mng5ayHDsp0ENZF1otYzT7ZSXejhBDfGwIce?=
 =?us-ascii?Q?V36nz+tTLoLtYNzwlhKzR43yvFKLXuSs8SM4+dv9nXcAxaPfuYvVOvXM9g14?=
 =?us-ascii?Q?cBUbRR5abw6YYRYVM7RQtLr322cjjjJbxMTX3tM3DQkLWgoXGYmVw/AEYbWO?=
 =?us-ascii?Q?tja58eb4dJsnAHxb7LaCnm/+LoinS5BIgJI7ExdRpuRDMCgK6SFKFjs02tU6?=
 =?us-ascii?Q?Ry5q1/1PoJVENC05zUp0BFYSbR37QS8HzruMeHfhnUYUmR+nnDLOsJ5iUZG8?=
 =?us-ascii?Q?ELuJSLxQLdhn5juRey5EREMP2Cb0N4afb223PnvcNxr3Cq1LtLAt4f/XccJN?=
 =?us-ascii?Q?V20R/pKi6ZDMwy5vlu1sHxVGxF3zA5SeN1AXLLqwpnO5vgTejx7ivlAw/uvF?=
 =?us-ascii?Q?b8vMbAxx8sqDnHPJdOn2BQJhsnKhUC6qOhfh7eRA2xgqjCgEQkHsr6F2+oEm?=
 =?us-ascii?Q?v7lNqcZVVLshgrYnpmP6kGiCs1ESyLAesXweLgg7e0RNsc4zbmfhiwy2dmFX?=
 =?us-ascii?Q?OgGw6vn7mgZ2bh8VQ/oOVXFrtay4GOY1cmJT3sgcvkQZX22N7j8MSoeWbHFl?=
 =?us-ascii?Q?YmWbgMfKVBbFyYvM9/XwCWRQanPAyzZ076/5adzvN4RLD8iSZrE4/Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(7093399012)(35950700016)(48200799018)(61400799027)(35450700002);DIR:OUT;SFP:1022;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:37:59.4065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfc9074-4db9-4001-7546-08dca1e0f88d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
 HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8568
X-OriginatorOrg: nuvoton.com

Add pin 250 to DDR pins group on the Nuvoton NPCM8xx BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index cf021d0e8099..f342aec3f6ca 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -516,7 +516,7 @@ static const int rg2_pins[] = { 110, 111, 112, 113, 208, 209, 210, 211, 212,
 static const int rg2mdio_pins[] = { 216, 217 };
 
 static const int ddr_pins[] = { 110, 111, 112, 113, 208, 209, 210, 211, 212,
-	213, 214, 215, 216, 217 };
+	213, 214, 215, 216, 217, 250 };
 
 static const int iox1_pins[] = { 0, 1, 2, 3 };
 static const int iox2_pins[] = { 4, 5, 6, 7 };
@@ -1570,6 +1570,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(245,	i3c2, MFSEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(246,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(247,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(250,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(253,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC1 power */
 	NPCM8XX_PINCFG(254,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC2 power */
-- 
2.34.1


