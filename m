Return-Path: <linux-gpio+bounces-8230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA487933247
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 21:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5826F1F23602
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 19:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715681A08CB;
	Tue, 16 Jul 2024 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="Ga+K5gMQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazrln10222019.outbound.protection.outlook.com [52.103.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206B1A072A;
	Tue, 16 Jul 2024 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158826; cv=fail; b=W1xhC4uBMyJTpH4mvXCa4NVzSuWVI+pZx6prXxwPabxDR0gIE+2jUA2Bq+ppo2FH30Sg118vFZpAostx+bshn5W5fj01PtrgJCtw39fPpBYvfLmfT7S0sP8FHHJPzEqd+ltJekDrJJb9SRur8/xNR3R2ZkBw5mp++QVfRq7R5FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158826; c=relaxed/simple;
	bh=z9zMONhDGp6+bwpgTas441+XV/C2jbX+dkGVUoVWLQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9rCiwkYhj2/k/htmNnqv5Bo0q3vQnvVhXeZubEmGSKFgTE95HAHfoO7shCubj7b1S0aQVaLxLecHs8jrkZ3JnGzmToXp7dWzADLNOYriLC/TnYNYktFKMomfsFxK3M2OSP6Bh/GgdKVwmRtahQzpevqNNd1918kGFLk3FuhtAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=Ga+K5gMQ; arc=fail smtp.client-ip=52.103.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvHqEb3tsFQqwkpAbj0EFm+DhGIwDse0SQlZsuS/l2wpaxgjVVorlGOeam4ExpEioVpUnUAW9WMzXm4Fi+Utxq4fB5PpAmbm9V1eoahj/Ik8BRDzTfj6Xhrw4ROEBaWXcJ8syB8eFxUVl2N2cII3t64763tC0dWNFW3HXYEC7Qyp9ekWcAh2eBZ9XAPsA1rIb56A0dXJxvp7dCDxom3LnsqPwMQknyZ8WKwmIXxLUe7O5zP5CYmuZh8hc+2xUjNWncLUXllpORlLeBRbCfNUossGq65LTf/bXS/JAC80cOlqwGH/ziwOrRyGMMga3tSqDRC9q2GAUTGzYidoPYtNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oZgdnenw3/ORCOY4AUVq85VDshmi18mHFZvHz2+6Js=;
 b=TYBi2sAPdaLr2hcKELe+AjLXLlZcy2NMU4LSfA9IcvMHUn1PRQnIAqMk7XtvQCQAiJnvttM/ZvfhN8Ulxg2FKmVD0v5qWqdEa/0IM2DsDS+MUWAlPRo7Hl/IWkKckKgmyHFc6Ux0uE0efTQXnF70UMSE50szFllyKVyDnr/A3dWtzkYLIo5zCG9+pIylAEecVqSp5iRTHrMJlXNcr65iG9G1yIqCMJYu/DmCZv3Yz18lZltcklysZRk6IsR57kKu2t3gBzJP/n8GW1AVyp6IbbA5oys3dKegRSNKiA38fb+Ol1YzjHZtN+CLHDpnYG6rXzmCPfwXBHbo4A5Xx1658A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oZgdnenw3/ORCOY4AUVq85VDshmi18mHFZvHz2+6Js=;
 b=Ga+K5gMQ9bJhRix7Xlm2k2SU9loJ2ahuUo/8AxxG/cK1sIzaf6KjED29KtN/IVeheNqMzt+GO4J2IgnzoLieMU9kFM0jy+ryRyIQq6887snRSQVVwSek31H1HR1hbj+IuykqhuACEW2mxCbjMPQUlfu47oK91DennoHSM+MordA=
Received: from SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) by
 KL1PR03MB7550.apcprd03.prod.outlook.com (2603:1096:820:e6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Tue, 16 Jul 2024 19:40:20 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::32) by SG2PR06CA0193.outlook.office365.com
 (2603:1096:4:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:20 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:13 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:13 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:13 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 8443C5F65A;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 80790DC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 6/7] pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
Date: Tue, 16 Jul 2024 22:40:07 +0300
Message-ID: <20240716194008.3502068-7-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|KL1PR03MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b82800-920c-4adc-5280-08dca5cf20b6
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|7093399012|48200799018|35950700016|61400799027|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KcxVgaGheDokkzHSQ030mFWiYyCxxtX4viBICOWCmkegojDDHmIOlst7+pdD?=
 =?us-ascii?Q?QOp3p9JWispykAKneYI1wJ/+JOW8sdIBqvZGutdQExsdArJ04bNxeCtcZhHR?=
 =?us-ascii?Q?scswSo0l1LqoLGV3gDOLgwUycs/7F6/NrZqLsSHIB/bNBzJXXythi5cCBX6i?=
 =?us-ascii?Q?qeCESijx8g2AipOlxLMs1CO19jbONKTKJyjtCpDmZIT6xaWdVLuedaGCbRkF?=
 =?us-ascii?Q?9UnHZnwfMXAagRClQhU12EpyGoJmMwzqJHQqPRf9sS57PsjDXVrOg1OJAaBM?=
 =?us-ascii?Q?4xII8AwJaBWSzJQddUUt5XP8wUlp0UYPt6D/fc6wQcgYjYfSGYFIi7DPC8ne?=
 =?us-ascii?Q?UHk5BE4o2xkxw8i1zJ6FPnwO9C2SF856lmYl0FqJSRPlDcDXfYd6f3ttvRGK?=
 =?us-ascii?Q?KUKbABcrA8xw7rBCaXrWG67yw3iyxn57sTqiPsm8MKagaxuk0RHon5FrtUX+?=
 =?us-ascii?Q?WTXm4S8G3I2G+DPESA6sJCf8CdsJVEqv18pYNxGA0W3lkAmN7/2w7zIOieT+?=
 =?us-ascii?Q?JvmNyBZvqgDVBaHzgDYMmmMCmAv9JMHuvMMjjIRUdhwrmLLikTCiRUkhVCQO?=
 =?us-ascii?Q?WJzbfc8nLDJJYO+KQeDykGrodytFBVhP6OvrPj1uo3TBTWO7xDQy4bW2VVLG?=
 =?us-ascii?Q?VlqOHRQFD9QN5SZhByngNqxUBdFTJVDo+t5s00LszCO9gTBfYyEZBFTDqHIh?=
 =?us-ascii?Q?TJDowXgsPCCMCtl/5UiHIVKnvGj3fzdxen5mM1hGYXf3qUpIz1ZqRff7ZVCs?=
 =?us-ascii?Q?z9fIw8+Fwhy5mxOWHet8ygBX+KcdJIykfIYOzM0gTlnM/5fSJRMmloxMapM8?=
 =?us-ascii?Q?uJnScIo71Du+zpKa9BT+Ddzu9YGTHMyL2db46+6JHc0Fdm1Cr+uO3pHsQWYn?=
 =?us-ascii?Q?EENvBNgpIpAtuxjaEeoaI6D/CToWoBXhJK0EuHMr6PfBCThNGtGrXrygGAC1?=
 =?us-ascii?Q?f7rE26jrswa7mRQHNMNsi8rgc7/Bu0UP30VSz2yIosPWrfd4stc2de9CJoAd?=
 =?us-ascii?Q?8ASeW1aQJvjfI1igKWZbAR6h6mi7I9kXLGhw6mg5EJ6Z3JQ2LApz4GegJS7S?=
 =?us-ascii?Q?6st/ko1X2y5pFCyx7F7vaNJw3V+WUWJNOWoIyRazULj4C2VjqzwyAGaM8z9K?=
 =?us-ascii?Q?oMbW91K995+55vDIdeHvzDDxbz/3ilakKfmDWNXEfIz9Nj1HKB3qzcHl/Ww3?=
 =?us-ascii?Q?SZBu8gPlbtd714egw5envQ0VVB1+xzLys1b9uJXFtMM5JTjAt0vMWFqnEB97?=
 =?us-ascii?Q?t3ASf0fexWR+dx6rKn7qD+3wwM2xcMB10m+1NubynFCh8CVu8UlA5rEDtlAp?=
 =?us-ascii?Q?SZrOUE+oWZfkd9d7MiBXGtS8lxwjzN+gVIESk7CSWwOdbGbSS5TgPW2w0Py1?=
 =?us-ascii?Q?i8xjG+iob5aMdQFhEB+xVUn2SseuyL4SCTKqjMCjLZBoo26Puefk5A297hFP?=
 =?us-ascii?Q?TBJQY+6bLmy88cq+aK11K10RaRAKrD5BLS6SXG2Z3BqMnYXefZTFPUNtsET9?=
 =?us-ascii?Q?MPjOJDqIhAgtwVg=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(7093399012)(48200799018)(35950700016)(61400799027)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:20.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b82800-920c-4adc-5280-08dca5cf20b6
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7550

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


