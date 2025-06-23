Return-Path: <linux-gpio+bounces-22003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83878AE3931
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B38172574
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51979231C87;
	Mon, 23 Jun 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HYwQIwtO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF1E1422AB
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669219; cv=none; b=RCLfxbLlFsw13R1Hc0nrmgzRGbSJcfq0eC2Sv8flR8K4Ilg8e5tWOomUNGiMC5+qXGF5MxyidIb9MZhsoddDxJnBxmZUfFsMqRZa77YJ8yEzLxWNokOAexe0QBE0Jx6P2MltoFG+8j5TrEpFcQimm5t52XQJ2rBCHOfbVO0OadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669219; c=relaxed/simple;
	bh=MhU96uRLcWJzzxR6tZN2WX5FSYiJ7nK0M4z5jjqpgHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXMJSspQ8gZ8NhvWvqRgEAIsrc90XN43sybrzouqBgCL+7Gi21gejjFBZQHdLS48cnapkOa5cuq6gxXXukNteQfocjOXzegQxCY9LbROMIKOE3TutYIhXINg2HFU4GAeLUXw80AyJZ93PKw3pHp1fOTEnho+nJ49r+NsLKCTwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HYwQIwtO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45377776935so4554365e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669214; x=1751274014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzv7rEJjpNnX5QUp0Y2Z+jm414eiLT4c5eMO9fLQc/E=;
        b=HYwQIwtON918CohIJV1JwkS4jPy7GPbQyhFODgR42+85fxETWzX55WOsD8N/8tLV6Y
         AJp1iHpA0xOZjakxk4veu1Gi86nAjAa9KhW+jBorlknZzlYv12q8O06iC+tyD2lVePpk
         1aLEHux8elGX07FhxTLmzWv4KjVQLpT0tf0ipHdMCScletPVUgh7ZsPRYzf5cWjV90O1
         D9FsTAyRbMe4FUwJJxbSmaRYrx85W15b0wT9cdcMbEjtsRQy/o4hCzu3CGeJjoBwttTa
         5Ys8uRxkRUITe/lm6vaY9JpFBYWctDZ0VRAiWEAoxF1kOZNXAQE3Pr2DC8DCym+4s4sg
         zb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669214; x=1751274014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzv7rEJjpNnX5QUp0Y2Z+jm414eiLT4c5eMO9fLQc/E=;
        b=vVTVpJTqqJuigJok+Al3GNOnH9T5GD/jitAUN7Hf5M1G14ZfoxWRPulrSa0ZL4BTU+
         vJ7Pp0avWks4eegSbskagb74l+ZDVaVUVdm8ETeLOmMB3GHQ3S65V8FX0W5rDtT4jtM4
         /yb6ItC5X2FzC/ynlIug5NrEa+rFCfT761zwnN1cf38ImsvG1GtRW6e6vaT8wXJ9Lr1P
         U23GuFHRPa0/Q0lb7HupZSQJhlN0MOPHTFtCRKgF51B7ixCfJ2MW9Dyh6bFUon3lWckx
         l6N9p2+TTDhJGOyNXah3dEW1NLL7DfEm8Ps6HlUP8+E6lGLqRxSmvYDDMTNu0vjQzwhS
         W3kA==
X-Gm-Message-State: AOJu0Yzigq9NdHpotaNsSPzp9okxLzb3/rFa/6LzRkqx7zpVNbfZIyBr
	XoIYAT5p+LL2IvVbJ0vnXoe2dEeJCpVSNGhG/Pg0zIHR+Gq9WzU4L4g23rnbJnrexn0=
X-Gm-Gg: ASbGncv+8FtdUtYGilfjERR1QRPE2pD17+4UcFoLxvoauE+rgqDAcwTsn8BATNljRCD
	PjJzJhpUaDJWDjBX2euxCBzZyXA+PhcuswtIMS6PEbytCbYZy76Zd5OUj8ovFaS6TP4iZeKpaiJ
	2D4JvCzzjFg5s94kolifWNjIirqCS5sQ4kwhT2MgpFGrZ9yUm7EXzBv1tFiMbJEV2vCp0OSJJG7
	L5uhuP0M6w50rvwWX+kMZQ3PR5lmNGl5lTbQrDeBryGzzO7pJ5vpdvRwQPXvhtYIabD7ECA83XZ
	ee20BepuTUpRRwCeIbvwE7WScXL5QXi7JSKE7vyC3uRIHH7W3Mv5wT0=
X-Google-Smtp-Source: AGHT+IHSkumK5IdIX+YDtLlhPcb5/NvipdPY8QkB2OX0ajip0iOIR4tNSqyoiKEu/nWy8UPJZq4u1Q==
X-Received: by 2002:a05:600c:8b11:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-4536b4bf64bmr81273415e9.10.1750669213158;
        Mon, 23 Jun 2025 02:00:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:49 +0200
Subject: [PATCH v2 1/9] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-1-d592793f8964@linaro.org>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9913;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=n0E0L9Xpa7/NHeu4WacRTt4t+8eu7AU+P/7e1Mm6w74=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReZYmMGm4GZN8sGJRBVPbq98QfwXtPOWgwh8
 dN0ie9SszWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmQAKCRARpy6gFHHX
 cmAXD/4/nTuaRyHWOHB0oqGl3VKcz3T/TNKZ/060gfICot0rES9uO1rkgmBZHfz4CD9Wmw3Knp/
 4drpuIUIhTQ9R4enn2SHfup3ff6xMo+TTgsHqBFqs2PxchhGKHEaY/VX5JL6UC7asGsqOSUBGxb
 fi05qGEJhoAeAcD0RkMQyqLY1dKtaajkOT1SNfQMroz20ZYJkTpxOqgvSRb7bgbMPJaag5q/QaU
 9qWW/DRJFvFflqpsl4D14VkyTFmutswdQIYQsU+oakKH4Bk1whoOn528CX3WnahqP+t0ix41CXn
 SVjo6HIyw3s/xA3fHTN44DK3ENKGCsyGo9UwzwTSugKSLg/MwALcWLs69KSApfxNaKXTw2VEqO8
 QskdBzs7JOWZBCIOFJd0y3NKrQT6qTCLSwKMKH907Z6x994jDtdcu/0wLDDqJGed4S4F5xlezZ1
 qBHoIOZbki2HP2vsvAOq7sdxnyEpOTGyk/W9JIBANCFHOAEnAsJSZZOGkDxGvb+4ahLQHH2y1FL
 ffGG3lQ4mAiMtar8h8Xq4OCVy9ujxem94nYgfH/na2cdqr3b0QIDJi2FqON9RD1gT8z4BL57cat
 zHI5S024JLtxlpqRlsDyvjSvocU+OEysjxvK9TRGtaCN+X9ihyQJHu7MMWodXTRHw6uXfJsGRTU
 5Aas1tkKuvPnLrg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to enable moving away from the global GPIO numberspace-based
exporting of lines over sysfs: add a parallel, per-chip entry under
/sys/class/gpio/ for every registered GPIO chip, denoted by device ID
in the file name and not its base GPIO number.

Compared to the existing chip group: it does not contain the "base"
attribute as the goal of this change is to not refer to GPIOs by their
global number from user-space anymore. It also contains its own,
per-chip export/unexport attribute pair which allow to export lines by
their hardware offset within the chip.

Caveat #1: the new device cannot be a link to (or be linked to by) the
existing "gpiochip<BASE>" entry as we cannot create links in
/sys/class/xyz/.

Caveat #2: the new entry cannot be named "gpiochipX" as it could
conflict with devices whose base is statically defined to a low number.
Let's go with "chipX" instead.

While at it: the chip label is unique so update the untrue statement
when extending the docs.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |   7 +-
 drivers/gpio/gpiolib-sysfs.c          | 191 +++++++++++++++++++++++++---------
 2 files changed, 149 insertions(+), 49 deletions(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index 480316fee6d80fb7a0ed61706559838591ec0932..ff694708a3bef787afa42dedf94faf209c44dbf0 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -25,8 +25,13 @@ Description:
 	    /active_low ... r/w as: 0, 1
 	/gpiochipN ... for each gpiochip; #N is its first GPIO
 	    /base ... (r/o) same as N
-	    /label ... (r/o) descriptive, not necessarily unique
+	    /label ... (r/o) descriptive chip name
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	/chipX ... for each gpiochip; #X is the gpio device ID
+	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
+	    /unexport ... to return a GPIO at HW offset X to the kernel
+	    /label ... (r/o) descriptive chip name
+	    /ngpio ... (r/o) number of GPIOs exposed by the chip
 
   This ABI is obsoleted by Documentation/ABI/testing/gpio-cdev and will be
   removed after 2020.
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c4c21e25c682b939e4a0517393308343feb6585a..fbe93cda4ca16038a1cffe766f7e5ead55ace5e6 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -46,6 +46,7 @@ struct gpiod_data {
 struct gpiodev_data {
 	struct gpio_device *gdev;
 	struct device *cdev_base; /* Class device by GPIO base */
+	struct device *cdev_id; /* Class device by GPIO device ID */
 };
 
 /*
@@ -399,6 +400,14 @@ static const struct attribute_group *gpio_groups[] = {
  *   /base ... matching gpio_chip.base (N)
  *   /label ... matching gpio_chip.label
  *   /ngpio ... matching gpio_chip.ngpio
+ *
+ * AND
+ *
+ * /sys/class/gpio/chipX/
+ *   /export ... export GPIO at given offset
+ *   /unexport ... unexport GPIO at given offset
+ *   /label ... matching gpio_chip.label
+ *   /ngpio ... matching gpio_chip.ngpio
  */
 
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
@@ -428,6 +437,111 @@ static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(ngpio);
 
+static int export_gpio_desc(struct gpio_desc *desc)
+{
+	int offset, ret;
+
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
+	offset = gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
+				     gpio_chip_hwgpio(desc));
+		return -EINVAL;
+	}
+
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+
+	ret = gpiod_request_user(desc, "sysfs");
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_transitory(desc, false);
+	if (ret) {
+		gpiod_free(desc);
+		return ret;
+	}
+
+	ret = gpiod_export(desc, true);
+	if (ret < 0) {
+		gpiod_free(desc);
+	} else {
+		set_bit(FLAG_SYSFS, &desc->flags);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+	}
+
+	return ret;
+}
+
+static int unexport_gpio_desc(struct gpio_desc *desc)
+{
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+	if (!test_and_clear_bit(FLAG_SYSFS, &desc->flags))
+		return -EINVAL;
+
+	gpiod_unexport(desc);
+	gpiod_free(desc);
+
+	return 0;
+}
+
+static ssize_t do_chip_export_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, ssize_t size,
+				    int (*handler)(struct gpio_desc *desc))
+{
+	struct gpiodev_data *data = dev_get_drvdata(dev);
+	struct gpio_device *gdev = data->gdev;
+	struct gpio_desc *desc;
+	unsigned int gpio;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &gpio);
+	if (ret)
+		return ret;
+
+	desc = gpio_device_get_desc(gdev, gpio);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	ret = handler(desc);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
+static ssize_t chip_export_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, export_gpio_desc);
+}
+
+static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
+							chip_export_store);
+
+static ssize_t chip_unexport_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, unexport_gpio_desc);
+}
+
+static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
+							  NULL,
+							  chip_unexport_store);
+
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
@@ -436,6 +550,15 @@ static struct attribute *gpiochip_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip);
 
+static struct attribute *gpiochip_ext_attrs[] = {
+	&dev_attr_label.attr,
+	&dev_attr_ngpio.attr,
+	&dev_attr_export.attr,
+	&dev_attr_unexport.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gpiochip_ext);
+
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -447,7 +570,7 @@ static ssize_t export_store(const struct class *class,
 			    const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
-	int status, offset;
+	int status;
 	long gpio;
 
 	status = kstrtol(buf, 0, &gpio);
@@ -461,40 +584,7 @@ static ssize_t export_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
-
-	offset = gpio_chip_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
-		pr_debug_ratelimited("%s: GPIO %ld masked\n", __func__, gpio);
-		return -EINVAL;
-	}
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-
-	status = gpiod_request_user(desc, "sysfs");
-	if (status)
-		goto done;
-
-	status = gpiod_set_transitory(desc, false);
-	if (status) {
-		gpiod_free(desc);
-		goto done;
-	}
-
-	status = gpiod_export(desc, true);
-	if (status < 0) {
-		gpiod_free(desc);
-	} else {
-		set_bit(FLAG_SYSFS, &desc->flags);
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-	}
-
-done:
+	status = export_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -511,7 +601,7 @@ static ssize_t unexport_store(const struct class *class,
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
-		goto done;
+		return status;
 
 	desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpiod_unexport() ignores them) */
@@ -520,18 +610,7 @@ static ssize_t unexport_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	status = -EINVAL;
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-	if (test_and_clear_bit(FLAG_SYSFS, &desc->flags)) {
-		gpiod_unexport(desc);
-		gpiod_free(desc);
-		status = 0;
-	}
-done:
+	status = unexport_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -561,6 +640,11 @@ static int match_gdev(struct device *dev, const void *desc)
 static struct gpiodev_data *
 gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 {
+	/*
+	 * Find the first device in GPIO class that matches. Whether that's
+	 * the one indexed by GPIO base or device ID doesn't matter, it has
+	 * the same address set as driver data.
+	 */
 	struct device *cdev __free(put_device) = class_find_device(&gpio_class,
 								   NULL, gdev,
 								   match_gdev);
@@ -787,6 +871,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return err;
 	}
 
+	data->cdev_id = device_create_with_groups(&gpio_class, parent,
+						  MKDEV(0, 0), data,
+						  gpiochip_ext_groups,
+						  "chip%d", gdev->id);
+	if (IS_ERR(data->cdev_id)) {
+		device_unregister(data->cdev_base);
+		kfree(data);
+		return PTR_ERR(data->cdev_id);
+	}
+
 	return 0;
 }
 
@@ -802,6 +896,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 			return;
 
 		device_unregister(data->cdev_base);
+		device_unregister(data->cdev_id);
 		kfree(data);
 	}
 

-- 
2.48.1


