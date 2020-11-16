Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549F72B417E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgKPKnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgKPKm4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:56 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4224C061A04
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:54 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so23251524wml.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6hO2EdktD6tTwbP0hf9n6mHqN7h4IqXAlEVl1IexRM=;
        b=T+tUvkIF+iH4K8+P7U64YpgECCTYj+oVV2Ij3yc1MDvVMu+ziOO6jKj29VjW7Zf4UR
         BGkzB9TV+T8Xcu7p8oR2x2ePl/BzA8jQs6t/cqXalSzA54H0t8+smAzDpF3XqeLGkhkV
         26uANPiz6+nqI0KfbuHTnqnGZRrsIJk7gSfik7PFY/WskKul9Ncz4pgNSohp69ulfP3P
         4mccSQTOVDm9DnRGvo2m+83H8OGR165kgHaVg/HCu38Nyk1qHbL4GnEGPsL3pTqWJFWE
         ILMUnR6idga7JubvwejWzkqB87KiqagNkMJsHnjbkbu7n/kTUGOhZ0ZgIqwX5DNVV3ij
         4CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6hO2EdktD6tTwbP0hf9n6mHqN7h4IqXAlEVl1IexRM=;
        b=sAJ+FQXQMIVpExSKalo4UnXeJjBISc7nOXCtD7zo0/k/Y4M98W4bWtWcRPc+NZ28Hz
         virVWI060/QLw6flux/baquLqzhjsSahIRRuhRo7ziGz9GY+wn7u0jKNrh1nBwRXLpR4
         9ZuxQNiS9lJAERiqTq+JJH0QoznLX5SbqwHegetDB/ag9AkV5TBqL+h1zFtavkYONB/W
         vNXAs8gBNwGU59Vor5J5G0rHpc72nj/x1v904mRMq3lESsv/dADZs/NXPCoJaqmQ57zA
         SGfHS2lyZgrnUgQ9C0h9RCVni8eZiT1IWQMPNfoIUOr0DAYGufRVkl9tN2T9m3PVtGsD
         Iy5w==
X-Gm-Message-State: AOAM531RTPI12aHF2TiSAzwmNSCgvuRA0bRnKmmr4S+5MxUKqBfUtjhe
        hKfr3uM3Au/kiNkrvcyqLTMzTg==
X-Google-Smtp-Source: ABdhPJw+poV12SjtIeBVrkrmoi0MFRcpkejjbt0VzAUy70UMCekqpQfFhC7AOmFs6L7Fjs1chqY9Ww==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr15545483wmh.106.1605523373631;
        Mon, 16 Nov 2020 02:42:53 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 7/7] gpio: exar: use devm action for freeing the IDA and drop remove()
Date:   Mon, 16 Nov 2020 11:42:42 +0100
Message-Id: <20201116104242.19907-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the error path in probe() and drop remove() entirely if
we provide a devm action for freeing the device ID.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-exar.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 79fb0964ace3..e4c1ac88d2ba 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -111,6 +111,13 @@ static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
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
 	/*
@@ -163,6 +170,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (index < 0)
 		return index;
 
+	ret = devm_add_action_or_reset(dev, exar_devm_ida_free, exar_gpio);
+	if (ret)
+		return ret;
+
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
 	exar_gpio->gpio_chip.parent = dev;
@@ -178,29 +189,15 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
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

