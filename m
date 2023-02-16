Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9F0699020
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjBPJiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjBPJhw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:37:52 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B18F4DE36
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:23 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id x40so1988033lfu.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5NV/DiggKvJS6hijrypI8dvD8vGEXvscfdW3OAZ7gw=;
        b=vpOt4uIdS4CejmbNFkjtETdFWC9FSHKvQ24Mu+ZFcoLfxbHaW88ULFuU4G+rZlkDUe
         zNJ1xbJCTmjJpTEZw3KUcXTKtbTwSaftY/fJ/4f71Zm8xO1pNyi6/rOw7OWtA9QMXnc/
         lppLL1EOvafjCqYNHlqCdZL0ronsId+/JAFvK3Z5R09hQVlz4go49yid8vY0lHg03AP1
         fzrhd4chP2Rlh2ZGEuHCK8jAiYTf+guPmN6Jnf6RT1RBmqFmG8cTFHbRJ2guhAb0hAel
         swb0rOA1qCdh189AjisbVRtcDYRZbRfDWAo0c5P3jdsDb57H1DsF0jcVx2v1w9XQos+r
         3+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5NV/DiggKvJS6hijrypI8dvD8vGEXvscfdW3OAZ7gw=;
        b=uq2JIPsck/gSahckXKYd/145dcJFC66KI8Ir1AH5/6GUhhZzAu+7uy9pF4B8Rlml+l
         /Yq65zKTMiJXVPJiDWgm4sHqjbV9QJx9kZwlHStbM8NZ/NIiLwO7XR/MA9ngEdc9lFQh
         a1AmdkGM5V7pK0xmI7pF8iz7pHcMTKK9lDZSSUjrDwmoQSL1keLVXvqeSmpBo4RVrzM9
         90f39VwXGXEXJOBmp0FLjwCDM40xpHyq0+B0gCDpzCz88hGEMYQlwwuiljm2ZTVQX+cC
         ih6lIuoz2PnQCgFIcaBTnEO/vJ0WkO3RhMNMbyz3bqnSTWUgy/+G6+DQiP3nxL6smtzN
         CtDg==
X-Gm-Message-State: AO0yUKV0bRuDVcLh8Vd+ByljVYm9OQjIU6kQwk4u8S9V0fmmLaGb8uKU
        t3eW496VCeopgbn7saDVzK/niA==
X-Google-Smtp-Source: AK7set+qQrC7lMxYHqBp5xLFc7wIVKYwgnuciFyKGblH7dLNUHl12igWqNWavwew9Je0VGw61SCQWQ==
X-Received: by 2002:ac2:5977:0:b0:4d5:ae35:b221 with SMTP id h23-20020ac25977000000b004d5ae35b221mr1395185lfp.34.1676540243189;
        Thu, 16 Feb 2023 01:37:23 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:22 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:15 +0100
Subject: [PATCH 14/17] gpio: omap: Drop irq_base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-14-51a8f224a5d0@linaro.org>
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
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The OMAP1 at one point was using static irqs but that time is gone,
OMAP1 uses sparse irqs like all other multiplatform targets so this
static allocation of descriptors should just go.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 80ddc43fd875..292e62c06008 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -992,7 +992,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	struct gpio_irq_chip *irq;
 	static int gpio;
 	const char *label;
-	int irq_base = 0;
 	int ret;
 
 	/*
@@ -1024,19 +1023,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	}
 	bank->chip.ngpio = bank->width;
 
-#ifdef CONFIG_ARCH_OMAP1
-	/*
-	 * REVISIT: Once we have OMAP1 supporting SPARSE_IRQ, we can drop
-	 * irq_alloc_descs() since a base IRQ offset will no longer be needed.
-	 */
-	irq_base = devm_irq_alloc_descs(bank->chip.parent,
-					-1, 0, bank->width, 0);
-	if (irq_base < 0) {
-		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
-		return -ENODEV;
-	}
-#endif
-
 	/* MPUIO is a bit different, reading IRQ status clears it */
 	if (bank->is_mpuio && !bank->regs->wkup_en)
 		irqc->irq_set_wake = NULL;
@@ -1047,7 +1033,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->num_parents = 1;
 	irq->parents = &bank->irq;
-	irq->first = irq_base;
 
 	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret)

-- 
2.34.1

