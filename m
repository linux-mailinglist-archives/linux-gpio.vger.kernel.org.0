Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6504D7CC247
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjJQMF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbjJQMFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1C4192
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4054496bde3so54155225e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544304; x=1698149104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta+JXTCEvoYCkfYdZVmNUE+yvh6PoUsZ4OUodo3JS+4=;
        b=qp61ulenASzeO4vCFg/S3btMccU2ji6nnoWqw2LS4MBIQMMITXlzR8QKWnexnVgcYO
         9vfVpJnpa4d9r1DBrWnVreekLfV/bVYSCMjrNCP6bsOriMLIRw5pmk7JC1J5hsKBv4HA
         hjPxjNHbfAf5ha6GRM60McUc18yZkixgvpWNh1L2f7Tnd0I98/Wu/teuRVyTTvpPpfEu
         gxUd3QUHPApHOfdsqhIJKqzbitf+5sZQua+nWFfhF4dGKcQ5UOvgtkzwVg5XP1kF6mhk
         aqRzzD4hBBEMjRrM/+DcYnVdBGblVqka4/nAExc5badWtLMPW5HC09oH78c6C4ilAN7Y
         zW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544304; x=1698149104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ta+JXTCEvoYCkfYdZVmNUE+yvh6PoUsZ4OUodo3JS+4=;
        b=P6l5x1NilFgNExjLqHpWVf50sfvi5uE+pI4v38euiEDQs2Sw3E4utNtyE+q5I1rFop
         TZ5DyemJIB4atKv8ajVi/gtsdtr14NLBiMCvSPeUo+z6Is/hrdhx9gRzjyF609T9Sk/q
         Xv/Z8D/N9MKPAPnls+kS3Lj861Vgnu2Nm59ufoiDZZBe+tNk6+21qMfUFgO9yuEwohJ7
         ndTF5PXGhl+BTi9yo0xzu7UNst2ccFhs6p5lKKfxN5igrUJTzhwNVDtiE+BH2u2McnZ0
         CQCtER7yj01d2ZD7JXEglXkkPuJmGhar9NHb824nJb1TTX/0Y4o6wx9i1B6YYmlHWxWP
         h8/Q==
X-Gm-Message-State: AOJu0YyN9El7Ha11ZE0O1jiThqBIYS1C+zsFkQHTGNollY90EScexAYj
        M3bqpTfE2rzq4nhPhK4rAZWZIvnbMYQeXlmTDvs=
X-Google-Smtp-Source: AGHT+IHxiIn/wqd5crz6PHnRl0Lr/UaCsryg1PSyc97t9TzH2DAAWw7CedNCmdQLrkP/7m+zpeL3VA==
X-Received: by 2002:a05:600c:294c:b0:405:499a:7fc1 with SMTP id n12-20020a05600c294c00b00405499a7fc1mr1429909wmd.40.1697544304325;
        Tue, 17 Oct 2023 05:05:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 15/73] pinctrl: renesas: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:33 +0200
Message-Id: <20231017120431.68847-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/gpio.c          | 8 ++++----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 5758daf94fe2..e7771a57e6d1 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -135,12 +135,12 @@ static int gpio_pin_request(struct gpio_chip *gc, unsigned offset)
 	if (idx < 0 || pfc->info->pins[idx].enum_id == 0)
 		return -EINVAL;
 
-	return pinctrl_gpio_request(gc->base + offset);
+	return pinctrl_gpio_request_new(gc, offset);
 }
 
 static void gpio_pin_free(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_free(gc->base + offset);
+	return pinctrl_gpio_free_new(gc, offset);
 }
 
 static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
@@ -164,7 +164,7 @@ static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
 
 static int gpio_pin_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(gc->base + offset);
+	return pinctrl_gpio_direction_input_new(gc, offset);
 }
 
 static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
@@ -172,7 +172,7 @@ static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
 
-	return pinctrl_gpio_direction_output(gc->base + offset);
+	return pinctrl_gpio_direction_output_new(gc, offset);
 }
 
 static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c7c6d912a975..22d4ab7d228c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1056,7 +1056,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	ret = pinctrl_gpio_request(chip->base + offset);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -1181,7 +1181,7 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	unsigned int virq;
 
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	virq = irq_find_mapping(chip->irq.domain, offset);
 	if (virq)
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 52aeafaba4b6..3d29c77a5aad 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -754,7 +754,7 @@ static int rzv2m_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u8 bit = RZV2M_PIN_ID_TO_PIN(offset);
 	int ret;
 
-	ret = pinctrl_gpio_request(chip->base + offset);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -832,7 +832,7 @@ static int rzv2m_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void rzv2m_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	/*
 	 * Set the GPIO as an input to ensure that the next GPIO request won't
-- 
2.39.2

