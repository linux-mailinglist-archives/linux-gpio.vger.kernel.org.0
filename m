Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38DF27A4C4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgI1A3b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:29:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806EBC0613CE;
        Sun, 27 Sep 2020 17:29:31 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o25so6813976pgm.0;
        Sun, 27 Sep 2020 17:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxFGP77mHktaAR7WX6vWj7VITnrOOL1DChoD0Wvv/jQ=;
        b=klGlzmAOCMbywlsF8JCt9Ubil5NBFhAqheKoKtbYrnKx84SnVTAv6yFEeLkCfLG38E
         nswiVPnnxwyxwmIMadSUAvVYoR/LZ+83JBg8AJGOq4VUeOcmnvhl7xYkCR1vzOc0m9cg
         zmHe5XPYJzahhSfv2Gy5KZy9RE/MR0fBWIVOAERIMgAcJqU4O3nY4Lj+IjXNBO0cB5dG
         LFp8RgZG7wc4PQ7L3BdFOgwu4TzDwuqPjR7tC+oGPaOQ5n64ukv3/o6agg/xdGwBEqWN
         Jslw+4ef37OhdwlzjzN+cdZglpDy6+Zt5+AsrrP+16CWOMXUBeQFFksOio/Mman7p6ee
         fDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxFGP77mHktaAR7WX6vWj7VITnrOOL1DChoD0Wvv/jQ=;
        b=OEw8XwQuxDujKjcliR75HIlKO4G1+iG83v6X1B9939IiXNIUEkDiPgsL+4gwHZu4fn
         sBd5pwQUylKCCRKUsht9PuVAS/K9jp8/j1qS88RT20kDtaWO1GAUBzonP4X3Oh+07CdU
         bLqmc7B2qRGiMlc+j7O9QwnKnU+YB+JmK20yC6Jun3OMhewBxgIab6Ea9AWF9LmRpfkA
         PSkLytrqiJ2NS5SA50UonsmA2pfhMYKd1UQl8Fu0T0IaUySvXGE2cCuwuwV+Rf7WceuF
         gIaoXKrox2seVGpav8h4s03PQRCCaqMxBulrQ0owH6xlutiWXErdeFcksoONvSi72LPg
         BP3g==
X-Gm-Message-State: AOAM5308nda4X6LcY3GpNXtFjqeSoT2gXbrehkniJoTqloEHyjTVY48t
        KPkV1yYHPR4LqGatV7MUX0o39CMkqctavA==
X-Google-Smtp-Source: ABdhPJytxyX1bIEMGDN9qRpgr1CFqg9gimUj/Hwe9sHJYupFGropqFr2Fr3kk2esqR07qKM04vi7XA==
X-Received: by 2002:a63:e602:: with SMTP id g2mr7305948pgh.427.1601252970622;
        Sun, 27 Sep 2020 17:29:30 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:29:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 05/20] gpiolib: make cdev a build option
Date:   Mon, 28 Sep 2020 08:27:52 +0800
Message-Id: <20200928002807.12146-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
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

