Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9DDEF33C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbfKECFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:18 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41245 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:18 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so13950203pfq.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QfMv2dWHx6NdVCUzOO5ErZThkUjv6+Xx4c4EN7RS3qc=;
        b=iiatIo2iQ6veucjN5B8qJ4NfjUs62yfPt1TGUpCl9Z6gdCFr3bwu/TM9UY97eGxW1X
         ODsy5hdLw0jVPzkPfRYAfpDkLZHlhfqHbZjoYlifKRYRIVCxlOFfCsr2VkVe5qMNL9Np
         0nFElw/+aXmSc/O2PepnaPHWKHEwX4M5IRqniFXHuTASarjGk0rOvm18xh2NQPDJmAh5
         JT/9gqWvSIE1iDPqST4Dx4dGUPzVhKwiAgzP9DO6z3Fnfu1XgLx5CsPKi4yW90Ah3MQ9
         +SQB9z128yAQ+di6m+PzFeF3YRER+q58lDjADG5KA5IHY5DJ5xzPfEOMp8Zmq2Hw8Pw4
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QfMv2dWHx6NdVCUzOO5ErZThkUjv6+Xx4c4EN7RS3qc=;
        b=CIG7lHXOXOAG6+qP1gfLESdr1OFe+F8Ldf5/v0FvKIbNwe9hnru9PvgA9MDswDk9Kv
         mPm2WhPPonwTfUkForyWovd6lnBQhFBfGB8JxRZRLvOd/KAcs2MLXgrFkIIl7C5MeB5O
         MFanIC+cH1YlRwcabvEnUYpcZGkY9b9MvrIWHlSnwitFvUCIGhB9u+OMcemhC0nQ5nbp
         8Eel2oxlufHu2zIzUS7sAyeG4CGd3nVU5+o/FpSntwcfCZGwfhpK6SdsLx93aRWtc/VT
         rqr2X716n/3qmymxFvJKSzvahAx0P0RobsqzRdlYZCyp5+/cELuRsBD6Hm8kjctgws0C
         utoQ==
X-Gm-Message-State: APjAAAU5PQFzyKdG518Soltp2GQiYik50Z+7xEX7XuzleDgsusv3Bhgh
        MIwTUZBoBdr58NLdH526dbDK5EzbMiihyw==
X-Google-Smtp-Source: APXvYqyhn/4gLTyqpNtyRR8cxNQTn7k1VmaFD9iHAn6Vk6e24Blr3G1bNlnKE9fFFw0PVpaOpmRPXw==
X-Received: by 2002:a63:e454:: with SMTP id i20mr33478553pgk.319.1572919517274;
        Mon, 04 Nov 2019 18:05:17 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:05:16 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 7/7] gpio: add new SET_CONFIG ioctl() to gpio chardev
Date:   Tue,  5 Nov 2019 10:04:29 +0800
Message-Id: <20191105020429.18942-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
The ioctl allows some of the configuration of a requested handle to be
changed without having to release the line.
The primary use case is the changing of direction for bi-directional
lines.

Based on initial work by Bartosz Golaszewski <bgolaszewski@baylibre.com>

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 69 +++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/gpio.h | 18 ++++++++++
 2 files changed, 87 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8d6e5dd3d1cf..f46aa763ee6f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -476,6 +476,73 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
+static void linehandle_configure_flag(unsigned long *flagsp,
+				      u32 bit, bool active)
+{
+	if (active)
+		set_bit(bit, flagsp);
+	else
+		clear_bit(bit, flagsp);
+}
+
+static long linehandle_set_config(struct linehandle_state *lh,
+				  void __user *ip)
+{
+	struct gpiohandle_config gcnf;
+	struct gpio_desc *desc;
+	int i, ret;
+	u32 lflags;
+	unsigned long *flagsp;
+
+	if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
+		return -EFAULT;
+
+	lflags = gcnf.flags;
+	ret = linehandle_validate_flags(lflags);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < lh->numdescs; i++) {
+		desc = lh->descs[i];
+		flagsp = &desc->flags;
+
+		linehandle_configure_flag(flagsp, FLAG_ACTIVE_LOW,
+			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+
+		linehandle_configure_flag(flagsp, FLAG_OPEN_DRAIN,
+			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+
+		linehandle_configure_flag(flagsp, FLAG_OPEN_SOURCE,
+			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+
+		linehandle_configure_flag(flagsp, FLAG_PULL_UP,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+
+		linehandle_configure_flag(flagsp, FLAG_PULL_DOWN,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+
+		linehandle_configure_flag(flagsp, FLAG_BIAS_DISABLE,
+			lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+			int val = !!gcnf.default_values[i];
+
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+
 static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -526,6 +593,8 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 					      lh->descs,
 					      NULL,
 					      vals);
+	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
+		return linehandle_set_config(lh, ip);
 	}
 	return -EINVAL;
 }
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 7cc21c3b0839..799cf823d493 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -100,6 +100,24 @@ struct gpiohandle_request {
 	int fd;
 };
 
+/**
+ * struct gpiohandle_config - Configuration for a GPIO handle request
+ * @flags: updated flags for the requested GPIO lines, such as
+ * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
+ * together
+ * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set in flags,
+ * this specifies the default output value, should be 0 (low) or
+ * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
+ * @padding: reserved for future use and should be zero filled
+ */
+struct gpiohandle_config {
+	__u32 flags;
+	__u8 default_values[GPIOHANDLES_MAX];
+	__u32 padding[4]; /* padding for future use */
+};
+
+#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
+
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
-- 
2.23.0

