Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF3C87A9C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 14:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfHIMzV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 08:55:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34978 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHIMzV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 08:55:21 -0400
Received: by mail-lf1-f66.google.com with SMTP id p197so69408672lfa.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 05:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQxf0nmQEGu9XysGtpfwPwVdtDcc7XZuLrYwWXEbOno=;
        b=UyvI0T1V8JeGqIaAfWJTVnkp8iJnJv1yLFi/hp+rL1X4Pr+Cp6GRd9EQeM59eR40c0
         pP1ASAr8qQkTgbFTySp5f+QeY+YfejZHRqlpoKOaj+i4gLQhZczk20J/6nvp6hLX3Nk8
         SWga+C5ZZ0gEK79ygBjaAfx88Bgy4Ba557pG4mlHhF8XkyRHl71P/uql1adbM+A7dqsR
         DVvpwyhjO2Nts8TRxBVlbg8ROvPW6Hzldb9HijdwuGEqGf+aUC8GtOFSFA+fV8w9Bk5H
         ETLVVINgS7Yol/pLM6RyFY1/eFp7lgRtkudFLbDFLaYVgOhRtJYOrXobM+N+LV2jYMZl
         qphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQxf0nmQEGu9XysGtpfwPwVdtDcc7XZuLrYwWXEbOno=;
        b=TzklPb5u/DyF8gG/wyfdIwZokvBiNdyzblNNJsSGI76ZMH1ZZG/FBG8AQ9q1UcG8S1
         1GgsFKj2ofU4aJiK0zOTodMsSr4TTbp8rHLnvi2SOARyTIOD13qBta1tD3GbiIZ/C7Cg
         2WOtzVcjoz09+aalWIbKjt6iVXQRCpjpgFqb/AvT8xN1cWHn7jJzdnmQ5hAnEA5bx0N+
         GI7zynhEhfyx/YAa8PhoPk68m2mrfH5NIbn081qeLxxSeq7fVxBJOWDhy9OkzMNVv6ks
         hZUQWfZuRduaSVuLyLSPMUz0GwiXjV/xLgDvAaHmyhRVnx+5n9eZUA3y5XODY9Xliz4C
         520A==
X-Gm-Message-State: APjAAAUSHHEpAn1kbNUISb3MIxNeQxhGlh77HDUoW2OHpB4/qkydtnzT
        BI8/9TbBtvijLLfjjpldMkCpUqnH2DI=
X-Google-Smtp-Source: APXvYqz4cfy7BTSw0Vx5S+41o7lhG8LLE2H3I8mqaud9jY3IQEZ4uQ1Qi+OFd50e2mVufthCf0Hp1g==
X-Received: by 2002:a19:8586:: with SMTP id h128mr13074552lfd.62.1565355318656;
        Fri, 09 Aug 2019 05:55:18 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d16sm5146597lfn.36.2019.08.09.05.55.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 05:55:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: aspeed: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 14:55:15 +0200
Message-Id: <20190809125515.19094-1-linus.walleij@linaro.org>
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

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi Aspeed folks, it'd be great if you could test/review this
patch.
---
 drivers/gpio/gpio-aspeed.c | 60 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 13d80bfbc3b6..9defe25d4721 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -711,32 +711,6 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 	}
 }
 
-static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
-		struct platform_device *pdev)
-{
-	int rc;
-
-	rc = platform_get_irq(pdev, 0);
-	if (rc < 0)
-		return rc;
-
-	gpio->irq = rc;
-
-	set_irq_valid_mask(gpio);
-
-	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
-			0, handle_bad_irq, IRQ_TYPE_NONE);
-	if (rc) {
-		dev_info(&pdev->dev, "Could not add irqchip\n");
-		return rc;
-	}
-
-	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_gpio_irqchip,
-				     gpio->irq, aspeed_gpio_irq_handler);
-
-	return 0;
-}
-
 static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 					unsigned int offset, bool enable)
 {
@@ -1189,7 +1163,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
-	gpio->chip.irq.need_valid_mask = true;
 
 	/* Allocate a cache of the output registers */
 	banks = gpio->config->nr_gpios >> 5;
@@ -1212,16 +1185,41 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
 	}
 
-	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
-	if (rc < 0)
-		return rc;
+	/* Optionally set up an irqchip if there is an IRQ */
+	rc = platform_get_irq(pdev, 0);
+	if (rc > 0) {
+		struct gpio_irq_chip *girq;
+
+		gpio->irq = rc;
+		girq = &gpio->chip.irq;
+		girq->chip = &aspeed_gpio_irqchip;
+		girq->parent_handler = aspeed_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = gpio->irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->need_valid_mask = true;
+	}
 
 	gpio->offset_timer =
 		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
 	if (!gpio->offset_timer)
 		return -ENOMEM;
 
-	return aspeed_gpio_setup_irqs(gpio, pdev);
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	/* Now the valid mask is allocated */
+	if (gpio->irq)
+		set_irq_valid_mask(gpio);
+
+	return 0;
 }
 
 static struct platform_driver aspeed_gpio_driver = {
-- 
2.21.0

