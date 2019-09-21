Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E37B9D6B
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbfIUK1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:27:10 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:33164 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731118AbfIUK1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:27:09 -0400
Received: by mail-lj1-f180.google.com with SMTP id a22so9439589ljd.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Sep 2019 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05FOSez9WQHpbqEM4ahMenPiujOPuHkduuyyh1jG8qA=;
        b=OBFO+TdPmyhPaPjJqjxg18x8TUyHy6U1yherYeC0L/n05/Li4aBIrD4EpuYkifWQtw
         O/vNUv2ixDWwHurJ4HavaVPKoPE3a5Bfa53t6AGS2s8G5QTT+ezTBUgey3OqO2qxNhze
         hSqdtYSBjiwlnfb+NC8WeXqS8/5LgjrG0eRhE/dSvERW5jmXc6mJfFD9/5JzFpJczN5S
         Of7VxMl/0q/iNlYtcTrkOZCiCqK2/V5+KPgXQdEN+Bu8kbvDqoDa+qpkKBwliyX13apn
         iMT9iGAyz62iblBVdIqQvKnesj6BrLZofQXM+LVXoaa29UWVH3gmLkASh5ogarZEPyX1
         I/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=05FOSez9WQHpbqEM4ahMenPiujOPuHkduuyyh1jG8qA=;
        b=XdTlZpeZ3UdO4axtEg1qEHo1Cx4dtlfRpGZBd6pe9kUCwbNYloi66b85o2fuu46DHT
         R6KwICXl+C8TLeO3R2nzcILp6Hc3qrSFHDCSN6LDkOe5x9PmfGuZP4XJnmhK1tp0csVX
         BYOsHqVSdvAmbTgcHAk0Gp2RusZs4MBkoXoTN9StmHJH8zZzV7UP5EO7FPkg0vOmDV7h
         jNsuhFGfTI9Xu8+SLKPOpvoJBowIvP/rFcXUIVVOKQgyNzH6LbFN+PtqU+I6Ujgad/tE
         myMXlyX1rXtWTrGX+ffczxBCrYuCUaM4cYSyMXQL7+c0iAGJ/yhtd1JLCbLtHpMz4Eam
         ZVNA==
X-Gm-Message-State: APjAAAUd1YnRWg04SaUg36cYILWDAls/6Sc1nOahKVKqMWWxydTwrL+P
        f38v56yTDywDIbdocQmE/S8rtTCIORDvAg==
X-Google-Smtp-Source: APXvYqxIW+u8l156c5Ap2k/qOCmBBbBaSVsRr8mcqrvmP3fBM/1SRGqSKVzU4pUeWQ6WGPMZssvyWg==
X-Received: by 2002:a2e:9713:: with SMTP id r19mr11199546lji.81.1569061627444;
        Sat, 21 Sep 2019 03:27:07 -0700 (PDT)
Received: from localhost.localdomain (0234200460.0.fullrate.ninja. [2.110.20.30])
        by smtp.gmail.com with ESMTPSA id p86sm490696lja.100.2019.09.21.03.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 03:27:06 -0700 (PDT)
From:   Drew Fustini <drew@pdp7.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, thomas.petazzoni@bootlin.com
Cc:     Drew Fustini <drew@pdp7.com>
Subject: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Date:   Sat, 21 Sep 2019 12:25:23 +0200
Message-Id: <20190921102522.8970-1-drew@pdp7.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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
index d9074191edef..9da1093cc7f5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -427,6 +427,8 @@ struct linehandle_state {
 	(GPIOHANDLE_REQUEST_INPUT | \
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
+	GPIOHANDLE_REQUEST_PULL_UP | \
+	GPIOHANDLE_REQUEST_PULL_DOWN | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1102,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2475,6 +2485,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
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
2.20.1

