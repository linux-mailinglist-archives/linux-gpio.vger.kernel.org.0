Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC431E94AF
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgEaALb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgEaAL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:11:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29D3C08C5CA;
        Sat, 30 May 2020 17:11:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v19so7339035wmj.0;
        Sat, 30 May 2020 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/qqSfLjKkG/CC5CtAlFtO9K7r/VC6yMAZmB7aTtn0LU=;
        b=H0ZwBJLIX6kzFlOwZ20H0EEL4E/z1rjAxWfc8t4tOsV0IIZsetFA51knqjFmfBzQcK
         cXPkOTMIEBnkY5NaaCoUB8LcOCls5K3kVZaceU0uRicxkGyBFdZvRuKT5RvnOZkdWw2I
         ihY19vKONopg7vUMjV9Mfg5B0sDK6PdM4hqPtzCcxWfXfq/BAdNLNFuS2c0toXpLnbRV
         XvcgBCv/Rx8gM+rDcpsoDIkS7QxuCLNvIIWGdpucytBqHQlMO8Fr7ChIqmultiI/ztgj
         GqiUKhppUlcsNukryd0mlTx3dkXa3zgO3LALTaxZ2F+rYEwXEYriGkOVZOb2qhV/7OCQ
         R6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/qqSfLjKkG/CC5CtAlFtO9K7r/VC6yMAZmB7aTtn0LU=;
        b=W3s7a35VUTRlkYQCY5PXl1O8MBhVoeIaTHalgW3XPxVLvanfih3v5+0GJJpx8NfFaH
         b7L3xueNS/CYRV3K2w0NbgGqixK5fek9YUt0fvKK45SaEx+OsB1D/xJvlxYf0NW9EcPe
         97wfjnnFeUTEe8qN12vhhYf+hUKt7IMbElDhtQNWymv5F/nFEmBjLvKYhaJLQ7Volkwk
         CtazQLvfm/98CeOGV+qoBfKlEpwRiJKBWzUglZF09bvzv+U8l7Xb9Oaq6v3kRmIezh7N
         B7MYCDGYJnDqSX6BLRWNGiAbte2+Vh04fbFI+I2QwZNPDLO4Isblx/o+CUSBMGs4kkS2
         cWkQ==
X-Gm-Message-State: AOAM5312uuFmaKPD6f5vxZyyjI/p+oDHo/w+OH9OVu0M1EPwGl3A77zi
        FWJxFBkrJ5K9SqbLgutpIarrsn5R
X-Google-Smtp-Source: ABdhPJy/M+901ea8s/lIkKWWZLnduLHfcOF9kwrw5iHEv9IZl3il7NY4FGYscm/HIVm6HqxUObFDrA==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr14662126wmz.43.1590883883176;
        Sat, 30 May 2020 17:11:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d17sm15455807wrg.75.2020.05.30.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:11:22 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v3 4/4] pinctrl: bcm2835: Add support for wake-up interrupts
Date:   Sat, 30 May 2020 17:11:01 -0700
Message-Id: <20200531001101.24945-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531001101.24945-1-f.fainelli@gmail.com>
References: <20200531001101.24945-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Leverage the IRQCHIP_MASK_ON_SUSPEND flag in order to avoid having to
specifically treat the GPIO interrupts during suspend and resume, and
simply implement an irq_set_wake() callback that is responsible for
enabling the parent wake-up interrupt as a wake-up interrupt.

To avoid allocating unnecessary resources for other chips, the wake-up
interrupts are only initialized if we have a brcm,bcm7211-gpio
compatibility string.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 76 ++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 1b00d93aa66e..1d21129f7751 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -19,6 +19,7 @@
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -76,6 +77,7 @@
 struct bcm2835_pinctrl {
 	struct device *dev;
 	void __iomem *base;
+	int *wake_irq;
 
 	/* note: locking assumes each bank will have its own unsigned long */
 	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
@@ -435,6 +437,11 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(host_chip, desc);
 }
 
+static irqreturn_t bcm2835_gpio_wake_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_HANDLED;
+}
+
 static inline void __bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
 	unsigned reg, unsigned offset, bool enable)
 {
@@ -634,6 +641,34 @@ static void bcm2835_gpio_irq_ack(struct irq_data *data)
 	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
 }
 
+static int bcm2835_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned gpio = irqd_to_hwirq(data);
+	unsigned int irqgroup;
+	int ret = -EINVAL;
+
+	if (!pc->wake_irq)
+		return ret;
+
+	if (gpio <= 27)
+		irqgroup = 0;
+	else if (gpio >= 28 && gpio <= 45)
+		irqgroup = 1;
+	else if (gpio >= 46 && gpio <= 57)
+		irqgroup = 2;
+	else
+		return ret;
+
+	if (on)
+		ret = enable_irq_wake(pc->wake_irq[irqgroup]);
+	else
+		ret = disable_irq_wake(pc->wake_irq[irqgroup]);
+
+	return ret;
+}
+
 static struct irq_chip bcm2835_gpio_irq_chip = {
 	.name = MODULE_NAME,
 	.irq_enable = bcm2835_gpio_irq_enable,
@@ -642,6 +677,8 @@ static struct irq_chip bcm2835_gpio_irq_chip = {
 	.irq_ack = bcm2835_gpio_irq_ack,
 	.irq_mask = bcm2835_gpio_irq_disable,
 	.irq_unmask = bcm2835_gpio_irq_enable,
+	.irq_set_wake = bcm2835_gpio_irq_set_wake,
+	.flags = IRQCHIP_MASK_ON_SUSPEND,
 };
 
 static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
@@ -1154,6 +1191,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	struct resource iomem;
 	int err, i;
 	const struct of_device_id *match;
+	int is_7211 = 0;
 
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2711_NUM_GPIOS);
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2711_NUM_GPIOS);
@@ -1180,6 +1218,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	pdata = match->data;
+	is_7211 = of_device_is_compatible(np, "brcm,bcm7211-gpio");
 
 	pc->gpio_chip = *pdata->gpio_chip;
 	pc->gpio_chip.parent = dev;
@@ -1214,6 +1253,15 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
+
+	if (is_7211) {
+		pc->wake_irq = devm_kcalloc(dev, BCM2835_NUM_IRQS,
+					    sizeof(*pc->wake_irq),
+					    GFP_KERNEL);
+		if (!pc->wake_irq)
+			return -ENOMEM;
+	}
+
 	/*
 	 * Use the same handler for all groups: this is necessary
 	 * since we use one gpiochip to cover all lines - the
@@ -1221,8 +1269,34 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	 * bank that was firing the IRQ and look up the per-group
 	 * and bank data.
 	 */
-	for (i = 0; i < BCM2835_NUM_IRQS; i++)
+	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
+		int len;
+		char *name;
+
 		girq->parents[i] = irq_of_parse_and_map(np, i);
+		if (!is_7211)
+			continue;
+
+		/* Skip over the all banks interrupts */
+		pc->wake_irq[i] = irq_of_parse_and_map(np, i +
+						       BCM2835_NUM_IRQS + 1);
+
+		len = strlen(dev_name(pc->dev)) + 16;
+		name = devm_kzalloc(pc->dev, len, GFP_KERNEL);
+		if (!name)
+			return -ENOMEM;
+
+		snprintf(name, len, "%s:bank%d", dev_name(pc->dev), i);
+
+		/* These are optional interrupts */
+		err = devm_request_irq(dev, pc->wake_irq[i],
+				       bcm2835_gpio_wake_irq_handler,
+				       IRQF_SHARED, name, pc);
+		if (err)
+			dev_warn(dev, "unable to request wake IRQ %d\n",
+				 pc->wake_irq[i]);
+	}
+
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-- 
2.17.1

