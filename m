Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E572738AD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729850AbgIVCfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbgIVCfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:35:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAA3C061755;
        Mon, 21 Sep 2020 19:35:08 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k14so10691884pgi.9;
        Mon, 21 Sep 2020 19:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxFGP77mHktaAR7WX6vWj7VITnrOOL1DChoD0Wvv/jQ=;
        b=cKP/k1N65DYISUNTn0dwWZpeWEfHJ98KEVI/ysRQTElWBof5KfvXIwNVxprGBNij3w
         3lehKOIQrZA8fIr5sGgzhfKFhAtwOE4E/n/941zH73HMlMh+1QH6W3n1afIYZYpCeDeJ
         /70OpZqtFtQ2+UWB4MLC3zIw15E6Ej8C5CzIM6tjKtGMgLjdaw4V/YSAXhQM32/4xlcy
         pT99dM90ZAWzOXdsBVwUNMdA3XfXHaOjbrJDTn2obSC9HIsGQgnpvxkFcKYBnPpSavkt
         PS9eTTaU86LkQXZD8RxPP/DJTHZWJ/rQAzXMSehbzhKj3LjrJwjXXUIFGpuaEaPMswMX
         ckew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxFGP77mHktaAR7WX6vWj7VITnrOOL1DChoD0Wvv/jQ=;
        b=SsuluycfpTNf1xIFHBerKXg69485G9LZb7Ixxl7LHnL313b/B1CrDzGi3Yqyl9Kgfg
         3sDXiwMF8kDopb99rorMUucedylDZcfItolmtiNs1r97ZHZnvPme5HvS2JnzndcisQ5S
         6msrjhgQNqUFgUlj+b82zu9I+hATst6BOLb0fA9beHmM3TZTqtwPOa8Q59WuoHXeoWGF
         JS5hKVCEZeTq7KP0ppb6FrhAAolClY+9pGXJymtZSJpQl8AtK4LrRGnGXc8B0OBC2aMK
         E60oCwVwN8G8x1oCjU3fo58OKLUfirS3npc1y1yk55rGzNL13zkfY7QTETcHjM/y40mQ
         pk6g==
X-Gm-Message-State: AOAM530BGHf54418b/uM3IsfBnVBv370HBHvc6QIrRx37Bj2gqNBs83R
        qQp45ovZzTFkS2+vOy4fmOgx9R0dabhvbA==
X-Google-Smtp-Source: ABdhPJymxJGeNosuLh4T58O4DUG/dUtkMZDEd22ZYYlAV0ZbVieXshr1ROcb/0uYsvD3J1LRUvt4EA==
X-Received: by 2002:a17:902:465:b029:d0:89f1:9e2a with SMTP id 92-20020a1709020465b02900d089f19e2amr2603359ple.6.1600742107824;
        Mon, 21 Sep 2020 19:35:07 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:35:07 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 05/20] gpiolib: make cdev a build option
Date:   Tue, 22 Sep 2020 10:31:36 +0800
Message-Id: <20200922023151.387447-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the gpiolib-cdev module a build option.  This allows the CDEV
interface to be removed from the kernel to reduce kernel size in
applications where is it not required, and provides the parent for
other CDEV interface specific build options to follow.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/Kconfig        | 17 +++++++++++++++--
 drivers/gpio/Makefile       |  2 +-
 drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5cfdaf3b004d..e4debd66d71f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -66,8 +66,21 @@ config GPIO_SYSFS
 
 	  This ABI is deprecated. If you want to use GPIO from userspace,
 	  use the character device /dev/gpiochipN with the appropriate
-	  ioctl() operations instead. The character device is always
-	  available.
+	  ioctl() operations instead.
+
+config GPIO_CDEV
+	bool
+	prompt "Character device (/dev/gpiochipN) support" if EXPERT
+	default y
+	help
+	  Say Y here to add the character device /dev/gpiochipN interface
+	  for GPIOs. The character device allows userspace to control GPIOs
+	  using ioctl() operations.
+
+	  Only say N if you are sure that the GPIO character device is not
+	  required.
+
+	  If unsure, say Y.
 
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 639275eb4e4d..6c3791a55a7b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -6,8 +6,8 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
-obj-$(CONFIG_GPIOLIB)		+= gpiolib-cdev.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
+obj-$(CONFIG_GPIO_CDEV)		+= gpiolib-cdev.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
index 973578e7ad10..19a4e3d57120 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -5,7 +5,22 @@
 
 #include <linux/device.h>
 
+#ifdef CONFIG_GPIO_CDEV
+
 int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
 void gpiolib_cdev_unregister(struct gpio_device *gdev);
 
+#else
+
+static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
+{
+	return 0;
+}
+
+static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)
+{
+}
+
+#endif /* CONFIG_GPIO_CDEV */
+
 #endif /* GPIOLIB_CDEV_H */
-- 
2.28.0

