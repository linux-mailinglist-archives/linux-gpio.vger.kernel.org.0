Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DABE5B4997
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Sep 2022 23:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiIJVVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Sep 2022 17:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiIJVUV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Sep 2022 17:20:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AD84F65A;
        Sat, 10 Sep 2022 14:18:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51F8CB80948;
        Sat, 10 Sep 2022 21:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BC0C433D6;
        Sat, 10 Sep 2022 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844672;
        bh=OSeSvRnImeo8dv9QwngwQ9WiyEgOdmCucfPlzB1B/e8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iu6EAqeVQiIGXxc8ow8eDqivtyAb8C6cyhyDvJpfmbgNMevMnSlbKdM+bHuu1bcCY
         z8X1c6lfdDl6OIPm1mivgrN/Ft4aWbCt6bqLZy4zyYyFJl1KAjGKtgJsIUy70GUzNT
         R8v055/SAk0NVuAgNNhQ4ng3xrR0qArktoznRdDCB/YnvPn36Q1bQi8NSNEOLOJye/
         7bGmrhc0s9i30jY2+z8nAqL2fTMhzq2BwIQHg3NjAnKsHtTeYcaIhHefvXEiEch5Wo
         w/TWGaMy/KS95tPSHj/d6Z5A/v3LWbTdhdbm0OJkCm6ZRoO6U2u3V1K3ZgXFugCW6o
         wHVFnEU36c7Sw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     William Breathitt Gray <william.gray@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sasha Levin <sashal@kernel.org>, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 38/38] gpio: 104-idio-16: Make irq_chip immutable
Date:   Sat, 10 Sep 2022 17:16:23 -0400
Message-Id: <20220910211623.69825-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211623.69825-1-sashal@kernel.org>
References: <20220910211623.69825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: William Breathitt Gray <william.gray@linaro.org>

[ Upstream commit 410a5041aa60d91ff66a861560e7c879d664270f ]

Kernel warns about mutable irq_chips:

    "not an immutable chip, please consider fixing!"

Make the struct irq_chip const, flag it as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-104-idio-16.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 45f7ad8573e19..a8b7c8eafac5a 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -150,10 +150,11 @@ static void idio_16_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned long mask = BIT(irqd_to_hwirq(data));
+	const unsigned long offset = irqd_to_hwirq(data);
 	unsigned long flags;
 
-	idio16gpio->irq_mask &= ~mask;
+	idio16gpio->irq_mask &= ~BIT(offset);
+	gpiochip_disable_irq(chip, offset);
 
 	if (!idio16gpio->irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
@@ -168,11 +169,12 @@ static void idio_16_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned long mask = BIT(irqd_to_hwirq(data));
+	const unsigned long offset = irqd_to_hwirq(data);
 	const unsigned long prev_irq_mask = idio16gpio->irq_mask;
 	unsigned long flags;
 
-	idio16gpio->irq_mask |= mask;
+	gpiochip_enable_irq(chip, offset);
+	idio16gpio->irq_mask |= BIT(offset);
 
 	if (!prev_irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
@@ -193,12 +195,14 @@ static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip idio_16_irqchip = {
+static const struct irq_chip idio_16_irqchip = {
 	.name = "104-idio-16",
 	.irq_ack = idio_16_irq_ack,
 	.irq_mask = idio_16_irq_mask,
 	.irq_unmask = idio_16_irq_unmask,
-	.irq_set_type = idio_16_irq_set_type
+	.irq_set_type = idio_16_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
@@ -275,7 +279,7 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 	idio16gpio->out_state = 0xFFFF;
 
 	girq = &idio16gpio->chip.irq;
-	girq->chip = &idio_16_irqchip;
+	gpio_irq_chip_set_chip(girq, &idio_16_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.35.1

