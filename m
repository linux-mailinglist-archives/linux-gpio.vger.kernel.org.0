Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D0F3BAAB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388524AbfFJRMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47510 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388374AbfFJRMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCkoX069441;
        Mon, 10 Jun 2019 12:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186766;
        bh=m1ug7LxSUoFk48EY3hMAGYvppWcbpofYoVD/PZeuruc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OKBx1JbCRIvUUAwl0OfhB/oCLyh6xK9/RhHeM3DYIdfMPfKMGkkTv+GsRBbtRruz7
         CvioOvK6K2DDtA4PlE2k1Aabjtu4i3LdqmgE8bZ0/Gvb4DJZqU6WxzkyuBxXE/U8Vm
         R9SQgBLC4Pq9rTMk8f+plbVlypoa3n+K5fnxjIak=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCkUc046510
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCiGH067789;
        Mon, 10 Jun 2019 12:12:45 -0500
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
Subject: [PATCH-next 14/20] gpio: gpio-omap: simplify omap_set_gpio_irqenable()
Date:   Mon, 10 Jun 2019 20:10:57 +0300
Message-ID: <20190610171103.30903-15-grygorii.strashko@ti.com>
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

omap_set_gpio_irqenable() calls two helpers that are almost the same
apart from whether they set or clear bits. We can consolidate these:

- in the set/clear bit register case, we can perform the operation on
  our saved context copy and write the appropriate set/clear register.
- otherwise, we can use our read-modify-write helper and invert enable
  if irqenable_inv is set.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 61 ++++++++++------------------------------
 1 file changed, 15 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 097ed8d1a117..a90e27d7ce5e 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -529,57 +529,26 @@ static u32 omap_get_gpio_irqbank_mask(struct gpio_bank *bank)
 	return l;
 }
 
-static void omap_enable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
-{
-	void __iomem *reg = bank->base;
-	u32 l;
-
-	if (bank->regs->set_irqenable) {
-		reg += bank->regs->set_irqenable;
-		l = gpio_mask;
-		bank->context.irqenable1 |= gpio_mask;
-	} else {
-		reg += bank->regs->irqenable;
-		l = readl_relaxed(reg);
-		if (bank->regs->irqenable_inv)
-			l &= ~gpio_mask;
-		else
-			l |= gpio_mask;
-		bank->context.irqenable1 = l;
-	}
-
-	writel_relaxed(l, reg);
-}
-
-static void omap_disable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
+static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
+					   unsigned offset, int enable)
 {
 	void __iomem *reg = bank->base;
-	u32 l;
+	u32 gpio_mask = BIT(offset);
 
-	if (bank->regs->clr_irqenable) {
-		reg += bank->regs->clr_irqenable;
-		l = gpio_mask;
-		bank->context.irqenable1 &= ~gpio_mask;
+	if (bank->regs->set_irqenable && bank->regs->clr_irqenable) {
+		if (enable) {
+			reg += bank->regs->set_irqenable;
+			bank->context.irqenable1 |= gpio_mask;
+		} else {
+			reg += bank->regs->clr_irqenable;
+			bank->context.irqenable1 &= ~gpio_mask;
+		}
+		writel_relaxed(gpio_mask, reg);
 	} else {
-		reg += bank->regs->irqenable;
-		l = readl_relaxed(reg);
-		if (bank->regs->irqenable_inv)
-			l |= gpio_mask;
-		else
-			l &= ~gpio_mask;
-		bank->context.irqenable1 = l;
+		bank->context.irqenable1 =
+			omap_gpio_rmw(reg + bank->regs->irqenable, gpio_mask,
+				      enable ^ bank->regs->irqenable_inv);
 	}
-
-	writel_relaxed(l, reg);
-}
-
-static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
-					   unsigned offset, int enable)
-{
-	if (enable)
-		omap_enable_gpio_irqbank(bank, BIT(offset));
-	else
-		omap_disable_gpio_irqbank(bank, BIT(offset));
 }
 
 /* Use disable_irq_wake() and enable_irq_wake() functions from drivers */
-- 
2.17.1

