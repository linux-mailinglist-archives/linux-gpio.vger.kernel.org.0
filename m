Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD0B1FACB0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgFPJgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 05:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbgFPJgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 05:36:37 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875E5C05BD43;
        Tue, 16 Jun 2020 02:36:37 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l24so387079pgb.5;
        Tue, 16 Jun 2020 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wSviTdd0O3w/JOoDXU3Br06DWdCBXeyJjMa0lA8NwIk=;
        b=ULFFGLVUv8JMq3HWkB4PZLMHJN8N2SZRcv+LmCl8ZjytfJBeYNYP7AT/StWtFJDi/K
         NMzLLbpxgiCcio6K25Fx5Oh+q+fIyjYj04lJs4030W94qeM0p/ijz5RzRrXNyHthtcwh
         dfDn9qcKSFeWRJj/jVn9U9tBYLKq/eDW5fPcMyuMA3XWzvobm21fuNRRx2A7HXb5Pae0
         NO1k1ezIyjskOlnGaToxhp6aOkTwFX32+9VBeUpHZw391KGdSBk+emT2Eo4G+adfJU2A
         8yppUDZ7BSpQ6WusnWzdR7s9UCQRaIj1yc0GBg5OZkkQG9p7RIRonc8U+RaFnqNhN22q
         1CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wSviTdd0O3w/JOoDXU3Br06DWdCBXeyJjMa0lA8NwIk=;
        b=QkUI3TVfFzhEuW04X5sP9q0Iw4+OG6S4r0L+xAg8nElnwv9cJY0xO+3yOA9bEj4+ad
         k+CfBJQavkApnhVHrlzMzGWyT/IX1zePY9fUvRENkKfARE+E85lPJrhD9hXOmi20pVBG
         P3TU3vWPxY1GEMQUlccc9y1ho4GuLmzwAJyshqZaOpw0vTYxaz/h/rFfhtexAASqMkAt
         QITKE6wxZzkZgOwhul/14n0kzueZBWHCMBE2DLY1qRDFdvbyPsFnhrlu49H0hkfzA4O8
         sbGPFgdFVCoibnRng1fKC6ebnBr3D+/fT5BJW/u37gVDoY5smJsq9Y8XeZlP9UHCyRWK
         FkKg==
X-Gm-Message-State: AOAM530DsI9i7H1HZylFrXD1pogL2JhqC4yByQ/8n26t0dKjSPrMzZgl
        qp+LhqJROcdW06y0AO7lo6KNGFSMfmI=
X-Google-Smtp-Source: ABdhPJyz6QMGUNVrXx9ijWSZpWPuEIEcB67Y76Zpqtjphw0vJNBhA9Qn41KLUuLxFF6SSasIdCP03w==
X-Received: by 2002:a63:1862:: with SMTP id 34mr1461490pgy.246.1592300195305;
        Tue, 16 Jun 2020 02:36:35 -0700 (PDT)
Received: from sol.lan (220-235-122-244.dyn.iinet.net.au. [220.235.122.244])
        by smtp.gmail.com with ESMTPSA id d9sm10120098pgg.74.2020.06.16.02.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 02:36:34 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4] gpiolib: split character device into gpiolib-cdev
Date:   Tue, 16 Jun 2020 17:36:15 +0800
Message-Id: <20200616093615.5167-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Split the cdev specific functionality out of gpiolib.c and into
gpiolib-cdev.c. This improves the readability and maintainability of both
the cdev and core gpiolib code.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changed in v4:
 - rebased onto the latest gpio/devel (v5.8-rc1)
 - squashed the "gpiolib: cdev: fix -Wmissing-prototypes warnings" patch
   so my "gpiolib: cdev: fixes for split from gpiolib.c" patch set can be
   disregarded.

Changes in v3:
 - updated the gpiolib-cdev.c file comment.
 - rebased to latest gpio/devel (no changes impacted this patch)
 - dropped the patch commentary as the points mentioned are mostly
  resolved - there still remain a couple of commits in gpio/fixes that will
  conflict...

 drivers/gpio/Makefile       |    1 +
 drivers/gpio/gpiolib-cdev.c | 1154 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-cdev.h |   11 +
 drivers/gpio/gpiolib.c      | 1119 +--------------------------------
 4 files changed, 1170 insertions(+), 1115 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-cdev.c
 create mode 100644 drivers/gpio/gpiolib-cdev.h

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1e4894e0bf0f..ef666cfef9d0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
+obj-$(CONFIG_GPIOLIB)		+= gpiolib-cdev.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
new file mode 100644
index 000000000000..b8b872724628
--- /dev/null
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -0,0 +1,1154 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitmap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/spinlock.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/cdev.h>
+#include <linux/uaccess.h>
+#include <linux/compat.h>
+#include <linux/anon_inodes.h>
+#include <linux/file.h>
+#include <linux/kfifo.h>
+#include <linux/poll.h>
+#include <linux/timekeeping.h>
+#include <uapi/linux/gpio.h>
+
+#include "gpiolib.h"
+#include "gpiolib-cdev.h"
+
+/* Character device interface to GPIO.
+ *
+ * The GPIO character device, /dev/gpiochipN, provides userspace an
+ * interface to gpiolib GPIOs via ioctl()s.
+ */
+
+/*
+ * GPIO line handle management
+ */
+
+/**
+ * struct linehandle_state - contains the state of a userspace handle
+ * @gdev: the GPIO device the handle pertains to
+ * @label: consumer label used to tag descriptors
+ * @descs: the GPIO descriptors held by this handle
+ * @numdescs: the number of descriptors held in the descs array
+ */
+struct linehandle_state {
+	struct gpio_device *gdev;
+	const char *label;
+	struct gpio_desc *descs[GPIOHANDLES_MAX];
+	u32 numdescs;
+};
+
+#define GPIOHANDLE_REQUEST_VALID_FLAGS \
+	(GPIOHANDLE_REQUEST_INPUT | \
+	GPIOHANDLE_REQUEST_OUTPUT | \
+	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
+	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
+	GPIOHANDLE_REQUEST_BIAS_DISABLE | \
+	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
+	GPIOHANDLE_REQUEST_OPEN_SOURCE)
+
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
+		assign_bit(FLAG_ACTIVE_LOW, flagsp,
+			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+
+		assign_bit(FLAG_OPEN_DRAIN, flagsp,
+			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+
+		assign_bit(FLAG_OPEN_SOURCE, flagsp,
+			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+
+		assign_bit(FLAG_PULL_UP, flagsp,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+
+		assign_bit(FLAG_PULL_DOWN, flagsp,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+
+		assign_bit(FLAG_BIAS_DISABLE, flagsp,
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
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_CONFIG, desc);
+	}
+	return 0;
+}
+
+static long linehandle_ioctl(struct file *filep, unsigned int cmd,
+			     unsigned long arg)
+{
+	struct linehandle_state *lh = filep->private_data;
+	void __user *ip = (void __user *)arg;
+	struct gpiohandle_data ghd;
+	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
+	int i;
+
+	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
+		/* NOTE: It's ok to read values of output lines. */
+		int ret = gpiod_get_array_value_complex(false,
+							true,
+							lh->numdescs,
+							lh->descs,
+							NULL,
+							vals);
+		if (ret)
+			return ret;
+
+		memset(&ghd, 0, sizeof(ghd));
+		for (i = 0; i < lh->numdescs; i++)
+			ghd.values[i] = test_bit(i, vals);
+
+		if (copy_to_user(ip, &ghd, sizeof(ghd)))
+			return -EFAULT;
+
+		return 0;
+	} else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
+		/*
+		 * All line descriptors were created at once with the same
+		 * flags so just check if the first one is really output.
+		 */
+		if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
+			return -EPERM;
+
+		if (copy_from_user(&ghd, ip, sizeof(ghd)))
+			return -EFAULT;
+
+		/* Clamp all values to [0,1] */
+		for (i = 0; i < lh->numdescs; i++)
+			__assign_bit(i, vals, ghd.values[i]);
+
+		/* Reuse the array setting function */
+		return gpiod_set_array_value_complex(false,
+					      true,
+					      lh->numdescs,
+					      lh->descs,
+					      NULL,
+					      vals);
+	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
+		return linehandle_set_config(lh, ip);
+	}
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
+			     unsigned long arg)
+{
+	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static int linehandle_release(struct inode *inode, struct file *filep)
+{
+	struct linehandle_state *lh = filep->private_data;
+	struct gpio_device *gdev = lh->gdev;
+	int i;
+
+	for (i = 0; i < lh->numdescs; i++)
+		gpiod_free(lh->descs[i]);
+	kfree(lh->label);
+	kfree(lh);
+	put_device(&gdev->dev);
+	return 0;
+}
+
+static const struct file_operations linehandle_fileops = {
+	.release = linehandle_release,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = linehandle_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = linehandle_ioctl_compat,
+#endif
+};
+
+static int linehandle_create(struct gpio_device *gdev, void __user *ip)
+{
+	struct gpiohandle_request handlereq;
+	struct linehandle_state *lh;
+	struct file *file;
+	int fd, i, count = 0, ret;
+	u32 lflags;
+
+	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
+		return -EFAULT;
+	if ((handlereq.lines == 0) || (handlereq.lines > GPIOHANDLES_MAX))
+		return -EINVAL;
+
+	lflags = handlereq.flags;
+
+	ret = linehandle_validate_flags(lflags);
+	if (ret)
+		return ret;
+
+	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
+	if (!lh)
+		return -ENOMEM;
+	lh->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	handlereq.consumer_label[sizeof(handlereq.consumer_label)-1] = '\0';
+	if (strlen(handlereq.consumer_label)) {
+		lh->label = kstrdup(handlereq.consumer_label,
+				    GFP_KERNEL);
+		if (!lh->label) {
+			ret = -ENOMEM;
+			goto out_free_lh;
+		}
+	}
+
+	/* Request each GPIO */
+	for (i = 0; i < handlereq.lines; i++) {
+		u32 offset = handlereq.lineoffsets[i];
+		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
+
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
+			goto out_free_descs;
+		}
+
+		ret = gpiod_request(desc, lh->label);
+		if (ret)
+			goto out_free_descs;
+		lh->descs[i] = desc;
+		count = i + 1;
+
+		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
+			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
+			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
+			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+			set_bit(FLAG_PULL_DOWN, &desc->flags);
+		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+			set_bit(FLAG_PULL_UP, &desc->flags);
+
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_descs;
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+			int val = !!handlereq.default_values[i];
+
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				goto out_free_descs;
+		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				goto out_free_descs;
+		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_REQUESTED, desc);
+
+		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
+			offset);
+	}
+	/* Let i point at the last handle */
+	i--;
+	lh->numdescs = handlereq.lines;
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto out_free_descs;
+	}
+
+	file = anon_inode_getfile("gpio-linehandle",
+				  &linehandle_fileops,
+				  lh,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
+	handlereq.fd = fd;
+	if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
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
+		lh->numdescs);
+
+	return 0;
+
+out_put_unused_fd:
+	put_unused_fd(fd);
+out_free_descs:
+	for (i = 0; i < count; i++)
+		gpiod_free(lh->descs[i]);
+	kfree(lh->label);
+out_free_lh:
+	kfree(lh);
+	put_device(&gdev->dev);
+	return ret;
+}
+
+/*
+ * GPIO line event management
+ */
+
+/**
+ * struct lineevent_state - contains the state of a userspace event
+ * @gdev: the GPIO device the event pertains to
+ * @label: consumer label used to tag descriptors
+ * @desc: the GPIO descriptor held by this event
+ * @eflags: the event flags this line was requested with
+ * @irq: the interrupt that trigger in response to events on this GPIO
+ * @wait: wait queue that handles blocking reads of events
+ * @events: KFIFO for the GPIO events
+ * @timestamp: cache for the timestamp storing it between hardirq
+ * and IRQ thread, used to bring the timestamp close to the actual
+ * event
+ */
+struct lineevent_state {
+	struct gpio_device *gdev;
+	const char *label;
+	struct gpio_desc *desc;
+	u32 eflags;
+	int irq;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO(events, struct gpioevent_data, 16);
+	u64 timestamp;
+};
+
+#define GPIOEVENT_REQUEST_VALID_FLAGS \
+	(GPIOEVENT_REQUEST_RISING_EDGE | \
+	GPIOEVENT_REQUEST_FALLING_EDGE)
+
+static __poll_t lineevent_poll(struct file *filep,
+				   struct poll_table_struct *wait)
+{
+	struct lineevent_state *le = filep->private_data;
+	__poll_t events = 0;
+
+	poll_wait(filep, &le->wait, wait);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
+		events = EPOLLIN | EPOLLRDNORM;
+
+	return events;
+}
+
+
+static ssize_t lineevent_read(struct file *filep,
+			      char __user *buf,
+			      size_t count,
+			      loff_t *f_ps)
+{
+	struct lineevent_state *le = filep->private_data;
+	struct gpioevent_data ge;
+	ssize_t bytes_read = 0;
+	int ret;
+
+	if (count < sizeof(ge))
+		return -EINVAL;
+
+	do {
+		spin_lock(&le->wait.lock);
+		if (kfifo_is_empty(&le->events)) {
+			if (bytes_read) {
+				spin_unlock(&le->wait.lock);
+				return bytes_read;
+			}
+
+			if (filep->f_flags & O_NONBLOCK) {
+				spin_unlock(&le->wait.lock);
+				return -EAGAIN;
+			}
+
+			ret = wait_event_interruptible_locked(le->wait,
+					!kfifo_is_empty(&le->events));
+			if (ret) {
+				spin_unlock(&le->wait.lock);
+				return ret;
+			}
+		}
+
+		ret = kfifo_out(&le->events, &ge, 1);
+		spin_unlock(&le->wait.lock);
+		if (ret != 1) {
+			/*
+			 * This should never happen - we were holding the lock
+			 * from the moment we learned the fifo is no longer
+			 * empty until now.
+			 */
+			ret = -EIO;
+			break;
+		}
+
+		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
+			return -EFAULT;
+		bytes_read += sizeof(ge);
+	} while (count >= bytes_read + sizeof(ge));
+
+	return bytes_read;
+}
+
+static int lineevent_release(struct inode *inode, struct file *filep)
+{
+	struct lineevent_state *le = filep->private_data;
+	struct gpio_device *gdev = le->gdev;
+
+	free_irq(le->irq, le);
+	gpiod_free(le->desc);
+	kfree(le->label);
+	kfree(le);
+	put_device(&gdev->dev);
+	return 0;
+}
+
+static long lineevent_ioctl(struct file *filep, unsigned int cmd,
+			    unsigned long arg)
+{
+	struct lineevent_state *le = filep->private_data;
+	void __user *ip = (void __user *)arg;
+	struct gpiohandle_data ghd;
+
+	/*
+	 * We can get the value for an event line but not set it,
+	 * because it is input by definition.
+	 */
+	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
+		int val;
+
+		memset(&ghd, 0, sizeof(ghd));
+
+		val = gpiod_get_value_cansleep(le->desc);
+		if (val < 0)
+			return val;
+		ghd.values[0] = val;
+
+		if (copy_to_user(ip, &ghd, sizeof(ghd)))
+			return -EFAULT;
+
+		return 0;
+	}
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long lineevent_ioctl_compat(struct file *filep, unsigned int cmd,
+				   unsigned long arg)
+{
+	return lineevent_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static const struct file_operations lineevent_fileops = {
+	.release = lineevent_release,
+	.read = lineevent_read,
+	.poll = lineevent_poll,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = lineevent_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = lineevent_ioctl_compat,
+#endif
+};
+
+static irqreturn_t lineevent_irq_thread(int irq, void *p)
+{
+	struct lineevent_state *le = p;
+	struct gpioevent_data ge;
+	int ret;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&ge, 0, sizeof(ge));
+
+	/*
+	 * We may be running from a nested threaded interrupt in which case
+	 * we didn't get the timestamp from lineevent_irq_handler().
+	 */
+	if (!le->timestamp)
+		ge.timestamp = ktime_get_ns();
+	else
+		ge.timestamp = le->timestamp;
+
+	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
+	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
+		int level = gpiod_get_value_cansleep(le->desc);
+
+		if (level)
+			/* Emit low-to-high event */
+			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
+		else
+			/* Emit high-to-low event */
+			ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
+	} else if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE) {
+		/* Emit low-to-high event */
+		ge.id = GPIOEVENT_EVENT_RISING_EDGE;
+	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
+		/* Emit high-to-low event */
+		ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
+	} else {
+		return IRQ_NONE;
+	}
+
+	ret = kfifo_in_spinlocked_noirqsave(&le->events, &ge,
+					    1, &le->wait.lock);
+	if (ret)
+		wake_up_poll(&le->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lineevent_irq_handler(int irq, void *p)
+{
+	struct lineevent_state *le = p;
+
+	/*
+	 * Just store the timestamp in hardirq context so we get it as
+	 * close in time as possible to the actual event.
+	 */
+	le->timestamp = ktime_get_ns();
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int lineevent_create(struct gpio_device *gdev, void __user *ip)
+{
+	struct gpioevent_request eventreq;
+	struct lineevent_state *le;
+	struct gpio_desc *desc;
+	struct file *file;
+	u32 offset;
+	u32 lflags;
+	u32 eflags;
+	int fd;
+	int ret;
+	int irqflags = 0;
+
+	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
+		return -EFAULT;
+
+	offset = eventreq.lineoffset;
+	lflags = eventreq.handleflags;
+	eflags = eventreq.eventflags;
+
+	desc = gpiochip_get_desc(gdev->chip, offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	/* Return an error if a unknown flag is set */
+	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
+	    (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
+		return -EINVAL;
+
+	/* This is just wrong: we don't look for events on output lines */
+	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
+	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
+			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
+	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	le = kzalloc(sizeof(*le), GFP_KERNEL);
+	if (!le)
+		return -ENOMEM;
+	le->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	eventreq.consumer_label[sizeof(eventreq.consumer_label)-1] = '\0';
+	if (strlen(eventreq.consumer_label)) {
+		le->label = kstrdup(eventreq.consumer_label,
+				    GFP_KERNEL);
+		if (!le->label) {
+			ret = -ENOMEM;
+			goto out_free_le;
+		}
+	}
+
+	ret = gpiod_request(desc, le->label);
+	if (ret)
+		goto out_free_label;
+	le->desc = desc;
+	le->eflags = eflags;
+
+	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
+		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
+
+	ret = gpiod_direction_input(desc);
+	if (ret)
+		goto out_free_desc;
+
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
+
+	le->irq = gpiod_to_irq(desc);
+	if (le->irq <= 0) {
+		ret = -ENODEV;
+		goto out_free_desc;
+	}
+
+	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+	if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+	irqflags |= IRQF_ONESHOT;
+
+	INIT_KFIFO(le->events);
+	init_waitqueue_head(&le->wait);
+
+	/* Request a thread to read the events */
+	ret = request_threaded_irq(le->irq,
+			lineevent_irq_handler,
+			lineevent_irq_thread,
+			irqflags,
+			le->label,
+			le);
+	if (ret)
+		goto out_free_desc;
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto out_free_irq;
+	}
+
+	file = anon_inode_getfile("gpio-event",
+				  &lineevent_fileops,
+				  le,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
+	eventreq.fd = fd;
+	if (copy_to_user(ip, &eventreq, sizeof(eventreq))) {
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
+	return 0;
+
+out_put_unused_fd:
+	put_unused_fd(fd);
+out_free_irq:
+	free_irq(le->irq, le);
+out_free_desc:
+	gpiod_free(le->desc);
+out_free_label:
+	kfree(le->label);
+out_free_le:
+	kfree(le);
+	put_device(&gdev->dev);
+	return ret;
+}
+
+static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
+				  struct gpioline_info *info)
+{
+	struct gpio_chip *gc = desc->gdev->chip;
+	bool ok_for_pinctrl;
+	unsigned long flags;
+
+	/*
+	 * This function takes a mutex so we must check this before taking
+	 * the spinlock.
+	 *
+	 * FIXME: find a non-racy way to retrieve this information. Maybe a
+	 * lock common to both frameworks?
+	 */
+	ok_for_pinctrl =
+		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	if (desc->name) {
+		strncpy(info->name, desc->name, sizeof(info->name));
+		info->name[sizeof(info->name) - 1] = '\0';
+	} else {
+		info->name[0] = '\0';
+	}
+
+	if (desc->label) {
+		strncpy(info->consumer, desc->label, sizeof(info->consumer));
+		info->consumer[sizeof(info->consumer) - 1] = '\0';
+	} else {
+		info->consumer[0] = '\0';
+	}
+
+	/*
+	 * Userspace only need to know that the kernel is using this GPIO so
+	 * it can't use it.
+	 */
+	info->flags = 0;
+	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
+	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
+	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
+	    test_bit(FLAG_EXPORT, &desc->flags) ||
+	    test_bit(FLAG_SYSFS, &desc->flags) ||
+	    !ok_for_pinctrl)
+		info->flags |= GPIOLINE_FLAG_KERNEL;
+	if (test_bit(FLAG_IS_OUT, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_IS_OUT;
+	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+		info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
+				GPIOLINE_FLAG_IS_OUT);
+	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+		info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
+				GPIOLINE_FLAG_IS_OUT);
+	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
+	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+	if (test_bit(FLAG_PULL_UP, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+}
+
+struct gpio_chardev_data {
+	struct gpio_device *gdev;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
+	struct notifier_block lineinfo_changed_nb;
+	unsigned long *watched_lines;
+};
+
+/*
+ * gpio_ioctl() - ioctl handler for the GPIO chardev
+ */
+static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_device *gdev = priv->gdev;
+	struct gpio_chip *gc = gdev->chip;
+	void __user *ip = (void __user *)arg;
+	struct gpio_desc *desc;
+	__u32 offset;
+	int hwgpio;
+
+	/* We fail any subsequent ioctl():s when the chip is gone */
+	if (!gc)
+		return -ENODEV;
+
+	/* Fill in the struct and pass to userspace */
+	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {
+		struct gpiochip_info chipinfo;
+
+		memset(&chipinfo, 0, sizeof(chipinfo));
+
+		strncpy(chipinfo.name, dev_name(&gdev->dev),
+			sizeof(chipinfo.name));
+		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
+		strncpy(chipinfo.label, gdev->label,
+			sizeof(chipinfo.label));
+		chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
+		chipinfo.lines = gdev->ngpio;
+		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
+			return -EFAULT;
+		return 0;
+	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
+		struct gpioline_info lineinfo;
+
+		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+			return -EFAULT;
+
+		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		gpio_desc_to_lineinfo(desc, &lineinfo);
+
+		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+			return -EFAULT;
+		return 0;
+	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
+		return linehandle_create(gdev, ip);
+	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
+		return lineevent_create(gdev, ip);
+	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		struct gpioline_info lineinfo;
+
+		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+			return -EFAULT;
+
+		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		if (test_bit(hwgpio, priv->watched_lines))
+			return -EBUSY;
+
+		gpio_desc_to_lineinfo(desc, &lineinfo);
+
+		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+			return -EFAULT;
+
+		set_bit(hwgpio, priv->watched_lines);
+		return 0;
+	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
+		if (copy_from_user(&offset, ip, sizeof(offset)))
+			return -EFAULT;
+
+		desc = gpiochip_get_desc(gc, offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		if (!test_bit(hwgpio, priv->watched_lines))
+			return -EBUSY;
+
+		clear_bit(hwgpio, priv->watched_lines);
+		return 0;
+	}
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
+			      unsigned long arg)
+{
+	return gpio_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static struct gpio_chardev_data *
+to_gpio_chardev_data(struct notifier_block *nb)
+{
+	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
+}
+
+static int lineinfo_changed_notify(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
+	struct gpioline_info_changed chg;
+	struct gpio_desc *desc = data;
+	int ret;
+
+	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
+		return NOTIFY_DONE;
+
+	memset(&chg, 0, sizeof(chg));
+	chg.info.line_offset = gpio_chip_hwgpio(desc);
+	chg.event_type = action;
+	chg.timestamp = ktime_get_ns();
+	gpio_desc_to_lineinfo(desc, &chg.info);
+
+	ret = kfifo_in_spinlocked(&priv->events, &chg, 1, &priv->wait.lock);
+	if (ret)
+		wake_up_poll(&priv->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
+
+	return NOTIFY_OK;
+}
+
+static __poll_t lineinfo_watch_poll(struct file *filep,
+				    struct poll_table_struct *pollt)
+{
+	struct gpio_chardev_data *priv = filep->private_data;
+	__poll_t events = 0;
+
+	poll_wait(filep, &priv->wait, pollt);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
+						 &priv->wait.lock))
+		events = EPOLLIN | EPOLLRDNORM;
+
+	return events;
+}
+
+static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
+				   size_t count, loff_t *off)
+{
+	struct gpio_chardev_data *priv = filep->private_data;
+	struct gpioline_info_changed event;
+	ssize_t bytes_read = 0;
+	int ret;
+
+	if (count < sizeof(event))
+		return -EINVAL;
+
+	do {
+		spin_lock(&priv->wait.lock);
+		if (kfifo_is_empty(&priv->events)) {
+			if (bytes_read) {
+				spin_unlock(&priv->wait.lock);
+				return bytes_read;
+			}
+
+			if (filep->f_flags & O_NONBLOCK) {
+				spin_unlock(&priv->wait.lock);
+				return -EAGAIN;
+			}
+
+			ret = wait_event_interruptible_locked(priv->wait,
+					!kfifo_is_empty(&priv->events));
+			if (ret) {
+				spin_unlock(&priv->wait.lock);
+				return ret;
+			}
+		}
+
+		ret = kfifo_out(&priv->events, &event, 1);
+		spin_unlock(&priv->wait.lock);
+		if (ret != 1) {
+			ret = -EIO;
+			break;
+			/* We should never get here. See lineevent_read(). */
+		}
+
+		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+			return -EFAULT;
+		bytes_read += sizeof(event);
+	} while (count >= bytes_read + sizeof(event));
+
+	return bytes_read;
+}
+
+/**
+ * gpio_chrdev_open() - open the chardev for ioctl operations
+ * @inode: inode for this chardev
+ * @filp: file struct for storing private data
+ * Returns 0 on success
+ */
+static int gpio_chrdev_open(struct inode *inode, struct file *filp)
+{
+	struct gpio_device *gdev = container_of(inode->i_cdev,
+					      struct gpio_device, chrdev);
+	struct gpio_chardev_data *priv;
+	int ret = -ENOMEM;
+
+	/* Fail on open if the backing gpiochip is gone */
+	if (!gdev->chip)
+		return -ENODEV;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	if (!priv->watched_lines)
+		goto out_free_priv;
+
+	init_waitqueue_head(&priv->wait);
+	INIT_KFIFO(priv->events);
+	priv->gdev = gdev;
+
+	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
+	ret = atomic_notifier_chain_register(&gdev->notifier,
+					     &priv->lineinfo_changed_nb);
+	if (ret)
+		goto out_free_bitmap;
+
+	get_device(&gdev->dev);
+	filp->private_data = priv;
+
+	ret = nonseekable_open(inode, filp);
+	if (ret)
+		goto out_unregister_notifier;
+
+	return ret;
+
+out_unregister_notifier:
+	atomic_notifier_chain_unregister(&gdev->notifier,
+					 &priv->lineinfo_changed_nb);
+out_free_bitmap:
+	bitmap_free(priv->watched_lines);
+out_free_priv:
+	kfree(priv);
+	return ret;
+}
+
+/**
+ * gpio_chrdev_release() - close chardev after ioctl operations
+ * @inode: inode for this chardev
+ * @filp: file struct for storing private data
+ * Returns 0 on success
+ */
+static int gpio_chrdev_release(struct inode *inode, struct file *filp)
+{
+	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_device *gdev = priv->gdev;
+
+	bitmap_free(priv->watched_lines);
+	atomic_notifier_chain_unregister(&gdev->notifier,
+					 &priv->lineinfo_changed_nb);
+	put_device(&gdev->dev);
+	kfree(priv);
+
+	return 0;
+}
+
+static const struct file_operations gpio_fileops = {
+	.release = gpio_chrdev_release,
+	.open = gpio_chrdev_open,
+	.poll = lineinfo_watch_poll,
+	.read = lineinfo_watch_read,
+	.owner = THIS_MODULE,
+	.llseek = no_llseek,
+	.unlocked_ioctl = gpio_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = gpio_ioctl_compat,
+#endif
+};
+
+int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
+{
+	int ret;
+
+	cdev_init(&gdev->chrdev, &gpio_fileops);
+	gdev->chrdev.owner = THIS_MODULE;
+	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
+
+	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
+	if (ret)
+		return ret;
+
+	chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
+		 MAJOR(devt), gdev->id);
+
+	return 0;
+}
+
+void gpiolib_cdev_unregister(struct gpio_device *gdev)
+{
+	cdev_device_del(&gdev->chrdev, &gdev->dev);
+}
diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
new file mode 100644
index 000000000000..973578e7ad10
--- /dev/null
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef GPIOLIB_CDEV_H
+#define GPIOLIB_CDEV_H
+
+#include <linux/device.h>
+
+int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
+void gpiolib_cdev_unregister(struct gpio_device *gdev);
+
+#endif /* GPIOLIB_CDEV_H */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4fa075d49fbc..4abd751314a5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -17,20 +17,15 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/cdev.h>
 #include <linux/fs.h>
-#include <linux/uaccess.h>
 #include <linux/compat.h>
-#include <linux/anon_inodes.h>
 #include <linux/file.h>
-#include <linux/kfifo.h>
-#include <linux/poll.h>
-#include <linux/timekeeping.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
 #include "gpiolib-of.h"
 #include "gpiolib-acpi.h"
+#include "gpiolib-cdev.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/gpio.h>
@@ -425,1105 +420,6 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
-/*
- * GPIO line handle management
- */
-
-/**
- * struct linehandle_state - contains the state of a userspace handle
- * @gdev: the GPIO device the handle pertains to
- * @label: consumer label used to tag descriptors
- * @descs: the GPIO descriptors held by this handle
- * @numdescs: the number of descriptors held in the descs array
- */
-struct linehandle_state {
-	struct gpio_device *gdev;
-	const char *label;
-	struct gpio_desc *descs[GPIOHANDLES_MAX];
-	u32 numdescs;
-};
-
-#define GPIOHANDLE_REQUEST_VALID_FLAGS \
-	(GPIOHANDLE_REQUEST_INPUT | \
-	GPIOHANDLE_REQUEST_OUTPUT | \
-	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
-	GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
-	GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
-	GPIOHANDLE_REQUEST_BIAS_DISABLE | \
-	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
-	GPIOHANDLE_REQUEST_OPEN_SOURCE)
-
-static int linehandle_validate_flags(u32 flags)
-{
-	/* Return an error if an unknown flag is set */
-	if (flags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
-		return -EINVAL;
-
-	/*
-	 * Do not allow both INPUT & OUTPUT flags to be set as they are
-	 * contradictory.
-	 */
-	if ((flags & GPIOHANDLE_REQUEST_INPUT) &&
-	    (flags & GPIOHANDLE_REQUEST_OUTPUT))
-		return -EINVAL;
-
-	/*
-	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
-	 * the hardware actually supports enabling both at the same time the
-	 * electrical result would be disastrous.
-	 */
-	if ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
-	    (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
-		return -EINVAL;
-
-	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
-	if (!(flags & GPIOHANDLE_REQUEST_OUTPUT) &&
-	    ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	     (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
-		return -EINVAL;
-
-	/* Bias flags only allowed for input or output mode. */
-	if (!((flags & GPIOHANDLE_REQUEST_INPUT) ||
-	      (flags & GPIOHANDLE_REQUEST_OUTPUT)) &&
-	    ((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
-	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
-	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
-		return -EINVAL;
-
-	/* Only one bias flag can be set. */
-	if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
-	     (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
-	    ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
-	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
-		return -EINVAL;
-
-	return 0;
-}
-
-static long linehandle_set_config(struct linehandle_state *lh,
-				  void __user *ip)
-{
-	struct gpiohandle_config gcnf;
-	struct gpio_desc *desc;
-	int i, ret;
-	u32 lflags;
-	unsigned long *flagsp;
-
-	if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
-		return -EFAULT;
-
-	lflags = gcnf.flags;
-	ret = linehandle_validate_flags(lflags);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < lh->numdescs; i++) {
-		desc = lh->descs[i];
-		flagsp = &desc->flags;
-
-		assign_bit(FLAG_ACTIVE_LOW, flagsp,
-			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-
-		assign_bit(FLAG_OPEN_DRAIN, flagsp,
-			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-
-		assign_bit(FLAG_OPEN_SOURCE, flagsp,
-			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-
-		assign_bit(FLAG_PULL_UP, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-
-		assign_bit(FLAG_PULL_DOWN, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-
-		assign_bit(FLAG_BIAS_DISABLE, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
-
-		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
-		 */
-		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
-			int val = !!gcnf.default_values[i];
-
-			ret = gpiod_direction_output(desc, val);
-			if (ret)
-				return ret;
-		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
-			ret = gpiod_direction_input(desc);
-			if (ret)
-				return ret;
-		}
-
-		atomic_notifier_call_chain(&desc->gdev->notifier,
-					   GPIOLINE_CHANGED_CONFIG, desc);
-	}
-	return 0;
-}
-
-static long linehandle_ioctl(struct file *filep, unsigned int cmd,
-			     unsigned long arg)
-{
-	struct linehandle_state *lh = filep->private_data;
-	void __user *ip = (void __user *)arg;
-	struct gpiohandle_data ghd;
-	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
-	int i;
-
-	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
-		/* NOTE: It's ok to read values of output lines. */
-		int ret = gpiod_get_array_value_complex(false,
-							true,
-							lh->numdescs,
-							lh->descs,
-							NULL,
-							vals);
-		if (ret)
-			return ret;
-
-		memset(&ghd, 0, sizeof(ghd));
-		for (i = 0; i < lh->numdescs; i++)
-			ghd.values[i] = test_bit(i, vals);
-
-		if (copy_to_user(ip, &ghd, sizeof(ghd)))
-			return -EFAULT;
-
-		return 0;
-	} else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
-		/*
-		 * All line descriptors were created at once with the same
-		 * flags so just check if the first one is really output.
-		 */
-		if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
-			return -EPERM;
-
-		if (copy_from_user(&ghd, ip, sizeof(ghd)))
-			return -EFAULT;
-
-		/* Clamp all values to [0,1] */
-		for (i = 0; i < lh->numdescs; i++)
-			__assign_bit(i, vals, ghd.values[i]);
-
-		/* Reuse the array setting function */
-		return gpiod_set_array_value_complex(false,
-					      true,
-					      lh->numdescs,
-					      lh->descs,
-					      NULL,
-					      vals);
-	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
-		return linehandle_set_config(lh, ip);
-	}
-	return -EINVAL;
-}
-
-#ifdef CONFIG_COMPAT
-static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
-			     unsigned long arg)
-{
-	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
-}
-#endif
-
-static int linehandle_release(struct inode *inode, struct file *filep)
-{
-	struct linehandle_state *lh = filep->private_data;
-	struct gpio_device *gdev = lh->gdev;
-	int i;
-
-	for (i = 0; i < lh->numdescs; i++)
-		gpiod_free(lh->descs[i]);
-	kfree(lh->label);
-	kfree(lh);
-	put_device(&gdev->dev);
-	return 0;
-}
-
-static const struct file_operations linehandle_fileops = {
-	.release = linehandle_release,
-	.owner = THIS_MODULE,
-	.llseek = noop_llseek,
-	.unlocked_ioctl = linehandle_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = linehandle_ioctl_compat,
-#endif
-};
-
-static int linehandle_create(struct gpio_device *gdev, void __user *ip)
-{
-	struct gpiohandle_request handlereq;
-	struct linehandle_state *lh;
-	struct file *file;
-	int fd, i, count = 0, ret;
-	u32 lflags;
-
-	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
-		return -EFAULT;
-	if ((handlereq.lines == 0) || (handlereq.lines > GPIOHANDLES_MAX))
-		return -EINVAL;
-
-	lflags = handlereq.flags;
-
-	ret = linehandle_validate_flags(lflags);
-	if (ret)
-		return ret;
-
-	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
-	if (!lh)
-		return -ENOMEM;
-	lh->gdev = gdev;
-	get_device(&gdev->dev);
-
-	/* Make sure this is terminated */
-	handlereq.consumer_label[sizeof(handlereq.consumer_label)-1] = '\0';
-	if (strlen(handlereq.consumer_label)) {
-		lh->label = kstrdup(handlereq.consumer_label,
-				    GFP_KERNEL);
-		if (!lh->label) {
-			ret = -ENOMEM;
-			goto out_free_lh;
-		}
-	}
-
-	/* Request each GPIO */
-	for (i = 0; i < handlereq.lines; i++) {
-		u32 offset = handlereq.lineoffsets[i];
-		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
-
-		if (IS_ERR(desc)) {
-			ret = PTR_ERR(desc);
-			goto out_free_descs;
-		}
-
-		ret = gpiod_request(desc, lh->label);
-		if (ret)
-			goto out_free_descs;
-		lh->descs[i] = desc;
-		count = i + 1;
-
-		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
-			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
-			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
-			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
-			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
-			set_bit(FLAG_PULL_DOWN, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
-			set_bit(FLAG_PULL_UP, &desc->flags);
-
-		ret = gpiod_set_transitory(desc, false);
-		if (ret < 0)
-			goto out_free_descs;
-
-		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
-		 */
-		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
-			int val = !!handlereq.default_values[i];
-
-			ret = gpiod_direction_output(desc, val);
-			if (ret)
-				goto out_free_descs;
-		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
-			ret = gpiod_direction_input(desc);
-			if (ret)
-				goto out_free_descs;
-		}
-
-		atomic_notifier_call_chain(&desc->gdev->notifier,
-					   GPIOLINE_CHANGED_REQUESTED, desc);
-
-		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
-			offset);
-	}
-	/* Let i point at the last handle */
-	i--;
-	lh->numdescs = handlereq.lines;
-
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-	if (fd < 0) {
-		ret = fd;
-		goto out_free_descs;
-	}
-
-	file = anon_inode_getfile("gpio-linehandle",
-				  &linehandle_fileops,
-				  lh,
-				  O_RDONLY | O_CLOEXEC);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
-		goto out_put_unused_fd;
-	}
-
-	handlereq.fd = fd;
-	if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
-		/*
-		 * fput() will trigger the release() callback, so do not go onto
-		 * the regular error cleanup path here.
-		 */
-		fput(file);
-		put_unused_fd(fd);
-		return -EFAULT;
-	}
-
-	fd_install(fd, file);
-
-	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
-		lh->numdescs);
-
-	return 0;
-
-out_put_unused_fd:
-	put_unused_fd(fd);
-out_free_descs:
-	for (i = 0; i < count; i++)
-		gpiod_free(lh->descs[i]);
-	kfree(lh->label);
-out_free_lh:
-	kfree(lh);
-	put_device(&gdev->dev);
-	return ret;
-}
-
-/*
- * GPIO line event management
- */
-
-/**
- * struct lineevent_state - contains the state of a userspace event
- * @gdev: the GPIO device the event pertains to
- * @label: consumer label used to tag descriptors
- * @desc: the GPIO descriptor held by this event
- * @eflags: the event flags this line was requested with
- * @irq: the interrupt that trigger in response to events on this GPIO
- * @wait: wait queue that handles blocking reads of events
- * @events: KFIFO for the GPIO events
- * @timestamp: cache for the timestamp storing it between hardirq
- * and IRQ thread, used to bring the timestamp close to the actual
- * event
- */
-struct lineevent_state {
-	struct gpio_device *gdev;
-	const char *label;
-	struct gpio_desc *desc;
-	u32 eflags;
-	int irq;
-	wait_queue_head_t wait;
-	DECLARE_KFIFO(events, struct gpioevent_data, 16);
-	u64 timestamp;
-};
-
-#define GPIOEVENT_REQUEST_VALID_FLAGS \
-	(GPIOEVENT_REQUEST_RISING_EDGE | \
-	GPIOEVENT_REQUEST_FALLING_EDGE)
-
-static __poll_t lineevent_poll(struct file *filep,
-				   struct poll_table_struct *wait)
-{
-	struct lineevent_state *le = filep->private_data;
-	__poll_t events = 0;
-
-	poll_wait(filep, &le->wait, wait);
-
-	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
-		events = EPOLLIN | EPOLLRDNORM;
-
-	return events;
-}
-
-
-static ssize_t lineevent_read(struct file *filep,
-			      char __user *buf,
-			      size_t count,
-			      loff_t *f_ps)
-{
-	struct lineevent_state *le = filep->private_data;
-	struct gpioevent_data ge;
-	ssize_t bytes_read = 0;
-	int ret;
-
-	if (count < sizeof(ge))
-		return -EINVAL;
-
-	do {
-		spin_lock(&le->wait.lock);
-		if (kfifo_is_empty(&le->events)) {
-			if (bytes_read) {
-				spin_unlock(&le->wait.lock);
-				return bytes_read;
-			}
-
-			if (filep->f_flags & O_NONBLOCK) {
-				spin_unlock(&le->wait.lock);
-				return -EAGAIN;
-			}
-
-			ret = wait_event_interruptible_locked(le->wait,
-					!kfifo_is_empty(&le->events));
-			if (ret) {
-				spin_unlock(&le->wait.lock);
-				return ret;
-			}
-		}
-
-		ret = kfifo_out(&le->events, &ge, 1);
-		spin_unlock(&le->wait.lock);
-		if (ret != 1) {
-			/*
-			 * This should never happen - we were holding the lock
-			 * from the moment we learned the fifo is no longer
-			 * empty until now.
-			 */
-			ret = -EIO;
-			break;
-		}
-
-		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
-			return -EFAULT;
-		bytes_read += sizeof(ge);
-	} while (count >= bytes_read + sizeof(ge));
-
-	return bytes_read;
-}
-
-static int lineevent_release(struct inode *inode, struct file *filep)
-{
-	struct lineevent_state *le = filep->private_data;
-	struct gpio_device *gdev = le->gdev;
-
-	free_irq(le->irq, le);
-	gpiod_free(le->desc);
-	kfree(le->label);
-	kfree(le);
-	put_device(&gdev->dev);
-	return 0;
-}
-
-static long lineevent_ioctl(struct file *filep, unsigned int cmd,
-			    unsigned long arg)
-{
-	struct lineevent_state *le = filep->private_data;
-	void __user *ip = (void __user *)arg;
-	struct gpiohandle_data ghd;
-
-	/*
-	 * We can get the value for an event line but not set it,
-	 * because it is input by definition.
-	 */
-	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
-		int val;
-
-		memset(&ghd, 0, sizeof(ghd));
-
-		val = gpiod_get_value_cansleep(le->desc);
-		if (val < 0)
-			return val;
-		ghd.values[0] = val;
-
-		if (copy_to_user(ip, &ghd, sizeof(ghd)))
-			return -EFAULT;
-
-		return 0;
-	}
-	return -EINVAL;
-}
-
-#ifdef CONFIG_COMPAT
-static long lineevent_ioctl_compat(struct file *filep, unsigned int cmd,
-				   unsigned long arg)
-{
-	return lineevent_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
-}
-#endif
-
-static const struct file_operations lineevent_fileops = {
-	.release = lineevent_release,
-	.read = lineevent_read,
-	.poll = lineevent_poll,
-	.owner = THIS_MODULE,
-	.llseek = noop_llseek,
-	.unlocked_ioctl = lineevent_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = lineevent_ioctl_compat,
-#endif
-};
-
-static irqreturn_t lineevent_irq_thread(int irq, void *p)
-{
-	struct lineevent_state *le = p;
-	struct gpioevent_data ge;
-	int ret;
-
-	/* Do not leak kernel stack to userspace */
-	memset(&ge, 0, sizeof(ge));
-
-	/*
-	 * We may be running from a nested threaded interrupt in which case
-	 * we didn't get the timestamp from lineevent_irq_handler().
-	 */
-	if (!le->timestamp)
-		ge.timestamp = ktime_get_ns();
-	else
-		ge.timestamp = le->timestamp;
-
-	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
-	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
-		int level = gpiod_get_value_cansleep(le->desc);
-		if (level)
-			/* Emit low-to-high event */
-			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
-		else
-			/* Emit high-to-low event */
-			ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
-	} else if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE) {
-		/* Emit low-to-high event */
-		ge.id = GPIOEVENT_EVENT_RISING_EDGE;
-	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
-		/* Emit high-to-low event */
-		ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
-	} else {
-		return IRQ_NONE;
-	}
-
-	ret = kfifo_in_spinlocked_noirqsave(&le->events, &ge,
-					    1, &le->wait.lock);
-	if (ret)
-		wake_up_poll(&le->wait, EPOLLIN);
-	else
-		pr_debug_ratelimited("event FIFO is full - event dropped\n");
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t lineevent_irq_handler(int irq, void *p)
-{
-	struct lineevent_state *le = p;
-
-	/*
-	 * Just store the timestamp in hardirq context so we get it as
-	 * close in time as possible to the actual event.
-	 */
-	le->timestamp = ktime_get_ns();
-
-	return IRQ_WAKE_THREAD;
-}
-
-static int lineevent_create(struct gpio_device *gdev, void __user *ip)
-{
-	struct gpioevent_request eventreq;
-	struct lineevent_state *le;
-	struct gpio_desc *desc;
-	struct file *file;
-	u32 offset;
-	u32 lflags;
-	u32 eflags;
-	int fd;
-	int ret;
-	int irqflags = 0;
-
-	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
-		return -EFAULT;
-
-	offset = eventreq.lineoffset;
-	lflags = eventreq.handleflags;
-	eflags = eventreq.eventflags;
-
-	desc = gpiochip_get_desc(gdev->chip, offset);
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
-
-	/* Return an error if a unknown flag is set */
-	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
-	    (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
-		return -EINVAL;
-
-	/* This is just wrong: we don't look for events on output lines */
-	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
-		return -EINVAL;
-
-	/* Only one bias flag can be set. */
-	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
-	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
-		return -EINVAL;
-
-	le = kzalloc(sizeof(*le), GFP_KERNEL);
-	if (!le)
-		return -ENOMEM;
-	le->gdev = gdev;
-	get_device(&gdev->dev);
-
-	/* Make sure this is terminated */
-	eventreq.consumer_label[sizeof(eventreq.consumer_label)-1] = '\0';
-	if (strlen(eventreq.consumer_label)) {
-		le->label = kstrdup(eventreq.consumer_label,
-				    GFP_KERNEL);
-		if (!le->label) {
-			ret = -ENOMEM;
-			goto out_free_le;
-		}
-	}
-
-	ret = gpiod_request(desc, le->label);
-	if (ret)
-		goto out_free_label;
-	le->desc = desc;
-	le->eflags = eflags;
-
-	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
-		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
-		set_bit(FLAG_PULL_DOWN, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
-		set_bit(FLAG_PULL_UP, &desc->flags);
-
-	ret = gpiod_direction_input(desc);
-	if (ret)
-		goto out_free_desc;
-
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_REQUESTED, desc);
-
-	le->irq = gpiod_to_irq(desc);
-	if (le->irq <= 0) {
-		ret = -ENODEV;
-		goto out_free_desc;
-	}
-
-	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
-	if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
-		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-	irqflags |= IRQF_ONESHOT;
-
-	INIT_KFIFO(le->events);
-	init_waitqueue_head(&le->wait);
-
-	/* Request a thread to read the events */
-	ret = request_threaded_irq(le->irq,
-			lineevent_irq_handler,
-			lineevent_irq_thread,
-			irqflags,
-			le->label,
-			le);
-	if (ret)
-		goto out_free_desc;
-
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-	if (fd < 0) {
-		ret = fd;
-		goto out_free_irq;
-	}
-
-	file = anon_inode_getfile("gpio-event",
-				  &lineevent_fileops,
-				  le,
-				  O_RDONLY | O_CLOEXEC);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
-		goto out_put_unused_fd;
-	}
-
-	eventreq.fd = fd;
-	if (copy_to_user(ip, &eventreq, sizeof(eventreq))) {
-		/*
-		 * fput() will trigger the release() callback, so do not go onto
-		 * the regular error cleanup path here.
-		 */
-		fput(file);
-		put_unused_fd(fd);
-		return -EFAULT;
-	}
-
-	fd_install(fd, file);
-
-	return 0;
-
-out_put_unused_fd:
-	put_unused_fd(fd);
-out_free_irq:
-	free_irq(le->irq, le);
-out_free_desc:
-	gpiod_free(le->desc);
-out_free_label:
-	kfree(le->label);
-out_free_le:
-	kfree(le);
-	put_device(&gdev->dev);
-	return ret;
-}
-
-static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpioline_info *info)
-{
-	struct gpio_chip *gc = desc->gdev->chip;
-	bool ok_for_pinctrl;
-	unsigned long flags;
-
-	/*
-	 * This function takes a mutex so we must check this before taking
-	 * the spinlock.
-	 *
-	 * FIXME: find a non-racy way to retrieve this information. Maybe a
-	 * lock common to both frameworks?
-	 */
-	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
-
-	spin_lock_irqsave(&gpio_lock, flags);
-
-	if (desc->name) {
-		strncpy(info->name, desc->name, sizeof(info->name));
-		info->name[sizeof(info->name) - 1] = '\0';
-	} else {
-		info->name[0] = '\0';
-	}
-
-	if (desc->label) {
-		strncpy(info->consumer, desc->label, sizeof(info->consumer));
-		info->consumer[sizeof(info->consumer) - 1] = '\0';
-	} else {
-		info->consumer[0] = '\0';
-	}
-
-	/*
-	 * Userspace only need to know that the kernel is using this GPIO so
-	 * it can't use it.
-	 */
-	info->flags = 0;
-	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
-	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
-	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
-	    test_bit(FLAG_EXPORT, &desc->flags) ||
-	    test_bit(FLAG_SYSFS, &desc->flags) ||
-	    !ok_for_pinctrl)
-		info->flags |= GPIOLINE_FLAG_KERNEL;
-	if (test_bit(FLAG_IS_OUT, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_IS_OUT;
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
-	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
-		info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
-				GPIOLINE_FLAG_IS_OUT);
-	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
-		info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
-				GPIOLINE_FLAG_IS_OUT);
-	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
-	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
-}
-
-struct gpio_chardev_data {
-	struct gpio_device *gdev;
-	wait_queue_head_t wait;
-	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
-	struct notifier_block lineinfo_changed_nb;
-	unsigned long *watched_lines;
-};
-
-/*
- * gpio_ioctl() - ioctl handler for the GPIO chardev
- */
-static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
-{
-	struct gpio_chardev_data *priv = filp->private_data;
-	struct gpio_device *gdev = priv->gdev;
-	struct gpio_chip *gc = gdev->chip;
-	void __user *ip = (void __user *)arg;
-	struct gpio_desc *desc;
-	__u32 offset;
-	int hwgpio;
-
-	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!gc)
-		return -ENODEV;
-
-	/* Fill in the struct and pass to userspace */
-	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {
-		struct gpiochip_info chipinfo;
-
-		memset(&chipinfo, 0, sizeof(chipinfo));
-
-		strncpy(chipinfo.name, dev_name(&gdev->dev),
-			sizeof(chipinfo.name));
-		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
-		strncpy(chipinfo.label, gdev->label,
-			sizeof(chipinfo.label));
-		chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
-		chipinfo.lines = gdev->ngpio;
-		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
-			return -EFAULT;
-		return 0;
-	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
-		struct gpioline_info lineinfo;
-
-		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
-			return -EFAULT;
-
-		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		hwgpio = gpio_chip_hwgpio(desc);
-
-		gpio_desc_to_lineinfo(desc, &lineinfo);
-
-		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
-			return -EFAULT;
-		return 0;
-	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
-		return linehandle_create(gdev, ip);
-	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
-		return lineevent_create(gdev, ip);
-	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
-		struct gpioline_info lineinfo;
-
-		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
-			return -EFAULT;
-
-		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		hwgpio = gpio_chip_hwgpio(desc);
-
-		if (test_bit(hwgpio, priv->watched_lines))
-			return -EBUSY;
-
-		gpio_desc_to_lineinfo(desc, &lineinfo);
-
-		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
-			return -EFAULT;
-
-		set_bit(hwgpio, priv->watched_lines);
-		return 0;
-	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
-		if (copy_from_user(&offset, ip, sizeof(offset)))
-			return -EFAULT;
-
-		desc = gpiochip_get_desc(gc, offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		hwgpio = gpio_chip_hwgpio(desc);
-
-		if (!test_bit(hwgpio, priv->watched_lines))
-			return -EBUSY;
-
-		clear_bit(hwgpio, priv->watched_lines);
-		return 0;
-	}
-	return -EINVAL;
-}
-
-#ifdef CONFIG_COMPAT
-static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
-			      unsigned long arg)
-{
-	return gpio_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
-}
-#endif
-
-static struct gpio_chardev_data *
-to_gpio_chardev_data(struct notifier_block *nb)
-{
-	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
-}
-
-static int lineinfo_changed_notify(struct notifier_block *nb,
-				   unsigned long action, void *data)
-{
-	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
-	struct gpioline_info_changed chg;
-	struct gpio_desc *desc = data;
-	int ret;
-
-	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
-		return NOTIFY_DONE;
-
-	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
-	chg.event_type = action;
-	chg.timestamp = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &chg.info);
-
-	ret = kfifo_in_spinlocked(&priv->events, &chg, 1, &priv->wait.lock);
-	if (ret)
-		wake_up_poll(&priv->wait, EPOLLIN);
-	else
-		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
-
-	return NOTIFY_OK;
-}
-
-static __poll_t lineinfo_watch_poll(struct file *filep,
-				    struct poll_table_struct *pollt)
-{
-	struct gpio_chardev_data *priv = filep->private_data;
-	__poll_t events = 0;
-
-	poll_wait(filep, &priv->wait, pollt);
-
-	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
-						 &priv->wait.lock))
-		events = EPOLLIN | EPOLLRDNORM;
-
-	return events;
-}
-
-static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
-				   size_t count, loff_t *off)
-{
-	struct gpio_chardev_data *priv = filep->private_data;
-	struct gpioline_info_changed event;
-	ssize_t bytes_read = 0;
-	int ret;
-
-	if (count < sizeof(event))
-		return -EINVAL;
-
-	do {
-		spin_lock(&priv->wait.lock);
-		if (kfifo_is_empty(&priv->events)) {
-			if (bytes_read) {
-				spin_unlock(&priv->wait.lock);
-				return bytes_read;
-			}
-
-			if (filep->f_flags & O_NONBLOCK) {
-				spin_unlock(&priv->wait.lock);
-				return -EAGAIN;
-			}
-
-			ret = wait_event_interruptible_locked(priv->wait,
-					!kfifo_is_empty(&priv->events));
-			if (ret) {
-				spin_unlock(&priv->wait.lock);
-				return ret;
-			}
-		}
-
-		ret = kfifo_out(&priv->events, &event, 1);
-		spin_unlock(&priv->wait.lock);
-		if (ret != 1) {
-			ret = -EIO;
-			break;
-			/* We should never get here. See lineevent_read(). */
-		}
-
-		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
-			return -EFAULT;
-		bytes_read += sizeof(event);
-	} while (count >= bytes_read + sizeof(event));
-
-	return bytes_read;
-}
-
-/**
- * gpio_chrdev_open() - open the chardev for ioctl operations
- * @inode: inode for this chardev
- * @filp: file struct for storing private data
- * Returns 0 on success
- */
-static int gpio_chrdev_open(struct inode *inode, struct file *filp)
-{
-	struct gpio_device *gdev = container_of(inode->i_cdev,
-					      struct gpio_device, chrdev);
-	struct gpio_chardev_data *priv;
-	int ret = -ENOMEM;
-
-	/* Fail on open if the backing gpiochip is gone */
-	if (!gdev->chip)
-		return -ENODEV;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
-	if (!priv->watched_lines)
-		goto out_free_priv;
-
-	init_waitqueue_head(&priv->wait);
-	INIT_KFIFO(priv->events);
-	priv->gdev = gdev;
-
-	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = atomic_notifier_chain_register(&gdev->notifier,
-					     &priv->lineinfo_changed_nb);
-	if (ret)
-		goto out_free_bitmap;
-
-	get_device(&gdev->dev);
-	filp->private_data = priv;
-
-	ret = nonseekable_open(inode, filp);
-	if (ret)
-		goto out_unregister_notifier;
-
-	return ret;
-
-out_unregister_notifier:
-	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
-out_free_bitmap:
-	bitmap_free(priv->watched_lines);
-out_free_priv:
-	kfree(priv);
-	return ret;
-}
-
-/**
- * gpio_chrdev_release() - close chardev after ioctl operations
- * @inode: inode for this chardev
- * @filp: file struct for storing private data
- * Returns 0 on success
- */
-static int gpio_chrdev_release(struct inode *inode, struct file *filp)
-{
-	struct gpio_chardev_data *priv = filp->private_data;
-	struct gpio_device *gdev = priv->gdev;
-
-	bitmap_free(priv->watched_lines);
-	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
-	put_device(&gdev->dev);
-	kfree(priv);
-
-	return 0;
-}
-
-static const struct file_operations gpio_fileops = {
-	.release = gpio_chrdev_release,
-	.open = gpio_chrdev_open,
-	.poll = lineinfo_watch_poll,
-	.read = lineinfo_watch_read,
-	.owner = THIS_MODULE,
-	.llseek = no_llseek,
-	.unlocked_ioctl = gpio_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = gpio_ioctl_compat,
-#endif
-};
-
 static void gpiodevice_release(struct device *dev)
 {
 	struct gpio_device *gdev = dev_get_drvdata(dev);
@@ -1539,17 +435,10 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
 	int ret;
 
-	cdev_init(&gdev->chrdev, &gpio_fileops);
-	gdev->chrdev.owner = THIS_MODULE;
-	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
-
-	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
+	ret = gpiolib_cdev_register(gdev, gpio_devt);
 	if (ret)
 		return ret;
 
-	chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
-		 MAJOR(gpio_devt), gdev->id);
-
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
 		goto err_remove_device;
@@ -1562,7 +451,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	return 0;
 
 err_remove_device:
-	cdev_device_del(&gdev->chrdev, &gdev->dev);
+	gpiolib_cdev_unregister(gdev);
 	return ret;
 }
 
@@ -1884,7 +773,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	 * be removed, else it will be dangling until the last user is
 	 * gone.
 	 */
-	cdev_device_del(&gdev->chrdev, &gdev->dev);
+	gpiolib_cdev_unregister(gdev);
 	put_device(&gdev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);

base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
-- 
2.27.0

