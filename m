Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4022282AA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgGUOtb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgGUOta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:49:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA05C061794;
        Tue, 21 Jul 2020 07:49:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so21479707wru.6;
        Tue, 21 Jul 2020 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmJZK001/V2lK3tLrXOkTuUrVg5YDb1X9LdCfTznS4E=;
        b=KD4FngX40umpYE7WJpmpfwXCFpDayXsdH558DIo3i/jKe0hch/F5ib1knzMTvl6Dk5
         RB+HrRJBkn70FQy4hGEJ0cHUi/osgkrcXB1Qz+t5kpt/M/hAZ+U0eX/2LTyjqFrz5kA0
         aCp4rWTOJduPQ9B1SIm10iBX8j/yk5MNFC0Ti3mQYUmX+QbTiPmWzoxWlXWWHz1S5nZR
         ADYisgS8PBcQV5oNGi/V8VzX/e9iOKs9wAwP/3yxsGQcr0arU0kE7T1GnBG0lrvEFXFg
         CDBQynUjIQbPe1Sr8B16Zpnlnh8d940TDmOUBw5Xy8y9qx4RvpoDSVH2+1D0Px8uiiV4
         KlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmJZK001/V2lK3tLrXOkTuUrVg5YDb1X9LdCfTznS4E=;
        b=ef/3hxSfJgt5+nWsGLlYczqSNIfpDEzZv5i7SsFq9K54Pch15limwUsEIe4y3DkwkR
         SIS45iTaOfAGPmMjfB/4qRsQuynQ4vbjXckItEWTW8F3gt/F8aUgTywyIJE0PHjgaFBY
         DLH6xd3OG5YmmgtR6eNeR9s2H3w7A3sOG9ffIFxufXld5FP/vOEi2uvtd0CfxlUKX+PZ
         b0O30k6NnOGoNoXtfdFYrdWpkmlfgTmoDoNXcQ5zp4peJEg4fQEcVHh/vk6+bjXLqjk5
         OgR+Yahg5kC70u06CuYo8yRpl4KKdsYk1AE1SZkN646gEUf30mIicvgbyRZk1XtT9B60
         oqDw==
X-Gm-Message-State: AOAM531Gm82Scw8qKaTIrfn5pt02MPQv6pvKAi3cyNF+XM7Cd+akCY3v
        xDBXC+RzVxgci0ghtVJ1F/0=
X-Google-Smtp-Source: ABdhPJxnGaYpnKKfXKR6n4UrZFiLVCN6gfvXqo7XcH8fRSwVRrtRFRTIEO96Z/B02eWgF3fZmiOKPA==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr12799296wrx.212.1595342969105;
        Tue, 21 Jul 2020 07:49:29 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id t14sm25759821wrv.14.2020.07.21.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:49:28 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] gpio: gpio-ich.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:49:02 +0200
Message-Id: <20200721144902.755796-1-abanoubsameh@protonmail.com>
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
 drivers/gpio/gpio-ich.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 9960bb8b0f5b..de56c013a658 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -74,8 +74,8 @@ struct ichx_desc {
 	u32 use_sel_ignore[3];
 
 	/* Some chipsets have quirks, let these use their own request/get */
-	int (*request)(struct gpio_chip *chip, unsigned offset);
-	int (*get)(struct gpio_chip *chip, unsigned offset);
+	int (*request)(struct gpio_chip *chip, unsigned int offset);
+	int (*get)(struct gpio_chip *chip, unsigned int offset);
 
 	/*
 	 * Some chipsets don't let reading output values on GPIO_LVL register
@@ -100,7 +100,7 @@ static int modparam_gpiobase = -1;	/* dynamic */
 module_param_named(gpiobase, modparam_gpiobase, int, 0444);
 MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the default.");
 
-static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
+static int ichx_write_bit(int reg, unsigned int nr, int val, int verify)
 {
 	unsigned long flags;
 	u32 data, tmp;
@@ -132,7 +132,7 @@ static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
 	return (verify && data != tmp) ? -EPERM : 0;
 }
 
-static int ichx_read_bit(int reg, unsigned nr)
+static int ichx_read_bit(int reg, unsigned int nr)
 {
 	unsigned long flags;
 	u32 data;
@@ -152,12 +152,12 @@ static int ichx_read_bit(int reg, unsigned nr)
 	return !!(data & BIT(bit));
 }
 
-static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
+static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned int nr)
 {
 	return !!(ichx_priv.use_gpio & BIT(nr / 32));
 }
 
-static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
+static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned int nr)
 {
 	if (ichx_read_bit(GPIO_IO_SEL, nr))
 		return GPIO_LINE_DIRECTION_IN;
@@ -165,7 +165,7 @@ static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	/*
 	 * Try setting pin as an input and verify it worked since many pins
@@ -174,7 +174,7 @@ static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return ichx_write_bit(GPIO_IO_SEL, nr, 1, 1);
 }
 
-static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 					int val)
 {
 	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
@@ -191,12 +191,12 @@ static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return ichx_write_bit(GPIO_IO_SEL, nr, 0, 1);
 }
 
-static int ichx_gpio_get(struct gpio_chip *chip, unsigned nr)
+static int ichx_gpio_get(struct gpio_chip *chip, unsigned int nr)
 {
 	return ichx_read_bit(GPIO_LVL, nr);
 }
 
-static int ich6_gpio_get(struct gpio_chip *chip, unsigned nr)
+static int ich6_gpio_get(struct gpio_chip *chip, unsigned int nr)
 {
 	unsigned long flags;
 	u32 data;
@@ -223,7 +223,7 @@ static int ich6_gpio_get(struct gpio_chip *chip, unsigned nr)
 	}
 }
 
-static int ichx_gpio_request(struct gpio_chip *chip, unsigned nr)
+static int ichx_gpio_request(struct gpio_chip *chip, unsigned int nr)
 {
 	if (!ichx_gpio_check_available(chip, nr))
 		return -ENXIO;
@@ -240,7 +240,7 @@ static int ichx_gpio_request(struct gpio_chip *chip, unsigned nr)
 	return ichx_read_bit(GPIO_USE_SEL, nr) ? 0 : -ENODEV;
 }
 
-static int ich6_gpio_request(struct gpio_chip *chip, unsigned nr)
+static int ich6_gpio_request(struct gpio_chip *chip, unsigned int nr)
 {
 	/*
 	 * Fixups for bits 16 and 17 are necessary on the Intel ICH6/3100
@@ -254,7 +254,7 @@ static int ich6_gpio_request(struct gpio_chip *chip, unsigned nr)
 	return ichx_gpio_request(chip, nr);
 }
 
-static void ichx_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
+static void ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
 	ichx_write_bit(GPIO_LVL, nr, val, 0);
 }
-- 
2.28.0.rc0

