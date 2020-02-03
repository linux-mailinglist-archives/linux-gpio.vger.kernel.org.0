Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFA915073A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 14:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgBCNae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 08:30:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43539 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgBCNae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 08:30:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id z9so5918599wrs.10
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2020 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1f5bwMzVaB6wRo16QwdapcC/oluekqbfNJd6d0tVIEc=;
        b=hHjJni+TEKfxWEycbKNRTiT691geYQs4q46qUwNY1c6FnG6Rh757MTHBwgCgbC45/h
         EFR1bWidEOjlaPcGxP/Nf+/yp1DNqAhsj8Dxkch2EiAuZ3jXG+jPuS3HTh60/AnuUNaW
         qDwWXisqn6gbZBYkyrQZtx8jkm26KC547/ppdAHN7lndwBfQYFiKFDduVwLo89MZRYhO
         81epeNGx85akoRGsibe+xj+a+EVow+yQbPp8IGDth/UDp+2qkHbo3aa9yMK03sqDjXfI
         FfCN5GkMi2I5D6b8P+Pn8uqk2frmHjgPzpVOCkkxVjztBHMRas3WuF2TueQWxcvEfSyN
         RaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1f5bwMzVaB6wRo16QwdapcC/oluekqbfNJd6d0tVIEc=;
        b=sio+pYErBmnRIvnSa8FjlZ/xfAs03qBw3Okf3ybQBNLU9jRII7XlhgQnNq3sq7kLs+
         Bc3uxm1cCFaEqxh9pDuPF3FZLqESm2qLAwWATTofUND8rf/j5v5OLYIDCBNuD+PIRTJf
         0fyI/dZJbbHJKhGhd2RANTPTSP6nMC8dItPXQtxOD+rKF0J2fOp3TeefE0ukUohIMsjP
         XH9Qy8UzpDDMVGnVu3IYS9Xr6yg1hVpJtCGm/LAM2bWYtyxXDPr6zeQJa4gVkUm2s8Rp
         Qm9KuD1SnHITVFfswCED/GKgKvZfQCTpRVuO/Bwjykfe07ayJ8JjoYJxw/nq37i99mpO
         c1Cg==
X-Gm-Message-State: APjAAAWreRHx/uKEWcr1w6HxIdcqxgvzIW43A/MGsn6pM0yb0o1pJTBj
        x/TLdZzlBzyLMhKcdUOoUZrk3g==
X-Google-Smtp-Source: APXvYqwihlTRAqU8L8rfD0ugl/hZaBWyHcy/FdrAqB8p6pd6Yd/bh6D5rLLXZ7T4GAbg+1ckLg6yew==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr16579664wrn.128.1580736632030;
        Mon, 03 Feb 2020 05:30:32 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id l8sm7594540wmj.2.2020.02.03.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 05:30:31 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/3] Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
Date:   Mon,  3 Feb 2020 14:30:24 +0100
Message-Id: <20200203133026.22930-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200203133026.22930-1-brgl@bgdev.pl>
References: <20200203133026.22930-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This reverts commit d18fddff061d2796525e6d4a958cb3d30aed8efd.

This patch came on top of another patch that introduced a regression.
Revert it before addressing the culprit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 99ac27a72e28..0673daeaca00 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3035,8 +3035,8 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
-static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
-			   enum pin_config_param mode)
+static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
+			      enum pin_config_param mode)
 {
 	if (!gc->set_config)
 		return -ENOTSUPP;
@@ -3044,6 +3044,25 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return gc->set_config(gc, offset, mode);
 }
 
+static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+			   enum pin_config_param mode)
+{
+	unsigned arg;
+
+	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = 1;
+		break;
+
+	default:
+		arg = 0;
+	}
+
+	return gpio_do_set_config(gc, offset, mode);
+}
+
 static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
 {
 	int bias = 0;
@@ -3277,7 +3296,7 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	chip = desc->gdev->chip;
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
-	return gpio_set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
@@ -3311,7 +3330,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
 					  !transitory);
 	gpio = gpio_chip_hwgpio(desc);
-	rc = gpio_set_config(chip, gpio, packed);
+	rc = gpio_do_set_config(chip, gpio, packed);
 	if (rc == -ENOTSUPP) {
 		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
 				gpio);
-- 
2.23.0

