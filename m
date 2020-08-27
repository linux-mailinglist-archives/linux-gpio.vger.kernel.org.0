Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDC9254711
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgH0OhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgH0ODq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:03:46 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF553C0619C1;
        Thu, 27 Aug 2020 07:02:37 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so3572383pfb.6;
        Thu, 27 Aug 2020 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33e65RQh/g7MpsFkYIyi4LfKsB7iOe3zuOOtjfBxTO4=;
        b=ZJwyCBf0qNfVftmiIuBbGJBJnsPjI3e7VOJJYIjICDSDtQvgOfV97JLGWlpnvabP+D
         3hE+RrmTl79QLesKAwB4Al+epTx63dHCYMexR9T9QP17lvGaPYXEi55j29D3TKUtBdlk
         HK1/lh2A0/aMzYlLGdK9c4mqb8c9XF+ok4VcqjQ5F3H82XREY3X9OGMlciVwNC4dQxph
         yWsAQoWxTQ5HMDXJBeaWwmYME/uUJOgsdArn3wMJch17IQ5fb/CX6nFDwh7JVabYAOl5
         JnnTFh0BE4yMfmIZ+isO2U0dU2/ovBJkbMV4LncZ5Khbx/nxDWlwbB2OHr//jvaBHyid
         0EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33e65RQh/g7MpsFkYIyi4LfKsB7iOe3zuOOtjfBxTO4=;
        b=MGZ9tr0cDPh8n2xmWf7drDEQwqrAmBRcL4GCdadl1AY5LhGtHgdneJrBWOi4Si6vq8
         4LeoeFvN4Z7XLJzOE0ImpaI2ngyzXF9DO6zyFaI52oa5ySVfDwyni/T2/pVGODMwi/+T
         noAccm10wP9Oy1LgJtjavpfm2q9kQJHG6osNuScep7Ww0nZ1v934G4QJy2OZbhcsEpWE
         rjHlhVkCyq2C0v8PoGPtHN+sXF/stfng8cCT6K4h7GfJwh08VOep87U6dbpHd40Mpqn8
         eWbOr0TUbCl88177CyYBhh7Wybt7EMw2CwTD9YNNFmhadKVHBUR9SwXZYKK+rhwLOzzr
         LWJA==
X-Gm-Message-State: AOAM53251xHpmHq4saVdCvG0FHnX0kuYAJKQEv/TnqR2HX+zdwkGeSdI
        Mx3ZyjoZwxHzOaymeRnMU9CZ47poS+E=
X-Google-Smtp-Source: ABdhPJx13ot72nhYAd2dY2kinYj2nEwut5nZHwc/Fvdd+Z8pJTHZQlRQDB3a2WwIJS/TtOGAYA9sQA==
X-Received: by 2002:a65:6412:: with SMTP id a18mr14888332pgv.215.1598536956698;
        Thu, 27 Aug 2020 07:02:36 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:02:35 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 09/20] gpiolib: cdev: support edge detection for uAPI v2
Date:   Thu, 27 Aug 2020 22:00:09 +0800
Message-Id: <20200827140020.159627-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for edge detection to lines requested using
GPIO_V2_GET_LINE_IOCTL.

The edge_detector implementation is based on the v1 lineevent
implementation.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 290 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.c      |   2 +
 drivers/gpio/gpiolib.h      |   2 +
 3 files changed, 293 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 281255e05323..05b15f20fe2c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -385,9 +385,32 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 /**
  * struct line - contains the state of a requested line
  * @desc: the GPIO descriptor for this line.
+ * @req: the corresponding line request
+ * @irq: the interrupt triggered in response to events on this GPIO
+ * @eflags: the edge flags, GPIO_V2_LINE_FLAG_EDGE_RISING and/or
+ * GPIO_V2_LINE_FLAG_EDGE_FALLING, indicating the edge detection applied
+ * @timestamp: cache for the timestamp storing it between hardirq and IRQ
+ * thread, used to bring the timestamp close to the actual event
+ * @req_seqno: the seqno for the current edge event in the sequence of
+ * events for the corresponding line request. This is drawn from the @req.
+ * @line_seqno: the seqno for the current edge event in the sequence of
+ * events for this line.
  */
 struct line {
 	struct gpio_desc *desc;
+	/*
+	 * -- edge detector specific fields --
+	 */
+	struct linereq *req;
+	unsigned int irq;
+	u64 eflags;
+	/*
+	 * timestamp and req_seqno are shared by edge_irq_handler() and
+	 * edge_irq_thread() which are themselves mutually exclusive.
+	 */
+	u64 timestamp;
+	u32 req_seqno;
+	u32 line_seqno;
 };
 
 /**
@@ -395,15 +418,143 @@ struct line {
  * @gdev: the GPIO device the line request pertains to
  * @label: consumer label used to tag GPIO descriptors
  * @num_lines: the number of lines in the lines array
+ * @wait: wait queue that handles blocking reads of events
+ * @events: KFIFO for the GPIO events
+ * @seqno: the sequence number for edge events generated on all lines in
+ * this line request.  Note that this is not used when @num_lines is 1, as
+ * the line_seqno is then the same and is cheaper to calculate.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
 	struct gpio_device *gdev;
 	const char *label;
 	u32 num_lines;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
+	atomic_t seqno;
 	struct line lines[];
 };
 
+static irqreturn_t edge_irq_thread(int irq, void *p)
+{
+	struct line *line = p;
+	struct linereq *lr = line->req;
+	struct gpio_v2_line_event le;
+	int ret;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&le, 0, sizeof(le));
+
+	/*
+	 * We may be running from a nested threaded interrupt in which case
+	 * we didn't get the timestamp from edge_irq_handler().
+	 */
+	if (!line->timestamp) {
+		le.timestamp = ktime_get_ns();
+		if (lr->num_lines != 1)
+			line->req_seqno = atomic_inc_return(&lr->seqno);
+	} else {
+		le.timestamp = line->timestamp;
+	}
+	line->timestamp = 0;
+
+	if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
+			     GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
+		int level = gpiod_get_value_cansleep(line->desc);
+
+		if (level)
+			/* Emit low-to-high event */
+			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+		else
+			/* Emit high-to-low event */
+			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+	} else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
+		/* Emit low-to-high event */
+		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+	} else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
+		/* Emit high-to-low event */
+		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+	} else {
+		return IRQ_NONE;
+	}
+	line->line_seqno++;
+	le.line_seqno = line->line_seqno;
+	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
+	le.offset = gpio_chip_hwgpio(line->desc);
+
+	ret = kfifo_in_spinlocked_noirqsave(&lr->events, &le,
+					    1, &lr->wait.lock);
+	if (ret)
+		wake_up_poll(&lr->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t edge_irq_handler(int irq, void *p)
+{
+	struct line *line = p;
+	struct linereq *lr = line->req;
+
+	/*
+	 * Just store the timestamp in hardirq context so we get it as
+	 * close in time as possible to the actual event.
+	 */
+	line->timestamp = ktime_get_ns();
+
+	if (lr->num_lines != 1)
+		line->req_seqno = atomic_inc_return(&lr->seqno);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int edge_detector_start(struct line *line)
+{
+	unsigned long irqflags = 0;
+	int irq, ret;
+
+	irq = gpiod_to_irq(line->desc);
+	if (irq <= 0)
+		return -ENODEV;
+
+	line->req_seqno = 0;
+	line->line_seqno = 0;
+
+	if (line->eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+	if (line->eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+	irqflags |= IRQF_ONESHOT;
+
+	/* Request a thread to read the events */
+	ret = request_threaded_irq(irq, edge_irq_handler, edge_irq_thread,
+				   irqflags, line->req->label, line);
+	if (ret)
+		return ret;
+
+	line->irq = irq;
+	return 0;
+}
+
+static void edge_detector_stop(struct line *line)
+{
+	if (line->irq) {
+		free_irq(line->irq, line);
+		line->irq = 0;
+	}
+}
+
+static int edge_detector_setup(struct line *line,
+			       struct gpio_v2_line_config *lc)
+{
+	if (line->eflags)
+		return edge_detector_start(line);
+	return 0;
+}
+
 #define GPIO_V2_LINE_BIAS_FLAGS \
 	(GPIO_V2_LINE_FLAG_BIAS_PULL_UP | \
 	 GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN | \
@@ -417,10 +568,15 @@ struct linereq {
 	(GPIO_V2_LINE_FLAG_OPEN_DRAIN | \
 	 GPIO_V2_LINE_FLAG_OPEN_SOURCE)
 
+#define GPIO_V2_LINE_EDGE_FLAGS \
+	(GPIO_V2_LINE_FLAG_EDGE_RISING | \
+	 GPIO_V2_LINE_FLAG_EDGE_FALLING)
+
 #define GPIO_V2_LINE_VALID_FLAGS \
 	(GPIO_V2_LINE_FLAG_ACTIVE_LOW | \
 	 GPIO_V2_LINE_DIRECTION_FLAGS | \
 	 GPIO_V2_LINE_DRIVE_FLAGS | \
+	 GPIO_V2_LINE_EDGE_FLAGS | \
 	 GPIO_V2_LINE_BIAS_FLAGS)
 
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
@@ -437,6 +593,21 @@ static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
 	return lc->flags;
 }
 
+static bool gpio_v2_line_config_has_edge_detection(struct gpio_v2_line_config *lc)
+{
+	unsigned int i;
+
+	if (lc->flags & GPIO_V2_LINE_EDGE_FLAGS)
+		return true;
+
+	for (i = 0; i < lc->num_attrs; i--) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_FLAGS) &&
+		    (lc->attrs[i].attr.flags & GPIO_V2_LINE_EDGE_FLAGS))
+			return true;
+	}
+	return false;
+}
+
 static int gpio_v2_line_config_output_value(struct gpio_v2_line_config *lc,
 					    unsigned int line_idx)
 {
@@ -465,6 +636,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
 	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
 		return -EINVAL;
 
+	/* Edge detection requires explicit input. */
+	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
+	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
+		return -EINVAL;
+
 	/*
 	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
 	 * the hardware actually supports enabling both at the same time the
@@ -526,6 +702,10 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 		set_bit(FLAG_IS_OUT, flagsp);
 	else if (flags & GPIO_V2_LINE_FLAG_INPUT)
 		clear_bit(FLAG_IS_OUT, flagsp);
+	assign_bit(FLAG_EDGE_RISING, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_EDGE_RISING);
+	assign_bit(FLAG_EDGE_FALLING, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
 	assign_bit(FLAG_OPEN_DRAIN, flagsp,
 		   flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
 	assign_bit(FLAG_OPEN_SOURCE, flagsp,
@@ -612,14 +792,85 @@ static long linereq_ioctl_compat(struct file *file, unsigned int cmd,
 }
 #endif
 
+static __poll_t linereq_poll(struct file *file,
+			    struct poll_table_struct *wait)
+{
+	struct linereq *lr = file->private_data;
+	__poll_t events = 0;
+
+	poll_wait(file, &lr->wait, wait);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&lr->events,
+						 &lr->wait.lock))
+		events = EPOLLIN | EPOLLRDNORM;
+
+	return events;
+}
+
+static ssize_t linereq_read(struct file *file,
+			    char __user *buf,
+			    size_t count,
+			    loff_t *f_ps)
+{
+	struct linereq *lr = file->private_data;
+	struct gpio_v2_line_event le;
+	ssize_t bytes_read = 0;
+	int ret;
+
+	if (count < sizeof(le))
+		return -EINVAL;
+
+	do {
+		spin_lock(&lr->wait.lock);
+		if (kfifo_is_empty(&lr->events)) {
+			if (bytes_read) {
+				spin_unlock(&lr->wait.lock);
+				return bytes_read;
+			}
+
+			if (file->f_flags & O_NONBLOCK) {
+				spin_unlock(&lr->wait.lock);
+				return -EAGAIN;
+			}
+
+			ret = wait_event_interruptible_locked(lr->wait,
+					!kfifo_is_empty(&lr->events));
+			if (ret) {
+				spin_unlock(&lr->wait.lock);
+				return ret;
+			}
+		}
+
+		ret = kfifo_out(&lr->events, &le, 1);
+		spin_unlock(&lr->wait.lock);
+		if (ret != 1) {
+			/*
+			 * This should never happen - we were holding the
+			 * lock from the moment we learned the fifo is no
+			 * longer empty until now.
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
 static void linereq_free(struct linereq *lr)
 {
 	unsigned int i;
 
 	for (i = 0; i < lr->num_lines; i++) {
+		edge_detector_stop(&lr->lines[i]);
 		if (lr->lines[i].desc)
 			gpiod_free(lr->lines[i].desc);
 	}
+	kfifo_free(&lr->events);
 	kfree(lr->label);
 	put_device(&lr->gdev->dev);
 	kfree(lr);
@@ -635,6 +886,8 @@ static int linereq_release(struct inode *inode, struct file *file)
 
 static const struct file_operations line_fileops = {
 	.release = linereq_release,
+	.read = linereq_read,
+	.poll = linereq_poll,
 	.owner = THIS_MODULE,
 	.llseek = noop_llseek,
 	.unlocked_ioctl = linereq_ioctl,
@@ -650,7 +903,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	struct linereq *lr;
 	struct file *file;
 	unsigned long flags;
-	unsigned int i;
+	unsigned int i, size;
+	bool has_edge_detection;
 	int fd, ret;
 
 	if (copy_from_user(&ulr, ip, sizeof(ulr)))
@@ -667,6 +921,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		return ret;
 
+	/* event_buffer_size is only valid with edge detection */
+	has_edge_detection = gpio_v2_line_config_has_edge_detection(lc);
+	if (ulr.event_buffer_size && !has_edge_detection)
+		return -EINVAL;
+
 	lr = kzalloc(struct_size(lr, lines, ulr.num_lines), GFP_KERNEL);
 	if (!lr)
 		return -ENOMEM;
@@ -674,6 +933,9 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	lr->gdev = gdev;
 	get_device(&gdev->dev);
 
+	for (i = 0; i < ulr.num_lines; i++)
+		lr->lines[i].req = lr;
+
 	/* Make sure this is terminated */
 	ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
 	if (strlen(ulr.consumer)) {
@@ -684,6 +946,21 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	init_waitqueue_head(&lr->wait);
+	if (has_edge_detection) {
+		size = ulr.event_buffer_size;
+
+		if (size > GPIO_V2_LINES_MAX*16)
+			size = GPIO_V2_LINES_MAX*16;
+		else if (size == 0)
+			size = ulr.num_lines*16;
+
+		ret = kfifo_alloc(&lr->events, size, GFP_KERNEL);
+		if (ret)
+			goto out_free_linereq;
+	}
+
+	atomic_set(&lr->seqno, 0);
 	lr->num_lines = ulr.num_lines;
 
 	/* Request each GPIO */
@@ -722,6 +999,10 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				goto out_free_linereq;
+			lr->lines[i].eflags = flags & GPIO_V2_LINE_EDGE_FLAGS;
+			ret = edge_detector_setup(&lr->lines[i], lc);
+			if (ret)
+				goto out_free_linereq;
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1243,6 +1524,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_PULL_UP, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 
+	if (test_bit(FLAG_EDGE_RISING, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
+	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
+
+	info->num_attrs = 0;
+
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 80137c1b3cdc..e4c81dca7f8b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2041,6 +2041,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_PULL_UP, &desc->flags);
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
 		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
+		clear_bit(FLAG_EDGE_RISING, &desc->flags);
+		clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 #ifdef CONFIG_OF_DYNAMIC
 		desc->hog = NULL;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 6709f79c02dd..39b356160937 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -114,6 +114,8 @@ struct gpio_desc {
 #define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
 #define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
 #define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
+#define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
+#define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
 
 	/* Connection label */
 	const char		*label;
-- 
2.28.0

