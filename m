Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D014822D4AA
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgGYEVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEV3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:21:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3304EC0619D3;
        Fri, 24 Jul 2020 21:21:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so6639779pjb.1;
        Fri, 24 Jul 2020 21:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBJaSa9abIBLdWEVkXnGLOUCueLguuTGAWRyziSA/7s=;
        b=gJv9c/WSvkLNQbdTFv6MdZKv2rVA+HYC6+Ffv/b3ddREdG2qLkBBtRllduLX113AV/
         1hOGvlqXE71tWQ9h+Nj1dKW91dapO+6/TMtOPEzTsCZ3na2FK3+m7xQ8Vl92RHHxNY9X
         x+7nBD0or4cMTypQTwqbtMHFnIc0cgZLgn21Qhmq0X6PrpCcZSwCah9SjbF+ICF12RNb
         k9IOFeiYoZoha98RfNEHYYjFI+250XbiUr+itbrue8r6p9VPToW/MW8EomHPv65Z24oq
         uWPncLp+r5v8Hx8y0Lq14VATP9CySI2OVgHTqYZt5usYL6Uqd4U73cHA28jrCdNsoN4p
         gd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBJaSa9abIBLdWEVkXnGLOUCueLguuTGAWRyziSA/7s=;
        b=LCEFUYS47vQjHO5QJASBDmMfh1PaX16cFUDhVT0OCycLQlrP8wouN8gatCBr2Vrem3
         dz2gi8LllULI0wpc+Dx9U/wOFZP+bFH8cICE6gV+YU5lGFi46XQ0qmIVAwvnI8cdRqUE
         1Yb1sB4XLWxUXmiiql8y5graY7AhndBgV1hSpH5Ud33S05qTdi14zZ+wI6Dm94NXBWwz
         OKwn0HD+KSs3Eirqf9vkBxJtioXnJ4PUvXSpuqJJ9R/Z/aqBtUykR9qPrR9A9yDuMgkH
         Q99bqRV/MwSlyPb9owJBL+w81lFXY4gBoyxzWEy2X+7koJDFinTlOZ9jlnalvEySK7ad
         obvA==
X-Gm-Message-State: AOAM530ZEojZCFiekpYFO1vkAIKn+nXPKCLzLQnTSmDZvnQH8MOY/lmR
        OjzuVq9J42DoKKlodnfK4mq/X2u/
X-Google-Smtp-Source: ABdhPJx8fo3tdJLD3RF4LpBidCkVfXYGJc1/VQP5BWlGCajGChG1RcCc0ciSkZyvZ0PsWlXJrPtklg==
X-Received: by 2002:a17:90b:1956:: with SMTP id nk22mr8829791pjb.140.1595650888112;
        Fri, 24 Jul 2020 21:21:28 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:21:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and GPIOLINE_GET_VALUES_IOCTL
Date:   Sat, 25 Jul 2020 12:19:42 +0800
Message-Id: <20200725041955.9985-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for requesting lines using the GPIO_GET_LINE_IOCTL, and
returning their current values using GPIOLINE_GET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The struct line implementation is based on the V1 struct linehandle
implementation.

The line_ioctl() is a simple wrapper around line_get_values() here, but
will be extended with other ioctls in subsequent patches.

 drivers/gpio/gpiolib-cdev.c | 389 ++++++++++++++++++++++++++++++++++++
 1 file changed, 389 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..0908ae117b7d 100644
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
@@ -376,6 +379,366 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
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
+	/* descs must be last so it can be dynamically sized */
+	struct gpio_desc *descs[];
+};
+
+static bool padding_not_zeroed(__u32 *padding, int pad_size)
+{
+	int i, sum = 0;
+
+	for (i = 0; i < pad_size; i++)
+		sum |= padding[i];
+
+	return sum;
+}
+
+#define GPIOLINE_BIAS_FLAGS \
+	(GPIOLINE_FLAG_V2_BIAS_PULL_UP | \
+	 GPIOLINE_FLAG_V2_BIAS_PULL_DOWN | \
+	 GPIOLINE_FLAG_V2_BIAS_DISABLED)
+
+#define GPIOLINE_DIRECTION_FLAGS \
+	(GPIOLINE_FLAG_V2_INPUT | \
+	 GPIOLINE_FLAG_V2_OUTPUT)
+
+#define GPIOLINE_DRIVE_FLAGS \
+	(GPIOLINE_FLAG_V2_OPEN_DRAIN | \
+	 GPIOLINE_FLAG_V2_OPEN_SOURCE)
+
+#define GPIOLINE_VALID_FLAGS \
+	(GPIOLINE_FLAG_V2_ACTIVE_LOW | \
+	 GPIOLINE_DIRECTION_FLAGS | \
+	 GPIOLINE_DRIVE_FLAGS | \
+	 GPIOLINE_BIAS_FLAGS)
+
+static u64 gpioline_config_flags(struct gpioline_config *lc, int line_idx)
+{
+	int i;
+
+	for (i = lc->num_attrs - 1; i >= 0; i--) {
+		if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_FLAGS) &&
+		    test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
+			return lc->attrs[i].attr.flags;
+	}
+	return lc->flags;
+}
+
+static int gpioline_config_output_value(struct gpioline_config *lc,
+					int line_idx)
+{
+	int i;
+
+	for (i = lc->num_attrs - 1; i >= 0; i--) {
+		if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_OUTPUT_VALUES) &&
+		    test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
+			return test_bit(line_idx,
+				(unsigned long *)lc->attrs[i].attr.values.bits);
+	}
+	return 0;
+}
+
+static int gpioline_flags_validate(u64 flags)
+{
+	/* Return an error if an unknown flag is set */
+	if (flags & ~GPIOLINE_VALID_FLAGS)
+		return -EINVAL;
+
+	/*
+	 * Do not allow both INPUT & OUTPUT flags to be set as they are
+	 * contradictory.
+	 */
+	if ((flags & GPIOLINE_FLAG_V2_INPUT) &&
+	    (flags & GPIOLINE_FLAG_V2_OUTPUT))
+		return -EINVAL;
+
+	/*
+	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
+	 * the hardware actually supports enabling both at the same time the
+	 * electrical result would be disastrous.
+	 */
+	if ((flags & GPIOLINE_FLAG_V2_OPEN_DRAIN) &&
+	    (flags & GPIOLINE_FLAG_V2_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* Drive requires explicit output direction. */
+	if ((flags & GPIOLINE_DRIVE_FLAGS) &&
+	    !(flags & GPIOLINE_FLAG_V2_OUTPUT))
+		return -EINVAL;
+
+	/* Bias requies explicit direction. */
+	if ((flags & GPIOLINE_BIAS_FLAGS) &&
+	    !(flags & GPIOLINE_DIRECTION_FLAGS))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((flags & GPIOLINE_FLAG_V2_BIAS_DISABLED) &&
+	     (flags & (GPIOLINE_FLAG_V2_BIAS_PULL_DOWN |
+		       GPIOLINE_FLAG_V2_BIAS_PULL_UP))) ||
+	    ((flags & GPIOLINE_FLAG_V2_BIAS_PULL_DOWN) &&
+	     (flags & GPIOLINE_FLAG_V2_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int gpioline_config_validate(struct gpioline_config *lc, int num_lines)
+{
+	int i, ret;
+	u64 flags;
+
+	if (lc->num_attrs > GPIOLINE_NUM_ATTRS_MAX)
+		return -EINVAL;
+
+	if (padding_not_zeroed(lc->padding, ARRAY_SIZE(lc->padding)))
+		return -EINVAL;
+
+	for (i = 0; i < num_lines; i++) {
+		flags = gpioline_config_flags(lc, i);
+		ret = gpioline_flags_validate(flags);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void gpioline_config_flags_to_desc_flags(u64 flags,
+						unsigned long *flagsp)
+{
+	assign_bit(FLAG_ACTIVE_LOW, flagsp,
+		   flags & GPIOLINE_FLAG_V2_ACTIVE_LOW);
+	if (flags & GPIOLINE_FLAG_V2_OUTPUT)
+		set_bit(FLAG_IS_OUT, flagsp);
+	else if (flags & GPIOLINE_FLAG_V2_INPUT)
+		clear_bit(FLAG_IS_OUT, flagsp);
+	assign_bit(FLAG_OPEN_DRAIN, flagsp,
+		   flags & GPIOLINE_FLAG_V2_OPEN_DRAIN);
+	assign_bit(FLAG_OPEN_SOURCE, flagsp,
+		   flags & GPIOLINE_FLAG_V2_OPEN_SOURCE);
+	assign_bit(FLAG_PULL_UP, flagsp,
+		   flags & GPIOLINE_FLAG_V2_BIAS_PULL_UP);
+	assign_bit(FLAG_PULL_DOWN, flagsp,
+		   flags & GPIOLINE_FLAG_V2_BIAS_PULL_DOWN);
+	assign_bit(FLAG_BIAS_DISABLE, flagsp,
+		   flags & GPIOLINE_FLAG_V2_BIAS_DISABLED);
+}
+
+static long line_get_values(struct line *line, void __user *ip)
+{
+	struct gpioline_values lv;
+	unsigned long *vals = (unsigned long *)lv.bits;
+	int ret;
+
+	/* NOTE: It's ok to read values of output lines. */
+	memset(&lv, 0, sizeof(lv));
+	ret = gpiod_get_array_value_complex(false,
+					    true,
+					    line->num_descs,
+					    line->descs,
+					    NULL,
+					    vals);
+	if (ret)
+		return ret;
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
+	if (cmd == GPIOLINE_GET_VALUES_IOCTL)
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
+	struct gpioline_request linereq;
+	struct line *line;
+	struct file *file;
+	int fd, i, ret;
+	struct gpioline_config *lc;
+	unsigned long flags;
+
+	if (copy_from_user(&linereq, ip, sizeof(linereq)))
+		return -EFAULT;
+	if ((linereq.num_lines == 0) || (linereq.num_lines > GPIOLINES_MAX))
+		return -EINVAL;
+
+	if (padding_not_zeroed(linereq.padding, ARRAY_SIZE(linereq.padding)))
+		return -EINVAL;
+
+	lc = &linereq.config;
+	ret = gpioline_config_validate(lc, linereq.num_lines);
+	if (ret)
+		return ret;
+
+	line = kzalloc(struct_size(line, descs, linereq.num_lines),
+		       GFP_KERNEL);
+	if (!line)
+		return -ENOMEM;
+
+	line->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
+	if (strlen(linereq.consumer)) {
+		line->label = kstrdup(linereq.consumer, GFP_KERNEL);
+		if (!line->label) {
+			ret = -ENOMEM;
+			goto out_free_line;
+		}
+	}
+
+	line->num_descs = linereq.num_lines;
+
+	/* Request each GPIO */
+	for (i = 0; i < linereq.num_lines; i++) {
+		u32 offset = linereq.offsets[i];
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
+		flags = gpioline_config_flags(lc, i);
+		gpioline_config_flags_to_desc_flags(flags, &desc->flags);
+
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_line;
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIOLINE_FLAG_V2_OUTPUT) {
+			int val = gpioline_config_output_value(lc, i);
+
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				goto out_free_line;
+		} else if (flags & GPIOLINE_FLAG_V2_INPUT) {
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
+	linereq.fd = fd;
+	if (copy_to_user(ip, &linereq, sizeof(linereq))) {
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
@@ -745,6 +1108,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpioline_info *info)
 {
@@ -850,6 +1215,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
+#ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
 		struct gpioline_info lineinfo;
 
@@ -892,6 +1258,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		}
 
 		return 0;
+#endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_GET_LINE_IOCTL) {
+		return line_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
@@ -1118,4 +1487,24 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
+
+	/*
+	 * array sizes must be a multiple of 8 to ensure 64-bit alignment and
+	 * to not create holes in the struct packing.
+	 */
+	BUILD_BUG_ON(GPIOLINES_MAX % 8);
+	BUILD_BUG_ON(GPIO_MAX_NAME_SIZE % 8);
+
+	/*
+	 * check that uAPI structs are 64-bit aligned for 32/64-bit
+	 * compatibility
+	 */
+	BUILD_BUG_ON(sizeof(struct gpioline_attribute) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_config_attribute) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_config) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_request) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_info_v2) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_info_changed_v2) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_event) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_values) % 8);
 }
-- 
2.27.0

