Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8567A1267CE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfLSRPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38120 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbfLSRPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id u2so6446088wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=evGr6fE++6g6GFFfppzZpmdFKXc03gQbrsBnrRpXkt4=;
        b=fJGiH31Vt13rJnJqTXwPwU+EtINEb85MW7y7grTb0ZaBou/agTnZVxjXD2Cypieuxu
         LJ/eLk+xT+uYj1+JMTShUVFgXKOYPzx7PvysYSqC2NMnQTBRmkODTp3536+Cas6F385z
         akTEC/muN+Ftaw2mIcXd7wRET1KlWQJ4RunrYHpyGMBNsRTnbLTYzbnidXQrJJIfWsVx
         ppN9h5wYG4eKW3kA1Ecx37f6ggPWqdhbD6W8rLoejke5CaXxjP318dSfH+KSsmD8+HoD
         jDcbsG9Adnhi9Ofr3bkZyek/WiqGrXI39CnMFqtM4jZpZYAK+nhqzz0lzvKcSuiqoCop
         mf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=evGr6fE++6g6GFFfppzZpmdFKXc03gQbrsBnrRpXkt4=;
        b=pXcZfrvud33WuFwHRx5kdO4UwfuzAPbK9DTimz2TzVl9I2h69Y2Le4rXsWHBNwMCoC
         rmFuYLYKmWkBHkyBPLOu0uoetQABnMmqV2O4rtVWYO7Sc2J+2LCg2C6xNI+wlQmRO/vE
         JiYs1EzVgH8p9fAmpeZqiSVoFUA3wYEWr6hg43i0E44nJL30tPQYUXoe6DaSvgfDN/Dq
         yabeYRHXlqtQ8A4QcK5wMS/8Vv/kD18VctiQsDDECrxt1+T32yrNKUwtzmKB/ePA1nP0
         qK6RKDAoA+V++Tm2wF3K2eAbCSfapvRUR8JCb6vDMPhu4K0G0csSXNas0+R1ucaXkm+F
         mNGQ==
X-Gm-Message-State: APjAAAV7+CLey5JT8ohFZMHyynRUgK8ecwYUC5pGgiyoO6rvO2G+jjRA
        SBJhVUPCrmuobvlPoC90BkjJLQ==
X-Google-Smtp-Source: APXvYqxS6MMzWyPCAcmckrozGtdlIRco9JhBrCYeknCV2Mx6N+bMCxx10LvlimrWqswtG2UTKJaozw==
X-Received: by 2002:a05:600c:2148:: with SMTP id v8mr11810672wml.111.1576775737398;
        Thu, 19 Dec 2019 09:15:37 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 02/13] gpiolib: have a single place of calling set_config()
Date:   Thu, 19 Dec 2019 18:15:17 +0100
Message-Id: <20191219171528.6348-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of calling the gpiochip's set_config() callback directly and
checking its existence every time - just add a new routine that performs
this check internally. Call it in gpio_set_config() and
gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
the check for chip->set() as it's irrelevant to this config option.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a31797fe78fa..72211407469f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3042,6 +3042,15 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
+static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
+			      enum pin_config_param mode)
+{
+	if (!gc->set_config)
+		return -ENOTSUPP;
+
+	return gc->set_config(gc, offset, mode);
+}
+
 static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			   enum pin_config_param mode)
 {
@@ -3060,7 +3069,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	}
 
 	config = PIN_CONF_PACKED(mode, arg);
-	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
+	return gpio_do_set_config(gc, offset, mode);
 }
 
 static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
@@ -3294,15 +3303,9 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 
 	VALIDATE_DESC(desc);
 	chip = desc->gdev->chip;
-	if (!chip->set || !chip->set_config) {
-		gpiod_dbg(desc,
-			  "%s: missing set() or set_config() operations\n",
-			  __func__);
-		return -ENOTSUPP;
-	}
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
-	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
@@ -3339,7 +3342,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
 					  !transitory);
 	gpio = gpio_chip_hwgpio(desc);
-	rc = chip->set_config(chip, gpio, packed);
+	rc = gpio_do_set_config(chip, gpio, packed);
 	if (rc == -ENOTSUPP) {
 		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
 				gpio);
-- 
2.23.0

