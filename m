Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1265BBA68
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 22:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiIQUe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 16:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIQUe6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 16:34:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F344913F3E
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 13:34:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j16so13803096lfg.1
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4dULb+gNKATB8ITbnH3HuHkaZ+T5XE9w+T0kKztseQQ=;
        b=F1tcmeJ/fi/FyoOlnY2ZJoZJXZhUirJl/MvgQ3uBkiWZZ15TvTOV6kW51N3vmSMvbt
         4MpzI6/y7yQqpuZYEl+dsXEafQdOAyvVXq283X1ERz032bpXFqfHc6J2xwPlYSYyhiE8
         7DHU2Qf0PVxV39r67NQKPppXJZCWWBHiutb6ETYhe96K3PVLmDd1p68PNB8C5xEvES0O
         LkqeyMm4ZwGw0Gvd9U0fi79TNi3Mm8rXXrJHg68ro2tYLy2UIK16se11k2S8d5zI/+FE
         81HowNFUQeTI88nWAci6lFSdUJB0Ej9smie6THRoloGGX3Tk33cRjgPy0V0hMaJHtJDl
         XRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4dULb+gNKATB8ITbnH3HuHkaZ+T5XE9w+T0kKztseQQ=;
        b=MXRAI73rOs1aC9RCkKVUCwIBQThTE9jb5tCF4iZ4dDHQUMzykCFGqmYsL0kD4vp6C1
         xXi9WPClXR6bTmC89eXqez+xA7RjjSYnmXsQVapugjWChGrtegtlWFjegAAaF08ol7Sb
         z1P2U3XtXQsjUWq2HKOasICAOzbE6DgGk1Y/mFcl9XFRwRtCJeJiwIf/XHVVn31r6BLi
         u5195I0TghPmPsGTWImFuVifQSf+Uqc8SfZZcpZmFriUAGlw+UeKlsoI58PZhmB4UOSY
         AAeGVLLKqq2UT66gEtSAGdX+f0foHOO1UWfcOoFw1jkzEwC9OIlWevNcKj0ueaa/I2/y
         iSww==
X-Gm-Message-State: ACrzQf2SgW3diZEVym1WLtVdZP55nsAutHn1NEIk5rKYh2xzSV0HB2ru
        uDuHbzmjtOuqrRFJztlVdnpafKHvBQ/Yzg==
X-Google-Smtp-Source: AMsMyM4yuNe1ZggvwWkCGLhA5rnxjeDV7L33vOSBszP7JD2+hBnvIbbgltLLCOXVKxpyXrJseFCBqQ==
X-Received: by 2002:a05:6512:3b20:b0:498:d7bc:28af with SMTP id f32-20020a0565123b2000b00498d7bc28afmr3401525lfv.65.1663446895187;
        Sat, 17 Sep 2022 13:34:55 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p4-20020ac24ec4000000b004948ddb4e4dsm4253687lfr.301.2022.09.17.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 13:34:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 2/2 v2] pinctrl: nomadik: Make gpio irqchip immutable
Date:   Sat, 17 Sep 2022 22:30:36 +0200
Message-Id: <20220917203036.167607-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220917203036.167607-1-linus.walleij@linaro.org>
References: <20220917203036.167607-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the Nomadik GPIO irqchip immutable.

Tested on the Samsung Galaxy SIII mini GT-I8190.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on the bug fix doing proper references to the gpio_chip.
- Use .irq_print_chip to set the irq_chip name as previously.
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 59 ++++++++++++++---------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index da426568bb8a..c691a44738cd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -244,7 +244,6 @@ enum nmk_gpio_slpm {
 
 struct nmk_gpio_chip {
 	struct gpio_chip chip;
-	struct irq_chip irqchip;
 	void __iomem *addr;
 	struct clk *clk;
 	unsigned int bank;
@@ -675,10 +674,9 @@ static void __nmk_gpio_set_wake(struct nmk_gpio_chip *nmk_chip,
 	__nmk_gpio_irq_modify(nmk_chip, offset, WAKE, on);
 }
 
-static int nmk_gpio_irq_maskunmask(struct irq_data *d, bool enable)
+static void nmk_gpio_irq_maskunmask(struct nmk_gpio_chip *nmk_chip,
+				    struct irq_data *d, bool enable)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	clk_enable(nmk_chip->clk);
@@ -693,18 +691,24 @@ static int nmk_gpio_irq_maskunmask(struct irq_data *d, bool enable)
 	spin_unlock(&nmk_chip->lock);
 	spin_unlock_irqrestore(&nmk_gpio_slpm_lock, flags);
 	clk_disable(nmk_chip->clk);
-
-	return 0;
 }
 
 static void nmk_gpio_irq_mask(struct irq_data *d)
 {
-	nmk_gpio_irq_maskunmask(d, false);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
+
+	nmk_gpio_irq_maskunmask(nmk_chip, d, false);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void nmk_gpio_irq_unmask(struct irq_data *d)
 {
-	nmk_gpio_irq_maskunmask(d, true);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	nmk_gpio_irq_maskunmask(nmk_chip, d, true);
 }
 
 static int nmk_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
@@ -1072,13 +1076,34 @@ static struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
 	return nmk_chip;
 }
 
+static void nmk_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
+
+	seq_printf(p, "nmk%u-%u-%u", nmk_chip->bank,
+		   gc->base, gc->base + gc->ngpio - 1);
+}
+
+static const struct irq_chip nmk_irq_chip = {
+	.irq_ack = nmk_gpio_irq_ack,
+	.irq_mask = nmk_gpio_irq_mask,
+	.irq_unmask = nmk_gpio_irq_unmask,
+	.irq_set_type = nmk_gpio_irq_set_type,
+	.irq_set_wake = nmk_gpio_irq_set_wake,
+	.irq_startup = nmk_gpio_irq_startup,
+	.irq_shutdown = nmk_gpio_irq_shutdown,
+	.irq_print_chip = nmk_gpio_irq_print_chip,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int nmk_gpio_probe(struct platform_device *dev)
 {
 	struct device_node *np = dev->dev.of_node;
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	struct irq_chip *irqchip;
 	bool supports_sleepmode;
 	int irq;
 	int ret;
@@ -1119,22 +1144,8 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;
 
-	irqchip = &nmk_chip->irqchip;
-	irqchip->irq_ack = nmk_gpio_irq_ack;
-	irqchip->irq_mask = nmk_gpio_irq_mask;
-	irqchip->irq_unmask = nmk_gpio_irq_unmask;
-	irqchip->irq_set_type = nmk_gpio_irq_set_type;
-	irqchip->irq_set_wake = nmk_gpio_irq_set_wake;
-	irqchip->irq_startup = nmk_gpio_irq_startup;
-	irqchip->irq_shutdown = nmk_gpio_irq_shutdown;
-	irqchip->flags = IRQCHIP_MASK_ON_SUSPEND;
-	irqchip->name = kasprintf(GFP_KERNEL, "nmk%u-%u-%u",
-				  dev->id,
-				  chip->base,
-				  chip->base + chip->ngpio - 1);
-
 	girq = &chip->irq;
-	girq->chip = irqchip;
+	gpio_irq_chip_set_chip(girq, &nmk_irq_chip);
 	girq->parent_handler = nmk_gpio_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&dev->dev, 1,
-- 
2.37.3

