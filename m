Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF4D6ADFC3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjCGNFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjCGNFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:05:17 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F2716307
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:04:55 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m6so16969867lfq.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=qEmoyYvtgIkJSqf2Pqh6Ym564INZh0BwzurBMQLlWZmSk8nzc8RGKvmI0hegLFxPKY
         vcwgmnrbX8J6CXWiJNG56ybOQpRIzjmrfLiPW9MzQfCDwgA6bUUnD0Ocpa20ATwBgP9m
         A/kNsIOkf6r9XFr9kj2EMb5Nrhno/+FcFquWbL69edEYKrrRQYWXF4RRp8TxDzmfLggt
         lpDEFkFu37kGvJ2OLITkQJg2lYcKqCzkmVy4n4eox8eBHZVvg5k4QHyCMIs5Z0ynE3zm
         FuV41w/UN0D41os3dqTUZxxRP69iho+WD29viJZOccqZ2Lm217SWEXDOnsKwcFDfPpQ6
         KjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=FhYKxveVjxwmlYaIjUylg56rgLgRtrchno+9+TUEGzE97/PoIve76pPOneIQVfmt8P
         tpwS09pVbCggIU4nbtSsECs/CRNdWU7b6zt1YxONUJx8hQeQFPqKjXmiLV5XFw2FG36k
         McqvXX7kE1uQbcVnlAWGMWC6PcTSDqTgwM1FTIGquONc+RB33mTwY3S+HinX5Wemcx1E
         0lsx6f0Rfa0Z/zKkCcdgbe07L6PmIlYUwq6tdjBrgNLwalOTL/KlK/o87qaFpZcgnky5
         KZpfm/UnQsaC05hmY7xKtJjdE+9r+4prsEiQh51/NYv0F0Cp+BE3mRHQsn7UKQA5OzA3
         WpMw==
X-Gm-Message-State: AO0yUKXAWDtkHXP8SSgjEUnlskKKI8Iy255bRG/aY+PUKKo8ffrYtU7S
        y8bQmxWqf7Csbt+9SNT1a71Yvg==
X-Google-Smtp-Source: AK7set9dOUNpwLPmkw26TebbIX2+K42H2bMUD/10wUIZq3p/In1OaKdeUJQyM4bBdLB4uJKuq/Qr6g==
X-Received: by 2002:a19:5206:0:b0:4e7:4a3c:695 with SMTP id m6-20020a195206000000b004e74a3c0695mr3596668lfb.65.1678194294792;
        Tue, 07 Mar 2023 05:04:54 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:54 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 07 Mar 2023 14:04:51 +0100
Subject: [PATCH v2 09/16] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-9-d6b0e3f2d991@linaro.org>
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
        Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-idt3243x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 1cafdf46f875..00f547d26254 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -92,6 +92,8 @@ static void idt_gpio_mask(struct irq_data *d)
 	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void idt_gpio_unmask(struct irq_data *d)
@@ -100,6 +102,7 @@ static void idt_gpio_unmask(struct irq_data *d)
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	ctrl->mask_cache &= ~BIT(d->hwirq);
@@ -119,12 +122,14 @@ static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static struct irq_chip idt_gpio_irqchip = {
+static const struct irq_chip idt_gpio_irqchip = {
 	.name = "IDTGPIO",
 	.irq_mask = idt_gpio_mask,
 	.irq_ack = idt_gpio_ack,
 	.irq_unmask = idt_gpio_unmask,
-	.irq_set_type = idt_gpio_irq_set_type
+	.irq_set_type = idt_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int idt_gpio_probe(struct platform_device *pdev)
@@ -168,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 			return parent_irq;
 
 		girq = &ctrl->gc.irq;
-		girq->chip = &idt_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
 		girq->init_hw = idt_gpio_irq_init_hw;
 		girq->parent_handler = idt_gpio_dispatch;
 		girq->num_parents = 1;

-- 
2.34.1

