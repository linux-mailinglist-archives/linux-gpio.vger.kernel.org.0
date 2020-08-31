Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B538A25721D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgHaDWK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgHaDWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:22:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2531AC061573;
        Sun, 30 Aug 2020 20:22:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x18so1148128pll.6;
        Sun, 30 Aug 2020 20:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=dISBQPHvTRwEQjNEL7NQnQtpSF6ry3Hv5MeQjShK/lMe2xu+Be7YLSZHueCWHT2KNv
         lRsI7+gGANK+qRy0n4H6B7Ls7916A6HCY7YQtzgyLVL6meLCmzmZBgDruvD/aki04tc2
         CaeLrN0eyFWLiD2YTfBvt8mU3Wj8Vr5XNYQPoxVCM2eH+fI8UFLck62pL+k5eJuDo7dZ
         YA2YK4N8gjrDoydHG4XllrMmtepyJRu1vNs5RZMcU6A0rE8URS0m6npov0abgiYQ25Zp
         DZzUhrZIShwj2qPrkH5Mc5C9TTLrjLdYo2m5Do9e1/eZxIJbh1VtY1aa272fJQk5cuvt
         cMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=ZrZmzD7HIXSTiDS+vNGd08k7ceIPZjZ0Ic9LIwHd65BsLiYzRThgK6wVPGXvnzMPXk
         qelXaNfZh49izaJyFfDUbhJBMVNeac9X8Ml0bck3quaAH9Pv+p1G7a4i7ZtSbPAQWUyl
         ec9pGonhFmn0Xe/FIUVMnr1vlepO8xlSBtikzfibF6pumTa8I8asTQXeA6hbJ8dUFQ4g
         xQumLTabbkBb1Ndzkyhf3n+JyPZ29KhIWSs+akDatxxFaV5Qhaj9PLL2GSMErsyZKGYR
         m6uGSaAmy4LSDt8DaKoFZW0mQ4ghX89SAV4lUaBg66dMQPYI4Xx9KvftJtGnXL6E0tU/
         rx1g==
X-Gm-Message-State: AOAM531ELrvxbR4YUP7U3DBwpBIElpDYCoxhih1mllAlmIi68t/tmFuJ
        5qn3JOiVuXilFlpZe8/AzPNUZxqUFUA=
X-Google-Smtp-Source: ABdhPJyUDpLQnM5AC7tHa6QQPlbtZXrmyq3Ve+OFi2GHzqjlSxaAIi/rDyZaVg0Yaa0t4konMIx5Ow==
X-Received: by 2002:a17:90a:8044:: with SMTP id e4mr7313644pjw.50.1598844128274;
        Sun, 30 Aug 2020 20:22:08 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:22:07 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 05/20] gpiolib: make cdev a build option
Date:   Mon, 31 Aug 2020 11:19:51 +0800
Message-Id: <20200831032006.1019978-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

