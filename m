Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9FF3BA86
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387986AbfFJRLp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:11:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44286 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:11:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBd7L121407;
        Mon, 10 Jun 2019 12:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186699;
        bh=tu/SUu2V3efavxkNRHESxd84IC8q2p3Gcgu5d5DU25I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GI378v7wpKOtFuPuyuqv9VJaKZ7pZOD/cEOgUDCEOeW83/5mDgpftc5Y1ZRJUG0RW
         vcMxQWDv10jTM4JpAGCj6A3yzddTmFJ13KfY/RX27XxELxf0fKu8kjrzcvUxb67k2a
         xunkxf2yskJt0nmx/fECidoA3C9TznS6ocC8eDW8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBdff045001
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:39 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBbFk050644;
        Mon, 10 Jun 2019 12:11:38 -0500
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
Subject: [PATCH-next 04/20] gpio: gpio-omap: clean up edge interrupt handling
Date:   Mon, 10 Jun 2019 20:10:47 +0300
Message-ID: <20190610171103.30903-5-grygorii.strashko@ti.com>
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

The edge interrupt handling was effectively:

	isr = ISR_reg & enabled;
	if (bank->level_mask)
		level_mask = bank->level_mask & enabled;
	else
		level_mask = 0;

	edge = isr & ~level_mask;

When bank->level_mask is zero, level_mask will be computed as zero
anyway, so the if() statement is redundant.  We are then left with:

	isr = ISR_reg & enabled;
	level_mask = bank->level_mask & enabled;
	edge = isr & ~level_mask;

This can be simplified further to:

	isr = ISR_reg & enabled;
	edge = isr & ~bank->level_mask;

since the second mask with 'enabled' is redundant.

Improve the associated comment as well.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 708a135e2f0c..01da1c17bb20 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -733,7 +733,7 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 {
 	void __iomem *isr_reg = NULL;
-	u32 enabled, isr, level_mask;
+	u32 enabled, isr, edge;
 	unsigned int bit;
 	struct gpio_bank *bank = gpiobank;
 	unsigned long wa_lock_flags;
@@ -753,16 +753,14 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 		enabled = omap_get_gpio_irqbank_mask(bank);
 		isr = readl_relaxed(isr_reg) & enabled;
 
-		if (bank->level_mask)
-			level_mask = bank->level_mask & enabled;
-		else
-			level_mask = 0;
-
-		/* clear edge sensitive interrupts before handler(s) are
-		called so that we don't miss any interrupt occurred while
-		executing them */
-		if (isr & ~level_mask)
-			omap_clear_gpio_irqbank(bank, isr & ~level_mask);
+		/*
+		 * Clear edge sensitive interrupts before calling handler(s)
+		 * so subsequent edge transitions are not missed while the
+		 * handlers are running.
+		 */
+		edge = isr & ~bank->level_mask;
+		if (edge)
+			omap_clear_gpio_irqbank(bank, edge);
 
 		raw_spin_unlock_irqrestore(&bank->lock, lock_flags);
 
-- 
2.17.1

