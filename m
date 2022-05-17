Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1252A74B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 May 2022 17:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242519AbiEQPq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 May 2022 11:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350948AbiEQPqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2022 11:46:17 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AA650B1D
        for <linux-gpio@vger.kernel.org>; Tue, 17 May 2022 08:45:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:c0f6:7ccf:c217:5f21])
        by laurent.telenet-ops.be with bizsmtp
        id XrlF2700H0nFbBY01rlFiK; Tue, 17 May 2022 17:45:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nqzNr-000jGZ-CH; Tue, 17 May 2022 17:45:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nqzNq-004Pdf-QY; Tue, 17 May 2022 17:45:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Make the irqchip immutable
Date:   Tue, 17 May 2022 17:45:13 +0200
Message-Id: <29398fc1c9a16e5ea9c678be2c44c488a94ddce3.1652802220.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warning is
now observed for the gpio-rcar driver:

    gpio gpiochip0: (e6050000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the gpio-rcar driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against linux-next.
Tested on the koelsch development board (R-Car M2-W).

On Tue, Apr 5, 2022 at 4:07 PM Marc Zyngier <maz@kernel.org> wrote:
> Nothing breaks, the volume of change is small, the memory usage goes
> down and we have fewer callbacks that can be used as attack vectors.
> What's not to love?

Does it?

    arm32$ size drivers/gpio/gpio-rcar.o{.orig,}
       text	   data	    bss	    dec	    hex	filename
       4543	    112	     24	   4679	   1247	drivers/gpio/gpio-rcar.o.orig
       4647	    112	     24	   4783	   12af	drivers/gpio/gpio-rcar.o

    arm64$ size drivers/gpio/gpio-rcar.o{.orig,}
       text	   data	    bss	    dec	    hex	filename
       4919	    216	     48	   5183	   143f	drivers/gpio/gpio-rcar.o.orig
       5159	    216	     48	   5423	   152f	drivers/gpio/gpio-rcar.o
---
 drivers/gpio/gpio-rcar.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 9a1e0c37c04baa58..6d1b105a4ae81f75 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -44,7 +44,6 @@ struct gpio_rcar_priv {
 	spinlock_t lock;
 	struct device *dev;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 	unsigned int irq_parent;
 	atomic_t wakeup_path;
 	struct gpio_rcar_info info;
@@ -98,6 +97,7 @@ static void gpio_rcar_irq_disable(struct irq_data *d)
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
 	gpio_rcar_write(p, INTMSK, ~BIT(irqd_to_hwirq(d)));
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void gpio_rcar_irq_enable(struct irq_data *d)
@@ -105,6 +105,7 @@ static void gpio_rcar_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, d->hwirq);
 	gpio_rcar_write(p, MSKCLR, BIT(irqd_to_hwirq(d)));
 }
 
@@ -203,6 +204,17 @@ static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
+static const struct irq_chip gpio_rcar_irq_chip = {
+	.name		= "gpio-rcar",
+	.irq_mask	= gpio_rcar_irq_disable,
+	.irq_unmask	= gpio_rcar_irq_enable,
+	.irq_set_type	= gpio_rcar_irq_set_type,
+	.irq_set_wake	= gpio_rcar_irq_set_wake,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 {
 	struct gpio_rcar_priv *p = dev_id;
@@ -531,7 +543,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 {
 	struct gpio_rcar_priv *p;
 	struct gpio_chip *gpio_chip;
-	struct irq_chip *irq_chip;
 	struct gpio_irq_chip *girq;
 	struct device *dev = &pdev->dev;
 	const char *name = dev_name(dev);
@@ -581,16 +592,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->base = -1;
 	gpio_chip->ngpio = npins;
 
-	irq_chip = &p->irq_chip;
-	irq_chip->name = "gpio-rcar";
-	irq_chip->irq_mask = gpio_rcar_irq_disable;
-	irq_chip->irq_unmask = gpio_rcar_irq_enable;
-	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
-	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
-	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
-
 	girq = &gpio_chip->irq;
-	girq->chip = irq_chip;
+	gpio_irq_chip_set_chip(girq, &gpio_rcar_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.25.1

