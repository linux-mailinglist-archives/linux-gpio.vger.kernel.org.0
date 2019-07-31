Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95567D15F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 00:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfGaWmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 18:42:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32977 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbfGaWmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 18:42:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so48742063lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssponi8HFghnoIL2FD87rDXrsR8CDf6ns5qoDwZ/ELA=;
        b=m6MjpgSKUn4CX7tquDk3cuP97sYkSjQEaxRtS0He/0ahxlj/SpRCRz/CoOU2Cbh2xn
         W6P16tYTC2Q4jdlK5+YJY2UJQ1OKVvh/P4JSd3VybD3eXP68y0vJ14/2WjZZxsNz7dTd
         CGifXklsMSD5Q7EXAYeZqVIG67I18CgwwSvtjNxiEzlbOaK49UnjabjjD4QZCPVpQRU9
         aMeVO0yDtEkvw9rYWI/yAvk05PwqjVmxMZs/g31OcjxZe+KKrwYvFZLekgeQzbGOs6aa
         DpKAxxdteO+Rc8eQyit3RG90XRmuHgENlOnFJNslP8em0OHayfsfJRcM/cb34W0xzAK6
         o3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssponi8HFghnoIL2FD87rDXrsR8CDf6ns5qoDwZ/ELA=;
        b=PQdPL0hMqDUagQ2Le9dZUQWzWJCVeieYZ2eleV9eO9hDpF+A5WLK/6ckhZW96Hadzl
         8QKMep/w7t8bVpfkFhasPlDhvX+ymH0OVztNzohir2P37bEMMoUuurZ4Le8THFn9VqQU
         qMoKoLHrcPNrOZ9BIvjxyhOumqHRlvOBQIubLpI9ANdTVjw/yzLFFZx9PxdlSSMni1pE
         Xsjlqp02fC2NINEnvVPlSMvEdMbobitfnOtXyOfqw567VWmvRwevsQwl9QSn+TFRdilZ
         h2H437MjO/6zmm7JnIPpMhcwqhWnsOHQFRTGG9WD80niNi3enS2aPMvYShcz/nsE4neR
         jO2w==
X-Gm-Message-State: APjAAAVmvUwzQRZHWcP7Vu/083Kz/Lr0mb1/712hTMv76NANYyAneTLJ
        FX4kChDwht8EcvVyat/Fv/bWNou9L48=
X-Google-Smtp-Source: APXvYqzDR4sR+rQtHfQH2U63lDEu7guJc9Qfr+UpVuEQJ2GQmLKQnx1nTDXh3dgl2evcCb3rHPN+Hg==
X-Received: by 2002:ac2:414d:: with SMTP id c13mr8411385lfi.47.1564612934013;
        Wed, 31 Jul 2019 15:42:14 -0700 (PDT)
Received: from genomnajs.lan (94-137-108-110.customers.ownit.se. [94.137.108.110])
        by smtp.gmail.com with ESMTPSA id p76sm14189708ljb.49.2019.07.31.15.42.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 15:42:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: of: Fix hard-assigned valid_mask for OF case
Date:   Thu,  1 Aug 2019 00:42:08 +0200
Message-Id: <20190731224208.30429-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

The recent refactoring to break out OF code to its own file
contained a bug by yours truly letting the need_valid_mask
be overridden by the need of the device tree range check,
and if there were no ranges, but device tree was active
and the reserved GPIO used in another way, things likely
crash.

Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Reported-by: Mark Brown <broonie@kernel.org>
Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 drivers/gpio/gpiolib-of.h | 4 ++--
 drivers/gpio/gpiolib.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b10d04dd9296..e39b4290b80c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -87,7 +87,7 @@ static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
  * @dev: the device for the GPIO provider
  * @return: true if the valid mask needs to be set
  */
-bool of_gpio_need_valid_mask(struct gpio_chip *gc)
+bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 {
 	int size;
 	struct device_node *np = gc->of_node;
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 34954921d96e..454d1658ee2d 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -16,7 +16,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 int of_gpio_get_count(struct device *dev, const char *con_id);
-bool of_gpio_need_valid_mask(struct gpio_chip *gc);
+bool of_gpio_need_valid_mask(const struct gpio_chip *gc);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device *dev,
 					     const char *con_id,
@@ -36,7 +36,7 @@ static inline int of_gpio_get_count(struct device *dev, const char *con_id)
 {
 	return 0;
 }
-static inline bool of_gpio_need_valid_mask(struct gpio_chip *gc)
+static inline bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 {
 	return false;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f83870a18ae7..20f13129cdaa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -363,8 +363,8 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 
 static int gpiochip_alloc_valid_mask(struct gpio_chip *gc)
 {
-	if (IS_ENABLED(CONFIG_OF_GPIO))
-		gc->need_valid_mask = of_gpio_need_valid_mask(gc);
+	if (of_gpio_need_valid_mask(gc))
+		gc->need_valid_mask = true;
 	if (!gc->need_valid_mask)
 		return 0;
 
-- 
2.21.0

