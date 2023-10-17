Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E697CC245
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbjJQMFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234986AbjJQMFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85CA187
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so55476125e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544303; x=1698149103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIzjlRTW4yfBl8pe7XEMggW85sINbfz/7P42+EtFezw=;
        b=hc2K9WhajDXrpdRDmotdM1wbScc+dlTDRiEWbc7dfslxftTkYVQMn+NtbyjDK4LNWp
         /biGYzskhP6EYf8NdYUCFNgfG4elbQnnKluLXPIlqkiOkPwGmUapLV8pFZlWWV7MjAOG
         ZT6ZRlyg1elJjhLkLjD7PSbSNjvGpnBJruwY31cwzDz1+4DzNDOB+vOS1YecDyJ1vVZn
         4aXhXsj4Kk5ofv+a/EwiIqw6wCIBbqFgcW9595EMXqFAklWTwzx4EBK6xp5w0QJnd2Hh
         CZkfWi7s1ZsO5JTebJgCtmI3jGTQgl/aWSkE0tKpn5E9kFsdjBdzviQg+DT8CqemIAp6
         BF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544303; x=1698149103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIzjlRTW4yfBl8pe7XEMggW85sINbfz/7P42+EtFezw=;
        b=XHrO2f1t9QARSMkPawjBml/xwiB5H40mEG6121DrzijhZDTdNxOE+DDWq4sukYu4Pm
         jE9QETon6Rt+gkmJ2VGe/AhB9MV+g/0aK+eZB3mbnc/WM6o8JZGywXBlW+d1AIvZ00WJ
         v5X5HPoqAvj8rtAR20mukdoYiM0OlbAUOiOFUUpYAWmyEyNaaoglhkW3iglnt7WSfgDZ
         awNiCN0ryIDOZWfAmrMxvAYcfPnelHAU41skBtwHXgo6vv9fnMzhgmMg1hi1qWlolSdz
         S7XAam8RRHp/8GDZDz/hIUBnLYOuxNHJfybRQBgW5icc3L0axTzEjoz4Ixsk9B/g+/wK
         te8g==
X-Gm-Message-State: AOJu0YyI5UjU/wvsuZrdE/MXX68YaP4Pr0xo8g7z6O8hAguZvePNXZi0
        3RJJSlYFgkJXTxm9gfM0rM+M28hdsBXX0r1g2N8=
X-Google-Smtp-Source: AGHT+IFg8FOTE4zP5B3q7qGa25TCcqxV8CloFWWfCWlRUmvZ4ifvpBaTm+98+xnkdNuxO4C1+z2+FA==
X-Received: by 2002:a05:600c:4f42:b0:405:3455:d603 with SMTP id m2-20020a05600c4f4200b004053455d603mr1564336wmq.17.1697544303497;
        Tue, 17 Oct 2023 05:05:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 14/73] pinctrl: nuvoton: npcm8xx: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:32 +0200
Message-Id: <20231017120431.68847-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index da21f6a45888..0b6d6964087e 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -173,7 +173,7 @@ static int npcmgpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 	struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
 	int ret;
 
-	ret = pinctrl_gpio_direction_input(offset + chip->base);
+	ret = pinctrl_gpio_direction_input_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -186,7 +186,7 @@ static int npcmgpio_direction_output(struct gpio_chip *chip,
 	struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
 	int ret;
 
-	ret = pinctrl_gpio_direction_output(offset + chip->base);
+	ret = pinctrl_gpio_direction_output_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -198,7 +198,7 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
 	int ret;
 
-	ret = pinctrl_gpio_request(offset + chip->base);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -207,7 +207,7 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 
 static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_gpio_free(offset + chip->base);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 static void npcmgpio_irq_handler(struct irq_desc *desc)
-- 
2.39.2

