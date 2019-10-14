Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A5FD6104
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 13:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731822AbfJNLMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 07:12:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38527 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731261AbfJNLMH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 07:12:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id b20so16226279ljj.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tcZZ6ZPdok6Kk736n6qZ8YbGbyEzcHu0t7K2yZwv/ao=;
        b=YQC4SXzxMuSAUCRG0V/EV6fS49eCSFO2KCqd3VHvVBOqiYbmosh/z8dWEwKt1UAFoP
         ZROWm+S4XrJVzZyK3ibAW9AF6Y6ilEa2J8H2jdlw36++ti3x+6RrZXZlKJb6hcSysEgw
         f2au/kCF7jz3jW9zIiDMcdYF53ibgXhgCyiWdqEqFAZpMNFJStNBCPrNCGr3tPAKGZlI
         DHGxI1fWvIRSA4DDdfbWTritZ0zogwBS7mIz8HSA6QR6n1fTrkFq+uAoZnaUt7ImZLkq
         yB5U6RGfU+EzBvMYPDskq/RtxcZ6OrTKYqIGaFXly6lDiwx1wegO2Ezd066jY6xPYbNd
         Jm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tcZZ6ZPdok6Kk736n6qZ8YbGbyEzcHu0t7K2yZwv/ao=;
        b=HqWBy+mRUqc5dqfyQP2kp66Z+YhW77LWBbJc9R3IUPwJU+AsJPIpo8Xelgh/tKseOp
         Ha12+gpSA601vx9cLxriZbtnhTpR6E684GgLCInhrMHeHE2YyGrOK1axKQ9MTO3z47uf
         JkEp/vAxjDFHIWryOz1S1C1EJTkcZehqRrm/x0T6qhiKqfoWCyoKXjTbYBm/JEPhBDMZ
         zCJHpxken6Bm0DR+XJwLz1nwptDAYYj/oxEEMBa1pRw+HKqHeUWo2+w6F1B9VvKn/JCb
         DOJJnsnpCzx6uQ9c/SqxGzbObRIXlv5jAu/8IYVSuJ/RkXiiMqaLwQ4PBR2bGEbN7syU
         4vEg==
X-Gm-Message-State: APjAAAUVNC1WtRr5NUol3zgFuIstoS4OeJ05ciBuhq4uHYrKXVuyKHSR
        AjqFXWfPvDqS5SO/CcHB77NxQw902w8=
X-Google-Smtp-Source: APXvYqy3tU9xPwh5YLEMkmcOaKruAP2u4Js0d0LMYF3gL2Eu+Lfs3xLl9LCuhT7aGmmwNawbn0gUUw==
X-Received: by 2002:a2e:207:: with SMTP id 7mr18077686ljc.198.1571051523942;
        Mon, 14 Oct 2019 04:12:03 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v1sm4251873lfa.87.2019.10.14.04.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 04:12:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] pinctrl: nomadik: Pass irqchip when adding gpiochip
Date:   Mon, 14 Oct 2019 13:11:53 +0200
Message-Id: <20191014111154.9731-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014111154.9731-1-linus.walleij@linaro.org>
References: <20191014111154.9731-1-linus.walleij@linaro.org>
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
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 39 +++++++++--------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index dc81de15b85e..b7992da8b569 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -248,7 +248,6 @@ struct nmk_gpio_chip {
 	void __iomem *addr;
 	struct clk *clk;
 	unsigned int bank;
-	unsigned int parent_irq;
 	void (*set_ioforce)(bool enable);
 	spinlock_t lock;
 	bool sleepmode;
@@ -1092,6 +1091,7 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	struct device_node *np = dev->dev.of_node;
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	struct irq_chip *irqchip;
 	bool supports_sleepmode;
 	int irq;
@@ -1117,7 +1117,6 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	 * The virt address in nmk_chip->addr is in the nomadik register space,
 	 * so we can simply convert the resource address, without remapping
 	 */
-	nmk_chip->parent_irq = irq;
 	nmk_chip->sleepmode = supports_sleepmode;
 	spin_lock_init(&nmk_chip->lock);
 
@@ -1147,6 +1146,19 @@ static int nmk_gpio_probe(struct platform_device *dev)
 				  chip->base,
 				  chip->base + chip->ngpio - 1);
 
+	girq = &chip->irq;
+	girq->chip = irqchip;
+	girq->parent_handler = nmk_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&dev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+
 	clk_enable(nmk_chip->clk);
 	nmk_chip->lowemi = readl_relaxed(nmk_chip->addr + NMK_GPIO_LOWEMI);
 	clk_disable(nmk_chip->clk);
@@ -1158,28 +1170,7 @@ static int nmk_gpio_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, nmk_chip);
 
-	/*
-	 * Let the generic code handle this edge IRQ, the the chained
-	 * handler will perform the actual work of handling the parent
-	 * interrupt.
-	 */
-	ret = gpiochip_irqchip_add(chip,
-				   irqchip,
-				   0,
-				   handle_edge_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&dev->dev, "could not add irqchip\n");
-		gpiochip_remove(&nmk_chip->chip);
-		return -ENODEV;
-	}
-	/* Then register the chain on the parent IRQ */
-	gpiochip_set_chained_irqchip(chip,
-				     irqchip,
-				     nmk_chip->parent_irq,
-				     nmk_gpio_irq_handler);
-
-	dev_info(&dev->dev, "at address %p\n", nmk_chip->addr);
+	dev_info(&dev->dev, "chip registered\n");
 
 	return 0;
 }
-- 
2.21.0

