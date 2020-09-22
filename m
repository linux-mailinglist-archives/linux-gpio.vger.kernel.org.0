Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C408F2738B3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbgIVCf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbgIVCf1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:35:27 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBA4C061755;
        Mon, 21 Sep 2020 19:35:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o20so11057728pfp.11;
        Mon, 21 Sep 2020 19:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dr95lYI31X9e5r3ZvNb1lxA4hCgTpkGZTFr/Dl4De7I=;
        b=a9J5PCAC2SNzFo9WltBrDJZJ9bot1XgxyrRch03H7xxClPowN6+/fIYD4gJ8aX5xe1
         pz3eoyCkrrpIkb0rOxH+ITQPHvHsI8S9Ijcwt5/JzSRJiHZ3c6CTBhz7A6kZjFYYOHRa
         l4PPxfryPWNwTHG9TaxxecHeeXvcTs6x32v+zBRvUJpF2b6gbYrc3LP6gqmCF70b95WO
         43NeguqTyvyXT+IioIKt+lY6Oft046FZlutmN7Vm8F4MieS5cOHTrq9/WOCcsc1W5QCS
         EYOzo4q0M6gkpCJtTpsddQ4vd5ULJ7iaeDesmidHTSuakz96xwOX9/jutTry3IRkL6aB
         WzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dr95lYI31X9e5r3ZvNb1lxA4hCgTpkGZTFr/Dl4De7I=;
        b=h5bWK7flr9pvAp+lGyUK4Af72T4MWpgdcpZL41GKVfGIpciJnsTqgr12dZ/TPnmiNc
         jeBcYgx3NbKmc1OTbDabC7BZ4l0oaZaAo7iG6PBVnXHFwV1BXHJZM1ejg3Rc8IxeuoEy
         N2NbnKYhzRh4jeDh6v69I2K8Yi30nnUOJ539UH1dsDh0zaoyEEcNCRrllPQnXD3NO2IZ
         5B1SP0NK2mSsz9t5xHk6fGlytKnGvwb0UOsa320X8S/WM+1gE5r5DoJs/4tUSvQpZcMR
         feTOSGdtVC6KfusafTmaQPQJjnKTHsY0ZRXzGH+yDmW2jXzPHn/2DFKd6EJIS3hUqRF7
         dRQw==
X-Gm-Message-State: AOAM530sThyD05F7+NtTE7pbJvroUYT7tImkcjyWRbAqjjNTBj1Bpm9+
        kNwyB1+1/g4s2vNzHwLPc/2K3V8aY2zffw==
X-Google-Smtp-Source: ABdhPJxcIBnVLiwV1JdjyuHxljMuwLVTczJX1QzOxo5ZxKY/dOwJST5Y2u0OkbAhHOQHbITZG5GIKg==
X-Received: by 2002:a62:1a95:0:b029:13c:1611:66bd with SMTP id a143-20020a621a950000b029013c161166bdmr2257032pfa.8.1600742126462;
        Mon, 21 Sep 2020 19:35:26 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:35:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL
Date:   Tue, 22 Sep 2020 10:31:38 +0800
Message-Id: <20200922023151.387447-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.

The struct linereq implementation is based on the v1 struct linehandle
implementation.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The linereq_ioctl() is a simple wrapper around linereq_get_values() here,
but will be extended with other ioctls in subsequent patches.

Similarly, the struct line only contains the desc here, but will receive
the edge detector and debouncer fields in subsequent patches.

Changed for v8:
 - fix BUILD_BUG_ON conditions and relocate them before the return in
   gpiolib_cdev_register()

Changes for v7:
 - add check on kmalloc_array return value

Changes for v5:
 - as per cover letter

Changes for v4:
 - fix handling of mask in line_get_values

 drivers/gpio/gpiolib-cdev.c | 422 ++++++++++++++++++++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 86679397d09c..7a3ed2617f74 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/anon_inodes.h>
+#include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/build_bug.h>
 #include <linux/cdev.h>
 #include <linux/compat.h>
 #include <linux/device.h>
@@ -24,6 +26,25 @@
 #include "gpiolib.h"
 #include "gpiolib-cdev.h"
 
+/*
+ * Array sizes must ensure 64-bit alignment and not create holes in the
+ * struct packing.
+ */
+static_assert(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
+static_assert(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
+
+/*
+ * Check that uAPI structs are 64-bit aligned for 32/64-bit compatibility
+ */
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
+static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
+
 /* Character device interface to GPIO.
  *
  * The GPIO character device, /dev/gpiochipN, provides userspace an
@@ -34,6 +55,7 @@
  * GPIO line handle management
  */
 
+#ifdef CONFIG_GPIO_CDEV_V1
 /**
  * struct linehandle_state - contains the state of a userspace handle
  * @gdev: the GPIO device the handle pertains to
@@ -376,6 +398,400 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	linehandle_free(lh);
 	return ret;
 }
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
+/**
+ * struct line - contains the state of a requested line
+ * @desc: the GPIO descriptor for this line.
+ */
+struct line {
+	struct gpio_desc *desc;
+};
+
+/**
+ * struct linereq - contains the state of a userspace line request
+ * @gdev: the GPIO device the line request pertains to
+ * @label: consumer label used to tag GPIO descriptors
+ * @num_lines: the number of lines in the lines array
+ * @lines: the lines held by this line request, with @num_lines elements.
+ */
+struct linereq {
+	struct gpio_device *gdev;
+	const char *label;
+	u32 num_lines;
+	struct line lines[];
+};
+
+#define GPIO_V2_LINE_BIAS_FLAGS \
+	(GPIO_V2_LINE_FLAG_BIAS_PULL_UP | \
+	 GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN | \
+	 GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+
+#define GPIO_V2_LINE_DIRECTION_FLAGS \
+	(GPIO_V2_LINE_FLAG_INPUT | \
+	 GPIO_V2_LINE_FLAG_OUTPUT)
+
+#define GPIO_V2_LINE_DRIVE_FLAGS \
+	(GPIO_V2_LINE_FLAG_OPEN_DRAIN | \
+	 GPIO_V2_LINE_FLAG_OPEN_SOURCE)
+
+#define GPIO_V2_LINE_VALID_FLAGS \
+	(GPIO_V2_LINE_FLAG_ACTIVE_LOW | \
+	 GPIO_V2_LINE_DIRECTION_FLAGS | \
+	 GPIO_V2_LINE_DRIVE_FLAGS | \
+	 GPIO_V2_LINE_BIAS_FLAGS)
+
+static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
+				     unsigned int line_idx)
+{
+	unsigned int i;
+	u64 mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_FLAGS) &&
+		    (lc->attrs[i].mask & mask))
+			return lc->attrs[i].attr.flags;
+	}
+	return lc->flags;
+}
+
+static int gpio_v2_line_config_output_value(struct gpio_v2_line_config *lc,
+					    unsigned int line_idx)
+{
+	unsigned int i;
+	u64 mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES) &&
+		    (lc->attrs[i].mask & mask))
+			return !!(lc->attrs[i].attr.values & mask);
+	}
+	return 0;
+}
+
+static int gpio_v2_line_flags_validate(u64 flags)
+{
+	/* Return an error if an unknown flag is set */
+	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
+		return -EINVAL;
+
+	/*
+	 * Do not allow both INPUT & OUTPUT flags to be set as they are
+	 * contradictory.
+	 */
+	if ((flags & GPIO_V2_LINE_FLAG_INPUT) &&
+	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
+		return -EINVAL;
+
+	/*
+	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
+	 * the hardware actually supports enabling both at the same time the
+	 * electrical result would be disastrous.
+	 */
+	if ((flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN) &&
+	    (flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* Drive requires explicit output direction. */
+	if ((flags & GPIO_V2_LINE_DRIVE_FLAGS) &&
+	    !(flags & GPIO_V2_LINE_FLAG_OUTPUT))
+		return -EINVAL;
+
+	/* Bias requires explicit direction. */
+	if ((flags & GPIO_V2_LINE_BIAS_FLAGS) &&
+	    !(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED) &&
+	     (flags & (GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN |
+		       GPIO_V2_LINE_FLAG_BIAS_PULL_UP))) ||
+	    ((flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN) &&
+	     (flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
+					unsigned int num_lines)
+{
+	unsigned int i;
+	u64 flags;
+	int ret;
+
+	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
+		return -EINVAL;
+
+	if (memchr_inv(lc->padding, 0, sizeof(lc->padding)))
+		return -EINVAL;
+
+	for (i = 0; i < num_lines; i++) {
+		flags = gpio_v2_line_config_flags(lc, i);
+		ret = gpio_v2_line_flags_validate(flags);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
+						    unsigned long *flagsp)
+{
+	assign_bit(FLAG_ACTIVE_LOW, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
+
+	if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
+		set_bit(FLAG_IS_OUT, flagsp);
+	else if (flags & GPIO_V2_LINE_FLAG_INPUT)
+		clear_bit(FLAG_IS_OUT, flagsp);
+
+	assign_bit(FLAG_OPEN_DRAIN, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
+	assign_bit(FLAG_OPEN_SOURCE, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	assign_bit(FLAG_PULL_UP, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
+	assign_bit(FLAG_PULL_DOWN, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
+	assign_bit(FLAG_BIAS_DISABLE, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+}
+
+static long linereq_get_values(struct linereq *lr, void __user *ip)
+{
+	struct gpio_v2_line_values lv;
+	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
+	struct gpio_desc **descs;
+	unsigned int i, didx, num_get;
+	int ret;
+
+	/* NOTE: It's ok to read values of output lines. */
+	if (copy_from_user(&lv, ip, sizeof(lv)))
+		return -EFAULT;
+
+	for (num_get = 0, i = 0; i < lr->num_lines; i++) {
+		if (lv.mask & BIT_ULL(i)) {
+			num_get++;
+			descs = &lr->lines[i].desc;
+		}
+	}
+
+	if (num_get == 0)
+		return -EINVAL;
+
+	if (num_get != 1) {
+		descs = kmalloc_array(num_get, sizeof(*descs), GFP_KERNEL);
+		if (!descs)
+			return -ENOMEM;
+		for (didx = 0, i = 0; i < lr->num_lines; i++) {
+			if (lv.mask & BIT_ULL(i)) {
+				descs[didx] = lr->lines[i].desc;
+				didx++;
+			}
+		}
+	}
+	ret = gpiod_get_array_value_complex(false, true, num_get,
+					    descs, NULL, vals);
+
+	if (num_get != 1)
+		kfree(descs);
+	if (ret)
+		return ret;
+
+	lv.bits = 0;
+	for (didx = 0, i = 0; i < lr->num_lines; i++) {
+		if (lv.mask & BIT_ULL(i)) {
+			if (test_bit(didx, vals))
+				lv.bits |= BIT_ULL(i);
+			didx++;
+		}
+	}
+
+	if (copy_to_user(ip, &lv, sizeof(lv)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long linereq_ioctl(struct file *file, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct linereq *lr = file->private_data;
+	void __user *ip = (void __user *)arg;
+
+	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
+		return linereq_get_values(lr, ip);
+
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long linereq_ioctl_compat(struct file *file, unsigned int cmd,
+				 unsigned long arg)
+{
+	return linereq_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static void linereq_free(struct linereq *lr)
+{
+	unsigned int i;
+
+	for (i = 0; i < lr->num_lines; i++) {
+		if (lr->lines[i].desc)
+			gpiod_free(lr->lines[i].desc);
+	}
+	kfree(lr->label);
+	put_device(&lr->gdev->dev);
+	kfree(lr);
+}
+
+static int linereq_release(struct inode *inode, struct file *file)
+{
+	struct linereq *lr = file->private_data;
+
+	linereq_free(lr);
+	return 0;
+}
+
+static const struct file_operations line_fileops = {
+	.release = linereq_release,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = linereq_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = linereq_ioctl_compat,
+#endif
+};
+
+static int linereq_create(struct gpio_device *gdev, void __user *ip)
+{
+	struct gpio_v2_line_request ulr;
+	struct gpio_v2_line_config *lc;
+	struct linereq *lr;
+	struct file *file;
+	u64 flags;
+	unsigned int i;
+	int fd, ret;
+
+	if (copy_from_user(&ulr, ip, sizeof(ulr)))
+		return -EFAULT;
+
+	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
+		return -EINVAL;
+
+	if (memchr_inv(ulr.padding, 0, sizeof(ulr.padding)))
+		return -EINVAL;
+
+	lc = &ulr.config;
+	ret = gpio_v2_line_config_validate(lc, ulr.num_lines);
+	if (ret)
+		return ret;
+
+	lr = kzalloc(struct_size(lr, lines, ulr.num_lines), GFP_KERNEL);
+	if (!lr)
+		return -ENOMEM;
+
+	lr->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
+	if (strlen(ulr.consumer)) {
+		lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
+		if (!lr->label) {
+			ret = -ENOMEM;
+			goto out_free_linereq;
+		}
+	}
+
+	lr->num_lines = ulr.num_lines;
+
+	/* Request each GPIO */
+	for (i = 0; i < ulr.num_lines; i++) {
+		u32 offset = ulr.offsets[i];
+		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
+
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
+			goto out_free_linereq;
+		}
+
+		ret = gpiod_request(desc, lr->label);
+		if (ret)
+			goto out_free_linereq;
+
+		lr->lines[i].desc = desc;
+		flags = gpio_v2_line_config_flags(lc, i);
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_linereq;
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
+			int val = gpio_v2_line_config_output_value(lc, i);
+
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				goto out_free_linereq;
+		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				goto out_free_linereq;
+		}
+
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIOLINE_CHANGED_REQUESTED, desc);
+
+		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
+			offset);
+	}
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto out_free_linereq;
+	}
+
+	file = anon_inode_getfile("gpio-line", &line_fileops, lr,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
+	ulr.fd = fd;
+	if (copy_to_user(ip, &ulr, sizeof(ulr))) {
+		/*
+		 * fput() will trigger the release() callback, so do not go onto
+		 * the regular error cleanup path here.
+		 */
+		fput(file);
+		put_unused_fd(fd);
+		return -EFAULT;
+	}
+
+	fd_install(fd, file);
+
+	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
+		lr->num_lines);
+
+	return 0;
+
+out_put_unused_fd:
+	put_unused_fd(fd);
+out_free_linereq:
+	linereq_free(lr);
+	return ret;
+}
+
+#ifdef CONFIG_GPIO_CDEV_V1
 
 /*
  * GPIO line event management
@@ -745,6 +1161,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpioline_info *info)
 {
@@ -843,6 +1261,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
+#ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
 		struct gpioline_info lineinfo;
 
@@ -885,6 +1304,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		}
 
 		return 0;
+#endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
+		return linereq_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
-- 
2.28.0

