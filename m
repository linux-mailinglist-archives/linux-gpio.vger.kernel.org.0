Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC7204853
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732250AbgFWEDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732284AbgFWEDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:10 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC21C061573;
        Mon, 22 Jun 2020 21:03:10 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k6so8542788pll.9;
        Mon, 22 Jun 2020 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QxrWtkwzREnCbAijsvHAvzPeZlf+oy1xY1mUbYncNT0=;
        b=QoIsvqJ9Yiy9bwm6b168EekzxPi2rB+p+FrHiUhNuckHqNb0ABkiGEsZ30UpUr4kxt
         a/xYorpQTBPgxHWjlXUflHAAFwa+10S+n7ippU1DduLoiBME7A1iviazDqC9/ErU2m3K
         aF+trv02RIXgOmyUjeHw8uMUBKSIIOP2kvprY9171JXI4BoJhd26J97zs5bt1zhukUB+
         xB092rsyw0MJ1sBqx1z40WAggANjv9LgHALB8Gu0AD2tkajvQdBKq4CvyFMyzH9h7TI5
         dMvYxfGce2viCTb6CD2asKnDa3aLtddNzI5V2y0NXYNiLW33ZfdaCAXQPY6SS3z8EwVI
         1UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QxrWtkwzREnCbAijsvHAvzPeZlf+oy1xY1mUbYncNT0=;
        b=MZ51b7NEb4D+Y4P3qnVFj4Ca80C/O0rFvFGrovLckfZeKE2xwsLfk6eyc1NkruIRIE
         TE5pEfiaOh7mfua2teB/sCwWSUVyYlJSkRYyee8qOQqUvRHbP0gvny92YuA1pA+55Ssw
         0FgHxpje5+Xy0RYfb8i7UcMHLAE54tif7piG0sc5RtpHcbC6+q6APNtnn5HoyaRPZR3t
         vj6VNOSwK6jUxlbJzyM/ngqWLPxXIGthyeLnXEJAaUSSeEFNSzkFCX5H/5yAIxthdEXT
         126xTYNf4dWE/dsVzWYQkensPixRjowZeKTXHzVgtoj6t8acKiYswnDCzWocQcMeKZ8a
         D6cw==
X-Gm-Message-State: AOAM532G65Atd4UI7UgQfc71s/1JEySksKmYobUr5KR8+0itRkNR49WW
        tevkmLhudgjfE9x40vpPlh8TQQci1n0=
X-Google-Smtp-Source: ABdhPJywEaVMU1E4KhgAA3hyGKa5XjdsjzSW8j6eauC6jxQrvsxU2CmYjukEjTAEYOMECyRhbutF3w==
X-Received: by 2002:a17:90a:2142:: with SMTP id a60mr21471784pje.234.1592884988764;
        Mon, 22 Jun 2020 21:03:08 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 16/22] gpiolib: cdev: add V2 uAPI implementation to parity with V1
Date:   Tue, 23 Jun 2020 12:01:01 +0800
Message-Id: <20200623040107.22270-17-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add implementation of the V2 uAPI up to parity with V1.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

This patch only covers the V2 functionality that is a direct analogue of
the V1.  New V2 functionality is added in subsequent patches.

The core of the implementation is the struct line, which is drawn from the
existing struct linehandle_state implementation, but modified to deal with
the V2 uAPI structs.

The struct edge_detector provides the the edge detection functionality,
and is drawn from the existing lineevent_state implementation.

The two uAPI versions are mostly independent - other than where they both
provide line info changes via reads on the chip fd.  As the info change
structs differ between V1 and V2, the infowatch implementation tracks which
version of the infowatch ioctl, either GPIO_GET_LINEINFO_WATCH_IOCTL or
GPIO_GET_LINEINFO_WATCH_V2_IOCTL, initiates the initial watch and returns
the corresponding info change struct to the read.  The version supported
on that fd locks to that version on the first watch request, so subsequent
watches from that process must use the same uAPI version.

 drivers/gpio/gpiolib-cdev.c | 934 ++++++++++++++++++++++++++++++++++--
 1 file changed, 905 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b6878fc87dfc..d4a22d78953f 100644
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
@@ -14,11 +16,13 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
 #include <linux/spinlock.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
+#include <linux/workqueue.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
@@ -34,6 +38,7 @@
  * GPIO line handle management
  */
 
+#ifdef CONFIG_GPIO_CDEV_V1
 /**
  * struct linehandle_state - contains the state of a userspace handle
  * @gdev: the GPIO device the handle pertains to
@@ -377,6 +382,699 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	put_device(&gdev->dev);
 	return ret;
 }
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
+/**
+ * struct edge_detector - contains the state of a line edge detector
+ * @line: the corresponding line request
+ * @irq: the interrupt triggered in response to events on this GPIO
+ * @timestamp: cache for the timestamp storing it between hardirq and IRQ
+ * thread, used to bring the timestamp close to the actual event
+ * @seqno: the seqno for the current edge event in the sequence of events
+ * for the corresponding line request. Ths is drawn from the @line.
+ * @line_seqno: the seqno for the current edge event in the sequence of
+ * events for this line.
+ */
+struct edge_detector {
+	struct line *line;
+	unsigned int irq;
+	/*
+	 * timestamp and seqno are shared by edge_irq_handler and
+	 * edge_irq_thread which are themselves mutually exclusive.
+	 */
+	u64 timestamp;
+	u32 seqno;
+	u32 line_seqno;
+};
+
+/**
+ * struct line - contains the state of a userspace line request
+ * @gdev: the GPIO device the line request pertains to
+ * @label: consumer label used to tag descriptors
+ * @num_descs: the number of descriptors held in the descs array
+ * @edge_detection: the type of edge detection applied
+ * @wait: wait queue that handles blocking reads of events
+ * @events: KFIFO for the GPIO events
+ * @seqno: the sequence number for edge events generated on all lines in
+ * this line request.  Note that this is not used when @num_descs is 1, as
+ * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex serializing GPIOLINE_SET_CONFIG_IOCTL ioctl() calls to
+ * ensure consistency of configuration changes.
+ * @edets: an array of edge detectors, of size @num_descs
+ * @descs: the GPIO descriptors held by this line request, with @num_descs
+ * elements.
+ */
+struct line {
+	struct gpio_device *gdev;
+	const char *label;
+	u32 num_descs;
+	enum gpioline_edge edge_detection;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO_PTR(events, struct gpioline_event);
+	atomic_t seqno;
+	struct mutex config_mutex; /* serializes line_set_config calls */
+	struct edge_detector *edets;
+	/* descs must be last so it can be dynamically sized */
+	struct gpio_desc *descs[];
+};
+
+static inline struct gpio_desc *edge_detector_desc(
+		const struct edge_detector *edet)
+{
+	return edet->line->descs[edet - &edet->line->edets[0]];
+}
+
+static irqreturn_t edge_irq_thread(int irq, void *p)
+{
+	struct edge_detector *edet = p;
+	struct line *line = edet->line;
+	struct gpio_desc *desc = edge_detector_desc(edet);
+	struct gpioline_event le;
+	int ret;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&le, 0, sizeof(le));
+
+	/*
+	 * We may be running from a nested threaded interrupt in which case
+	 * we didn't get the timestamp from edge_irq_handler().
+	 */
+	if (!edet->timestamp) {
+		le.timestamp = ktime_get_ns();
+		if (line->num_descs != 1)
+			edet->seqno = atomic_inc_return(&line->seqno);
+	} else {
+		le.timestamp = edet->timestamp;
+	}
+
+	edet->timestamp = 0;
+
+	if (line->edge_detection == GPIOLINE_EDGE_BOTH) {
+		int level = gpiod_get_value_cansleep(desc);
+
+		if (level)
+			/* Emit low-to-high event */
+			le.id = GPIOLINE_EVENT_RISING_EDGE;
+		else
+			/* Emit high-to-low event */
+			le.id = GPIOLINE_EVENT_FALLING_EDGE;
+	} else if (line->edge_detection == GPIOLINE_EDGE_RISING) {
+		/* Emit low-to-high event */
+		le.id = GPIOLINE_EVENT_RISING_EDGE;
+	} else if (line->edge_detection == GPIOLINE_EDGE_FALLING) {
+		/* Emit high-to-low event */
+		le.id = GPIOLINE_EVENT_FALLING_EDGE;
+	} else {
+		return IRQ_NONE;
+	}
+	edet->line_seqno++;
+	le.line_seqno = edet->line_seqno;
+	le.seqno = (line->num_descs == 1) ? le.line_seqno : edet->seqno;
+	le.offset = gpio_chip_hwgpio(desc);
+
+	ret = kfifo_in_spinlocked_noirqsave(&line->events, &le,
+					    1, &line->wait.lock);
+	if (ret)
+		wake_up_poll(&line->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t edge_irq_handler(int irq, void *p)
+{
+	struct edge_detector *edet = p;
+	struct line *line = edet->line;
+
+	/*
+	 * Just store the timestamp in hardirq context so we get it as
+	 * close in time as possible to the actual event.
+	 */
+	edet->timestamp = ktime_get_ns();
+
+	if (line->num_descs != 1)
+		edet->seqno = atomic_inc_return(&line->seqno);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int edge_detector_start(struct edge_detector *edet)
+{
+	int ret, irq, irqflags = 0;
+	struct gpio_desc *desc;
+
+	desc = edge_detector_desc(edet);
+	irq = gpiod_to_irq(desc);
+
+	if (irq <= 0)
+		return -ENODEV;
+
+	edet->seqno = 0;
+	edet->line_seqno = 0;
+
+	if (edet->line->edge_detection & GPIOLINE_EDGE_RISING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+	if (edet->line->edge_detection & GPIOLINE_EDGE_FALLING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+	irqflags |= IRQF_ONESHOT;
+
+	/* Request a thread to read the events */
+	ret = request_threaded_irq(irq,
+				   edge_irq_handler,
+				   edge_irq_thread,
+				   irqflags,
+				   edet->line->label,
+				   edet);
+	if (ret)
+		return ret;
+
+	edet->irq = irq;
+	return 0;
+}
+
+static void edge_detector_stop(struct edge_detector *edet)
+{
+	if (edet->irq) {
+		free_irq(edet->irq, edet);
+		edet->irq = 0;
+	}
+}
+
+static int edge_detector_setup(struct edge_detector *edet,
+			       struct gpioline_config *lc)
+{
+	if (lc->edge_detection)
+		return edge_detector_start(edet);
+	return 0;
+}
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
+#define GPIOLINE_CONFIG_VALID_FLAGS \
+	(GPIOLINE_FLAG_V2_ACTIVE_LOW | \
+	GPIOLINE_FLAG_V2_DIRECTION | \
+	GPIOLINE_FLAG_V2_DRIVE | \
+	GPIOLINE_FLAG_V2_BIAS | \
+	GPIOLINE_FLAG_V2_EDGE_DETECTION | \
+	GPIOLINE_FLAG_V2_DEBOUNCE)
+
+static int gpioline_config_validate(struct gpioline_config *config)
+{
+	u32 lflags = config->flags;
+
+	/* Return an error if an unknown flag is set */
+	if (lflags & ~GPIOLINE_CONFIG_VALID_FLAGS)
+		return -EINVAL;
+
+	/* Check ranges */
+	if (lflags & GPIOLINE_FLAG_V2_DIRECTION) {
+		if (config->direction > GPIOLINE_DIRECTION_OUTPUT)
+			return -EINVAL;
+	} else if (config->direction != 0) {
+		return -EINVAL;
+	}
+
+	if (lflags & GPIOLINE_FLAG_V2_DRIVE) {
+		if (config->drive > GPIOLINE_DRIVE_OPEN_SOURCE)
+			return -EINVAL;
+	} else if (config->drive != 0) {
+		return -EINVAL;
+	}
+
+	if (lflags & GPIOLINE_FLAG_V2_BIAS) {
+		if (config->bias > GPIOLINE_BIAS_PULL_DOWN)
+			return -EINVAL;
+	} else if (config->bias != 0) {
+		return -EINVAL;
+	}
+
+	if (lflags & GPIOLINE_FLAG_V2_EDGE_DETECTION) {
+		if (config->edge_detection > GPIOLINE_EDGE_BOTH)
+			return -EINVAL;
+	} else if (config->edge_detection != 0) {
+		return -EINVAL;
+	}
+
+	if (config->debounce_period && !(lflags & GPIOLINE_FLAG_V2_DEBOUNCE))
+		return -EINVAL;
+
+	/* Drive requires explicit output direction. */
+	if ((lflags & GPIOLINE_FLAG_V2_DRIVE) &&
+	    (!(lflags & GPIOLINE_FLAG_V2_DIRECTION) ||
+	      (config->direction != GPIOLINE_DIRECTION_OUTPUT)))
+		return -EINVAL;
+
+	/* Bias requires explicit direction. */
+	if ((lflags & GPIOLINE_FLAG_V2_BIAS) &&
+	    !(lflags & GPIOLINE_FLAG_V2_DIRECTION))
+		return -EINVAL;
+
+	/* Edge detection requires explicit input direction. */
+	if ((lflags & GPIOLINE_FLAG_V2_EDGE_DETECTION) &&
+	    (!(lflags & GPIOLINE_FLAG_V2_DIRECTION) ||
+	      (config->direction != GPIOLINE_DIRECTION_INPUT)))
+		return -EINVAL;
+
+	/* Debounce requires explicit input direction. */
+	if ((lflags & GPIOLINE_FLAG_V2_DEBOUNCE) &&
+	    (!(lflags & GPIOLINE_FLAG_V2_DIRECTION) ||
+	      (config->direction != GPIOLINE_DIRECTION_INPUT)))
+		return -EINVAL;
+
+	if (padding_not_zeroed(config->padding,	GPIOLINE_CONFIG_PAD_SIZE))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void gpioline_config_to_desc_flags(struct gpioline_config *lc,
+					  unsigned long *flagsp)
+{
+	assign_bit(FLAG_ACTIVE_LOW, flagsp,
+		   lc->flags & GPIOLINE_FLAG_V2_ACTIVE_LOW);
+	if (lc->flags & GPIOLINE_FLAG_V2_DRIVE) {
+		assign_bit(FLAG_OPEN_DRAIN, flagsp,
+			lc->drive == GPIOLINE_DRIVE_OPEN_DRAIN);
+		assign_bit(FLAG_OPEN_SOURCE, flagsp,
+			lc->drive == GPIOLINE_DRIVE_OPEN_SOURCE);
+	}
+	if (lc->flags & GPIOLINE_FLAG_V2_BIAS) {
+		assign_bit(FLAG_PULL_UP, flagsp,
+			lc->bias == GPIOLINE_BIAS_PULL_UP);
+		assign_bit(FLAG_PULL_DOWN, flagsp,
+			lc->bias == GPIOLINE_BIAS_PULL_DOWN);
+		assign_bit(FLAG_BIAS_DISABLE, flagsp,
+			lc->bias == GPIOLINE_BIAS_DISABLED);
+	}
+}
+
+static long line_set_config_locked(struct line *line,
+				   struct gpioline_config *lc)
+{
+	struct gpio_desc *desc;
+	unsigned long *vals;
+	int i, ret;
+
+	/* disallow edge detection changes */
+	if (line->edge_detection != lc->edge_detection)
+		return -EINVAL;
+
+	desc = line->descs[0];
+
+	if (line->edge_detection != GPIOLINE_EDGE_NONE) {
+		/* disallow polarity changes */
+		if (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
+		    ((lc->flags & GPIOLINE_FLAG_V2_ACTIVE_LOW) != 0))
+			return -EINVAL;
+	}
+
+	vals = (unsigned long *)lc->values.bitmap;
+
+	for (i = 0; i < line->num_descs; i++) {
+		desc = line->descs[i];
+		gpioline_config_to_desc_flags(lc, &desc->flags);
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (lc->flags & GPIOLINE_FLAG_V2_DIRECTION) {
+			if (lc->direction == GPIOLINE_DIRECTION_OUTPUT) {
+				int val = test_bit(i, vals);
+
+				ret = gpiod_direction_output(desc, val);
+				if (ret)
+					return ret;
+			} else {
+				ret = gpiod_direction_input(desc);
+				if (ret)
+					return ret;
+			}
+		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_CONFIG, desc);
+	}
+	return 0;
+}
+
+static long line_set_config(struct line *line, void __user *ip)
+{
+	struct gpioline_config lc;
+	int ret;
+
+	if (copy_from_user(&lc, ip, sizeof(lc)))
+		return -EFAULT;
+
+	ret = gpioline_config_validate(&lc);
+	if (ret)
+		return ret;
+
+	mutex_lock(&line->config_mutex);
+
+	ret = line_set_config_locked(line, &lc);
+
+	mutex_unlock(&line->config_mutex);
+
+	return ret;
+}
+
+static long line_ioctl(struct file *file, unsigned int cmd,
+		       unsigned long arg)
+{
+	struct line *line = file->private_data;
+	void __user *ip = (void __user *)arg;
+	struct gpioline_values glv;
+	unsigned long *vals = (unsigned long *)glv.bitmap;
+	int ret;
+
+	if (cmd == GPIOLINE_GET_VALUES_IOCTL) {
+		/* NOTE: It's ok to read values of output lines. */
+		memset(&glv, 0, sizeof(glv));
+		ret = gpiod_get_array_value_complex(false,
+						    true,
+						    line->num_descs,
+						    line->descs,
+						    NULL,
+						    vals);
+		if (ret)
+			return ret;
+
+		if (copy_to_user(ip, &glv, sizeof(glv)))
+			return -EFAULT;
+
+		return 0;
+	} else if (cmd == GPIOLINE_SET_VALUES_IOCTL) {
+		/*
+		 * All line descriptors were created at once with the same
+		 * flags so just check if the first one is really output.
+		 */
+		if (!test_bit(FLAG_IS_OUT, &line->descs[0]->flags))
+			return -EPERM;
+
+		if (copy_from_user(&glv, ip, sizeof(glv)))
+			return -EFAULT;
+
+		/* Reuse the array setting function */
+		return gpiod_set_array_value_complex(false,
+						     true,
+						     line->num_descs,
+						     line->descs,
+						     NULL,
+						     vals);
+	} else if (cmd == GPIOLINE_SET_CONFIG_IOCTL) {
+		return line_set_config(line, ip);
+	}
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
+static __poll_t line_poll(struct file *file,
+			  struct poll_table_struct *wait)
+{
+	struct line *line = file->private_data;
+	__poll_t events = 0;
+
+	poll_wait(file, &line->wait, wait);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&line->events, &line->wait.lock))
+		events = EPOLLIN | EPOLLRDNORM;
+
+	return events;
+}
+
+static ssize_t line_read(struct file *file,
+			 char __user *buf,
+			 size_t count,
+			 loff_t *f_ps)
+{
+	struct line *line = file->private_data;
+	struct gpioline_event le;
+	ssize_t bytes_read = 0;
+	int ret;
+
+	if (count < sizeof(le))
+		return -EINVAL;
+
+	do {
+		spin_lock(&line->wait.lock);
+		if (kfifo_is_empty(&line->events)) {
+			if (bytes_read) {
+				spin_unlock(&line->wait.lock);
+				return bytes_read;
+			}
+
+			if (file->f_flags & O_NONBLOCK) {
+				spin_unlock(&line->wait.lock);
+				return -EAGAIN;
+			}
+
+			ret = wait_event_interruptible_locked(line->wait,
+					!kfifo_is_empty(&line->events));
+			if (ret) {
+				spin_unlock(&line->wait.lock);
+				return ret;
+			}
+		}
+
+		ret = kfifo_out(&line->events, &le, 1);
+		spin_unlock(&line->wait.lock);
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
+		if (copy_to_user(buf + bytes_read, &le, sizeof(le)))
+			return -EFAULT;
+		bytes_read += sizeof(le);
+	} while (count >= bytes_read + sizeof(le));
+
+	return bytes_read;
+}
+
+static void line_free(struct line *line)
+{
+	int i;
+
+	for (i = 0; i < line->num_descs; i++) {
+		if (line->edets)
+			edge_detector_stop(&line->edets[i]);
+		if (line->descs[i])
+			gpiod_free(line->descs[i]);
+	}
+	kfifo_free(&line->events);
+	kfree(line->label);
+	kfree(line->edets);
+	kfree(line);
+	put_device(&line->gdev->dev);
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
+	.read = line_read,
+	.poll = line_poll,
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
+	int fd, i, ret, size;
+	struct gpioline_config *lc;
+	unsigned long *vals;
+
+	if (copy_from_user(&linereq, ip, sizeof(linereq)))
+		return -EFAULT;
+	if ((linereq.num_lines == 0) || (linereq.num_lines > GPIOLINES_MAX))
+		return -EINVAL;
+
+	if (padding_not_zeroed(linereq.padding, GPIOLINE_REQUEST_PAD_SIZE))
+		return -EINVAL;
+
+	lc = &linereq.config;
+	ret = gpioline_config_validate(lc);
+	if (ret)
+		return ret;
+
+	/* event_buffer_size only valid with edge_detection */
+	if ((linereq.event_buffer_size) &&
+	    !(linereq.config.flags & GPIOLINE_FLAG_V2_EDGE_DETECTION))
+		return -EINVAL;
+
+	line = kzalloc(struct_size(line, descs, linereq.num_lines),
+		       GFP_KERNEL);
+	if (!line)
+		return -ENOMEM;
+
+	line->edets = kcalloc(linereq.num_lines, sizeof(*line->edets),
+			      GFP_KERNEL);
+	if (!line->edets)
+		return -ENOMEM;
+
+	for (i = 0; i < linereq.num_lines; i++)
+		line->edets[i].line = line;
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
+	mutex_init(&line->config_mutex);
+	init_waitqueue_head(&line->wait);
+	if (lc->edge_detection) {
+		size = linereq.event_buffer_size;
+
+		if (size > GPIOLINES_MAX*16)
+			size = GPIOLINES_MAX*16;
+		else if (size == 0)
+			size = linereq.num_lines*16;
+
+		ret = kfifo_alloc(&line->events, size, GFP_KERNEL);
+		if (ret)
+			goto out_free_line;
+
+		line->edge_detection = lc->edge_detection;
+	}
+
+	atomic_set(&line->seqno, 0);
+	line->num_descs = linereq.num_lines;
+	vals = (unsigned long *)lc->values.bitmap;
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
+		gpioline_config_to_desc_flags(lc, &desc->flags);
+
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_line;
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (lc->flags & GPIOLINE_FLAG_V2_DIRECTION) {
+			if (lc->direction == GPIOLINE_DIRECTION_OUTPUT) {
+				int val = test_bit(i, vals);
+
+				ret = gpiod_direction_output(desc, val);
+				if (ret)
+					goto out_free_line;
+			} else {
+				ret = gpiod_direction_input(desc);
+				if (ret)
+					goto out_free_line;
+				ret = edge_detector_setup(&line->edets[i], lc);
+				if (ret)
+					goto out_free_line;
+			}
+		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_REQUESTED, desc);
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
@@ -750,10 +1448,63 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+static void gpioline_info_v2_to_v1(struct gpioline_info_v2 *info_v2,
+				   struct gpioline_info *info_v1)
+{
+	int flagsv2 = info_v2->config.flags;
+
+	strncpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
+	strncpy(info_v1->consumer, info_v2->consumer,
+		sizeof(info_v1->consumer));
+	info_v1->line_offset = info_v2->offset;
+	info_v1->flags = 0;
+
+	if (flagsv2 & GPIOLINE_FLAG_V2_USED)
+		info_v1->flags |= GPIOLINE_FLAG_KERNEL;
+
+	if (info_v2->config.direction == GPIOLINE_DIRECTION_OUTPUT)
+		info_v1->flags |= GPIOLINE_FLAG_IS_OUT;
+
+	if (flagsv2 & GPIOLINE_FLAG_V2_ACTIVE_LOW)
+		info_v1->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+
+	if (flagsv2 & GPIOLINE_FLAG_V2_DRIVE) {
+		enum gpioline_drive drive = info_v2->config.drive;
+
+		if (drive == GPIOLINE_DRIVE_OPEN_DRAIN)
+			info_v1->flags |= GPIOLINE_FLAG_OPEN_DRAIN;
+		else if (drive == GPIOLINE_DRIVE_OPEN_SOURCE)
+			info_v1->flags |= GPIOLINE_FLAG_OPEN_SOURCE;
+	}
+
+	if (flagsv2 & GPIOLINE_FLAG_V2_BIAS) {
+		enum gpioline_bias bias = info_v2->config.bias;
+
+		if (bias == GPIOLINE_BIAS_PULL_UP)
+			info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+		else if (bias == GPIOLINE_BIAS_PULL_DOWN)
+			info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+		else if (bias == GPIOLINE_BIAS_DISABLED)
+			info_v1->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
+	}
+}
+
+static void gpioline_info_changed_v2_to_v1(
+		struct gpioline_info_changed_v2 *lic_v2,
+		struct gpioline_info_changed *lic_v1)
+{
+	gpioline_info_v2_to_v1(&lic_v2->info, &lic_v1->info);
+	lic_v1->timestamp = lic_v2->timestamp;
+	lic_v1->event_type = lic_v2->event_type;
+}
+
+#endif /* CONFIG_GPIO_CDEV_V1 */
+
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpioline_info *info)
+				  struct gpioline_info_v2 *info)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
+	struct gpioline_config *lc = &info->config;
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
@@ -765,7 +1516,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * lock common to both frameworks?
 	 */
 	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
+		pinctrl_gpio_can_use_line(gc->base + info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -783,34 +1534,46 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		info->consumer[0] = '\0';
 	}
 
+	lc->flags = GPIOLINE_FLAG_V2_DIRECTION;
 	/*
 	 * Userspace only need to know that the kernel is using this GPIO so
 	 * it can't use it.
 	 */
-	info->flags = 0;
 	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
 	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
 	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 	    test_bit(FLAG_EXPORT, &desc->flags) ||
 	    test_bit(FLAG_SYSFS, &desc->flags) ||
 	    !ok_for_pinctrl)
-		info->flags |= GPIOLINE_FLAG_KERNEL;
-	if (test_bit(FLAG_IS_OUT, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_IS_OUT;
+		lc->flags |= GPIOLINE_FLAG_V2_USED;
+	if (test_bit(FLAG_IS_OUT, &desc->flags)) {
+		lc->direction = GPIOLINE_DIRECTION_OUTPUT;
+		lc->flags |= GPIOLINE_FLAG_V2_DRIVE;
+		if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+			lc->drive = GPIOLINE_DRIVE_OPEN_DRAIN;
+		else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+			lc->drive = GPIOLINE_DRIVE_OPEN_SOURCE;
+		else
+			lc->drive = GPIOLINE_DRIVE_PUSH_PULL;
+	} else {
+		lc->direction = GPIOLINE_DIRECTION_INPUT;
+	}
+
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
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
+		lc->flags |= GPIOLINE_FLAG_V2_ACTIVE_LOW;
+
+	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags)) {
+		lc->flags |= GPIOLINE_FLAG_V2_BIAS;
+		lc->bias = GPIOLINE_BIAS_DISABLED;
+	} else if (test_bit(FLAG_PULL_DOWN, &desc->flags)) {
+		lc->flags |= GPIOLINE_FLAG_V2_BIAS;
+		lc->bias = GPIOLINE_BIAS_PULL_DOWN;
+	} else if (test_bit(FLAG_PULL_UP, &desc->flags)) {
+		lc->flags |= GPIOLINE_FLAG_V2_BIAS;
+		lc->bias = GPIOLINE_BIAS_PULL_UP;
+	}
+
+	lc->edge_detection = 0;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
@@ -818,11 +1581,62 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 struct gpio_chardev_data {
 	struct gpio_device *gdev;
 	wait_queue_head_t wait;
-	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
+	DECLARE_KFIFO(events, struct gpioline_info_changed_v2, 32);
 	struct notifier_block lineinfo_changed_nb;
 	unsigned long *watched_lines;
+#ifdef CONFIG_GPIO_CDEV_V1
+	atomic_t watch_abi_version;
+#endif
 };
 
+#ifdef CONFIG_GPIO_CDEV_V1
+static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
+				       unsigned int version)
+{
+	int abiv = atomic_read(&cdata->watch_abi_version);
+
+	if (abiv == 0) {
+		atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
+		abiv = atomic_read(&cdata->watch_abi_version);
+	}
+	if (abiv != version)
+		return -EPERM;
+	return 0;
+}
+#endif
+
+static int lineinfo_get(struct gpio_chardev_data *gcdev, void __user *ip,
+			unsigned int cmd)
+{
+	struct gpio_desc *desc;
+	struct gpioline_info_v2 lineinfo;
+
+	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+		return -EFAULT;
+
+	if (padding_not_zeroed(lineinfo.padding, GPIOLINE_INFO_V2_PAD_SIZE))
+		return -EINVAL;
+
+	desc = gpiochip_get_desc(gcdev->gdev->chip, lineinfo.offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	if (cmd == GPIO_GET_LINEINFO_WATCH_V2_IOCTL) {
+#ifdef CONFIG_GPIO_CDEV_V1
+		if (lineinfo_ensure_abi_version(gcdev, 2))
+			return -EPERM;
+#endif
+		if (test_and_set_bit(lineinfo.offset, gcdev->watched_lines))
+			return -EBUSY;
+	}
+	gpio_desc_to_lineinfo(desc, &lineinfo);
+
+	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+		return -EFAULT;
+
+	return 0;
+}
+
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
@@ -855,8 +1669,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
+#ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
 		struct gpioline_info lineinfo;
+		struct gpioline_info_v2 lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -866,7 +1682,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		lineinfo_v2.offset = lineinfo.line_offset;
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		gpioline_info_v2_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -877,6 +1695,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return lineevent_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
 		struct gpioline_info lineinfo;
+		struct gpioline_info_v2 lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -886,15 +1705,26 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
+		if (lineinfo_ensure_abi_version(gcdev, 1))
+			return -EPERM;
+
 		if (test_and_set_bit(lineinfo.line_offset, gcdev->watched_lines))
 			return -EBUSY;
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		lineinfo_v2.offset = lineinfo.line_offset;
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		gpioline_info_v2_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 
 		return 0;
+#endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_GET_LINEINFO_V2_IOCTL ||
+		   cmd == GPIO_GET_LINEINFO_WATCH_V2_IOCTL) {
+		return lineinfo_get(gcdev, ip, cmd);
+	} else if (cmd == GPIO_GET_LINE_IOCTL) {
+		return line_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
@@ -928,7 +1758,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct gpio_chardev_data *gcdev = to_gpio_chardev_data(nb);
-	struct gpioline_info_changed chg;
+	struct gpioline_info_changed_v2 chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
@@ -936,7 +1766,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
+	chg.info.offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
@@ -969,12 +1799,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				   size_t count, loff_t *off)
 {
 	struct gpio_chardev_data *gcdev = file->private_data;
-	struct gpioline_info_changed event;
+	struct gpioline_info_changed_v2 event;
 	ssize_t bytes_read = 0;
 	int ret;
+	size_t event_size;
 
-	if (count < sizeof(event))
+#ifndef CONFIG_GPIO_CDEV_V1
+	event_size = sizeof(struct gpioline_info_changed_v2);
+	if (count < event_size)
 		return -EINVAL;
+#endif
 
 	do {
 		spin_lock(&gcdev->wait.lock);
@@ -996,7 +1830,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				return ret;
 			}
 		}
-
+#ifdef CONFIG_GPIO_CDEV_V1
+		/* must be after kfifo check so watch_abi_version is set */
+		if (atomic_read(&gcdev->watch_abi_version) == 2)
+			event_size = sizeof(struct gpioline_info_changed_v2);
+		else
+			event_size = sizeof(struct gpioline_info_changed);
+		if (count < event_size) {
+			spin_unlock(&gcdev->wait.lock);
+			return -EINVAL;
+		}
+#endif
 		ret = kfifo_out(&gcdev->events, &event, 1);
 		spin_unlock(&gcdev->wait.lock);
 		if (ret != 1) {
@@ -1005,9 +1849,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 			/* We should never get here. See lineevent_read(). */
 		}
 
-		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+#ifdef CONFIG_GPIO_CDEV_V1
+		if (atomic_read(&gcdev->watch_abi_version) == 2) {
+			if (copy_to_user(buf + bytes_read, &event, event_size))
+				return -EFAULT;
+		} else {
+			struct gpioline_info_changed event_v1;
+
+			gpioline_info_changed_v2_to_v1(&event, &event_v1);
+			if (copy_to_user(buf + bytes_read, &event_v1,
+					 event_size))
+				return -EFAULT;
+		}
+#else
+		if (copy_to_user(buf + bytes_read, &event, event_size))
 			return -EFAULT;
-		bytes_read += sizeof(event);
+#endif
+		bytes_read += event_size;
 	} while (count >= bytes_read + sizeof(event));
 
 	return bytes_read;
@@ -1121,4 +1979,22 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
+
+	/*
+	 * array sizes must be a multiple of 8 to ensure 64bit alignment and
+	 * to not create holes in the struct packing.
+	 */
+	BUILD_BUG_ON(GPIOLINES_MAX % 8);
+	BUILD_BUG_ON(GPIO_MAX_NAME_SIZE % 8);
+
+	/*
+	 * check that uAPI structs are 64bit aligned for 32/64bit
+	 * compatibility
+	 */
+	BUILD_BUG_ON(sizeof(struct gpioline_config) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_request) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_info_v2) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_info_changed_v2) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_event) % 8);
+	BUILD_BUG_ON(sizeof(struct gpioline_values) % 8);
 }
-- 
2.27.0

