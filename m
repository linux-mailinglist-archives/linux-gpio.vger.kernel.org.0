Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE077C53A8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346929AbjJKMWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbjJKMWK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891B91A4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:40 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4060b623e64so5630425e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026203; x=1697631003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhxxEdfFHW+stAxKA/W7e3OuQ/nZwbmKsltug+cK6+c=;
        b=DDRCmaNSEFdynYCD7ID/io8ArwGu5dYgFg8GdTCHT1HUkL3vAsvmLouyr45WPNmM0V
         N+clcNEZK2UXB1z3dSIoTWk/mVbn5W9Bce65XBdA8R/vbhX732c4lX5Wk/5Lv1CoCWzY
         AK9datAetrpGIoW4X+xBwz4V+PCPgKALnrIiUI5sTw5VVDP56nwQJ2Ebk8EzA9I8TExW
         ZoPA2xdgN4D+Gc+dFQvn4npUBi4iV1/D73h01Yu2xhaWegHYoFY35cmTj47zeUDsCIYI
         G77J5Pk7ogCArZx/I1swTad3ULSCFq+QwvJK+uGIR0e7HyoxKi2SCJK7DJIxwdX9Xh6e
         g4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026203; x=1697631003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhxxEdfFHW+stAxKA/W7e3OuQ/nZwbmKsltug+cK6+c=;
        b=k6L34+Ppz3x1vXZN0+eocY6SBA8PUIN8o5FMJLx/jawFT9Jd3tcnNQmdwhoddEy6L2
         +L5pJE8sMwdb7xKT695F77whutst0fKqSSYootHbaoguuZb65kz1EU2eh9HSV9fVWszr
         AQjawFcI4A5UVxzoemAqs21sGPQSmDVL7y6bJFzwZcJOXgubg3ozTaJEaT0XK9/gsg6X
         4+HiIt46BMKral+1e5P6Qrwf0d/GV6EPiN6M6FXC7oZyy/FF+yfiCdFLZxc0vEVpFiPO
         D+6JGscsG3mJ/Vd7d6z8ZXazF7i5uGJPpUhpmcVyAp5GZ2d2wxjJt39g6PMdgyJptPKS
         TKsw==
X-Gm-Message-State: AOJu0YyqxebxGYLCL9a0ZoBguO3LFmKAV3gWFOBw3yh1lu3c2ltsQ0UD
        UOMHLCWYJC95ydNtFOm5P17T0A==
X-Google-Smtp-Source: AGHT+IFTHg1z8EvZk2ZpTplwEy/MDg9y1Qxo7yi7/hSIC3LqIaPDZuETg9wI+Df8PAcjX5DcHWSVPg==
X-Received: by 2002:a7b:cbc8:0:b0:405:19dd:ad82 with SMTP id n8-20020a7bcbc8000000b0040519ddad82mr15567410wmi.16.1697026202814;
        Wed, 11 Oct 2023 05:10:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:10:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 60/62] pinctrl: nuvoton: drop wrappers around pinctrl_gpio_request/free()
Date:   Wed, 11 Oct 2023 14:08:28 +0200
Message-Id: <20231011120830.49324-61-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_*() helpers now have signatures corresponding with those of
the GPIOLIB callbacks. We can drop the wrappers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 8 +-------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 7 +------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 51aeac7ecc79..1e658721aaba 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -208,12 +208,6 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	return bank->request(chip, offset);
 }
 
-static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	dev_dbg(chip->parent, "gpio_free: offset%d\n", offset);
-	pinctrl_gpio_free(chip, offset);
-}
-
 static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc;
@@ -1916,7 +1910,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
 		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
 		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-		pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
+		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
 		id++;
 	}
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 140fdbbe8458..a377d36b0eb0 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -205,11 +205,6 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	return bank->request(chip, offset);
 }
 
-static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	pinctrl_gpio_free(chip, offset);
-}
-
 static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
 	unsigned long sts, en, bit;
@@ -2388,7 +2383,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
 		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
 		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-		pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
+		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
 		for (i = 0 ; i < NPCM8XX_DEBOUNCE_MAX ; i++)
 			pctrl->gpio_bank[id].debounce.set_val[i] = false;
 		pctrl->gpio_bank[id].gc.add_pin_ranges = npcmgpio_add_pin_ranges;
-- 
2.39.2

