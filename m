Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799FE3BAB3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfFJRNK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:10 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57880 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727648AbfFJRNK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD2Rj057173;
        Mon, 10 Jun 2019 12:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186782;
        bh=PdG6fDwiLCyl8IHfrirYyXQkMfqtxO8fxTPg3c14VNg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bgQzh6jmCYwrs/es+kwb7fHSz8jgDAe98+MEoSgSxX69zCntx9ScBl7hMqssO9YfH
         rcn/I1oFPdnvv8lEAuBtF1J9+KyGxdLo6/Z1DTlHwUNFDRekuA/dVQph8kWwtdbjVL
         DQt1FFaaIdnsYvuoGT9xnWavADGgW7pX9c+55n1M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHD2EP013552
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:13:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:13:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:13:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD1Kf052214;
        Mon, 10 Jun 2019 12:13:02 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 18/20] gpio: gpio-omap: clean up wakeup handling
Date:   Mon, 10 Jun 2019 20:11:01 +0300
Message-ID: <20190610171103.30903-19-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 039bbb1ae6cb..61e32c7e6670 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -305,12 +305,6 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 	bank->level_mask = bank->context.leveldetect0 |
 			   bank->context.leveldetect1;
 
-	if (likely(!(bank->non_wakeup_gpios & gpio_bit))) {
-		omap_gpio_rmw(base + bank->regs->wkup_en, gpio_bit, trigger != 0);
-		bank->context.wake_en =
-			readl_relaxed(bank->base + bank->regs->wkup_en);
-	}
-
 	/* This part needs to be executed always for OMAP{34xx, 44xx} */
 	if (!bank->regs->irqctrl && !omap_gpio_is_off_wakeup_capable(bank, gpio)) {
 		/*
@@ -343,7 +337,6 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 				    unsigned trigger)
 {
 	void __iomem *reg = bank->base;
-	void __iomem *base = bank->base;
 	u32 l = 0;
 
 	if (bank->regs->leveldetect0 && bank->regs->wkup_en) {
@@ -375,11 +368,6 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 			l |= 2 << (gpio << 1);
 		if (trigger & IRQ_TYPE_EDGE_FALLING)
 			l |= BIT(gpio << 1);
-
-		/* Enable wake-up during idle for dynamic tick */
-		omap_gpio_rmw(base + bank->regs->wkup_en, BIT(gpio), trigger);
-		bank->context.wake_en =
-			readl_relaxed(bank->base + bank->regs->wkup_en);
 		writel_relaxed(l, reg);
 	}
 	return 0;
@@ -408,17 +396,6 @@ static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned offset)
 
 static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
 {
-	void __iomem *base = bank->base;
-
-	if (bank->regs->wkup_en &&
-	    !LINE_USED(bank->mod_usage, offset) &&
-	    !LINE_USED(bank->irq_usage, offset)) {
-		/* Disable wake-up during idle for dynamic tick */
-		omap_gpio_rmw(base + bank->regs->wkup_en, BIT(offset), 0);
-		bank->context.wake_en =
-			readl_relaxed(bank->base + bank->regs->wkup_en);
-	}
-
 	if (bank->regs->ctrl && !BANK_USED(bank)) {
 		void __iomem *reg = bank->base + bank->regs->ctrl;
 		u32 ctrl;
@@ -549,6 +526,19 @@ static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
 			omap_gpio_rmw(reg + bank->regs->irqenable, gpio_mask,
 				      enable ^ bank->regs->irqenable_inv);
 	}
+
+	/*
+	 * Program GPIO wakeup along with IRQ enable to satisfy OMAP4430 TRM
+	 * note requiring correlation between the IRQ enable registers and
+	 * the wakeup registers.  In any case, we want wakeup from idle
+	 * enabled for the GPIOs which support this feature.
+	 */
+	if (bank->regs->wkup_en &&
+	    (bank->regs->edgectrl1 || !(bank->non_wakeup_gpios & gpio_mask))) {
+		bank->context.wake_en =
+			omap_gpio_rmw(bank->base + bank->regs->wkup_en,
+				      gpio_mask, enable);
+	}
 }
 
 /* Use disable_irq_wake() and enable_irq_wake() functions from drivers */
-- 
2.17.1

