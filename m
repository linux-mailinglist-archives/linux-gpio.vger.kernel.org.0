Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538F93BAB9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfFJRNT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:19 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57844 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387495AbfFJRND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:03 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCsIm057127;
        Mon, 10 Jun 2019 12:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186774;
        bh=Z575S9olDMLpCethO+TC+EKmcyRYsczz36ohGuMtYWo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ougQjhc6T67WEzIZlZZqImuxlPpVxQC9c+I8XPjBXo42XdIx2RNjz6fKfP2Qr1P0f
         6IhaW4dM4Kru1NTvvatIZyCzUoBPW/9EL7O4fw+b6dFYohNpKUkWCdrGT61JZd4i8b
         fBgfZ3u/udVxshTjiMwtCEmcevro1FQ05Z+T0v4A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCsQS081099
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCr5F039807;
        Mon, 10 Jun 2019 12:12:53 -0500
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
Subject: [PATCH-next 16/20] gpio: gpio-omap: clean up omap_gpio_restore_context()
Date:   Mon, 10 Jun 2019 20:10:59 +0300
Message-ID: <20190610171103.30903-17-grygorii.strashko@ti.com>
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

Use local variables to store the base iomem address and regs table
pointer like omap_gpio_init_context() does. Not only does this make
the function neater, it also avoids unnecessary reloads of the same
data multiple times.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index c24a91b2df97..1c5fa12bcf9f 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1094,32 +1094,26 @@ static void omap_gpio_init_context(struct gpio_bank *p)
 
 static void omap_gpio_restore_context(struct gpio_bank *bank)
 {
-	writel_relaxed(bank->context.wake_en,
-				bank->base + bank->regs->wkup_en);
-	writel_relaxed(bank->context.ctrl, bank->base + bank->regs->ctrl);
-	writel_relaxed(bank->context.leveldetect0,
-				bank->base + bank->regs->leveldetect0);
-	writel_relaxed(bank->context.leveldetect1,
-				bank->base + bank->regs->leveldetect1);
-	writel_relaxed(bank->context.risingdetect,
-				bank->base + bank->regs->risingdetect);
-	writel_relaxed(bank->context.fallingdetect,
-				bank->base + bank->regs->fallingdetect);
-	writel_relaxed(bank->context.dataout,
-				bank->base + bank->regs->dataout);
-	writel_relaxed(bank->context.oe, bank->base + bank->regs->direction);
+	struct omap_gpio_reg_offs *regs = bank->regs;
+	void __iomem *base = bank->base;
+
+	writel_relaxed(bank->context.wake_en, base + regs->wkup_en);
+	writel_relaxed(bank->context.ctrl, base + regs->ctrl);
+	writel_relaxed(bank->context.leveldetect0, base + regs->leveldetect0);
+	writel_relaxed(bank->context.leveldetect1, base + regs->leveldetect1);
+	writel_relaxed(bank->context.risingdetect, base + regs->risingdetect);
+	writel_relaxed(bank->context.fallingdetect, base + regs->fallingdetect);
+	writel_relaxed(bank->context.dataout, base + regs->dataout);
+	writel_relaxed(bank->context.oe, base + regs->direction);
 
 	if (bank->dbck_enable_mask) {
-		writel_relaxed(bank->context.debounce, bank->base +
-					bank->regs->debounce);
+		writel_relaxed(bank->context.debounce, base + regs->debounce);
 		writel_relaxed(bank->context.debounce_en,
-					bank->base + bank->regs->debounce_en);
+			       base + regs->debounce_en);
 	}
 
-	writel_relaxed(bank->context.irqenable1,
-				bank->base + bank->regs->irqenable);
-	writel_relaxed(bank->context.irqenable2,
-				bank->base + bank->regs->irqenable2);
+	writel_relaxed(bank->context.irqenable1, base + regs->irqenable);
+	writel_relaxed(bank->context.irqenable2, base + regs->irqenable2);
 }
 
 static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
-- 
2.17.1

