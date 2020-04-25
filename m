Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A279A1B89DE
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2020 01:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgDYXLc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 19:11:32 -0400
Received: from mail-dm6nam11olkn2084.outbound.protection.outlook.com ([40.92.19.84]:27552
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726239AbgDYXLb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 19:11:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNDg9M58m4KPKIOcMbbuqV3CoTzVJfbVaYqMBzFOgpU2GeMbLO0gOLde1wTvg5+BMj3rzEzW7cRT6Wm2omWSIp57XWsyzGQY8B5aO+qOgLAScIFd/LbSoBReB61qw/5fNmXnx8bDJ2tR5tbac5d77oPq6Qj5Wqo6SpCYprNJAm9KnM6mA7gyIadh/peZbLU+b/sYtJO3fdExh2mvvwMkQzumudmpkB7wao9PtXp8ZMgvjUOK968i0LxXwbsBukThTqV34AyIgqnOu6+Y/GA6sOgCGuZGfAcsfnP0Z83ZcfBi2TbtLEzgdkBaV9xirLIhnQ/H7BZvc1UDvxfNznBsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0vXJVE32lpkWDnoBufx3otVqVnCBilyUb9wirqRsIQ=;
 b=StunFb0/QsGW2I7DTb0pvV3IFRq5m9IlauD4J7x1U3GcN+ldh9gdtPL+uauI2Jn+vFVLX2nfXVCYJ1dRsvSvQ2PwZxK5UzUzJx3uP8gjW+fgzdALWSzzSf9Y25N/wX0VMDaKb8Snj4Wtr4wCVdFvitKC0xLnkfN89/iTqOTOQVQylAm9oZQO+x6WwqQv61UiCAHZmHxzo66TmvbwGrSXfT/JgA+yklju+wWkCmsPOMdtbPXH3n+x+h/jvFS2oH2I64P51o51wFYPcjjvlh+OC0eyjpHyV8EVhdJq/wmLGfIYTyyWKXH+iB+ND8EWndfebio4vXz9ssgmpQoMg18j6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::44) by
 CO1NAM11HT021.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::265)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sat, 25 Apr
 2020 23:11:28 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::50) by CO1NAM11FT007.mail.protection.outlook.com
 (2a01:111:e400:3861::131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sat, 25 Apr 2020 23:11:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AEF0FFCBC70ED89B5CEE39BBFD344B835AC0B34541CC669B770D3986EA2BFB6B;UpperCasedChecksum:1409D41779AA5219069FB68F99550B7C6EC4C1F5BBD0179917BCDCED26E06C41;SizeAsReceived:7782;Count:48
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sat, 25 Apr 2020
 23:11:28 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH] pinctrl: samsung: Save/restore eint_mask over suspend for EINT_TYPE GPIOs
Date:   Sat, 25 Apr 2020 16:10:46 -0700
Message-ID: <BN6PR04MB06600C848C2C1531F73DAD7BA3D10@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR2001CA0002.namprd20.prod.outlook.com
 (2603:10b6:301:15::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200425231046.7381-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR2001CA0002.namprd20.prod.outlook.com (2603:10b6:301:15::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sat, 25 Apr 2020 23:11:27 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200425231046.7381-1-xc-racer2@live.ca>
X-TMN:  [v4KQYPAa7LHoXyTQ3BJOLgpRKgDXt8UQgT+4jQWyjVcnrreUqbupHOgxGtTdkfv7]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 18b11ac3-b476-4960-521a-08d7e96dfbda
X-MS-TrafficTypeDiagnostic: CO1NAM11HT021:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pavvT/rzneMqC9LlLgL9EVoAQZmJyDGsk83kporlgA2acwLSZ/C0kuZRcoHJO8gdEcD19/KerBHSKJpGx7tkNH5+2fZp+B+gisXMu/GlDvU3KdgQTuaAtwkrtFtb5mrHduVOXRytJF6In+s5N5cL2AyOxYYyBHCQTuo6TWX/m+tDlvZysk/3Ozg+GMUNZaQONxuBXeLLMsKICBaOIXEQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: ss3lKa0wDOcFcr300byaVJm6hEj2f2NIpe3eDO495av7AU0Gqq+w157NNa16mk233k69qchCnjDC8qbU1ylmiHC0HUSpeBHvg1Pmg7ErGVc/yVpauGNvDQi68I2N8HJZsZJp5h6+A02OnkJtcda7db6YgekJtf9XmujQaD5fgkdAX5gL8U1TMkhGwVBnC582OqUdtaXMjWVPjEoY3pY75g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b11ac3-b476-4960-521a-08d7e96dfbda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2020 23:11:28.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT021
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, for EINT_TYPE GPIOs, the CON and FLTCON registers
are saved and restored over a suspend/resume cycle.  However, the
EINT_MASK registers are not.

On S5PV210 at the very least, these registers are not retained over
suspend, leading to the interrupts remaining masked upon resume and
therefore no interrupts being triggered for the device.  There should
be no effect on any SoCs that do retain these registers as theoretically
we would just be re-writing what was already there.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0599f5127b01..e6ddb54afaf2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -265,6 +265,7 @@ struct exynos_eint_gpio_save {
 	u32 eint_con;
 	u32 eint_fltcon0;
 	u32 eint_fltcon1;
+	u32 eint_mask;
 };
 
 /*
@@ -608,10 +609,13 @@ static void exynos_pinctrl_suspend_bank(
 						+ 2 * bank->eint_offset);
 	save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
 						+ 2 * bank->eint_offset + 4);
+	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+						+ bank->eint_offset);
 
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
 	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
+	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
 void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
@@ -653,6 +657,9 @@ static void exynos_pinctrl_resume_bank(
 	pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
 			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
 			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
+	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			readl(regs + bank->irq_chip->eint_mask
+			+ bank->eint_offset), save->eint_mask);
 
 	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
@@ -660,6 +667,8 @@ static void exynos_pinctrl_resume_bank(
 						+ 2 * bank->eint_offset);
 	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
 						+ 2 * bank->eint_offset + 4);
+	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+						+ bank->eint_offset);
 }
 
 void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
-- 
2.20.1

