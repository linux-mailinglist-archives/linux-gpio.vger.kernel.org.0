Return-Path: <linux-gpio+bounces-22426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0AAEDD11
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67F24189268F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A173E2701DC;
	Mon, 30 Jun 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GyhDHZt2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232828A41B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287046; cv=none; b=kA8SVesCalngSKLRZXIn+JLPIFDb9fzBqLCqKl0/+/GQGOyHqYwDLjImVPvA5mlcVzcWnDwvI4GikPnNcdJAQPxECGunjXTksZt+BlA2gwXBFL2cxsuw62+569cKo6MgmrtyW1PwbEfNIrNaMNxnOk1bTUeLzyMJAeldI8L3zFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287046; c=relaxed/simple;
	bh=HhG83jFmoV5xdCHkj21aD/0tubc0+blTrTs2HK40gu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tT5AluYrdDJUqHgXL5NXyLdxkr6RK/GmpqN8m72/S1bO8eYdU80UxBs64B5Ccmzd6Zk56eD/cfH3JgMeKRfe0FnLNmduZa7vT1UscRgqK4ocyyXNxW7U9jHrSIZo/INV+rFOlBKw7cG75NWDCETQAlGTdf5nwIxE8tUOFm1gsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GyhDHZt2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a52874d593so1758768f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287043; x=1751891843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bPbuY7LrWyKcfoiO0z5WW0ENh7MgP8sldaKCSQKpoc=;
        b=GyhDHZt210bfoyRlL3VrQweANBZYwzb2LEZApPJ9Jyahz8ZM/pWFLQnuZN8Dmj6rNR
         OjIH2H8/yxeGGOQb9bfB25q2mGIsVg9VzGJYfUY/n6f2Mrbi/WVnxtfNTyuhp+vqarH/
         L3eTUwBmCWeQVW9zFH2T34wAPb1jnQ216HngOVVMgj/ndfxExbMzu9QI1W/h6W6MalLl
         7QuKsYvwMf0GhDVFWplfySvptWpZA9fpbgF/Bi0AM+FHIZ7zejq5i+rUokuiB8B6nPLo
         RX9+3kGfE5rSbS+DTpnSdL0bvJy2w4ZMeW0tpA6mgTkQty5mIaELh4uLpfPhzoODyHLq
         S9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287043; x=1751891843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bPbuY7LrWyKcfoiO0z5WW0ENh7MgP8sldaKCSQKpoc=;
        b=jbzcuey6Jf/EdpwKHMM41FgjEQkNk7/J1DXylyAIPpOIE5K7QIPcm5MxQY0D46ue5P
         fpF5MGaz8rfASurMNMiklOQz+yWwaOwMw9ql/j79cNsjWHbzpr8/RtcrgDxRiMwZjUtO
         GcCQOWxrLNT/dSZdk/yogEpdKavIbF+fBi2ixfwgv8c2AlUonFy/trFlVg4rW4fNfMk8
         yexh05H368pCl8HpjpKSXxUV6twT6iAOEfN0ih+Szs70UD86vkUiVzDvUy1WU3R+pebw
         t5m8oqYUho8FoKcNkAKQ0rISEw3APyryJG9NvinpO34P7ofnmNdis5CPx5w8bf60MlvW
         aMsw==
X-Gm-Message-State: AOJu0Yx92wrzFaql9XBAVb/WskyAlRoY8kvA/vJDhXh5hH3uSU8EBI26
	edCxPAC94kcf/hyOkJMKQ7NoFqeAyAGjcduFQY8uqVhL8x2rWl2Cp6v9imUXWRZN7qI=
X-Gm-Gg: ASbGncvuTM4qE8DspgCqgibkDD0q9pGozb1IP3Xt+fvnKglJGMgwhfKLefcwncYnXJV
	S+Z89z/KW1DcY1wl/6InudX+INMlq6XvcJYOGs3DS+M0MZwRGCpMl7xtR2/mNXias0CZz/9DAYT
	xA0JT++793k2TKnCdE8QhsKcgrFmcuRKea49QmeMWISjbv8oW2PUh2mQqAM2q0zQDOf6/nJh6Dk
	ujoI0r+ctdecG36CpVfQm/9QSQ794CyoHYw6HnM2BiSMRaRjYzCgwgu3CMz/aarFiJ4mIimMNSD
	230xdI6BhA5VcQ8Pg9uPMXKzcxraklRk6qG0g/37FLL1XC9W1iwZT20R
X-Google-Smtp-Source: AGHT+IF+yPov1WXgvQWnkfLsinR57y3qTb4t0WeCxrJa8Y7SocBwE9AbliORnizqDHQNwN4Ap8x84g==
X-Received: by 2002:adf:b649:0:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a8f4549152mr10743050f8f.5.1751287042643;
        Mon, 30 Jun 2025 05:37:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:09 +0200
Subject: [PATCH v3 02/10] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-2-b997be9b7137@linaro.org>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9925;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FnQGtT4MFyQtsq5dSlUq/XlWDskcX3/x8jCYFrX9rOI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT8zNlPt3WijyL9s04lgnhitIoAxw6Q6ZF7z
 B7V3fBsAzyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/AAKCRARpy6gFHHX
 cny9D/4sIMpXxyrrAAiliWCXfPWaunf7lCW9BJ1TPLMbrbfNGvU9hNnLZSmRO0pn41KM6LboSSP
 fy+81uDj6t8BjbAeBkiPs8mhLfax8axl8L3igbOgJ0pTn4hk+dLJIx+s08NeQPjvwyk/TOhLp9v
 odEOMjgVi0iIAWF7/0sdMO+vA+XeuPBjm+ZQ9FcuZTqjW1A2wS32mAI24WvNBE8aCayy4JoW4x5
 GEWND9kX6kmpa4WtzOp6TAGr3d5PvN6LZpd5zi2e+XL/tl+1lalAkXXD2+nk1DrbjJyS09QUtuN
 xjy+0RI1iL5D/AupuDg9aqLRwMa3rUf+wOJrGXumytzinljtaQ+KWjUPV2zeaeIoh3y1FnIXgfg
 tyh0IlJI/n7X/VTv6Zod+MCxU1yn4PUET8p6QYIaNmhb3xNAH6cR9BdJJpCpfdOEXgWuFhaE+jS
 sDbxOEsBjbjPH1RE7/Kis9dfpccf07ojcY6F9WFdtMXc+3EYfukZeSQnK28XKNArEu+leSHhFqM
 jX2cuZol/bmHJwSQ65LnsxBc79AUrlYlDofQlWoNBD/lqdaZ9B+lJh5IZxM99vVWhIq2RY8GGOX
 blExIg6ffEfEERVPGyktQdc9Z+vEmDmP0uJkWYjvpS4wbnxVZC76c9+Oq7ClsbU18hzzq8M2CFx
 ruyGLvr0C5CCHBQ==
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
 drivers/gpio/gpiolib-sysfs.c          | 192 +++++++++++++++++++++++++---------
 2 files changed, 150 insertions(+), 49 deletions(-)

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
index c4e85f2827697d0239ff6296caf49d243cf10fe8..990db0405cc86c42bad61295dc823f970199534e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -45,6 +45,7 @@ struct gpiod_data {
 
 struct gpiodev_data {
 	struct gpio_device *gdev;
+	struct device *cdev_id; /* Class device by GPIO device ID */
 	struct device *cdev_base; /* Class device by GPIO base */
 };
 
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
+	NULL
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
@@ -787,6 +871,17 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return err;
 	}
 
+	data->cdev_id = device_create_with_groups(&gpio_class, parent,
+						  MKDEV(0, 0), data,
+						  gpiochip_ext_groups,
+						  "chip%d", gdev->id);
+	if (IS_ERR(data->cdev_id)) {
+		device_unregister(data->cdev_base);
+		err = PTR_ERR(data->cdev_id);
+		kfree(data);
+		return err;
+	}
+
 	return 0;
 }
 
@@ -802,6 +897,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 			return;
 
 		device_unregister(data->cdev_base);
+		device_unregister(data->cdev_id);
 		kfree(data);
 	}
 

-- 
2.48.1


