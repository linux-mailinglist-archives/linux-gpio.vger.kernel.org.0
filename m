Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64336227BDA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgGUJf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUJfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8119BC0619D8;
        Tue, 21 Jul 2020 02:35:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so20445107wrw.12;
        Tue, 21 Jul 2020 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rlfZOGrG0Y0g+jvfYXyQSQK2g13qrRx8rGSIeVgX6ck=;
        b=RTnMrToASJ8SSq+foC+yfYpXpCrjb/b2iWaLnfA94cKjgQAEfn6b3grnhH7uLNLk86
         4b8krhKft2HT3mIHSwvS0nUkZMndajX4R81dAsup+enEMOVcv7GFF9BNVSFnW1gjjGpv
         mpsfHwwrpx69LkvtFIajJ1zGX5GkPc0yKSrf5EIERCYKuz7bXLJwxxNXPumN96Letuu9
         UZeevIUN1WlI9GOa+YYWqPyqBDJjPGLIUe50EXLaYbezqtXWPCbg2sZrXMzL3kYsL8px
         Z/fgazAxGc9zUIVMUgTwYH4ywPgabUzvIG/ZI9S8YuUt6ohUjCbgRuD0qnr6OgnRVKHb
         jzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlfZOGrG0Y0g+jvfYXyQSQK2g13qrRx8rGSIeVgX6ck=;
        b=gg+E0QLAFpoFf/1VhyC2JHDz76WlR/hD5arz/j4VuAPVNfDi6rQKNehAtI8OPrKOhI
         Pjii5/ByZgo/Mseob6egOFBxpTNPfU60+B5x+YaZBGvSUIW+TzAxat5q4J6QqeOQqn4s
         aGMVDgRLBo2YLGHAmVbUadNa9Tk1uywcFIgT0aykie68GUy+OjOSNRDLFbUoMyAuXySt
         QJ3rHZVGkEZlXv9mebZPbq4uuLJjgXN3Wx8Xrxr84CxVfzsScCW4UXivpa2uQ7Lfa5J/
         T6+ltAsL8ch6LVdlKvimepJjNju14Clyuq9IrXc3McWWxvAYF1PgE/Wu/KjsmPZ8iiI9
         XbYw==
X-Gm-Message-State: AOAM5306bYyBwu1vZ0k0U4EU6xOVVn8Yfn0zv3cHGkmF26Vb5ETv3fiL
        Gxx94n6b/cFFb9/jgtlki80=
X-Google-Smtp-Source: ABdhPJx22BZ6n4kitvTRKQRXnwykuYiF0WVTdv7k3VOS5x6WTousSMYo9V7AOHGWQbRghEUHhU1seg==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr27321548wrw.16.1595324154292;
        Tue, 21 Jul 2020 02:35:54 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id u20sm2649645wmm.15.2020.07.21.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:53 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 6/7] gpio: fixed coding style issues in gpio-pch.c
Date:   Tue, 21 Jul 2020 11:35:21 +0200
Message-Id: <20200721093522.2309530-6-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
References: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-pch.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index e96d28bf43b4..039822978eaf 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -95,7 +95,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -112,14 +112,14 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
-static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
 	return !!(ioread32(&chip->reg->pi) & BIT(nr));
 }
 
-static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				     int val)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -146,7 +146,7 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
@@ -196,9 +196,10 @@ static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 		iowrite32(chip->pch_gpio_reg.gpio_use_sel_reg, &chip->reg->gpio_use_sel);
 }
 
-static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct pch_gpio *chip = gpiochip_get_data(gpio);
+
 	return chip->irq_base + offset;
 }
 
-- 
2.28.0.rc0

