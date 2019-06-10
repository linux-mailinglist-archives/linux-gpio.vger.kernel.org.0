Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12E33BA8B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388040AbfFJRLv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:11:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47298 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRLv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:11:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBjwX069101;
        Mon, 10 Jun 2019 12:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186705;
        bh=z3YzyKVQTJo6QkBGPqZ9gkEZ1EkFSdA9cg7U4o7oZDU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tIRRSyB4F2qK2E1Re4wYsQI41LQtOjA3HKf0CQx4HixuRI7QXhmY9U0BtmA5gZ+fb
         YzMPhSDDBU0qT1I/yF0akCKZGooYQ7MRoXaP1/ik+4Kb+6m61TgUytltea3rDAmeR9
         4rKQ9Vx4Od9hTCGSinh4Ze/7nOK3xGpxC4tzIHHI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBjrJ079893
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBi5r066791;
        Mon, 10 Jun 2019 12:11:45 -0500
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
Subject: [PATCH-next 05/20] gpio: gpio-omap: remove irq_ack method
Date:   Mon, 10 Jun 2019 20:10:48 +0300
Message-ID: <20190610171103.30903-6-grygorii.strashko@ti.com>
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

The irq_ack method does not fit our hardware requirements. Edge
interrupts must be cleared before we handle them, and level interrupts
must be cleared after handling them.

We handle the interrupt clearance in our interrupt handler for edge IRQs
and in the unmask method for level IRQs.

Replace the irq_ack method with the no-op method from the dummy irq
chip.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 01da1c17bb20..04e3da55e39c 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -852,14 +852,6 @@ static void gpio_irq_bus_sync_unlock(struct irq_data *data)
 	pm_runtime_put(bank->chip.parent);
 }
 
-static void omap_gpio_ack_irq(struct irq_data *d)
-{
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
-
-	omap_clear_gpio_irqstatus(bank, offset);
-}
-
 static void omap_gpio_mask_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
@@ -1181,11 +1173,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 #endif
 
 	/* MPUIO is a bit different, reading IRQ status clears it */
-	if (bank->is_mpuio) {
-		irqc->irq_ack = dummy_irq_chip.irq_ack;
-		if (!bank->regs->wkup_en)
-			irqc->irq_set_wake = NULL;
-	}
+	if (bank->is_mpuio && !bank->regs->wkup_en)
+		irqc->irq_set_wake = NULL;
 
 	irq = &bank->chip.irq;
 	irq->chip = irqc;
@@ -1531,7 +1520,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 
 	irqc->irq_startup = omap_gpio_irq_startup,
 	irqc->irq_shutdown = omap_gpio_irq_shutdown,
-	irqc->irq_ack = omap_gpio_ack_irq,
+	irqc->irq_ack = dummy_irq_chip.irq_ack,
 	irqc->irq_mask = omap_gpio_mask_irq,
 	irqc->irq_unmask = omap_gpio_unmask_irq,
 	irqc->irq_set_type = omap_gpio_irq_type,
-- 
2.17.1

