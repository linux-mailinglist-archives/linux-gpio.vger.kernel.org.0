Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4C04A6F2C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Feb 2022 11:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbiBBKtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 05:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiBBKtt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 05:49:49 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D1BC061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 02:49:48 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m26so8662603wms.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 02:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmG5+Yu9O6od++yLotKOilZ6kU5LO8ItbTpwXZnjXzM=;
        b=Bw9eiTOjuBjMKvR+UYDafmsvNZN/Hfgiphr9P6vtkA83pmVqhYWj8LkXr+jG1KFt+r
         sW91uLIfnzaK2VfaDvrf850XZFaZ5eZOu1MC6oBSEqQp439d+c9c/0r5Dp67cYC8ApKi
         F2oECG5HXJegxapkbREus+ECYvAZDGu1IUI/WWYZck9uYN+b2PFiNSfAhhDKP50diL9k
         iEYwCti3vPX91Gfg4Ol9wAftdaKoVPBXK1fhEbbBymPrvUNPN/kh6st/JBEk9hRnGvwO
         bT1R4tBfMjr0zdaGyrUTCKkqju8GJkk/PvozP09KQo+2buiQ+Wle1/VXwtKjwLoglZxU
         7oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmG5+Yu9O6od++yLotKOilZ6kU5LO8ItbTpwXZnjXzM=;
        b=J7W5LB0WtWYx8NMjSrqLHIQreTS25wmaAL+9LtXiSp3iezHwAFMtLj3rvCzV0xdS4W
         udhmRQUdPIXtVyCU3zn0dhTcyG6Xk365bOpPjHSFVXTnGypyvX6HRVMVtJ7Z1qxz4rH0
         sHyh95aRXtFOya5KyjRL9Kvb5GifIeUqWHTULinqJ1izvO6YPTontSrFSduKopeTaZFo
         214dSPQHAXvyy9pwfSPjiEXvIeHRI+9hP6hKyMz2pDt6jdwhPLht4wU3xJqy6UjzXLpJ
         nLo5JJ/9OIIp1Nh9Thty0nrTdy2pTtKM7JukdIt3JLLxCJ8A3PIvEl7cOn3IaxXtpGVE
         kZHQ==
X-Gm-Message-State: AOAM532LsCrzT5BcDW/C4nvgSGhdeYjzxWxX2DrtxeIruQ+WBUN/FY9I
        mGWJSuRRICg71TE1it75zKUZHg==
X-Google-Smtp-Source: ABdhPJz3S34pUq6FStibNUeHVXuQu+iN3m0Ion+p0J/kYJgHHL1rk88XSWm+Nl2LvumF85kg1DbTOQ==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr5507051wmi.74.1643798987229;
        Wed, 02 Feb 2022 02:49:47 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f16sm5668548wmg.28.2022.02.02.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 02:49:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: make struct comments into real kernel docs
Date:   Wed,  2 Feb 2022 11:49:37 +0100
Message-Id: <20220202104937.146827-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have several comments that start with '/**' but don't conform to the
kernel doc standard. Add proper detailed descriptions for the affected
definitions and move the docs from the forward declarations to the
struct definitions where applicable.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.h        | 31 +++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h | 35 ++++++++++++++++-------------------
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 30bc3f80f83e..0025701b7641 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -72,6 +72,20 @@ struct gpio_device {
 /* gpio suffixes used for ACPI and device tree lookup */
 static __maybe_unused const char * const gpio_suffixes[] = { "gpios", "gpio" };
 
+/**
+ * struct gpio_array - Opaque descriptor for a structure of GPIO array attributes
+ *
+ * @desc:		Array of pointers to the GPIO descriptors
+ * @size:		Number of elements in desc
+ * @chip:		Parent GPIO chip
+ * @get_mask:		Get mask used in fastpath.
+ * @set_mask:		Set mask used in fastpath.
+ * @invert_mask:	Invert mask used in fastpath.
+ *
+ * This structure is attached to struct gpiod_descs obtained from
+ * gpiod_get_array() and can be passed back to get/set array functions in order
+ * to activate fast processing path if applicable.
+ */
 struct gpio_array {
 	struct gpio_desc	**desc;
 	unsigned int		size;
@@ -96,6 +110,23 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 extern spinlock_t gpio_lock;
 extern struct list_head gpio_devices;
 
+
+/**
+ * struct gpio_desc - Opaque descriptor for a GPIO
+ *
+ * @gdev:		Pointer to the parent GPIO device
+ * @flags:		Binary descriptor flags
+ * @label:		Name of the consumer
+ * @name:		Line name
+ * @hog:		Pointer to the device node that hogs this line (if any)
+ * @debounce_period_us:	Debounce period in microseconds
+ *
+ * These are obtained using gpiod_get() and are preferable to the old
+ * integer-based handles.
+ *
+ * Contrary to integers, a pointer to a gpio_desc is guaranteed to be valid
+ * until the GPIO is released.
+ */
 struct gpio_desc {
 	struct gpio_device	*gdev;
 	unsigned long		flags;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 3ad67b4a72be..3ffb054fafbd 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -8,27 +8,16 @@
 #include <linux/err.h>
 
 struct device;
-
-/**
- * Opaque descriptor for a GPIO. These are obtained using gpiod_get() and are
- * preferable to the old integer-based handles.
- *
- * Contrary to integers, a pointer to a gpio_desc is guaranteed to be valid
- * until the GPIO is released.
- */
 struct gpio_desc;
-
-/**
- * Opaque descriptor for a structure of GPIO array attributes.  This structure
- * is attached to struct gpiod_descs obtained from gpiod_get_array() and can be
- * passed back to get/set array functions in order to activate fast processing
- * path if applicable.
- */
 struct gpio_array;
 
 /**
- * Struct containing an array of descriptors that can be obtained using
- * gpiod_get_array().
+ * struct gpio_descs - Struct containing an array of descriptors that can be
+ *                     obtained using gpiod_get_array()
+ *
+ * @info:	Pointer to the opaque gpio_array structure
+ * @ndescs:	Number of held descriptors
+ * desc:	Array of pointers to GPIO descriptors
  */
 struct gpio_descs {
 	struct gpio_array *info;
@@ -43,8 +32,16 @@ struct gpio_descs {
 #define GPIOD_FLAGS_BIT_NONEXCLUSIVE	BIT(4)
 
 /**
- * Optional flags that can be passed to one of gpiod_* to configure direction
- * and output value. These values cannot be OR'd.
+ * enum gpiod_flags - Optional flags that can be passed to one of gpiod_* to
+ *                    configure direction and output value. These values
+ *                    cannot be OR'd.
+ *
+ * @GPIOD_ASIS:			Don't change the direction
+ * @GPIOD_IN:			Set lines to input mode
+ * @GPIOD_OUT_LOW:		Set lines to output and drive them low
+ * @GPIOD_OUT_HIGH:		Set lines to output and drive them high
+ * @GPIOD_OUT_LOW_OPEN_DRAIN:	Set lines to open-drain output and drive them low
+ * @GPIOD_OUT_HIGH_OPEN_DRAIN:	Set lines to open-drain output and drive them high
  */
 enum gpiod_flags {
 	GPIOD_ASIS	= 0,
-- 
2.30.1

