Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CD92282C6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgGUOvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgGUOvV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:51:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655AFC061794;
        Tue, 21 Jul 2020 07:51:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a15so6550788wrh.10;
        Tue, 21 Jul 2020 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLetgTP+byzG0hz1MYveDCv+naBucl5L+Ob1+pRS+AE=;
        b=kKfHVkiMHl9E34iwRmmKxT4BJolMKt0gBTtLc9ORzYsIPszXJwz99GQ8au2/5tUYuM
         2zWsg2xaxCOCI9jLq+VO3xlz9CGPUHPEnCATTYrzXzS6JUuyFA/v2jmFEBmYRfJls6yY
         Gzy3nwmkqOas74wPMJh8EBKmzPPi/PBn4F5iiXdAjm0xYDXladgkHbSZTasCi6GjKYti
         X7+93OnuCAVng2ZoQ2YjbnI2h+rJ/Xx5kLnXuyE6/Uj3GizyL1x+wCOoex5CKQHiMRCj
         vOd1909KsNQOGBPdtbgHGY5HuUAIBtM6jivDk0FupU0o1SL24XMRiU3CW5fxQBbkJpOX
         6dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLetgTP+byzG0hz1MYveDCv+naBucl5L+Ob1+pRS+AE=;
        b=QJ2C8kS7QRlnWMyfAz9hNspvwPK1hwKBASBojtpaHpkh0O994hIsyKnDQLzKmLUM3i
         /GRLpvZydMFIHDGJRN8Qwldk3sD8TGQKyKbvZgg0LG671T45NJilb6hcFXgjamEUUchs
         74Hbtd0ejIDydMdnqrWVtTY9eznOEzn2lbYKTwtH5kNHYGxYuTtvc2RCnQUowC7b8Bgi
         Gd6vMknZF39euSeIZBMYupRgjqkGvABefp1KwgsTnY6mVq0nMbwrzJdbxWCxqsbPmwa/
         mnsGKj2SSAgpJnyF0QeuSAmazzMynWl4usUzt2pVYiWaL1InNd0sowde9vXWpHeHjWnY
         CRZQ==
X-Gm-Message-State: AOAM533oW6tVxMx/xrGhKBy/tj3qbYYv5MHnZoPM7/BuhxLIB0HMyMC3
        ZxjbYNtMGMeoP8qf4loOjOk=
X-Google-Smtp-Source: ABdhPJz4TGhzUwaNjADcYcPw1WNtr7tJs8iuJFoWqCSqQK+TSRkoHw3oS/zrEU4Dm0EekPldoOImUQ==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr25518085wrm.327.1595343080157;
        Tue, 21 Jul 2020 07:51:20 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id g145sm4965801wmg.23.2020.07.21.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:51:19 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/2] gpio: gpio-sch.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:51:03 +0200
Message-Id: <20200721145104.776561-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed 'unsigned' to 'unsigned int'.
This makes the code more uniform, and compliant with the kernel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-sch.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index c65f35b68202..d7cade67717b 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -26,10 +26,10 @@ struct sch_gpio {
 	unsigned short resume_base;
 };
 
-static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
-				unsigned reg)
+static unsigned int sch_gpio_offset(struct sch_gpio *sch, unsigned int gpio,
+				unsigned int reg)
 {
-	unsigned base = 0;
+	unsigned int base = 0;
 
 	if (gpio >= sch->resume_base) {
 		gpio -= sch->resume_base;
@@ -39,14 +39,14 @@ static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
 	return base + reg + gpio / 8;
 }
 
-static unsigned sch_gpio_bit(struct sch_gpio *sch, unsigned gpio)
+static unsigned int sch_gpio_bit(struct sch_gpio *sch, unsigned int gpio)
 {
 	if (gpio >= sch->resume_base)
 		gpio -= sch->resume_base;
 	return gpio % 8;
 }
 
-static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
+static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned int gpio, unsigned int reg)
 {
 	unsigned short offset, bit;
 	u8 reg_val;
@@ -59,7 +59,7 @@ static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
 	return reg_val;
 }
 
-static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
+static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned int gpio, unsigned int reg,
 			     int val)
 {
 	unsigned short offset, bit;
@@ -76,7 +76,7 @@ static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
 		outb((reg_val & ~BIT(bit)), sch->iobase + offset);
 }
 
-static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -86,13 +86,13 @@ static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
 	return 0;
 }
 
-static int sch_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
+static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -101,7 +101,7 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
 	spin_unlock(&sch->lock);
 }
 
-static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
+static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 				  int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
@@ -123,7 +123,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
 	return 0;
 }
 
-static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
-- 
2.28.0.rc0

