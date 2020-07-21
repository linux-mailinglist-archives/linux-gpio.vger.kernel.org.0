Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC2E2282A7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgGUOtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgGUOtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:49:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC87C061794;
        Tue, 21 Jul 2020 07:49:01 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r12so21392636wrj.13;
        Tue, 21 Jul 2020 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+pE6uiTJ1C0JVouBek0uqwgJYfQMdTo9JdA9XmFS1Q4=;
        b=WNyQcFYG/XUeDDvodl8bxADLmshHknnE/75uqH/6pUNGLI7qBrUvLDy3+5wn/VQzOh
         kpVsdkjhH1n+61oXrYCox5PeisUHY0XEvlcYFZWspL+0MoMXCnEIK6TQsX1d7dS48p1k
         o7MGqEti3iNLgN6d9YU7ncvvG4vVZUuoxayhNvqCMBlpoZNZTbKGeEIfLu5GSO64C9iv
         0ppl4ZjUHV6ztVpdP+VC2Fr/UbhAlAns9VNlNDomzPPZyOPdW7524GyayyiIgQeOhHQr
         HlNkkWD97NoDBUxHq0sZgZKE92AZ3xrQgYJXZMOAtRZlLJ9DMTY+qQ9+GYr5mfCV7v/7
         7NIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+pE6uiTJ1C0JVouBek0uqwgJYfQMdTo9JdA9XmFS1Q4=;
        b=Y5Flnhk+qAL3tNqnO1SDfsXXrraYHUiDNDYzEMNjBRhwe+mbIcT5nHesnJapzd7irz
         yDd9fpFOhcZABYUOM115I/rQ1ptIJbDXkLXEmlqzKbEm3lGmgt8ewcJhLgPVR9qUioh1
         niFt2ikno8SLz22oz4wdFGCJ4t3cu4PGJf0PX7/TArQNc69oAULuUhfM+5pQmj4UqYOX
         NFo8Mb2JGd13+b2auBinamoFxS21IhluU2k0Qcb1jm92n/IMQkLGquCSIuV8zGFUhDuw
         7BYVryOwBU5O90FFmfWF2OqRa7/lFdySNT3VLxy0eJq2Q3SLmrPcpS0S6BSsXB5wg9pR
         v/Qg==
X-Gm-Message-State: AOAM530bgYZHYWRPUnpY5txLkk5iRhu0abawhPi1j1VnIrx7Vz065Gbr
        oFd1IG5X6bPJUNveAL/aVO8=
X-Google-Smtp-Source: ABdhPJx2AA7nJHmeOGPCzlOUzlog5UVjvCqfOojB1+eK84kvO2+ObN2z7U5jd7/BSEvzvO8gvpr78g==
X-Received: by 2002:adf:f247:: with SMTP id b7mr11721620wrp.128.1595342940420;
        Tue, 21 Jul 2020 07:49:00 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id f9sm38006091wru.47.2020.07.21.07.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:48:59 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] gpio: gpio-crystalcove.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:48:32 +0200
Message-Id: <20200721144832.750728-1-abanoubsameh@protonmail.com>
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
 drivers/gpio/gpio-crystalcove.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 14d1f4c933b6..9391722ec107 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -129,7 +129,7 @@ static void crystalcove_update_irq_ctrl(struct crystalcove_gpio *cg, int gpio)
 	regmap_update_bits(cg->regmap, reg, CTLI_INTCNT_BE, cg->intcnt_value);
 }
 
-static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
+static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
@@ -140,7 +140,7 @@ static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned gpio)
 	return regmap_write(cg->regmap, reg, CTLO_INPUT_SET);
 }
 
-static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
+static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
 				    int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
@@ -152,7 +152,7 @@ static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned gpio,
 	return regmap_write(cg->regmap, reg, CTLO_OUTPUT_SET | value);
 }
 
-static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
+static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	unsigned int val;
@@ -169,7 +169,7 @@ static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned gpio)
 }
 
 static void crystalcove_gpio_set(struct gpio_chip *chip,
-				 unsigned gpio, int value)
+				 unsigned int gpio, int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
@@ -183,7 +183,7 @@ static void crystalcove_gpio_set(struct gpio_chip *chip,
 		regmap_update_bits(cg->regmap, reg, 1, 0);
 }
 
-static int crystalcove_irq_type(struct irq_data *data, unsigned type)
+static int crystalcove_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct crystalcove_gpio *cg =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-- 
2.28.0.rc0

