Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3985723FE73
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIN0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgHIN0c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:32 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CB5C061756;
        Sun,  9 Aug 2020 06:26:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o5so3458294pgb.2;
        Sun, 09 Aug 2020 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pZirJY7eLSxkMYNtFYx5fI/7NxP8vlh51JE9Di+5JPI=;
        b=oyG6xk26d3RzqDDAq5mgknNK+zyVowskGWNXktKHit7QsKgFlTA8HofCH0KuOVL+rA
         SjCvDK0ap1Ao8LRphraQ4e46G93szAKzz83cV4uE/zacyZD5YeUBWToW3a0ROhnrXh74
         LgLztZGjrF/Cis+xf0QFbMqSS+9DZfbZ0mOMTYp7i7DXQtNCGvLF2vyxHA5syjHL2RJM
         Y6si5S04wY3209RyTmdXhH4KdrO2BYdEuhf51w0DDe/CmeLdBH5DfgoG6Kk1BH9kA2Dd
         l9e1yfsijmY2wLX08tbWe5v1SXfijX9uMxav60vC+tt3FJLOHZvsKClf5XIFyzreC913
         N3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZirJY7eLSxkMYNtFYx5fI/7NxP8vlh51JE9Di+5JPI=;
        b=POhVb6ywTLLjbMhpwYcYAHuvF/0my+9WHCb+27sKXBHX+ES9Ut2OsA5JaHZKeFQqQJ
         F9UwQf78DSzMnr7VDpmddPFiTX19mfnfR1zkxeZ27VPOFpQRaaVUMamCvWod2tWpXtbN
         UsMuxY3sUCQcLgtDeESMYCQ2LCNQc+MmMRxtwHIRF6OISv4vdUy0Yx2GXBFS7cr2CY2T
         eSvUMV9RtaYZhr3gZOt/LGB1bgUsJw83QOOKzjQ+JtxnoAeS/ongEmF1NL/uIiSg+Ujq
         GERkhJR6W9rzbhgJYwSzLDYLvJvfBOknqskjffHzLsSPk1FQGuTQswr+UmF05+4n9NAI
         2ptA==
X-Gm-Message-State: AOAM532+XWwWpB69yo/JeauwerxDzUJ9P1ml6qc+ZplXjyA+iMvO+FfT
        vyh/TbS5bT04ICTcT0TXh7Rj+GpX
X-Google-Smtp-Source: ABdhPJztjAOwjh6ujndNcMBCwYI1NjcidmCfgdQ+vf1XWkpwB4UFLqb2MySd504NpVEPNwMdh5IbHw==
X-Received: by 2002:a05:6a00:90:: with SMTP id c16mr21781803pfj.200.1596979590580;
        Sun, 09 Aug 2020 06:26:30 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:26:29 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 05/18] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL
Date:   Sun,  9 Aug 2020 21:25:16 +0800
Message-Id: <20200809132529.264312-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The struct line implementation is based on the v1 struct linehandle
implementation.

The line_ioctl() is a simple wrapper around line_get_values() here, but
will be extended with other ioctls in subsequent patches.

 drivers/gpio/gpiolib-cdev.c | 413 ++++++++++++++++++++++++++++++++++++
 1 file changed, 413 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..4b657492d836 100644
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
@@ -34,6 +36,7 @@
  * GPIO line handle management
  */
 
+#ifdef CONFIG_GPIO_CDEV_V1
 /**
  * struct linehandle_state - contains the state of a userspace handle
  * @gdev: the GPIO device the handle pertains to
@@ -376,6 +379,390 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	linehandle_free(lh);
 	return ret;
 }
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
+/**
+ * struct line - contains the state of a userspace line request
+ * @gdev: the GPIO device the line request pertains to
+ * @label: consumer label used to tag descriptors
+ * @num_descs: the number of descriptors held in the descs array
+ * @descs: the GPIO descriptors held by this line request, with @num_descs
+ * elements.
+ */
+struct line {
+	struct gpio_device *gdev;
+	const char *label;
+	u32 num_descs;
+	struct gpio_desc *descs[];
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
+				     int line_idx)
+{
+	int i;
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
+					    int line_idx)
+{
+	int i;
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
+	/* Bias requies explicit direction. */
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
+					int num_lines)
+{
+	int i, ret;
+	u64 flags;
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
+	if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
+		set_bit(FLAG_IS_OUT, flagsp);
+	else if (flags & GPIO_V2_LINE_FLAG_INPUT)
+		clear_bit(FLAG_IS_OUT, flagsp);
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
+static long line_get_values(struct line *line, void __user *ip)
+{
+	struct gpio_v2_line_values lv;
+	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
+	DECLARE_BITMAP(mask, GPIO_V2_LINES_MAX);
+	struct gpio_desc **descs;
+	int ret, i, didx, num_get = 0;
+
+	/* NOTE: It's ok to read values of output lines. */
+	if (copy_from_user(&lv, ip, sizeof(lv)))
+		return -EFAULT;
+
+	if (lv.mask == 0)
+		return -EINVAL;
+
+	bitmap_from_u64(mask, lv.mask);
+	num_get = bitmap_weight(mask, line->num_descs);
+	if (num_get == line->num_descs)	{
+		descs = line->descs;
+	} else {
+		descs = kmalloc_array(num_get, sizeof(*descs), GFP_KERNEL);
+		for (didx = 0, i = 0; i < line->num_descs; i++) {
+			if (test_bit(i, mask)) {
+				descs[didx] = line->descs[i];
+				didx++;
+			}
+		}
+	}
+	ret = gpiod_get_array_value_complex(false,
+					    true,
+					    num_get,
+					    descs,
+					    NULL,
+					    vals);
+
+	if (descs != line->descs)
+		kfree(descs);
+	if (ret)
+		return ret;
+
+	lv.bits = 0;
+	for (didx = 0, i = 0; i < line->num_descs; i++) {
+		if (test_bit(i, mask)) {
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
+static long line_ioctl(struct file *file, unsigned int cmd,
+		       unsigned long arg)
+{
+	struct line *line = file->private_data;
+	void __user *ip = (void __user *)arg;
+
+	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
+		return line_get_values(line, ip);
+
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long line_ioctl_compat(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	return line_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static void line_free(struct line *line)
+{
+	int i;
+
+	for (i = 0; i < line->num_descs; i++) {
+		if (line->descs[i])
+			gpiod_free(line->descs[i]);
+	}
+	kfree(line->label);
+	put_device(&line->gdev->dev);
+	kfree(line);
+}
+
+static int line_release(struct inode *inode, struct file *file)
+{
+	struct line *line = file->private_data;
+
+	line_free(line);
+	return 0;
+}
+
+static const struct file_operations line_fileops = {
+	.release = line_release,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = line_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = line_ioctl_compat,
+#endif
+};
+
+static int line_create(struct gpio_device *gdev, void __user *ip)
+{
+	struct gpio_v2_line_request lr;
+	struct line *line;
+	struct file *file;
+	int fd, i, ret;
+	struct gpio_v2_line_config *lc;
+	unsigned long flags;
+
+	if (copy_from_user(&lr, ip, sizeof(lr)))
+		return -EFAULT;
+	if ((lr.num_lines == 0) || (lr.num_lines > GPIO_V2_LINES_MAX))
+		return -EINVAL;
+
+	if (memchr_inv(lr.padding, 0, sizeof(lr.padding)))
+		return -EINVAL;
+
+	lc = &lr.config;
+	ret = gpio_v2_line_config_validate(lc, lr.num_lines);
+	if (ret)
+		return ret;
+
+	line = kzalloc(struct_size(line, descs, lr.num_lines),
+		       GFP_KERNEL);
+	if (!line)
+		return -ENOMEM;
+
+	line->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	lr.consumer[sizeof(lr.consumer)-1] = '\0';
+	if (strlen(lr.consumer)) {
+		line->label = kstrdup(lr.consumer, GFP_KERNEL);
+		if (!line->label) {
+			ret = -ENOMEM;
+			goto out_free_line;
+		}
+	}
+
+	line->num_descs = lr.num_lines;
+
+	/* Request each GPIO */
+	for (i = 0; i < lr.num_lines; i++) {
+		u32 offset = lr.offsets[i];
+		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
+
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
+			goto out_free_line;
+		}
+
+		ret = gpiod_request(desc, line->label);
+		if (ret)
+			goto out_free_line;
+
+		line->descs[i] = desc;
+		flags = gpio_v2_line_config_flags(lc, i);
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_line;
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
+				goto out_free_line;
+		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				goto out_free_line;
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
+		goto out_free_line;
+	}
+
+	file = anon_inode_getfile("gpio-line",
+				  &line_fileops,
+				  line,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
+	lr.fd = fd;
+	if (copy_to_user(ip, &lr, sizeof(lr))) {
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
+		line->num_descs);
+
+	return 0;
+
+out_put_unused_fd:
+	put_unused_fd(fd);
+out_free_line:
+	line_free(line);
+	return ret;
+}
+
+#ifdef CONFIG_GPIO_CDEV_V1
 
 /*
  * GPIO line event management
@@ -745,6 +1132,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpioline_info *info)
 {
@@ -850,6 +1239,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
+#ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
 		struct gpioline_info lineinfo;
 
@@ -892,6 +1282,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		}
 
 		return 0;
+#endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
+		return line_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
@@ -1118,4 +1511,24 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
+
+	/*
+	 * array sizes must ensure 64-bit alignment and not create holes in
+	 * the struct packing.
+	 */
+	BUILD_BUG_ON(GPIO_V2_LINES_MAX % 2);
+	BUILD_BUG_ON(GPIO_MAX_NAME_SIZE % 8);
+
+	/*
+	 * check that uAPI structs are 64-bit aligned for 32/64-bit
+	 * compatibility
+	 */
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_attribute) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_config_attribute) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_config) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_request) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_info) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_info_changed) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_event) % 8);
+	BUILD_BUG_ON(sizeof(struct gpio_v2_line_values) % 8);
 }
-- 
2.28.0

