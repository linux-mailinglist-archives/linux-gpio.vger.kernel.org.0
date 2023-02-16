Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203E6699018
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjBPJiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjBPJhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:37:48 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D834DBF3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id c20so2024642lfv.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0M1pC0INpYl+CXS8Dns9xjvleXqdjGQq3X1BFk3EBQ=;
        b=GxKGRRhHLh6q02DnIHnu5KYNkcTneUuEswYrHE39BakqGtlXzlqP6k5Z/Ibb1xVZ9o
         sB0xYZU81v8ZuuWYlaGGdvr4zOwwG7fYNfQYjgqGAiI9hcWUZjDhymZonSZHfFYD1MCf
         7MoAGMSvd2Lho9OUF223H0CUljPdV+nezQSMRa994BlbFF08qxMbIE1BBMawIkcKo/Ms
         4KzeQW46uYYY6BGTwqTSqIAoe+cFL0mTniS4TRJrylCanR5O//HCZhRE5kSO3SyM/8Rk
         yFQgbkDVnQh5PAp+AdJYIiwgKiH3pXwTP2XtYaUZReVh3IJLUn4eS1MEG9BLNljOMZbP
         CJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0M1pC0INpYl+CXS8Dns9xjvleXqdjGQq3X1BFk3EBQ=;
        b=Qoo6bOoD+FyvkyiyQCGh2S/oKBtXk3chM+6q69t4+JMFwNk+erryHU7YcTAZI15MoP
         FGjzLcgBRP8BXMgLEKuFJLoUvIgt3qtAvNa7B7cMatp76H4/2xmn7eKsmoFSDihfE15G
         eRLQFvXNW93JgQ5+J4+nEFByfjOyaYzfu0eFh+gVSlpZY1n5FmSAJ3rByxHE0rF54W7L
         d6EDHsUaAeprOL5frvyGsh3AwqhSOlzEFTjMMxD9KxH6HSE8z3yA1n+1i0/c6CsN5MB6
         ldmj2YN+go77qfFYkd3Rp/+XMl6YBS2+NgTcg2o46jrQe8yY+FQuKbgypRUgVs7ILv5V
         H3sA==
X-Gm-Message-State: AO0yUKXrDnwXFjOFV5qut2IpwYpSJIxaiEv/EWDwWMY3BrccjGQoKUq7
        88A0Kc+Wwz8ssqpVo5QwiIYB8Q==
X-Google-Smtp-Source: AK7set8L107Wug45SX7aDpf2p4wlQiYyYomYtZyXZNZlXQ6SDxaJfLOVPkxsQ3mzBosrSxmlzdyi1g==
X-Received: by 2002:ac2:44ab:0:b0:4d8:8ad1:a05f with SMTP id c11-20020ac244ab000000b004d88ad1a05fmr1234138lfm.48.1676540240506;
        Thu, 16 Feb 2023 01:37:20 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:20 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:14 +0100
Subject: [PATCH 13/17] gpio: max732x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-13-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
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
        Grygorii Strashko <grygorii.strashko@ti.com>,
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
 drivers/gpio/gpio-max732x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 68e982cdee73..7f2fde191755 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -351,6 +351,7 @@ static void max732x_irq_mask(struct irq_data *d)
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask_cur &= ~(1 << d->hwirq);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void max732x_irq_unmask(struct irq_data *d)
@@ -358,6 +359,7 @@ static void max732x_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	chip->irq_mask_cur |= 1 << d->hwirq;
 }
 
@@ -429,7 +431,7 @@ static int max732x_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static struct irq_chip max732x_irq_chip = {
+static const struct irq_chip max732x_irq_chip = {
 	.name			= "max732x",
 	.irq_mask		= max732x_irq_mask,
 	.irq_unmask		= max732x_irq_unmask,
@@ -437,6 +439,8 @@ static struct irq_chip max732x_irq_chip = {
 	.irq_bus_sync_unlock	= max732x_irq_bus_sync_unlock,
 	.irq_set_type		= max732x_irq_set_type,
 	.irq_set_wake		= max732x_irq_set_wake,
+	.flags			= IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static uint8_t max732x_irq_pending(struct max732x_chip *chip)
@@ -517,7 +521,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		}
 
 		girq = &chip->gpio_chip.irq;
-		girq->chip = &max732x_irq_chip;
+		gpio_irq_chip_set_chip(girq, &max732x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

