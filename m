Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C999EE40D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbfKDPju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:50 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33778 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbfKDPju (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:50 -0500
Received: by mail-pg1-f193.google.com with SMTP id u23so11541759pgo.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O3HzsmylXY4ayZlnRzLkoobhBcXnohSTvUIVbv7ngfA=;
        b=VIVMW79+orHKTbjiQG4a1k4oZUY/y5Ae+FnmH4VxVnVpiHRlr1uZa17niuf7d50T7E
         kjggIdSRSMx/+33rA5BYnou059XYfFnmzxfm3YP6xE/hSrucJvUXUIzpn6JnTy5qjmpz
         F8v+/BAdG7qLImh/6mklALT77W91ev1BQ7y5oEuBgsldSULooBR227kTupFDVLY+PX8S
         JNDESy2x0Qg8TmjHS9jTrxjcBcIdA0gvP/l35i1Q8Ft2Mjus6eEVc6ZW1lna8Pq3BR/M
         +7+HYMwtbOXyNaJ6fVMwUu6lT0p+OqkaXZqI3NMfLLngl+iCrURCl8QSX5BOUsOwrnlu
         puLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O3HzsmylXY4ayZlnRzLkoobhBcXnohSTvUIVbv7ngfA=;
        b=Zjz6dwbBEERKLquIHzMwZsFpr1nMQMkYIRJn2BRr2/7jDbJoy4xgrZeAbgzQgfZ2q7
         7lZq4CizsdumkYQh3O1h7sZtzF/LBP4JIttC7oB3S0hBZaPqgT/j1hRyoDVRHuxe2f8o
         rYkt3p1k845EfutilZJxdKlkfimDuY2X41luHijhYQXfq4UZxP0NCrXsuLxOgW1wDJsi
         uEWczg0OzUBRRzGmjEICyUZuYyJX7H43gp+F4D+fV65syZPxT7PzqjR08Nva74XkMTJi
         3b8PLhePTUK/dEoOKhUuDUBQxAIixuZgLpDWxzJGiPMFIIpKdyQuJ91+Np1gkgLpgRRk
         e0+w==
X-Gm-Message-State: APjAAAUY9eRegDfnuNo1k0NyDUgN2TmA14UdIy1xjCXyYIMeH+EfDsPf
        dMDLAYwalsT0qD7H5spMTan/h7gWO1Ne9A==
X-Google-Smtp-Source: APXvYqxcyZ9eoTlCmzJQpDUoMXexT1bwGmBsYImELyonuWDxRiRHjS8s/lmXAGc+RJQJ4DtTWZGBcg==
X-Received: by 2002:a65:5a06:: with SMTP id y6mr31265726pgs.9.1572881988907;
        Mon, 04 Nov 2019 07:39:48 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 7/7] gpio: add new SET_CONFIG ioctl() to gpio chardev
Date:   Mon,  4 Nov 2019 23:38:41 +0800
Message-Id: <20191104153841.16911-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
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
index dac1914155cc..969c0eb878df 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -475,6 +475,73 @@ static int linehandle_validate_flags(u32 flags)
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
@@ -525,6 +592,8 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
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

