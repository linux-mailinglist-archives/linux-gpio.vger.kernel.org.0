Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43193BAA7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388479AbfFJRMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47490 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388374AbfFJRMt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCd4r069377;
        Mon, 10 Jun 2019 12:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186759;
        bh=E2VsaT4+Yu4S9xAGSUBcnO1WYenuJ5B2QhgSL4vZl1M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aZVQyZpJnzqXNlu95UrXSUjdES47+TJg7maxYlHxoB9U4kdBeb5P8eWYC6tfhe1sc
         76JE45pFEcAh1LvwKKEbVDG2gcmIEctWBkWHMEZtwUzmqG0WL3Q0NsgIcvinCpBUgf
         IrLoDkLM1Ec4el5kTTZDnSiSsTpS9kryNJP5FZac=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCde2080910
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCcbS039651;
        Mon, 10 Jun 2019 12:12:38 -0500
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
Subject: [PATCH-next 13/20] gpio: gpio-omap: simplify omap_toggle_gpio_edge_triggering()
Date:   Mon, 10 Jun 2019 20:10:56 +0300
Message-ID: <20190610171103.30903-14-grygorii.strashko@ti.com>
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

This function open-codes an exclusive-or bitwise operation using an
if() statement and explicitly setting or clearing the bit. Instead,
use an exclusive-or operation instead, and simplify the function.

We can combine the preprocessor conditional using IS_ENABLED() and
gain some additional compilation coverage.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 1a0890586b45..097ed8d1a117 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -326,32 +326,18 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 	}
 }
 
-#ifdef CONFIG_ARCH_OMAP1
 /*
  * This only applies to chips that can't do both rising and falling edge
  * detection at once.  For all other chips, this function is a noop.
  */
 static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
 {
-	void __iomem *reg = bank->base;
-	u32 l = 0;
-
-	if (!bank->regs->irqctrl)
-		return;
-
-	reg += bank->regs->irqctrl;
+	if (IS_ENABLED(CONFIG_ARCH_OMAP1) && bank->regs->irqctrl) {
+		void __iomem *reg = bank->base + bank->regs->irqctrl;
 
-	l = readl_relaxed(reg);
-	if ((l >> gpio) & 1)
-		l &= ~(BIT(gpio));
-	else
-		l |= BIT(gpio);
-
-	writel_relaxed(l, reg);
+		writel_relaxed(readl_relaxed(reg) ^ BIT(gpio), reg);
+	}
 }
-#else
-static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio) {}
-#endif
 
 static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 				    unsigned trigger)
-- 
2.17.1

