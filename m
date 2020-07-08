Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841C5217E04
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgGHES1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHES1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:18:27 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2889BC061755;
        Tue,  7 Jul 2020 21:18:27 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so3209302pls.9;
        Tue, 07 Jul 2020 21:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TkWCj0Bdn5Lz2ZliGZazF4ed6JK/XE2t/LI6cgr1fFY=;
        b=MEkPpF7fP8ow/4SxSqdeboniEZXY8gru0Mi32V/kLhyvHMimZghW5r9XKsHpH3FVx/
         fdf2t1wASilTmcG3nS7uJGMW5pYTF1Nx/MmCF8PWoraY2BcqmlTgTjc+2vRRH8P/z5XE
         OC8J2T6Ry4T8Vszj1squX7dwNaTwFhDK/bJerHKgXXHm+A4QivhbdyUMr5vuSUJMs7RD
         Iv9/ImhsTC/skNSeOfA5DTb7U2O0gcywrlKKiVs9VEqkYe79F+toKZjbaTQZZ6Bmc00f
         nk+zgjMBySPR3KSvXflx/0tTSwtZyD85lMWKxsrMt5FYpUyHvCvcp4h343HdxFYwzu/W
         XIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkWCj0Bdn5Lz2ZliGZazF4ed6JK/XE2t/LI6cgr1fFY=;
        b=ElYZ4B+HD+LopW0Dj2K+yQI05/Rizb/tZDYaUopDnxJWMWmLtppFhjyk0vHg/9CUbI
         K8JYMO7GwULPuU0J8rCfHgpg5Baa3Qv/UpeLljAiw1QmUK0/JJcefBG1nRWtHcRSFaAz
         DXM3sKyFmcAE1oApk/Up9Et5YsSwBLWZDLrabpnODyL+SxLzmChjiksWy15ufYHbP+mt
         /VoxQnY4Hnigk3xBNOQP6dHN+L0oYUTB8QCa/kV9qisOuCiulhv3Q9VQ1ER9WByI29Gk
         zJ//iyVqRz64WpLpsfdG6NSI920sBC5BPYhloegzTygQa0BnFIo8behQEIcZoBaNnQPs
         05vA==
X-Gm-Message-State: AOAM5321rjjaB1Qm+yHyoErRTDule7YPlV4hqbJ4NrR6TO/1x0bfV6lt
        dPfyR5zN9xM0IDKAMoTvUci9f4qE
X-Google-Smtp-Source: ABdhPJyckYC4APqNVntRLxbpZKC8P10n/pGiY+fI2npn0n37cvYZQplDxuAa5RsToSAYbW6nE3w6Qg==
X-Received: by 2002:a17:90a:ad02:: with SMTP id r2mr7892932pjq.74.1594181906206;
        Tue, 07 Jul 2020 21:18:26 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:18:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 01/17] gpiolib: move gpiolib-sysfs function declarations into their own header
Date:   Wed,  8 Jul 2020 12:15:44 +0800
Message-Id: <20200708041600.768775-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move gpiolib-sysfs function declarations into their own header.

These functions are in gpiolib-sysfs.c, and are only required by gpiolib.c,
and so should be in a module header, not gpiolib.h.

This brings gpiolib-sysfs into line with gpiolib-cdev, and is another step
towards removing the sysfs inferface.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-sysfs.c |  1 +
 drivers/gpio/gpiolib-sysfs.h | 24 ++++++++++++++++++++++++
 drivers/gpio/gpiolib.c       |  1 +
 drivers/gpio/gpiolib.h       | 18 ------------------
 4 files changed, 26 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-sysfs.h

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 82371fe2ccc6..728f6c687182 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -11,6 +11,7 @@
 #include <linux/ctype.h>
 
 #include "gpiolib.h"
+#include "gpiolib-sysfs.h"
 
 #define GPIO_IRQF_TRIGGER_FALLING	BIT(0)
 #define GPIO_IRQF_TRIGGER_RISING	BIT(1)
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
new file mode 100644
index 000000000000..ddd0e503f8eb
--- /dev/null
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef GPIOLIB_SYSFS_H
+#define GPIOLIB_SYSFS_H
+
+#ifdef CONFIG_GPIO_SYSFS
+
+int gpiochip_sysfs_register(struct gpio_device *gdev);
+void gpiochip_sysfs_unregister(struct gpio_device *gdev);
+
+#else
+
+static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
+{
+	return 0;
+}
+
+static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+{
+}
+
+#endif /* CONFIG_GPIO_SYSFS */
+
+#endif /* GPIOLIB_SYSFS_H */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 291c088a5964..4d267c69482c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -26,6 +26,7 @@
 #include "gpiolib-of.h"
 #include "gpiolib-acpi.h"
 #include "gpiolib-cdev.h"
+#include "gpiolib-sysfs.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/gpio.h>
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9ed242316414..2dee4e1e12dc 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -175,22 +175,4 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 #define chip_dbg(gc, fmt, ...)					\
 	dev_dbg(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
 
-#ifdef CONFIG_GPIO_SYSFS
-
-int gpiochip_sysfs_register(struct gpio_device *gdev);
-void gpiochip_sysfs_unregister(struct gpio_device *gdev);
-
-#else
-
-static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
-{
-	return 0;
-}
-
-static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
-{
-}
-
-#endif /* CONFIG_GPIO_SYSFS */
-
 #endif /* GPIOLIB_H */
-- 
2.27.0

