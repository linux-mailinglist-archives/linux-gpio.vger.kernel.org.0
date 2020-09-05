Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED65325E817
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIENsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728628AbgIENh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:37:29 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E00C061251;
        Sat,  5 Sep 2020 06:37:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m15so1310850pls.8;
        Sat, 05 Sep 2020 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=VhjecIEXaQvS+vhxDXKUIVBlO6x0YQ3CrZTchbxRcDkhun9fUOe3XqBA08nMwU2v7j
         zb9Q7AbFosOHMZuuDNxoAkdHToI9+oXlbyVIcVKS0FI3rw7N1rRPHDHudAYIiMB1tJ/o
         LmD+0Hd96sW2mlnjnAZzDe2RWy43lRW27vUuRQKpjiGl4A9Osww8vzqdiMPQ5cCqF0m3
         /97l/9bQ5LQv8dqA1EBRd1mLPeq0Q3KdjASBccKYHQbn2lvefSdshEn1ZRzgHno8XiD0
         K9P3CuxNZ/N8rz8C3b3VYPeCLXhomtvzpm8KSVs+TlFwr2TbKM1TyadBwg3YSMRjlJIO
         3+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=XF2r8WLLQ8eSm/Qbo2F7/M4SGgAelw59+8hTFhQ+oxxwjucSqYyrLIMj6bQxxBAZaW
         xg/vglIeFznoIh8YH6KW+0NXA47kCBVlxLQUkWSTZTqY08tw5vd9qSMbxxP8D7ja550m
         1NHDbCYZwe0wgyXwSe2NJf8hGtfvwAYiEn44nwsGxFKpq//M2OSqMcF54e4w+vjm8r9I
         RENj1FN/03t7Ef5u7oWxGRng1MUYyhP1GQID3YDYiaLqVNBYzNACTvXueBIeEFidzftQ
         v5GDDkCXEJSJEpO4rnOWzlUbJgOhnqsl5IcVrq4FFbFBHti+hJ7Yc3QWJkA5hxzuJ69y
         pHlQ==
X-Gm-Message-State: AOAM532nf3luYb4hFhBmq414eigr+9T9cBgw1LRRHQrO5jhwoAtm6Jxm
        7cf4o4BdZP1iQaPvtQKVRzVYpMNdZ8E=
X-Google-Smtp-Source: ABdhPJyuF4FdlxziykFSqRdhQ7Vucij9+RZRB+55Uw71CiujqCqEWsr0XTJ6vAZAPMh7yWAiDyEmaQ==
X-Received: by 2002:a17:90a:e512:: with SMTP id t18mr12627322pjy.141.1599313035271;
        Sat, 05 Sep 2020 06:37:15 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:37:14 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 05/20] gpiolib: make cdev a build option
Date:   Sat,  5 Sep 2020 21:35:34 +0800
Message-Id: <20200905133549.24606-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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

