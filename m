Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFB987AEF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 15:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406970AbfHINSO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 09:18:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42696 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406973AbfHINSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 09:18:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so6830848lfb.9
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMHyIY10wRDU6FO5jbJ2R+jLGL7a5ywGysVQL+ZhZOo=;
        b=OTwRj9BSfz7+sF7brp9UAxUWPrDk/OTawXWWQp5iDKe2R042i7tAHlvIpzCsHrtuDG
         NHeXQ8WUDqT/DN2SEBQdvYhNiBfORCz6d7z1wQtmmb1KqAHlZYqU+FQLZq3tQCZ3/rwy
         kPPUkjWkLGmDlJmXniCsQuwde+Hp2Ihr3NhvyifLHoiZ/1cX2u+TPlULXi+SVho/6hQD
         kI2rdH8WM6QZmgqqs8sgJqEvNLRivUMA8MlFo08b69/QB5ghG/A/wNDdJsr0z9vHNEW6
         Tdg0ZLZGEDEMOJEKXHXeoNC3cs1Vzc65h3pF55cDAYi6rWMWEZsOk98jV0ryS7rPTmLx
         GMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMHyIY10wRDU6FO5jbJ2R+jLGL7a5ywGysVQL+ZhZOo=;
        b=gjbqDzu+2utIqWbqT3b3R0Oup2kUv41vtCEsktgAU62Pc8htV7rQJYH5lW9YFcEFMH
         PfNSJ8lVgBx1PQZW1kgtBw+dxL61nBcADfUQ+mK3Q21UmoawUMZz/5N7i669uxTU9FI1
         lbM27ggG3vcJZ/BrHHqNSdwwJ7LbwEPuot8vzgSC5rTK4pY+Ux2remVi4A9EgoyHrB9X
         iy6OjTJC/HIfQtg6RayO5j+LOAogiQUncG6FvkRpPNpMa1mo59zRj8vetYp0ZrPez/29
         FKAW5aX2HQO9AucIkIPpxWH+ISxgab1P43DsKSPbJYQw1YaCYdaFkr4hdMwnQ9+BLCd0
         FuYg==
X-Gm-Message-State: APjAAAU3CnssNVkFyD3KgxcIDV69gPYE1T2jqTO55oWPs4MQ1KWJZiZJ
        Ac5l3O1wRXj4RLjsfc1+4zEIbpneAS8=
X-Google-Smtp-Source: APXvYqyoPvyOWV3mkH44XUNx5l/+rFOGAy9GUlvzKZW19kZe0ZfRrOXi/XRUtyW464Kwyfi+IbFp1w==
X-Received: by 2002:ac2:4644:: with SMTP id s4mr12617576lfo.158.1565356687188;
        Fri, 09 Aug 2019 06:18:07 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j21sm538982lfb.38.2019.08.09.06.18.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 06:18:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kotas <jank@cadence.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: cadence: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 15:18:04 +0200
Message-Id: <20190809131804.20352-1-linus.walleij@linaro.org>
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

Cc: Jan Kotas <jank@cadence.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi Jan, it'd be great if you could test/review this
patch.
---
 drivers/gpio/gpio-cadence.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 712ae212b0b4..a4d3239d2594 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -214,27 +214,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		goto err_revert_dir;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		goto err_disable_clk;
-	}
-
 	/*
-	 * irq_chip support
+	 * Optional irq_chip support
 	 */
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0) {
-		ret = gpiochip_irqchip_add(&cgpio->gc, &cdns_gpio_irqchip,
-					   0, handle_level_irq,
-					   IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&pdev->dev, "Could not add irqchip, %d\n",
-				ret);
+		struct gpio_irq_chip *girq;
+
+		girq = &cgpio->gc.irq;
+		girq->chip = &cdns_gpio_irqchip;
+		girq->parent_handler = cdns_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents) {
+			ret = -ENOMEM;
 			goto err_disable_clk;
 		}
-		gpiochip_set_chained_irqchip(&cgpio->gc, &cdns_gpio_irqchip,
-					     irq, cdns_gpio_irq_handler);
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+	}
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		goto err_disable_clk;
 	}
 
 	cgpio->bypass_orig = ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE);
-- 
2.21.0

