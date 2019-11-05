Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7615AEF336
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbfKECE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:04:56 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41706 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECE4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:04:56 -0500
Received: by mail-pg1-f195.google.com with SMTP id l3so12867835pgr.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5MLdWnjXwBDjqpQA+v47UJEFe5bKU1FenzfHHKS7CU=;
        b=MC1Gzx4aXzaGesYiKRTV+mDMIBBLP1B1V1Pb1fqP4bwl3uEl9eFdh+dZKS/9eDo1PA
         2aE+9tJXl4OMapinLnFu5s1Ny/JyV5HqCSUcjDTrTpVsFTOfi0Ad6lwku3z+ktB4yvmf
         Ck9Y9n1CF8Lz9arL4V9qZoONhz6gFz1c6PxsbwhDM1xaUNmvs6Hgs7PSbUEthSdz9F+/
         8m4jqazynqgz9j6K5rVG9AYwzIjEMgFTDyCjvMl1KDux4f0mq4nGm/QHAccHBTSwlVUt
         mZgFTSrddmTiOablCg0sfQnzkiqFjxl+RzLb1SdyqyJoogtcN4mpOHnS0w1zWpMRwA8r
         NIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5MLdWnjXwBDjqpQA+v47UJEFe5bKU1FenzfHHKS7CU=;
        b=qDkPtJkp7kJYCe8WfAErmdpmprDG7jwozRwPv08p424g+FC5RG9uj76DK84XGY2lXm
         /+gyoovTieIxudLJsu0ZamN2QPvasj71ijCeDuzpYvWMBgowpPxPr5Csr2fYwMXKADL9
         gI1dRhOjVpeiHnU/iYFx/2smeTNqOmCjPajWGoyUMHyctfeT18PWNXRlGpMogpl11+j5
         /UKHdXSQf2ZjeF1+u9WdWNIedAMndzCOAEegTwKu2db7vNhTR5yeve3nOvNoCeY2gd7z
         h36AlEiZ3juXsjZ4YC7VY7kvZ94QEAYfaCpNREAOvIDJJpxO1X9LKLVK73/rvTQfeGIR
         eLlg==
X-Gm-Message-State: APjAAAVXjYSWGAG6R234CLljm+7GitWDOLX7XG/AVAqN6A+5pBFX94QU
        5HA3JfVSDp1s1V1TCzpNI2ioxhkBHPZGWQ==
X-Google-Smtp-Source: APXvYqwFDsu5xz6aCma6Oc5CAPE7VcHAzfDP7sSsFUnKQcC2DKTiqqSrsjGhbrubxzt9z8P/pWLy6g==
X-Received: by 2002:a63:c150:: with SMTP id p16mr25309887pgi.405.1572919494568;
        Mon, 04 Nov 2019 18:04:54 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:04:53 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 1/7] gpio: expose pull-up/pull-down line flags to userspace
Date:   Tue,  5 Nov 2019 10:04:23 +0800
Message-Id: <20191105020429.18942-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
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
index 0be71924c0f7..55a8443bd4af 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -422,6 +422,8 @@ struct linehandle_state {
 	(GPIOHANDLE_REQUEST_INPUT | \
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
@@ -553,6 +555,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
@@ -593,6 +601,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1092,6 +1104,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
 					   GPIOLINE_FLAG_IS_OUT);
+		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+		if (test_bit(FLAG_PULL_UP, &desc->flags))
+			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -2784,6 +2800,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
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

