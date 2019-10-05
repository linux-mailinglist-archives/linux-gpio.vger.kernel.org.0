Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195C5CCCC1
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 22:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfJEUuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 16:50:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34885 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJEUuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 16:50:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so6741332lfl.2
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mo3UTLfnKXN5DUCnwv+2wj54tzA/Y3hCT/sLyqvVb3E=;
        b=OL1k1JDe5j4+FhjpzdDPWrWXad4ysnko6KP8JK3iEreF/OS93MhAj24cGmCs5Cx3wK
         nX9DCtnwSL1brCAezPORNCMX1d1uHMscwcuEupekMUyH/7OL5oe2y9M3inGFk8W1GGLf
         K6xn0MklYDb16slweJPsHuZCyNkojNtnVIH1iD8Cky6CsCd0nskhQsJ0X0OVdLWCwOVA
         DI2AlJ/ycxwmG5ydt6UyfRxzwOOEZtBDooH2gOEOHtCEwroODx0iC2SVxhqSz/fGlilg
         nEFWEQiMs5y8EYDhZPIyRMIUSM9xFU903xpwqajtKeIQIMjBECHefepXzoZcWYDUINXb
         BJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mo3UTLfnKXN5DUCnwv+2wj54tzA/Y3hCT/sLyqvVb3E=;
        b=Y7M+tE7ZlKYlBIRO22v2RWTExYw7N252hMa8qri/+/vmiVotWMt4BhhHfzfdJki2Do
         AhJ2UFBcZImbMiydlBqKcI/3YiTZ1pVGyBCQGPvJJMBcdDOG1qWIY1ekoYHXgwFuTWRU
         Kkl9ZVudo/cEMlDTlZX2kJI+z1SlrlF6hF5iNJ0WqOCm4aRV+4ncUUSdBG83bLlNa06+
         wjLgirLCsKxM/0O+GCp49plFZloLRKC/ONOnmn9dQNIzYUZuanxzOo9EN7++JmMtPpf4
         OSDz80jx2Zu9ENIb87gRh20bDNhAWWJKIUYXt6xC72aibljuQXvM3jyhNzPl8VtlpEZ6
         JxFw==
X-Gm-Message-State: APjAAAX9WjYgscDu2T+4BshFMp1EcUmnIWpgrZpwONZM57G00MBh16ZT
        xX2CISpOggcX4rEzdSSxIlpa3ykYF5S9Gg==
X-Google-Smtp-Source: APXvYqy2Gm1xNfUF++Eug1ZJcHDurNwi+Rtai30f/mClrnsXWzl/K9f5Dz7ULyak+NMY16n9iXZ00w==
X-Received: by 2002:a19:6504:: with SMTP id z4mr12199539lfb.123.1570308598111;
        Sat, 05 Oct 2019 13:49:58 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id e19sm2048440lja.8.2019.10.05.13.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 13:49:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2] pinctrl: intel: baytrail: Pass irqchip when adding gpiochip
Date:   Sat,  5 Oct 2019 22:47:47 +0200
Message-Id: <20191005204747.8952-1-linus.walleij@linaro.org>
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
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v5.4-rc1
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 38 ++++++++++++++----------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9ffb22211d2b..64a59fc08b63 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1528,6 +1528,28 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (!vg->saved_context)
 		return -ENOMEM;
 #endif
+
+	/* set up interrupts  */
+	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
+	if (irq_rc && irq_rc->start) {
+		struct gpio_irq_chip *girq;
+
+		byt_gpio_irq_init_hw(vg);
+
+		girq = &gc->irq;
+		girq->chip = &byt_irqchip;
+		girq->parent_handler = byt_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+	}
+
 	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
 	if (ret) {
 		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
@@ -1541,22 +1563,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		return ret;
 	}
 
-	/* set up interrupts  */
-	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
-	if (irq_rc && irq_rc->start) {
-		byt_gpio_irq_init_hw(vg);
-		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
-					   handle_bad_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
-			return ret;
-		}
-
-		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
-					     (unsigned)irq_rc->start,
-					     byt_gpio_irq_handler);
-	}
-
 	return ret;
 }
 
-- 
2.21.0

