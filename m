Return-Path: <linux-gpio+bounces-8197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E44A92F4D7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 07:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BE5B1F221E1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 05:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA7E17BBE;
	Fri, 12 Jul 2024 05:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="LWjy0NBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01rlnn2041.outbound.protection.outlook.com [40.95.110.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4511156CF;
	Fri, 12 Jul 2024 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.110.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761066; cv=fail; b=S9uLFmGVpFilvjLLhUNRcG+1aYuehsGkamOLVA5aVf69TyWtzYCy2eqfSDp+j3UpQbtLOARu5alIV/HcseZfSs+x7sSb35hTE80xHCpqGy6BtdFAoj3cjy+SyKEy8jY/OMGxvNIt9Ix42SZqFyZxWHoNAnQ00sINJs8vxhEBb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761066; c=relaxed/simple;
	bh=b6HQOk/rtPO9YycvjTdiBHG4+Cy0LVY16plRWmZZyc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICYT0Bava7P6IKTXi0XBAoVgcnXn4ekwsqm62QeYJNigm0w/4nCcqHdIAV0f5rw4Bo5dr4qHbQTZzWNav8Exbbc7nLFb5f6iUsVcViIf0vEExKzeZoOhwbriOwrk+Li9KIa1ase5+aIga5Z+iBDwoHFKH/APdrQ5hu9XHomPmn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=LWjy0NBo; arc=fail smtp.client-ip=40.95.110.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3To1Gr5u+Ceehlu7xBq87msxvAhrN6h8KUW9dNOhGFzkXfjbukvZ24RRFC5v8QgbSA9Ude2EuekoRIFtBrkzy3xMtveWQyS7cKa1vTExYcne+4Oxktbw2m6ZESd42ZvrHJHU7AVozdDkY0qSPzi4PiI8++Pj8lY0bwBxX0Rs8ji9t1L1hwvE6Eb4rCCHXvy1lcJpRn2kq9wrh4BcOz6ePspb8zS9qU0sP2T4x8eAuqV7CAVZ9V3jne9ByZIXdqUWnGepBNi19GfWZpfrKj8pj81TObKQWOk8cp6zWn/D0CvT/K+OaRxtC265N5+YANpUf8cgaUQp6Pm7p74dMLNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxUKd2ZwHOmlo0sxM05/1HGUqehwogVpIdh5YE8ZoQU=;
 b=q0aHgmbWhptJ5A2TZcG3OoaK/wLC4gl7kke134RTwVTKMZI86DXqsn2lmgo44z16gqhw5x9jZzDmqItltHMkF27915lgC69OnSslNkOi0VS9Ez1r4ClRZCBiQLBtWAqXo08JNNc5EDwwgQKU7wWpZ/sORViijaKUTUJB12+KKly0DpJSLCyk+DWwHtehah8mQ453kEo13ngKIg+A4JASBIh/kB28l2k/uJz9R652RLlP0k/ro3gfF3kUgZiIC7Hvsm9OZfxuddxdplBnUd7Qvx+S5nsAVeQp2w8xUHWtYKVgOS3XH5RWLuquY9NBQp8EV8k4gHjaf2X0VrNHr/0PLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxUKd2ZwHOmlo0sxM05/1HGUqehwogVpIdh5YE8ZoQU=;
 b=LWjy0NBoLLUQk6YTjA/1Lu4Lt9ZA7GS939yLK/y/vIfJwHkZBQCKLYIq6OWiY3A2VqnfcAU3Vc3G7kvJpMapxGp9JM0ri2KNaj2gTa33ODuTO9NTe77cuuK+BiQaZfTHtGET0/+ek7eY4EKWLSxosC5HY2c0rTbenNmU9aQ2QIw=
Received: from SI2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:4:194::15)
 by TYZPR03MB8133.apcprd03.prod.outlook.com (2603:1096:400:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 19:37:59 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::25) by SI2PR02CA0010.outlook.office365.com
 (2603:1096:4:194::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 19:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:37:58 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:56 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 775AF5F675;
	Thu, 11 Jul 2024 22:37:55 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 76600DC0F7F; Thu, 11 Jul 2024 22:37:55 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/7] pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
Date: Thu, 11 Jul 2024 22:37:44 +0300
Message-ID: <20240711193749.2397471-3-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYZPR03MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd5fd9d-a4fa-4bf5-0c47-08dca1e0f810
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|48200799018|7093399012|35950700016|61400799027|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NlEcbF9L4OmS37US67uDdof8ps3lq7PMngjiNk9cPDSk6/GByArMibbhiEJV?=
 =?us-ascii?Q?c7qAf4W2N/QdmS98Hp7F+uwauh+9ATfEJXa1n9jq+Pxk304jdyDAt6dA7MTL?=
 =?us-ascii?Q?ogQ7ZjI9qDyiV+GcEpOzYB9b1TN+7vbkfpXwDXJOzYp2qP8IyL0EuDZKV1SZ?=
 =?us-ascii?Q?7GvXHyQTXwkDXbYDrg3wrDl80aTbuo9Jrem7nB717ScIVlv2vUc6WCqPWOT/?=
 =?us-ascii?Q?vt3rVxw4w08HgZNxkdjRf822/hnpafr2WBOYc6DRcF3fGSSiLx73CSmRqPrS?=
 =?us-ascii?Q?DEf31fNyknnzouJHt3DuXH6Bj7F5bJPfaYFwJ/FxJA0wGDFyQ7wrsHFK7mOR?=
 =?us-ascii?Q?A2p16fKQVAdqYO3ieK4N6aU/yEP0vjzoXGiDH3TPX8MtZ0+X8aU7GW1ym4j+?=
 =?us-ascii?Q?0cqYTXl1x6+VI1r/dXDqoaG7RN1qpn2VUDgTiAC4tx2Fk6+fPmts4V8OkGwU?=
 =?us-ascii?Q?2efqn1UoEZMjHqiC0rLTTsaJTYIFobsTWIJ+Am3rYm0/CSQHmsQOTIiJhl8t?=
 =?us-ascii?Q?HBGVGBekvmLQBU4VNSwrQZOmO1AlQtI+pozqZEWcdehYXoXKe0Lgx9ANOknl?=
 =?us-ascii?Q?xIe93aefwgl6pCZQ7laB1Fqi/eINQiGd0AHofgKEaYI3Tp4Ac6s6ho0uPOel?=
 =?us-ascii?Q?tViF/ZJYHqL9hESz2c8W/StZ3j49ZIca25kES8Jr7jfjU3miq76snLqCRmb5?=
 =?us-ascii?Q?wgOYGp/NEmJasW/XphTG16gZfTJXjFZ9PW9rD5IoBhRmhAIs2ik47CAmeq6m?=
 =?us-ascii?Q?XgNJMY2zyA4hoe0hYTW/sgxS+ppUQWv4SFMkBqAUzGQhvqokuWKnSqwTiYPn?=
 =?us-ascii?Q?5unEpPvpXrphTj442EPU/xXdO8HzJ8hk8j+Tzmuxv36COgz9oWm+CgGrd/hM?=
 =?us-ascii?Q?8c5LBzP8h6N4dFQ5S4GYmkQUCPjvTInnwqEsoGQCuG3niVssKeMKoE1HbdiK?=
 =?us-ascii?Q?JuspmReWPVTazz2Zictj0ZPHMc/GZGlVeR7KRQI2BrJdBXtQpSEc0M2SuT/0?=
 =?us-ascii?Q?//0odG7bFm7lULLvouwk1pKn/hcBY/hHBoPoe1TWWHKpHRphs5Ko68tZvjeB?=
 =?us-ascii?Q?vmhQhYHzcpGxdC1ayaKYGrnlGvGJDCCIX0691KkRmLxbS3XhWMTpzPiIRnH4?=
 =?us-ascii?Q?2s2oLolRfM5L+ZNhIIPs2JCWM/gXrLIWLkuee+1hTyCwdDOj4L+kkuHijuCi?=
 =?us-ascii?Q?fnXajsK4Udw/uCfRfOjyvBr2CL3hg3mhTib9aWppf8QYIHXlHVABZSY6b1X3?=
 =?us-ascii?Q?3HOKYZf529pVO3YrNZ9wL7fT0Ml/wZ0lCQuArxNjRrDM3+j/+n1OHFXku5UY?=
 =?us-ascii?Q?zwvE6iwcOkrZEjI4auUzByFjyRlt55oQMy4GYZ1ryMPrEkuTtuXdOZQGd9o0?=
 =?us-ascii?Q?ggxFhipoKd+us/zzcLIojIBEA++oN1u/1cWUK0QXYwS65PIqFDUARAEpH672?=
 =?us-ascii?Q?ZPyepcaf6D+CTvpYYabizKWfN4GTenHBx8Eh9HOLSP0urz3ijgHzyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(48200799018)(7093399012)(35950700016)(61400799027)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:37:58.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd5fd9d-a4fa-4bf5-0c47-08dca1e0f810
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8133

This patch adds support for GPIO pins GPI35 and GPI36 on the Nuvoton
NPCM8xx BMC SoC.

The pins are configured for only for input.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 0cd8a5e00cde..cf021d0e8099 100644
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
@@ -1366,6 +1366,8 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(32,	spi0cs1, MFSEL1, 3,	smb14b, MFSEL7, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(33,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(34,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(35,	gpi35, MFSEL5, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(36,	gpi36, MFSEL5, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1611,6 +1613,8 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(32, "GPIO32/SMB14B_SCL/SPI0_nCS1"),
 	PINCTRL_PIN(33, "GPIO33/I3C4_SCL"),
 	PINCTRL_PIN(34, "GPIO34/I3C4_SDA"),
+	PINCTRL_PIN(35, "MCBPCK/GPI35_AHB2PCI_DIS"),
+	PINCTRL_PIN(36, "SYSBPCK/GPI36"),
 	PINCTRL_PIN(37, "GPIO37/SMB3C_SDA/SMB23_SDA"),
 	PINCTRL_PIN(38, "GPIO38/SMB3C_SCL/SMB23_SCL"),
 	PINCTRL_PIN(39, "GPIO39/SMB3B_SDA/SMB22_SDA"),
@@ -2045,7 +2049,7 @@ static int npcm8xx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const unsigned int *pin = &offset;
 	int mode = fn_gpio;
 
-	if (pin[0] >= 183 && pin[0] <= 189)
+	if ((pin[0] >= 183 && pin[0] <= 189) || pin[0] == 35 || pin[0] == 36)
 		mode = pincfg[pin[0]].fn0;
 
 	npcm8xx_setfunc(npcm->gcr_regmap, &offset, 1, mode);
-- 
2.34.1


