Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123DC7A9EF5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 22:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjIUUPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 16:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjIUUPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 16:15:34 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75921E65
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 10:27:04 -0700 (PDT)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
        by SHSQR01.spreadtrum.com with ESMTP id 38LCR04X004698
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 20:27:00 +0800 (+08)
        (envelope-from Wenhua.Lin@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 38LCPbUe001534;
        Thu, 21 Sep 2023 20:25:37 +0800 (+08)
        (envelope-from Wenhua.Lin@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Rrvfd109xz2SbdYm;
        Thu, 21 Sep 2023 20:22:17 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx06.spreadtrum.com
 (10.0.1.11) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 21 Sep
 2023 20:25:36 +0800
From:   Wenhua Lin <Wenhua.Lin@unisoc.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        wenhua lin <wenhua.lin1994@gmail.com>,
        Wenhua Lin <Wenhua.Lin@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 1/2] gpio: pmic-eic-sprd: Two-dimensional arrays maintain pmic eic
Date:   Thu, 21 Sep 2023 20:25:26 +0800
Message-ID: <20230921122527.15261-2-Wenhua.Lin@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921122527.15261-1-Wenhua.Lin@unisoc.com>
References: <20230921122527.15261-1-Wenhua.Lin@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx06.spreadtrum.com (10.0.1.11)
X-MAIL: SHSQR01.spreadtrum.com 38LCPbUe001534
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A bank PMIC EIC contains 16 EICs, and the operating registers
are BIT0-BIT15, such as BIT0 of the register operated by EIC0.
Using the one-dimensional array reg[CACHE_NR_REGS] for maintenance
will cause the configuration of other EICs to be affected when
operating a certain EIC. In order to solve this problem, the register
operation bits of each PMIC EIC are maintained through the two-dimensional
array reg[SPRD_PMIC_EIC_NR][CACHE_NR_REGS] to avoid mutual interference.

Signed-off-by: Wenhua Lin <Wenhua.Lin@unisoc.com>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index c3e4d90f6b18..442968bb2490 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -57,7 +57,7 @@ struct sprd_pmic_eic {
 	struct gpio_chip chip;
 	struct regmap *map;
 	u32 offset;
-	u8 reg[CACHE_NR_REGS];
+	u8 reg[SPRD_PMIC_EIC_NR][CACHE_NR_REGS];
 	struct mutex buslock;
 	int irq;
 };
@@ -151,8 +151,8 @@ static void sprd_pmic_eic_irq_mask(struct irq_data *data)
 	struct sprd_pmic_eic *pmic_eic = gpiochip_get_data(chip);
 	u32 offset = irqd_to_hwirq(data);
 
-	pmic_eic->reg[REG_IE] = 0;
-	pmic_eic->reg[REG_TRIG] = 0;
+	pmic_eic->reg[offset][REG_IE] = 0;
+	pmic_eic->reg[offset][REG_TRIG] = 0;
 
 	gpiochip_disable_irq(chip, offset);
 }
@@ -165,8 +165,8 @@ static void sprd_pmic_eic_irq_unmask(struct irq_data *data)
 
 	gpiochip_enable_irq(chip, offset);
 
-	pmic_eic->reg[REG_IE] = 1;
-	pmic_eic->reg[REG_TRIG] = 1;
+	pmic_eic->reg[offset][REG_IE] = 1;
+	pmic_eic->reg[offset][REG_TRIG] = 1;
 }
 
 static int sprd_pmic_eic_irq_set_type(struct irq_data *data,
@@ -174,13 +174,14 @@ static int sprd_pmic_eic_irq_set_type(struct irq_data *data,
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct sprd_pmic_eic *pmic_eic = gpiochip_get_data(chip);
+	u32 offset = irqd_to_hwirq(data);
 
 	switch (flow_type) {
 	case IRQ_TYPE_LEVEL_HIGH:
-		pmic_eic->reg[REG_IEV] = 1;
+		pmic_eic->reg[offset][REG_IEV] = 1;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		pmic_eic->reg[REG_IEV] = 0;
+		pmic_eic->reg[offset][REG_IEV] = 0;
 		break;
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_EDGE_FALLING:
@@ -222,15 +223,15 @@ static void sprd_pmic_eic_bus_sync_unlock(struct irq_data *data)
 			sprd_pmic_eic_update(chip, offset, SPRD_PMIC_EIC_IEV, 1);
 	} else {
 		sprd_pmic_eic_update(chip, offset, SPRD_PMIC_EIC_IEV,
-				     pmic_eic->reg[REG_IEV]);
+				     pmic_eic->reg[offset][REG_IEV]);
 	}
 
 	/* Set irq unmask */
 	sprd_pmic_eic_update(chip, offset, SPRD_PMIC_EIC_IE,
-			     pmic_eic->reg[REG_IE]);
+			     pmic_eic->reg[offset][REG_IE]);
 	/* Generate trigger start pulse for debounce EIC */
 	sprd_pmic_eic_update(chip, offset, SPRD_PMIC_EIC_TRIG,
-			     pmic_eic->reg[REG_TRIG]);
+			     pmic_eic->reg[offset][REG_TRIG]);
 
 	mutex_unlock(&pmic_eic->buslock);
 }
-- 
2.17.1

