Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAAA5790D9F
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Sep 2023 21:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346092AbjICTHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Sep 2023 15:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjICTHS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Sep 2023 15:07:18 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D817CC6
        for <linux-gpio@vger.kernel.org>; Sun,  3 Sep 2023 12:07:14 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31768ce2e81so652282f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 03 Sep 2023 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693768033; x=1694372833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5iIDV+80J4qyRagBpXoSeKe9LzYLKNntY/DPpHDSSc=;
        b=d8T1RiYuK45FOJ5rqa4vdN53OX7yjnlBABrvV4g8Gd1ZmmnOkh+mG2bKjcsXJbEyO7
         9woLGHyEvstJTyzYweCn/dn15j5eF3qrpc8DT0XP3qmsNlu0S1aYqbsTAgFfGM98QK8z
         MAbzoyBuFdOjDMImjOfyT0RaOwTWLj1obTgeLME4jmtSeLICjg1g69F5T7dSyJjU9VA+
         Eg+NWKS5YxuZOVyT1CruKGwSfOzxCKLwyc2c/W7wx/y/EnRHv/1EThS9f6JI3123pwMQ
         FuOHzHYfj46kYmH6IRiwgCVCPHWyUSttf4oVALl7aMAhYoWY9pKL/RrIfqmB2euJl8yd
         X+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693768033; x=1694372833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5iIDV+80J4qyRagBpXoSeKe9LzYLKNntY/DPpHDSSc=;
        b=StXfb4ngPVSmzaQFarqe708xLYZuOMynQ+bl1SWOP3qJH52hbt0NltmsApFObr+a3e
         2NY81kjgOUHgL78A7KLiVIk54sckVWvNdgZuBkeVY4BJOwMnx3MPY64dsxQhZeMAousS
         66gCBiTTOzqRbuxWClG3FhXHPqoXft2QBDOfGBr/Bt8Wua65WBU8Q/g1kLqkKedf7cRY
         N9Zce8XYe/vDJ8KlOQWm33/Q4XyhRzoi5ZveCceEy993VK5FDhrTyr2/3ZpLyXide04Z
         Qe7CzUTwK5orCJ0K7jp5bIfySuY/8bPYwNLNzecjvIIPfzRKrOPJ2PuR/M2m8a4aURQa
         OmqQ==
X-Gm-Message-State: AOJu0YxgZqS8OIc2jRlTadeBtm6gjeQWnhd+rxG+tB1nuarG26kpa1H5
        UMbJaB0mst9AHAXuyghSUd2P2g==
X-Google-Smtp-Source: AGHT+IFWltrAuxbCv2MOty17dwknXbUAH8HIzF8SqsyqqZHZrQ3dmV0vh2rmw4Jt/V52Pr2A34NVWQ==
X-Received: by 2002:adf:ef89:0:b0:317:731c:4d80 with SMTP id d9-20020adfef89000000b00317731c4d80mr5070457wro.24.1693768033211;
        Sun, 03 Sep 2023 12:07:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3591:d7b7:f0c6:6e52])
        by smtp.gmail.com with ESMTPSA id y1-20020adff6c1000000b00317a29af4b2sm12298257wrp.68.2023.09.03.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 12:07:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: unexport gpiod_set_transitory()
Date:   Sun,  3 Sep 2023 21:06:57 +0200
Message-Id: <20230903190657.12393-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no and never have been any users of gpiod_set_transitory()
outside the core GPIOLIB code. Make it private.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 1 -
 drivers/gpio/gpiolib.h        | 2 ++
 include/linux/gpio/consumer.h | 8 --------
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c78d83990068..490c1cad3b52 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2774,7 +2774,6 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 						      PIN_CONFIG_PERSIST_STATE,
 						      !transitory);
 }
-EXPORT_SYMBOL_GPL(gpiod_set_transitory);
 
 /**
  * gpiod_is_active_low - test whether a GPIO is active-low or not
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 1f6277bbd612..3ccacf3c1288 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -132,6 +132,8 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap);
 
+int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
+
 extern spinlock_t gpio_lock;
 extern struct list_head gpio_devices;
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 1c4385a00f88..6cc345440a5b 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -159,7 +159,6 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce);
-int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 void gpiod_toggle_active_low(struct gpio_desc *desc);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
@@ -494,13 +493,6 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned int deboun
 	return -ENOSYS;
 }
 
-static inline int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
-{
-	/* GPIO can never have been requested */
-	WARN_ON(desc);
-	return -ENOSYS;
-}
-
 static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.39.2

