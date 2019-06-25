Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE3E54DD8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 13:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbfFYLj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 07:39:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43329 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbfFYLj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 07:39:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id 16so15886653ljv.10
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mF93o5zMJRw1SFTeYC/Epp6TrTb2qj/PueiJv/T5pek=;
        b=XZkN6fgnzSwDoDDBhkBG5fMd50Y0f5B7JL5cB3htwwnH7SO3azxQepmpsziUFdR8H4
         K+XEC2qxsCHbVUH+BQcJ22lBXXGaINmP4YfYsPSKcBZQ8oK79f4X4zIPCzYCUAB6cwrz
         Mm+HR+GvSKkOpJhf4VkzuHFv5NwnlxuCvbS3FuyfCvhJ8oJHeLlErOEE9GO+bgai9N2b
         YD8PDkpKHQyh6Z/dUuggflEu1GddTgB1jqY8ciIljXTuy6piA8A3/1f3YBN1Sp9B82X/
         uF6OLdHHAse5U7e6wbn4lZodK4QI94KiznzvwozQKH2/P3LKYyGNdXgPs8wkF2VzOE4k
         GEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mF93o5zMJRw1SFTeYC/Epp6TrTb2qj/PueiJv/T5pek=;
        b=fZJ4x6CeURoMlcUCZW2cjqS+hRndB4akyouSwYZ/fTP8mj9Qf6/jL3thyg9Cr850nm
         FzfqbpPaKMl9MrNOXjK43gHyjtRJd0BOlXLiCOsZ1bxmsNEfU0WWjHhjOMXHctJWiTCj
         iO5ttV8xuag25q+ASBjjHJiaqJfL3yAVdCgILOPW/yNUBOpgpBxPMVBD4+vYWXRIWuB5
         AOhTqV9sEJAXnB5kYtzMJdURDxD2F9bVgxVfd2oJAQgFnSeNfb0fdc67+HWv0KKuJilC
         V3fvHK8AW73bvw9utNg7/lDlUACeL3QO9bmVDYZcbPvCF4G2dBrl/ZuGNmDKN43VrQyQ
         qiZw==
X-Gm-Message-State: APjAAAUjUiP6c+sFI1L6CSmLdfmisHEWoKDxk4f9pDKVO4/LfNf+OvMq
        Sy0B8P8ymvCDe67ySmL5HjOGUi6eC9k=
X-Google-Smtp-Source: APXvYqyABPQTwizptDkIdCjoxUvpkG5ImewcR1Q7YkwdieIxXXWF48bSr8CE0lIyqDOOSAsG03ZRvg==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr32330955ljg.80.1561462794788;
        Tue, 25 Jun 2019 04:39:54 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w8sm1908904lfq.62.2019.06.25.04.39.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 04:39:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ley Foon Tan <lftan@altera.com>,
        Tien Hock Loh <thloh@altera.com>
Subject: [PATCH] gpio: altera: Pass irqchip when adding gpiochip
Date:   Tue, 25 Jun 2019 13:39:52 +0200
Message-Id: <20190625113952.572-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
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

Cc: Ley Foon Tan <lftan@altera.com>
Cc: Tien Hock Loh <thloh@altera.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 48 +++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index a266d8796ee5..9f2e6b04c361 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -238,6 +238,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
+	struct gpio_irq_chip *girq;
 
 	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
 	if (!altera_gc)
@@ -265,24 +266,15 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->mmchip.gc.owner		= THIS_MODULE;
 	altera_gc->mmchip.gc.parent		= &pdev->dev;
 
-	ret = of_mm_gpiochip_add_data(node, &altera_gc->mmchip, altera_gc);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, altera_gc);
-
 	altera_gc->mapped_irq = platform_get_irq(pdev, 0);
 
 	if (altera_gc->mapped_irq < 0)
 		goto skip_irq;
 
 	if (of_property_read_u32(node, "altr,interrupt-type", &reg)) {
-		ret = -EINVAL;
 		dev_err(&pdev->dev,
 			"altr,interrupt-type value not set in device tree\n");
-		goto teardown;
+		return -EINVAL;
 	}
 	altera_gc->interrupt_trigger = reg;
 
@@ -293,29 +285,31 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->irq_chip.irq_startup  = altera_gpio_irq_startup;
 	altera_gc->irq_chip.irq_shutdown = altera_gpio_irq_mask;
 
-	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_gc->irq_chip,
-		0, handle_bad_irq, IRQ_TYPE_NONE);
+	girq = &altera_gc->mmchip.gc.irq;
+	girq->chip = &altera_gc->irq_chip;
+	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
+		girq->parent_handler = altera_gpio_irq_leveL_high_handler;
+	else
+		girq->parent_handler = altera_gpio_irq_edge_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	girq->parents[0] = altera_gc->mapped_irq;
 
+skip_irq:
+	ret = of_mm_gpiochip_add_data(node, &altera_gc->mmchip, altera_gc);
 	if (ret) {
-		dev_err(&pdev->dev, "could not add irqchip\n");
-		goto teardown;
+		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
+		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
-		&altera_gc->irq_chip,
-		altera_gc->mapped_irq,
-		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
-		altera_gpio_irq_leveL_high_handler :
-		altera_gpio_irq_edge_handler);
+	platform_set_drvdata(pdev, altera_gc);
 
-skip_irq:
 	return 0;
-teardown:
-	of_mm_gpiochip_remove(&altera_gc->mmchip);
-	pr_err("%pOF: registration failed with status %d\n",
-		node, ret);
-
-	return ret;
 }
 
 static int altera_gpio_remove(struct platform_device *pdev)
-- 
2.20.1

