Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0742E87C14
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 15:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406374AbfHINvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 09:51:25 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45044 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfHINvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 09:51:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so92133063ljc.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaLwq6MYMD0U79o+6XH0qF1y/n5q12/0f9PXqJLchhw=;
        b=w5VzendaqHmXx+QGDz3mw3ddWBBNgOU9ElOZFiElxsZx7MCTaVRMJlYd8iSSvHbFwa
         +ps9GY4Qenmm7Zn46slnAee4h7aOiTAgOwV6sG/NJAA6V3OLM19eIwK9tQAfE23ovMUW
         bwT9SNFYE9Enfe2qXlaLZfkQIqvL/hC9IjFhOB2eXOw+OS41UkF3kuFIwxZYCcK2pXBT
         yDXb06kCLm4XxCMKqw4AfpGYxlUirzNZhr25sH3Byp1YhX1fmwfm4ITHCPWQZkTq9SOc
         Ha7j+EmKdBj01yvV/mxvL59p1bhAzPdcYKvqPjt6tUXahkNiwdxnfVsnFr/7iX605f49
         vS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaLwq6MYMD0U79o+6XH0qF1y/n5q12/0f9PXqJLchhw=;
        b=iTJWKxWBodZommzsr3HuPWhvbVx5wc8RawdpeV1psQqNUFwC707qUMvw4rr2IR4K+A
         Ytn/WnWl5xP3rmN0P4Rjfxekf7dJWIwZdO83KGTP6LTKws8cMRe+ETaoE8RVS3fx9xSs
         3g0EkWljxjpZdL9/qs+j7zmQ/MsPcQAYHoUvzGtp7XkTQajDSLwZdvRI9sx83jJff3ya
         KQUte0vVB3r+8gCf1oKp8GVu1RI5N4dKRe6jLbtw0+/BWR5p//rXFDN9LzvrNeM6uNBK
         P7z2AW54zNhmNOde/bZsW7Hom3AnMbxslBuXJfJfuvcPoiswhMBX7zUCl+SOt2HsbAIU
         QlLQ==
X-Gm-Message-State: APjAAAVEVPC94C+C3r52mq7D1cZc4Ox7/P0y8BKdp5tHLYzsUzubax5E
        SHAr2GaK6RbMME1F0cYCFFQTKxgWI/M=
X-Google-Smtp-Source: APXvYqwDHa/JLpcLk0e9VbPefzOJpu0s58JX4s27exc6ow6DHi8GpeWisTUyiS6uwONXNUNTggszjw==
X-Received: by 2002:a2e:8ecb:: with SMTP id e11mr11552228ljl.218.1565358682500;
        Fri, 09 Aug 2019 06:51:22 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q30sm19984598lfd.27.2019.08.09.06.51.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 06:51:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jayachandran C <jnair@caviumnetworks.com>,
        Kamlakant Patel <kamlakant.patel@broadcom.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: xlp: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 15:51:19 +0200
Message-Id: <20190809135119.6946-1-linus.walleij@linaro.org>
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

Cc: Jayachandran C <jnair@caviumnetworks.com>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xlp.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 54d3359444f3..d7b16bb9e4e4 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -290,6 +290,7 @@ MODULE_DEVICE_TABLE(of, xlp_gpio_of_ids);
 static int xlp_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_chip *gc;
+	struct gpio_irq_chip *girq;
 	struct xlp_gpio_priv *priv;
 	void __iomem *gpio_base;
 	int irq_base, irq, err;
@@ -395,27 +396,27 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		irq_base = 0;
 	}
 
+	girq = &gc->irq;
+	girq->chip = &xlp_gpio_irq_chip;
+	girq->parent_handler = xlp_gpio_generic_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->first = irq_base;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
 	err = gpiochip_add_data(gc, priv);
 	if (err < 0)
 		return err;
 
-	err = gpiochip_irqchip_add(gc, &xlp_gpio_irq_chip, irq_base,
-				handle_level_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(&pdev->dev, "Could not connect irqchip to gpiochip!\n");
-		goto out_gpio_remove;
-	}
-
-	gpiochip_set_chained_irqchip(gc, &xlp_gpio_irq_chip, irq,
-			xlp_gpio_generic_handler);
-
 	dev_info(&pdev->dev, "registered %d GPIOs\n", gc->ngpio);
 
 	return 0;
-
-out_gpio_remove:
-	gpiochip_remove(gc);
-	return err;
 }
 
 #ifdef CONFIG_ACPI
-- 
2.21.0

