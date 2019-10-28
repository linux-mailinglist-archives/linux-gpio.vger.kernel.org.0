Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8724BE6D62
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733003AbfJ1Hjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:39:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42538 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730952AbfJ1Hjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:39:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id c16so5172236plz.9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ANW7T7OH1llu/xdaSoWc/noKmHnwcgKoLqzO6YyiHY=;
        b=Ol9ZjePw/tHG//u3r5OTBIaGXg/5nntmnrGwkU4QDetf1YQKZzkGcRTg1ndsjaIQ1I
         Wjl5Z8AIyvUMhd8JXmjXb5Qjz1uEKFBSY0O59XyowiqbcKeIYQ0Ru1T/E+QGaev5GUnd
         oRV2x6Xldha7vvPpbE54lg7mvt01bYcRkLkSYcvprIQfsh/sxAY40PAqVy2enqv56pj1
         aK567iAsyjCLsofJW8z9zsIzDYZ3vOOiyOy5ekRXvIYZrYnwQmwlgBlVKjKp4ojgb44V
         mudIsG4FIW/TBoA0OvnBv4PxaIsyO1dYO3T4lKzXCbV07dNBgP/bJGW6EoA0x6PohVIS
         0zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ANW7T7OH1llu/xdaSoWc/noKmHnwcgKoLqzO6YyiHY=;
        b=GAMsxzlaBvCeYopJaPttllIkWRyADWmD51GGfKehKts7yV7jvnzs3lzmnHZvVZOvUB
         BfVSj7Y8gcM/TkVF5wMMv5i4l5iHK/RXdGM8ZfCcCM920wSPfybWYz6/EiGwDuGbta9F
         UMAxX8ttG/+MbqkeaZFCtJ4HUCwhA95sulXp9PIOOYmrvIZ6cR2VebTpGPYwqC4rRoIF
         C0l/NayLazFrXqt1K64WymNXkNDX5Ou0gQTMA0IcJxEf1a9BINqpXCpuZOoX9eueFQsy
         JRKFoVYIvugMzhWGLIBO58trdxhLTkppIiiHSaDQPi21ZXXjNKHadtpmy53Iqwu9bdBa
         pEqQ==
X-Gm-Message-State: APjAAAXPYpxzFwf8CKPrQTFGhSgb8QDLqbloHfCZ/PyYsS5+S2VJoFxM
        jC86nJZadjFNDLhoVXhty5QvER4+3HmlR7z+
X-Google-Smtp-Source: APXvYqykeFJ8x2LjPgZf4eCuMLfR5pr5+xkYQkwM5RvWcUbHIqSIhnycLaAMVWkbE1GuGDL32pxgnA==
X-Received: by 2002:a17:902:7207:: with SMTP id ba7mr17649983plb.172.1572248379161;
        Mon, 28 Oct 2019 00:39:39 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z5sm9878057pgi.19.2019.10.28.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:39:38 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: add new SET_CONFIG ioctl() to gpio chardev
Date:   Mon, 28 Oct 2019 15:39:12 +0800
Message-Id: <20191028073912.25743-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The patch is against Bart's gpio/for-next branch[1] with v4 of my bias 
patch series "gpio: expose line bias flags to userspace" applied.
This is necessary to support setting of the bias flags introduced 
there.

The patch has been successfully tested against gpio-mockup using the 
feature/pud_set_config branch of my Go gpiod library[2], as libgpiod has 
not yet been updated with the uAPI change.

 drivers/gpio/gpiolib.c    | 163 ++++++++++++++++++++++++++------------
 include/uapi/linux/gpio.h |  18 +++++
 2 files changed, 132 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index df27f05f9b8d..62a74e27ad02 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -427,23 +427,74 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
+static int linehandle_validate_flags(u32 flags)
+{
+	/* Return an error if an unknown flag is set */
+	if (flags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
+		return -EINVAL;
+
+	/*
+	 * Do not allow both INPUT & OUTPUT flags to be set as they are
+	 * contradictory.
+	 */
+	if ((flags & GPIOHANDLE_REQUEST_INPUT) &&
+	    (flags & GPIOHANDLE_REQUEST_OUTPUT))
+		return -EINVAL;
+
+	/*
+	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
+	 * the hardware actually supports enabling both at the same time the
+	 * electrical result would be disastrous.
+	 */
+	if ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
+	    (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
+	if (!(flags & GPIOHANDLE_REQUEST_OUTPUT) &&
+	    ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	     (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
+		return -EINVAL;
+
+	/* Bias flags only allowed for input or output mode. */
+	if (!((flags & GPIOHANDLE_REQUEST_INPUT) ||
+	      (flags & GPIOHANDLE_REQUEST_OUTPUT)) &&
+	    ((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
+	     (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
+			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+	    ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 			     unsigned long arg)
 {
 	struct linehandle_state *lh = filep->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	struct gpiohandle_config gcnf;
+	struct gpio_desc *desc;
 	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
-	int i;
+	int i, ret;
+	u32 lflags;
 
 	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
 		/* NOTE: It's ok to read values of output lines. */
-		int ret = gpiod_get_array_value_complex(false,
-							true,
-							lh->numdescs,
-							lh->descs,
-							NULL,
-							vals);
+		ret = gpiod_get_array_value_complex(false,
+						    true,
+						    lh->numdescs,
+						    lh->descs,
+						    NULL,
+						    vals);
 		if (ret)
 			return ret;
 
@@ -477,6 +528,59 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 					      lh->descs,
 					      NULL,
 					      vals);
+	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
+		if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
+			return -EFAULT;
+
+		lflags = gcnf.flags;
+		ret = linehandle_validate_flags(lflags);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < lh->numdescs; i++) {
+			desc = lh->descs[i];
+			if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
+				set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+			else
+				clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
+			if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
+				set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+			else
+				clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
+			if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
+				set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+			else
+				clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
+			if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+				set_bit(FLAG_PULL_UP, &desc->flags);
+			else
+				clear_bit(FLAG_PULL_UP, &desc->flags);
+			if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+				set_bit(FLAG_PULL_DOWN, &desc->flags);
+			else
+				clear_bit(FLAG_PULL_DOWN, &desc->flags);
+			if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+				set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+			else
+				clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
+
+			/*
+			 * Lines have to be requested explicitly for input
+			 * or output, else the line will be treated "as is".
+			 */
+			if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+				int val = !!gcnf.default_values[i];
+
+				ret = gpiod_direction_output(desc, val);
+				if (ret)
+					return ret;
+			} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
+				ret = gpiod_direction_input(desc);
+				if (ret)
+					return ret;
+			}
+		}
+		return 0;
 	}
 	return -EINVAL;
 }
@@ -528,48 +632,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 	lflags = handlereq.flags;
 
-	/* Return an error if an unknown flag is set */
-	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
-		return -EINVAL;
-
-	/*
-	 * Do not allow both INPUT & OUTPUT flags to be set as they are
-	 * contradictory.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_INPUT) &&
-	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
-		return -EINVAL;
-
-	/*
-	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
-	 * the hardware actually supports enabling both at the same time the
-	 * electrical result would be disastrous.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
-		return -EINVAL;
-
-	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
-	if (!(lflags & GPIOHANDLE_REQUEST_OUTPUT) &&
-	    ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
-		return -EINVAL;
-
-	/* Bias flags only allowed for input or output mode. */
-	if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
-	      (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
-		return -EINVAL;
-
-	/* Only one bias flag can be set. */
-	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
-	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
-		return -EINVAL;
+	ret = linehandle_validate_flags(lflags);
+	if (ret)
+		return ret;
 
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
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

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
[2] https://github.com/warthog618/gpiod.git
