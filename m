Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1386C0DD7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 10:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjCTJzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 05:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjCTJz1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 05:55:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D07D420E
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 02:55:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h25so2456136lfv.6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679306121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ8pDJ544LSAcFuKnZ1WqdUejeWGxtlm1VYmzzGBmgw=;
        b=lyJ+w0kp8l+cELb9UDJarzOUReNGbayK9wKZjJTyeWN91AK8i7Ojx1/+8902eHM++O
         9kF6KgWPr4bGDOvASkQQQ9H3Zmhv4qhTLYtfiLOOSJb+BuYd0RzL6B6g5MCVkqry2pkY
         TPZ9pMkcsEiWJyhR4BpfK8oE+pVkByFq5vPia5YqQMtmxXWrDekt/7CFGcEI0DfOzoJ4
         G3VTorPbaI1mBds+GzA7oerrUJKn7s/A0Oro1yOATwLbZ5MeDgM0Go+6GkqQgitIoYjg
         wEf1P1C9RBs5vanaRf2Fi7fyRDhAL0LJH2JrY3zV6i5A55/249WVxszwS96+eAqG0Y6F
         MyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679306121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ8pDJ544LSAcFuKnZ1WqdUejeWGxtlm1VYmzzGBmgw=;
        b=CCuf14LvlR13RrUEdsYUrfgItyp+cH02QgO8SR4MZsgMnrsdtWiYxQ8JPucd5chHWl
         U7/axlTV6l6gr6/5yLQuq5P/IW7zaxEsqK1vMyPVY+3kf+o7bAJ5c5JhCbixPoSAdZPI
         fXT6gKwGT4FXIK/dGQ+2Y3oEmpNilA1Khe0MxIADCfUasrUAOnRhYfSha7BYZFQk0k1x
         aGcZnyFaKPavmnu1FiUIXNWumvCGNVjXZsMB89V0ZFAvDsRdXC/ZQ6th0szGpAXCeq6I
         bQRJ02qrwMOZFLKTsB1JJVfgnkoMmXwW2M+U7R89uWE0PkOQAkpqvEgg4DYH8OY1NN2G
         qcng==
X-Gm-Message-State: AO0yUKX5j+2k39uo6Dd4ZJE6tYspu/5JCEvvIssFN2uNyjxm2R/elwpQ
        lzJr6p2DeEf2wcUYmTpA5So10w==
X-Google-Smtp-Source: AK7set8WWtoMKppI+gZFwXPhBIrBDDyJUehoQ6BHpQ5qn6bNbMVaZKAx+l1kC81jShZDQeZAH3pMmA==
X-Received: by 2002:ac2:4142:0:b0:4dd:a445:e69d with SMTP id c2-20020ac24142000000b004dda445e69dmr5657173lfi.26.1679306121600;
        Mon, 20 Mar 2023 02:55:21 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 02:55:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Mar 2023 10:55:14 +0100
Subject: [PATCH 7/9] gpio: xgs-iproc: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230316-immutable-chips-2-v1-7-053d6ede831b@linaro.org>
References: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
In-Reply-To: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/gpio/gpio-xgs-iproc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index fd88500399c6..2d23b27d55af 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
 #define IPROC_CCA_INT_F_GPIOINT		BIT(0)
@@ -27,7 +28,6 @@
 #define IPROC_GPIO_CCA_INT_EDGE		0x24
 
 struct iproc_gpio_chip {
-	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	spinlock_t lock;
 	struct device *dev;
@@ -69,6 +69,7 @@ static void iproc_gpio_irq_unmask(struct irq_data *d)
 	u32 irq = d->irq;
 	u32 int_mask, irq_type, event_mask;
 
+	gpiochip_enable_irq(gc, pin);
 	spin_lock_irqsave(&chip->lock, flags);
 	irq_type = irq_get_trigger_type(irq);
 	event_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
@@ -110,6 +111,7 @@ static void iproc_gpio_irq_mask(struct irq_data *d)
 			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
 	}
 	spin_unlock_irqrestore(&chip->lock, flags);
+	gpiochip_disable_irq(gc, pin);
 }
 
 static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -191,6 +193,24 @@ static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
 	return int_bits ? IRQ_HANDLED : IRQ_NONE;
 }
 
+static void iproc_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
+
+	seq_printf(p, dev_name(chip->dev));
+}
+
+static const struct irq_chip iproc_gpio_irq_chip = {
+	.irq_ack = iproc_gpio_irq_ack,
+	.irq_mask = iproc_gpio_irq_mask,
+	.irq_unmask = iproc_gpio_irq_unmask,
+	.irq_set_type = iproc_gpio_irq_set_type,
+	.irq_print_chip = iproc_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int iproc_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -230,16 +250,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
-		struct irq_chip *irqc;
 		u32 val;
 
-		irqc = &chip->irqchip;
-		irqc->name = dev_name(dev);
-		irqc->irq_ack = iproc_gpio_irq_ack;
-		irqc->irq_mask = iproc_gpio_irq_mask;
-		irqc->irq_unmask = iproc_gpio_irq_unmask;
-		irqc->irq_set_type = iproc_gpio_irq_set_type;
-
 		chip->intr = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(chip->intr))
 			return PTR_ERR(chip->intr);
@@ -261,7 +273,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		}
 
 		girq = &chip->gc.irq;
-		girq->chip = irqc;
+		gpio_irq_chip_set_chip(girq, &iproc_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

