Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6072F204832
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgFWEBt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWEBt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:01:49 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64B2C061573;
        Mon, 22 Jun 2020 21:01:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b16so9436447pfi.13;
        Mon, 22 Jun 2020 21:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1/q8MRSUJLItYrr+zmUyqWqShRkPABeF0cerkoW7Mc=;
        b=BsK5D7gt1DKDoyIH2ftv6oNnlv+dMAvHEkVqTMUWYeqXDxyZM96si0lgn+mnHniSdm
         u5hETPB5cjJ7HI2rbjBcDe1XVZbW+EOd7HdL/VwJaSxdrLBV1zBgap0MZWUpRTs/7KhT
         smyGwI6eONvnRetwiT7E/mf2Lm5O/qlLQyvvSZBUPeJu4ZRp8sdBA0fFR3WFhTDx8L+t
         J2j1bYs3bUu/qusMXYwz2qq+YEyhOVZrvGzBxCOy00iXnqZev3N//5IvyJVjaCQ/rhDR
         NMCrMZEMyRz9I41AYC/YKzlyQMczxNc+Nr/g5dO6PxDP4hoNyusj1XYEep5oW2jfvfjK
         Mq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1/q8MRSUJLItYrr+zmUyqWqShRkPABeF0cerkoW7Mc=;
        b=TtKO0AW+GNfC8qmOiEudh2n/8DU/OD9tyFYUPmJfjiNG+PYTPQj8qpKy4MSTL1Y+UE
         RxzP2X11QtYpoS1zfKmbgGEjlLcYeotuvVdRKdw9+gEmvWOfqUgMwAX3Eo9kGHRX1dgw
         X8qRSZuirLMKT9A7W3cXriIi+fINlnMOslHrro9C6K+nHIuM5k2JwWsDLJBZA2yYqNuy
         WG6S2dZ8tpx2U5XImwGo+KjQr2LNXZ0DHJGBxPFZI955/E2V9VZjvcmt+yTWih5L5XA2
         ruVgh3rygsejpwrZAPmGgv0wrg281iOsQRE6ajpM9IbY8OY75RJdohrWdllrwBm74ISM
         q+HQ==
X-Gm-Message-State: AOAM53385SmCA4rWa0Fs4jNLYbzoLdiUROtJi3jl349vSLqo5cYrCkVC
        mHUKX/Q/dKvbd1aUd5hefmAl3A2x6iQ=
X-Google-Smtp-Source: ABdhPJzf2ywv9cZJX6eqgHYV5iprYhHP4fEhfWOef7c1wSlmR+xYZ1MD6MPJnHYZjsizHENa+nFJ1g==
X-Received: by 2002:a63:d208:: with SMTP id a8mr15312328pgg.351.1592884907055;
        Mon, 22 Jun 2020 21:01:47 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:01:46 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 01/22] gpiolib: move gpiolib-sysfs function declarations into their own header
Date:   Tue, 23 Jun 2020 12:00:46 +0800
Message-Id: <20200623040107.22270-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move gpiolib-sysfs function declarations into their own header.

These functions are in gpiolib-sysfs.c, and are only required by gpiolib.c,
and so should be in a module header, not giolib.h.

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
index 23e3d335cd54..18f94be1b458 100644
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
index 4abd751314a5..517c99ddf6c8 100644
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

