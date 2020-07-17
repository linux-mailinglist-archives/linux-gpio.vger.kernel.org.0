Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAFA223E61
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgGQOkq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgGQOkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:40:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AAEC0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:40:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so12956149ljp.6
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eI2tzzBD0mcrBgHP0gckQxxsg/KqXE0va6uJcXDlZ8k=;
        b=wKllrF9l3VCHeqRJZ+VTBINNNexRGRxs/I0PMY41ZAIlB5jFU5j2SqOZzI164Kcp9l
         WzHkvrcvV5AFzzJxf8JwUU8hsWDu6nZQtab89BSUspMAyCufB+LmFQHj3zq6l/TyRjoO
         ajMigsLHqVuauPklTnZ+nt7wCySrqhpHW7dvNsjByzLz5FSFbKVZ6MuRMWDUJs6hlLg+
         FUtBTcS/9UBHPvTLG1dVFrJePXewaztClnRlxjwBJlklwSJqSKzJ3QbS2F3azFzGcX14
         ovchhboGtuZTBVhZCjt2phY/f2m5xqT6pa+3gmrmFuvcZze3560LqrFRBSAh9PbRUqmb
         Rk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eI2tzzBD0mcrBgHP0gckQxxsg/KqXE0va6uJcXDlZ8k=;
        b=SmjdYER1UesBJBwpTaIoRD0HDKTHe99pnDMXGSx0rrRYB7REYuNShalwmLOOzVKgAK
         Ni9SR/sq9OsInwzw5EbFr3kQ/IdQulkCRDSomd/9RWu2NKddXsXpTKxoctVF11kMABGA
         vJeuGmmLVoeHzoOXJufYB0qyxvX4zQP0mTQr6o669ZOTRfkXLhGKThKLzRpiZ6JSuzzi
         A+ETal6dmrJyRgpWMGbwTfbDpTKt/RLktjvhaV3LVo6r3E5X8VEJEY2W020u7nP6d6Gt
         fSGgBH/9+7CEaKTd4g4Ach4L8ZXSjx12Kub5vdPY+QUtmsOAWpbyryP8rFgw8sRBIqSe
         K69g==
X-Gm-Message-State: AOAM530visBF0iDyKw+RM7ZXQUbeHV/KtZzaOnz8VEiAneHMXwlBY8f8
        dmOrsrx+e+ZHZtyZC9wPKsYXl8bWhC0=
X-Google-Smtp-Source: ABdhPJwiKamR47Euk8aPmlAV58tHAq/AaVNJI1mtT3tbgJc9WzEJ/HhL67SDIG4AcszD4Vwc+qM87Q==
X-Received: by 2002:a2e:858e:: with SMTP id b14mr4931013lji.301.1594996843336;
        Fri, 17 Jul 2020 07:40:43 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q3sm1683454ljm.22.2020.07.17.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:40:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] gpio: pca953x: Use irqchip template
Date:   Fri, 17 Jul 2020 16:40:40 +0200
Message-Id: <20200717144040.63253-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pca953x.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 9c90cf3aac5a..ab22152bf3e8 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -834,6 +834,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	struct irq_chip *irq_chip = &chip->irq_chip;
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	if (dmi_first_match(pca953x_dmi_acpi_irq_info)) {
@@ -883,16 +884,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	irq_chip->irq_set_type = pca953x_irq_set_type;
 	irq_chip->irq_shutdown = pca953x_irq_shutdown;
 
-	ret = gpiochip_irqchip_add_nested(&chip->gpio_chip, irq_chip,
-					  irq_base, handle_simple_irq,
-					  IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&client->dev,
-			"could not connect irqchip to gpiochip\n");
-		return ret;
-	}
-
-	gpiochip_set_nested_irqchip(&chip->gpio_chip, irq_chip, client->irq);
+	girq = &chip->gpio_chip.irq;
+	girq->chip = irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+	girq->first = irq_base; /* FIXME: get rid of this */
 
 	return 0;
 }
@@ -1080,11 +1081,11 @@ static int pca953x_probe(struct i2c_client *client,
 	if (ret)
 		goto err_exit;
 
-	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
+	ret = pca953x_irq_setup(chip, irq_base);
 	if (ret)
 		goto err_exit;
 
-	ret = pca953x_irq_setup(chip, irq_base);
+	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (ret)
 		goto err_exit;
 
-- 
2.26.2

