Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690EE227BD4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgGUJfq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUJfp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71668C061794;
        Tue, 21 Jul 2020 02:35:45 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 22so2135339wmg.1;
        Tue, 21 Jul 2020 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWuKB7PmI5zL2tIhTuwiGGKPwqUnluDFvI5sx+qxpJA=;
        b=cHTnop5Hj6eX688aIRLcIR01WIC3cGyykY2GVZD93V8zg5ZXAFX29ZqrfHTvuaKSSr
         OHey8VJRxedN+snX2I7rVGUWu32jehupcu2PC8JX7tWFh8Hgh1+W6s/gua1cZkDz1bVm
         8bvwEtA/gtvigbcckZGHEbawjtUjEQU93BAMrylGv1vMN93zyZzgokR0z5UUdVqwnVHJ
         RLJ8mQkLY7IEG5L7qvI4G+p0TURttRKv/p2ArajTeXyQG4WrouqlnzJpyNFIBnN4j9pH
         IbyrkJoTbGFo0rXYJNnyA7i2jgfg5wUe2zXfaeYB6q/16zZ2VNyAOvPHyb9/kLk3JHRC
         vNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWuKB7PmI5zL2tIhTuwiGGKPwqUnluDFvI5sx+qxpJA=;
        b=AGJytsifm50SA4XmdBa/rB8oxh2HxcU43ef3RtBsu3HW+MT5nhFcxdA/qBLXTJomln
         cIA9aHCSwectKNfezt1ybgaG5bqMsyEK5uFx4+QLiq0qNpePvdXy0eZFgpvUMCZLrohm
         89+3MLue0qv0wk6vPiW2vyEF8WEkCCFgxJj5RgjbBVTn3s/mLbN6HKirjPf9X5gG2vlm
         Cpy/HZsBqdlJY3fVZz+u1ORfciFKJe9q8Q5AzLVKbTCJApSfxC+AU2D1h80XvaaKGrQ3
         gQnjccE8ibD1lPnfCHVi4RVNdWXPg66D7YBZhs3pr5F8bzmfhQc70d24vcnDfin9qIUl
         oncA==
X-Gm-Message-State: AOAM532DF4QxfG8CP7xGh6ftHc+vw8W/qMilj8XxX+zeHSqhNpRSQg1i
        aORKwHqzlaHGTGzttnF6uRM=
X-Google-Smtp-Source: ABdhPJytJ/Myg2uE1sGv60yAjbAuPmfvxzFhzZb+itrQ72oIM0CvxLljwii2/7v/+pwJw4c9qSN3/w==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr3391116wmi.66.1595324144139;
        Tue, 21 Jul 2020 02:35:44 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id v12sm25452878wrs.2.2020.07.21.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:43 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 2/7] gpio: fixed coding style issues in gpio-ich.c
Date:   Tue, 21 Jul 2020 11:35:17 +0200
Message-Id: <20200721093522.2309530-2-abanoubsameh@protonmail.com>
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

