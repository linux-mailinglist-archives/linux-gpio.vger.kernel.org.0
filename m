Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACF72280DC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgGUNZn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgGUNZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:25:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9295BC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:25:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q4so24124999lji.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qi1ypQB3Wnir5aNUVAtZquwjxveKU/MTjZcze+t5MwY=;
        b=z0IPKBN0w6cNOL178JY7Lkm334YsTcmVTX8mvm0v3OrEstCEF9Mis8Olyl06zUF5tQ
         CIMYQhJ93xPv8VBarcFQibOFkezJnHCd19Lr83lQw/KxCOBPrT1G2xiUx8l9fKMOqNMh
         ZemK3xowMLsN8ZOQzlOmtENIGdJCD9KDEvbo6z8A5sRQRAJDG62CAy8vLVbufi4eBkgo
         1H6PQ4tLDo+mVCUoeEqdcKHI9gvs6L971qsBbgGfa66PNkgLq12REmF9Wpa6t45tnQRC
         rcr+CWgIjvKyMx+9FCGKECGqun2f3F/Rusr4EmTFSHRm8sqb9hTk4X6fzg0LmKt6oT6b
         Z15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qi1ypQB3Wnir5aNUVAtZquwjxveKU/MTjZcze+t5MwY=;
        b=Zq5p4XVtYMSsI1twMtya0Kn6dqZWUVvrv0Uqp1h04zqk/njjx3d0gTy/GG+mfst/to
         QFeuEODA8TfiT+HpTZG/6YDWFY+4O+VqbxrlCRfxeRz7gDmkJxoo9LWEBB0+VaJtZPRW
         RZuI2y22eu70+rvyO5CaryIvnc41mt4MDm98begpgF1PVoBPt5DNoruPvhRqQEkPd7R4
         5woy8xnSbFHIycKj1rjvzVB2Pjh37MzomYWEiBthIe82otiosaS0hKX1PeY2PTOQrruZ
         s7cgFlUHW39PTTJ/W8A9B6RrOPOKTzQ9VdBhq9cEzp6cWXAVeK+tng74JtQn3mXLYTUV
         27Pw==
X-Gm-Message-State: AOAM533xNdrT6xw3VXz9M1k2pwc7MBj2DN8YHvEoqTXcEvPSNCwWc6vJ
        MMFsX/7ejXHlmqctegn8qKFGrz8l9y0=
X-Google-Smtp-Source: ABdhPJzOFpJyHpWb2tOe9SXBOBBVIROPzu0QHxfyjBPBihr3uaXzHnJtYNTE+Y3is3qsbIo/WH1T4A==
X-Received: by 2002:a2e:2e07:: with SMTP id u7mr11943608lju.195.1595337939875;
        Tue, 21 Jul 2020 06:25:39 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q3sm4432440ljm.22.2020.07.21.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:25:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] pinctrl: sx150x: Use irqchip template
Date:   Tue, 21 Jul 2020 15:25:37 +0200
Message-Id: <20200721132537.362160-1-linus.walleij@linaro.org>
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

Cc: Peter Rosin <peda@axentia.se>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 708bc91862fe..b325a136ac48 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1187,17 +1187,10 @@ static int sx150x_probe(struct i2c_client *client,
 	if (pctl->data->model != SX150X_789)
 		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
 
-	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
-	if (ret)
-		return ret;
-
-	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
-				     0, 0, pctl->data->npins);
-	if (ret)
-		return ret;
-
 	/* Add Interrupt support if an irq is specified */
 	if (client->irq > 0) {
+		struct gpio_irq_chip *girq;
+
 		pctl->irq_chip.irq_mask = sx150x_irq_mask;
 		pctl->irq_chip.irq_unmask = sx150x_irq_unmask;
 		pctl->irq_chip.irq_set_type = sx150x_irq_set_type;
@@ -1213,8 +1206,8 @@ static int sx150x_probe(struct i2c_client *client,
 
 		/*
 		 * Because sx150x_irq_threaded_fn invokes all of the
-		 * nested interrrupt handlers via handle_nested_irq,
-		 * any "handler" passed to gpiochip_irqchip_add()
+		 * nested interrupt handlers via handle_nested_irq,
+		 * any "handler" assigned to struct gpio_irq_chip
 		 * below is going to be ignored, so the choice of the
 		 * function does not matter that much.
 		 *
@@ -1222,13 +1215,15 @@ static int sx150x_probe(struct i2c_client *client,
 		 * plus it will be instantly noticeable if it is ever
 		 * called (should not happen)
 		 */
-		ret = gpiochip_irqchip_add_nested(&pctl->gpio,
-					&pctl->irq_chip, 0,
-					handle_bad_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(dev, "could not connect irqchip to gpiochip\n");
-			return ret;
-		}
+		girq = &pctl->gpio.irq;
+		girq->chip = &pctl->irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->threaded = true;
 
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						sx150x_irq_thread_fn,
@@ -1237,12 +1232,17 @@ static int sx150x_probe(struct i2c_client *client,
 						pctl->irq_chip.name, pctl);
 		if (ret < 0)
 			return ret;
-
-		gpiochip_set_nested_irqchip(&pctl->gpio,
-					    &pctl->irq_chip,
-					    client->irq);
 	}
 
+	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
+	if (ret)
+		return ret;
+
+	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
+				     0, 0, pctl->data->npins);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.26.2

