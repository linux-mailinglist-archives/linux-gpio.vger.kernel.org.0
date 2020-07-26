Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F86522E30D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 00:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgGZWPG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 18:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZWPG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 18:15:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC75DC0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:15:05 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x9so15153242ljc.5
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gb2mv5Jszk8YroAXxPrHTRBJHRUpYaLrubUEmoZ6oJY=;
        b=v1Vrtctioyugr2zt9OeRxHRco0cZrzuZaWcUYUev1sdNzq6cfbkyiETILMiaSIKgof
         1yq31YjeK2oVhS43eZbenI7G0o0IC90b9tiLaz6/WU8XAEjDbTead2w8AMuv/plGeu2Q
         cQL0hwJpTUXJ2XI7sxZLQ28lr7NP+bJxFIdlaBe3OatzxAug7zOWlDHX6YUnoy4Afgbn
         0zN201eq0uCKXhRIidghzY1FBpp373wWlPuQajgq192QVASpnJK7kGCvd0kMcJpAF2Tc
         AfJbk1oo4L9YtXvxLhP9rP3W27k76aXFdsZe84U7NlwZnM63wePY+nI6z75jI2Z2SvXU
         IVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gb2mv5Jszk8YroAXxPrHTRBJHRUpYaLrubUEmoZ6oJY=;
        b=pCCkCE6QXGTriYvEyv7OnX8/LNU958LqORbZmbtKmRtzFSXgdK+vL6kJoGwAXA0zko
         zyih7vh5fHGBR5OlWdYrTjxVSd0Bk/TBUf81V420ejym6NWBTANbZKhq61gOsHT4g9gB
         aD6lhyVUoPEEAJ76tRHaArFVntu7LSTgacShROUwEfOYO5MPQ4nPX9DoAdua6Gza9nZf
         30zhTA2i2v3R6XHuZW9cu8gbn98qFkDv4DcmgxE6k+CbKdwLOrfA7ku+EvXsax2oNjXm
         5pHRdVuBp3DQPHikQPjt9npshlda5QFZqdKApY1nRTqGXZ6gcCEXQSNSsZtfaNJh4N1K
         782Q==
X-Gm-Message-State: AOAM532MOje8/2YnifSb7siZINkrAlQ+4Ae8wCye3FuaOlh84/5bu7m2
        yHQGNUp9jFrpvTEsuzEe/e0AV5JNXDzb9g==
X-Google-Smtp-Source: ABdhPJzQv7+LtBM+sRan0AQGiRwgfp320u8rhX8zkSpflg1E8zJJSlupr/n2MfwqrN4wGSKO1wrRzg==
X-Received: by 2002:a05:651c:552:: with SMTP id q18mr1822137ljp.262.1595801703946;
        Sun, 26 Jul 2020 15:15:03 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id y28sm2607340lfl.15.2020.07.26.15.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:15:03 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2] gpio: max732x: Use irqchip template
Date:   Mon, 27 Jul 2020 00:12:59 +0200
Message-Id: <20200726221259.133536-1-linus.walleij@linaro.org>
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

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Set up the IRQ template *before* registering the GPIO
  chip.
---
 drivers/gpio/gpio-max732x.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 63472f308857..238cbe926b9f 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -503,6 +503,8 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 
 	if (((pdata && pdata->irq_base) || client->irq)
 			&& has_irq != INT_NONE) {
+		struct gpio_irq_chip *girq;
+
 		if (pdata)
 			irq_base = pdata->irq_base;
 		chip->irq_features = has_irq;
@@ -517,19 +519,17 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 				client->irq);
 			return ret;
 		}
-		ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
-						   &max732x_irq_chip,
-						   irq_base,
-						   handle_simple_irq,
-						   IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&client->dev,
-				"could not connect irqchip to gpiochip\n");
-			return ret;
-		}
-		gpiochip_set_nested_irqchip(&chip->gpio_chip,
-					    &max732x_irq_chip,
-					    client->irq);
+
+		girq = &chip->gpio_chip.irq;
+		girq->chip = &max732x_irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		girq->threaded = true;
+		girq->first = irq_base; /* FIXME: get rid of this */
 	}
 
 	return 0;
@@ -695,11 +695,11 @@ static int max732x_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
+	ret = max732x_irq_setup(chip, id);
 	if (ret)
 		return ret;
 
-	ret = max732x_irq_setup(chip, id);
+	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (ret)
 		return ret;
 
-- 
2.26.2

