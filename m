Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99F3221FC2
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 11:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgGPJfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 05:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgGPJfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 05:35:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB64C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 02:35:03 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id o4so2936010lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/ux3EqSZ6QqQYNSmgGhBPUjd+It6my6Xoplfq3uCHw=;
        b=M9pMBVjfIRsbdxXW8FW4PmMaZzPxJEqN6/3VYM3pogy1IBVB1DbX2FqLKWsrwOHo4B
         5OXMHaFyn/qnsCYVqyu5G0C4cjGFYtvVs3BJoEyCbxfXFJqiuE65kU7rjWU8qVTL3saS
         TDMslJLICLujJY1LySJw/QhJ1K6puvJHZsVC//27sdH18QfJuFcHUcq/6od+vOr+Xdfd
         v5u0IJADk/LlJEuYKpNUQ63iDCWESImylaV2vjlb1Gsieg2+EN8w/zc5X/JC7Zx5EjGG
         JPkbHJw+GQksIZyRlrHdVWAxE4wB4qhrh8fs9hUR2MPJDvBloMkSmsEMp8A49VCsRYR4
         yonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/ux3EqSZ6QqQYNSmgGhBPUjd+It6my6Xoplfq3uCHw=;
        b=Ry4uJNjXWbDchigcYwQ2g6BR7ZjlqKdTWC8QEPuvYhxQa12EuNqfBuI/zQBjsb6W7b
         vOCjuutm75B6vDcPtNcbcNPr7tGNtzzR5E81MMrQCTkUadiJYJ06F4llRBz+IvYGpfgk
         ZUy0k1k60V/f+V3v0QS98LP88VENvXiZO29nbJc1KzxQcGwnzYGJMSQtASVIIdyfeEP3
         qFiTnxhVWI9yQ7FvZCe1NwsP08k4xGVvMAaYE41e7cTLiiwTGueePZ+csKrtRGid0Y3z
         PsWwirUVcvx1UJ2nsnrXX+sVKaVl9+ZMH+T30NVDM+Slj17/3J2kkjiOm0clCJQ84pUF
         zg3Q==
X-Gm-Message-State: AOAM531Zcx4IWHPssIchGeb1kxneyauxgeSBZqtp0L1nYvsUN5OYjbDw
        WPqsydtsbGM2s8UxMe3QIm8ZE5igByM=
X-Google-Smtp-Source: ABdhPJzl6j8iRaAXYjFz+LoTkTGkIRmd/HQpnKuAwqJLyFEVRZh9lTb7X8nw8452ExYaUDxYmqehJA==
X-Received: by 2002:a05:6512:3195:: with SMTP id i21mr1699822lfe.131.1594892102134;
        Thu, 16 Jul 2020 02:35:02 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m9sm1071772lfb.5.2020.07.16.02.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 02:35:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc35892: Use irqchip template
Date:   Thu, 16 Jul 2020 11:34:59 +0200
Message-Id: <20200716093459.76378-1-linus.walleij@linaro.org>
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 6be0684cfa49..58b0da9eb76f 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -289,6 +289,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	struct tc3589x *tc3589x = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct tc3589x_gpio *tc3589x_gpio;
+	struct gpio_irq_chip *girq;
 	int ret;
 	int irq;
 
@@ -317,6 +318,16 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	tc3589x_gpio->chip.base = -1;
 	tc3589x_gpio->chip.of_node = np;
 
+	girq = &tc3589x_gpio->chip.irq;
+	girq->chip = &tc3589x_gpio_irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+
 	/* Bring the GPIO module out of reset */
 	ret = tc3589x_set_bits(tc3589x, TC3589x_RSTCTRL,
 			       TC3589x_RSTCTRL_GPIRST, 0);
@@ -339,21 +350,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret =  gpiochip_irqchip_add_nested(&tc3589x_gpio->chip,
-					   &tc3589x_gpio_irq_chip,
-					   0,
-					   handle_simple_irq,
-					   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"could not connect irqchip to gpiochip\n");
-		return ret;
-	}
-
-	gpiochip_set_nested_irqchip(&tc3589x_gpio->chip,
-				    &tc3589x_gpio_irq_chip,
-				    irq);
-
 	platform_set_drvdata(pdev, tc3589x_gpio);
 
 	return 0;
-- 
2.26.2

