Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA26FC8772
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 13:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfJBLi2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 07:38:28 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39694 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfJBLi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 07:38:27 -0400
Received: by mail-lj1-f194.google.com with SMTP id y3so16752261ljj.6
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aqd+0N9DK4RPDIWd3OXKq9bYDzE//xBJ4F1SiyVcLPg=;
        b=b8IdKvlekM1g/jmCK/dcdiFc6DMxiq3XaGknGYm8WiW6N3tsbhidLAT3L6mv2tHPFz
         4ds7r5KyKiwjKaXfiBcRAp/zsPfpo1wAclVI5ii5JKvX9iQuh6kiwlA6xKEgjL43h3ss
         ujT5c0MCqAltRnILKx/30FMc+AIk56boR73selhdWs9dxwHCyNQ1EkVh1ni0o0et8YEb
         lf59//nQgRqX/HcLl2ziBwhsxTh36rh/PGGdyZy5oOu8ob4mxy9vExkuyOWTfy7eHH23
         A1WlTTpDtt0/geRtIXmkVkVfMbmd3y+ETPtkIlbnjrR/Pem4Otcja+lL7xgqHEh+NUKB
         GXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aqd+0N9DK4RPDIWd3OXKq9bYDzE//xBJ4F1SiyVcLPg=;
        b=hegngU1XSJommeA04IaeGsdp6ruSdit68uxiKBM61u6O0I4ij67tmBttwj5VihQzwO
         Rn1T+eFoUv67R3v5w2XeNTxRNQV6nBJoy7ZEjbuk01YkQ64ErozZn/+hAx4qemZxJ8pG
         /QiQoumsPL3pSfNghFmNnfNFI3Qqt0WCWS7RIhTxvjcjsl5I1lwlaDQt8BcJjxSn/Rwe
         v0TqKLOXGaMuSOyBasmwwFWe4kVXRcorvL28+n+o17P1icWS6Yc5bSi+F+7R04ipshdM
         2TILO+MomxzcVYtcnrei541I4DThGiXoP+Mq4yAyTViSOWY9LzJv9MKJKLr4hMogTzm7
         PjcA==
X-Gm-Message-State: APjAAAXRqAzsY2l4BCJISU7E2hlGBVrfAzzrLM5renQYZtrSp6/bPZEP
        M5qGMGtvAccggZ1ylz1Frl6+V33Bg2vVTA==
X-Google-Smtp-Source: APXvYqy8jZzniycP2f7qSjsJ9Vpjj03dOFcrcCFOLMw87eo6Ei3Y8lG+x8SUBvvtvuBn6fTbA/h6vg==
X-Received: by 2002:a2e:412:: with SMTP id 18mr2183811lje.96.1570016305326;
        Wed, 02 Oct 2019 04:38:25 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y26sm5317149ljj.90.2019.10.02.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:38:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: oxnas: Pass irqchip when adding gpiochip
Date:   Wed,  2 Oct 2019 13:38:19 +0200
Message-Id: <20191002113819.4927-1-linus.walleij@linaro.org>
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

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-oxnas.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index 55488ca246f1..40dc1251432a 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -1197,6 +1197,7 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 	unsigned int id, ngpios;
 	int irq, ret;
 	struct resource *res;
+	struct gpio_irq_chip *girq;
 
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges",
 					     3, 0, &pinspec)) {
@@ -1232,6 +1233,18 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 	bank->gpio_chip.parent = &pdev->dev;
 	bank->gpio_chip.of_node = np;
 	bank->gpio_chip.ngpio = ngpios;
+	girq = &bank->gpio_chip.irq;
+	girq->chip = &bank->irq_chip;
+	girq->parent_handler = oxnas_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
 	ret = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
@@ -1239,18 +1252,6 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
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
-				     irq, oxnas_gpio_irq_handler);
-
 	return 0;
 }
 
-- 
2.21.0

