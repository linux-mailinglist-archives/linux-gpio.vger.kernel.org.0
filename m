Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807C5F21D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfD3IiE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 04:38:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43632 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfD3IiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 04:38:04 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hLOGz-0002Pv-O3; Tue, 30 Apr 2019 08:37:58 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     linus.walleij@linaro.org, hotwater438@tutanota.com,
        hdegoede@redhat.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v2] pinctrl: intel: Clear interrupt status in mask/unmask callback
Date:   Tue, 30 Apr 2019 16:37:53 +0800
Message-Id: <20190430083753.18197-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
added because clearing interrupt status bit is required to avoid
unexpected behavior.

Turns out the unmask callback also needs the fix, which can solve weird
IRQ triggering issues on I2C touchpad ELAN1200.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
- Clear interrupt status for both mask/umask cases.
- Reduce calculation under irq spinlock.

 drivers/pinctrl/intel/pinctrl-intel.c | 37 +++++----------------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3b1818184207..717148d2818c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -913,35 +913,6 @@ static void intel_gpio_irq_ack(struct irq_data *d)
 	}
 }
 
-static void intel_gpio_irq_enable(struct irq_data *d)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
-	const struct intel_community *community;
-	const struct intel_padgroup *padgrp;
-	int pin;
-
-	pin = intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), &community, &padgrp);
-	if (pin >= 0) {
-		unsigned int gpp, gpp_offset, is_offset;
-		unsigned long flags;
-		u32 value;
-
-		gpp = padgrp->reg_num;
-		gpp_offset = padgroup_offset(padgrp, pin);
-		is_offset = community->is_offset + gpp * 4;
-
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		/* Clear interrupt status first to avoid unexpected interrupt */
-		writel(BIT(gpp_offset), community->regs + is_offset);
-
-		value = readl(community->regs + community->ie_offset + gpp * 4);
-		value |= BIT(gpp_offset);
-		writel(value, community->regs + community->ie_offset + gpp * 4);
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
-}
-
 static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -954,15 +925,20 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 	if (pin >= 0) {
 		unsigned int gpp, gpp_offset;
 		unsigned long flags;
-		void __iomem *reg;
+		void __iomem *reg, *is;
 		u32 value;
 
 		gpp = padgrp->reg_num;
 		gpp_offset = padgroup_offset(padgrp, pin);
 
 		reg = community->regs + community->ie_offset + gpp * 4;
+		is = community->regs + community->is_offset + gpp * 4;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
+
+		/* Clear interrupt status first to avoid unexpected interrupt */
+		writel(BIT(gpp_offset), is);
+
 		value = readl(reg);
 		if (mask)
 			value &= ~BIT(gpp_offset);
@@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 
 static struct irq_chip intel_gpio_irqchip = {
 	.name = "intel-gpio",
-	.irq_enable = intel_gpio_irq_enable,
 	.irq_ack = intel_gpio_irq_ack,
 	.irq_mask = intel_gpio_irq_mask,
 	.irq_unmask = intel_gpio_irq_unmask,
-- 
2.17.1

