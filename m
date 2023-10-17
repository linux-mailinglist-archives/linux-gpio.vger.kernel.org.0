Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C51B7CC272
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343650AbjJQMH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343717AbjJQMGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:51 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DA91BE7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4054496bde3so54158125e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544326; x=1698149126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp1LIUfvDYE1l/aL1VLqxtchd//6yPiTcnPiXQzQOTs=;
        b=rUhTnV0DudQiYo2r4dgVuPQzHWWsBnd1nkljDIdFDe2mUrukjHBUKEWiUc81v6gwLK
         CNu+J1Of4hPzTMf7lhT+SMOqa/qsgb+MNUvSey4o+rpF6nOcTNykImFDmU+avmS5ca5m
         y9bRe2nocQr02oqPe2JjY26hNOiYQfr+1BK2Qhl2zKF4MmVNV7xnUBZvv5/Qx3hApGwV
         GSNFtCX2yEnMgkxlsuLmmf8TmM1LMM1B2mBw30q95mArY/pQqHpdFgC2WnKpUIxnsxzb
         0ptvftZXZqdhbGDjuIdqYMBiF/2XTJ/6uBa3L6rAgOlG2qh5Num6p4DQmBI4gxhQaTI4
         +tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544326; x=1698149126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sp1LIUfvDYE1l/aL1VLqxtchd//6yPiTcnPiXQzQOTs=;
        b=Ej6WateYXDHz8PunDv4i3FkYyjzVorAlsDUN+4kfP9Z1sxjj9n1SOGareTGbMaKqVK
         5O7a//c7Wr9p5/qcvKCC1GFUpz4ZVBPab3OxcQySwK98lFP7mHCNF/iHFp+6yQwPDMsK
         Q7fJQV66c9AHrI4c653PrKM3XzKq9l4bDhAo2rU9/ZSh06N1TwBhJDB4JQ3DDC5jXVPr
         MlQXKLT6N8ft64r3qPFQfDCRLTNpEeU8Alu+XL0/eNq/JU61q54E15RPRFNzCrBol9pj
         JyknSLd5LqvLGdPkiVkM6JBBR1kDIlLRNwpD3vlJwjJeGMmt5GAwdJ3aUmkIVkhH2AUd
         fntw==
X-Gm-Message-State: AOJu0YwFmo6djOuss8HyQvNUYXSg5tjFbhRCyETsKYNBl3ERa6xSJw1Y
        d5eYvEwmf6DH2Aan6eRkwsbjXg==
X-Google-Smtp-Source: AGHT+IFKE4p8HewSElt7IrWW+9f7VTBcLC5Ondi/Z9HT3X00nCq/DNt6DFg4b1GbJEhZRl4wJ23erw==
X-Received: by 2002:a05:600c:a48:b0:405:3d41:5646 with SMTP id c8-20020a05600c0a4800b004053d415646mr1554434wmq.2.1697544325925;
        Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 39/73] pinctrl: remove pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:03:57 +0200
Message-Id: <20231017120431.68847-40-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of pinctrl_gpio_direction_input() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 9 +--------
 include/linux/pinctrl/consumer.h | 6 ------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 5a1414bfeacc..80f565aac707 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -873,13 +873,6 @@ static int pinctrl_gpio_direction(unsigned gpio, bool input)
 	return ret;
 }
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_direction_input(unsigned gpio)
-{
-	return pinctrl_gpio_direction(gpio, true);
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input);
-
 /**
  * pinctrl_gpio_direction_input_new() - request a GPIO pin to go into input mode
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -891,7 +884,7 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input);
  */
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(gc->base + offset);
+	return pinctrl_gpio_direction(gc->base + offset, true);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 90b2f0b78c4b..249bb28a52d6 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -29,7 +29,6 @@ struct pinctrl_state;
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
-int pinctrl_gpio_direction_input(unsigned gpio);
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
 				     unsigned int offset);
 int pinctrl_gpio_direction_output(unsigned gpio);
@@ -87,11 +86,6 @@ pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset)
 {
 }
 
-static inline int pinctrl_gpio_direction_input(unsigned gpio)
-{
-	return 0;
-}
-
 static inline int
 pinctrl_gpio_direction_input_new(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.39.2

