Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC35312CAE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhBHJAJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:00:09 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12866 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbhBHI54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 03:57:56 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DZ0Gl2z3Xz7hv4;
        Mon,  8 Feb 2021 16:55:27 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Mon, 8 Feb 2021
 16:56:44 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <grygorii.strashko@ti.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
Subject: [PATCH for next v1 1/2] gpio: omap: Replace raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Date:   Mon, 8 Feb 2021 16:56:16 +0800
Message-ID: <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to use API with _irqsave in omap_gpio_irq_handler(),
because it already be in a irq-disabled context.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/gpio-omap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 41952bb..dc8bbf4 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -560,8 +560,6 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 	u32 enabled, isr, edge;
 	unsigned int bit;
 	struct gpio_bank *bank = gpiobank;
-	unsigned long wa_lock_flags;
-	unsigned long lock_flags;
 
 	isr_reg = bank->base + bank->regs->irqstatus;
 	if (WARN_ON(!isr_reg))
@@ -572,7 +570,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 		return IRQ_NONE;
 
 	while (1) {
-		raw_spin_lock_irqsave(&bank->lock, lock_flags);
+		raw_spin_lock(&bank->lock);
 
 		enabled = omap_get_gpio_irqbank_mask(bank);
 		isr = readl_relaxed(isr_reg) & enabled;
@@ -586,7 +584,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 		if (edge)
 			omap_clear_gpio_irqbank(bank, edge);
 
-		raw_spin_unlock_irqrestore(&bank->lock, lock_flags);
+		raw_spin_unlock(&bank->lock);
 
 		if (!isr)
 			break;
@@ -595,7 +593,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 			bit = __ffs(isr);
 			isr &= ~(BIT(bit));
 
-			raw_spin_lock_irqsave(&bank->lock, lock_flags);
+			raw_spin_lock(&bank->lock);
 			/*
 			 * Some chips can't respond to both rising and falling
 			 * at the same time.  If this irq was requested with
@@ -606,15 +604,14 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 			if (bank->toggle_mask & (BIT(bit)))
 				omap_toggle_gpio_edge_triggering(bank, bit);
 
-			raw_spin_unlock_irqrestore(&bank->lock, lock_flags);
+			raw_spin_unlock(&bank->lock);
 
-			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
+			raw_spin_lock(&bank->wa_lock);
 
 			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
 							    bit));
 
-			raw_spin_unlock_irqrestore(&bank->wa_lock,
-						   wa_lock_flags);
+			raw_spin_unlock(&bank->wa_lock);
 		}
 	}
 exit:
-- 
2.7.4

