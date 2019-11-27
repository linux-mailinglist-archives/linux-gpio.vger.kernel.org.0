Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A113910B053
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 14:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfK0NfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 08:35:25 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54990 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfK0NfY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 08:35:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so7101608wmj.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMGWdghs7WZhxPpptxQGrZdPfirAzMk9gNZC1ILuwUo=;
        b=zufUBsJmnKFAgWNU55JroU36UiAZtzn5inpDMPCItaMQMgP1jXvY45bkDH9oJzp4Uf
         Q9wy54HQxm+xwcUJQ+pu0HrvnlahGLmUobv1C3MJZujIwX6g5yigboxCM6PnAG+LiW+M
         k8n5nwEFhLeHvHQIgkguYxI3tyPb79O3skASJ+Ht4gscaTuonaRyjEuWAOISKeX20HLx
         5zzbtWlDY6TqBBOzMXPq1QZhP6gGaG+VKqZ+NFv8rEEAMREmPe6rX/zoL5z6YO0dEfuk
         6XPBhUWWxfNmAW4wIOHLrfgaubQOQwpOziG/Zd14/vIUi8LBc8d8SpYOF7aZqr/UpSiG
         3akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMGWdghs7WZhxPpptxQGrZdPfirAzMk9gNZC1ILuwUo=;
        b=Gi/N+PONGqZZKvpyr+B3DVq4gTRB4N7TYw2qp+9nIjyI5n5rNVOUHND7zkMbVcOht7
         mpBHHyb253dUXqrHNKl26gtm/fi8VSVxjuxEqZtda7xpqnBLlZUkdgsQt6rV21zVvoLy
         fUehm/1usPOeUVXjZfsYZGiO10J3JYNn79F2CLcwALi+f3Rw+gwAQENGPVHRGV3J17wH
         7TDwHSAwsnp7OBkI/f1lwG0rng333b8/T0ExKAw91MjWcJJB1gj4BvojAQu9sJEpMjBK
         zjmZRaoSh4kdAicUHUJ0tPH5fkYuSU86bON0Lj7MzyfqUBvsvx7wmE43JdSekgQuejtu
         1Iuw==
X-Gm-Message-State: APjAAAVxJgV3cT9zZHldacDnf/e3Q5aro06jQ+PhoO7tBL/avUCaVK/X
        5SwVFKQtehFq4sbjaXV1mPZ2lg==
X-Google-Smtp-Source: APXvYqxyVgDbg/QQsqwSOz+dkHv/xHkBjG0vMayFRkDCiatdPitUxQ1agp0E6/MyQR1tCEeoSgAJTg==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr4315729wme.168.1574861722096;
        Wed, 27 Nov 2019 05:35:22 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id k18sm19663687wrm.82.2019.11.27.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 05:35:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/8] gpiolib: have a single place of calling set_config()
Date:   Wed, 27 Nov 2019 14:35:04 +0100
Message-Id: <20191127133510.10614-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191127133510.10614-1-brgl@bgdev.pl>
References: <20191127133510.10614-1-brgl@bgdev.pl>
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

