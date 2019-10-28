Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38FBE6D53
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbfJ1HiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36752 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1HiD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:38:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id j22so309644pgh.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RS2E+pvrqE8M6rkF9KOwKfQynKI39Ni0QEkJ6FTAs8=;
        b=tBZbLgZsnPxNlb4wCp031zpRC905Os6mWS32kXueOQepfkC7Av5Fmmp04TV6uWjJvm
         ZlG1w2ezoVv+bzGOb/tOIlQxQrdMXJawmuuQPK0RpBnri1cqs4yhqWX+3bqbBM6IVcdc
         U0g6QBjaJ8LCffsOtmibOOlj/hXfAm5mdW1khI4qjKb0FQRwf9EwIf5bhVGQm53e2UXD
         7yqj2sBzCU+kLx7HDCfe+oza2es8++l25qnT0xbxTPZzauR/jsAGK1MHo9iVRbtoBpdV
         c99HdfhIIg8SKyZxne2FAhr7FVdQI7Q5BlnH+mZOlaLHTNXbzFQKFkZwQ6LZ9mpRRwQh
         t2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+RS2E+pvrqE8M6rkF9KOwKfQynKI39Ni0QEkJ6FTAs8=;
        b=dmUH243mnThii374BOORg7c+UeFUG8qMticAZCKlQjz7wA1twsHhnuDzDlyKwlnzSl
         lIzjqKOxA2AEfti5UEl0agYuCLLUg6uOE900ccJe4fMFwc4OYoVf7pBo4fMBKgra7ku8
         m04O/lLWUYEey7h7gPR0k4WG6PWLMJj4bYCYySEsaGvujGR319OLLcvjo2RuK2QkszmE
         851ZwPsKwsG6q8K0+0/zuT3L5zkUrcNgU/qJyty7x61+MXsVf07IC69ylY/S+Nwojf3H
         uuGM5KKl4FC+4TG99gF4VCEvikJY+ejU0M1d9ez0dgGkW8LrGJSmrlSX4zSGellU6Pjt
         BckQ==
X-Gm-Message-State: APjAAAXOo9N3a28cYUPdyBXf73WUcZzfdmCc9leFX3eb2+iql9Rxllnp
        +e1h+Y1K4uVWKTxqws380v83M1DOTVUF0wcQ
X-Google-Smtp-Source: APXvYqyNMbAcroiowkfl0uy1YzxlDOgvUNm4CQgshu5+F3Wy0/sT6NiggADjw75X4l/vT9KvLQlMfQ==
X-Received: by 2002:a17:90a:f991:: with SMTP id cq17mr20319254pjb.30.1572248282066;
        Mon, 28 Oct 2019 00:38:02 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:38:01 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 1/5] gpio: expose pull-up/pull-down line flags to userspace
Date:   Mon, 28 Oct 2019 15:37:09 +0800
Message-Id: <20191028073713.25664-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
References: <20191028073713.25664-1-warthog618@gmail.com>
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
[Kent: added BIAS to GPIO flag names]
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 12 ++++++++++++
 include/uapi/linux/gpio.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8964493c571..e80e689be2cc 100644
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
 
@@ -592,6 +594,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1091,6 +1097,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
 
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

