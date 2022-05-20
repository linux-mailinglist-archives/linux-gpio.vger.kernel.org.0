Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024C052E9CC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348105AbiETKVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348111AbiETKVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:21:08 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8849DDFC1
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:21:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by laurent.telenet-ops.be with bizsmtp
        id YyM02700M38adXi01yM0wu; Fri, 20 May 2022 12:21:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzki-000zuT-2s; Fri, 20 May 2022 12:21:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzkh-003vDf-1N; Fri, 20 May 2022 12:20:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: pcf857x: Make the irqchip immutable
Date:   Fri, 20 May 2022 12:20:57 +0200
Message-Id: <53a48d4c26252160f090371e24352975a7ea7add.1653042025.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warning is
now observed for the pcf857x driver:

    gpio gpiochip1: (pcf8575): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the pcf857x driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Tested with pcf8575 and gpio-keys (including wake-up) on the
sh73a0/kzm9g development board.

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-pcf857x.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index e3a53dd5df1ec472..59cc27e4de511b18 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -71,7 +71,6 @@ MODULE_DEVICE_TABLE(of, pcf857x_of_table);
  */
 struct pcf857x {
 	struct gpio_chip	chip;
-	struct irq_chip		irqchip;
 	struct i2c_client	*client;
 	struct mutex		lock;		/* protect 'out' */
 	unsigned		out;		/* software latch */
@@ -203,15 +202,19 @@ static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
 static void pcf857x_irq_enable(struct irq_data *data)
 {
 	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 
-	gpio->irq_enabled |= (1 << data->hwirq);
+	gpiochip_enable_irq(&gpio->chip, hwirq);
+	gpio->irq_enabled |= (1 << hwirq);
 }
 
 static void pcf857x_irq_disable(struct irq_data *data)
 {
 	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 
-	gpio->irq_enabled &= ~(1 << data->hwirq);
+	gpio->irq_enabled &= ~(1 << hwirq);
+	gpiochip_disable_irq(&gpio->chip, hwirq);
 }
 
 static void pcf857x_irq_bus_lock(struct irq_data *data)
@@ -228,6 +231,20 @@ static void pcf857x_irq_bus_sync_unlock(struct irq_data *data)
 	mutex_unlock(&gpio->lock);
 }
 
+static const struct irq_chip pcf857x_irq_chip = {
+	.name			= "pcf857x",
+	.irq_enable		= pcf857x_irq_enable,
+	.irq_disable		= pcf857x_irq_disable,
+	.irq_ack		= noop,
+	.irq_mask		= noop,
+	.irq_unmask		= noop,
+	.irq_set_wake		= pcf857x_irq_set_wake,
+	.irq_bus_lock		= pcf857x_irq_bus_lock,
+	.irq_bus_sync_unlock	= pcf857x_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /*-------------------------------------------------------------------------*/
 
 static int pcf857x_probe(struct i2c_client *client,
@@ -338,16 +355,6 @@ static int pcf857x_probe(struct i2c_client *client,
 	if (client->irq) {
 		struct gpio_irq_chip *girq;
 
-		gpio->irqchip.name = "pcf857x";
-		gpio->irqchip.irq_enable = pcf857x_irq_enable;
-		gpio->irqchip.irq_disable = pcf857x_irq_disable;
-		gpio->irqchip.irq_ack = noop;
-		gpio->irqchip.irq_mask = noop;
-		gpio->irqchip.irq_unmask = noop;
-		gpio->irqchip.irq_set_wake = pcf857x_irq_set_wake;
-		gpio->irqchip.irq_bus_lock = pcf857x_irq_bus_lock;
-		gpio->irqchip.irq_bus_sync_unlock = pcf857x_irq_bus_sync_unlock;
-
 		status = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, pcf857x_irq, IRQF_ONESHOT |
 					IRQF_TRIGGER_FALLING | IRQF_SHARED,
@@ -356,7 +363,7 @@ static int pcf857x_probe(struct i2c_client *client,
 			goto fail;
 
 		girq = &gpio->chip.irq;
-		girq->chip = &gpio->irqchip;
+		gpio_irq_chip_set_chip(girq, &pcf857x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
-- 
2.25.1

