Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3A27C54AB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 15:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbjJKNCQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 09:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjJKNCO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 09:02:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B75193
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:02:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so6443236f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697029332; x=1697634132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UAK8E7pePpgc7Mc8WJXJGU9y4S9NeTxPgxbowGv2Qg=;
        b=XwEauL7wuLPxZFZQqqmEXTGZX6gmQT2LHBd1QymLvuBPSpRAlXD2o04gVfRdcpzwUS
         UXynbsrywNcIdayB40kRsmYOQ7B5BvlbT/kIooMvXPG+8f6CpPn8bggyM1SjhSz/BeBs
         qY6v2QIojzu5HW07by+jb7Qitpkue9Sfzztet3+e7alLHDRePIKdm1JQy33HmvrUFIVd
         oAQn2d+FA078a9aV6Tm+fbJECZsV6Ao4dgVOTRk9kYurn/OzwD5ZfJRfb64h289DNykA
         O4MpONPukI/N/ZrODt9H83VvHa029GVp2JOpohb0sM25930UoZjkRrmZFA9X0hLGLO0Y
         2OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029332; x=1697634132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UAK8E7pePpgc7Mc8WJXJGU9y4S9NeTxPgxbowGv2Qg=;
        b=i605PRXKs0UjyITUywa2IqgHHw8ZB0Fpakj3SZV5cA3zo1pE4ZAb8aTVagiUuuh5Ob
         dZMN1/5JniY9JMTXaBYMUepNFPDNzkW1XlojHSyEo5ZPWE+0Vppz/Mjjxljt/MmWvOPe
         O2xe1GBF2gd7LFUtE/AY9tDQ/kqZHqJUsAjQeZvdwGoS4IsGuF4ItW8JJe3sP34RBsum
         4jfvdo12qf4PnEzTA5fTFslC9XUbwMtoWxH2USyyEnHv8NYP4KCE5nD6cPXBhcXnBROm
         ykrm12fHag0T3pTeL/e7EBu3O1lfgbdjv3mYFEfA05/zjX2Kgxjts4MfdjT+Uw5xG51X
         PrkQ==
X-Gm-Message-State: AOJu0YwvT89pohaf0LRAm+yzHlb1Mhn9xtB6gawSuplWF3plji8gpN39
        spfaIu2o6cQBkJxk/wZRQYLZTy49bmR9Ehpf6qM=
X-Google-Smtp-Source: AGHT+IG+PgbKaxRkhPzK3/tUyQn7QeqD3ixqH6HWwH9XOZbCQkn1vPFZrL6kEepcP5KM5ReCds1y/Q==
X-Received: by 2002:a5d:630c:0:b0:31f:fa6a:936e with SMTP id i12-20020a5d630c000000b0031ffa6a936emr18705062wru.17.1697029330935;
        Wed, 11 Oct 2023 06:02:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id s13-20020adfeccd000000b003198a9d758dsm15455375wro.78.2023.10.11.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:02:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] gpiolib: provide gpiod_to_gpio_device()
Date:   Wed, 11 Oct 2023 15:02:03 +0200
Message-Id: <20231011130204.52265-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011130204.52265-1-brgl@bgdev.pl>
References: <20231011130204.52265-1-brgl@bgdev.pl>
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

Accessing struct gpio_chip backing a GPIO device is only allowed for the
actual providers of that chip.

Similarly to how we introduced gpio_device_find() in order to replace
the abused gpiochip_find(), let's introduce a counterpart to
gpiod_to_chip() that returns a reference to the GPIO device owning the
descriptor. This is done in order to later remove gpiod_to_chip()
entirely.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ca2b5b424284..1e0ed6f5bcd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -220,6 +220,27 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
+/**
+ * gpiod_to_gpio_device() - Return the GPIO device to which this descriptor
+ *                          belongs.
+ * @desc: Descriptor for which to return the GPIO device.
+ *
+ * This *DOES NOT* increase the reference count of the GPIO device as it's
+ * expected that the descriptor is requested and the users already holds a
+ * reference to the device.
+ *
+ * Returns:
+ * Address of the GPIO device owning this descriptor.
+ */
+struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc)
+{
+	if (!desc)
+		return NULL;
+
+	return desc->gdev;
+}
+EXPORT_SYMBOL_GPL(gpiod_to_gpio_device);
+
 /**
  * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
  * @gdev: GPIO device
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0484bf90b25d..7a8725be1225 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -784,6 +784,7 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

