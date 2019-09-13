Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3239B1C70
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfIMLfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:41 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33166 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLfl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id d10so21863378lfi.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XxmY4f1RQi74zXyerk/mcobxBi1tw34QoigTbNp/Les=;
        b=gUggQK5Z9FaO57HcFWvFxo21GsklUZRbC4F+d3IkQeVwRUppCxRSkWuAdnqc/ADknw
         1aMT5MhJ0OREevh1CqRsvkAd4CkNWqwdfWdAeEK1wxFrSf4IWK+IrpK+aZmuw/R6tT89
         XcA3pKq2xRa9ZerAH4cSNQBU77k+OGhJ6HM7u8brhi5Ut/39b1dddQq43npHB94fXyKN
         fjrpWrEXYu93sj7vouZHdYY9imA9aYfF+vEv9bewiP5jupqAiyqTx1sMTRSnYphy02KF
         OK5Yg8sJMtqQPeNJI52VdqfWJztts+DyR9a8Hkf+ybJe7W2n5TGeVugYLOFBvJJASQHM
         gKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XxmY4f1RQi74zXyerk/mcobxBi1tw34QoigTbNp/Les=;
        b=NWV4vJrK+5fw7zsMHl7tqitkhrIzeAkL1l1mCw12GJY5Ilf3I9hMAnUVJIcxNuo6E8
         JllFkJzRUyJRi2ZT8VcuB1kuHELkyoNE/ZuIabNhFcWz5JC3yVECGMiAGEhLuyzUwVks
         YQUsazC0CdQS+7kGsItyPtBcbboLhIhhz/mAke23U4zIRk2CezyFa/FpiRlxAcn5wV7X
         7PfISrMUATBK5OlBa/RMMWH0kVVrogAPWUluGj/ZRtAyry7SqqcP7hRi60MxER93RctT
         m+4sdB8Qj5t9O3YPNK/W25tRLVXwirIX2PifwMLl6CHe4pVKoX+YHP4QI+cHlrkOA6j6
         uEbQ==
X-Gm-Message-State: APjAAAU6u1Gv7JhpWb+nfHWQBDhdNRx1kYDAPmm4Dazh3EQP6Bki+xc7
        Z0RldjiBjdwy5xkEfTndkCjeNEF79vH95MFT
X-Google-Smtp-Source: APXvYqynUEFJ3gOEN33vcO4t2z+WMSku4q9JBMvR2hayJHARezrsET+u52RhqzS41KZ/WQ29Q4pnZA==
X-Received: by 2002:ac2:47e3:: with SMTP id b3mr29486787lfp.80.1568374538928;
        Fri, 13 Sep 2019 04:35:38 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joshua Henderson <joshua.henderson@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/6] pinctrl: pic32: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:26 +0200
Message-Id: <20190913113530.5536-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113530.5536-1-linus.walleij@linaro.org>
References: <20190913113530.5536-1-linus.walleij@linaro.org>
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

Cc: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-pic32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e7f6dd5ab578..7e4c5a08a932 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2203,6 +2203,7 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	u32 id;
 	int irq, ret;
 	struct resource *res;
+	struct gpio_irq_chip *girq;
 
 	if (of_property_read_u32(np, "microchip,gpio-bank", &id)) {
 		dev_err(&pdev->dev, "microchip,gpio-bank property not found\n");
@@ -2240,25 +2241,23 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 
 	bank->gpio_chip.parent = &pdev->dev;
 	bank->gpio_chip.of_node = np;
+	girq = &bank->gpio_chip.irq;
+	girq->chip = &bank->irq_chip;
+	girq->parent_handler = pic32_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->parents[0] = irq;
 	ret = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
 			id, ret);
 		return ret;
 	}
-
-	ret = gpiochip_irqchip_add(&bank->gpio_chip, &bank->irq_chip,
-				0, handle_level_irq, IRQ_TYPE_NONE);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to add IRQ chip %u: %d\n",
-			id, ret);
-		gpiochip_remove(&bank->gpio_chip);
-		return ret;
-	}
-
-	gpiochip_set_chained_irqchip(&bank->gpio_chip, &bank->irq_chip,
-				     irq, pic32_gpio_irq_handler);
-
 	return 0;
 }
 
-- 
2.21.0

