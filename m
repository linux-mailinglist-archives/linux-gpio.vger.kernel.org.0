Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042F743873
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 17:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733088AbfFMPFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 11:05:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36528 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbfFMOMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 10:12:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so18710232ljj.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2019 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmywJpFjHgmvjEMoWpWF9yHoGBgryxgBw5bxwwIwesQ=;
        b=guSml13vIU1wXx/7YAnblwn9qRSuGyGRvI9BjpOo0RGteG4uTQE43yrVM4madLPfG+
         w/YKdy7T08nAebO7lbraNmW1qvrb/9Rg3t78d0UDNNmPFlUJaPWMGGf3Wi4D+tO899A2
         Lb6otYWIx5PsDIozudeZvX4E+rzh3IikHuTaypUuWm5M6o80I+GmHfCGLBmXIkACr+MX
         vbIMdMQFYHvCX7TrJywfTeizELwTOwNBb73ufy2CwetuZ53Ni/quryfJEqb0G9Nb3iLP
         ZLfLaoClBikRvi0otI2YLt/Siqh37bkuaJtIEqx5hhdqjmrlinMgXUmOOGX0xmB/4O1s
         5olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmywJpFjHgmvjEMoWpWF9yHoGBgryxgBw5bxwwIwesQ=;
        b=tStM6QCudTlvW6QbrYt6rnbNqc4ofrnXlJv4fsq7TEmA/D7TdWQZzRix4KU19f42iU
         BMU0XWQyAx3IblF3eTyVEg6QuTLY/XJhSY31bmVu5wi47VXCdnpUkz/nf7BdaBPjv8Fo
         fELOC5DqTh7DxWNrK1x9TDRTGPKJNBp4ySPEDkWtbT6Gs/gzDYWY6OJjavdrcK8WEXKe
         hnPSIcslIiraGWk+9uA8DVPnXkJ58AwbjCUSSl98mQoMEnMSf7gACh3F1oiobtjqYJZo
         yqzhSkoPk5S9CzmaiZ7VhYNiFhtJ790rsl1hMEaNLiVux5VvnH7QnKjVAt1oQmcmao8k
         VKYA==
X-Gm-Message-State: APjAAAU771YQa+5XgRyhPBavZW7ucmvvJtYjd2Gmn332ZAxZwSbRs7V/
        3BokYhmkhHUyac6/UK82IOKlRVsGn04=
X-Google-Smtp-Source: APXvYqz/2BiQYyFAQqAOPKy3FtV8r9m0vcW/QEi1vkGRgmQqj5N6E3GQmVTQcqOFMaTJ0B3VRj8ucA==
X-Received: by 2002:a2e:50e:: with SMTP id 14mr28524326ljf.5.1560435141434;
        Thu, 13 Jun 2019 07:12:21 -0700 (PDT)
Received: from linux.local (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
        by smtp.gmail.com with ESMTPSA id v7sm20163ljj.3.2019.06.13.07.12.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 07:12:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: ftgpio: Pass irqchip when adding gpiochip
Date:   Thu, 13 Jun 2019 16:11:42 +0200
Message-Id: <20190613141142.26591-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Thierry: we need to do this with all gpiochips using
GPIOLIB_IRQCHIP and clean out the old code or there will
be confusion.
---
 drivers/gpio/gpio-ftgpio010.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 8ff8ce2970d9..31ce7ec3710c 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -226,6 +226,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ftgpio_gpio *g;
+	struct gpio_irq_chip *girq;
 	int irq;
 	int ret;
 
@@ -277,6 +278,24 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	if (!IS_ERR(g->clk))
 		g->gc.set_config = ftgpio_gpio_set_config;
 
+	g->irq.name = "FTGPIO010";
+	g->irq.irq_ack = ftgpio_gpio_ack_irq;
+	g->irq.irq_mask = ftgpio_gpio_mask_irq;
+	g->irq.irq_unmask = ftgpio_gpio_unmask_irq;
+	g->irq.irq_set_type = ftgpio_gpio_set_irq_type;
+
+	girq = &g->gc.irq;
+	girq->chip = &g->irq;
+	girq->parent_handler = ftgpio_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+
 	ret = devm_gpiochip_add_data(dev, &g->gc, g);
 	if (ret)
 		goto dis_clk;
@@ -289,22 +308,6 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	/* Clear any use of debounce */
 	writel(0x0, g->base + GPIO_DEBOUNCE_EN);
 
-	g->irq.name = "FTGPIO010";
-	g->irq.irq_ack = ftgpio_gpio_ack_irq;
-	g->irq.irq_mask = ftgpio_gpio_mask_irq;
-	g->irq.irq_unmask = ftgpio_gpio_unmask_irq;
-	g->irq.irq_set_type = ftgpio_gpio_set_irq_type;
-
-	ret = gpiochip_irqchip_add(&g->gc, &g->irq,
-				   0, handle_bad_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_info(dev, "could not add irqchip\n");
-		goto dis_clk;
-	}
-	gpiochip_set_chained_irqchip(&g->gc, &g->irq,
-				     irq, ftgpio_gpio_irq_handler);
-
 	platform_set_drvdata(pdev, g);
 	dev_info(dev, "FTGPIO010 @%p registered\n", g->base);
 
-- 
2.21.0

