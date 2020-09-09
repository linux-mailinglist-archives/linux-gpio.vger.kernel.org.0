Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE02262D38
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbgIIKcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729305AbgIIK2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:12 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA7EC061757;
        Wed,  9 Sep 2020 03:28:09 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so1736629pgm.11;
        Wed, 09 Sep 2020 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9QPQ0NbPfR0E81Gh4mLRXLlfBu/ETUibyXx0GBFJws=;
        b=QVvOUg9l3mJ7Q/I8FLgWRCvcCx/6mruA674EFBMZwB9G5jmXSLrI7a4iUqTPB5E232
         iyQd7uTfP68zqoB1bTyyYFNiyclzg22EfVLWivQHbrSUyxaYvrybv4mrSS1kJbhpFciD
         oox2W7lG2gP442Cow4KSHmSiDootBfdvtcv67epBv2eS/2bPZ0RJPTxtfqj1T1/r7/fZ
         ZDNXceFkVOgCYAff4H4o043a9zqA9K5Vm4OYNbsy49ylPyuaw9FMGktbEHFLWCU+nxkl
         phhseIrzlZ46jkwMyr1aIqurB7RP4WOI6foMKjGJBUV8CmQDlVek3/IAqVE4OsUDANCC
         lKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9QPQ0NbPfR0E81Gh4mLRXLlfBu/ETUibyXx0GBFJws=;
        b=CJiV597+bHRH11E8shQX9XPBeGzc9hhB63J+mOJZV7DQCqOg7OjSmCaN0oEKya9bOL
         JKrCgTJUGiGy/qUyNqxojwVIQLi3VcBOOlyGOVozZvqA5R+mRCVzeVRB/aQSAowa0Jl6
         tLUTX1ZC+ExRDijQT858Gwlyaor8bh9HLlFIYXf+IkMyXT/EewDSOFNRyOiqVGWmlMgN
         /PsLBw9H1tTGQfbTPL4NSJX5x/WrBEAn1LV5mH8a6STja2+ox9cB9btTRHQq+TyVS1+9
         LDLF1gKBzu+gjdEf7Dt3OJw157/UryF9qL+auI28nCVgrx3C2nkv7Ebw7jgUxQ4m3bQw
         LCgQ==
X-Gm-Message-State: AOAM533VNo/WiB195fjNiV8hgsOz9zOz0Uo0Fg9asAlHULf4aTNBZOzF
        PXFBU5KmIepjjIhPaTUHBJi1mmLEVhA=
X-Google-Smtp-Source: ABdhPJymOkRLqH09diruDZUmvmy4sLo7YAonY3qJEtD579SJDdB/3SUlcCNHYV8/xe48b7vgc+P7lQ==
X-Received: by 2002:a17:902:b686:: with SMTP id c6mr188452pls.74.1599647288757;
        Wed, 09 Sep 2020 03:28:08 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 09/20] gpiolib: cdev: support edge detection for uAPI v2
Date:   Wed,  9 Sep 2020 18:26:29 +0800
Message-Id: <20200909102640.1657622-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 262 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |   2 +
 drivers/gpio/gpiolib.h      |   2 +
 3 files changed, 266 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index a0aa1ff1124a..7161c8921298 100644
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
@@ -395,12 +418,22 @@ struct line {
  * @gdev: the GPIO device the line request pertains to
  * @label: consumer label used to tag GPIO descriptors
  * @num_lines: the number of lines in the lines array
+ * @wait: wait queue that handles blocking reads of events
+ * @event_buffer_size: the number of elements allocated in @events
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
+	u32 event_buffer_size;
+	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
+	atomic_t seqno;
 	struct line lines[];
 };
 
@@ -417,12 +450,138 @@ struct linereq {
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
+static void edge_detector_stop(struct line *line)
+{
+	if (line->irq) {
+		free_irq(line->irq, line);
+		line->irq = 0;
+	}
+}
+
+static int edge_detector_setup(struct line *line,
+			       u64 eflags)
+{
+	unsigned long irqflags = 0;
+	int irq, ret;
+
+	if (eflags && !kfifo_initialized(&line->req->events)) {
+		ret = kfifo_alloc(&line->req->events,
+				  line->req->event_buffer_size, GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+	line->eflags = eflags;
+
+	if (!eflags)
+		return 0;
+
+	irq = gpiod_to_irq(line->desc);
+	if (irq <= 0)
+		return -ENODEV;
+
+	if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+	if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
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
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
 				     unsigned int line_idx)
 {
@@ -465,6 +624,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
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
@@ -526,6 +690,10 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
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
@@ -614,14 +782,85 @@ static long linereq_ioctl_compat(struct file *file, unsigned int cmd,
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
@@ -637,6 +876,8 @@ static int linereq_release(struct inode *inode, struct file *file)
 
 static const struct file_operations line_fileops = {
 	.release = linereq_release,
+	.read = linereq_read,
+	.poll = linereq_poll,
 	.owner = THIS_MODULE,
 	.llseek = noop_llseek,
 	.unlocked_ioctl = linereq_ioctl,
@@ -676,6 +917,9 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	lr->gdev = gdev;
 	get_device(&gdev->dev);
 
+	for (i = 0; i < ulr.num_lines; i++)
+		lr->lines[i].req = lr;
+
 	/* Make sure this is terminated */
 	ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
 	if (strlen(ulr.consumer)) {
@@ -686,6 +930,14 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	init_waitqueue_head(&lr->wait);
+	lr->event_buffer_size = ulr.event_buffer_size;
+	if (lr->event_buffer_size == 0)
+		lr->event_buffer_size = ulr.num_lines*16;
+	else if (lr->event_buffer_size > GPIO_V2_LINES_MAX*16)
+		lr->event_buffer_size = GPIO_V2_LINES_MAX*16;
+
+	atomic_set(&lr->seqno, 0);
 	lr->num_lines = ulr.num_lines;
 
 	/* Request each GPIO */
@@ -724,6 +976,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				goto out_free_linereq;
+
+			ret = edge_detector_setup(&lr->lines[i],
+					flags & GPIO_V2_LINE_EDGE_FLAGS);
+			if (ret)
+				goto out_free_linereq;
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1245,6 +1502,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_PULL_UP, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 
+	if (test_bit(FLAG_EDGE_RISING, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
+	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
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

