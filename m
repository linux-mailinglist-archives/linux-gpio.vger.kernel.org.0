Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3894412A106
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfLXMHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37429 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfLXMHW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:22 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so2352327wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XoYWPE8cyCMHdj/nC5g0vBWT64fDbt2xKGO150BvKJE=;
        b=K8mCWyyWCLNS2JnoK/AGCyxSZtkrW1Rp6x29+IppxniUnau8LH9Z6M3SgaQdl5Cqbj
         MFihbccaya8LqnzwnacVrH+SyX9FTDNzOVj2vnEJkQ+L/rEKsdNCrCA6dS8VFcVIfkwJ
         N0+BPSmMewJTU3bab57Y+XjAdJlHZnltXLga1ZbiZuegxG5a9DvIMDbFAF6saiD57goU
         UyeG4gswzE2ZGxJckpflhfYW6Pn2nhkiJ742LyleTRdclC6E3vWTBRK/EaBAuypAILcM
         HR+SkfF+jDGMZdu5A0FCxsx9n4WP9i7b5VHCU0Q930sJULU3wAPvMYvOnADkPY9gk430
         uZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XoYWPE8cyCMHdj/nC5g0vBWT64fDbt2xKGO150BvKJE=;
        b=grMMuzF9SigawxglaIy98zj4BJAunrL/EyXsgHZto2DDtD/nKLZ2DzjJy2Tr8BM3gP
         yFMLuatNC24MRrKJmys2FEbqYYgScSQenVezTzOryCibtblcLYdf7ZSerLE7F0HQughd
         7hsg7DiutM0/AtEhFRTS3DPkr+v/wY0oVJpEq5R/XWWT9EFz3drNqUaqGeWNL37JEBIB
         SMsjM1mV0A3DNbkrrHo+tskob0HRWvaq8mO2d9MVNCJGliyoH8jw/9DKTtKCk9KkAZGi
         A2Hs2b9+r3lnKAbBIuuU6SG+NuOvPFZGIka04fzWIHqff8nPeoF/ms6rcL7PNU84MLNe
         qUzA==
X-Gm-Message-State: APjAAAU5CQgYhh0xneR+kC826ON7HgHIW5Zz0iqBxzJDc3LCO3Pb1PrD
        TB7k8ekISPUqz7n9CPYUbeg6Sw==
X-Google-Smtp-Source: APXvYqzNM8OUTWA/AzUPTWMx6UFqShhsbdq1HeSyO54eRjTKTg9PIO6l1lLUUWJCX3YuPTch8wjV2A==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr4154098wmd.158.1577189240378;
        Tue, 24 Dec 2019 04:07:20 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 03/13] gpiolib: convert the type of hwnum to unsigned int in gpiochip_get_desc()
Date:   Tue, 24 Dec 2019 13:06:59 +0100
Message-Id: <20191224120709.18247-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
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
index 616e431039fc..68adbd2179a0 100644
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

