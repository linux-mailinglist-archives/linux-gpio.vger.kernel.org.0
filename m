Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72EC8B067
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 09:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfHMHBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 03:01:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37931 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMHBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Aug 2019 03:01:30 -0400
Received: by mail-lf1-f67.google.com with SMTP id h28so75947484lfj.5
        for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2019 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDwX+OlvaGVnD0PINMaKdZYf3XHTjwaKWaXBq4LCRbE=;
        b=ZuJm9msJwnXXFXjqTOkipXSS+yF3WDwb7zagySN3D6+RLBljBknUbJ+D7aRjXG1HJ4
         nfHBisqwfSLmcOEm8VAD4HtyZ434OTDVX/Xz5Iy/T7me4g5V3s57AgSOSBN4BLat2KuX
         ngrEdJR7iVYYWobUf9xSZyebGkRUlb6LZY385gLWqhCCUDtTCWhHqdNxuaPV6JbdxMqs
         s7wi4VXbvwcT6PrfqJhKWAYZqwxAPugvbdyntlnJC3/P+cF4AqAoXkCLoxM091WXV/bP
         xevucZi6358+/+yeL5NcPUjkcEN2eLCMECLIUY+8oE22djDEGaDJZ2sM3abPrFtICyCl
         gO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDwX+OlvaGVnD0PINMaKdZYf3XHTjwaKWaXBq4LCRbE=;
        b=m/rpDSd2cSBdV3MtUdqjLpg8rAsIEqtILTILh8Jhv2k382QSnj13oHCpnOYx3J6JRn
         3T4p+ebw53jCbgctais2NtJNW/ni6YTlViznxgU/QGiiRJX+sHH6HKpMjbheEfpvHkFK
         aaSoF8EFsRxjWaDX1S//y5tc5Zcp5XgjsXR3so2FEFNW+M63HT8qq91Z96emmcFZOAvn
         VSayuHplHTGQLjb9zlckDdYgaEzqr0BVJrpZRb1dkgaIOZDlTI6/Zgeff/v//avpMPZf
         ykeRPy8mD+4NybZOVtE5tgAhzyE7QuoAoySrcD5xkSLZ93G1lQnbBBdnVUrgIJIsMq3u
         ZQuw==
X-Gm-Message-State: APjAAAUr0/ubHUVDrma3eKITYJZVWmDiw8VrIrv3JiWA0MrCKQoon+nD
        n+nkQl9XQWFk/3scPslI8FbkdAdn/cI=
X-Google-Smtp-Source: APXvYqz5IIXsNJPttAk/NJciV5EgiHY8/yiNzMCcCGUt3K7gC3FlTZflE1ojKBZ13OUOS/jhJpHUlw==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr9072520lfn.75.1565679687046;
        Tue, 13 Aug 2019 00:01:27 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z25sm19516714lfi.51.2019.08.13.00.01.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 00:01:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] RFC: pinctrl: cherryview: Pass irqchip when adding gpiochip
Date:   Tue, 13 Aug 2019 09:01:23 +0200
Message-Id: <20190813070123.17406-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

This driver is something of a special case, so we need to
discuss it.

It picks a number of IRQ descriptors before setting up
the gpio_irq_chip using devm_irq_alloc_descs() giving a
fixed irq base in the IRQ numberspace. It then games the
irqchip API by associating IRQs from that base and upward
with as many pins there are in the "community" which is a
set of pins. Then after each gpio_chip is registered, it
fills in the pin to IRQ map for each GPIO range inside
that "community" with irq_domain_associate_many() which
works fine since the descriptors were allocated
previously.

This is actually a hierarchical irq_chip as far as I can
tell. The problem is that very likely the Intel root IRQ
chip is not hierarchical so it does not support using the
facilities for hierarchical irqdomains.

I will soon merge the patch providing hierarchical irqchip
support in gpiolib:
https://lore.kernel.org/linux-gpio/20190808123242.5359-1-linus.walleij@linaro.org/

Will we need to bite the bullet and convert the root
irqchip for the intels to support hierarcical irqdomain?

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 37 +++++++++++++++-------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 03ec7a5d9d0b..932da7071356 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1547,6 +1547,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 {
 	const struct chv_gpio_pinrange *range;
 	struct gpio_chip *chip = &pctrl->chip;
+	struct gpio_irq_chip *girq;
 	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
 	const struct chv_community *community = pctrl->community;
 	int ret, i, irq_base;
@@ -1559,12 +1560,6 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->base = -1;
 	chip->irq.need_valid_mask = need_valid_mask;
 
-	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "Failed to register gpiochip\n");
-		return ret;
-	}
-
 	for (i = 0; i < community->ngpio_ranges; i++) {
 		range = &community->gpio_ranges[i];
 		ret = gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
@@ -1610,6 +1605,11 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
+	/*
+	 * FIXME: this picks as many IRQs as there are lines in the
+	 * "community", which is then later associated per-range below
+	 * registering the gpio_chip. This is actually hierarchical IRQ.
+	 */
 	if (!need_valid_mask) {
 		irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
 						community->npins, NUMA_NO_NODE);
@@ -1619,13 +1619,30 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		}
 	}
 
-	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
-				   handle_bad_irq, IRQ_TYPE_NONE);
+	girq = &chip->irq;
+	girq->chip = &chv_gpio_irqchip;
+	girq->parent_handler = chv_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(pctrl->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_handler = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
-		dev_err(pctrl->dev, "failed to add IRQ chip\n");
+		dev_err(pctrl->dev, "Failed to register gpiochip\n");
 		return ret;
 	}
 
+	/*
+	 * FIXME: this associates a different IRQ with each discrete range
+	 * inside the community. If we use the hierarchical irq support,
+	 * the .translate() function can do this translation for each IRQ.
+	 */
 	if (!need_valid_mask) {
 		for (i = 0; i < community->ngpio_ranges; i++) {
 			range = &community->gpio_ranges[i];
@@ -1636,8 +1653,6 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		}
 	}
 
-	gpiochip_set_chained_irqchip(chip, &chv_gpio_irqchip, irq,
-				     chv_gpio_irq_handler);
 	return 0;
 }
 
-- 
2.21.0

