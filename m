Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD9EDC3533
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 15:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfJANIz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 09:08:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33768 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJANIz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 09:08:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so13307050ljd.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrL7e8AE4GzTIm/OPwcUkc3usJTCXV9qhRW1aBwRVI4=;
        b=lcH+N/Xsh+45fKVUxtPkmuEncD8mMRab24NgU+ipTrYmCpriffr29YK8c7PDQeUOyO
         pCMSPVgMDBxj41F5ByE8Yhx7bMsgaoBizmZkeabw4MRCzsH2VUiMrNrydY2Jz2OwQ5PK
         mDQL0/nR0dW6+w+kC4OkgibJQTi5HNIuLDgs3ZeX2coywp0PvfCdlVb7Monu/7kv07ir
         SoPsHk0Cz9vd1WOFugbYimX0yQmBtfiYztq2rmm1hmXCr8EkmeKNzJIAl559gz1f5RZ9
         wVhYvznnjoTtVMcUgxYW7cw+/MvWqhsMETPRwL9iqI0VuCuUM0bpAn3iDhj7eJjmU1hy
         V31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrL7e8AE4GzTIm/OPwcUkc3usJTCXV9qhRW1aBwRVI4=;
        b=NhY+X92CS9UBhJhD8ztdE0gymSYhBOTtStK6llW8Lqa9icYRQhjlEk+Cv8o24cVtY0
         nmXDom60PkFxz2/NPbcmfx0rFgduAUpY35r5g534LiKwtC3r8KSQuigEf84BgcDnBD/c
         UFgO2Rg6Mvg8BbizC5/yVqlMhiz5y84xU18+5FkJ9gc9rsJHArSTk/iZPA1S/qLCuJdT
         nZe7A7BJ8CcfSsdbgS7CffCQCTomuW394oV0xgLLSWfS0cKgOustdGMrphyfGJ9tXr4s
         Baf8pl2ZWVbHTMBizl7KijjAwYfI02phzHWGHCztWso0AFFPSn421ANjj3Yrwce+q6os
         uaKA==
X-Gm-Message-State: APjAAAVty3IBFrqPYqGplKjC70Xb3gWb5e+4WvXNfbrZ3iyETIAjQkXI
        dUIx723UN1NqRcbmjCoKny6/gWB9PUpJeg==
X-Google-Smtp-Source: APXvYqzlweKJN+KKNhI5zC+rbwPbP7VO8OphzQX74i5CQMq04DxRlbbU2H71wfH42MZ7aySJS9qgtA==
X-Received: by 2002:a2e:90d9:: with SMTP id o25mr12019424ljg.94.1569935332748;
        Tue, 01 Oct 2019 06:08:52 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id t8sm4909270ljd.18.2019.10.01.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:08:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: at91: Pass irqchip when adding gpiochip
Date:   Tue,  1 Oct 2019 15:06:45 +0200
Message-Id: <20191001130645.8350-1-linus.walleij@linaro.org>
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
conversion: at91 is a little bit special since it registers
up to 3 gpio_chips with the same parent handler, but just
passing girq->parent_handler and the parent on the first
of them should cut it.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 47 ++++++++++++++++------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index d6e7e9f0ddec..117075b5798f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1723,9 +1723,11 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 	struct at91_gpio_chip   *prev = NULL;
 	struct irq_data		*d = irq_get_irq_data(at91_gpio->pioc_virq);
 	struct irq_chip		*gpio_irqchip;
-	int ret, i;
+	struct gpio_irq_chip	*girq;
+	int i;
 
-	gpio_irqchip = devm_kzalloc(&pdev->dev, sizeof(*gpio_irqchip), GFP_KERNEL);
+	gpio_irqchip = devm_kzalloc(&pdev->dev, sizeof(*gpio_irqchip),
+				    GFP_KERNEL);
 	if (!gpio_irqchip)
 		return -ENOMEM;
 
@@ -1747,33 +1749,30 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 	 * handler will perform the actual work of handling the parent
 	 * interrupt.
 	 */
-	ret = gpiochip_irqchip_add(&at91_gpio->chip,
-				   gpio_irqchip,
-				   0,
-				   handle_edge_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&pdev->dev, "at91_gpio.%d: Couldn't add irqchip to gpiochip.\n",
-			at91_gpio->pioc_idx);
-		return ret;
-	}
+	girq = &at91_gpio->chip.irq;
+	girq->chip = gpio_irqchip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
 
-	/* The top level handler handles one bank of GPIOs, except
+	/*
+	 * The top level handler handles one bank of GPIOs, except
 	 * on some SoC it can handle up to three...
 	 * We only set up the handler for the first of the list.
 	 */
 	gpiochip_prev = irq_get_handler_data(at91_gpio->pioc_virq);
 	if (!gpiochip_prev) {
-		/* Then register the chain on the parent IRQ */
-		gpiochip_set_chained_irqchip(&at91_gpio->chip,
-					     gpio_irqchip,
-					     at91_gpio->pioc_virq,
-					     gpio_irq_handler);
+		girq->parent_handler = gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = at91_gpio->pioc_virq;
 		return 0;
 	}
 
 	prev = gpiochip_get_data(gpiochip_prev);
-
 	/* we can only have 2 banks before */
 	for (i = 0; i < 2; i++) {
 		if (prev->next) {
@@ -1903,6 +1902,10 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	range->npins = chip->ngpio;
 	range->gc = chip;
 
+	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
+	if (ret)
+		goto gpiochip_add_err;
+
 	ret = gpiochip_add_data(chip, at91_chip);
 	if (ret)
 		goto gpiochip_add_err;
@@ -1910,16 +1913,10 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	gpio_chips[alias_idx] = at91_chip;
 	gpio_banks = max(gpio_banks, alias_idx + 1);
 
-	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
-	if (ret)
-		goto irq_setup_err;
-
 	dev_info(&pdev->dev, "at address %p\n", at91_chip->regbase);
 
 	return 0;
 
-irq_setup_err:
-	gpiochip_remove(chip);
 gpiochip_add_err:
 clk_enable_err:
 	clk_disable_unprepare(at91_chip->clock);
-- 
2.21.0

