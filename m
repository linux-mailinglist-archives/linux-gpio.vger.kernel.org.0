Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA014F4363
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239938AbiDEUSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443187AbiDEPjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 11:39:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B21B14753F;
        Tue,  5 Apr 2022 06:55:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A75261939;
        Tue,  5 Apr 2022 13:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651D4C385A1;
        Tue,  5 Apr 2022 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649166903;
        bh=m+etiDUzlrD/ZjwQQ1/4Tq58JAfeCm/GvOnttdLupCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ehAYsnaS4ot2a/yM8CADZcHdFj5Xx6gcFtqlMuXCtiYkdVkHnRvMIr8WDkDtDxhoA
         N326Rpr3WuiOV+YOAi0TIClg1oCQTrQwGRZu5uAzna5D98cVs3j/4IQPFxtUDG7yNI
         M4m4AsnPhoMOwcEkHdY7I1bGWpm+daJRNzAodYpPH1WFRowy5BRjUIpZ+z7CDWr8Qe
         VMXz9bVYjUxUEgOeP5Xq3tRr30KtfPdxCxHZuo0bnDs3y2aXbNez/PDnEHa5xjm7mx
         4a+JXuSRTHv4KwhESYU9geN2E0gQH1p/ZGFbbRUiMU1e5ugk8As7hslYWn+j+dfuXX
         FXShywqNKartQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nbje9-001q4g-5n; Tue, 05 Apr 2022 14:55:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Subject: [PATCH v2 06/10] pinctrl: apple-gpio: Make the irqchip immutable
Date:   Tue,  5 Apr 2022 14:54:40 +0100
Message-Id: <20220405135444.199295-7-maz@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405135444.199295-1-maz@kernel.org>
References: <20220405135444.199295-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, joey.gouly@arm.com, jonathanh@nvidia.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, bjorn.andersson@linaro.org, agross@kernel.org, jeffrey.l.hugo@gmail.com, tglx@linutronix.de, Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prevent gpiolib from messing with the irqchip by advertising
the irq_chip structure as immutable, making it const, and adding
the various calls that gpiolib relies upon.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 29 +++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 72f4dd2466e1..5e610849dfc3 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -36,7 +36,6 @@ struct apple_gpio_pinctrl {
 
 	struct pinctrl_desc pinctrl_desc;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 	u8 irqgrps[];
 };
 
@@ -275,17 +274,21 @@ static unsigned int apple_gpio_irq_type(unsigned int type)
 
 static void apple_gpio_irq_mask(struct irq_data *data)
 {
-	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(gc);
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
 	                   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
+	gpiochip_disable_irq(gc, data->hwirq);
 }
 
 static void apple_gpio_irq_unmask(struct irq_data *data)
 {
-	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
 
+	gpiochip_enable_irq(gc, data->hwirq);
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
 	                   FIELD_PREP(REG_GPIOx_MODE, irqtype));
 }
@@ -343,13 +346,15 @@ static void apple_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static struct irq_chip apple_gpio_irqchip = {
-	.name		= "Apple-GPIO",
-	.irq_startup	= apple_gpio_irq_startup,
-	.irq_ack	= apple_gpio_irq_ack,
-	.irq_mask	= apple_gpio_irq_mask,
-	.irq_unmask	= apple_gpio_irq_unmask,
-	.irq_set_type	= apple_gpio_irq_set_type,
+static const struct irq_chip apple_gpio_irqchip = {
+	.name			= "Apple-GPIO",
+	.irq_startup		= apple_gpio_irq_startup,
+	.irq_ack		= apple_gpio_irq_ack,
+	.irq_mask		= apple_gpio_irq_mask,
+	.irq_unmask		= apple_gpio_irq_unmask,
+	.irq_set_type		= apple_gpio_irq_set_type,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 /* Probe & register */
@@ -360,8 +365,6 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	void **irq_data = NULL;
 	int ret;
 
-	pctl->irq_chip = apple_gpio_irqchip;
-
 	pctl->gpio_chip.label = dev_name(pctl->dev);
 	pctl->gpio_chip.request = gpiochip_generic_request;
 	pctl->gpio_chip.free = gpiochip_generic_free;
@@ -377,7 +380,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	if (girq->num_parents) {
 		int i;
 
-		girq->chip = &pctl->irq_chip;
+		gpio_irq_chip_set_chip(girq, &apple_gpio_irqchip);
 		girq->parent_handler = apple_gpio_irq_handler;
 
 		girq->parents = kmalloc_array(girq->num_parents,
-- 
2.34.1

