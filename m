Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3405D6D5C2E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 11:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbjDDJn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 05:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbjDDJnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 05:43:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EEE19BC
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 02:43:15 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g17so41623782lfv.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
        b=e1uj62pN0BP1oy7JoNYBwrAIuMvEiYqXfV1pH3XsFab42xd4CIuWbawCTW8UugUR7p
         2ZedAL1GpL9BQhTZ9OVib8wZzc5mt+XA1na1w4nFEgH/JKUVTheZw8Jt4nSq0mO9Kn2V
         aWuDyXntJSBiFMaW83ljkTRD8KOd5r4ajIiNahcb+dVJ1soauuMwpRWISpRIlgUx8UMe
         mtcWXY13dGxkl8GpNLTEgl2TY80PI9kfLFQnGN+zdZeF8zyoXs/KVKMuVtTTtuZUEuuP
         XIOQt4NuesWFxiy1eHisZPdr0cfJcgn4r5MVdxHbvaMEGcT6OmTBaT5agSqNKY8ItEbQ
         ntxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
        b=BaEuEUI6f8dya+2WY7Hd3iWA/C6es6n7rAP+4zwwfALloVfaC2LKoeso0YbQNkrQ3Y
         Zr0PrjBGZa0ns1jUDUEnEkcWG6oJ0bqQk/BxOQJs6gPNOi2dgU1du9n0skLjI8++fW0f
         Ouac8exoAsE0i4CyX30ufwvcbpKV+XxylWtDtIFbP9WQSEYR6L2wpmZfp51LRiCym7Aq
         ObJtEiXVQish2FOyIyM7cSeYwGN1/rzN2/H9ICBUAIRLolPfzhd1iiga75vPKKJSlakc
         B/H36n95702uMvBFwDv5Y21dwL+medUhh1h1iNn2A6hscVGIBfdSrNIxfyhWUTgYo6rk
         j8ww==
X-Gm-Message-State: AAQBX9eSdjM6iIGUMSed36RGm5dq7S0f1WVBt2DLoRP07cLeWhqvpgwy
        wXlQ8IRgrgoYjYXq/Cogqdwgsw==
X-Google-Smtp-Source: AKy350bAzs+k3GfXqrHrUh46WUwBaaa8Kv09rrmTTSTImYh5z6/205iT1zyUw8YZhG01/6vEVWpsVQ==
X-Received: by 2002:ac2:4422:0:b0:4cc:73ff:579a with SMTP id w2-20020ac24422000000b004cc73ff579amr549570lfl.38.1680601393741;
        Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 04 Apr 2023 11:43:06 +0200
Subject: [PATCH 4/9] pinctrl: npcm7xx: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-4-503788a7f6e6@linaro.org>
References: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
In-Reply-To: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

I refactored the way the state container was accessed in
the irq_chip callbacks to all look the same and switch to
use irqd_to_hwirq() while we are at it.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index ff5bcea172e8..05d39f9111c2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -82,7 +82,6 @@ struct npcm7xx_gpio {
 	struct gpio_chip	gc;
 	int			irqbase;
 	int			irq;
-	struct irq_chip		irq_chip;
 	u32			pinctrl_id;
 	int (*direction_input)(struct gpio_chip *chip, unsigned int offset);
 	int (*direction_output)(struct gpio_chip *chip, unsigned int offset,
@@ -240,9 +239,9 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 
 static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = BIT(d->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = BIT(irqd_to_hwirq(d));
 
 	dev_dbg(bank->gc.parent, "setirqtype: %u.%u = %u\n", gpio,
 		d->irq, type);
@@ -288,9 +287,9 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 
 static void npcmgpio_irq_ack(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	dev_dbg(bank->gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVST);
@@ -299,23 +298,25 @@ static void npcmgpio_irq_ack(struct irq_data *d)
 /* Disable GPIO interrupt */
 static void npcmgpio_irq_mask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Clear events */
 	dev_dbg(bank->gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENC);
+	gpiochip_disable_irq(gc, gpio);
 }
 
 /* Enable GPIO interrupt */
 static void npcmgpio_irq_unmask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Enable events */
+	gpiochip_enable_irq(gc, gpio);
 	dev_dbg(bank->gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENS);
 }
@@ -323,7 +324,7 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = d->hwirq;
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* active-high, input, clear interrupt, enable interrupt */
 	dev_dbg(gc->parent, "startup: %u.%u\n", gpio, d->irq);
@@ -341,6 +342,8 @@ static const struct irq_chip npcmgpio_irqchip = {
 	.irq_mask = npcmgpio_irq_mask,
 	.irq_set_type = npcmgpio_set_irq_type,
 	.irq_startup = npcmgpio_irq_startup,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 /* pinmux handing in the pinctrl driver*/
@@ -1906,7 +1909,6 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return -EINVAL;
 		}
 		pctrl->gpio_bank[id].irq = ret;
-		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
 		pctrl->gpio_bank[id].gc.base = args.args[1];
@@ -1941,7 +1943,7 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 		struct gpio_irq_chip *girq;
 
 		girq = &pctrl->gpio_bank[id].gc.irq;
-		girq->chip = &pctrl->gpio_bank[id].irq_chip;
+		gpio_irq_chip_set_chip(girq, &npcmgpio_irqchip);
 		girq->parent_handler = npcmgpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(pctrl->dev, 1,

-- 
2.34.1

