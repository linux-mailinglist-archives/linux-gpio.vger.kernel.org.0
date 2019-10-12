Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B7CD4BF9
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfJLB46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:56:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45605 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB46 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:56:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so5239660pls.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGwiK1J0mM5vfviiuZRXy7lRh5kuzlTW61EA743PqAA=;
        b=YtI3n15TzREOvRNBbHxAVp4Ha+v14oJdS0o6RpHEAzSUK2zoX3yN6FJzVsIKLvLdJp
         ZgvXWqGj/JL/yF/QKWPFK7+E9hIK7e8R43N14AAkLDQIWqwAOiIO9BXniBKI4A1p7VaF
         EBsM16yYETP9/UdSbp+qzWQPtfMlMwIgfTggff+PuWJV7kP/NccXIihCdBuXUFOpv19/
         rloryLvQKp9t1+B7CirseI8Pfj407y8CzxFk9X/IN3ljWsjhwdZhr+pT1HxBgBPSULPQ
         pKO0yJN/m8f4pr6xOzSa+mg84N2sLCyg7E0x8iwPiAbCHNdUwhcDGpHG0kSNKgkYDXed
         UB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGwiK1J0mM5vfviiuZRXy7lRh5kuzlTW61EA743PqAA=;
        b=SJDxBsIp8FAwbbxqslW/tu/KwicEPJBCcw759dFVR8kmROUysUi0taNSAXqGj1adJn
         Y7kzhjtzP2kQOkd6b4VZepK4xkfbH7bCvs1SZonWigR2/Bxb5f4TVXikG+U9ra/L1FzS
         dYSCkcZ0iRL/zPZ5/SFuhSKMU0mZs//ZkTCi7hmFdOPKEnzaTnoQ9/ApoQIjr5AsvD2f
         IUvk1zp2EA79Y+peldhbTqZVKXD0GOwzUT0H4bRwuehcacAiuxkb9QBIQXfiyEPCIeWE
         NxkvtmkCER4BFivo0hzj8mgJkgGK1wSLhsYRp1gqQGM40L3/rme3WQ7dOpHADrW+Ol2U
         7PQw==
X-Gm-Message-State: APjAAAX1Pp5MmXivVFQz/nNogMV9HxXxVxeomE/CqE7sI4hYUh25nyA0
        b8gT2Oc1sWkffp+VWAcQIZ2tWy2ua3g/uw==
X-Google-Smtp-Source: APXvYqzt2jegYH204sS4S8u4k+stbkHOxN6hs4yJTBeSQJnRxh1LFGVwra8yyY9b70EQtB4Yp7+YUQ==
X-Received: by 2002:a17:902:222:: with SMTP id 31mr18434713plc.169.1570845417103;
        Fri, 11 Oct 2019 18:56:57 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:56:56 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/6] gpio: expose pull-up/pull-down line flags to userspace
Date:   Sat, 12 Oct 2019 09:56:23 +0800
Message-Id: <20191012015628.9604-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
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
[Bartosz: added flag sanitization]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c    | 17 +++++++++++++++++
 include/uapi/linux/gpio.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bdbc1649eafa..9d2a5e2f6e77 100644
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
 
@@ -537,6 +539,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
 		return -EINVAL;
 
+	/* Same with pull-up and pull-down. */
+	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
+	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
+		return -EINVAL;
+
 	/*
 	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
 	 * the hardware actually supports enabling both at the same time the
@@ -592,6 +599,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1097,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2770,6 +2785,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
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

