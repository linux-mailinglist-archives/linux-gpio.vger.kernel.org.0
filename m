Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD0127E2CB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 09:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI3Hm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 03:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgI3Hm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 03:42:28 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2367C061755;
        Wed, 30 Sep 2020 00:42:28 -0700 (PDT)
Received: from mwalle01.sab.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id AE1AC22EE4;
        Wed, 30 Sep 2020 09:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1601451744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=wREVuR0VUOhJ3xpNDbVmV4j1U+OQ13zuW05abB1I6ao=;
        b=My7t1g50eH9yqI8IM79EAaLc0NKAK6GSpZx+glMJd+vay8RQCgka/qGWQr5yiFKw8nlVK+
        IPWaZSryPrpuZCTgbZ+TENeZquVIZVLfYvhXyEyBCVPWcDEzvSqS1etG/VHJ5j0fdslRNi
        6Ib6QyD7rYXXVZPpgPwemIm6sUKMGm4=
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH] gpio: mpc8xxx: simplify ls1028a/ls1088a support
Date:   Wed, 30 Sep 2020 09:42:11 +0200
Message-Id: <20200930074211.30886-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some Layerscape/QoriQ SoCs have input buffers which needs to be enabled
first. This was done in two different ways in the driver. Unify it.

This was tested on a LS1028A SoC.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpio/gpio-mpc8xxx.c | 45 ++++++++++---------------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 1e866524a4bd..6dfca83bcd90 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -47,27 +47,6 @@ struct mpc8xxx_gpio_chip {
 	unsigned int irqn;
 };
 
-/* The GPIO Input Buffer Enable register(GPIO_IBE) is used to
- * control the input enable of each individual GPIO port.
- * When an individual GPIO port’s direction is set to
- * input (GPIO_GPDIR[DRn=0]), the associated input enable must be
- * set (GPIOxGPIE[IEn]=1) to propagate the port value to the GPIO
- * Data Register.
- */
-static int ls1028a_gpio_dir_in_init(struct gpio_chip *gc)
-{
-	unsigned long flags;
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
-
-	spin_lock_irqsave(&gc->bgpio_lock, flags);
-
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
-
-	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
-	return 0;
-}
-
 /*
  * This hardware has a big endian bit assignment such that GPIO line 0 is
  * connected to bit 31, line 1 to bit 30 ... line 31 to bit 0.
@@ -283,7 +262,6 @@ static const struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 };
 
 struct mpc8xxx_gpio_devtype {
-	int (*gpio_dir_in_init)(struct gpio_chip *chip);
 	int (*gpio_dir_out)(struct gpio_chip *, unsigned int, int);
 	int (*gpio_get)(struct gpio_chip *, unsigned int);
 	int (*irq_set_type)(struct irq_data *, unsigned int);
@@ -294,11 +272,6 @@ static const struct mpc8xxx_gpio_devtype mpc512x_gpio_devtype = {
 	.irq_set_type = mpc512x_irq_set_type,
 };
 
-static const struct mpc8xxx_gpio_devtype ls1028a_gpio_devtype = {
-	.gpio_dir_in_init = ls1028a_gpio_dir_in_init,
-	.irq_set_type = mpc8xxx_irq_set_type,
-};
-
 static const struct mpc8xxx_gpio_devtype mpc5125_gpio_devtype = {
 	.gpio_dir_out = mpc5125_gpio_dir_out,
 	.irq_set_type = mpc512x_irq_set_type,
@@ -319,8 +292,8 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
-	{ .compatible = "fsl,ls1028a-gpio", .data = &ls1028a_gpio_devtype, },
-	{ .compatible = "fsl,ls1088a-gpio", .data = &ls1028a_gpio_devtype, },
+	{ .compatible = "fsl,ls1028a-gpio", },
+	{ .compatible = "fsl,ls1088a-gpio", },
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
@@ -389,7 +362,16 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	gc->to_irq = mpc8xxx_gpio_to_irq;
 
-	if (of_device_is_compatible(np, "fsl,qoriq-gpio"))
+	/*
+	 * The GPIO Input Buffer Enable register(GPIO_IBE) is used to control
+	 * the input enable of each individual GPIO port.  When an individual
+	 * GPIO port’s direction is set to input (GPIO_GPDIR[DRn=0]), the
+	 * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
+	 * the port value to the GPIO Data Register.
+	 */
+	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
+	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
+	    of_device_is_compatible(np, "fsl,ls1088a-gpio"))
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
@@ -411,9 +393,6 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	/* ack and mask all irqs */
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
-	/* enable input buffer  */
-	if (devtype->gpio_dir_in_init)
-		devtype->gpio_dir_in_init(gc);
 
 	ret = devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
 			       mpc8xxx_gpio_irq_cascade,
-- 
2.20.1

