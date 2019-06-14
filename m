Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5093A45709
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 10:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfFNIPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 04:15:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44957 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfFNIPB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 04:15:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so1422984ljc.11
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2019 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFbiqfQknF0eJ3MG2qJQektDrQrX7sZNjc7Bl0wDXo4=;
        b=rmfxbW+bdZywUhzkSxFlVgEiuaJonr1HaYuEj5RRrsCQp0SZu5+miXijjoXoZ3ICru
         gRc4um4ggmMQPwX8rtFYPLEYU47RF3/g0c6eHzyz0EVHEscuRBiE0m51vGU3FcN2fMs/
         Kqv6h115yy8/RxnO+N+IVyw4MBREcQyFu3mnapdkTi1gkihZ6/ioS8JUIvL4we9a5I8g
         nS9Xm2XgaB8d6AJrpF7lTNQf70uEe+ayA6TlByiRjFUzGnY3WhouCB0ZCkkY2ZCVPphx
         pm0HftCMkz8hbUWM2XLHvihUyWRTuR/1Iqoldxirmckf9mn82ZOJSXWUyphgSTmuTYce
         MWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFbiqfQknF0eJ3MG2qJQektDrQrX7sZNjc7Bl0wDXo4=;
        b=DILA7WRnBNqmQmiEXeNq6O69VqeDdWGIoQ7AwWg+Q5J3xkeJgmU7V/0TVl0lXfbsYt
         CLMiLTulpCbvRQNMawEpsGpGNlZeprQhoMAVYg71pyeGWJV7tj4GYgbRY5ZHWsDmAwYB
         JC4vk9LDugGslsWCIL3YXS63jtDAsiYZRcXQHSEXvcjFN8jOXgsRpfvpEaAhTnQWHPNn
         Zr1owLnZ3U7BaVqSMTR2R3zKvtpXRXelszx+O1eRCmQRrRbyCWgzhoDSv5qJV7czARnL
         ShsJSYZP4BCpbSaL1Qn/xCnkKIC7Yyx1yIexNjZR0DjDzlBiRHBKcHWG/nOM7jPYxxNL
         KOGw==
X-Gm-Message-State: APjAAAXPldJyEpVhGDv4QWb/kg1WSsayaryJ/AtwpjMPsiwtIrDHTQq7
        lKu8qk85v6q1ruYCd8ZUj5IWewY9Fvo=
X-Google-Smtp-Source: APXvYqzvkmY5xDFD+C/KofR1i5mM/sSlBiSeE296/iT3uYp/TiZCkP01ZJjQYHse5JFCGmkFKQTDJw==
X-Received: by 2002:a2e:8195:: with SMTP id e21mr28280664ljg.62.1560500099328;
        Fri, 14 Jun 2019 01:14:59 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b62sm439891ljb.71.2019.06.14.01.14.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 01:14:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Drop the parent_irq from gpio_irq_chip
Date:   Fri, 14 Jun 2019 10:14:56 +0200
Message-Id: <20190614081456.530-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have an array named "parents" so instead
of letting one point to the other, simply allocate a
dynamic array to hold the parents, just one if desired
and drop the number of members in gpio_irq_chip by
1. Rename gpiochip to gc in the process.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 30 +++++++++++++++++++-----------
 include/linux/gpio/driver.h |  7 -------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4561cb39bdb4..71cd685ed6c4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1644,39 +1644,47 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
 
 /**
  * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
- * @gpiochip: the gpiochip to set the irqchip chain to
+ * @gc: the gpiochip to set the irqchip chain to
  * @parent_irq: the irq number corresponding to the parent IRQ for this
  * chained irqchip
  * @parent_handler: the parent interrupt handler for the accumulated IRQ
  * coming out of the gpiochip. If the interrupt is nested rather than
  * cascaded, pass NULL in this handler argument
  */
-static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
+static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
 					  unsigned int parent_irq,
 					  irq_flow_handler_t parent_handler)
 {
-	if (!gpiochip->irq.domain) {
-		chip_err(gpiochip, "called %s before setting up irqchip\n",
+	struct gpio_irq_chip *girq = &gc->irq;
+	struct device *dev = &gc->gpiodev->dev;
+
+	if (!girq->domain) {
+		chip_err(gc, "called %s before setting up irqchip\n",
 			 __func__);
 		return;
 	}
 
 	if (parent_handler) {
-		if (gpiochip->can_sleep) {
-			chip_err(gpiochip,
+		if (gc->can_sleep) {
+			chip_err(gc,
 				 "you cannot have chained interrupts on a chip that may sleep\n");
 			return;
 		}
+		girq->parents = devm_kcalloc(dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents) {
+			chip_err(gc, "out of memory allocating parent IRQ\n");
+			return;
+		}
+		girq->parents[0] = parent_irq;
+		girq->num_parents = 1;
 		/*
 		 * The parent irqchip is already using the chip_data for this
 		 * irqchip, so our callbacks simply use the handler_data.
 		 */
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
-						 gpiochip);
-
-		gpiochip->irq.parent_irq = parent_irq;
-		gpiochip->irq.parents = &gpiochip->irq.parent_irq;
-		gpiochip->irq.num_parents = 1;
+						 gc);
 	}
 }
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 937c40fb61f7..02698c0f34ea 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -102,13 +102,6 @@ struct gpio_irq_chip {
 	 */
 	unsigned int num_parents;
 
-	/**
-	 * @parent_irq:
-	 *
-	 * For use by gpiochip_set_cascaded_irqchip()
-	 */
-	unsigned int parent_irq;
-
 	/**
 	 * @parents:
 	 *
-- 
2.20.1

