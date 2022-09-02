Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7372D5ABA3F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 23:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiIBVke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 17:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiIBVka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 17:40:30 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75DD399D3
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 14:40:21 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id s22so2766830qkj.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bR3hEleHn1hDXjDK6nUjMSvBYEAsUeJzCzyUGuVERRQ=;
        b=wuzCTnre6tTsSegsWv8KZyKcXhhqdhcG6fFIvRHpUAcFTLq9edlgDAeNCrP1BZBuQs
         +snDeAgYpQ9ou4o7gjLmO4qAPCuMqjAMbSPDH6nE3m4Wt26glIh+Q+WnQ8h2JPbH743C
         XofCCIy/C62BWw7Gz4ktIrZQqvhlIuwS7utzOIyMLVq6TDdCeNhT05Niap6zzINjxe9d
         VRnsUCafjeFcUtRGslnzqSsXeskPb0D729WRKiT3jNNohcyEJmY1jMASfZ0wmaKpZmpH
         seXeBDvkWD9yhDdZJxHZ8g6wAsmC/bSfQs1ikHOQO7BCPMuu2XRckAw5U3BgMDCidcWo
         28Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bR3hEleHn1hDXjDK6nUjMSvBYEAsUeJzCzyUGuVERRQ=;
        b=mgMIbQ86EtH+JOdc/XvMrkeShI6SK/J5Cx8euh2zBkrZh/He5W2nFEEH3oACfUP88e
         /Cd2IIiQClZVQI+YfnGVXRNFN9a9Nb6m93SLgjKf9d7mNrdznxDE0KtPgmD5TYRA/0KS
         v11dvCcMBMc4F5bPBa6U/CfPWmjDa9laXJv48PZYkGhEoIsXvk6nvKocWI+HmUiQOYhD
         Dw2USqEYtoeyrVgIf9e54oMriE9iIg0f55MMNGlE/PGlDuP+I4mSxnyXTEn8B3lHa1qq
         reUunGh4QJ/j9sdA+XvUwVim3o05CtFJ5T/YfOSnrUgDfTYcAjg5OwgLuIlRLpM3P+cy
         IVkQ==
X-Gm-Message-State: ACgBeo1dtiyQ5XhIAG/K/uJFd7s6NAjVoeZpXh8bfYwUqURHx7wmtR1V
        5+ANFg7qEXo4IKm18tyTQM41vw==
X-Google-Smtp-Source: AA6agR5GjIxXkb/bcDLBsnO3UPU6jpE1pq17eJNvvjhLBlYBn3BCFQ7DqD21u9qoZ70EX7rLo01JsA==
X-Received: by 2002:a05:620a:4094:b0:6bb:8514:9c84 with SMTP id f20-20020a05620a409400b006bb85149c84mr24438491qko.134.1662154820356;
        Fri, 02 Sep 2022 14:40:20 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id 15-20020ac84e8f000000b0031f0b43629dsm1819533qtp.23.2022.09.02.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 14:40:20 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     brgl@bgdev.pl, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        Frede@cmslaser.com
Subject: [PATCH 3/4] gpio: 104-idio-16: Make irq_chip immutable
Date:   Fri,  2 Sep 2022 13:45:25 -0400
Message-Id: <1a97e3f21f695f238fad9366e5976694b41a5da0.1662140119.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1662140119.git.william.gray@linaro.org>
References: <cover.1662140119.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel warns about mutable irq_chips:

    "not an immutable chip, please consider fixing!"

Make the struct irq_chip const, flag it as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-104-idio-16.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 65a5f581d981..4756e583f223 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -174,10 +174,11 @@ static void idio_16_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned long mask = BIT(irqd_to_hwirq(data));
+	const unsigned long offset = irqd_to_hwirq(data);
 	unsigned long flags;
 
-	idio16gpio->irq_mask &= ~mask;
+	idio16gpio->irq_mask &= ~BIT(offset);
+	gpiochip_disable_irq(chip, offset);
 
 	if (!idio16gpio->irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
@@ -192,11 +193,12 @@ static void idio_16_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
-	const unsigned long mask = BIT(irqd_to_hwirq(data));
+	const unsigned long offset = irqd_to_hwirq(data);
 	const unsigned long prev_irq_mask = idio16gpio->irq_mask;
 	unsigned long flags;
 
-	idio16gpio->irq_mask |= mask;
+	gpiochip_enable_irq(chip, offset);
+	idio16gpio->irq_mask |= BIT(offset);
 
 	if (!prev_irq_mask) {
 		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
@@ -217,12 +219,14 @@ static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip idio_16_irqchip = {
+static const struct irq_chip idio_16_irqchip = {
 	.name = "104-idio-16",
 	.irq_ack = idio_16_irq_ack,
 	.irq_mask = idio_16_irq_mask,
 	.irq_unmask = idio_16_irq_unmask,
-	.irq_set_type = idio_16_irq_set_type
+	.irq_set_type = idio_16_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
@@ -299,7 +303,7 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 	idio16gpio->out_state = 0xFFFF;
 
 	girq = &idio16gpio->chip.irq;
-	girq->chip = &idio_16_irqchip;
+	gpio_irq_chip_set_chip(girq, &idio_16_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.37.2

