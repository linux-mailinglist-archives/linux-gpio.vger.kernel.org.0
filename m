Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC580C8818
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 14:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfJBMQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 08:16:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35213 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfJBMQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 08:16:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so12565415lfl.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImypWLeaPw/IThbY3ERMJs+WlUwaWz3UPu+vStY0+xg=;
        b=CPGdgpHCbq+lLfgVY/gDSJX9rdNp01d0LUHV1NXeg8xuiuYoynZPKp7MGH02ZbWXfv
         KbQ15+7lUuDNiBUZ8fRrsHTn9Y3UQkvKSGO/OClC9Uce/Bkm6nccasrIOj/j6vqeqtvW
         JEoD/HWTR8sE3rWY1de7vHb34aSnSqVhzOfy7kJM5nDJvM2udWPFMbrIhNDxSbT9ivdM
         iKaC6fI+PW0McZ6fdJANuefGd0lqlRpAmHwzjqbvtK961HkAKImAwYUZYyigPX/pufOP
         tN+ICf5RYnDsjjazrpi3/m2w0lLodpt/Yf7PxkaDsHmMkDzSqLpNb6iBfn132gc+hE8J
         5yHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImypWLeaPw/IThbY3ERMJs+WlUwaWz3UPu+vStY0+xg=;
        b=UT82UCTOMpEnq7TO9qS6cf+KxVgLXP9hNwNqBLMwtzZbfPRh8wcHCgzcRhfiwexrRb
         111F3mmfJA6T4m6Z/HpM1yWUp1MDa6UGGHepW/ZV8ZxhE5Rh0UR+2/NTnNuLM2Gpheh+
         azY3O+kDHmzkn8YXkVWog2d4dAjkD7C9OqpQkXMq55Mi2lDEiJGWGcA1674x9pFufN2b
         p6QDSyk+csg9+kjijQYMMtGOKhsGesmXxzH6Mdpn20pEPPCUgseI676AUJtx7Zk49bJE
         LK6NYnlzbrWVwK6U8Im9xu7JsR5zSzXOkl54VOxP7S67SISFKL1xvGOw1FtMycK16LhF
         QkTw==
X-Gm-Message-State: APjAAAVzT7BlS3K2CLd2VubTpyG6XPH9aAOg/YktvkLTOa03kpRrhN9C
        oRQ6xD7PnoaNvCxcEwXW1JBKultdcD++2A==
X-Google-Smtp-Source: APXvYqzEihJ8UJ3hOCglDxtDxOhuDqKvgq96I7XdrtLPBoDS1Gib2unUJ2KwglA0B/aFvJcLsKPhhA==
X-Received: by 2002:ac2:558e:: with SMTP id v14mr2119401lfg.161.1570018562917;
        Wed, 02 Oct 2019 05:16:02 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id a8sm4725441ljf.47.2019.10.02.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 05:16:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: armada-37xx: Pass irqchip when adding gpiochip
Date:   Wed,  2 Oct 2019 14:15:50 +0200
Message-Id: <20191002121550.16104-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Marek Behún <marek.behun@nic.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 34 ++++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 6462d3ca7ceb..952cf4e87e82 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -722,6 +722,8 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct device_node *np = info->dev->of_node;
 	struct gpio_chip *gc = &info->gpio_chip;
 	struct irq_chip *irqchip = &info->irq_chip;
+	struct gpio_irq_chip *girq = &gc->irq;
+	struct device *dev = &pdev->dev;
 	struct resource res;
 	int ret = -ENODEV, i, nr_irq_parent;
 
@@ -732,19 +734,21 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 			break;
 		}
 	};
-	if (ret)
+	if (ret) {
+		dev_err(dev, "no gpio-controller child node\n");
 		return ret;
+	}
 
 	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
 	if (!nr_irq_parent) {
-		dev_err(&pdev->dev, "Invalid or no IRQ\n");
+		dev_err(dev, "invalid or no IRQ\n");
 		return 0;
 	}
 
 	if (of_address_to_resource(info->dev->of_node, 1, &res)) {
-		dev_err(info->dev, "cannot find IO resource\n");
+		dev_err(dev, "cannot find IO resource\n");
 		return -ENOENT;
 	}
 
@@ -759,27 +763,27 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	irqchip->irq_set_type = armada_37xx_irq_set_type;
 	irqchip->irq_startup = armada_37xx_irq_startup;
 	irqchip->name = info->data->name;
-	ret = gpiochip_irqchip_add(gc, irqchip, 0,
-				   handle_edge_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_info(&pdev->dev, "could not add irqchip\n");
-		return ret;
-	}
-
+	girq->chip = irqchip;
+	girq->parent_handler = armada_37xx_irq_handler;
 	/*
 	 * Many interrupts are connected to the parent interrupt
 	 * controller. But we do not take advantage of this and use
 	 * the chained irq with all of them.
 	 */
+	girq->num_parents = nr_irq_parent;
+	girq->parents = devm_kcalloc(&pdev->dev, nr_irq_parent,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
 	for (i = 0; i < nr_irq_parent; i++) {
 		int irq = irq_of_parse_and_map(np, i);
 
 		if (irq < 0)
 			continue;
-
-		gpiochip_set_chained_irqchip(gc, irqchip, irq,
-					     armada_37xx_irq_handler);
+		girq->parents[i] = irq;
 	}
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
 
 	return 0;
 }
@@ -809,10 +813,10 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 	gc->of_node = np;
 	gc->label = info->data->name;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
+	ret = armada_37xx_irqchip_register(pdev, info);
 	if (ret)
 		return ret;
-	ret = armada_37xx_irqchip_register(pdev, info);
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
 	if (ret)
 		return ret;
 
-- 
2.21.0

