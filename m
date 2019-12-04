Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC57E112F1D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 16:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfLDP7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:23 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34408 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbfLDP7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:22 -0500
Received: by mail-wm1-f67.google.com with SMTP id f4so5163314wmj.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2P46jLQH53L0bSs7wrWGmrID6nlk6qTfagoHAkQM3lw=;
        b=B32Qb469tJrUvZwxSz+ciTPGZSLALv4cnX8nNY+HzhvzW0q7h+Swub3sIFplbjTfDX
         94FApbkAPC0h2aTaIivPXrhTdCn9J4+Zg4FZ8v4ykMIbXA43JlIZyW+NZh85tOO28/oC
         zkgtv5DErDQW4ABnU9P7bqVQslSaYxYrGCTWWJtpTzRz2i46dIVXut9E5XXDKL/mFR49
         2y0HXQ2zJMacf+2uEmIN9DZjwKHj7Yik3VkfDao/3sGs+8g6Wv7tGDIDNFEYSRryIgU6
         yhwD5+UTNAe36sgaOoufE3JFsmxebSYyB7wPxkkGPHbteFQdx1eKPzR/HJlp8BGiPSFJ
         H3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2P46jLQH53L0bSs7wrWGmrID6nlk6qTfagoHAkQM3lw=;
        b=HB8IZWgj9IYxfogQ/RCNHO04PiUOThU8k75gJrBYjGeg024hheiYx6Im40o+6fyEBD
         aO8NsHJK7+RPXNcaPy6ul+Y/Su4hydAdRILEVqxAC6a9qC4yFTeUrIaYjKH1mAM3TxV2
         Fs0/qki+spuWUfd0WvZoN5Kjs4+LAy0X8zeXjl4CQ6nYtZOkPqPferQ80z8PhZyolNBC
         ooSWlZjkNKYGTmc7mPEeOfTCv85XNW4N4NDEQpeml7OSzKcu0v3ckXx6XWt1q7NGfvqc
         EBqzXG3hXhlx8729TRgSjcWRuyJi8UPwVcb8PAy4hiGP8+817aWre1JHDOxFu+h3u+AE
         rq0g==
X-Gm-Message-State: APjAAAVX9gAEIzifId52sDd9H3uwNRwXrgdXxuTO6ZeKD3u13jT3k0+4
        KD8bbfTeHbQAQ37bqaIWY/MztQ==
X-Google-Smtp-Source: APXvYqxcnyVANW5BbUe14kf5FOQUIsuf/S8nNeBiuLjBJCSwpKbiIUIJW5ycBV758qAz1GFH6Oy7/w==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr250863wmj.121.1575475160462;
        Wed, 04 Dec 2019 07:59:20 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 03/11] gpiolib: convert the type of hwnum to unsigned int in gpiochip_get_desc()
Date:   Wed,  4 Dec 2019 16:59:06 +0100
Message-Id: <20191204155912.17590-4-brgl@bgdev.pl>
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

gpiochip_get_desc() takes a u16 hwnum, but it turns out most users don't
respect that and usually pass an unsigned int. Since implicit casting to
a smaller type is dangerous - let's change the type of hwnum to unsigned
int in gpiochip_get_desc() and in gpiochip_request_own_desc() where the
size of hwnum is not respected either and who's a user of the former.

This is safe as we then check the hwnum against the number of lines
before proceeding in gpiochip_get_desc().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c      | 5 +++--
 drivers/gpio/gpiolib.h      | 3 ++-
 include/linux/gpio/driver.h | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 72211407469f..b3ffb079e323 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -140,7 +140,7 @@ EXPORT_SYMBOL_GPL(gpio_to_desc);
  * in the given chip for the specified hardware number.
  */
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
-				    u16 hwnum)
+				    unsigned int hwnum)
 {
 	struct gpio_device *gdev = chip->gpiodev;
 
@@ -2990,7 +2990,8 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  * A pointer to the GPIO descriptor, or an ERR_PTR()-encoded negative error
  * code on failure.
  */
-struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
+struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
+					    unsigned int hwnum,
 					    const char *label,
 					    enum gpio_lookup_flags lflags,
 					    enum gpiod_flags dflags)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ca9bc1e4803c..a1cbeabadc69 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -78,7 +78,8 @@ struct gpio_array {
 	unsigned long		invert_mask[];
 };
 
-struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
+struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
+				    unsigned int hwnum);
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  unsigned int array_size,
 				  struct gpio_desc **desc_array,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e2480ef94c55..4f032de10bae 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -715,7 +715,8 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
 
 #endif /* CONFIG_PINCTRL */
 
-struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
+struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
+					    unsigned int hwnum,
 					    const char *label,
 					    enum gpio_lookup_flags lflags,
 					    enum gpiod_flags dflags);
-- 
2.23.0

