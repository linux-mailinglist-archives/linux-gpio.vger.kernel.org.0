Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D456B1CC2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 08:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCIHqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 02:46:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjCIHqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 02:46:31 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8151DDB0E
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 23:46:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j11so1118036lfg.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 23:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pkmx+b8ik/C6bLfv+4RBCDp/VEmyhMZOMZzx00ojykk=;
        b=p3Kr/WFNbbKFk66agzCT4u42Y5KITAZpT48aFDNPE9ZUZHzzWb76fkK8FF1mTSwXvA
         YN00K6GTgQC1XC+mSoGVipsLmUmGGI2Ditgn5WnNaGmdlVcaT0n1cQsDlfgsKhlAdyIG
         0VD4mueZ56RA8/YbfkwoduJ4nCXDurAqKFa6Rt8oQHpjXxLFrUWlgtfVwrrAoMGpKt0w
         aariaDW/AIcCYsIghKFcThCHY0OPYL8YkfwbdKEkF8qSKkpnlYYSD99dkFG0/dqduNje
         gSlB2/gHJo7+OIQaV7pAaEMDPRnenW8c0PzItdFAYuv0gBV0pV2zXHmS6KtCDIR3Fn+W
         Eg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkmx+b8ik/C6bLfv+4RBCDp/VEmyhMZOMZzx00ojykk=;
        b=ZMHW0Y/UKiDK87f3snCoXSh3P88eX9++5R1ra2NLFfMaT64Hp0TVYBvtws/nq92rJd
         NhFbJmDpBCZlzOXK3di1VN29QvFxY5QrKL5aRJs+F24hV5Lnanr5R4zwGg70VtMWJgCb
         DVfntrx4d670XuZJxzrjCjoSMekG44FWlTzInsePNvfFpeU7B+IVGllW4I24hVlbo4q9
         q+Kru6t7HSegerzg8cuF+sWoB3VPLx9RkP2RdWzP5gRvMls7dedEjWQjLHc9skyvdxam
         52M4WQpxv4TPFwyDi+GnBKnGsflLnct+TlyPPjuTgxUb1OoZNxlOAHtZTsYMx30kjkDE
         tjLw==
X-Gm-Message-State: AO0yUKXUk+qKJ+31j7T/RIUpP+whpWUhoZub56C2deGHCDPzTnmwJ4yJ
        0P5gi3GUs4RGROOhH2/OUEqZ2Q==
X-Google-Smtp-Source: AK7set/7bPEP30lH2CywZpfXJDDlcTykBdecq0v0yxbUeNWQFNURhNsZZCgZbpHl19Di3POVs7nG3A==
X-Received: by 2002:ac2:5dfa:0:b0:4b6:e405:1027 with SMTP id z26-20020ac25dfa000000b004b6e4051027mr6046717lfq.14.1678347968374;
        Wed, 08 Mar 2023 23:46:08 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 09 Mar 2023 08:46:00 +0100
Subject: [PATCH v3 12/17] gpio: mlxbf2: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-12-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/gpio/gpio-mlxbf2.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 77a41151c921..6abe01bc39c3 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/resource.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
@@ -65,10 +66,10 @@ struct mlxbf2_gpio_context_save_regs {
 /* BlueField-2 gpio block context structure. */
 struct mlxbf2_gpio_context {
 	struct gpio_chip gc;
-	struct irq_chip irq_chip;
 
 	/* YU GPIO blocks address */
 	void __iomem *gpio_io;
+	struct device *dev;
 
 	struct mlxbf2_gpio_context_save_regs *csave_regs;
 };
@@ -237,6 +238,7 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *irqd)
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(irqd));
 	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
 	val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
 	val |= BIT(offset);
@@ -261,6 +263,7 @@ static void mlxbf2_gpio_irq_disable(struct irq_data *irqd)
 	val &= ~BIT(offset);
 	writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
 	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(irqd));
 }
 
 static irqreturn_t mlxbf2_gpio_irq_handler(int irq, void *ptr)
@@ -322,6 +325,24 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 	return 0;
 }
 
+static void mlxbf2_gpio_irq_print_chip(struct irq_data *irqd,
+				       struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
+
+	seq_printf(p, dev_name(gs->dev));
+}
+
+static const struct irq_chip mlxbf2_gpio_irq_chip = {
+	.irq_set_type = mlxbf2_gpio_irq_set_type,
+	.irq_enable = mlxbf2_gpio_irq_enable,
+	.irq_disable = mlxbf2_gpio_irq_disable,
+	.irq_print_chip = mlxbf2_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /* BlueField-2 GPIO driver initialization routine. */
 static int
 mlxbf2_gpio_probe(struct platform_device *pdev)
@@ -340,6 +361,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	if (!gs)
 		return -ENOMEM;
 
+	gs->dev = dev;
+
 	/* YU GPIO block address */
 	gs->gpio_io = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gs->gpio_io))
@@ -376,13 +399,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0) {
-		gs->irq_chip.name = name;
-		gs->irq_chip.irq_set_type = mlxbf2_gpio_irq_set_type;
-		gs->irq_chip.irq_enable = mlxbf2_gpio_irq_enable;
-		gs->irq_chip.irq_disable = mlxbf2_gpio_irq_disable;
-
 		girq = &gs->gc.irq;
-		girq->chip = &gs->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
 		girq->handler = handle_simple_irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		/* This will let us handle the parent IRQ in the driver */

-- 
2.34.1

