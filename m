Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8FA3BA8C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388030AbfFJRMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57636 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBqo2056883;
        Mon, 10 Jun 2019 12:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186712;
        bh=TuqR0tjSyc/vB0nQFmM5342CE4L+35tfFSIcGQDFXP0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DRH4bVZ9Aw4fFz5aVpWB4UlsxLjXZR31ID074DlsKiWZ6rFRcdhzW7mPtdx32+9Ya
         YgvwcaH1EUcjKm5iSbg2JzL9wNraq/Ne+ZdsDMwelG4mHftlJE5tjyhKiXQWt72Exo
         zeCpJiURxx0RkEWhmQnPlJdGY/fRxniRpQSc/N1k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBqbb079970
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBpx1050793;
        Mon, 10 Jun 2019 12:11:51 -0500
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
Subject: [PATCH-next 06/20] gpio: gpio-omap: move omap_gpio_request() and omap_gpio_free()
Date:   Mon, 10 Jun 2019 20:10:49 +0300
Message-ID: <20190610171103.30903-7-grygorii.strashko@ti.com>
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

Move these two functions to live beside the rest of the gpio chip
implementation, rather than in the middle of the irq chip
implementation.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 64 ++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 04e3da55e39c..cc320d09d074 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -689,38 +689,6 @@ static int omap_gpio_wake_enable(struct irq_data *d, unsigned int enable)
 	return irq_set_irq_wake(bank->irq, enable);
 }
 
-static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	struct gpio_bank *bank = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	pm_runtime_get_sync(chip->parent);
-
-	raw_spin_lock_irqsave(&bank->lock, flags);
-	omap_enable_gpio_module(bank, offset);
-	bank->mod_usage |= BIT(offset);
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-
-	return 0;
-}
-
-static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	struct gpio_bank *bank = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&bank->lock, flags);
-	bank->mod_usage &= ~(BIT(offset));
-	if (!LINE_USED(bank->irq_usage, offset)) {
-		omap_set_gpio_direction(bank, offset, 1);
-		omap_clear_gpio_debounce(bank, offset);
-	}
-	omap_disable_gpio_module(bank, offset);
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-
-	pm_runtime_put(chip->parent);
-}
-
 /*
  * We need to unmask the GPIO bank interrupt as soon as possible to
  * avoid missing GPIO interrupts for other lines in the bank.
@@ -951,6 +919,38 @@ static inline void omap_mpuio_init(struct gpio_bank *bank)
 
 /*---------------------------------------------------------------------*/
 
+static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
+{
+	struct gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	pm_runtime_get_sync(chip->parent);
+
+	raw_spin_lock_irqsave(&bank->lock, flags);
+	omap_enable_gpio_module(bank, offset);
+	bank->mod_usage |= BIT(offset);
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
+}
+
+static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
+{
+	struct gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&bank->lock, flags);
+	bank->mod_usage &= ~(BIT(offset));
+	if (!LINE_USED(bank->irq_usage, offset)) {
+		omap_set_gpio_direction(bank, offset, 1);
+		omap_clear_gpio_debounce(bank, offset);
+	}
+	omap_disable_gpio_module(bank, offset);
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	pm_runtime_put(chip->parent);
+}
+
 static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank;
-- 
2.17.1

