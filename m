Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD63A3B26E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 11:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388749AbfFJJuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 05:50:18 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:37232 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388033AbfFJJuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 05:50:17 -0400
Received: (qmail 10776 invoked by uid 5089); 10 Jun 2019 09:50:15 -0000
Received: by simscan 1.2.0 ppid: 10734, pid: 10735, t: 0.0345s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 10 Jun 2019 09:50:14 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id 2C33520826E33; Mon, 10 Jun 2019 17:50:13 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     thloh@altera.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, preid@electromag.com.au,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/1] gpio: altera: Allocate irq_chip dynamically
Date:   Mon, 10 Jun 2019 17:50:11 +0800
Message-Id: <1560160211-12748-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Keeping the irq_chip definition static shares it with multiple instances
of the altera gpiochip in the system. This is bad and now we get this
warning from gpiolib core:

"detected irqchip that is shared with multiple gpiochips: please fix the
driver."

Hence, move the irq_chip definition from being driver static into the
struct altera_gpio_chips. So a unique irq_chip is used for each gpiochip
instance.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-altera.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 748fdd4..2c710772 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -42,6 +42,7 @@ struct altera_gpio_chip {
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
 	int mapped_irq;
+	struct irq_chip irq_chip;
 };
 
 static void altera_gpio_irq_unmask(struct irq_data *d)
@@ -113,15 +114,6 @@ static unsigned int altera_gpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static struct irq_chip altera_irq_chip = {
-	.name		= "altera-gpio",
-	.irq_mask	= altera_gpio_irq_mask,
-	.irq_unmask	= altera_gpio_irq_unmask,
-	.irq_set_type	= altera_gpio_irq_set_type,
-	.irq_startup	= altera_gpio_irq_startup,
-	.irq_shutdown	= altera_gpio_irq_mask,
-};
-
 static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
 	struct of_mm_gpio_chip *mm_gc;
@@ -306,8 +298,15 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
-		handle_bad_irq, IRQ_TYPE_NONE);
+	altera_gc->irq_chip.name = "altera-gpio";
+	altera_gc->irq_chip.irq_mask     = altera_gpio_irq_mask;
+	altera_gc->irq_chip.irq_unmask   = altera_gpio_irq_unmask;
+	altera_gc->irq_chip.irq_set_type = altera_gpio_irq_set_type;
+	altera_gc->irq_chip.irq_startup  = altera_gpio_irq_startup;
+	altera_gc->irq_chip.irq_shutdown = altera_gpio_irq_mask;
+
+	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_gc->irq_chip,
+		0, handle_bad_irq, IRQ_TYPE_NONE);
 
 	if (ret) {
 		dev_err(&pdev->dev, "could not add irqchip\n");
@@ -315,7 +314,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 
 	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
-		&altera_irq_chip,
+		&altera_gc->irq_chip,
 		altera_gc->mapped_irq,
 		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
 		altera_gpio_irq_leveL_high_handler :
-- 
1.8.3.1

