Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6662443C0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHNDEd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDEd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:04:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D53C061757;
        Thu, 13 Aug 2020 20:04:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l60so3738552pjb.3;
        Thu, 13 Aug 2020 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0lkfS04wTAwxyVJLfeLESo1LkiYHB4fDEphiDr+5RhA=;
        b=JjDF9AHtPCUeHy/MpXfn2BrnRe9sBW8jLMeTeCGk83fY69GOzxDG595nqD+EJVWJJD
         g1n8PMjz44Jlq4F/KnezKng2hkr5bcu1n/dtvz0VB+Ld0Z+gH5hxkK3A6mmTC6xI/LJc
         m/G+LNHbpwz0qCZBudtSNviicSJ0BZyi/M+zFbtp+QGkKx7gMm+XnuZxrMvEv4tvPUox
         dbFlD9vdXzCrJwzGtETN/3IsWG6dd6BW40FuGITpFepmBv1MOxeCjCW1ARFKdb82dirf
         FidJtxqawgUnmE2SytbmFFf3aRf/mNlUC45dcmlcg1MmC7PLfcBRQ+2vojzUjdEOAwj0
         PkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0lkfS04wTAwxyVJLfeLESo1LkiYHB4fDEphiDr+5RhA=;
        b=fvI4NiL+kmbSMxX50dflbc1y021Iyvo52Ast91cbF19VaJ58LusT+3tmc2eFHCVHI8
         pH5KFWXwJ0wlEWSmyoHjxAcBXheOoNAUlwptPFElgmBYMceaLiJEkMThTP+vN9R1PLKJ
         NAFlpX4tbU0db/RXf2/mft5y54Vz1sCjozrDpbWPpnBKY7K8bfoPrGRMBZlMaDoGxNKi
         JYnNN08yoOt37sqkFTl8TNt41TcoG1jBfDsLWWeqsFpdEeUpefVFK3sx3q9DvcCFq9qQ
         KP4erHR3N78Fb9bbogxbXmt0Gczbl+EFuiuYwjPGDp+pH/daVtwdJECWFfAynZCASPbC
         66tA==
X-Gm-Message-State: AOAM532512zBxYTK3iUfywn2VnOx7nmoCiyYwd2KEQsdz8R81ec9sadC
        I189mRwp6xiszc2yr0C1OhEHZjNF
X-Google-Smtp-Source: ABdhPJz2+r1X8/zMt+exRGfHXw49smtJhkqiJv1jFmVz9UF1U4eQarZW3y7ygLnzN87QUNV7gikf3g==
X-Received: by 2002:a17:902:6f01:: with SMTP id w1mr602779plk.49.1597374271872;
        Thu, 13 Aug 2020 20:04:31 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:04:31 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 09/20] gpiolib: cdev: support edge detection for uAPI v2
Date:   Fri, 14 Aug 2020 11:02:46 +0800
Message-Id: <20200814030257.135463-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for edge detection to lines requested using
GPIO_V2_GET_LINE_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The edge_detector implementation is based on the v1 lineevent implementation.

 drivers/gpio/gpiolib-cdev.c | 316 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.c      |   2 +
 drivers/gpio/gpiolib.h      |   2 +
 3 files changed, 319 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 28273f3105d3..1d42a01f5414 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -382,11 +382,43 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 }
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
+/**
+ * struct edge_detector - contains the state of a line edge detector
+ * @line: the corresponding line request
+ * @irq: the interrupt triggered in response to events on this GPIO
+ * @flags: the flags, GPIO_V2_LINE_FLAG_EDGE_RISING and/or
+ * GPIO_V2_LINE_FLAG_EDGE_FALLING, indicating the edge detection applied
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
+	u64 flags;
+	/*
+	 * timestamp and seqno are shared by edge_irq_handler() and
+	 * edge_irq_thread() which are themselves mutually exclusive.
+	 */
+	u64 timestamp;
+	u32 seqno;
+	u32 line_seqno;
+};
+
 /**
  * struct line - contains the state of a userspace line request
  * @gdev: the GPIO device the line request pertains to
  * @label: consumer label used to tag descriptors
  * @num_descs: the number of descriptors held in the descs array
+ * @wait: wait queue that handles blocking reads of events
+ * @events: KFIFO for the GPIO events
+ * @seqno: the sequence number for edge events generated on all lines in
+ * this line request.  Note that this is not used when @num_descs is 1, as
+ * the line_seqno is then the same and is cheaper to calculate.
+ * @edets: an array of edge detectors, of size @num_descs
  * @descs: the GPIO descriptors held by this line request, with @num_descs
  * elements.
  */
@@ -394,9 +426,146 @@ struct line {
 	struct gpio_device *gdev;
 	const char *label;
 	u32 num_descs;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
+	atomic_t seqno;
+	struct edge_detector *edets;
 	struct gpio_desc *descs[];
 };
 
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
+	if (!edet->timestamp) {
+		le.timestamp = ktime_get_ns();
+		if (line->num_descs != 1)
+			edet->seqno = atomic_inc_return(&line->seqno);
+	} else {
+		le.timestamp = edet->timestamp;
+	}
+	edet->timestamp = 0;
+
+	if (edet->flags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
+			    GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
+		int level = gpiod_get_value_cansleep(desc);
+
+		if (level)
+			/* Emit low-to-high event */
+			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+		else
+			/* Emit high-to-low event */
+			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+	} else if (edet->flags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
+		/* Emit low-to-high event */
+		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+	} else if (edet->flags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
+		/* Emit high-to-low event */
+		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
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
+	if (edet->flags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+	if (edet->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
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
+			       struct gpio_v2_line_config *lc)
+{
+	if (edet->flags)
+		return edge_detector_start(edet);
+	return 0;
+}
+
 #define GPIO_V2_LINE_BIAS_FLAGS \
 	(GPIO_V2_LINE_FLAG_BIAS_PULL_UP | \
 	 GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN | \
@@ -410,10 +579,15 @@ struct line {
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
@@ -430,6 +604,21 @@ static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
 	return lc->flags;
 }
 
+static int gpio_v2_line_config_has_edge_detection(struct gpio_v2_line_config *lc)
+{
+	int i;
+
+	if (lc->flags & GPIO_V2_LINE_EDGE_FLAGS)
+		return 1;
+
+	for (i = 0; i < lc->num_attrs; i--) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_FLAGS) &&
+		    (lc->attrs[i].attr.flags & GPIO_V2_LINE_EDGE_FLAGS))
+			return 1;
+	}
+	return 0;
+}
+
 static int gpio_v2_line_config_output_value(struct gpio_v2_line_config *lc,
 					    int line_idx)
 {
@@ -458,6 +647,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
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
@@ -518,6 +712,10 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
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
@@ -605,14 +803,87 @@ static long line_ioctl_compat(struct file *file, unsigned int cmd,
 }
 #endif
 
+static __poll_t line_poll(struct file *file,
+			  struct poll_table_struct *wait)
+{
+	struct line *line = file->private_data;
+	__poll_t events = 0;
+
+	poll_wait(file, &line->wait, wait);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&line->events,
+						 &line->wait.lock))
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
+	struct gpio_v2_line_event le;
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
 static void line_free(struct line *line)
 {
 	int i;
 
 	for (i = 0; i < line->num_descs; i++) {
+		if (line->edets)
+			edge_detector_stop(&line->edets[i]);
 		if (line->descs[i])
 			gpiod_free(line->descs[i]);
 	}
+	kfifo_free(&line->events);
+	kfree(line->edets);
 	kfree(line->label);
 	put_device(&line->gdev->dev);
 	kfree(line);
@@ -628,6 +899,8 @@ static int line_release(struct inode *inode, struct file *file)
 
 static const struct file_operations line_fileops = {
 	.release = line_release,
+	.read = line_read,
+	.poll = line_poll,
 	.owner = THIS_MODULE,
 	.llseek = noop_llseek,
 	.unlocked_ioctl = line_ioctl,
@@ -641,7 +914,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 	struct gpio_v2_line_request lr;
 	struct line *line;
 	struct file *file;
-	int fd, i, ret;
+	int fd, i, ret, size, has_edge_detection;
 	struct gpio_v2_line_config *lc;
 	unsigned long flags;
 
@@ -658,6 +931,11 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		return ret;
 
+	/* event_buffer_size only valid with edge detection */
+	has_edge_detection = gpio_v2_line_config_has_edge_detection(lc);
+	if (lr.event_buffer_size && !has_edge_detection)
+		return -EINVAL;
+
 	line = kzalloc(struct_size(line, descs, lr.num_lines),
 		       GFP_KERNEL);
 	if (!line)
@@ -666,6 +944,16 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 	line->gdev = gdev;
 	get_device(&gdev->dev);
 
+	line->edets = kcalloc(lr.num_lines, sizeof(*line->edets),
+			      GFP_KERNEL);
+	if (!line->edets) {
+		ret = -ENOMEM;
+		goto out_free_line;
+	}
+
+	for (i = 0; i < lr.num_lines; i++)
+		line->edets[i].line = line;
+
 	/* Make sure this is terminated */
 	lr.consumer[sizeof(lr.consumer)-1] = '\0';
 	if (strlen(lr.consumer)) {
@@ -676,6 +964,21 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	init_waitqueue_head(&line->wait);
+	if (has_edge_detection) {
+		size = lr.event_buffer_size;
+
+		if (size > GPIO_V2_LINES_MAX*16)
+			size = GPIO_V2_LINES_MAX*16;
+		else if (size == 0)
+			size = lr.num_lines*16;
+
+		ret = kfifo_alloc(&line->events, size, GFP_KERNEL);
+		if (ret)
+			goto out_free_line;
+	}
+
+	atomic_set(&line->seqno, 0);
 	line->num_descs = lr.num_lines;
 
 	/* Request each GPIO */
@@ -714,6 +1017,10 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				goto out_free_line;
+			line->edets[i].flags = flags & GPIO_V2_LINE_EDGE_FLAGS;
+			ret = edge_detector_setup(&line->edets[i], lc);
+			if (ret)
+				goto out_free_line;
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1237,6 +1544,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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

