Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DB587CDB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHIOkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:40:51 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38410 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfHIOkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:40:51 -0400
Received: by mail-lf1-f67.google.com with SMTP id h28so69640284lfj.5
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXxXOhEbXdsMl/G/C1HkrghsmnTlDveq2pniwsmkuSw=;
        b=M9x1XR+g8vj12BKhOTf5BoK5l9EiegLyuQAa7ryt4d5B7FuTh67HNmX2CdYaKiAt8X
         YBmXKe8K3wGekKRVk927ro0Y1Ir0wepXrfklB/ezn871qMJBvTS/ZGx6yxh3O6ngD+rz
         C0h+CNdrJhnjt5YIBr2WujnHsfCpytuWBnTIla7Cz77oWeOt4HIOEzQPj2RnhOelAXXj
         ZbVUe5BuzlkbiE19ho0EHatMAKnkCdTMXbW1QuhDC+qDuFoUO3kvNwRc8t6IO/feYOZe
         aTr/HcuVQJoqMElB2AwuAi5St+UT8LiJ6Cd2ylABDvZHIFI5tN60Rw68n6SzspQiVt/d
         Z69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXxXOhEbXdsMl/G/C1HkrghsmnTlDveq2pniwsmkuSw=;
        b=SWeWRrqcQo2Rv3/qcztAQYg6v7A5Rm8dgS+n507or8M3UdUPfENPE+IireZLvTMs7X
         G0fcuL4tR3GsPk4qEze5KNumOn+4Hw2u+oOTi2fuJZUS7+CtgSZ7xrY/mdpIvQPlSOXR
         tfeaSaFCIldEuaIlgEOz/9FlXYKiFegA404cPhaOjSNJgfxBlbNaMbtjtEmF+1T7li4e
         f90ANic7UxNVEuoHy3v4Z9KmDrdcONHo60YQkzy6iqo1eTLsXOxtVpPYl/URg2RY6mk8
         hAfMW65olfMAQwuaSXWiMG6WCrnF/sqaKoTw9V5/mR0Kjqn0cXuftnDuUEJNrjED2iI0
         wN/w==
X-Gm-Message-State: APjAAAWh7Sl2K6BXEhbGZnfoGPUt2e/+DFo7xBOcKscS5ZvcyzAho/iM
        8hdn7/wvPgxhNtAzZuECynR/gWq/Ebo=
X-Google-Smtp-Source: APXvYqzECjEkfwlQ61hdxRDYuFLmaNDXWpdqGOwXFS1iDyOyvathh0qLWdLh1pPQr3FJ/YDVx1Tk/g==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr13042213lfo.39.1565361649420;
        Fri, 09 Aug 2019 07:40:49 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b1sm19517164ljj.26.2019.08.09.07.40.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:40:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: tqmx86: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 16:40:45 +0200
Message-Id: <20190809144045.26018-1-linus.walleij@linaro.org>
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

Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tqmx86.c | 41 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index d5880db7f9d4..07050cdbadb9 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -219,6 +219,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tqmx86_gpio_data *gpio;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	void __iomem *io_base;
 	struct resource *res;
 	int ret, irq;
@@ -264,12 +265,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	ret = devm_gpiochip_add_data(dev, chip, gpio);
-	if (ret) {
-		dev_err(dev, "Could not register GPIO chip\n");
-		goto out_pm_dis;
-	}
-
 	if (irq) {
 		struct irq_chip *irq_chip = &gpio->irq_chip;
 		u8 irq_status;
@@ -287,23 +282,35 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		irq_status = tqmx86_gpio_read(gpio, TQMX86_GPIIS);
 		tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
 
-		ret = gpiochip_irqchip_add(chip, irq_chip,
-					   0, handle_simple_irq,
-					   IRQ_TYPE_EDGE_BOTH);
-		if (ret) {
-			dev_err(dev, "Could not add irq chip\n");
+		girq = &chip->irq;
+		girq->chip = irq_chip;
+		girq->parent_handler = tqmx86_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents) {
+			ret = -ENOMEM;
 			goto out_pm_dis;
 		}
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+	}
 
-		gpiochip_set_chained_irqchip(chip, irq_chip,
-					     irq, tqmx86_gpio_irq_handler);
+	ret = devm_gpiochip_add_data(dev, chip, gpio);
+	if (ret) {
+		dev_err(dev, "Could not register GPIO chip\n");
+		goto out_pm_dis;
 	}
 
 	/* Only GPIOs 4-7 are valid for interrupts. Clear the others */
-	clear_bit(0, chip->irq.valid_mask);
-	clear_bit(1, chip->irq.valid_mask);
-	clear_bit(2, chip->irq.valid_mask);
-	clear_bit(3, chip->irq.valid_mask);
+	if (irq) {
+		clear_bit(0, girq->valid_mask);
+		clear_bit(1, girq->valid_mask);
+		clear_bit(2, girq->valid_mask);
+		clear_bit(3, girq->valid_mask);
+	}
 
 	dev_info(dev, "GPIO functionality initialized with %d pins\n",
 		 chip->ngpio);
-- 
2.21.0

