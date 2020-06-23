Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288B720484C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732238AbgFWEDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWEDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3DDC061573;
        Mon, 22 Jun 2020 21:02:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id j1so9475033pfe.4;
        Mon, 22 Jun 2020 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxbG/alpyh65wk8Ps49yAUmvAFYWQPecHIKYzatWDSk=;
        b=ZznF67kk5wPX1q8IDvgJgnxHPWBTI0Ob0hfL3xrG5FpynNwUvv8MyNPx07nbP6cFdN
         NRACFiik1t+FaOt+0Kj8IQpSYr3Vyo/faPzTCgjfsSCtZZmC0hGLKl8BCqNJyHOL64yt
         Fk4guV+4GJYVsnZRe9OeYrNfjyPe6kVjbvK65QS1aNR+UJRWtoYeqsWh8yFeoe36+pK8
         pkGEqckl7aL6wNN83DLotmvGpt70cH02FjllJagVg0UNSQqQTXoxviELOWVhSN5G2bA9
         CGYGQzqo+Q/sQ2Shqsljl0Fjq2DkmPyuncZwEhxw0HU1W808jHnerZjUnZd16+S+hO9n
         LH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxbG/alpyh65wk8Ps49yAUmvAFYWQPecHIKYzatWDSk=;
        b=a3T1SlDnzKyUC66hn9e7I7d3E7i3WVKxN1fG563XJ9lft24j/duHbzjSKJne7FV6NM
         p6Rsy5W2JW0aUUSJFeabdtMYUY47CXUS1le4G/PY7mP4rAlGD75gMmhKn39/nhNUyRmn
         xYofAFA/NRri1eq9s/1zarAsCq/5ZamKcExddme4n0qOikNIpFEs3ZWGTJ44aR66NIUw
         fZ9tRhFsmSe8nPlcdlsuNJOUqc2wP26Z3SQlpPN+odahLOi5ihLE5n48z6hjG8krB6Hd
         s+BRgbZbsvXBWWL7513d9yAvRnjFhbvlTZEhXmMT64ycWmwTwnYVTuqx5eZRZGR+wKL3
         BlJw==
X-Gm-Message-State: AOAM5335PZIQb8vQA6crOxvEvaqOA5+ij8bwaggsll3o33ywcxk9Gw5Y
        bVgDnrRTP6V8A/c0kIwCuxzvGAkegTs=
X-Google-Smtp-Source: ABdhPJxKRoSfYvspmbu3zv7dccNeVaWtIYX+6N6NpG+eqoQTrDNnKjps4x2YHDuz84TF/Z9kGVzOCw==
X-Received: by 2002:a63:f050:: with SMTP id s16mr15164625pgj.261.1592884978812;
        Mon, 22 Jun 2020 21:02:58 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:58 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 14/22] gpiolib: make cdev a build option
Date:   Tue, 23 Jun 2020 12:00:59 +0800
Message-Id: <20200623040107.22270-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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
 drivers/gpio/Kconfig        | 16 ++++++++++++++--
 drivers/gpio/Makefile       |  2 +-
 drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c6b5c65c8405..affc1524bc2c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -66,8 +66,20 @@ config GPIO_SYSFS
 
 	  This ABI is deprecated. If you want to use GPIO from userspace,
 	  use the character device /dev/gpiochipN with the appropriate
-	  ioctl() operations instead. The character device is always
-	  available.
+	  ioctl() operations instead.
+
+config GPIO_CDEV
+	bool "/dev/gpiochipN (character device interface)"
+	default y
+	help
+	  Say Y here to add the character device /dev/gpiochipN interface
+	  for GPIOs. The character device allows userspace to control GPIOs
+	  using ioctl() operations.
+
+	  Only say N is you are sure that the GPIO character device is not
+	  required.
+
+	  If unsure, say Y.
 
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ef666cfef9d0..45eb09808d12 100644
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
2.27.0

