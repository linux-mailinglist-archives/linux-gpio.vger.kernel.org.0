Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D86D5C30
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 11:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbjDDJne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 05:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234332AbjDDJn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 05:43:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6502133
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 02:43:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y15so41597157lfa.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
        b=ICxJ7YUe4hMVhguFvpnF1aY1g2Xg4mx4cDsI89BJpwkDMlqLi6qFs0qAm1gH1e7IVc
         H9O3qmNc5Yl380YTtScMkdC5MjYUVycM0Bb98+MNi+509Acfjw7PXF5zmVlmcPvVwWo1
         VSzvfDsF84XJxs79RETY7OSH6rXLO09va/3ONasKuU5gpMrlOEgtpmSU9I3aKMf9hlEZ
         MtI45uH3axyfhRJyE9oc9alpGa86BWOR2IXEDjISPQDnFE2IlXgfA0jpOdqvLwkpHCWf
         /WUJD9ayL7tzb2YqWLxpKOysDqLIUBDz39ffyaPdXGSmgnq+rp9f7iKgRfaZBtCqKQ9z
         kB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
        b=sPLasNbgBm37kChoDWUUWiZh+oV4jrn3+vj9TjiWVnQTgXWFPDK+sMNOkOAT1/Smoo
         q5LunXjSIO//bLcSY/y92D++VkvpQBkEHmC/iDr+GmxyVMnGL1WfUB3BIMwOJUbBeR39
         GdRPs83ZAMRG2MOktRSafrDvUyOskKFzzIcWo14F1sEyuxex84/00OooyGniEfEi5QRi
         EHiS/mDLEh2ll5zFIWQ4dRWv+Swk9VvnreeIBK0KNivVJo7KqP4zYC9/N014i6S48K1S
         /yrvSFSpDbO++Rkr/S7bagXEckDBQbEUgDvzOCNFykBcxTMt2DWzWlMzKlU6ZAoqPjb5
         W9Kg==
X-Gm-Message-State: AAQBX9etRWixoQ6mV5j9Yi2oRrKyUy8MZ4m2wMaagaSefn4dsfpqfblH
        eQAmFrt5v0QsSwjW+Wn6eL6dVQ==
X-Google-Smtp-Source: AKy350aeLsqesUsg+RRQuKpGDi2+iTAe42ueN49XS6nl4LpQF3DdNJ5O0KERzFnZGDFb/T4668h+8A==
X-Received: by 2002:a05:6512:38c2:b0:4dd:cb1d:b3cc with SMTP id p2-20020a05651238c200b004ddcb1db3ccmr446350lft.11.1680601394784;
        Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 04 Apr 2023 11:43:07 +0200
Subject: [PATCH 5/9] pinctrl: equilibrium: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-immutable-irqchips-v1-5-503788a7f6e6@linaro.org>
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

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 22 ++++++++++++++--------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 --
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 99cf24eb67ae..5b5ddf7e5d0e 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -32,6 +32,7 @@ static void eqbr_gpio_disable_irq(struct irq_data *d)
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNENCLR);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
+	gpiochip_disable_irq(gc, offset);
 }
 
 static void eqbr_gpio_enable_irq(struct irq_data *d)
@@ -42,6 +43,7 @@ static void eqbr_gpio_enable_irq(struct irq_data *d)
 	unsigned long flags;
 
 	gc->direction_input(gc, offset);
+	gpiochip_enable_irq(gc, offset);
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNRNSET);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
@@ -161,6 +163,17 @@ static void eqbr_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static const struct irq_chip eqbr_irq_chip = {
+	.name = "gpio_irq",
+	.irq_mask = eqbr_gpio_disable_irq,
+	.irq_unmask = eqbr_gpio_enable_irq,
+	.irq_ack = eqbr_gpio_ack_irq,
+	.irq_mask_ack = eqbr_gpio_mask_ack_irq,
+	.irq_set_type = eqbr_gpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 {
 	struct gpio_irq_chip *girq;
@@ -176,15 +189,8 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	gctrl->ic.name = "gpio_irq";
-	gctrl->ic.irq_mask = eqbr_gpio_disable_irq;
-	gctrl->ic.irq_unmask = eqbr_gpio_enable_irq;
-	gctrl->ic.irq_ack = eqbr_gpio_ack_irq;
-	gctrl->ic.irq_mask_ack = eqbr_gpio_mask_ack_irq;
-	gctrl->ic.irq_set_type = eqbr_gpio_set_irq_type;
-
 	girq = &gctrl->chip.irq;
-	girq->chip = &gctrl->ic;
+	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents), GFP_KERNEL);
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 0c635a5b79f0..83768cc8b3db 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -103,7 +103,6 @@ struct fwnode_handle;
  * @fwnode: firmware node of gpio controller.
  * @bank: pointer to corresponding pin bank.
  * @membase: base address of the gpio controller.
- * @ic:   irq chip.
  * @name: gpio chip name.
  * @virq: irq number of the gpio chip to parent's irq domain.
  * @lock: spin lock to protect gpio register write.
@@ -113,7 +112,6 @@ struct eqbr_gpio_ctrl {
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;
-	struct irq_chip		ic;
 	const char		*name;
 	unsigned int		virq;
 	raw_spinlock_t		lock; /* protect gpio register */

-- 
2.34.1

