Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082BA1267DE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfLSRQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:16:25 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55624 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbfLSRPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:40 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so6241739wmj.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XhiSom0iVO5AHRS5ZUjMyBcC2AAQ3b6I6WYo2HMzPrk=;
        b=SWPQN6U52q64ZPmqFofySJ402F+H0ckaDHl99RXhe/e2LryuutBlW6t+dABXiDAhFe
         QJPJx/w5IjIIhfP2oEGkB//h2+TWYEcLNBOcOUOU4Jz12ml54NanVvwcsNHLXITUzMSP
         m049gzgohL4S579+RX136l3jd/9UwjBewrdlLOn/o+KbFwasTlukpH8xERZoXQPcuQ6+
         +TU7TF53TVQ03wpSSJf08n0PkvV1p9/qUOddg4uvymTXTKis3AD256c5VBlKFD63KmHS
         d8Qnhh5rWpQmmbT5rzyFfi4tC2eYLR5PbIosb+0q3JzVknLsdcU8WE9KlqxhhfWFkU0E
         Pe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XhiSom0iVO5AHRS5ZUjMyBcC2AAQ3b6I6WYo2HMzPrk=;
        b=BKVP5H2w5mBG8yEXO6gkme0McKFrpC4kpZ8KBNgKBSL7HMmCZ+cJCHpEmqV6nf4/oh
         lPBxats4QZWTdp2BSqZXYqwzNi1fCSzrULhPNNy1W1F3onmwKleFo+ZBeEZcGa1jpbKJ
         Axl7oJDm17xIAR2e8RkwDxbRGHW/OdxuCvQU31cTnveyJK9TU3pmyXaICnaLpFm94/mX
         lukwCDp+yWMZNFEFf/ZkvyCUOeru/4dsahhWcYHKe+mfhFFM9QGKW8FHviXk1ehB4rdx
         XqP4wUtUB+dmvinrpD5Fk/pM2XSNSKHdPSM/RSRMkCtjH+md6YUU4jSbReloXtftN/LG
         Sb5A==
X-Gm-Message-State: APjAAAWbeQUpOajH8XWZCGM5cJ2YBc1zSCidovzmVIWlIUHqefDihYsW
        KGT6Y8II4JbUCkbtJPzCnlLgKg==
X-Google-Smtp-Source: APXvYqwE6tJDR5YKpKGyKSmR7DJqhpeUc9tFwjGGXDRfmjIokbxHVco+zkNTNvsbYfDHAgfdyiDTwA==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr11302607wml.50.1576775738540;
        Thu, 19 Dec 2019 09:15:38 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 03/13] gpiolib: convert the type of hwnum to unsigned int in gpiochip_get_desc()
Date:   Thu, 19 Dec 2019 18:15:18 +0100
Message-Id: <20191219171528.6348-4-brgl@bgdev.pl>
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

gpiochip_get_desc() takes a u16 hwnum, but it turns out most users don't
respect that and usually pass an unsigned int. Since implicit casting to
a smaller type is dangerous - let's change the type of hwnum to unsigned
int in gpiochip_get_desc() and in gpiochip_request_own_desc() where the
size of hwnum is not respected either and who's a user of the former.

This is safe as we then check the hwnum against the number of lines
before proceeding in gpiochip_get_desc().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

