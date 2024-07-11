Return-Path: <linux-gpio+bounces-8193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980892F2EF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 02:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786851F22820
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 00:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ED1621;
	Fri, 12 Jul 2024 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="dR6SoeEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01rlnn2056.outbound.protection.outlook.com [40.95.110.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062E376;
	Fri, 12 Jul 2024 00:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.110.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720743123; cv=fail; b=turzF+cA9SnOETEaodgrQIfkHT7AyCJ9q/LdQ2iR1X6EfkwELkcpoxSMetvr5b5okclE+idH1TicADLpFo/5LstpyxgFcel/9PxHTCgKBpm7ZqhucOtBzY98ogvGGem11zOv8SvJmC24elQ9oXEeTekNOqr03YoL/+Y/ZDlA+R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720743123; c=relaxed/simple;
	bh=BhCEMzixjEMo9tD3CpkiBaQEQVgYASERGCLb9qFwnE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4reTwIgj6ITbOkKG8Ieqc6DFEWiCFp3neZwl9kZNtdEx5M488xsbmhz0od/DtoUMWWE9lNvceQ4GsynZeawwKraIgPphtg9hMl2DYWzRTOvp+IpIFJfO8xUTXMCCCSqLZsDJjkypDobgCGOz6YehhRqoZ1gESIgbrEcssFKaIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=dR6SoeEG; arc=fail smtp.client-ip=40.95.110.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5e9KHnRIzmEZjSh7y6Df6oWAjfRaHByaF+ob9nA2QsW1wnK6qmWSXqRocFrT9ddc1XetQSz+FGyAq15AJtlBwSp4wmFzGXa1uPR5gbzLVJ8TFzMAXsadgygROT6T5eR2+sSvhzisQGm9oAzDvdpXFf5xl1djU8Nzw2oE9tEKbl/bpfYg8JA8VJrJJIBGn4O6AC6xMujYKwEV2HxLiIYcrAxl9sSjfL2A5Q3Q2nuwe+TCcy4gdkqpOimMl9k1MdyQ1r2/xjh26oa9JCVzt9iJRg3o5VJESn7N7f/lLCDEn7fIZcqCULfo+2uXc2RWDGsUdhglOr3RoUtrf+zNfZh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=101RSNpPq47huqHs3QrH3qcaed0oAXODcnv4Mk7gMeU=;
 b=GLL/RbLFUY0kXMcTwuK2VExnTEC0/5bpU4Hw4p3ervtMAecLF6hKLFZzl3isEq/4vDHrHiR7Gw4QbDiw4aO1YhQl5cLjre+x2oteo5D9kBnRVHIi3ZH58ausm60iIeJmnqPVaIUTgRlCBvYcOh7mwWFWHACGTZ0Bf7kQJuGHhRnlEeIFv7IX7vY2XTQBA0ti+mdit35XZxXUVZ1xoP4vmJxdISw6kOI19mk3eQDdni1Y7RD+qj0uP8uDUBvgRgECH7JrVLNHMrr3bgakk4JHwQvT/baGYQy+iFZoA1/OIQcKT2pbsWRq8ATOVfcuoOKB2M33x0pPYkew6n1QkOyAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=101RSNpPq47huqHs3QrH3qcaed0oAXODcnv4Mk7gMeU=;
 b=dR6SoeEGBD9ITCGqChqlPYIDBzgfMwcpXzzU9RCui8kmDPgc6ZK6QLVyPiS+eVw0sNw7BjfTWe3lFwWCFSzYAyyNOBs8p1MR8vXU4I0HwH8FWPy34cQ9R0TTopgEYIPajuzRC+GzggXyOGmrV3/Fis/OpHd44twucV+mIEGdSLY=
Received: from SI2PR02CA0006.apcprd02.prod.outlook.com (2603:1096:4:194::8) by
 SEYPR03MB6532.apcprd03.prod.outlook.com (2603:1096:101:89::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.23; Thu, 11 Jul 2024 19:38:01 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::a9) by SI2PR02CA0006.outlook.office365.com
 (2603:1096:4:194::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 19:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:38:01 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:58 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:58 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 53A165F671;
	Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 53353DC0F7F; Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 5/7] pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
Date: Thu, 11 Jul 2024 22:37:47 +0300
Message-ID: <20240711193749.2397471-6-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR03MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: a4edba82-6461-4127-ba83-08dca1e0f9e5
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35950700016|48200799018|61400799027|7416014|376014|7093399012|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CaTyCVURQk5k8WrM73pEOT+ZUPmI4EQnCSKgmYNdk2bC6RRgU7ZeuYdub/jF?=
 =?us-ascii?Q?81fpW0uiyRT5oHS7fzFIFGUOpMJasRWjbsj4dew+OjujMMpiXK1OUjs7opxZ?=
 =?us-ascii?Q?0lv2lvBvNZG3980y97hCGKU5FNOYg0jjawXayZ3GSzb922YJ/6+H9tpv3UFz?=
 =?us-ascii?Q?wKbI0l2Dj1zfc5Eknc5Rk+e8S5if67bVivX5UfBJo19onFgKz0yeayEG9Rlz?=
 =?us-ascii?Q?JfYfqfKrj+HWrmt4xuyR3rdCa97Fg/IL4+K7em6DyftEg4qROj/dlbTJ/GJ7?=
 =?us-ascii?Q?cEbAWJP7QbDDwdHHNwbfgzSRppCZ4qc5aWgkGnX6A8MyBAU/VKoWy8afJSqL?=
 =?us-ascii?Q?Aajyn1ZDwNrTlFFLGVmlD5yYlKgGozUT/JG40hjb5HjObv72LX6Nx8N/EwF9?=
 =?us-ascii?Q?w/S5dQVfroXt/trKcRTJARYqJuwkVULVoYZqLKQ4GOHxpSwDdwNBa8ZX8EKJ?=
 =?us-ascii?Q?zv2P0oMkwTwJSntDDa7PE9SfvjpnTuxrA+iIf2JUm0BMLoina5BwBT6oCRAl?=
 =?us-ascii?Q?JXgBF1NLU0IMP7knJN7PcHxD77UO9cLyGw+MYixcJx8eSPBSIFeG5pWTiyT4?=
 =?us-ascii?Q?i0xaJsuL7Xf4e6peb136RPvyv1h8uEMPHKK6YGjS4aETrTEZfb1axWDDEm8x?=
 =?us-ascii?Q?38ewQfd2FNnDjBgpbTEu11/+YKgtDxTDib9rzRkGzJ2eoTbkn+YxN/aZ3m6A?=
 =?us-ascii?Q?7nYNq06bCneWjJJlq7bzX2ZppR3IDilo5dDc8D9NJS6ESeKpfmzJ9sDi1ahs?=
 =?us-ascii?Q?61T0fJKjAyUrmjDsS/V/AFFOdIieUeBcw3AXIp5OAQNPazhYs9xU9VsJyfKy?=
 =?us-ascii?Q?T+Lq4nRTNm+wwtAmyea8o1q/NM8sjoRUeGmR1zGTary7L8Oood2qY93onUT+?=
 =?us-ascii?Q?DPim6XWDQRCIbZvk8piO4LOTkpMRlccMDv+mJbjkA8zQCc24hQgNhGy6lK7q?=
 =?us-ascii?Q?h56EzG30Er2mc18NsbSEPh39HIq5tYtXet5JdkPpK2xbcZ4ouSHbYVDViBuq?=
 =?us-ascii?Q?+q1odeR3G8sLJwVmUqItSljtZUh78uDAAO4qYZO9Rte3gV9sF0kVe6H3TynW?=
 =?us-ascii?Q?jJ5NHtCs5k4PZv2b4dhY/GaYKZ812y6bssjUXuaukWNem2oYgwxRbWW6D9yy?=
 =?us-ascii?Q?Ga3O41NKIgs19tBnn/+92+L/iMpwuemf5LlnaWEr54LNwLaS+g5IwLk0PrI7?=
 =?us-ascii?Q?qXM+9tOl2eA1WJeoHN0+h7RQ/cAwNNsgq+NZD2RUTIizXGiehideCwFnJRCN?=
 =?us-ascii?Q?V8RSJYFlWdf02Kjjkne8qqiI8xM/LkOZlcMplFS6tXVzBw+f6B8+bsNGjpc3?=
 =?us-ascii?Q?z83RtpK2NzYc27DP9SrZ9JMDVVtO96RhlyJtLIxckCdybmZcJ2nnXcDw6Yrt?=
 =?us-ascii?Q?+jC3Op02nwofD/t/hB3ivcr9iQclRjssQ+RRquMadWUNCYQwaxo4mTqxGjSs?=
 =?us-ascii?Q?Zr8/OiSGuGRNLtomPgiR1u24mSGjzPOV4KMnxW/P2SBg7i/7USu2vg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(82310400026)(35950700016)(48200799018)(61400799027)(7416014)(376014)(7093399012)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:38:01.6158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4edba82-6461-4127-ba83-08dca1e0f9e5
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6532

Remove unused lpcclk pin, group and function on the Nuvoton NPCM8XX BMC
SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 396bd07e7c74..bc947d0d6ede 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -570,7 +570,6 @@ static const int spi3cs3_pins[] = { 189 };
 static const int ddc_pins[] = { 204, 205, 206, 207 };
 
 static const int lpc_pins[] = { 95, 161, 163, 164, 165, 166, 167 };
-static const int lpcclk_pins[] = { 168 };
 static const int espi_pins[] = { 95, 161, 163, 164, 165, 166, 167, 168 };
 
 static const int lkgpo0_pins[] = { 16 };
@@ -807,7 +806,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(spi3cs3), \
 	NPCM8XX_GRP(spi0cs1), \
 	NPCM8XX_GRP(lpc), \
-	NPCM8XX_GRP(lpcclk), \
 	NPCM8XX_GRP(espi), \
 	NPCM8XX_GRP(lkgpo0), \
 	NPCM8XX_GRP(lkgpo1), \
@@ -1054,7 +1052,6 @@ NPCM8XX_SFUNC(spi3cs2);
 NPCM8XX_SFUNC(spi3cs3);
 NPCM8XX_SFUNC(spi0cs1);
 NPCM8XX_SFUNC(lpc);
-NPCM8XX_SFUNC(lpcclk);
 NPCM8XX_SFUNC(espi);
 NPCM8XX_SFUNC(lkgpo0);
 NPCM8XX_SFUNC(lkgpo1);
@@ -1277,7 +1274,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(spi3cs3),
 	NPCM8XX_MKFUNC(spi0cs1),
 	NPCM8XX_MKFUNC(lpc),
-	NPCM8XX_MKFUNC(lpcclk),
 	NPCM8XX_MKFUNC(espi),
 	NPCM8XX_MKFUNC(lkgpo0),
 	NPCM8XX_MKFUNC(lkgpo1),
@@ -1495,7 +1491,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
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


