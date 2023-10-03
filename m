Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62B37B6C36
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240226AbjJCOvv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240247AbjJCOvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:41 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53994CE
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406402933edso9801605e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344696; x=1696949496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqqnOvKvXDp4MSe7jhplDhHv0MUiBDnh5IiTR46rq2A=;
        b=Gzf7Men2nVKsOP/fL2iY9puZLSOcLSbXPI4mAvN0FKKv6LCZ6hpvWigNyl/EWUlRaA
         H60VzpHjdHzM454nISGVY7mCPAOTN/4TJHwUZv5yLn0dukS9CxFopHjqGJJzD3v2GbO9
         ijUb23BeMuAk8RIiw+SbhqqJpuF8gWntazBJ0iHkj14bwr49eD3nNtHZN3pLMPukB8Ai
         9fqWdefRdLvJqJRtAXz8OOnyLGlxtEB3/0wdWAUAMbDaXxFHV0M45K7qnXymHom7y7DX
         7OO1M9BMeLIPDZN7Dpcb5tREHneTPS1Z212P/+snNHHBqJ/QN+Go5GDlhHRr6OkVVwo6
         YdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344696; x=1696949496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqqnOvKvXDp4MSe7jhplDhHv0MUiBDnh5IiTR46rq2A=;
        b=v6n3J++CEcKem2iimtnF9gbypKVCM47CLMQYi7sZKIhxIwDIvJI+snJwgGVT+FzbMW
         82oHGYpO0MASjL0uJwQzPcSsRRMsKz6ydm2wkMMfJ6jhQn7D5+JUl9WkfqF8iuyxv5K6
         cM0yNLiMqt7EtBWm8iILzQYTLRnByDWMgusxFcAldYa/T60UyZTRblA6b80yw/0kZ3CU
         Wl9AyXqGPrkZUx5ZiWSn15ZmAXom/1DbOkbPjJhS8Vn/GwQOSPmvvF8vXFGDfF04GQbU
         AL9XfYojZgxwSxHICRFdA1NcfqIvkSasKK1zJiLiXUC5DEx0FR4+GbQMiHgZtPkJwatR
         jVPg==
X-Gm-Message-State: AOJu0YyRHWnTHGfk7VfipOfUipxQkgONm8DIVHhD3+Zs5vFUC0hohWKC
        xr894NIdt+AIv8Fbt66F5tRA0ezegj45uGpMTi4=
X-Google-Smtp-Source: AGHT+IFnlOwLrQQ9qokqmc7bFZCQ5YA43OcLjE3hejUjE/x2JsMW8rvflYJmqgZ+/wOccZYbGAvvvA==
X-Received: by 2002:a05:600c:2303:b0:405:dbe2:df10 with SMTP id 3-20020a05600c230300b00405dbe2df10mr12537741wmo.35.1696344696539;
        Tue, 03 Oct 2023 07:51:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Subject: [PATCH 17/36] pinctrl: spear: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:55 +0200
Message-Id: <20231003145114.21637-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 722681e0b89b..7488f6394318 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -204,14 +204,13 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 	int ret = 0;
 
 	if (offset >= chip->ngpio)
 		return -EINVAL;
 
-	ret = pinctrl_gpio_request(gpio);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -249,14 +248,13 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 err0:
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 	return ret;
 }
 
 static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 
 	if (offset >= chip->ngpio)
@@ -280,7 +278,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 /* PLGPIO IRQ */
-- 
2.39.2

