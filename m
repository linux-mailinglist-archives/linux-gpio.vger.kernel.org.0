Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C654D5521
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 00:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbiCJXKq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 18:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbiCJXKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 18:10:45 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183F7199E1D
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 15:09:43 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id s8so6364434pfk.12
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 15:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7LiQIBbcew2mGSq+LilRTu8Qe2wE6QDZb9zt9G8/8Q=;
        b=k1KVwhDUBABfocoe3O5OaLp3fH3zb9v0V1038OhFPwFWJSScnpQThxO+VOCZaDtJzp
         juWJz4LK55ekAI0uS4czUK6vsSm4Sz80/DRqyrYbbjYPLTOGfXq4O3rCHQh8inFer4x6
         njDdnvMOIf2obeoKAKayO4MO1boXn2loNRcOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7LiQIBbcew2mGSq+LilRTu8Qe2wE6QDZb9zt9G8/8Q=;
        b=CFTrjiXEYXxorgYWCr16eL+s9OJf3Eh0SUeFY8Tuhrsf9BUdExVoII548mLIbHPJGg
         EHJGH0k3/9LRqBgcdk3KV/yRCvBkqQJ0beWt6jslISOYFd81fTQWWGy3icDQ9bb1qf3Y
         Rnq98lS/vfa3CuxckXbYybOLsZKmiNoSgV8xC5a6S8tIUinxIdYoXE4oDIYZIiBAm2Kc
         YpIHRyRKYhoXjP0eJxdOQHc4CPyVZ0mJ4W9v35bvLeMgfS/v0CvtaWmVrNNld/mPVz4w
         sGHFX/4drKFHQFmwblGTdFbr6LmLK949q7v1Xs5tXlNwa85bDChhuta7AWv57j//klfB
         n5ZA==
X-Gm-Message-State: AOAM531ZcaUHZUn0E+VmvLxrnSGY5x3F2juHjwjRbzH+9JvDynedDpWt
        g69MXVZlSzkmUvYPDTWbDeiHrA==
X-Google-Smtp-Source: ABdhPJyc6H0mRROiNN93OhIpMsoW5Bfr2YU66HbzmVphaSocg40xn7SzX171qRaIrLOBdmsIUzoRtw==
X-Received: by 2002:a05:6a00:703:b0:4f7:299d:46af with SMTP id 3-20020a056a00070300b004f7299d46afmr7076526pfl.25.1646953782506;
        Thu, 10 Mar 2022 15:09:42 -0800 (PST)
Received: from localhost ([2620:15c:202:201:7181:d34e:52c2:be45])
        by smtp.gmail.com with UTF8SMTPSA id 14-20020a17090a01ce00b001bfbffc1331sm4695586pjd.46.2022.03.10.15.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 15:09:41 -0800 (PST)
From:   Brian Norris <briannorris@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>,
        linux-kernel@vger.kernel.org,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH] gpio: Drop CONFIG_DEBUG_GPIO
Date:   Thu, 10 Mar 2022 15:09:37 -0800
Message-Id: <20220310150905.1.Ie0a005d7a763d501e03b7abe8ee968ca99d23282@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CONFIG_DEBUG_GPIO has existed since the introduction of gpiolib, but its
Kconfig description and motivation seem to have been off-base for quite
some time.

Description: it says nothing about enabling extra printk()s. But -DDEBUG
does just that; it turns on every dev_dbg()/pr_debug() that would
otherwise be silent.

Purpose: might_sleep() and WARN_ON() should have very low overhead, and
anyway, there's a separate CONFIG_DEBUG_ATOMIC_SLEEP for the
might_sleep() overhead.

Additionally, the conflated purpose (extra debug checks, and extra
printing) makes for a mixed bag for users. In particular, some drivers
can be extra-spammy with -DDEBUG -- e.g., with the Rockchip GPIO driver
getting moved out of drivers/pinctrl/ in commit 936ee2675eee
("gpio/rockchip: add driver for rockchip gpio"), now some dev_dbg()
calls are enabled in its IRQ handler.

Altogether, it seems like CONFIG_DEBUG_GPIO isn't serving any good
purpose and should just be removed. It can be supplanted by dynamic
debug (which post-dates gpiolib) and atomic-debug facilities.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpio/Kconfig   | 11 -----------
 drivers/gpio/Makefile  |  2 --
 drivers/gpio/gpiolib.c | 30 +++++++++---------------------
 3 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ad99b96f6d79..ef91cc3066f5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -47,17 +47,6 @@ config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	bool
 
-config DEBUG_GPIO
-	bool "Debug GPIO calls"
-	depends on DEBUG_KERNEL
-	help
-	  Say Y here to add some extra checks and diagnostics to GPIO calls.
-	  These checks help ensure that GPIOs have been properly initialized
-	  before they are used, and that sleeping calls are not made from
-	  non-sleeping contexts.  They can make bitbanged serial protocols
-	  slower.  The diagnostics help catch the type of setup errors
-	  that are most common when setting up new platforms or boards.
-
 config GPIO_SYSFS
 	bool "/sys/class/gpio/... (sysfs interface)" if EXPERT
 	depends on SYSFS
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 30141fec12be..f3ddac590ffe 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # generic gpio support: platform drivers, dedicated expander chips, etc
 
-ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
-
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 56975a6d7c9e..1e1a193987fd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -40,18 +40,6 @@
  */
 
 
-/* When debugging, extend minimal trust to callers and platform code.
- * Also emit diagnostic messages that may help initial bringup, when
- * board setup or driver bugs are most common.
- *
- * Otherwise, minimize overhead in what may be bitbanging codepaths.
- */
-#ifdef	DEBUG
-#define	extra_checks	1
-#else
-#define	extra_checks	0
-#endif
-
 /* Device and char device-related information */
 static DEFINE_IDA(gpio_ida);
 static dev_t gpio_devt;
@@ -2046,7 +2034,7 @@ void gpiod_free(struct gpio_desc *desc)
 		module_put(desc->gdev->owner);
 		put_device(&desc->gdev->dev);
 	} else {
-		WARN_ON(extra_checks);
+		WARN_ON(1);
 	}
 }
 
@@ -3338,7 +3326,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
  */
 int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	VALIDATE_DESC(desc);
 	return gpiod_get_raw_value_commit(desc);
 }
@@ -3357,7 +3345,7 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 {
 	int value;
 
-	might_sleep_if(extra_checks);
+	might_sleep();
 	VALIDATE_DESC(desc);
 	value = gpiod_get_raw_value_commit(desc);
 	if (value < 0)
@@ -3388,7 +3376,7 @@ int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
 				       struct gpio_array *array_info,
 				       unsigned long *value_bitmap)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	if (!desc_array)
 		return -EINVAL;
 	return gpiod_get_array_value_complex(true, true, array_size,
@@ -3414,7 +3402,7 @@ int gpiod_get_array_value_cansleep(unsigned int array_size,
 				   struct gpio_array *array_info,
 				   unsigned long *value_bitmap)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	if (!desc_array)
 		return -EINVAL;
 	return gpiod_get_array_value_complex(false, true, array_size,
@@ -3435,7 +3423,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value_cansleep);
  */
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	VALIDATE_DESC_VOID(desc);
 	gpiod_set_raw_value_commit(desc, value);
 }
@@ -3453,7 +3441,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_value_cansleep);
  */
 void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	VALIDATE_DESC_VOID(desc);
 	gpiod_set_value_nocheck(desc, value);
 }
@@ -3476,7 +3464,7 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 				       struct gpio_array *array_info,
 				       unsigned long *value_bitmap)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	if (!desc_array)
 		return -EINVAL;
 	return gpiod_set_array_value_complex(true, true, array_size, desc_array,
@@ -3518,7 +3506,7 @@ int gpiod_set_array_value_cansleep(unsigned int array_size,
 				   struct gpio_array *array_info,
 				   unsigned long *value_bitmap)
 {
-	might_sleep_if(extra_checks);
+	might_sleep();
 	if (!desc_array)
 		return -EINVAL;
 	return gpiod_set_array_value_complex(false, true, array_size,
-- 
2.35.1.723.g4982287a31-goog

