Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3A6227BD2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgGUJfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUJfm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:42 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B62FC061794;
        Tue, 21 Jul 2020 02:35:42 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so2122468wmh.4;
        Tue, 21 Jul 2020 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4yhgkqbsnYfJYCERold44+/ri3htU91RXGcg84HkdV8=;
        b=W8AuH6MfBCWy9CRyCRe8DjaCBTNVbpzRZShjzBRD0aveb7WQsKbttnHKMqqBMrIaNd
         EUKSZe4lHPWnwhIGxptNRnmN2vFLqsp26KUgIlptGPHjdo0W/ctYBuwgyHIjk16PwSUK
         4agWLrG6qodi4oiizNeJOyIQqn9nb7Jyk7SzmfOUtN+FU6xfxSGy7jLnhYbBdu6hZ7ey
         GbzzufQPwraL6nXi5tQkcxokq85dRdEMnG82goMp3rVIuuM/dxcp1A+CSaTbek5T3BWN
         johE6DLm+kazgiP2ny4YoptYGh44D49xXj26R34boIUPb95prwl3elVIZ+goILShUNDL
         yGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4yhgkqbsnYfJYCERold44+/ri3htU91RXGcg84HkdV8=;
        b=sNbsiN7Fj7mGIHHQDDcwxaQ8r2hL/rPGnWGURCaSbKafNTjFOK4/U6ifj2xQoOmsuh
         HSQhQD1H/P2mEiAIugElAFb1GLXC5vUCPBatMPXW2gKnrqBChSgvmxZUf2aWuNLADZA5
         y09L/BdxV/H2a3rqzwTI3Q5PFIsRQkXL4A61naxG8ifNEOorAAl4etg707Lq17xr07PB
         3hVY/eoYY19n4OQgrv8DtTEjworSZwSt11jy3DOmYbUKCQGA7rPUY7LNIqyHjlhLLOGq
         Uu8wWskUr12/+VoB3zukPEbTrTRgCRPvzsGBsBrojs9n08dNmK/qTiyD1nzmk/9xJeH0
         iBZA==
X-Gm-Message-State: AOAM530/spaX43fszaO9Joq1NHeN7Phw61HScUnaiZHCFicIWxRFFuR7
        5fPE8Uezxr8kV64deu2RuwU=
X-Google-Smtp-Source: ABdhPJysqlKEkciHKD8bwfKwYCSK2N14ryXtdaDYN/HKPF/sQDxNcYdDCGU/iY3QqOwYpuxwscCJ4A==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr3192451wmf.22.1595324141171;
        Tue, 21 Jul 2020 02:35:41 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id z10sm36909296wrm.21.2020.07.21.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:40 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/7] gpio: fixed coding style issues in gpio-crystalcove.c
Date:   Tue, 21 Jul 2020 11:35:16 +0200
Message-Id: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

