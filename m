Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034AF792E7A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 21:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241984AbjIETLr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 15:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241962AbjIETLl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 15:11:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310F31A2
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 12:11:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so331604a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941017; x=1694545817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=O8qzATZBVfrDSQuBHnuHMOmugpt+B/XlfS3eupqZMXoVDZerScmOfcWF3wIdwgUs4S
         HzcoGxpKlyfBatkSoGY8bVBG7jzxNDWw+rAJ5FcLTlva6Ys6iQPmXZ8CtJkhyk3TUyub
         tF+KMc0+fM6+JqXBuMvrpTuXOdGef7sw+5vsjD1x+kqNHF8DmdN49iCl1eC4h5XxSdGk
         LSwTqf18AeZk3PC9PTkZBjm/a8gr7xpimHGteD4KS7YtUci0RwowuliSxt/mr5Zixwyc
         Fe/jTMhpGiBTyZmZOgB49kHOmOxx1WGk7Xb032hYdH+5F7SeF9nf6X3P6vkubRdUs1Lr
         gJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941017; x=1694545817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=lAS09WD9QaGYqlewrt38KSw3z824DEX0O4cidn22aZMvhCIIt++NXolKrC2fGvLDFu
         TWxZGvXWYmITPevTnTP1fvsocq/aa/R7bTFN7y+V3svhsrpnBTNpNSsHvp21s98yE9sk
         nX2CCLUXeo0+0/PlCcN/HFv4nwxSWXGH1mVKBwe5AK3SWjLCRsaC86PSratPCVTBanpG
         8KBe4mPTNyVrz8Sj8N8/D7hMbsl92BnG5jlL1hzDzHkbTb214yMXCm8XH1OxaHIDcEWF
         WS127O322sh0Y4jPnsWNYoXSKf2p77dYToVuJ9y5nJ/nYLmwGwM8GTXks3u4yFu3I/lx
         frJQ==
X-Gm-Message-State: AOJu0Yyc9vRxJrsL35oEGRWvlyvgJPKpOd+Z8zUHrEpWnPLfKZNr4HjG
        sV0IuYlSSzCsyoOSKWsvNFBdbjl5zj+0Jk+6Z2E=
X-Google-Smtp-Source: AGHT+IEKE+XCvxCtmXJO+rvvHv5Ifn1+auM+4ZurnpxJ8t+aLjhMPMETigx/CB4V/gfiHQTOepYw2A==
X-Received: by 2002:a05:600c:4b1f:b0:401:bcec:be3e with SMTP id i31-20020a05600c4b1f00b00401bcecbe3emr598796wmp.17.1693940017155;
        Tue, 05 Sep 2023 11:53:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
Date:   Tue,  5 Sep 2023 20:52:57 +0200
Message-Id: <20230905185309.131295-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
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

The process of converting all unauthorized users of struct gpio_chip to
using dedicated struct gpio_device function will be long so in the
meantime we must provide a way of retrieving the pointer to struct
gpio_chip from a GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 18 ++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9715bbc698e9..408f8a7753f9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -246,6 +246,24 @@ int gpio_device_get_base(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_base);
 
+/**
+ * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
+ * @gdev: GPIO device
+ *
+ * Until we can get rid of all non-driver users struct gpio_chip, we must
+ * provide a way of retrieving the pointer to it from struct gpio_device. This
+ * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
+ * chip can dissapear at any moment (unlike reference-counted struct
+ * gpio_device).
+ *
+ * Use at your own risk.
+ */
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
+{
+	return gdev->chip;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_chip);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 47906bc56b3d..bb9ec741bfda 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -782,6 +782,7 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 /* struct gpio_device getters */
 int gpio_device_get_base(struct gpio_device *gdev);
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

