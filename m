Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297AA223E8D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgGQOsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgGQOsk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:48:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A80CC0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:48:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t9so6215637lfl.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4Z0tAY2I1A2vCnOGuWciY3cICM1n713PFURzLjRqIY=;
        b=IZorEmXcv1bOlE99AwhY7GJfPvBErRea0YXkfk9Sz4CP3xKmOzSEtWGc6m8yJqfsqS
         aYaMPYGXMNNx7wuw93gq2NOSiuiPNj+7eYW68CmXYX1vHx/wTl+dYlWhqJ5yMckWa5YG
         vw6hkFy8jdCd23croPVSuRdMjFjL5H2s2we7iFcuWTg97iQva9ufQ2NZRQ6GmGO/pzXe
         47g0WZ2pXJraREyfKSEkInXawJRsmtqqQ6fy8NqLRLcMbYDZ9lyDc03VKLLEJjRs0E0W
         PtduskbiuXMEYLUS1ay+Vhl0zRLKNRNv6XwuAAJ/Pzx0hibTemEsoZlzXe/SS7SutZLK
         nT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4Z0tAY2I1A2vCnOGuWciY3cICM1n713PFURzLjRqIY=;
        b=Yd3keMriASU5J7HYJjQfGZJIomo+ceiz2CAOUEf8WvEEK/Sh2rrvRcOAWDHCmDa3JU
         yUroPW0olgxV8C/bQH+UF2KmGlJCLg4k8xUSpPMoThc5LOj0XRh2TTwfGwoYmqQBPRoi
         tAuyYiJCcFOao0WmORv6KKTpMh6or2C75RzQzmxYPThD/Jd3c5UietQv+8pH8uwIBV0y
         UDaD4sy+t9+VpvHy0/rtAx79xXwawNpsQaNzww+44W9Qei9IJX36/j8lbww4qD7mMYya
         pe3PA2JqfUy2sLgWfqTsMyHHaf+zC8al3WkUcA4lGhXJj5FqbkeTeogefiRvDKxM2oG7
         aoxw==
X-Gm-Message-State: AOAM532+IWSSQKgDEjbNaNeOmgsaKciTSsT8Dm8akXeipXPYH2YOIw30
        Th3Rh4Aej0540k84jE1B/bhZs8y7lsw=
X-Google-Smtp-Source: ABdhPJw9NIgK3qHUJsDzcxSWEA3Twt6NfDijCpJskSOzpgjZkmtARYs3f/Kq2wBKTQ1cpWEBj+m5Fg==
X-Received: by 2002:a05:6512:3a5:: with SMTP id v5mr4040066lfp.138.1594997317899;
        Fri, 17 Jul 2020 07:48:37 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id x5sm1682970ljm.132.2020.07.17.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:48:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Anders Darander <anders@chargestorm.se>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH] gpio: pcf857x: Use irqchip template
Date:   Fri, 17 Jul 2020 16:48:35 +0200
Message-Id: <20200717144835.68150-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Anders Darander <anders@chargestorm.se>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 47 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 14fb8f6a1ad2..a2a8d155c75e 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -334,29 +334,19 @@ static int pcf857x_probe(struct i2c_client *client,
 	gpio->out = ~n_latch;
 	gpio->status = gpio->out;
 
-	status = devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
-	if (status < 0)
-		goto fail;
-
 	/* Enable irqchip if we have an interrupt */
 	if (client->irq) {
-		gpio->irqchip.name = "pcf857x",
-		gpio->irqchip.irq_enable = pcf857x_irq_enable,
-		gpio->irqchip.irq_disable = pcf857x_irq_disable,
-		gpio->irqchip.irq_ack = noop,
-		gpio->irqchip.irq_mask = noop,
-		gpio->irqchip.irq_unmask = noop,
-		gpio->irqchip.irq_set_wake = pcf857x_irq_set_wake,
-		gpio->irqchip.irq_bus_lock = pcf857x_irq_bus_lock,
-		gpio->irqchip.irq_bus_sync_unlock = pcf857x_irq_bus_sync_unlock,
-		status = gpiochip_irqchip_add_nested(&gpio->chip,
-						     &gpio->irqchip,
-						     0, handle_level_irq,
-						     IRQ_TYPE_NONE);
-		if (status) {
-			dev_err(&client->dev, "cannot add irqchip\n");
-			goto fail;
-		}
+		struct gpio_irq_chip *girq;
+
+		gpio->irqchip.name = "pcf857x";
+		gpio->irqchip.irq_enable = pcf857x_irq_enable;
+		gpio->irqchip.irq_disable = pcf857x_irq_disable;
+		gpio->irqchip.irq_ack = noop;
+		gpio->irqchip.irq_mask = noop;
+		gpio->irqchip.irq_unmask = noop;
+		gpio->irqchip.irq_set_wake = pcf857x_irq_set_wake;
+		gpio->irqchip.irq_bus_lock = pcf857x_irq_bus_lock;
+		gpio->irqchip.irq_bus_sync_unlock = pcf857x_irq_bus_sync_unlock;
 
 		status = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, pcf857x_irq, IRQF_ONESHOT |
@@ -365,10 +355,21 @@ static int pcf857x_probe(struct i2c_client *client,
 		if (status)
 			goto fail;
 
-		gpiochip_set_nested_irqchip(&gpio->chip, &gpio->irqchip,
-					    client->irq);
+		girq = &gpio->chip.irq;
+		girq->chip = &gpio->irqchip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+		girq->threaded = true;
 	}
 
+	status = devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
+	if (status < 0)
+		goto fail;
+
 	/* Let platform code set up the GPIOs and their users.
 	 * Now is the first time anyone could use them.
 	 */
-- 
2.26.2

