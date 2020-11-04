Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E742B2A6DEE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 20:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbgKDTbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 14:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731591AbgKDTbK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 14:31:10 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40535C0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 11:31:08 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id k10so21982518wrw.13
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uGxknteRFmc8uD8KRQwE2bQfaW1TLGwQ+1UoD3santI=;
        b=RaExq3uc7wgceJs+w6qfXW0zxCXfChfmuBZ5fIfJU3dTl+CuEheFyuWIDdpdwwWIe7
         YG1psmFGrf3PNz/aPHJie1v065Y19OUTUKIYruuL3qY0Fotesa7peV+y2WwxR3zSCDFS
         kYCA8MP2Juxj2G2N5j5DZMNFrn+mvrKsxQRGjV9A1RXoYoG8USzSTkFN+oG2UXEGVhKE
         1Nc337PRGnV/cahRPeQfGuAIEI48jAApXf3TUEMT3yFcZWSF88MTJgeWgdHYv2LvvmLS
         SHTU6/xVCA1r6lTp0COmmk16T4bLd3d4s6wy3zdwTKO9Iw4XauXHEsgx/QE1JC2WASGF
         l4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uGxknteRFmc8uD8KRQwE2bQfaW1TLGwQ+1UoD3santI=;
        b=eH6znXkGKM3/NfLICPfTMW6Tn9noMpa3Pr8JDM8RUCT3uNXzNZC2Ae0qvs5UYU2TWU
         ppdLomsDhP8s+56C6tGtzVS9HXfV6BYkbRtXPOcaF/xejyjax2jz9ZA8BV3ElqneEY24
         2mT03+MgaXaekMwo+aG0VNSHj8z8yC7FU9l83dmoWN6jmMuPOpl0AD7TBdFvzAzNRFR5
         uHFddq/cS+tbDO25pzXJeozVuwxOwslscMrqSZaeiS2aj6bkntBz2SeG/T845AK1uWcv
         P984mYQ+rjrLghQzlNR9mdodyvZsYT9kB5d1+ZHc3V3uJZqppm+xsqzddKJJbzo7asMG
         Y0yw==
X-Gm-Message-State: AOAM530z+uwtVlwTBqphrVXR41+Li6YmEj2c4ncA9Xl60vyA/d6pFpFa
        F7cuZZnxuqwbaNzFiRVNHASc/A==
X-Google-Smtp-Source: ABdhPJxNzRzC856EUc6D12iZqJpjACECxzwnA9OtvmVdnej2G06cWHMRMwspZChWQGhIav7w4CBkmw==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr18433798wrq.19.1604518266966;
        Wed, 04 Nov 2020 11:31:06 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m12sm4051671wrs.92.2020.11.04.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:31:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 8/8] gpio: exar: use devm action for freeing the IDA and drop remove()
Date:   Wed,  4 Nov 2020 20:30:51 +0100
Message-Id: <20201104193051.32236-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104193051.32236-1-brgl@bgdev.pl>
References: <20201104193051.32236-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the error path in probe() and drop remove() entirely if
we provide a devm action for freeing the device ID.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 94ef500567ef..b3372279188d 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -108,6 +108,13 @@ static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
 	return 0;
 }
 
+static void exar_devm_ida_free(void *data)
+{
+	struct exar_gpio_chip *exar_gpio = data;
+
+	ida_free(&ida_index, exar_gpio->index);
+}
+
 static const struct regmap_config exar_regmap_config = {
 	.name		= "exar-gpio",
 	.reg_bits	= 8,
@@ -155,6 +162,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (index < 0)
 		return index;
 
+	ret = devm_add_action_or_reset(dev, exar_devm_ida_free, exar_gpio);
+	if (ret)
+		return ret;
+
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
 	exar_gpio->gpio_chip.parent = dev;
@@ -171,29 +182,15 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 	ret = devm_gpiochip_add_data(dev, &exar_gpio->gpio_chip, exar_gpio);
 	if (ret)
-		goto err_destroy;
+		return ret;
 
 	platform_set_drvdata(pdev, exar_gpio);
 
-	return 0;
-
-err_destroy:
-	ida_free(&ida_index, index);
-	return ret;
-}
-
-static int gpio_exar_remove(struct platform_device *pdev)
-{
-	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
-
-	ida_free(&ida_index, exar_gpio->index);
-
 	return 0;
 }
 
 static struct platform_driver gpio_exar_driver = {
 	.probe	= gpio_exar_probe,
-	.remove	= gpio_exar_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 	},
-- 
2.29.1

