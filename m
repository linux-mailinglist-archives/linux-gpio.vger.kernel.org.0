Return-Path: <linux-gpio+bounces-8186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8392EFC7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 21:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D06C1F222B6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83331187358;
	Thu, 11 Jul 2024 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="eO5uAoSQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazrln10220001.outbound.protection.outlook.com [52.103.192.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4217CA01;
	Thu, 11 Jul 2024 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.192.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726686; cv=fail; b=YuDsU24xHhgIsBtDeSow8o1xKvmx2l+BpJe4IiCujQ1djstA+3rwdRFxMuvKj6moWqS/Y1hby6cshHIDx4jN+Uyu3DrDFUGHKnlkH/dWLAMRO5sCVG7jRiYHH8Yh25kLNFSywASDy7t/Z1C5A4IRhmguhzkiyOa7wBwnoUFYlzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726686; c=relaxed/simple;
	bh=wLERqOg3IOA61rAbdWc1O9aLEzCAR7mPxT2aY7IyCEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UX2OVBlJ1JL7ySI0z2Y3InuMFk1BnxIpD+1nDaM+Em6xw15TgAOeRmY3jMgYusJtmgtH5bIxfGlr7R7iV4AtvS6AnMkmUC0teEy8EgbidLm/4ru1bLtaeqidZSS2gVJc06/5qQ3l+lgNHk13zkm/G8MQZ64ZtyqiPe78SxNb+aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=eO5uAoSQ; arc=fail smtp.client-ip=52.103.192.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Grk58fqRcEiBEL3tZHBnej/saJpWB2O66NgVh02PcUUvKhvzcASEvcM3L0SPquHMi+hWLiKq/Rtzg1lnhvf2YZeFFdIfS5yIdrbMi9a8rllaMm/nH+wgljXn5NWothbG+lJE2zC32NlKQm0jjvAN2pJGSPDKjLuavv619QjHUzXQtbzcohoxptbZQIvqwaO4tmg44OilDlDaH3ClGHcOwnGdmUPyzmEc32KNuaCwjPlX94j/wiEOrS6R07dG3CmUKXV5g8X1tz8RwYvaph+3R8l6ykiA0gbSIZWTaWiYpATnmXlJDnjwYHdExk+zP/YjKOEjJEPdxt3XtcNlS5R45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4gAGeUdTH8paOcwbB8b86f47vaYh01/EbkRdcsypis=;
 b=BRnkfNFzzFPQ08r8oAKIVA3pgR/sVFEf7+AHHg0Fvuo8m+xYmQcH3Q7Ep/Ef1kejDNYga39uzkQxMcEU/HbfFMi1t/vYjRJzFC30Z0WFpOyXlJ7WXUQcUnCd3yI5/33VutDj2yzUbl12DgadSYzgB+s4MjYaApVm+KRRPEroKaP7qoZjQT6PiGc6px5ILFem3q43Xcplxuj0z7pBInMRlKU2tKrP0rjFSuf01l75GdO055mIicQVD9/8aQ4fArZ2dabAjtF7valOmzy49d2kSZlJ4mUFKcn/x2ZKEFZYrOCpWojU0HkdMWOE0SHT9p472AIW/ltX0PEuEtPRpdRWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4gAGeUdTH8paOcwbB8b86f47vaYh01/EbkRdcsypis=;
 b=eO5uAoSQk0/6QJT0MznrxYS4YOSOwSQ8kKc/BmLNaRLo3VECfill+pQCiF2uXKU9z4xwM5vbuwlO2V7pBNGSVpXnfM4en7WA7+CWMPaPdDXtIgfgglRmsah3gSHWskFNTIK+BX/YMXHq/FlbIWGEnxH4Gq3zm5vKNwM6ylEM93U=
Received: from SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) by SEYPR03MB7815.apcprd03.prod.outlook.com
 (2603:1096:101:171::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 19:37:58 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::4c) by SI2PR01CA0009.outlook.office365.com
 (2603:1096:4:191::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 19:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:37:56 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:55 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id D45FE5F671;
	Thu, 11 Jul 2024 22:37:54 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id D42CDDC0F7F; Thu, 11 Jul 2024 22:37:54 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/7] pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
Date: Thu, 11 Jul 2024 22:37:43 +0300
Message-ID: <20240711193749.2397471-2-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|SEYPR03MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: a70cb453-7af2-4594-4ce1-08dca1e0f6ff
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|7093399012|61400799027|48200799018|82310400026|35950700016|376014|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?clCf4KcYN0hcydLAriXHHt9XJfU/XS9xr79gNt1WFlbn7x9VOz880w+uBenT?=
 =?us-ascii?Q?T9lrlXAebCJ1+i+pRq8H88SbG3XWmORHPxZbG87ZJTUILr+V7/NRo8X/540I?=
 =?us-ascii?Q?ozF1dZQ2KH24svj/bD9a+RYeDiEInl0wBR/twUh+qvGHmP5X+/f6TeTxDYj7?=
 =?us-ascii?Q?kqsSmQ7m0h6gof+EJAuqAe7iUWTzjRZZOi6a96PGZNplYApncKcva1uY+smC?=
 =?us-ascii?Q?dfk7XH++oIVBJdNBoG7443/KXnnLynBTMYQ8fCnaMlUhdmWipaxI9RTgpUFZ?=
 =?us-ascii?Q?9D5cMXVfnls2JFnqWWsXvjwvuckyXEsbEsdT5IaFFTFiCqdZUROHF9HtmpM7?=
 =?us-ascii?Q?FndHrL6F/F2AN7EsLmEnvxyHCB7dkmRLp7DSovkfX21XHAEV2ECun3iyqBKY?=
 =?us-ascii?Q?FWvQ6LQsIr09HqjgCVpTaxgQjdJR9Ti46GS38JF9SAUc3MHm8FMTnIKVcTIi?=
 =?us-ascii?Q?2mPxjRVM1tKm5rl1A0YV7GrwrlsRY1Bj9u5ZtTr96BJP9ymNSzriDeIKa0EE?=
 =?us-ascii?Q?p3zB4hy/Kj6xNRgTwXo/qhbru26j3u9SWYSyEboHl7gk1L2jj0t1Hm47S4l1?=
 =?us-ascii?Q?qijFbAEOB4qsnT/ThHnPzM5CE2MQWUJkrE8qSt3OsLPnWWJd6QrTDi4BpWIX?=
 =?us-ascii?Q?5Wj0fBIAEY4eRlkKqqeZZ7BZLldk/RfVYIwRTnzKGGCBuxa5a3H6HGWNS+ds?=
 =?us-ascii?Q?pC+0l6J0uhD78LXAWcCbyNurnZMmAlrQ46Zrwga1blVsnAFuF+ULxZTZhtnx?=
 =?us-ascii?Q?i0lIDfXgm4sWf+jGoD4JxHxhp5zncs4dLaKdV29i/BHN6sBZ9SAyv5ebIshc?=
 =?us-ascii?Q?cWnCv7+XAQwX8RXKg2+rg5EMTBg1fi7260ASxK8Mw35hDLXBJkGCbTHhz1tb?=
 =?us-ascii?Q?O0jVXTKfNZM9w7T8I62Mz3Q+/6WnQotLo7Mxrdvnl9lTeHpZgp3R6tbCVyNp?=
 =?us-ascii?Q?SqLRjMN0t+/PVo+l/wM2XO/yHMtVWyyXbKWAGbxGD9KAlzvlCjxibI1DZkTs?=
 =?us-ascii?Q?j17bYam8dRksT+UiAukU8yzPz/d4FGJxOqRMi45Qi4JtDcHcLNX3L/LSrOjl?=
 =?us-ascii?Q?o1UT2rBQURNBJDoJhqA/jD6gE6bPk1C/adZQjMVVIsx1Q/o11vn6TRhnFYXw?=
 =?us-ascii?Q?xLwcBieyDpFXYuFJxhmE45Wholv86Ogdd6W+5yJCyNTyFwxQ8wpDmuwNL1M/?=
 =?us-ascii?Q?nkrq1oRFy6OHb5Wqr/SZjWwU5JuYwSda07HJQJdpG2Olfqvumo/CUJ1bKkvL?=
 =?us-ascii?Q?I+mjUiv+634EZmimcwDLJW1D0g4g6UiB9AMe1cRx7IkgC9q4TQNMWuRSn6o1?=
 =?us-ascii?Q?qinOS/UcO0F7KWGJtrTxa0+MT6yknIXHUtKkXo+mGawpiowZMaaQX8V0j0zn?=
 =?us-ascii?Q?bflwYYHb1ua3JzaqR9ZyCxCDUskY2NgUEhvGHkmlhLvG4kqUga0RZ4rjwLmA?=
 =?us-ascii?Q?sAnDutcF10x2lVHuoEG6GFyg9dy7R+csrxqeHakwh97tFDkvVOWnCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(7093399012)(61400799027)(48200799018)(82310400026)(35950700016)(376014)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:37:56.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a70cb453-7af2-4594-4ce1-08dca1e0f6ff
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7815

Clear polarity before setting both edges to ensure that the polarity is
in the same state before configuring events for both edges

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index a377d36b0eb0..0cd8a5e00cde 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -241,6 +241,7 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
+		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-- 
2.34.1


