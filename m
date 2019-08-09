Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3488F87B1B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 15:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406273AbfHIN0y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 09:26:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44573 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfHIN0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 09:26:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so92061305ljc.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSFjIk2CuDna3AXJg7IKRglJkXTvsmhX3HKL4CcwO7E=;
        b=Ri5fm+14OHJVeYqaTSWgC25bcgo/QJf9T5HfFUsqUghgCmCIoYHUYGgaLzWYZHql6V
         Q1mVSDZ5Z7TMMNGSiLXS1hHH3CFyOrWe1Q9zieCchUn4Ud7xYj2v8t6VOQ10djYMCb7I
         RY/DksEAuTH47+rvSruSYxZYElbisDvvaNNn7XK7NyVQwvLLRSQA5q3icUhiKxStxbmb
         zC06q7qKjUJS4jYQOphQrG6cSI4S6yFOYqY9Cew6nUYlBfpTI0+039fuA6sZguj7EVzA
         Y8GZZsnCw9XJT60VHbwwwtVZxmYXLYh5OAtEz/5qy1kYQtNofWlXIMTqTHZv8/39NmGT
         Jn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSFjIk2CuDna3AXJg7IKRglJkXTvsmhX3HKL4CcwO7E=;
        b=gEWKqFp8nf1jEcygLV53SrlgE/8smOlLZlUVjSrL39HLMCUy3sC0jJ0Q6Gj3B2Tvvj
         L75Ykz9PQyxYPvJX2lQQdOUOyRXFiHztHDQLSoQzBm8+0iagPPygO504j4sGM6AnmOVS
         Dw8Nziwyymm9gKORlobIf7SZisx60wi1P2lWuAFsewee0cpODKv1VfHXU8Ppl95pDv+N
         mcM/J5eis4JVmJt77dlCa31OYF1MykbaLgQNAFrJMgoriTtpvWOXAwhW1GddL8OaolLU
         KNh72TtjH22x379oyE9Db/fo/VImmPXlpluGWAJ473w0kfbFRo2P0XCmbX1X/VJ0u+wq
         J9iA==
X-Gm-Message-State: APjAAAWzBxbxs6Ks+530mqT/KUtThNq0IGpib2vVkMh5xI4qiBjz3wMV
        Csd9tWl/AlV90+1vaVyT6AK3DmDmxXQ=
X-Google-Smtp-Source: APXvYqxLSPhoiap1/mLO1hi61NVW1yeCMsTBJe4Oapo+vvDmgkPzodZsBpmv2pt0btLBhxNlTo7XiA==
X-Received: by 2002:a2e:8455:: with SMTP id u21mr11044489ljh.20.1565357212174;
        Fri, 09 Aug 2019 06:26:52 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d3sm4631190lfj.15.2019.08.09.06.26.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 06:26:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: zynq: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 15:26:49 +0200
Message-Id: <20190809132649.25176-1-linus.walleij@linaro.org>
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

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 86b0bd256c13..cd475ff4bcad 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -830,6 +830,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	int ret, bank_num;
 	struct zynq_gpio *gpio;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	const struct of_device_id *match;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
@@ -885,34 +886,38 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm_dis;
 
-	/* report a bug if gpio chip registration fails */
-	ret = gpiochip_add_data(chip, gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to add gpio chip\n");
-		goto err_pm_put;
-	}
-
 	/* disable interrupts for all banks */
 	for (bank_num = 0; bank_num < gpio->p_data->max_bank; bank_num++)
 		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
 			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
 
-	ret = gpiochip_irqchip_add(chip, &zynq_gpio_edge_irqchip, 0,
-				   handle_level_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to add irq chip\n");
-		goto err_rm_gpiochip;
+	/* Set up the GPIO irqchip */
+	girq = &chip->irq;
+	girq->chip = &zynq_gpio_edge_irqchip;
+	girq->parent_handler = zynq_gpio_irqhandler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto err_pm_put;
 	}
+	girq->parents[0] = gpio->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
 
-	gpiochip_set_chained_irqchip(chip, &zynq_gpio_edge_irqchip, gpio->irq,
-				     zynq_gpio_irqhandler);
+	/* report a bug if gpio chip registration fails */
+	ret = gpiochip_add_data(chip, gpio);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add gpio chip\n");
+		goto err_pm_put;
+	}
 
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
 
-err_rm_gpiochip:
-	gpiochip_remove(chip);
 err_pm_put:
 	pm_runtime_put(&pdev->dev);
 err_pm_dis:
-- 
2.21.0

