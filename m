Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9801F4638
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732014AbgFISY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:24:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:21539 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389158AbgFISY4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:24:56 -0400
IronPort-SDR: uEenU7bMtDhnZx9t+JmQzi9+w57kgPsuwoP93i6w2WK/e8HeBjKElPA+NLd62iy7ucEvJMW5j8
 tySw5IPD1ZWg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:52 -0700
IronPort-SDR: pcdkqGR+RzfDOzUqfuoikFVRsAucjNJbRXweAEk3zMGLRUI6mom1Vmc4eJBgEiC95WcbiNoz1M
 frNinZqXBa5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="270971292"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2020 11:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C9F45182; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/6] pinctrl: cherryview: Introduce helpers to IO with common registers
Date:   Tue,  9 Jun 2020 21:24:45 +0300
Message-Id: <20200609182449.45813-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin control device and effectively the single community in it has
a set of common registers. It's good to have a helpers to IO on them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 39 ++++++++++++++--------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index afff7c0fc33f..28ed2f3b42a1 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -598,6 +598,20 @@ static const struct chv_community *chv_communities[] = {
  */
 static DEFINE_RAW_SPINLOCK(chv_lock);
 
+static u32 chv_pctrl_readl(struct chv_pinctrl *pctrl, unsigned int offset)
+{
+	return readl(pctrl->regs + offset);
+}
+
+static void chv_pctrl_writel(struct chv_pinctrl *pctrl, unsigned int offset, u32 value)
+{
+	void __iomem *reg = pctrl->regs + offset;
+
+	/* Write and simple read back to confirm the bus transferring done */
+	writel(value, reg);
+	readl(reg);
+}
+
 static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
 				unsigned int reg)
 {
@@ -1264,7 +1278,7 @@ static void chv_gpio_irq_ack(struct irq_data *d)
 	intr_line = chv_readl(pctrl, pin, CHV_PADCTRL0);
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
 	intr_line >>= CHV_PADCTRL0_INTSEL_SHIFT;
-	chv_writel(BIT(intr_line), pctrl->regs + CHV_INTSTAT);
+	chv_pctrl_writel(pctrl, CHV_INTSTAT, BIT(intr_line));
 
 	raw_spin_unlock(&chv_lock);
 }
@@ -1283,12 +1297,12 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
 	intr_line >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
-	value = readl(pctrl->regs + CHV_INTMASK);
+	value = chv_pctrl_readl(pctrl, CHV_INTMASK);
 	if (mask)
 		value &= ~BIT(intr_line);
 	else
 		value |= BIT(intr_line);
-	chv_writel(value, pctrl->regs + CHV_INTMASK);
+	chv_pctrl_writel(pctrl, CHV_INTMASK, value);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 }
@@ -1419,7 +1433,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	pending = readl(pctrl->regs + CHV_INTSTAT);
+	pending = chv_pctrl_readl(pctrl, CHV_INTSTAT);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	for_each_set_bit(intr_line, &pending, pctrl->community->nirqs) {
@@ -1514,12 +1528,11 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 		 * Mask all interrupts the community is able to generate
 		 * but leave the ones that can only generate GPEs unmasked.
 		 */
-		chv_writel(GENMASK(31, pctrl->community->nirqs),
-			   pctrl->regs + CHV_INTMASK);
+		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, pctrl->community->nirqs));
 	}
 
 	/* Clear all interrupts */
-	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
+	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
 
 	return 0;
 }
@@ -1618,9 +1631,9 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
 	if (function == ACPI_WRITE)
-		chv_writel((u32)(*value), pctrl->regs + (u32)address);
+		chv_pctrl_writel(pctrl, address, *value);
 	else if (function == ACPI_READ)
-		*value = readl(pctrl->regs + (u32)address);
+		*value = chv_pctrl_readl(pctrl, address);
 	else
 		ret = AE_BAD_PARAMETER;
 
@@ -1718,7 +1731,7 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	pctrl->saved_intmask = readl(pctrl->regs + CHV_INTMASK);
+	pctrl->saved_intmask = chv_pctrl_readl(pctrl, CHV_INTMASK);
 
 	for (i = 0; i < pctrl->community->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
@@ -1754,7 +1767,7 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 	 * registers because we don't know in which state BIOS left them
 	 * upon exiting suspend.
 	 */
-	chv_writel(0, pctrl->regs + CHV_INTMASK);
+	chv_pctrl_writel(pctrl, CHV_INTMASK, 0x0000);
 
 	for (i = 0; i < pctrl->community->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
@@ -1791,8 +1804,8 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 	 * Now that all pins are restored to known state, we can restore
 	 * the interrupt mask register as well.
 	 */
-	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
-	chv_writel(pctrl->saved_intmask, pctrl->regs + CHV_INTMASK);
+	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
+	chv_pctrl_writel(pctrl, CHV_INTMASK, pctrl->saved_intmask);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
-- 
2.27.0.rc2

