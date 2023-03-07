Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D906ADFCE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjCGNFo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjCGNFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:05:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314A227D50
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:05:04 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id r27so16941731lfe.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PUEBNIWi9XlpGpt5vSwoRNt6H80aDlupNA++Rohdv4=;
        b=QXsMqYlKGC8BIFrpVBwoMJw3jitiZ7aT6M1ELBa0ist/N1XoxIZooLBDUNVrnzAbmI
         yoXGbnY4TSmgf7jXGuGWkHGSWiFEoZeK9OgM+GuB3nUBU5Ke2z7KpZ3l9kUew9rHrG0T
         ol3sQvqoMY69wVHCoaCRgnJEegNl1rfkzA3Z5O+Rt9DKDg7otFNmc1o5JfFzrjGu6q0M
         D4p3rjfwpy1JfLOnf7q2X8U382eYyVR2/3/VsmU20rB8GUKl2jXuqGEf/lzImnl3K4fb
         55e+VC3ry3ANQT3FMYt24J9jaXKivzjNPkSdFSrMaCq2O8ubTy47vf8VvC9W30vfVpQs
         w2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PUEBNIWi9XlpGpt5vSwoRNt6H80aDlupNA++Rohdv4=;
        b=t/UlLSlpLGoQxsJxND/jvt54Aqa+qsY2wrQR7gPu2DnO5EKao38XM72zLyyKMfGP+C
         d3Bc2Zj1hfaXBvhi6RNxMj1U+SjDoMyv6Vc0XG2m4ZNJXAxYto9ApsLZ079ckai99AMz
         upcPBpTx13/uPPvNxtxxeqPt5p4HeAxECAJdaejBMcIM/a/SxAZ3FppKPK24W6p9GDKk
         ZirSGc5MtgLTEUNrkZoS/gPL3excQiJqlJJxsGfCZgRNjmbNLrB4fWo1SG5MfxNEkRPc
         eMvjBsKN89z+L8dGzXUTavhc5eeAkx0Ccbv0zAKpbJGBuOY4+9+u6hFdBMdUQSbW0zC1
         4+jg==
X-Gm-Message-State: AO0yUKV4EAVclJS7dA8SVCZy3tFFggKNUJPGVlyjTQup8l6ILgYd2ez6
        Z2lHsvmEKydMDws47HEKt3c8Sg==
X-Google-Smtp-Source: AK7set/0PjNNMhMg48I9ruK+nxErAAJX2QK/D8hZmLrkYx7SI2vEk66DRWyhtM1nOMOYCHefMnN4Lw==
X-Received: by 2002:a19:c208:0:b0:4df:9ce8:300 with SMTP id l8-20020a19c208000000b004df9ce80300mr3966975lfc.52.1678194290600;
        Tue, 07 Mar 2023 05:04:50 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 07 Mar 2023 14:04:47 +0100
Subject: [PATCH v2 05/16] gpio: ath79: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-5-d6b0e3f2d991@linaro.org>
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
In-Reply-To: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 3958c6d97639..aa0a954b8392 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -71,6 +71,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
+	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -85,6 +86,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -169,13 +171,15 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	return 0;
 }
 
-static struct irq_chip ath79_gpio_irqchip = {
+static const struct irq_chip ath79_gpio_irqchip = {
 	.name = "gpio-ath79",
 	.irq_enable = ath79_gpio_irq_enable,
 	.irq_disable = ath79_gpio_irq_disable,
 	.irq_mask = ath79_gpio_irq_mask,
 	.irq_unmask = ath79_gpio_irq_unmask,
 	.irq_set_type = ath79_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void ath79_gpio_irq_handler(struct irq_desc *desc)
@@ -274,7 +278,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	/* Optional interrupt setup */
 	if (!np || of_property_read_bool(np, "interrupt-controller")) {
 		girq = &ctrl->gc.irq;
-		girq->chip = &ath79_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

-- 
2.34.1

