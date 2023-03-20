Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DD86C0DD4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 10:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCTJz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 05:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjCTJzZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 05:55:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4767B1F5CF
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 02:55:20 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g18so11442098ljl.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679306118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNbwpBrcxQyOJmFGB8QKYSUw0GcL4gHVq06YlQk9V4w=;
        b=odNzulw4pjVtLmYnmgubXKQe/ANfNF2OKvSlxkJ9K6L1U4dnK0JiNIUSeR8Kp8p1M6
         JRt4CtRCRZqu3tKU7aYmGCRu4ikbscZP1XUsDiD2DC1vTGR/pwWx15QJCQxkGos/DNlX
         +rMyAEbBulqnjMe6QLGGUbfv4QbiI9knU7AqXZQbWno2KRYKcSJ3/c31+XDMnyDGo/j/
         yxw2399oTI3QBwlqBJ/NLaC3h573x+XRYqBB4yof6B9oQ81hw0Vdtaca6L1zWBN2WXlz
         mbg9tBYRuFoBhn5MPkc6bAKoKRZ4ok7gPED6tHe0YEtpo2xIWVn4k82NHW3uLUy3f5IJ
         2/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679306118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNbwpBrcxQyOJmFGB8QKYSUw0GcL4gHVq06YlQk9V4w=;
        b=t51POfxCrOEMArNRne/QymV8DWPeMC5JQ1TIQjoQeXEjo5lc2ghbCs8rcSjVd787vn
         CGuaX0SSegoD/KxFbZXPREw1rQtsDnhE2ApnhvnCBMMEic6GNBqhASmiAxEf2v/k+ilD
         XObBPLEwoSIaKEMdcgl+9hyySfyXHiSAP7In+sQYiuWr/DgwRCaoiiIlkgh/q8ch0hHE
         aXSBDEIae3i/BV3jInYj7nGGyNX0N5j6EPMpwBW7DsGmOShe+6u9DHsgRdspEXI3t0fU
         pEmGjAmSDhqv2DW0hJVkL1Rlf/3NDpP0MR62qRyRV7YF5OQKgc1Q5drZG6VrQ5tPgqx4
         bRXQ==
X-Gm-Message-State: AO0yUKXXL1/FWPmYuXQQfxyLS1c7raXlqX0ZObMmCmqEpt4MFsoOtsNU
        zDXqhMeIgp4KyAMikRUI7YFaGw==
X-Google-Smtp-Source: AK7set+n7o2L968SF5glUu42xYtzIYLljtOPPBl1On6fNADisUPOjQZfTvXEfobi3RjvY4SRalsYSA==
X-Received: by 2002:a2e:7006:0:b0:298:ade0:40bc with SMTP id l6-20020a2e7006000000b00298ade040bcmr5128524ljc.10.1679306118261;
        Mon, 20 Mar 2023 02:55:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 02:55:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Mar 2023 10:55:11 +0100
Subject: [PATCH 4/9] gpio: thunderx: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230316-immutable-chips-2-v1-4-053d6ede831b@linaro.org>
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

Whereas in most cases we put the gpiochip_[enable|disable]_irq()
calls in the .irq_mask() and .irq_unmask() callbacks, here
we need to put them in the .irq_enable() and .irq_disable()
callbacks, as this driver uses both .irq_mask() and
.irq_mask_ack().

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-thunderx.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index cc62c6e64103..8521c6aacace 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -354,16 +354,22 @@ static int thunderx_gpio_irq_set_type(struct irq_data *d,
 	return IRQ_SET_MASK_OK;
 }
 
-static void thunderx_gpio_irq_enable(struct irq_data *data)
+static void thunderx_gpio_irq_enable(struct irq_data *d)
 {
-	irq_chip_enable_parent(data);
-	thunderx_gpio_irq_unmask(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	irq_chip_enable_parent(d);
+	thunderx_gpio_irq_unmask(d);
 }
 
-static void thunderx_gpio_irq_disable(struct irq_data *data)
+static void thunderx_gpio_irq_disable(struct irq_data *d)
 {
-	thunderx_gpio_irq_mask(data);
-	irq_chip_disable_parent(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	thunderx_gpio_irq_mask(d);
+	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 /*
@@ -372,7 +378,7 @@ static void thunderx_gpio_irq_disable(struct irq_data *data)
  * semantics and other acknowledgment tasks associated with the GPIO
  * mechanism.
  */
-static struct irq_chip thunderx_gpio_irq_chip = {
+static const struct irq_chip thunderx_gpio_irq_chip = {
 	.name			= "GPIO",
 	.irq_enable		= thunderx_gpio_irq_enable,
 	.irq_disable		= thunderx_gpio_irq_disable,
@@ -383,8 +389,8 @@ static struct irq_chip thunderx_gpio_irq_chip = {
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_set_type		= thunderx_gpio_irq_set_type,
-
-	.flags			= IRQCHIP_SET_TYPE_MASKED
+	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int thunderx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -526,7 +532,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->set_multiple = thunderx_gpio_set_multiple;
 	chip->set_config = thunderx_gpio_set_config;
 	girq = &chip->irq;
-	girq->chip = &thunderx_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &thunderx_gpio_irq_chip);
 	girq->fwnode = of_node_to_fwnode(dev->of_node);
 	girq->parent_domain =
 		irq_get_irq_data(txgpio->msix_entries[0].vector)->domain;

-- 
2.34.1

