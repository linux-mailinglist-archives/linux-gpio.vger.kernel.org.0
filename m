Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF40262D0F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgIIK2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgIIK1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20EDEC061573;
        Wed,  9 Sep 2020 03:27:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k15so1741493pfc.12;
        Wed, 09 Sep 2020 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=aj1kqdSKGW9RlMCn/4c4Bx9FhFI9VyCQPIOIccTgs4V73dlFT0Yg8hioxJe7mQhkz6
         MHQKK7wTcumJo2OYjlsxYuSwwwyy5rkfr4UAJUGW2Ha5DJtAmASjg+hTxKmzDR1lgEjr
         u7cE87TZZoRs6/8eijAGURONjkWpKg0oJA0RwjVIBF//b0finRtB2/BteIEFJTpLtRCC
         H1Ybfq/loPHBicefMiuIcLT/UJSfvThbfRRcnvrjmE9+rWHHIplAcC/36p8ezhWLSvKR
         sfp0tHVBhi2To/ySWV4prFD/ig3nEKNyf9k/75Ts6WFzyie4uQR7rRs+J/AGeC99mgQH
         n4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mahJTp06HPHqdZLO7HoqnJn70jmcNWgtVnqEZw5yr3s=;
        b=h9AmDlGc7VQa+3SbsvPb4TMO0g/2gQ4Qr4yMNgyqdnJijTFISOK/6/vYvbm6is5Uu6
         j6ZT6HqW3yC/uWIjSolyXdAnDZQDnUyM0UtXVMti05lDFnWaUnxtVXjvMbjmqR994D7f
         9pGoMHVVLH4wwpyIoRUz61G5sVNM598dFy0pKUFHSfHtrD/xS041FxnbnFptA2aRbZcL
         mKSd8SmLZugPPCmLhDhsiL20p6+OS2nA9v/baG7xL+1AajBPTTVT+hfGH/N7qJ0mAWMx
         wdYDjonPZrHbhf6Z4utCdzzPtZTxInCxkHe7LDgDcGoCSYhoJ7gDPLIjDVDCEsUr6p3V
         L3gQ==
X-Gm-Message-State: AOAM5307zwaMrNUsOU4v3X+Folb+95KgfwRqmk3bTdqhJojS3KtYQXxi
        k0WHSrvXibXH72RBlfunSjT/eh2ZJhs=
X-Google-Smtp-Source: ABdhPJwySw5BH0U28/Je6qhezNG/YBm53DcgSFKIZjxYiDH3p08ztv8SKckz1v+MwGiK78kFtSHAsw==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id k22-20020a056a001356b029013e5203fba3mr299643pfu.3.1599647262251;
        Wed, 09 Sep 2020 03:27:42 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:41 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 05/20] gpiolib: make cdev a build option
Date:   Wed,  9 Sep 2020 18:26:25 +0800
Message-Id: <20200909102640.1657622-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

