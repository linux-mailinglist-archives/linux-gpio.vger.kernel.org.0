Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E6CDDEED
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2019 16:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfJTOn6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Oct 2019 10:43:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35078 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfJTOn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Oct 2019 10:43:58 -0400
Received: by mail-pl1-f196.google.com with SMTP id c3so5260247plo.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSR/OwjpROAgxjKXOSzSP17bKVm41xhr9kHYr1SVgbE=;
        b=fsGCs8RyEmJKTK5guQW6X41uABNKGuSkhN34nHUlWdAU+V7d1M5/YRAc9btA2juif9
         rt+UMiLqsTPUAoQqc1L1SzXUA7t3lF0YDaFmwQj0AZEfM1jRiYLqTSwBmm2MskKGrsng
         C79N0aOHjaS3IzTh1SoaGQLMQrt5aKcq2OPzwqMZbfTFtLxYm6HWTtMyk2E7iopUFGT4
         dTdBpp5R2BiEsiwyOHyHlE6JcbSdH8hUs2udhFjv6Qku9U5Zp/LKOJI9FCAZopAHQcF4
         Y5aB3Vbkguz93PdSOlrk1dztXebTqzd5NNB3sUk1vZpfcSZDPNe/YYJqXqUPPvFVhFCk
         78Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSR/OwjpROAgxjKXOSzSP17bKVm41xhr9kHYr1SVgbE=;
        b=RbTWYnbZAmsFt4RbSZXmtC9aoyGwwnJfgI8UcFx5zf2BetxyyrHxTSw77YFsWSLZ3n
         hu7C9K3blzYf46BrOnAs06VOdvzSENl6jy02mZaxsSqE7RG5KWRrGoqWBFX75ClxuB5M
         AuRXah7GBV+oV1Orx96j3CVHyD1HFXb18Hqdh+n/EZLzQYbi+wXy5KPOnb2HqSiqMwwX
         WmDV+9gM96UdZpepV7HX1sAmjMvQXk0WAi3ZZNtSsoe9Tob0MfzrDz8fYY/n9Mn1uGJr
         BUHxMm/rCbjhGJYBOGRF29nsdD1AB6XJFHlAItg/+9kDgSclWx7C1SUwpvE8XSzURBch
         Lf7w==
X-Gm-Message-State: APjAAAVluXltwH9yVlyWBUyilOubK16Jd2DxNJyw6DzU/G3DJ144U85n
        qemFGJySkTbHoX7HqyMz5pXJoYFunCDVqA==
X-Google-Smtp-Source: APXvYqwZtQhtCrXCX1+xSItr36TnNY2EJppI+lNvqukunUgWgOvKyGrO2pi8r9sWri+RI5p3m20qbw==
X-Received: by 2002:a17:902:9881:: with SMTP id s1mr20295291plp.18.1571582637389;
        Sun, 20 Oct 2019 07:43:57 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w14sm14671842pge.56.2019.10.20.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:43:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com
Subject: [PATCH v3 1/5] gpio: expose pull-up/pull-down line flags to userspace
Date:   Sun, 20 Oct 2019 22:42:34 +0800
Message-Id: <20191020144238.14080-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144238.14080-1-warthog618@gmail.com>
References: <20191020144238.14080-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Drew Fustini <drew@pdp7.com>

Add pull-up/pull-down flags to the gpio line get and
set ioctl() calls.  Use cases include a push button
that does not have an external resistor.

Addition use cases described by Limor Fried (ladyada) of
Adafruit in this PR for Adafruit_Blinka Python lib:
https://github.com/adafruit/Adafruit_Blinka/pull/59

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 drivers/gpio/gpiolib.c    | 12 ++++++++++++
 include/uapi/linux/gpio.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8964493c571..604dc17b3207 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -421,6 +421,8 @@ struct linehandle_state {
 	(GPIOHANDLE_REQUEST_INPUT | \
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
+	GPIOHANDLE_REQUEST_PULL_UP | \
+	GPIOHANDLE_REQUEST_PULL_DOWN | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -592,6 +594,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1091,6 +1097,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2764,6 +2774,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_REQUESTED, &desc->flags);
 		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		clear_bit(FLAG_PULL_UP, &desc->flags);
+		clear_bit(FLAG_PULL_DOWN, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = true;
 	}
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 4ebfe0ac6c5b..c2d1f7d908d6 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -33,6 +33,8 @@ struct gpiochip_info {
 #define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
 #define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
 #define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
+#define GPIOLINE_FLAG_PULL_UP	(1UL << 5)
+#define GPIOLINE_FLAG_PULL_DOWN	(1UL << 6)
 
 /**
  * struct gpioline_info - Information about a certain GPIO line
@@ -62,6 +64,8 @@ struct gpioline_info {
 #define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
 #define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
 #define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
+#define GPIOHANDLE_REQUEST_PULL_UP	(1UL << 5)
+#define GPIOHANDLE_REQUEST_PULL_DOWN	(1UL << 6)
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
-- 
2.23.0

