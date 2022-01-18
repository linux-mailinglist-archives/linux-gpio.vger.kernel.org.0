Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED4849168C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 03:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344083AbiARCe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 21:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343824AbiARC1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jan 2022 21:27:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79BAC0617AB;
        Mon, 17 Jan 2022 18:25:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67676B81244;
        Tue, 18 Jan 2022 02:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F190C36AE3;
        Tue, 18 Jan 2022 02:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642472726;
        bh=JRwEwaQ2ghXjEgsdO+LW6h97cIMvCsKA8iS5G29TpR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PLc0DTi7QQyqExaAx/h+6cP4053GdtVLRSigT843GESdWSl9v2W7CJWb2Pr6/ohST
         9FJFCNOWQPLpZbKUZjzV75X5o024vRU8qaOnjJGyO3vwRITiNPmAPw5hCmjHTmxN5Y
         cqjloGbEiWvFnlOZkxgcBK5RnsDQ6srzGNXtZ8h+h+caQs565ofZ+J2sIq3UmBaYtJ
         VmO2hdrkx92tbWoH2W6WFlFuoJPpHwxXRbC4IBzgtGZlkukvH91a2IqLaG9hPZmIe+
         qzDlWufAWiRkMVEfK1YJ/mTRQKGzsOu/WVVETwSu94sw70175A8POsr2gWQwOiu1KQ
         duhiND18fsLsw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Iwona Winiarska <iwona.winiarska@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sasha Levin <sashal@kernel.org>, linus.walleij@linaro.org,
        joel@jms.id.au, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.16 115/217] gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
Date:   Mon, 17 Jan 2022 21:17:58 -0500
Message-Id: <20220118021940.1942199-115-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Iwona Winiarska <iwona.winiarska@intel.com>

[ Upstream commit 61a7904b6ace99b1bde0d0e867fa3097f5c8cee2 ]

The gpio-aspeed driver implements an irq_chip which need to be invoked
from hardirq context. Since spin_lock() can sleep with PREEMPT_RT, it is
no longer legal to invoke it while interrupts are disabled.
This also causes lockdep to complain about:
[    0.649797] [ BUG: Invalid wait context ]
because aspeed_gpio.lock (spin_lock_t) is taken under irq_desc.lock
(raw_spinlock_t).
Let's use of raw_spinlock_t instead of spinlock_t.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-aspeed.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3c8f20c57695f..318a7d95a1a8b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -53,7 +53,7 @@ struct aspeed_gpio_config {
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	struct irq_chip irqc;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	void __iomem *base;
 	int irq;
 	const struct aspeed_gpio_config *config;
@@ -413,14 +413,14 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	unsigned long flags;
 	bool copro;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	__aspeed_gpio_set(gc, offset, val);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -435,7 +435,7 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	if (!have_input(gpio, offset))
 		return -ENOTSUPP;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
 	reg &= ~GPIO_BIT(offset);
@@ -445,7 +445,7 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -463,7 +463,7 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	if (!have_output(gpio, offset))
 		return -ENOTSUPP;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
 	reg |= GPIO_BIT(offset);
@@ -474,7 +474,7 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -492,11 +492,11 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (!have_output(gpio, offset))
 		return GPIO_LINE_DIRECTION_IN;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	val = ioread32(bank_reg(gpio, bank, reg_dir)) & GPIO_BIT(offset);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
@@ -539,14 +539,14 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
 
 	status_addr = bank_reg(gpio, bank, reg_irq_status);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	iowrite32(bit, status_addr);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
@@ -565,7 +565,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	reg = ioread32(addr);
@@ -577,7 +577,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_gpio_irq_mask(struct irq_data *d)
@@ -629,7 +629,7 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	addr = bank_reg(gpio, bank, reg_irq_type0);
@@ -649,7 +649,7 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	irq_set_handler_locked(d, handler);
 
@@ -716,7 +716,7 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 
 	treg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	val = readl(treg);
@@ -730,7 +730,7 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -856,7 +856,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 		return rc;
 	}
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	if (timer_allocation_registered(gpio, offset)) {
 		rc = unregister_allocated_timer(gpio, offset);
@@ -916,7 +916,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 	configure_timer(gpio, offset, i);
 
 out:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -927,13 +927,13 @@ static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
 	unsigned long flags;
 	int rc;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	rc = unregister_allocated_timer(gpio, offset);
 	if (!rc)
 		configure_timer(gpio, offset, 0);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -1015,7 +1015,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	/* Sanity check, this shouldn't happen */
 	if (gpio->cf_copro_bankmap[bindex] == 0xff) {
@@ -1036,7 +1036,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	if (bit)
 		*bit = GPIO_OFFSET(offset);
  bail:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_grab_gpio);
@@ -1060,7 +1060,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	/* Sanity check, this shouldn't happen */
 	if (gpio->cf_copro_bankmap[bindex] == 0) {
@@ -1074,7 +1074,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
 					      GPIO_CMDSRC_ARM);
  bail:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
@@ -1148,7 +1148,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-	spin_lock_init(&gpio->lock);
+	raw_spin_lock_init(&gpio->lock);
 
 	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
 	if (!gpio_id)
-- 
2.34.1

