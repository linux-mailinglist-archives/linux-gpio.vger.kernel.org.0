Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41A0CB1C6F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfIMLfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:38 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37328 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:38 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so21855057lff.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yb/+G3TZ7Tb6RdpFJuCWvlbyLNP0pf8HNVvp3LwN82w=;
        b=G82JUXib1QdSx81R9RIU5xwm+dKFe0Dh8mmyRlBLc2Ey1E2cr58vkCt8hTbOPJCI0I
         cgSrqcesnJHKkU9IBnNWYN+NxCS8EkeCZLbDNaAeLEWoSW4ChduP/E6daZowIg42ecYX
         h/Am61amDhAAitn1s8BYwxks7nWaJGEVBPeRb2YA2YaDUDKSRM2/Wt91GxU+Q8OugX/E
         LZVH6IPpIkf9OfZ4536HLGDAU3fin0ul8L7aZow3mplyhNCTdAqEGFogyTmVmhRrf6Tv
         vPwBxKKd0kf7eVxb2AuQRKh0R/6Aa2M5tESqIbZbveSheLX1yFtaNfs3FCRqPklBXzQ7
         jQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yb/+G3TZ7Tb6RdpFJuCWvlbyLNP0pf8HNVvp3LwN82w=;
        b=O9rPUPtqVtp7wwpxICmjhQ1cjbTyyrKeut7elPaEWX8dIpz8Z8QPrseJeaWxpT3skc
         9OcbB3TjsCKs6tR/H/66oYJTC/OiWo7/98/XlGIRCHs+nljaQWs2aeMHJ2oLkQzv3b7+
         7eo1mxKq4/cFQK54uVLolkqEzjnpdrMSkLVH3JzpWD4qhggajUKlDbX2G/FBuIWOc9Lr
         WyoGfs6cSsOfucA6LXICZReJfbF8H3tZm28kXBfFqiPCQz8C5LLYB5uO9iW8axTofZGb
         jlLu/+uCTriR8X1bJgNeNGjcsBmzOAQOppoy3bH3FKA4RbHdvXFbUvHtLyEn/qBT+UFN
         Ja2A==
X-Gm-Message-State: APjAAAUesiaQcrdT27YEG7HrPcOM9YnTHKnJpGJqLWpmoYEzj68+qLaq
        CsfwiOHzehydxPH+yj3XRoh6R85KrwFnvMxO
X-Google-Smtp-Source: APXvYqyXUtKnHFhS9rQIIzR0ajwmw1KEmQoSBCULLhgWgpCudVYU0ywWzHZpKSeDrzHPewg6ymqIuQ==
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr31394766lfh.155.1568374536705;
        Fri, 13 Sep 2019 04:35:36 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:35 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/6] pinctrl: coh901: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:25 +0200
Message-Id: <20190913113530.5536-1-linus.walleij@linaro.org>
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

Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 50 +++++++++++++++-----------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 08b9e909e917..063a629be9b2 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -616,6 +616,7 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 {
 	struct u300_gpio *gpio;
 	struct resource *memres;
+	struct gpio_irq_chip *girq;
 	int err = 0;
 	int portno;
 	u32 val;
@@ -672,26 +673,17 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 	       gpio->base + U300_GPIO_CR);
 	u300_gpio_init_coh901571(gpio);
 
-#ifdef CONFIG_OF_GPIO
-	gpio->chip.of_node = pdev->dev.of_node;
-#endif
-	err = gpiochip_add_data(&gpio->chip, gpio);
-	if (err) {
-		dev_err(gpio->dev, "unable to add gpiochip: %d\n", err);
-		goto err_no_chip;
-	}
-
-	err = gpiochip_irqchip_add(&gpio->chip,
-				   &u300_gpio_irqchip,
-				   0,
-				   handle_simple_irq,
-				   IRQ_TYPE_EDGE_FALLING);
-	if (err) {
-		dev_err(gpio->dev, "no GPIO irqchip\n");
-		goto err_no_irqchip;
+	girq = &gpio->chip.irq;
+	girq->chip = &u300_gpio_irqchip;
+	girq->parent_handler = u300_gpio_irq_handler;
+	girq->num_parents = U300_GPIO_NUM_PORTS;
+	girq->parents = devm_kcalloc(gpio->dev, U300_GPIO_NUM_PORTS,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents) {
+		err = -ENOMEM;
+		goto err_dis_clk;
 	}
-
-	/* Add each port with its IRQ separately */
 	for (portno = 0 ; portno < U300_GPIO_NUM_PORTS; portno++) {
 		struct u300_gpio_port *port = &gpio->ports[portno];
 
@@ -700,16 +692,21 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 		port->gpio = gpio;
 
 		port->irq = platform_get_irq(pdev, portno);
-
-		gpiochip_set_chained_irqchip(&gpio->chip,
-					     &u300_gpio_irqchip,
-					     port->irq,
-					     u300_gpio_irq_handler);
+		girq->parents[portno] = port->irq;
 
 		/* Turns off irq force (test register) for this port */
 		writel(0x0, gpio->base + portno * gpio->stride + ifr);
 	}
-	dev_dbg(gpio->dev, "initialized %d GPIO ports\n", portno);
+	girq->default_type = IRQ_TYPE_EDGE_FALLING;
+	girq->handler = handle_simple_irq;
+#ifdef CONFIG_OF_GPIO
+	gpio->chip.of_node = pdev->dev.of_node;
+#endif
+	err = gpiochip_add_data(&gpio->chip, gpio);
+	if (err) {
+		dev_err(gpio->dev, "unable to add gpiochip: %d\n", err);
+		goto err_dis_clk;
+	}
 
 	/*
 	 * Add pinctrl pin ranges, the pin controller must be registered
@@ -729,9 +726,8 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 	return 0;
 
 err_no_range:
-err_no_irqchip:
 	gpiochip_remove(&gpio->chip);
-err_no_chip:
+err_dis_clk:
 	clk_disable_unprepare(gpio->clk);
 	dev_err(&pdev->dev, "module ERROR:%d\n", err);
 	return err;
-- 
2.21.0

