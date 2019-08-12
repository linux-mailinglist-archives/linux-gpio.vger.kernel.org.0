Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED428987D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 10:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfHLIN5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 04:13:57 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37668 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfHLIN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 04:13:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id z28so43282338ljn.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEvw5UcE9xZfNUwLEDk2XldzEuGymSHW3uZoQ6avv2s=;
        b=GII7Ja0iY3nkT2m+KMHSd1UPVChsgMNT+WlBqTDEZQgF6lQJhGKOQMB0cL12dEgTq9
         ERCZfWDZ8uR7bSnbOjqZlVohmdzYzcgdftG3SHYSPCwxfghs2ztMPBMMeAfmojxFZjZb
         2edIx15+KNPnLRzSrMcSxKfd6gddb3wmJzyC3KL2uoltrE5RLmBZ33FY2yCr/dkkzacM
         x2Skqul5yMLxCO5PAidBqUfw5H0ggEicU1BuYRu4TCKW+UIDIEYdK70MZKrgZu2a+Cee
         iTN2k6HX5loNdhdHKigwiVedtl3TJWPGQIwhI1Kmkd8Bv9j+ljfIfCdc8hn+7D0vXU0P
         ptpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEvw5UcE9xZfNUwLEDk2XldzEuGymSHW3uZoQ6avv2s=;
        b=nFPF30anHonABJwFFe007rdqb9Q08ilbBAg9lYmad/+P7sfZX/9xYDaBkgvEARhbxc
         lYNpoln300Bd5yDl538rLnb+kjL0EBq01UzU+AAQjtDI4KhorAwoI2WemLdQOLEVaxWk
         hdk4KVsp9a60TPZVggLcURS0WNO/hmbfOIABcGAl5y/JHE3vltoO5mZWX+LC/QEZI3ZH
         K0Dhc7/2rQ+6kXm5ypqpg2wYv7EHQ2o5gB6NnHOfNyvl64BIimB93Wr6q/iPwSdiAJxq
         IQ4rgxrW7TeLnBtOv1gOLp0GaHgpS6vg/Rsv87GgbjQ0Sf8GU8hPBrrXDGdq9cqwe++D
         ub2A==
X-Gm-Message-State: APjAAAW/4dL1UfrULd4ZLIPRuSufX+4b4cIcw+AGa1dv33XXgsbi0k1h
        p1EIuqGto6AmgL+/K90Zmh1AslaRz80=
X-Google-Smtp-Source: APXvYqyicpTEtLBk+m3sftaSCnddzCCTt/8WdBW3oS44DTaUEf586rUgShC8e585aC9cDebzWr8Z5A==
X-Received: by 2002:a2e:144f:: with SMTP id 15mr9156087lju.226.1565597635070;
        Mon, 12 Aug 2019 01:13:55 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m3sm1382650ljg.47.2019.08.12.01.13.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 01:13:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: lynxpoint: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 10:13:51 +0200
Message-Id: <20190812081351.21284-1-linus.walleij@linaro.org>
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

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Andy: when you're happy with this you can either supply an
ACK and I will merge it or you can merge it into your tree
for a later pull request, just tell me what you prefer.
---
 drivers/gpio/gpio-lynxpoint.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 31b4a091ab60..e8ec07910eb7 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -358,25 +358,30 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = false;
 	gc->parent = dev;
 
-	ret = devm_gpiochip_add_data(dev, gc, lg);
-	if (ret) {
-		dev_err(dev, "failed adding lp-gpio chip\n");
-		return ret;
-	}
-
 	/* set up interrupts  */
 	if (irq_rc && irq_rc->start) {
+		struct gpio_irq_chip *girq;
+
+		girq = &gc->irq;
+		girq->chip = &lp_irqchip;
+		girq->parent_handler = lp_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = (unsigned)irq_rc->start;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+
 		lp_gpio_irq_init_hw(lg);
-		ret = gpiochip_irqchip_add(gc, &lp_irqchip, 0,
-					   handle_simple_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(dev, "failed to add irqchip\n");
-			return ret;
-		}
+	}
 
-		gpiochip_set_chained_irqchip(gc, &lp_irqchip,
-					     (unsigned)irq_rc->start,
-					     lp_gpio_irq_handler);
+	ret = devm_gpiochip_add_data(dev, gc, lg);
+	if (ret) {
+		dev_err(dev, "failed adding lp-gpio chip\n");
+		return ret;
 	}
 
 	pm_runtime_enable(dev);
-- 
2.21.0

