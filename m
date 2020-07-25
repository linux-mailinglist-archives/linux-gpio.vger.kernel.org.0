Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2882322D4A5
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgGYEVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYEVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:21:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A31FC0619D3;
        Fri, 24 Jul 2020 21:21:08 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id 8so6430872pjj.1;
        Fri, 24 Jul 2020 21:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gPyPg9qU2AgzzeDqfcPVd4VS2XNxmxnXokIDm7dUJ8c=;
        b=faS1GlbmeJdrR199/kZmt9A0ls7fL7Y9QCORC3/5MDfsTErIDoAb4lwEUS0kYAhamc
         I7QcmRL+VjPvYYnUkKVS62hDwGjEYDoYi4Jz1BuZBA2jL/HuRuRcyf0qxDYQRtIQiaem
         lwfl+2iE/+RZmeebm+Abjca6eKm/tulzToIYEyfZARdGPjXOiGlLgSoxuc91zPdSFjjs
         11F/A16xFz+ACTQHyHA9IgKV/IVvSGyAVjjb7vnAB5iIsncFaxI3uWoQR6Xcu2zM2KXb
         mx9ygJvSdiMwbTpzHj9EajUC/VPHO4YtfjlaredVJ4CHMIvmXjKJiqQ2A9RqNnw22YhF
         1edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gPyPg9qU2AgzzeDqfcPVd4VS2XNxmxnXokIDm7dUJ8c=;
        b=lwzaGVG9/tnRuc7uZgusREvpXhGoOspr4BqshAQcULd32rhbx3EHVFxmieJlZbFQxX
         /Hu8loMnj17m8rFth2tYIogGGg97rNRpKCx75uT4t12SOn/kQqIJ3vghDD4qyun+rHDi
         HbY/qKyKLnbaN3TjOrcv02yhpTsWQx6A3rREgBSPRAUmyZioI8t3gKuHBUW8h45vO71s
         z/yTIYqqAJMRVL5I8TcTp2J8YUG8HkrW6oK6wakYBaQrdRnj7jn4bVFi97Vo7gAnSYlS
         +xPgpDOFJfRqOrgCPxrSIYSDW+lDwvoessJJzjFEwygcxnbB1UYyKeEpM4GIPi8R8HFy
         /NLg==
X-Gm-Message-State: AOAM531IYedEzDNmkPWY+ZXuMX8VPMvZjlrBoTVvjPGfTRQH66VBuiPR
        DMrG9fmYRuvH/2fNfGBSKgykwnzH
X-Google-Smtp-Source: ABdhPJz7y8VwYa7BnOjwjbUYsfu7FFPycQWCO5oR5YAjGtjqWpBiqEC+MLDeFb4WDSxKWZNYm/faKg==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr8041495pjp.24.1595650867773;
        Fri, 24 Jul 2020 21:21:07 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:21:07 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 03/18] gpiolib: make cdev a build option
Date:   Sat, 25 Jul 2020 12:19:40 +0800
Message-Id: <20200725041955.9985-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
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
index 8030fd91a3cc..b5bb9efc1092 100644
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
2.27.0

