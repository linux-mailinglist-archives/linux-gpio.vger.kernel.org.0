Return-Path: <linux-gpio+bounces-8188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193792EFCB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 21:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E3528474B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C90188CAD;
	Thu, 11 Jul 2024 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="lx1XXUg3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazrln10222018.outbound.protection.outlook.com [52.103.193.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147C18755A;
	Thu, 11 Jul 2024 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.193.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726688; cv=fail; b=YOr7ok6J8Wde50fxxiWAlp/z180eAJSqlayrCty4+db/nvb9OB7BwxkSOcQYOl7b+Ru3zpL7N6+I36g04bLnzc3N0WR6B3e+tJ8PQ+9KB2whOpmlj2scKRLFAUomOiqd1+/78RqU1mJI0GzB2Rn1bj0MkR2SlhiFOXGYfIz6DI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726688; c=relaxed/simple;
	bh=z9zMONhDGp6+bwpgTas441+XV/C2jbX+dkGVUoVWLQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObCLSUUFjVPQC6q5dqZJWC0XIPMYkDqTtMLddjGShI//+8KFFoTdphtnyEYbcsQ41zJh+Du5A48eh2tIErilG02ulPEpXq6HBnFRD5aqj7syDI7K/yDTUo5EI5sZAbEZ8Vgp4Jg/3ZdmnsBFShqHtdTMzJNT//Csk3bH6MhM3KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=lx1XXUg3; arc=fail smtp.client-ip=52.103.193.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNWK1F6E3y2HWfoYSBoh3oP4QJYk3YCZovoDUJGZQlm7tmfyM+STw8fef8DHX8x7zOV3wROOHPP8cE4PCQ5eeUk7gsO/H0ZLzxEtbOYi+s9Ip6A7NBN7zVAjTWoN8xU30IJQT2j6pYesVNu0sbf4ACe6kriNmzCWccNMHVmOpUZ5hegpKW1/frrdv3yKxZ8DU2WrxDmphhjKiXx7pKfdlmb4At/aWMZ0rPPtrCbYmCTzbLOYSZpybgyAo2J5aFy1ptDFZrbwJ0HFhnNis6wGt9PXAe2e/IoJ7GxuE7j+oRPF6sph5jrndokj8+S1Pm2Tyz5l0oJgakVqtp3+pXS0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oZgdnenw3/ORCOY4AUVq85VDshmi18mHFZvHz2+6Js=;
 b=rSeTZhLTqi3K0PeAFrH8jC0K1k1pJGbrBIVYGsUfCIV3FLXOaWZGQjQellk6WCd9x6J1YhZEtXzzHb7uYyu3g/x0qog2QDdKJaWwgVQepXiiR69A+Dwso9FmS5Bwx76tQvW4PmrdY60uGSuc1XuVuysHoiUR32xQe7GlXL8G1APUkTJeOhKhax/ZCWim6eZnQv4m1vXmgiH+NSfCTwHroGVz89nAjqbedwpJ6vNhuSHIerQG/JIigIJDIXdDkoDh7OCm2EfIxXrIL09/Y24VVaXKIgLSn+qBKzdmzD6xGiMUUo2ATdpFRviOl6D6zfqGQH0sV3G3qk/taNLia2o39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oZgdnenw3/ORCOY4AUVq85VDshmi18mHFZvHz2+6Js=;
 b=lx1XXUg3YiKXL1NtSderZGpI1nh/DUAEJAT4jz5bu11+B169I7vgtVPQhsd5W8jYbTbk50ILG2FTp8CvszVV8Oo9FtbtOWUH+t+RPDHa8dasxi0BmfQPt1KXvAn3F2om9AAtQDu3d+Jg+asgx8Vsl8n/m3oO9StSrbEX4iUmoO4=
Received: from SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) by JH0PR03MB8291.apcprd03.prod.outlook.com
 (2603:1096:990:50::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 19:38:01 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::1d) by SI2PR01CA0004.outlook.office365.com
 (2603:1096:4:191::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 19:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:38:01 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:59 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:59 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:59 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id EEA3F5F675;
	Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id EE3C9DC0F7F; Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 6/7] pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
Date: Thu, 11 Jul 2024 22:37:48 +0300
Message-ID: <20240711193749.2397471-7-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR03MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 605df9a9-f828-4f2b-1a5a-08dca1e0f996
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|7093399012|61400799027|82310400026|48200799018|35950700016|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EfroC/nh+ISLPL1Di0rYSfQho8gDUHF/SuUEwKq0jjuy1rGhEI+fB4fJ5055?=
 =?us-ascii?Q?4+hyqOGRKjXe9XwQtwBb7UmLi/mBV3P/jCGvc5k7dYzTbidfNJlnMcBaLftm?=
 =?us-ascii?Q?tZ5KOVmEzRobPsso4eN9/b4s9PMK28oXc/XaGGcIslYaa1+RED2o9dr632tk?=
 =?us-ascii?Q?zICTA9s4V7zJKHB4dL9JF8SQtISdufuHGrXq12iOn1TBhkCSWE2qeVJmsHPy?=
 =?us-ascii?Q?ezEeMrQIcaxA0Y/8Xi+jhC+3FiZ6mYAk+A2FDkysNh+EmXJcJQOZ3ta+L4ph?=
 =?us-ascii?Q?JC2HVoQUijOjpARL23CPwoH5eVYLP/mz/aRzfSZYthDYtCKsMiMd7nlWrm0p?=
 =?us-ascii?Q?HcLizagmtkRtrmSg8zH0NvICTMA8ulPkRiV8PJiteTE3ZuJCCM2DLtc7Qaqi?=
 =?us-ascii?Q?xMWfuoBK3zCl28y2ZMyXhywfRYIde/qrafBpT+Z4jCheN3Y1yRWIkqn/boZB?=
 =?us-ascii?Q?pbJiEGJPuZb6zR9pqwCVh+e+baOo4eKse3zllFfgqQHjP2/C27zcDCLPJko7?=
 =?us-ascii?Q?Au4lALiwRh+5ekSm/UnPKEZF7hgoe6j9YXZMgY53EBvQhbqcsW16nwrvjyvV?=
 =?us-ascii?Q?+GS5nlLsp6Z1r/x6sDnqt0RYxaR6nCxSnYS1rjo4HkgDjx1TrGQnMJEd8RhD?=
 =?us-ascii?Q?voVZfAqr1TYwrK99u4IuDSACdvnnEhCX8TSyYeiKWnM/bgiNWcG5Mly/Qx4l?=
 =?us-ascii?Q?NbHvGa5FuX6TKiRwWaqYyM6FA0YhsOpgjbPfMrNKx8OGR8OspH3w08K/lYEK?=
 =?us-ascii?Q?Rkinmh4LjVeUv3cs0n2gI4nboiqLSQvZEUpKuNdbUN1oIiDVmagpUoH9YL2/?=
 =?us-ascii?Q?A930mM3NrvjZ/Ciza66uKAmS1aNHYm2Tn1Bd8YMuV6BCMEBZ/jssdWAqBJRo?=
 =?us-ascii?Q?VjfCxGdZUsLXAzsXYYoeMztq4fmvqf1lc4DFdxxQOXzxbphMrd9mVCDszcjc?=
 =?us-ascii?Q?Z3UbKTHIO+AduEcbymiFUXECwyfDqab4z7wYs5IzF9KjMe4R3LJRCtozzzxN?=
 =?us-ascii?Q?y5VMCA4UOFwFuQROCMsCLTh4cLuOXvA3tAcI7t24M6hcV4SI3sirZjm2UZRP?=
 =?us-ascii?Q?oZW4BZSIvfNhRa8U/bJTNzD7CmYuj5YJFfQSycbo+D9qxsdU3yml8qRL1OOb?=
 =?us-ascii?Q?Jhs4PeMxudG5TIC4YW6OZWynqiz5tP99GcUch7w291aSlyvYYxhoLFQPk/KX?=
 =?us-ascii?Q?GwkEoJLu67jsK2j79Oanz2H+baJooUEhehKTGrPh98+R9vy1Gv2gkvajQggO?=
 =?us-ascii?Q?6hrVkluKkF8H7PJ9Nx1fgf3mJiSkIPU3nEU1IcAHDtXu2WXsR9a1X/+m0Wkz?=
 =?us-ascii?Q?mGffAe9GZrKrxG7UuNOVFZRtricLP+46PJfYx/QRxDNqNkpdYRTn39GFx4tj?=
 =?us-ascii?Q?9iiVYcrbX6AlefT8VcqgsgquvRwFCEh2CH8us03+EjnwVF6MW6gHWD4Y41IP?=
 =?us-ascii?Q?HYikL+u5YMEtBqjd4VVBEf0FEQq44EqwBQ3dJS7KxrbWLqYMtgQX9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(7093399012)(61400799027)(82310400026)(48200799018)(35950700016)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:38:01.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605df9a9-f828-4f2b-1a5a-08dca1e0f996
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8291

Modify clkrun and serirq pin configuration on the Nuvoton NPCM8XX BMC
SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index bc947d0d6ede..2cc433a74ad2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1485,13 +1485,13 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(159,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(160,	clkout, MFSEL1, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(161,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(162,	serirq, MFSEL1, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
+	NPCM8XX_PINCFG(162,	clkrun, MFSEL3, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
 	NPCM8XX_PINCFG(163,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(164,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(165,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(166,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(167,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(168,	none, NONE, 0,		espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(168,	serirq, MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(169,	scipme, MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(170,	smi, MFSEL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(171,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-- 
2.34.1


