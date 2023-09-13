Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E8A79E738
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 13:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbjIMLuc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 07:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240501AbjIMLua (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 07:50:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C93319BB
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 04:50:25 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-403012f27e1so48089355e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605823; x=1695210623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qakrc9HB1O5Iu/mhnl/aqGs6dWn+CSwn3hlAKhsYM7Q=;
        b=K59dYPUIHZTckXjn/bieXANY+l9Grc0I7HeuaZku2GSM0xmOT8f6oYUEL+r8A6Audd
         K64NQ5MSwHAEul4mNOjFFizn7isndvft5Yvjs6zvyP/88+zeF0dKiGOv00E/ikMfQZz2
         sN9+grflFK8efEyxB98FD1NdNtAYJXREV0hWSBpiGmUUqbAyBUV2dxHJS9SI0PuWF2Ub
         hc9nyEwu4PnsWLwAfUxhp+xCQhUzgGlNnpT6vQqfOutJrw6eK0xFuAm4i8cPk4OrN4BE
         IocjF1H4qhRmDT70bfVHh3bEGn4sMAdQzii3oS91UoPKhvBB+IXXjwg/ozV21AYwFBPk
         HU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605823; x=1695210623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qakrc9HB1O5Iu/mhnl/aqGs6dWn+CSwn3hlAKhsYM7Q=;
        b=WJwQ1GYm3GCJJdNboGEW+Lz8ByWkrKpBMAHT7XEIJS6qzFpxEkRqsK71hJpa8/SSsM
         3+zn/4P86HgwsqDKYbJbmMwym+YJfoURaFt8+iUoJvfLDBU1yCW0bEIZa1V5xHe2Wu5t
         JPTEO4wHPOC3pIeLHb+ts3/ooXw7B3BGvM5ps7hGIMl9RBjsmdAgPcWkWfNxDRcWjJwI
         3KEq7abaQ5exB5LopI3IWqi6jynS07ugw95tHoOY1Z9l2ZWZ0VeUtWhA63cOE+FrWoDP
         d8tmKdO/rGXm9fdhNazZYaFSWeZ+TAZH06HhbdHLzlbj980nSIZsJSkh9JiWf2giMZYs
         4cEA==
X-Gm-Message-State: AOJu0YylVGVpnR9Xp2q81HnVcjzBywOlyJI9+QUsos4MXvSVbGMd308l
        f5i83nzIAMcqBe+e0gvlPSkpJQ==
X-Google-Smtp-Source: AGHT+IHSaGvQEu7p/aPUxTrIpzTkMdMiNylYl6uXXTnV4TP4nHCU3quUTmCv138dyfMb7wv/N8jbvw==
X-Received: by 2002:a5d:56ca:0:b0:311:1dba:ca65 with SMTP id m10-20020a5d56ca000000b003111dbaca65mr1878093wrw.51.1694605823533;
        Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 5/5] gpiolib: remove gpiod_toggle_active_low()
Date:   Wed, 13 Sep 2023 13:50:01 +0200
Message-Id: <20230913115001.23183-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all users now having switched to gpiod_set_active_[low|high](), we
can now remove gpiod_toggle_active_low().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 11 -----------
 include/linux/gpio/consumer.h |  7 -------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 131965814a7c..14b84bad93ea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2714,17 +2714,6 @@ int gpiod_is_active_low(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 
-/**
- * gpiod_toggle_active_low - toggle whether a GPIO is active-low or not
- * @desc: the gpio descriptor to change
- */
-void gpiod_toggle_active_low(struct gpio_desc *desc)
-{
-	VALIDATE_DESC_VOID(desc);
-	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
-}
-EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
-
 /**
  * gpiod_set_active_low() - set the GPIO as active-low
  * @desc: the GPIO descriptor to set the active-low setting for
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index ddbf0d8e4a75..395e1a67c4c8 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -159,7 +159,6 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce);
-void gpiod_toggle_active_low(struct gpio_desc *desc);
 void gpiod_set_active_low(struct gpio_desc *desc);
 void gpiod_set_active_high(struct gpio_desc *desc);
 
@@ -495,12 +494,6 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned int deboun
 	return -ENOSYS;
 }
 
-static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
-{
-	/* GPIO can never have been requested */
-	WARN_ON(desc);
-}
-
 static inline void gpiod_set_active_low(struct gpio_desc *desc
 {
 	/* GPIO can never have been requested */
-- 
2.39.2

