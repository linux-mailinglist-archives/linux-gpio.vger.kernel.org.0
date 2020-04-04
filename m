Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AC919E6AA
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2020 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgDDRUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Apr 2020 13:20:21 -0400
Received: from mail-oln040092009068.outbound.protection.outlook.com ([40.92.9.68]:42988
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbgDDRUV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 4 Apr 2020 13:20:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBYCyBQj4C9SKaf/vn0M57ou5kVdAv5iBrGA/pSG3QKWDKZl9eUCZSSpyKiCceA64gy/tOphuDxfZU7E8si45hDEUwzk48zGQpld8QHK+/NS1TR2bWzME0cOv6QcjFISql2sxN9RQTGXdpI8ZMYYeF+La68wtjDk3nFqDzW/2c57uK1CFjViU8lH8sjW1zqPaEMHoEGmR6kbK3+YYOiQQN4b9nfOYtYWk2FF12+JHqonwfIZczcVLtzSfPVSrw7C/6WRrD8g4JLt61PZAxmKpOicoPVAPMSqa/gXXsCP+s5mXxKjlHz37Xef8A2t4+gCcKjAGVu8QS24R3+ZPsW6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdrFjQhC4RTgH2t8+RYT/LGmHJ/bDys3+vyZf5Ea9Q8=;
 b=aY4iVzJPKb5f5XiBi1OQHhLyWE3/4Tytjvdcs1cgptq4VMgmpIqhEkRqWNx0O7vhPQcl2H5sxofyhk0hqdykwPEXs0NbYwaLwreQD16SF4XUDVQP4Bj0puQplk3mu3T4Ea0xP0z2NLPNjBCeOy9EuqQJ1/nekQTREo1eiMvNzPoeUbMVEUUucj8VO7CZ6p8pBqzPXQVEsA2CZ1ymDguYSI4NtYsFz4kCuvIi+fUB8/oqKbF1CLrNBSpB5Via8qZjSdei5X+AQ1hUsMOV2oJ3qMbCqauj/q9m6ICg0qB6cEHmSZRQH93KQt4ovljVFUTT1bUJMkYxp/EMIDweKdVi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from BN3NAM04FT019.eop-NAM04.prod.protection.outlook.com
 (10.152.92.58) by BN3NAM04HT154.eop-NAM04.prod.protection.outlook.com
 (10.152.93.148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Sat, 4 Apr
 2020 17:20:18 +0000
Received: from BYAPR10MB3479.namprd10.prod.outlook.com
 (2a01:111:e400:7e4e::4f) by BN3NAM04FT019.mail.protection.outlook.com
 (2a01:111:e400:7e4e::173) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19 via Frontend
 Transport; Sat, 4 Apr 2020 17:20:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:945D559C09AC2F49B59F553698D54B91807AFD3DC69F582653470DCFF18F0A66;UpperCasedChecksum:16C04AF2120C2854D453EAA4C9A9000D8039B1A4675E33E4E9C0FE54D0AE0399;SizeAsReceived:7783;Count:48
Received: from BYAPR10MB3479.namprd10.prod.outlook.com
 ([fe80::e144:8ace:8677:a1bd]) by BYAPR10MB3479.namprd10.prod.outlook.com
 ([fe80::e144:8ace:8677:a1bd%4]) with mapi id 15.20.2878.014; Sat, 4 Apr 2020
 17:20:18 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH] pinctrl: samsung: Correct setting of eint wakeup mask on s5pv210
Date:   Sat,  4 Apr 2020 10:08:49 -0700
Message-ID: <BYAPR10MB3479E878C547053C6B952E01A3C40@BYAPR10MB3479.namprd10.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR2001CA0015.namprd20.prod.outlook.com
 (2603:10b6:301:15::25) To BYAPR10MB3479.namprd10.prod.outlook.com
 (2603:10b6:a03:11a::16)
X-Microsoft-Original-Message-ID: <20200404170848.16372-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR2001CA0015.namprd20.prod.outlook.com (2603:10b6:301:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Sat, 4 Apr 2020 17:20:17 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200404170848.16372-1-xc-racer2@live.ca>
X-TMN:  [5f6Q7YgA8UacrHNp2VQ/+jkm+NLv/XQ41l5hVvjxFMDsNCv/0+It1smRKpQt/qkq]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 758aab2a-d7eb-4849-8948-08d7d8bc7260
X-MS-TrafficTypeDiagnostic: BN3NAM04HT154:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHob2zY3LdcjtoV34gF2cD69v52hYZA11RIdOhwyFIEanMb77OIv+ptpNbM/ayUpgzLn6CCaGFHt9S4PRGE+QE5LGuAqIwaswCD0gjQdioo5Q3ELnk2/ESabX/IxGCO67nUDbGRbmC3hWTjf7nSMM/xMhAzwbC5MmTNOdJ+QmXS2Rltu8v2Ow4aOc5IEotVH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3479.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: Z8+M3gSDCxbtYYtoDlo7K0lgTigr+H49vq9aE+iQWj6N5c0HL4eZwO/BeD6jYcVedArqQd+PVgjYCHyYuWIxcddhSqF8MQX52lZuqX0SSH97fCMt9oWBN9xTtzXxgsm9G2r7+lvbTqpTyvad8BboKBJOBHdFS/sWSUrQEfLCnWCxKxu2M23LzI6rHhcJo284iBQ7njMlzeih6Gmpp0yK8g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758aab2a-d7eb-4849-8948-08d7d8bc7260
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2020 17:20:18.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT154
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit a8be2af0218c ("pinctrl: samsung: Write external wakeup interrupt
mask") started writing the eint wakeup mask from the pinctrl driver.
Unfortunately, it made the assumption that the private retention data
was always a regmap while in the case of s5pv210 it is a raw pointer
to the clock base (as the eint wakeup mask not in the PMU as with newer
Exynos platforms).

Fixes: a8be2af0218c ("pinctrl: samsung: Write external wakeup interrupt mask")
Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 73 ++++++++++++++++--------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0599f5127b01..5126a5a6d4c0 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -40,6 +40,8 @@ struct exynos_irq_chip {
 	u32 eint_pend;
 	u32 eint_wake_mask_value;
 	u32 eint_wake_mask_reg;
+	void (*set_eint_wakeup_mask)(struct samsung_pinctrl_drv_data *drvdata,
+				     struct exynos_irq_chip *irq_chip);
 };
 
 static inline struct exynos_irq_chip *to_exynos_irq_chip(struct irq_chip *chip)
@@ -342,6 +344,47 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 	return 0;
 }
 
+static void
+exynos_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
+				    struct exynos_irq_chip *irq_chip)
+{
+	struct regmap *pmu_regs;
+
+	if (!drvdata->retention_ctrl || !drvdata->retention_ctrl->priv) {
+		dev_warn(drvdata->dev,
+			 "No retention data configured bank with external wakeup interrupt. Wake-up mask will not be set.\n");
+		return;
+	}
+
+	pmu_regs = drvdata->retention_ctrl->priv;
+	dev_info(drvdata->dev,
+		 "Setting external wakeup interrupt mask: 0x%x\n",
+		 irq_chip->eint_wake_mask_value);
+
+	regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg,
+		     irq_chip->eint_wake_mask_value);
+}
+
+static void
+s5pv210_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
+				    struct exynos_irq_chip *irq_chip)
+
+{
+	void __iomem *clk_base;
+
+	if (!drvdata->retention_ctrl || !drvdata->retention_ctrl->priv) {
+		dev_warn(drvdata->dev,
+			 "No retention data configured bank with external wakeup interrupt. Wake-up mask will not be set.\n");
+		return;
+	}
+
+
+	clk_base = (void __iomem *) drvdata->retention_ctrl->priv;
+
+	__raw_writel(irq_chip->eint_wake_mask_value,
+		     clk_base + irq_chip->eint_wake_mask_reg);
+}
+
 /*
  * irq_chip for wakeup interrupts
  */
@@ -360,8 +403,9 @@ static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
 	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
-	/* Only difference with exynos4210_wkup_irq_chip: */
+	/* Only differences with exynos4210_wkup_irq_chip: */
 	.eint_wake_mask_reg = S5PV210_EINT_WAKEUP_MASK,
+	.set_eint_wakeup_mask = s5pv210_pinctrl_set_eint_wakeup_mask,
 };
 
 static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
@@ -380,6 +424,7 @@ static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
 	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
 	.eint_wake_mask_reg = EXYNOS_EINT_WAKEUP_MASK,
+	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
 
 static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
@@ -398,6 +443,7 @@ static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
 	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
 	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
 	.eint_wake_mask_reg = EXYNOS5433_EINT_WAKEUP_MASK,
+	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
 
 /* list of external wakeup controllers supported */
@@ -574,27 +620,6 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void
-exynos_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
-				    struct exynos_irq_chip *irq_chip)
-{
-	struct regmap *pmu_regs;
-
-	if (!drvdata->retention_ctrl || !drvdata->retention_ctrl->priv) {
-		dev_warn(drvdata->dev,
-			 "No retention data configured bank with external wakeup interrupt. Wake-up mask will not be set.\n");
-		return;
-	}
-
-	pmu_regs = drvdata->retention_ctrl->priv;
-	dev_info(drvdata->dev,
-		 "Setting external wakeup interrupt mask: 0x%x\n",
-		 irq_chip->eint_wake_mask_value);
-
-	regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg,
-		     irq_chip->eint_wake_mask_value);
-}
-
 static void exynos_pinctrl_suspend_bank(
 				struct samsung_pinctrl_drv_data *drvdata,
 				struct samsung_pin_bank *bank)
@@ -626,8 +651,8 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 		else if (bank->eint_type == EINT_TYPE_WKUP) {
 			if (!irq_chip) {
 				irq_chip = bank->irq_chip;
-				exynos_pinctrl_set_eint_wakeup_mask(drvdata,
-								    irq_chip);
+				irq_chip->set_eint_wakeup_mask(drvdata,
+							       irq_chip);
 			} else if (bank->irq_chip != irq_chip) {
 				dev_warn(drvdata->dev,
 					 "More than one external wakeup interrupt chip configured (bank: %s). This is not supported by hardware nor by driver.\n",
-- 
2.20.1

