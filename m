Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E19A2AD660
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730440AbgKJMeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730590AbgKJMeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:21 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D250DC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:20 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so11677204wrx.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04nNj5LK2/YZLv34AtypYRT6HlwvaUsGIFSAj9J9huY=;
        b=c3a9ObergxdW1PKEVesE0CCnoI81mecuzMs5ZIhAPnxAcZxUKYPJgCuKSvksurlVZr
         Pbf0wKpARbeb796vJ5TPfNxuqmt+ksD7n480/by/N2kyVqrY8vDJlamjQaCszoml5kKe
         kmbs7DJGBBIpfVxqcqt9SeHcpGvL3txTUCsw/5XhmudlqDFrCAXFSBlTHTAjeW/AdJm1
         7l5nfGBzXxdkjxevCqMgLdRLNfpRrUD4DRX4dX0Wn1lzRcREKMxMQDrojxHBtATgzuDq
         51/YJz0D1C1qPIM8o5PSciCd+EZSADbkmQ4Qw57YvPiIovrhQfOVvz5jGkQeAmZQki0t
         6BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04nNj5LK2/YZLv34AtypYRT6HlwvaUsGIFSAj9J9huY=;
        b=jVM8kltHmhAVN+pXexZyromC/95t/FTNR5jxNKA+HXWz47nTAtVzrUdUAlabREdhWg
         fUQMFwokSMd83FkFGzYPyC2rFqSpgJS92c037WCScCWUJuqrKgFJUbqPdGxcLjibBaj4
         uPsUoFm7sgkrK/gvbD0LtQlBJdn+xWpYbSzD+ef/7S1Frnu4TSG9NsBt/tqBok/YPatN
         krk7DdMVm8b4r4gO79btYRDr3w+OYp+bhj9jDOVXAOgM/yZidGSra59o9ULE4odw3HXR
         qlwAMD7WjhkI2jbzadeDAo/6E+OLCAzpPAU7yzTr5FO4NcL2iQHxcLmHxbaEci7e9h7A
         RQJg==
X-Gm-Message-State: AOAM533S2xC9c49TVP5LwyUIS0mWzCnX+Ew6CbETd6BcUbsKcqLzZQ3+
        z8Ov/y+HIc1IR3qyvh2RJmo5ZQ==
X-Google-Smtp-Source: ABdhPJyQ9jNasyUEewftwtxD+n2YAFcUMg58Vh0T5FU7ZHVAGEW+PJJmuzt7HxlruYmEk55yFreGNA==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr18282823wrn.283.1605011659668;
        Tue, 10 Nov 2020 04:34:19 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 7/7] gpio: exar: use devm action for freeing the IDA and drop remove()
Date:   Tue, 10 Nov 2020 13:34:06 +0100
Message-Id: <20201110123406.3261-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110123406.3261-1-brgl@bgdev.pl>
References: <20201110123406.3261-1-brgl@bgdev.pl>
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
index a2d324c513f8..ae3ead033de4 100644
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
 	.reg_bits	= 8,
@@ -158,6 +165,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (index < 0)
 		return index;
 
+	ret = devm_add_action_or_reset(dev, exar_devm_ida_free, exar_gpio);
+	if (ret)
+		return ret;
+
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
 	exar_gpio->gpio_chip.parent = dev;
@@ -174,29 +185,15 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
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

