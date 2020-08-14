Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73792443B8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgHNDD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:03:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C85BC061757;
        Thu, 13 Aug 2020 20:03:59 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q19so3558117pll.0;
        Thu, 13 Aug 2020 20:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/NSQWGG4Dd/lyfNZqBtWl2adXGHauiXHc+m8VldHKpo=;
        b=Ywc50p8q2t0qU0e6/oegr6rKEKFA3JlQVb5hQYT3OatbH6pCT+Wi3Vmwt+J2lyqPrY
         6p+XI8YCMnZh06kvAkXSXBVXLVPoUuuDuahRs9qk6W3qhmsP/ML+UI5gImEPvmeyHwsE
         xPQmR/zI4OK/6pGH5o2+ckZhsK4UV70/veorBo4j1nrkFXRU07ka0i8ke8LSI2Jr9rOM
         /9UjwmJAlH61foUtY7GnBxtoBt/NxjAMs61YftDbS1X4LYJKMRXZDR2sCKIq1/VcENXA
         0aihl9Jb7FYU14a+8SbgU3UcyiggH2MmsqLx7d06RVb+6nOdbTsAoRi9asF7da6C5m9M
         Jw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/NSQWGG4Dd/lyfNZqBtWl2adXGHauiXHc+m8VldHKpo=;
        b=Qlde+mJeKgOlQ+x5/Sjt4QoaHqMkiKFrBDDszdpOiv14eWMMghUnvc9xt4a6/FBUha
         HQq+YX5ygRT4T5QzlMsB0fOUywz0dKOJVISb3+tC6MquRWfWi17+NQweNdtEza+TJ6pz
         6ru0Xu13QacU0pjazeioU7mqS8yCDDgObymbZJ7A8E8OjTueNccAl05s789rNzf37taf
         jKKcARR4kJw5nuMAQIm2P7bkuTnk+ntyMRkm6vdCM69H4vBrzJ2+qXNzRR6MzimWKwdC
         z4x801oiBI/1xsDtvRFvnAt9XpAInDMojMPCJ/9IgM+VOdT5sFqyJMd/N6KQltfsPv5S
         2JrQ==
X-Gm-Message-State: AOAM532hLCircdyADSvd25sd0vUnOpa+438iybeEuOqIByG2WJseKLny
        hu43Hq+c6R7N2hRpqhXbPAfZEA3+
X-Google-Smtp-Source: ABdhPJwyZIQwSUKaVlDKRond0uwUd1ZJP5aUtzmYiKalk9o5AhbJK37CN+A3/kBI5kFc+NhIs4nBPQ==
X-Received: by 2002:a17:90a:fa92:: with SMTP id cu18mr545693pjb.215.1597374238221;
        Thu, 13 Aug 2020 20:03:58 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:03:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 05/20] gpiolib: make cdev a build option
Date:   Fri, 14 Aug 2020 11:02:42 +0800
Message-Id: <20200814030257.135463-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the gpiolib-cdev module a build option.  This allows the CDEV
interface to be removed from the kernel to reduce kernel size in
applications where is it not required, and provides the parent for
other other CDEV interface specific build options to follow.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/Kconfig        | 17 +++++++++++++++--
 drivers/gpio/Makefile       |  2 +-
 drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8030fd91a3cc..8e409b9c33dc 100644
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
index 4f9abff4f2dc..7c24c8d77068 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -7,8 +7,8 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
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

