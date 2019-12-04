Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290B9112F61
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbfLDP7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32948 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbfLDP7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:21 -0500
Received: by mail-wm1-f66.google.com with SMTP id y23so5175244wma.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMGWdghs7WZhxPpptxQGrZdPfirAzMk9gNZC1ILuwUo=;
        b=S/O8YBZSycJTpuK10zc7KAvf+7aQqZEnGPXRzEEiiuUw5Wzr52xZY/r78S32x546zu
         gyD2vxX9IXv0QpI7uHztbp7HdiWF2hrw41GsPU9TsPtKAfqo/MsQP3HPFtUC7YijfsGI
         3JnrAGd2oOD5hl9rvSB6cftgCIedWRloaiv0yXh7uAn8xul6jzbQn+AB49M4bwHFcQ+a
         wn11gb5YpmliAQLjZMEYwwe9HeNLYBRFDQzh+PRzty6DKIizeZGSKGOhqwNqnqHpD7di
         0jkihd7k2DeAF9ozyyQeYeRBPCjIvmt9+FSiUdc5fXArTgaGhjtyKKCA2oqQmhwXBcgW
         G3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMGWdghs7WZhxPpptxQGrZdPfirAzMk9gNZC1ILuwUo=;
        b=YvpkudCgnYT9lN3tEVIntw5nPu0awh3KDzXGIKt8tRJVw7Rh+1c+Lwi1qhmQMhkVyc
         8k4gt0sqYMRFR+UpgYKnh4M74DCWMdL0ZMCm7Ou4Thd0sBZj5dEqfRH9h79H/s8dBMPj
         9mGQ4721BSPp0iULouy++vJ56Wl+Q8aSZuEQi/qSSet6qd4oqYvm9tWcrRgdAmf7ovgY
         m3DyT0eFo/tC4RGUszT3nZhPWWVnsYnlSwGoMeMgJABDjgHy/PtUnZ272Mo4N0Zhz4em
         l+svyII52WpNSNiyKntqywnsDtSQuj+QZ4shwJkgZWAp3h0oRZn5ImwIn699GTuAhbYZ
         m8ng==
X-Gm-Message-State: APjAAAXnPD7RTe8UrZkYek3wrwtYFMo7xvchZMUXsnKUsjf9yVHPmt0G
        KDNwXEFGzPDgy7LlicLFxSy6KQ==
X-Google-Smtp-Source: APXvYqy2aG07PCeTt9lhhbHZJTbfVLQo5zbfEX+vCJcSWPicgFnX+mDn6emK2yNDyTl0uoIYiyytsA==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr297179wml.65.1575475159138;
        Wed, 04 Dec 2019 07:59:19 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 02/11] gpiolib: have a single place of calling set_config()
Date:   Wed,  4 Dec 2019 16:59:05 +0100
Message-Id: <20191204155912.17590-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
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

