Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EB023FE6F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgHIN0O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIN0N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:13 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F045C061756;
        Sun,  9 Aug 2020 06:26:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u20so3724468pfn.0;
        Sun, 09 Aug 2020 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/NSQWGG4Dd/lyfNZqBtWl2adXGHauiXHc+m8VldHKpo=;
        b=TJtouzsJaUaW1rCbzStfLacAtofj8ykQbA9mFhdSmoeme6A45VPAqmXFZKdOizcVta
         jPC2WPtL1dvPgHtmfJ2CPjN+S2UWhorLIjjA6KPdRIyAgBYmfN1CxTyLJ9y7JGMl44th
         qzAxWxQakEzsSsViFjkgia/lZTKOXXivBF+Ba45gTfJj/bo/aXkaenrcW9RwAlX4a3Cy
         t5fdD4KD/pLTT6jHJtZg9iNaRAqrJ9F6ExloK1nGDrH8NfQvpY8TUdDpv62EnNRQu37V
         5yPPrtV0jq63PgV+w8aRvKTeYPhCn+1RCXCuUdqu0G0hfyw0g1OUZGiCqbMEKMzG5CHs
         7YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/NSQWGG4Dd/lyfNZqBtWl2adXGHauiXHc+m8VldHKpo=;
        b=qcRRdHibLTHt6vQl1HPNMLK7AwltXXV0vE0o91t7TH1FsfqYmOR1xrhwvbdmVEiuyT
         zrDnzINl0qGovlyulqOxjJivdHDIbgwUMBQ0ffBtW4g+0j4364zDjpMvoVCcLx7xdrFZ
         HcV/KT0wOwoDyzNHpP20JlpBSrMH8s0kSyrmSIqRSPGVjvTN0dJD9i3EwpSpex8V7gvK
         Gc7vAiLQ8lqeaxpbh7NVJf5IyP/CfVZyG+cvViA5e+C0A5+6cO1oH6PUdutO7USOSeKP
         ITPfOwJI/s8236QoQOCvN6cQ8SDGy6nnHb0XD99UbxwKvoI2PoKpKHYolN98Ul4wvJaO
         Kcyw==
X-Gm-Message-State: AOAM533HtLuRjWrjy1pbdSoJ8B7ypY/5ZvweyfMr6CQAId7E8GEkONrr
        AyFyL33WboriKPHZEPjHMmiPsAXP
X-Google-Smtp-Source: ABdhPJwVpxlHg0R/DAhnOZgY3HV5Sqqs2q9yyf8rj2mNsZnZZvZIg2gA/Ox/9iIk+DPzA6gGjOUv+Q==
X-Received: by 2002:a63:a53:: with SMTP id z19mr815372pgk.67.1596979572521;
        Sun, 09 Aug 2020 06:26:12 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:26:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 03/18] gpiolib: make cdev a build option
Date:   Sun,  9 Aug 2020 21:25:14 +0800
Message-Id: <20200809132529.264312-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
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

