Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5759279D07
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgI0AFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:22 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:51711 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728724AbgI0AFV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjv4blbzC4;
        Sun, 27 Sep 2020 01:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164755; bh=dgb3fryIR/h82S0ZIMI7wbAYSPc3yco4sMhX5KqPpwc=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=NhkYopv9ND1jdmR/tAcCd4KO+bSuyrvpcIiGUGGwMwO1ZrWLFNd/eSmYjX4PHb7hG
         sX19Gg3RjLv7CqRNEeRSzaJZs2zxoFpx6n+edFEF3ZrRpyeQRbJ65YQaQ0OK9rOGEQ
         awllVz1yJTs//yRQ+/hvV5T+13l+ruxgdkPKk51qn2aotC60HAS3rZNBfPlXkU4u2S
         ToHg4fsoebmpjDjTvrBSAIfLAQ5mbpFv9iWVQDqTFrZyPVnfu0RXMiRNxj7iSa9fIv
         u43kcgxGEAEtl3O4zEeHdmEhuKEdDl0diel4JYNwue3FuwQCr91iOTZZuEIlbD7Kj2
         WaVSTDoPC8S0w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:15 +0200
Message-Id: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/5] gpio: tps65910: use regmap accessors
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use regmap accessors directly for register manipulation - removing one
layer of abstraction.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/gpio/gpio-tps65910.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 0c785b0fd161..0c0b445c75c0 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -28,7 +28,7 @@ static int tps65910_gpio_get(struct gpio_chip *gc, unsigned offset)
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 	unsigned int val;
 
-	tps65910_reg_read(tps65910, TPS65910_GPIO0 + offset, &val);
+	regmap_read(tps65910->regmap, TPS65910_GPIO0 + offset, &val);
 
 	if (val & GPIO_STS_MASK)
 		return 1;
@@ -43,10 +43,10 @@ static void tps65910_gpio_set(struct gpio_chip *gc, unsigned offset,
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
 	if (value)
-		tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
+		regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
 						GPIO_SET_MASK);
 	else
-		tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
+		regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
 						GPIO_SET_MASK);
 }
 
@@ -59,7 +59,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 	/* Set the initial value */
 	tps65910_gpio_set(gc, offset, value);
 
-	return tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
+	return regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
 						GPIO_CFG_MASK);
 }
 
@@ -68,7 +68,7 @@ static int tps65910_gpio_input(struct gpio_chip *gc, unsigned offset)
 	struct tps65910_gpio *tps65910_gpio = gpiochip_get_data(gc);
 	struct tps65910 *tps65910 = tps65910_gpio->tps65910;
 
-	return tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
+	return regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
 						GPIO_CFG_MASK);
 }
 
@@ -157,7 +157,7 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 		if (!pdata->en_gpio_sleep[i])
 			continue;
 
-		ret = tps65910_reg_set_bits(tps65910,
+		ret = regmap_set_bits(tps65910->regmap,
 			TPS65910_GPIO0 + i, GPIO_SLEEP_MASK);
 		if (ret < 0)
 			dev_warn(tps65910->dev,
-- 
2.20.1

