Return-Path: <linux-gpio+bounces-8189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045092EFCC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 21:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3D331C22A68
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 19:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D66E188CC0;
	Thu, 11 Jul 2024 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="Jiao/qhP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazrln10220001.outbound.protection.outlook.com [52.103.192.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3A18755C;
	Thu, 11 Jul 2024 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.192.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726688; cv=fail; b=OFpNoxJQSrKs2zcAFUvy243Hqcn/9MyG19SSs1/AglmZr+663uQ8X9ptzqS8ce6hOHCmamNt/PMWUnUx23+Q2d1ZT/82AkoSpopjZZVCtSR71j6VPB3ayuUHO1evWm661IKIT7ghejqA3yTYu47X4agbp+CtNtbPIi9I/1OTUfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726688; c=relaxed/simple;
	bh=ejC2X1EemjadUL+Zwsm0AM56r4tfCQ7koeUF+HV17Qs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxLCQjB+xDdEWq7XqQ1Gwf8E+VjyaZVeEyKR3TfnVEjcv2NJvaLa3khjSuz/CjsDdCyKioAIn0vWDISCTRMBzbAME4Ncw6fxCrRB45ugDnDuSv8f81WXvux3zFzVXRlhVAZnawhksdf6HzPK2rSwIhySw1qBNCJNvb5830zLQ4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=Jiao/qhP; arc=fail smtp.client-ip=52.103.192.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDxrYT2gw44uTqZPBA1n4ZMEDQepXgDbeR5pZIT4pWIFQfaDdWwuWbYKsWZSiCipv4wa/AtICSseaE1ofJno3jZIVwpYItSttunhCA9s1LDDUm0zgBoacmmI937eyUfNbp09qtdVfZBkFf/V9z1CApnZWfczwxoa3yp0qdb/JK+rjmbAXLwj0P+PHnT8iw34sJ2KSkGwc84OpiC0vxdIhTeIt3DReKVLH9a4hkvr82GWieWNhiIZClmmTIVlcqN1oAuvCL/zyitqQYMW6IV/mUCGYYbX1CD0NKVZVYwkFx3cpmSxQSdY6cPapPgSIzTsAOn0Kdn8sV2gc+139mOkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRLjeeVD0N6SLH64QcEcyhfgfptn49nbeH+Tfis54ec=;
 b=bAZivD55SzG2GqHdrlPp1cNqgLeezrADzHRiwt4b89GW0kLZvVvjn+xTsHY5Em6Oc9V3wln3+5GYEciJ5nURHbEqdnW6ZtvyOLG2kNto4GUbytM/6k6l5gkDRTw0uOMh2ug1o1H+DYc5yM1ajGp5Whsx8BWT1x5n9ysPTlDPVwyN1UUDmr6mdhEOPI45LqyIAj5mx8M2CIpueA7P90nFL91I91LJxuVqL9Gl/TupbYjk0aYjNjJvYdS2/fVhwxew7aEvZTVNIlirmMAus4PXRcLVKXJvQDTSefcsSVSDyJExcA5kjdfMh6H786qrTzBIY3LOnZgOLSLzXrf7zPeYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRLjeeVD0N6SLH64QcEcyhfgfptn49nbeH+Tfis54ec=;
 b=Jiao/qhPf9MGXER7i7PUHOju8CdOQmX8G9BQBTu6yEJNwP53yMYBnI6fgZwind6OWRPhk67SBJPVlYaPCMjuz9o9Cq9N8w329srZ1yiH0ne+4IWVw7jKiWm4377b5gXnLCC6Wt1MoGxNGSOPT+Uwz/eVF/qhLT8keewKHxVijQg=
Received: from SI2PR02CA0001.apcprd02.prod.outlook.com (2603:1096:4:194::10)
 by TYSPR03MB8544.apcprd03.prod.outlook.com (2603:1096:405:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Thu, 11 Jul
 2024 19:38:02 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::a4) by SI2PR02CA0001.outlook.office365.com
 (2603:1096:4:194::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 19:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:38:02 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:38:00 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:59 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:59 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 08D635F66E;
	Thu, 11 Jul 2024 22:37:59 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 08869DC0F7F; Thu, 11 Jul 2024 22:37:59 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 7/7] pinctrl: nuvoton: npcm8xx: modify pins flags
Date: Thu, 11 Jul 2024 22:37:49 +0300
Message-ID: <20240711193749.2397471-8-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYSPR03MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ef115b-b659-485c-5212-08dca1e0fa5f
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|48200799018|35950700016|7093399012|61400799027|7416014|376014|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LdeZ43gBD9nzwbg+zWxvmPXlnLa1DuMtG3m2yM9+G8WSE1PtwAxa1N/i6hVB?=
 =?us-ascii?Q?o7hTVwnIqeBzU3qKgDQCmo9wC2ys5WQcNxJA0TGo/ZsyRYqBneWlpYRXIZFd?=
 =?us-ascii?Q?2+JWnD3fCpfXprDfqTAFW4sUm5O+Lia2+SD8rqz6vbdnNr6BGUwCGeT2jubo?=
 =?us-ascii?Q?Ctk6sNZrcUQ7SOeedFp4/DCR757QZQgSRpm2/x9/FAnL0AD3eQLcvWnOJpDO?=
 =?us-ascii?Q?IZozT4jaLGmBi31Yn+KaTSKBX90RldPWZKXCRUVvXJP7ZZTZT0IiRWGn9ako?=
 =?us-ascii?Q?YGcE5XqoojazI1OAnBj05jG2ma/6Sqhy4mm4s8egS+IPYd22J1GW0sXFNJQd?=
 =?us-ascii?Q?EnKwWLy3mE67vZBUB0q7qH8lh135Rna0aDHowcMA2PUfi1shSun2pNxKxovn?=
 =?us-ascii?Q?s2TxJ6Lqf69h6mpckfPC+tVP25INm+1GDjXMgJuWfJ8GTY14jKbe7dsd4+/B?=
 =?us-ascii?Q?3xeIjqEkpiU6ijJ5ysF5SXhMBJcHFAeN/oc5x+h4grZ+R77p1WunpERlPjOP?=
 =?us-ascii?Q?uyWtpyWgUFCag3w92/e+x3mLy3DNSZK2/Uovzds50uGSg3kAE4eBqp6j7WFy?=
 =?us-ascii?Q?IJm0yRlCVFUAxpJ0pAsgGSc9Oi1vQTyFRJKU12TugSo1UaFLJDmy2CA2wWYN?=
 =?us-ascii?Q?IwCHlpbsZffAqF5cUaRMZG/w+OZQ46RcnsXelhg7T1AZGL9Fwg+cI7hF/ebG?=
 =?us-ascii?Q?0GSPx534VGqJvZuVmYVRkE47PmlwiEgd9qX9eaaxWjuMrx7Wk/nJZarldKMd?=
 =?us-ascii?Q?A04RvYa3kYAcc3YnLJm/St5kFvjSkG9HMu+LwaZi8VWvwnZz66MitgWzm/3/?=
 =?us-ascii?Q?Vu5RdMEOkE5h0zmGZjRWLJbhuuLiGq2pCBj8IbZuVaj9TfyFMcQBVazL18SI?=
 =?us-ascii?Q?dD82qUH64OYTbaPpkeaDHcSdG0fQ6Bje6HzomDZEFbFptdTDELdaJq/QBbgb?=
 =?us-ascii?Q?hXDZ3BeeIxCd3CARSioE6wf9yylkSs7ODyuFtYtAr8b4Bh+KaKAKfDbQs++f?=
 =?us-ascii?Q?AQNKpQZp7xbtxAIjQaiqdNfz5KhFha+KrE4Uy2jzfHZKiSLiaPNs6b3MNNPU?=
 =?us-ascii?Q?nv2PkRKfYnwkbtjf4V6ev487qqzWzP2942di5wNywN+eAvdez90BfZ5CCfZz?=
 =?us-ascii?Q?tB6NybGYfpYH899LhK/8JCamjXKPiQchrZjlDEKG2dxzTKlbGNzL6Q9PE+qb?=
 =?us-ascii?Q?u97Zc/rPiBskPivEGPJcvi+7EZDrIbp3ulGyo6LsP1iUjoJvpJg2vqPtPvpb?=
 =?us-ascii?Q?pwXQb5gaoU43Y2S6TPZEQADXtywFhwXtZjP/HZGxTpNagDMJssckwyo0dUsm?=
 =?us-ascii?Q?3hhFmcLum1hPpRkPtdfUO6TiiOzjhIq00MQU0DN3+00elOIrjOy3pXoxjgzM?=
 =?us-ascii?Q?P28kyg99RvMjSkw+80g3+O89E8HJiteB1vNfBaRtJsYcBQErWh6TZHn/dVId?=
 =?us-ascii?Q?9P8W0Kv9aPShVAw8VEb80uncq7m22bsJIsrpulfx4X9TNLc/RjDm8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(82310400026)(48200799018)(35950700016)(7093399012)(61400799027)(7416014)(376014)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:38:02.4127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ef115b-b659-485c-5212-08dca1e0fa5f
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8544

Modify the following pins flags on the Nuvoton NPCM8XX BMC:
- Add pins 110-113, 187, 191, 192, 194-199, 202 SLEW flag
- Add pins 229 and 230 GPO flag.
- Remove pin 233 SLEWLPC flag.
- Remove pin 251 SLEW flag.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 2cc433a74ad2..471f644c5eef 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1433,10 +1433,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(107,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(108,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(109,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(114,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(115,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(116,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
@@ -1510,22 +1510,22 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(184,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(185,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(186,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
-	NPCM8XX_PINCFG(187,	gpo187, MFSEL7, 24,	smb14b, MFSEL7, 26,	spi3cs1, MFSEL4, 17,	none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(187,	gpo187, MFSEL7, 24,	smb14b, MFSEL7, 26,	spi3cs1, MFSEL4, 17,	none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(188,	gpio1889, MFSEL7, 25,	spi3cs2, MFSEL4, 18,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(189,	gpio1889, MFSEL7, 25,	spi3cs3, MFSEL4, 19,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(190,	nprd_smi, FLOCKR1, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
-	NPCM8XX_PINCFG(191,	spi1d23, MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
-	NPCM8XX_PINCFG(192,	spi1d23, MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
+	NPCM8XX_PINCFG(191,	spi1d23, MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		SLEW),  /* XX */
+	NPCM8XX_PINCFG(192,	spi1d23, MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		SLEW),  /* XX */
 	NPCM8XX_PINCFG(193,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(196,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(197,	smb0den, I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(198,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(199,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
+	NPCM8XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(196,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(197,	smb0den, I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(198,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(199,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(200,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
 	NPCM8XX_PINCFG(201,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
-	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
+	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(203,	faninx, MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
 	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
 	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
@@ -1548,10 +1548,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(226,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(227,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(228,	spixcs1, MFSEL4, 28,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(229,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(230,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
+	NPCM8XX_PINCFG(229,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
+	NPCM8XX_PINCFG(230,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(231,	clkreq, MFSEL4, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 12) | SLEW),
-	NPCM8XX_PINCFG(233,	spi1cs1, MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEWLPC), /* slewlpc ? */
+	NPCM8XX_PINCFG(233,	spi1cs1, MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0), /* slewlpc ? */
 	NPCM8XX_PINCFG(234,	pwm10, MFSEL6, 13,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(235,	pwm11, MFSEL6, 14,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(240,	i3c0, MFSEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1563,7 +1563,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(246,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(247,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(250,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(253,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC1 power */
 	NPCM8XX_PINCFG(254,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC2 power */
 	NPCM8XX_PINCFG(255,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* DACOSEL */
-- 
2.34.1


