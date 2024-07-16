Return-Path: <linux-gpio+bounces-8234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB69332CA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 22:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB06C1F23C3D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 20:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581721A01BA;
	Tue, 16 Jul 2024 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="LAjrPFfX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01rlnn2061.outbound.protection.outlook.com [40.95.54.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA719DF8C;
	Tue, 16 Jul 2024 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.54.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160868; cv=fail; b=vBPaCOKQLoNT60lANofIR8E/ylWpSrRVSTaii+asMChN6oIegrZ41V9EpDub/1zhjQwpGIthrmbGFJwjrS4VnDiGFghVssxD35LyEN5w/jh6r1J40Dd/sO3nEGhHVzauLszmWHk81o6dCCOGFM+cFI4Dx8M7+8aoae4bpukX3RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160868; c=relaxed/simple;
	bh=j0QnNQkjXriMAqli4xwWART4THYaemaITYs7SJ8yimw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljSjQB6pQngazaUnwGF6WMWMZ5zVBEQ4mP8UAOebWH9Vqjpk8NHqnwxEMpAXQ8zAUUE4SX/omEO6TQR/dasGy6s5EafI0cS968jnPaB1BmFR+k7mcRwXZFjRbMTs9s8OgSI3sqXic3h9AXk054yJGFQPGjifKPb+OCVrlSl7XwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=LAjrPFfX; arc=fail smtp.client-ip=40.95.54.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wySUfAeACtb38SFGbYalLqe2uD1DQV5Y+D1aeVSnvMoVFxPbwnP5dVym+ZcvDxatbKxijAK3GjokAEDs8p6hjsINELl09h8eTSclJV5zy3Ee31EqWrUwbl7gMtxHDSZAwff+p4m6oGNJfm0LP5lQdBhdNMqtzws0kCzYpt0UsrQ05dy3KDk/uhllzZpWE5LoyKmlplwTv9DTyz19FsgbzlTjFoRVDw5twe0H+eMgbq/ZOB4ze3ThBFSp7QTebvJOyeWRAjjW39FCl9vGoeuDcWLgeazSPNpJR1WBCfQ5CmgKtQ7s4LiNd7kelUoORkMz8obfbe07MJ/a7CDWII9qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USfhtjwCFsWwinLs7bv4By5l28cZ86qv9uou5oNgcfU=;
 b=jHraYtuCV7XRiD5iHKKqhUoh9gt/rlStCHa86wU/VlmFsDz6m7+r95doqCx8gdrQcwn48t/P9RDvswQbwSR8l/wX4L9o4tUAE+s6PwOPIVb7XWLHW7MRR2Kz1iC9jDgs37o3EEoALrUfqL6oUIcR9pNcLgH1uqqqs+wlEEWdxELkCSnt8FDwZdFPbpJNd6V3wpVVjoQTE9G84nhDFXCEDzkQe1JjIZ5W5mSgscIE/HtElnqjxNz0VEvBt6uWUzzH+lhoCfsZ/AmSn2inqqdjJVlxVcWdLRX2ZFfn41qdk6/IcfNQ1WJimTAQ5hTtyTAhbPpQciA/jtrQu4vWYvsK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USfhtjwCFsWwinLs7bv4By5l28cZ86qv9uou5oNgcfU=;
 b=LAjrPFfXNFXL2aLN03CXsTwM+FlfSkRJz9/Fd1XZmWluVztcGTABXVDEA5gdPFu3wo5VRqKa8xBUKh75wschAL1OLDOogTE2S91r2Swy/Od03cr33Hnu+zXynNZnovaYDshsSYMFvCQM/avrjyun8Kdj7wBqHLtLBX9qWOLLmXo=
Received: from SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34) by
 KL1PR03MB8756.apcprd03.prod.outlook.com (2603:1096:820:132::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Tue, 16 Jul 2024 19:40:18 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::4d) by SG2PR06CA0202.outlook.office365.com
 (2603:1096:4:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:16 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 6E2265F642;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 6A5B9DC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 4/7] pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
Date: Tue, 16 Jul 2024 22:40:05 +0300
Message-ID: <20240716194008.3502068-5-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|KL1PR03MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d29b46b-6df6-4864-0e2f-08dca5cf1e29
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7093399012|61400799027|35950700016|48200799018|376014|82310400026|7416014|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A0LkJqoB5yBtolHt5bDnDpKwsAR10wjFQVieGiWTbPlqpIeAHPOkcJcJKy4R?=
 =?us-ascii?Q?xCgdIcNGShsnp0zpv0X1MfI8FbIMtAgLKNA/DGLSmUULEB/n3n3Tum7rNLbB?=
 =?us-ascii?Q?74f9p7SquK//izfqjRshhoeS9wb85CbeOhVhEXlzhDWcAwCJ1rvADIgS9K3c?=
 =?us-ascii?Q?P2R4c0OIsNyrEu05CFZkcyXpGG5Bq03doX5IhoCRDn8CjUnE2YI9ETraN+Fn?=
 =?us-ascii?Q?T3oToIiG8nG27/cgWrThrDq2Nt3/KxtFq5mSaWfIZQL2qCts25XpLctvO4wE?=
 =?us-ascii?Q?QgxupAWDxKPZAPY4y+yfJOUqbcqLB6f2QcV+QXlF+z2gIYKONAvX5aHOMg/u?=
 =?us-ascii?Q?POL5mL/Jo8nhinpWVfo/TR2hpI5+veebjlCzpxXf/caX26SEpmpP+NxCsWh5?=
 =?us-ascii?Q?LGPzN4tsQL1FgccLi7hdvLuaueBG7FCp3eKXpcCMhu8ZuY1cdddr2s3jSJ6S?=
 =?us-ascii?Q?jqdZkuzJ3y/wPL/FOe3N5SkMhJqYt1O9qHmR08/0U6vSVMl/m05kHZKXRqkb?=
 =?us-ascii?Q?MSn26vbHqRNM+mK0fzzoVMPnEpUCVeCcc4hyACkfuXFUZZ+UqEmYmbyu+K75?=
 =?us-ascii?Q?8LWFwYs+K72H5nM2RY7cfVbzYU9A1z7PFcFFjbmCAfKMK0L0Vb2xNs5ehmmo?=
 =?us-ascii?Q?9n1R3VWVdoe+ZGwqscQ7rxLk7uKdchdfOtx9GEwVP8HY5Vz2dNMjpjxKhR+V?=
 =?us-ascii?Q?NSRfZG4WFc61djZV1r8ekY7DliCMkktC+yDE9GZlFlRIAIC9DaZs/We+6u8w?=
 =?us-ascii?Q?u+1x4YbGfJ2R6u6MezIH5Hunkp+fYek4NBMqPOTDS0a12mWW3XMfyltGsBKw?=
 =?us-ascii?Q?vvP6ZOoYFsdd2+mQ2ZythdZjYjK7jvyHnByLne+INjKWzoUSaEJw+pYhSY01?=
 =?us-ascii?Q?Tudu4dB1jZn0ohNDYBL5Y+k66/1LRpV3x3bCawLcBNjTt0v265y8ViEbpYZ1?=
 =?us-ascii?Q?WJpuUmIUDDG+QuNVRcsrEVEioBScDTmvzofUDuC/CNghrxwVGjOmj0t/51+t?=
 =?us-ascii?Q?f3htshUAN4e9G7KZkh8S+u0GFRTnHy8APUn1AxGK5bnJ+EAYWhbzV57RWeYE?=
 =?us-ascii?Q?D6RqvZiy6YXehs0HjMaRTllS6dZNaQ9Zo9PIIMkNNRaXuF5q4F08vVSbk/BG?=
 =?us-ascii?Q?I7F5SLH0ztuvc8zyLkqgS9Rm4GXVuK/w/7kS/Ke3FrWcw2zsaYiBz2J9SATV?=
 =?us-ascii?Q?98udLZO+/DR7bUxYz6uaaw1K2Z6BxhdA0vOlyYW82PaqfO+oYQfCBrWyDOfk?=
 =?us-ascii?Q?rFlJzzMP6vAQpxwSafMUpGyGSlcHBAWXFzaB1OyJOoU5CYpICOKPUjS1VEle?=
 =?us-ascii?Q?ijyUjFKDKjPjrpbvQu51wnrQHgBcZFswhYl4pIQQPmszRRIh63thSWJRlqZT?=
 =?us-ascii?Q?/pVmieVxqnDW87YxGEJsyRFcin8bX/c3y3aRfPN/Rmh5oIkGsQDlHoolIhGy?=
 =?us-ascii?Q?+x2MRSLyU+Tde3rN0RMDJpq1qVZ1jLfDVTIfo6zbCaAififF6kItIv4nw6PE?=
 =?us-ascii?Q?Dfvn4KMQJPo3fsA=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7093399012)(61400799027)(35950700016)(48200799018)(376014)(82310400026)(7416014)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:16.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d29b46b-6df6-4864-0e2f-08dca5cf1e29
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8756

This patch adds support for GPIO pins GPI35 and GPI36 on the Nuvoton
NPCM8xx BMC SoC.

The pins are configured for only for input.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 7985400de12a..4e02d1a68f39 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -316,8 +316,8 @@ static struct irq_chip npcmgpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static const int gpi36_pins[] = { 58 };
-static const int gpi35_pins[] = { 58 };
+static const int gpi36_pins[] = { 36 };
+static const int gpi35_pins[] = { 35 };
 
 static const int tp_jtag3_pins[] = { 44, 62, 45, 46 };
 static const int tp_uart_pins[] = { 50, 51 };
@@ -1358,6 +1358,8 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(32,	spi0cs1, MFSEL1, 3,	smb14b, MFSEL7, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(33,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(34,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(35,	gpi35, MFSEL5, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(36,	gpi36, MFSEL5, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1603,6 +1605,8 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(32, "GPIO32/SMB14B_SCL/SPI0_nCS1"),
 	PINCTRL_PIN(33, "GPIO33/I3C4_SCL"),
 	PINCTRL_PIN(34, "GPIO34/I3C4_SDA"),
+	PINCTRL_PIN(35, "MCBPCK/GPI35_AHB2PCI_DIS"),
+	PINCTRL_PIN(36, "SYSBPCK/GPI36"),
 	PINCTRL_PIN(37, "GPIO37/SMB3C_SDA/SMB23_SDA"),
 	PINCTRL_PIN(38, "GPIO38/SMB3C_SCL/SMB23_SCL"),
 	PINCTRL_PIN(39, "GPIO39/SMB3B_SDA/SMB22_SDA"),
@@ -2037,7 +2041,7 @@ static int npcm8xx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const unsigned int *pin = &offset;
 	int mode = fn_gpio;
 
-	if (pin[0] >= 183 && pin[0] <= 189)
+	if ((pin[0] >= 183 && pin[0] <= 189) || pin[0] == 35 || pin[0] == 36)
 		mode = pincfg[pin[0]].fn0;
 
 	npcm8xx_setfunc(npcm->gcr_regmap, &offset, 1, mode);
-- 
2.34.1


