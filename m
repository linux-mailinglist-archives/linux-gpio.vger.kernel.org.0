Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F7289726
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 08:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfHLG3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 02:29:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41049 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLG3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 02:29:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id d24so97252769ljg.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2019 23:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YSy8DoNIl6rgR8pkGggmZ86Q54OzAg3sqWfAxNn8QY=;
        b=F6wKUc+wA/i9a4nqh3ZgaeZFauOjRLkqDa7z2sjOlK9BvoYX88aLIJO7fGi6/cFE8W
         k54idyl1SNfRq95qs20OslYhZRbAtFKwfInEGWR6K7by5c2ARKcv4J69xsDSewymYLTv
         cmLMbIaN3Ys+DeMiwdBzUAsF62rkb94SFdUgi+C+h0U8T4TEsMYYhYWkGdzDCTsmvtPo
         1czaHJlKrpJkGF7jH/wBGTBfUREFc/VfDgGP5Mqc5sdd7ffCdiDguCu2mqUi7JQaEK3Y
         280GJcFSWwvaIFJFLh/AtI7pbXA0tkrn5ZRiGT08kazqM51iagL5TgIFffXCu9yBde4Y
         iixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YSy8DoNIl6rgR8pkGggmZ86Q54OzAg3sqWfAxNn8QY=;
        b=PlV4q9laNeuOeeDLf7wmwyTCXPOXB5lyJ9mVEVIoKKH94R0W76/o1tD/8pxxHB3CRB
         Q5nvZp7H1TFSs0jmXIIhZpFTg/881rFWAa/wYLgNkGkWJy09Rom9YWtbPXLPwK38wvt8
         UwtF22eNCgg/hkuymtWcfrT8BFdi0ZFine6G4flNHh6zQ4oNsAcVF5r9TOh28rJtPglJ
         T5Lx4VQXXv2CCqSz1Z3/vSswX1C4LHRPKJfW26SfEq+bY0tivR+tl/PbUUpV/Rx1+dh3
         Em+Qz2opG9r5YpVskWYIEUE7M4V9Qcdo2ZYB4KZ4u6pbufqSKdw5frnpqTfTRkGW7Aso
         Pp/Q==
X-Gm-Message-State: APjAAAU0unVELHHvqOA7dlJlvMWbLVeCaJcrpIsdAz/0OuCdb8DHOT4D
        5cziPN1m1Tdpixga1ryHd2Gp312QoubQdA==
X-Google-Smtp-Source: APXvYqwUbkgAbER956OYKiy+Lua8BiBuJqg4Z6gMbeVvgXsdkRcavCVqmcNJr2QJgeDEcDdfwMHdvw==
X-Received: by 2002:a05:651c:1b9:: with SMTP id c25mr18106190ljn.25.1565591373269;
        Sun, 11 Aug 2019 23:29:33 -0700 (PDT)
Received: from localhost.localdomain (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
        by smtp.gmail.com with ESMTPSA id d16sm5843356lfl.29.2019.08.11.23.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2019 23:29:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Arlott <simon@arlott.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 08:27:29 +0200
Message-Id: <20190812062729.1892-1-linus.walleij@linaro.org>
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
conversion. The BCM2835 has multiple parents so let's
exploit the new facility in the GPIO_IRQCHIP to actually
deal with multiple parents.

Cc: Simon Arlott <simon@arlott.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 56 +++++++++++++--------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 183d1ffe6a75..b729997cd887 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -69,7 +69,6 @@
 struct bcm2835_pinctrl {
 	struct device *dev;
 	void __iomem *base;
-	int irq[BCM2835_NUM_IRQS];
 
 	/* note: locking assumes each bank will have its own unsigned long */
 	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
@@ -373,14 +372,14 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 	int group;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(pc->irq); i++) {
-		if (pc->irq[i] == irq) {
+	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
+		if (chip->irq.parents[i] == irq) {
 			group = i;
 			break;
 		}
 	}
 	/* This should not happen, every IRQ has a bank */
-	if (i == ARRAY_SIZE(pc->irq))
+	if (i == BCM2835_NUM_IRQS)
 		BUG();
 
 	chained_irq_enter(host_chip, desc);
@@ -995,6 +994,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct bcm2835_pinctrl *pc;
+	struct gpio_irq_chip *girq;
 	struct resource iomem;
 	int err, i;
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2835_NUM_GPIOS);
@@ -1041,38 +1041,34 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		raw_spin_lock_init(&pc->irq_lock[i]);
 	}
 
+	girq = &pc->gpio_chip.irq;
+	girq->chip = &bcm2835_gpio_irq_chip;
+	girq->parent_handler = bcm2835_gpio_irq_handler;
+	girq->num_parents = BCM2835_NUM_IRQS;
+	girq->parents = devm_kcalloc(&pdev->dev, BCM2835_NUM_IRQS,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	/*
+	 * Use the same handler for all groups: this is necessary
+	 * since we use one gpiochip to cover all lines - the
+	 * irq handler then needs to figure out which group and
+	 * bank that was firing the IRQ and look up the per-group
+	 * and bank data.
+	 */
+	for (i = 0; i < BCM2835_NUM_IRQS; i++)
+		girq->parents[i] = irq_of_parse_and_map(np, i);
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+
 	err = gpiochip_add_data(&pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
 		return err;
 	}
 
-	err = gpiochip_irqchip_add(&pc->gpio_chip, &bcm2835_gpio_irq_chip,
-				   0, handle_level_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_info(dev, "could not add irqchip\n");
-		return err;
-	}
-
-	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
-		pc->irq[i] = irq_of_parse_and_map(np, i);
-
-		if (pc->irq[i] == 0)
-			continue;
-
-		/*
-		 * Use the same handler for all groups: this is necessary
-		 * since we use one gpiochip to cover all lines - the
-		 * irq handler then needs to figure out which group and
-		 * bank that was firing the IRQ and look up the per-group
-		 * and bank data.
-		 */
-		gpiochip_set_chained_irqchip(&pc->gpio_chip,
-					     &bcm2835_gpio_irq_chip,
-					     pc->irq[i],
-					     bcm2835_gpio_irq_handler);
-	}
-
 	pc->pctl_dev = devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
-- 
2.21.0

