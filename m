Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E54C87B81
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 15:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfHINiu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 09:38:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35943 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405948AbfHINiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 09:38:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id j17so15529851lfp.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RKvyntXueMtld/bLq4POUo+3j78kQALYYUxLrikEJfk=;
        b=L4xzzzDk/KyTM2kFNPtg1qE6myfUJe29C6NzJYFSsDrCJsGU3mrfg5CCudG1yMvRKP
         jMm1zH/ZWqeUYADBlPuVLxsHo6fiPhFAMTS8x1tT4eXXquUuskPw8NB6AhLyTuJ7ZBGi
         rQy1HE6ylgaclL/yIZPCoLT3SHJ91zkv7oVERslhyG396GaRZfZLWI/1xMYPmagJLRaA
         E8zXHKnZsP5N/s3ZUZdX0qQNCcJz88WznSZSIp2AMgYF3awmgC5ZimdO/GvYbDQ6Rnsa
         20CsvJ29bpVuGOpWQqrMxQ6OJ1ob2A2KTFxNUlF2AtXKnE9U6366dpyxOOHIA/GJnHbi
         Ircw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RKvyntXueMtld/bLq4POUo+3j78kQALYYUxLrikEJfk=;
        b=TUDtAnb2mlrbPSFQb8tbHRJUFME6D9HdWAAmDHMZJch6TzCsrx8xX03yTWuWBp/rZu
         a/X+pkFrtYO0c9UZ5TkZIk066Mr/q5PntQpbEstG7Xbt93FI3oMQikIoI1sGWD9lbl7r
         Sea5y7ACTxTXQHQEey0KSQ06+XQWlfn5nFyFeiiqrbnCTw/XcsUTFTouzbyUEBKkotwX
         mBdJuc7+H5OSTjV7BcpRAojKjZ/cchqP0eS0PWNYEzPCRyJzHcapadGRsL5Bqdk4AUXc
         ODNQ2F7vmGg3z0Y8zGJcWXNrwyFX90PvlzXYKbPOuw1z8jC7g9dJDENVnD7zgRKT72VP
         tqVA==
X-Gm-Message-State: APjAAAX4PV+zvzIA1OTwownpClwswqd8K0omZuTsVHaHvjKjTtsmMxv2
        0/c/LRY8grGntmsPBnCe4mKOL/p9FVY=
X-Google-Smtp-Source: APXvYqw78W/vGAgmLoZuCHcIcFatkVRugCEnYMAfZEjRgmNuX20n2iQgEt7OLaOu9sVTQotYDovvWw==
X-Received: by 2002:a19:f11a:: with SMTP id p26mr9034700lfh.160.1565357927999;
        Fri, 09 Aug 2019 06:38:47 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r24sm22193860ljb.72.2019.08.09.06.38.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 06:38:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jogo@openwrt.org>, Jun Nie <jun.nie@linaro.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: zx: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 15:38:45 +0200
Message-Id: <20190809133845.30991-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zx.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 8d9b9bf8510a..98cbaf0e415e 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -215,6 +215,7 @@ static int zx_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct zx_gpio *chip;
+	struct gpio_irq_chip *girq;
 	int irq, id, ret;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -242,31 +243,30 @@ static int zx_gpio_probe(struct platform_device *pdev)
 	chip->gc.parent = dev;
 	chip->gc.owner = THIS_MODULE;
 
-	ret = gpiochip_add_data(&chip->gc, chip);
-	if (ret)
-		return ret;
-
 	/*
 	 * irq_chip support
 	 */
 	writew_relaxed(0xffff, chip->base + ZX_GPIO_IM);
 	writew_relaxed(0, chip->base + ZX_GPIO_IE);
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		gpiochip_remove(&chip->gc);
-		return -ENODEV;
-	}
+	if (irq < 0)
+		return irq;
+	girq = &chip->gc.irq;
+	girq->chip = &zx_irqchip;
+	girq->parent_handler = zx_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
 
-	ret = gpiochip_irqchip_add(&chip->gc, &zx_irqchip,
-				   0, handle_simple_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "could not add irqchip\n");
-		gpiochip_remove(&chip->gc);
+	ret = gpiochip_add_data(&chip->gc, chip);
+	if (ret)
 		return ret;
-	}
-	gpiochip_set_chained_irqchip(&chip->gc, &zx_irqchip,
-				     irq, zx_irq_handler);
 
 	platform_set_drvdata(pdev, chip);
 	dev_info(dev, "ZX GPIO chip registered\n");
-- 
2.21.0

