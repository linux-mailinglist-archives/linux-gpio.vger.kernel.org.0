Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDC420485A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732402AbgFWEDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732284AbgFWEDU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED24C061573;
        Mon, 22 Jun 2020 21:03:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u14so909724pjj.2;
        Mon, 22 Jun 2020 21:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fYd2xDtZ/gT4nGQ+DH72waIo+BDMGiUqgjNK04Ollrc=;
        b=VkLy13ZN5KCoSgqz+wCZ40imjpv4DgE7vh9qJkSQ10VFPKln0gbsyTFg9SPvrYWr8R
         Ie4vbfxSDyxH2+0nimG3MC41uAoAyYGaxwpJJw+i1BITorQ54cHtjNB0LO1LC4igk8qu
         oE4UMtGJIFtYLwxVamb3RRZ6lFobYKreT55dpJLMg02rUcw0JOsGEUy8uJF6nLu1Cs7f
         UaLN5PA69QcZbVggpkSbEWyEdkieMELIYJdvcV1gTTntq2y2eN7A9NAeQ/8n5yyvkGjs
         Dx8615eMDTIx0OiB9I+kToRTU8DNJTh530tundjKDNq2vCHyyExIt41cJfkJTKtinO3+
         Ll1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fYd2xDtZ/gT4nGQ+DH72waIo+BDMGiUqgjNK04Ollrc=;
        b=ME2yqPa+4ELowXWdjWCWevaWZ7pBd2EUBVake9Mp0hyyNuqt5j01R12Axmjd7My8JA
         xmEE2Fvvvdto5NB7BxUiRGwayxz5cdCrTniVTq6zmXj3dJxKy8Ra4GnAtv/c7blmihL+
         2mEFIBbBUkT5JiLLoy8cG8VXbfHikUHStZxt9f3pTfzumhgTFGK0K8w/QUUTQHbhV+yT
         vwGWDXcr5lZ5dYjHVg1df3BYx0nBoOpweo2AsyxfdJmfGunz/iczXNreh5cr++CdW8Zk
         09ruydv01ZleZMMt4/4VDsI6U/yC188zfx+Rju1TOj96i1CrT8Gen+bFhlqhQufI1Shj
         EPug==
X-Gm-Message-State: AOAM533QoEc6gdm/Bwid8ym1U/y5HatPNhvcTya9lc7G2w3y/UPgbfLR
        h2V8YyL9RI1dhaLlxZaszFxJ7gD4Pqc=
X-Google-Smtp-Source: ABdhPJwino7TIgvkhsCvizFenLg+ibt1OpX4kaCGwm2m5v9xLjXkMkWAIOmygzbh2MkyKoF0cxW8bg==
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr15361233plq.150.1592884998166;
        Mon, 22 Jun 2020 21:03:18 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:17 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 18/22] gpiolib: cdev: support setting debounce
Date:   Tue, 23 Jun 2020 12:01:03 +0800
Message-Id: <20200623040107.22270-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for setting debounce on a line via the GPIO uAPI.
Where debounce is not supported by hardware, a software debounce is
provided.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

The implementation of the software debouncer waits for the line to be
stable for the debounce period before determining if a level change,
and a corresponding edge event, has occurred.  This provides maximum
protection against glitches, but also introduces a debounce_period
latency to edge events.

The software debouncer is integrated with the edge detection as it
utilises the line interrupt, and integration is simpler than getting
the two to interwork.  Where software debounce AND edge detection is
required, the debouncer provides both.

Due to the tight integration between the debouncer and edge detection,
and to avoid particular corner cases, it is not allowed to alter the
debounce value if edge detection is enabled.  Shanging the debounce with
edge detection enabled is a very unlikely use case, so it is preferable
to disallow it rather than complicate the code to allow it.
Should the user wish to alter the debounce value in such cases they will
need to release and re-aquire the line.

 drivers/gpio/gpiolib-cdev.c | 212 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h      |   4 +
 2 files changed, 214 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 7ba0929b2741..81c2fc4f0e49 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -394,6 +394,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * for the corresponding line request. Ths is drawn from the @line.
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
+ * @sw_debounced: flag indicating if the software debouncer is active
+ * @work: the worker that implements software debouncing
+ * @level: the current debounced physical level of the line
  */
 struct edge_detector {
 	struct line *line;
@@ -404,7 +407,15 @@ struct edge_detector {
 	 */
 	u64 timestamp;
 	u32 seqno;
+	/*
+	 * line_seqno is used by either edge_irq_thread or debounce_work_func
+	 * which are themselves mutually exclusive.
+	 */
 	u32 line_seqno;
+	/* debouncer specific fields */
+	atomic_t sw_debounced;
+	struct delayed_work work;
+	atomic_t level;
 };
 
 /**
@@ -524,6 +535,10 @@ static int edge_detector_start(struct edge_detector *edet)
 	int ret, irq, irqflags = 0;
 	struct gpio_desc *desc;
 
+	if (atomic_read(&edet->sw_debounced))
+		/* debouncer is setup and will provide edge detection */
+		return 0;
+
 	desc = edge_detector_desc(edet);
 	irq = gpiod_to_irq(desc);
 
@@ -555,23 +570,192 @@ static int edge_detector_start(struct edge_detector *edet)
 	return 0;
 }
 
+/*
+ * returns the current debounced value, or -1 if the debouncer is inactive.
+ */
+static int debounced_value(struct edge_detector *edet)
+{
+	int value;
+
+	if (!atomic_read(&edet->sw_debounced))
+		return -1;
+
+	/*
+	 * minor race - debouncer may be stopped here, so edge_detector_stop
+	 * must leave the value unchanged so the following will read the level
+	 * from when the debouncer was last running.
+	 */
+	value = atomic_read(&edet->level);
+
+	if (test_bit(FLAG_ACTIVE_LOW, &edge_detector_desc(edet)->flags))
+		value = !value;
+
+	return value;
+}
+
+static irqreturn_t debounce_irq_handler(int irq, void *p)
+{
+	struct edge_detector *edet = p;
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
+	mod_delayed_work(system_wq,
+			 &edet->work,
+			 usecs_to_jiffies(atomic_read(&desc->debounce_period)));
+
+	return IRQ_HANDLED;
+}
+
+static void debounce_work_func(struct work_struct *work)
+{
+	struct gpioline_event le;
+	int ret, level, oldlevel;
+	struct edge_detector *edet =
+		container_of(work, struct edge_detector, work.work);
+	struct gpio_desc *desc = edge_detector_desc(edet);
+	struct line *line;
+
+	level = gpiod_get_raw_value_cansleep(desc);
+	if (level < 0) {
+		pr_debug_ratelimited("debouncer failed to read line value\n");
+		return;
+	}
+
+	oldlevel = atomic_xchg(&edet->level, level);
+	if (oldlevel == level)
+		return;
+
+	/* -- edge detection -- */
+	line = edet->line;
+	if (line->edge_detection == GPIOLINE_EDGE_NONE)
+		return;
+
+	/* switch from physical level to logical - if they differ */
+	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+		level = !level;
+
+	/* ignore edges that are not being monitored */
+	if (((line->edge_detection == GPIOLINE_EDGE_RISING) && (level == 0)) ||
+	    ((line->edge_detection == GPIOLINE_EDGE_FALLING) && (level == 1)))
+		return;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&le, 0, sizeof(le));
+
+	le.timestamp = ktime_get_ns();
+	le.offset = gpio_chip_hwgpio(desc);
+	edet->line_seqno++;
+	le.line_seqno = edet->line_seqno;
+	le.seqno = (line->num_descs == 1) ?
+		le.line_seqno : atomic_inc_return(&line->seqno);
+
+	if (level)
+		/* Emit low-to-high event */
+		le.id = GPIOLINE_EVENT_RISING_EDGE;
+	else
+		/* Emit high-to-low event */
+		le.id = GPIOLINE_EVENT_FALLING_EDGE;
+
+	ret = kfifo_in_spinlocked_noirqsave(&line->events, &le,
+					    1, &line->wait.lock);
+	if (ret)
+		wake_up_poll(&line->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
+}
+
+static int debounce_setup(struct edge_detector *edet,
+			  unsigned int debounce_period)
+{
+	int ret, level, irq, irqflags;
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
+	/* try hardware */
+	ret = gpiod_set_debounce(desc, debounce_period);
+	if (!ret) {
+		atomic_set(&desc->debounce_period, debounce_period);
+		return ret;
+	}
+	if (ret != -ENOTSUPP)
+		return ret;
+
+	if (debounce_period) {
+		/* setup software debounce */
+		level = gpiod_get_raw_value_cansleep(desc);
+		if (level < 0)
+			return level;
+
+		irq = gpiod_to_irq(desc);
+		if (irq <= 0)
+			return -ENODEV;
+
+		atomic_set(&edet->level, level);
+		edet->line_seqno = 0;
+		irqflags = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
+		ret = request_irq(irq,
+				  debounce_irq_handler,
+				  irqflags,
+				  edet->line->label,
+				  edet);
+		if (ret)
+			return ret;
+
+		atomic_set(&edet->sw_debounced, 1);
+		edet->irq = irq;
+	}
+	atomic_set(&desc->debounce_period, debounce_period);
+	return 0;
+}
+
 static void edge_detector_stop(struct edge_detector *edet)
 {
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
 	if (edet->irq) {
 		free_irq(edet->irq, edet);
 		edet->irq = 0;
 	}
+
+	cancel_delayed_work_sync(&edet->work);
+	atomic_set(&edet->sw_debounced, 0);
+	/* do not change edet->level - see comment in debounced_value */
+
+	if (desc)
+		atomic_set(&desc->debounce_period, 0);
+}
+
+static int debounce_update(struct edge_detector *edet,
+			   unsigned int debounce_period)
+{
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
+	if (atomic_read(&desc->debounce_period) == debounce_period)
+		return 0;
+
+	if (!atomic_read(&edet->sw_debounced))
+		return debounce_setup(edet, debounce_period);
+
+	if (!debounce_period)
+		edge_detector_stop(edet);
+	else
+		atomic_set(&desc->debounce_period, debounce_period);
+	return 0;
 }
 
 static int edge_detector_setup(struct edge_detector *edet,
 			       struct gpioline_config *lc)
 {
 	struct gpio_desc *desc = edge_detector_desc(edet);
+	int ret;
 
 	if (lc->edge_detection & GPIOLINE_EDGE_RISING)
 		set_bit(FLAG_EDGE_RISING, &desc->flags);
 	if (lc->edge_detection & GPIOLINE_EDGE_FALLING)
 		set_bit(FLAG_EDGE_FALLING, &desc->flags);
+	if (lc->flags & GPIOLINE_FLAG_V2_DEBOUNCE) {
+		ret = debounce_setup(edet, lc->debounce_period);
+		if (ret)
+			return ret;
+	}
 	if (lc->edge_detection)
 		return edge_detector_start(edet);
 	return 0;
@@ -703,6 +887,10 @@ static long line_set_config_locked(struct line *line,
 		if (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
 		    ((lc->flags & GPIOLINE_FLAG_V2_ACTIVE_LOW) != 0))
 			return -EINVAL;
+
+		/* disallow debounce changes */
+		if (atomic_read(&desc->debounce_period) != lc->debounce_period)
+			return -EINVAL;
 	}
 
 	vals = (unsigned long *)lc->values.bitmap;
@@ -718,6 +906,7 @@ static long line_set_config_locked(struct line *line,
 			if (lc->direction == GPIOLINE_DIRECTION_OUTPUT) {
 				int val = test_bit(i, vals);
 
+				edge_detector_stop(&line->edets[i]);
 				ret = gpiod_direction_output(desc, val);
 				if (ret)
 					return ret;
@@ -725,6 +914,12 @@ static long line_set_config_locked(struct line *line,
 				ret = gpiod_direction_input(desc);
 				if (ret)
 					return ret;
+				if (lc->flags & GPIOLINE_FLAG_V2_DEBOUNCE) {
+					ret = debounce_update(&line->edets[i],
+						lc->debounce_period);
+					if (ret)
+						return ret;
+				}
 			}
 		}
 
@@ -762,7 +957,7 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 	void __user *ip = (void __user *)arg;
 	struct gpioline_values glv;
 	unsigned long *vals = (unsigned long *)glv.bitmap;
-	int ret;
+	int ret, i, value;
 
 	if (cmd == GPIOLINE_GET_VALUES_IOCTL) {
 		/* NOTE: It's ok to read values of output lines. */
@@ -776,6 +971,12 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 		if (ret)
 			return ret;
 
+		for (i = 0; i < line->num_descs; i++) {
+			value = debounced_value(&line->edets[i]);
+			if (value >= 0)
+				assign_bit(i, vals, value);
+		}
+
 		if (copy_to_user(ip, &glv, sizeof(glv)))
 			return -EFAULT;
 
@@ -954,8 +1155,11 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 	if (!line->edets)
 		return -ENOMEM;
 
-	for (i = 0; i < linereq.num_lines; i++)
+	for (i = 0; i < linereq.num_lines; i++) {
 		line->edets[i].line = line;
+		atomic_set(&line->edets[i].sw_debounced, 0);
+		INIT_DELAYED_WORK(&line->edets[i].work, debounce_work_func);
+	}
 
 	line->gdev = gdev;
 	get_device(&gdev->dev);
@@ -1589,6 +1793,10 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		lc->edge_detection |= GPIOLINE_EDGE_FALLING;
 	}
 
+	lc->debounce_period = atomic_read(&desc->debounce_period);
+	if (lc->debounce_period)
+		lc->flags |= GPIOLINE_FLAG_V2_DEBOUNCE;
+
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 1dc6d2b191af..02a46af0c69f 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -124,6 +124,10 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+#ifdef CONFIG_GPIO_CDEV
+	/* debounce period in microseconds */
+	atomic_t		debounce_period;
+#endif
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
-- 
2.27.0

