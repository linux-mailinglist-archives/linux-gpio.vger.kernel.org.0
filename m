Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39486EE405
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDPj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37831 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPj1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id p13so7723227pll.4
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2aM20PTVnKKVPzWeWkBlSsYQUFnZaDUnWU64bXMZpRM=;
        b=SAP1RXmtJRyIvRaQEtdbLTqToCmh+CM91d7lRTYc3WQJpKHkzK1CFeZ0mGZd7SXHY+
         px4KNhUo0Qz73cn3hi3wnowtqsCmlqboLwh0dWoVaC/E9IK8eN8xjQb+uyIQp77WRmdJ
         b4SWpIgQ5TbM401FkTwpZgphAOTPTlqzloY4pOO/55NyI6KQD2/DhM99xhO9KzOKKdci
         7TW1l6LFr90/yRApMGsZObtXpgoJFjEj7L9LTUDI/VWDGE6eYLWqykI3o3EN5/jq4Gwr
         w/CCtwZ1ps0OkzNmscCSlN9zULaaXKmVKaaypnj4L8qXXhrYDazEEkfmnRUy2GcHvZIv
         r+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2aM20PTVnKKVPzWeWkBlSsYQUFnZaDUnWU64bXMZpRM=;
        b=TuQ1tfsaYJ+pHGbRco2KVt69qzPtiyOIdQx8iceSOiuGL5EkPE3PVK2pOQBHDaZM9N
         dWqz2iQeQCWf+1mV+s/8taBX6HuyFXAQ4GAuCr16GA+SdeBzGQn6KBQn8u96NVM1uRk+
         3Rvw73dMlNgfY4wj1NKaNTEY1CnGFoDYtkTgAr+VhZvXHrNLs2ISaFTui17vujFkVeFp
         iUPHkvOOECMDUYU8ggQVGwrY3AeFxWEZweKUBEy1KAGY2NpRePe0kZJ6gNLO31if/Q+f
         89A0OEx9NKcltaZyuPG0m96DblTDilQSYg+CrFHaM1MBi5s/FPbHyw28gz175kDrRknS
         v5XA==
X-Gm-Message-State: APjAAAXbMidgMSdEkUGaYg0ZNhojV964v8ukKVyAFMs5EAuAtHJ3RkTX
        ql3FBTgrrGlz/F7uyVV8F4FmwfwK37o6yw==
X-Google-Smtp-Source: APXvYqyw1y13DD0cE8LnfYTNFWN6+ul9jePlMamOPBHapSHa2F+HZQnhIbUemgM/PF+tXDvtnrCTTg==
X-Received: by 2002:a17:902:8348:: with SMTP id z8mr14716323pln.130.1572881966055;
        Mon, 04 Nov 2019 07:39:26 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:25 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 1/7] gpio: expose pull-up/pull-down line flags to userspace
Date:   Mon,  4 Nov 2019 23:38:35 +0800
Message-Id: <20191104153841.16911-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
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
[Kent: added BIAS to GPIO flag names and restrict application to input
lines]
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 18 ++++++++++++++++++
 include/uapi/linux/gpio.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8964493c571..035022bf0ef9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -421,6 +421,8 @@ struct linehandle_state {
 	(GPIOHANDLE_REQUEST_INPUT | \
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -552,6 +554,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -592,6 +600,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1091,6 +1103,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2764,6 +2780,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_REQUESTED, &desc->flags);
 		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		clear_bit(FLAG_PULL_UP, &desc->flags);
+		clear_bit(FLAG_PULL_DOWN, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = true;
 	}
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 4ebfe0ac6c5b..39e6c7854d63 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -33,6 +33,8 @@ struct gpiochip_info {
 #define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
 #define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
 #define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
+#define GPIOLINE_FLAG_BIAS_PULL_UP	(1UL << 5)
+#define GPIOLINE_FLAG_BIAS_PULL_DOWN	(1UL << 6)
 
 /**
  * struct gpioline_info - Information about a certain GPIO line
@@ -62,6 +64,8 @@ struct gpioline_info {
 #define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
 #define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
 #define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
+#define GPIOHANDLE_REQUEST_BIAS_PULL_UP	(1UL << 5)
+#define GPIOHANDLE_REQUEST_BIAS_PULL_DOWN	(1UL << 6)
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
-- 
2.23.0

