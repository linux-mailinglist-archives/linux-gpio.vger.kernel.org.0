Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA8A2D2CEE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 15:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgLHORZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 09:17:25 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:50219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729461AbgLHORZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 09:17:25 -0500
Received: from orion.localdomain ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MgRYd-1kDanH22NL-00hwaK; Tue, 08 Dec 2020 15:14:32 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     vilhelm.gray@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, joyce.ooi@intel.com, andrew@aj.id.au,
        hoan@os.amperecomputing.com, fancer.lancer@gmail.com,
        orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        andy@kernel.org, matthias.bgg@gmail.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org,
        manivannan.sadhasivam@linaro.org, jun.nie@linaro.org,
        shawnguo@kernel.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ handling
Date:   Tue,  8 Dec 2020 15:14:29 +0100
Message-Id: <20201208141429.8836-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:CG62Zqs8Vn29caHwx21sMJXneczmw1lxjFgvcOLZ2Y5sEc+vcEl
 d2/cJ/IyJjQjpxXNmlJKTUUnOR1tyZaHWui5h7tT0bo70sjR3mEPjtMZb4NwYvEVHryAPkP
 dZ82WOet1UAxRo9HGuksYl1ejIVfYXsJM3Scp8+A9hdwSvxaeRvOY7xvLkbVTZS5Y8i6tmB
 /WHlg3DbIkCL20j1wZtvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hzrnIokgU8Q=:k9nj9698QFXcLpTNbm5suM
 WRXP7YdqZz3U9Tioh61CsPXPuWl+vdzhmOEZ84i6aiMv2315dS7h6mGPqGCfQbfpkKdASDLzs
 2AZPGlrXOO4TncEYVc5k0b/vMvLeLBufw8sAYREUCSi3ETuuZrF7UeTTP/u/KDhOxvwJm5Mel
 OtUPvhJXIGQkmE1mG/l6lQf0kPzzP/ejElx6flmJZK2x0n0f0OjdFDM5d/FYimkrBKzPWHzHK
 As5B8K895Obq6M1gEOUUxurpMOfzGPMhEYL9ITEnKvPhBBLWHwZiBR0HWm6c4okAsUJ0XuJpo
 O4Hu5bReIpaAhEyM+Hij9acWgHlCCh6YKyq3PNCpF3LxDEgHw07TiMoXBsEzt5cz81+mLgS16
 zQGIGfMElaDqngY967hkqkpNqFvp9k9DwSm1FgWv3oWQCFYMIfbz0v3bAJuaX
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Many gpio drivers already use gpiolib's builtin irqchip handling
(CONFIG_GPIOLIB_IRQCHIP), but still has some boilerplate for retrieving
the actual Linux IRQ number and calling into the generic handler.
That boilerplate can be reduced by moving that into a helper function.

This is an RFC patch to outline how that could be done. Note: it's
completely untested yet.

Several drivers still have their completely IRQ own implementation and
thus can't be converted yet. Some of them perhaps could be changed to
store their irq domain in the struct gpio, so the new helper could
also be used for those.

Having all GPIO drivers doing their IRQ management entirely through the
GPIO subsystem (eg. never calling generic_handle_irq() and using the builtin
IRQ handling) would also allow a more direct (eg. callback-based) pin change
notification for GPIO consumers, that doesn't involve registering them as
generic IRQ handlers.

Further reduction of boilerplate could be achieved by additional helpers
for common patterns like for_each_set_bit() loops on irq masks.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-104-dio-48e.c  |  3 +--
 drivers/gpio/gpio-104-idi-48.c   |  4 +---
 drivers/gpio/gpio-104-idio-16.c  |  2 +-
 drivers/gpio/gpio-altera.c       | 15 +++++----------
 drivers/gpio/gpio-aspeed-sgpio.c |  9 +++------
 drivers/gpio/gpio-aspeed.c       |  9 +++------
 drivers/gpio/gpio-cadence.c      |  2 +-
 drivers/gpio/gpio-dln2.c         | 14 ++++----------
 drivers/gpio/gpio-dwapb.c        |  2 +-
 drivers/gpio/gpio-eic-sprd.c     |  4 +---
 drivers/gpio/gpio-ep93xx.c       |  6 ++----
 drivers/gpio/gpio-ftgpio010.c    |  3 +--
 drivers/gpio/gpio-hlwd.c         |  7 ++-----
 drivers/gpio/gpio-intel-mid.c    |  3 +--
 drivers/gpio/gpio-merrifield.c   |  8 ++------
 drivers/gpio/gpio-mt7621.c       |  4 +---
 drivers/gpio/gpio-omap.c         |  3 +--
 drivers/gpio/gpio-pci-idio-16.c  |  2 +-
 drivers/gpio/gpio-pcie-idio-24.c |  3 +--
 drivers/gpio/gpio-pl061.c        |  3 +--
 drivers/gpio/gpio-rcar.c         |  3 +--
 drivers/gpio/gpio-rda.c          |  8 +++-----
 drivers/gpio/gpio-sprd.c         | 11 +++--------
 drivers/gpio/gpio-tqmx86.c       |  9 +++------
 drivers/gpio/gpio-vf610.c        |  3 +--
 drivers/gpio/gpio-ws16c48.c      |  3 +--
 drivers/gpio/gpio-xlp.c          |  3 +--
 drivers/gpio/gpio-zx.c           |  3 +--
 drivers/gpio/gpio-zynq.c         |  8 ++------
 drivers/gpio/gpiolib.c           | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h      | 10 ++++++++++
 31 files changed, 83 insertions(+), 107 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 7a9021c4fa48..ad95c635f23f 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -336,8 +336,7 @@ static irqreturn_t dio48e_irq_handler(int irq, void *dev_id)
 	unsigned long gpio;
 
 	for_each_set_bit(gpio, &irq_mask, 2)
-		generic_handle_irq(irq_find_mapping(chip->irq.domain,
-			19 + gpio*24));
+		gpiochip_raise_irq(chip, 19 + gpio*24);
 
 	raw_spin_lock(&dio48egpio->lock);
 
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 94c3a9bc4e75..19fad907849f 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -224,9 +224,7 @@ static irqreturn_t idi_48_irq_handler(int irq, void *dev_id)
 
 		for_each_set_bit(bit_num, &irq_mask, 8) {
 			gpio = bit_num + boundary * 8;
-
-			generic_handle_irq(irq_find_mapping(chip->irq.domain,
-				gpio));
+			gpiochip_raise_irq(chip, gpio);
 		}
 	}
 
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 50ad0280fd78..aa7c758c9edf 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -205,7 +205,7 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 	int gpio;
 
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
-		generic_handle_irq(irq_find_mapping(chip->irq.domain, gpio));
+		gpiochip_raise_irq(chip, gpio);
 
 	raw_spin_lock(&idio16gpio->lock);
 
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index b7932ecc3b61..37e8e370483b 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -186,14 +186,12 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	struct altera_gpio_chip *altera_gc;
 	struct irq_chip *chip;
 	struct of_mm_gpio_chip *mm_gc;
-	struct irq_domain *irqdomain;
 	unsigned long status;
 	int i;
 
 	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
@@ -201,9 +199,8 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	      (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
 	      readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
 		writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
-		for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
-			generic_handle_irq(irq_find_mapping(irqdomain, i));
-		}
+		for_each_set_bit(i, &status, mm_gc->gc.ngpio)
+			gpiochip_raise_irq(&altera_gc->mmchip.gc, i);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -214,23 +211,21 @@ static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 	struct altera_gpio_chip *altera_gc;
 	struct irq_chip *chip;
 	struct of_mm_gpio_chip *mm_gc;
-	struct irq_domain *irqdomain;
 	unsigned long status;
 	int i;
 
 	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
 	status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
 	status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
 
-	for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
-		generic_handle_irq(irq_find_mapping(irqdomain, i));
-	}
+	for_each_set_bit(i, &status, mm_gc->gc.ngpio)
+		gpiochip_raise_irq(&altera_gc->mmchip.gc, i);
+
 	chained_irq_exit(chip, desc);
 }
 
diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 64e54f8c30d2..19479c775d57 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -392,7 +392,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_sgpio *data = gpiochip_get_data(gc);
-	unsigned int i, p, girq;
+	unsigned int i, p;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
@@ -402,11 +402,8 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
 
-		for_each_set_bit(p, &reg, 32) {
-			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
-			generic_handle_irq(girq);
-		}
-
+		for_each_set_bit(p, &reg, 32)
+			gpiochip_raise_irq(gc, i * 32 + p);
 	}
 
 	chained_irq_exit(ic, desc);
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b966f5e28ebf..b0780120fc8f 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -661,7 +661,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_gpio *data = gpiochip_get_data(gc);
-	unsigned int i, p, girq, banks;
+	unsigned int i, p, banks;
 	unsigned long reg;
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 
@@ -673,11 +673,8 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
 
-		for_each_set_bit(p, &reg, 32) {
-			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
-			generic_handle_irq(girq);
-		}
-
+		for_each_set_bit(p, &reg, 32)
+			gpiochip_raise_irq(gc, i * 32 + p);
 	}
 
 	chained_irq_exit(ic, desc);
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index a4d3239d2594..90f7956d828b 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -133,7 +133,7 @@ static void cdns_gpio_irq_handler(struct irq_desc *desc)
 		~ioread32(cgpio->regs + CDNS_GPIO_IRQ_MASK);
 
 	for_each_set_bit(hwirq, &status, chip->ngpio)
-		generic_handle_irq(irq_find_mapping(chip->irq.domain, hwirq));
+		gpiochip_raise_irq(chip, hwirq);
 
 	chained_irq_exit(irqchip, desc);
 }
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 4c5f6d0c8d74..dee9e1a58156 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -395,7 +395,7 @@ static struct irq_chip dln2_gpio_irqchip = {
 static void dln2_gpio_event(struct platform_device *pdev, u16 echo,
 			    const void *data, int len)
 {
-	int pin, irq;
+	int pin;
 
 	const struct {
 		__le16 count;
@@ -416,23 +416,17 @@ static void dln2_gpio_event(struct platform_device *pdev, u16 echo,
 		return;
 	}
 
-	irq = irq_find_mapping(dln2->gpio.irq.domain, pin);
-	if (!irq) {
-		dev_err(dln2->gpio.parent, "pin %d not mapped to IRQ\n", pin);
-		return;
-	}
-
 	switch (dln2->irq_type[pin]) {
 	case DLN2_GPIO_EVENT_CHANGE_RISING:
 		if (event->value)
-			generic_handle_irq(irq);
+			gpiochip_raise_irq(&dln2->gpio, pin);
 		break;
 	case DLN2_GPIO_EVENT_CHANGE_FALLING:
 		if (!event->value)
-			generic_handle_irq(irq);
+			gpiochip_raise_irq(&dln2->gpio, pin);
 		break;
 	default:
-		generic_handle_irq(irq);
+		gpiochip_raise_irq(&dln2->gpio, pin);
 	}
 }
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2a9046c0fb16..75a7f4feeac1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -200,7 +200,7 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 		int gpio_irq = irq_find_mapping(gc->irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
-		generic_handle_irq(gpio_irq);
+		gpiochip_raise_irq(gc, hwirq);
 
 		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index ad61daf6c212..1e89f853ae3b 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -532,9 +532,7 @@ static void sprd_eic_handle_one_type(struct gpio_chip *chip)
 		for_each_set_bit(n, &reg, SPRD_EIC_PER_BANK_NR) {
 			u32 offset = bank * SPRD_EIC_PER_BANK_NR + n;
 
-			girq = irq_find_mapping(chip->irq.domain, offset);
-
-			generic_handle_irq(girq);
+			gpiochip_raise_irq(chip, offset);
 			sprd_eic_toggle_trigger(chip, girq, offset);
 		}
 	}
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 226da8df6f10..7bd4b9f4ae81 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -122,13 +122,11 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 	 */
 	stat = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
 	for_each_set_bit(offset, &stat, 8)
-		generic_handle_irq(irq_find_mapping(epg->gc[0].irq.domain,
-						    offset));
+		gpiochip_raise_irq(&epg->gc[0], offset);
 
 	stat = readb(epg->base + EP93XX_GPIO_B_INT_STATUS);
 	for_each_set_bit(offset, &stat, 8)
-		generic_handle_irq(irq_find_mapping(epg->gc[1].irq.domain,
-						    offset));
+		gpiochip_raise_irq(&epg->gc[1], offset);
 
 	chained_irq_exit(irqchip, desc);
 }
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 4031164780f7..3f3a5888198b 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -149,8 +149,7 @@ static void ftgpio_gpio_irq_handler(struct irq_desc *desc)
 	stat = readl(g->base + GPIO_INT_STAT_RAW);
 	if (stat)
 		for_each_set_bit(offset, &stat, gc->ngpio)
-			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-							    offset));
+			gpiochip_raise_irq(gc, offset);
 
 	chained_irq_exit(irqchip, desc);
 }
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 4a17599f6d44..5ff7b3386768 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -97,11 +97,8 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	for_each_set_bit(hwirq, &pending, 32) {
-		int irq = irq_find_mapping(hlwd->gpioc.irq.domain, hwirq);
-
-		generic_handle_irq(irq);
-	}
+	for_each_set_bit(hwirq, &pending, 32)
+		gpiochip_raise_irq(&hlwd->gpioc, hwirq);
 
 	chained_irq_exit(chip, desc);
 }
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 86a10c808ef6..4afa70a4c161 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -285,8 +285,7 @@ static void intel_mid_irq_handler(struct irq_desc *desc)
 			mask = BIT(gpio);
 			/* Clear before handling so we can't lose an edge */
 			writel(mask, gedr);
-			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-							    base + gpio));
+			gpiochip_raise_irq(gc, base + gpio);
 		}
 	}
 
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 706687fab634..76af88134018 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -354,12 +354,8 @@ static void mrfld_irq_handler(struct irq_desc *desc)
 		/* Only interrupts that are enabled */
 		pending &= enabled;
 
-		for_each_set_bit(gpio, &pending, 32) {
-			unsigned int irq;
-
-			irq = irq_find_mapping(gc->irq.domain, base + gpio);
-			generic_handle_irq(irq);
-		}
+		for_each_set_bit(gpio, &pending, 32)
+			gpiochip_raise_irq(gc, base + gpio);
 	}
 
 	chained_irq_exit(irqchip, desc);
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..a8dce2cf8787 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -95,9 +95,7 @@ mediatek_gpio_irq_handler(int irq, void *data)
 	pending = mtk_gpio_r32(rg, GPIO_REG_STAT);
 
 	for_each_set_bit(bit, &pending, MTK_BANK_WIDTH) {
-		u32 map = irq_find_mapping(gc->irq.domain, bit);
-
-		generic_handle_irq(map);
+		gpiochip_raise_irq(gc, bit);
 		mtk_gpio_w32(rg, GPIO_REG_STAT, BIT(bit));
 		ret |= IRQ_HANDLED;
 	}
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index f7ceb2b11afc..4562bd00eccf 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -610,8 +610,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 
 			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
 
-			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
-							    bit));
+			gpiochip_raise_irq(&bank->chip, bit);
 
 			raw_spin_unlock_irqrestore(&bank->wa_lock,
 						   wa_lock_flags);
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 9acec76e0b51..1e783c8d8291 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -260,7 +260,7 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
-		generic_handle_irq(irq_find_mapping(chip->irq.domain, gpio));
+		gpiochip_raise_irq(chip, gpio);
 
 	raw_spin_lock(&idio16gpio->lock);
 
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 2a07fd96707e..3d61f4d1b7d1 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -468,8 +468,7 @@ static irqreturn_t idio_24_irq_handler(int irq, void *dev_id)
 	irq_mask = idio24gpio->irq_mask & irq_status;
 
 	for_each_set_bit(gpio, &irq_mask, chip->ngpio - 24)
-		generic_handle_irq(irq_find_mapping(chip->irq.domain,
-			gpio + 24));
+		gpiochip_raise_irq(chip, gpio + 24);
 
 	raw_spin_lock(&idio24gpio->lock);
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f1b53dd1df1a..a729e5cb8bf0 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -223,8 +223,7 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	pending = readb(pl061->base + GPIOMIS);
 	if (pending) {
 		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
-			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-							    offset));
+			gpiochip_raise_irq(gc, offset);
 	}
 
 	chained_irq_exit(irqchip, desc);
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3ef19cef8da9..eac0bf8558be 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -206,8 +206,7 @@ static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 			  gpio_rcar_read(p, INTMSK))) {
 		offset = __ffs(pending);
 		gpio_rcar_write(p, INTCLR, BIT(offset));
-		generic_handle_irq(irq_find_mapping(p->gpio_chip.irq.domain,
-						    offset));
+		gpiochip_raise_irq(&p->gpio_chip, offset);
 		irqs_handled++;
 	}
 
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 28dcbb58b76b..fca520652341 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -181,7 +181,7 @@ static void rda_gpio_irq_handler(struct irq_desc *desc)
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
 	unsigned long status;
-	u32 n, girq;
+	u32 n;
 
 	chained_irq_enter(ic, desc);
 
@@ -189,10 +189,8 @@ static void rda_gpio_irq_handler(struct irq_desc *desc)
 	/* Only lower 8 bits are capable of generating interrupts */
 	status &= RDA_GPIO_IRQ_MASK;
 
-	for_each_set_bit(n, &status, RDA_GPIO_BANK_NR) {
-		girq = irq_find_mapping(chip->irq.domain, n);
-		generic_handle_irq(girq);
-	}
+	for_each_set_bit(n, &status, RDA_GPIO_BANK_NR)
+		gpiochip_raise_irq(chip, n);
 
 	chained_irq_exit(ic, desc);
 }
diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 36ea8a3bd451..4527f7c412d5 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -189,7 +189,7 @@ static void sprd_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct sprd_gpio *sprd_gpio = gpiochip_get_data(chip);
-	u32 bank, n, girq;
+	u32 bank, n;
 
 	chained_irq_enter(ic, desc);
 
@@ -198,13 +198,8 @@ static void sprd_gpio_irq_handler(struct irq_desc *desc)
 		unsigned long reg = readl_relaxed(base + SPRD_GPIO_MIS) &
 			SPRD_GPIO_BANK_MASK;
 
-		for_each_set_bit(n, &reg, SPRD_GPIO_BANK_NR) {
-			girq = irq_find_mapping(chip->irq.domain,
-						bank * SPRD_GPIO_BANK_NR + n);
-
-			generic_handle_irq(girq);
-		}
-
+		for_each_set_bit(n, &reg, SPRD_GPIO_BANK_NR)
+			gpiochip_raise_irq(chip, bank * SPRD_GPIO_BANK_NR + n);
 	}
 	chained_irq_exit(ic, desc);
 }
diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 5022e0ad0fae..baa6627519a5 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -183,7 +183,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	unsigned long irq_bits;
-	int i = 0, child_irq;
+	int i = 0;
 	u8 irq_status;
 
 	chained_irq_enter(irq_chip, desc);
@@ -192,11 +192,8 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
 
 	irq_bits = irq_status;
-	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
-		child_irq = irq_find_mapping(gpio->chip.irq.domain,
-					     i + TQMX86_NGPO);
-		generic_handle_irq(child_irq);
-	}
+	for_each_set_bit(i, &irq_bits, TQMX86_NGPI)
+		gpiochip_raise_irq(&gpio->chip, i + TQMX86_NGPO);
 
 	chained_irq_exit(irq_chip, desc);
 }
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 58776f2d69ff..3a9a040da9a8 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -148,8 +148,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
 		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
-
-		generic_handle_irq(irq_find_mapping(port->gc.irq.domain, pin));
+		gpiochip_raise_irq(&port->gc, pin);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 2d89d0529135..77e1ed5ffa72 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -339,8 +339,7 @@ static irqreturn_t ws16c48_irq_handler(int irq, void *dev_id)
 		for_each_set_bit(port, &int_pending, 3) {
 			int_id = inb(ws16c48gpio->base + 8 + port);
 			for_each_set_bit(gpio, &int_id, 8)
-				generic_handle_irq(irq_find_mapping(
-					chip->irq.domain, gpio + 8*port));
+				gpiochip_raise_irq(chip, gpio + 8*port);
 		}
 
 		int_pending = inb(ws16c48gpio->base + 6) & 0x7;
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index d7b16bb9e4e4..ee10378a80f2 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -216,8 +216,7 @@ static void xlp_gpio_generic_handler(struct irq_desc *desc)
 		}
 
 		if (gpio_stat & BIT(gpio % XLP_GPIO_REGSZ))
-			generic_handle_irq(irq_find_mapping(
-						priv->chip.irq.domain, gpio));
+			gpiochip_raise_irq(&priv->chip, gpio);
 	}
 	chained_irq_exit(irqchip, desc);
 }
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 64bfb722756a..a0c1130b4c66 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -167,8 +167,7 @@ static void zx_irq_handler(struct irq_desc *desc)
 	writew_relaxed(pending, chip->base + ZX_GPIO_IC);
 	if (pending) {
 		for_each_set_bit(offset, &pending, ZX_GPIO_NR)
-			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-							    offset));
+			gpiochip_raise_irq(gc, offset);
 	}
 
 	chained_irq_exit(irqchip, desc);
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0b5a17ab996f..38898ec15443 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -628,12 +628,8 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
 	if (!pending)
 		return;
 
-	for_each_set_bit(offset, &pending, 32) {
-		unsigned int gpio_irq;
-
-		gpio_irq = irq_find_mapping(irqdomain, offset + bank_offset);
-		generic_handle_irq(gpio_irq);
-	}
+	for_each_set_bit(offset, &pending, 32)
+		gpiochip_raise_irq(&gpio->chip, offset + bank_offset);
 }
 
 /**
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..5979c5b7cd86 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4487,3 +4487,26 @@ static int __init gpiolib_debugfs_init(void)
 subsys_initcall(gpiolib_debugfs_init);
 
 #endif	/* DEBUG_FS */
+
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+
+/**
+ * gpiochip_raise_irq() - raise an IRQ corresponding to an GPIO pin.
+ * @gc: the chip
+ * @offset: index number of the GPIO whose IRQ shall be raised
+ *
+ * Helper for drivers using the builtin irqchip functionality. Retrieves the
+ * IRQ number corresponding to given GPIO pin and calls generic IRQ handling.
+ */
+void gpiochip_raise_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	int irq = irq_find_mapping(gc->irq.domain, offset);
+	if (!irq) {
+		dev_warn(gc->parent, "pin %d not mapped to IRQ\n", offset);
+		return;
+	}
+	generic_handle_irq(irq);
+}
+EXPORT_SYMBOL_GPL(gpiochip_raise_irq);
+
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4a7e295c3640..0061c88a0416 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -788,4 +788,14 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+void gpiochip_raise_irq(struct gpio_chip *gc, unsigned int offset);
+#else
+static inline void gpiochip_raise_irq(struct gpio_chip *gc,
+				      unsigned int offset)
+{
+	WARN_ON(1);
+}
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.11.0

