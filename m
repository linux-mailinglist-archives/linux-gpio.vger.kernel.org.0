Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8933262D15
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgIIK2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbgIIK2Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65BAC061573;
        Wed,  9 Sep 2020 03:28:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j34so1751826pgi.7;
        Wed, 09 Sep 2020 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQ/pxWSH3DoONk30d+8cbo4S8Mhv82D5BPzYgdqdReE=;
        b=Mfzd/YmPzTMqC6C2PmKBvGLugF4Nrr5lLcXigjxu3RUKhNojsXfUTftcI26XHEYekm
         sIOnOuh3741WEAcHcbQFYiDYqwjsvxHImvcIoJk0BKTPOgORTAi7snEva2qmOj4n/fpq
         Y7fIjeTcD6BwBhiFiCyuc1c6NLgCfCMgtIajk2Oio3DXyILrp+gBBCWkzCUCDXoibBmR
         us0pfzDeMK1VeWYx37LM/KC1SC1Ey8cVROl4ceFvkEfCwld/gXSIlMJTpTTja0wyH6w/
         mlhHs3TS3ChSJQOsDpD909OrCsUY4rDd31HfGoW8dmrIWbV95XUrR57rFgwCP9x6PUPY
         Iz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQ/pxWSH3DoONk30d+8cbo4S8Mhv82D5BPzYgdqdReE=;
        b=G7obATQr7gRL74Nxm1SycBDEKoaNp57VZM/37Ma28oWGM4rGLG2tttv2ZO3T6JgKoF
         +hTr9BWgTwbqVj7tqu/kIBl4/o6egIaZ6xmTXfw/88ij51zd99hUIMDGyUy5Q1VoSJx8
         xE7dGw7HDMtrxzuVa/KLpQxu3NZsVf3kMo6UdhAereDySsF8dh9W9nNc+GHy1nnWtXi0
         VF8KWLlGgPQqcqwhBKYOy9Bk80YgfTxi+xdeUTEVPVdZJHqp/9kEP/qH2DouNDzfkoLV
         OSktLoJXv+zOQzEmSGGE80vrJRDujzbCj364hnd9sY8nSBJmYghTioBogTo1Fopp0PCV
         7hUA==
X-Gm-Message-State: AOAM532uryL8zRPMLUeS8nXKU18MBZeF9M6ldkueqJw/+VqKkaNju99A
        t7UBb0kNTdxh6wuN8mo88oQtvoUyFzY=
X-Google-Smtp-Source: ABdhPJwzeGIx7bVZlcvs4bOgz9oubV9D8bEnErcXqf4/Da0owg5Utp6s2jme/L8n6PScmimNgoP96w==
X-Received: by 2002:a63:4e4f:: with SMTP id o15mr134547pgl.202.1599647303794;
        Wed, 09 Sep 2020 03:28:23 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:23 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 12/20] gpiolib: cdev: support setting debounce
Date:   Wed,  9 Sep 2020 18:26:32 +0800
Message-Id: <20200909102640.1657622-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for setting debounce on a line via the GPIO uAPI.
Where debounce is not supported by hardware, a software debounce is
provided.

The implementation of the software debouncer waits for the line to be
stable for the debounce period before determining if a level change,
and a corresponding edge event, has occurred.  This provides maximum
protection against glitches, but also introduces a debounce_period
latency to edge events.

The software debouncer is integrated with the edge detection as it
utilises the line interrupt, and integration is simpler than getting
the two to interwork.  Where software debounce AND edge detection is
required, the debouncer provides both.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changes for v6:
 - as per cover letter

Changes for v5:
 - as per cover letter

Changes for v4:
 - fix handling of mask in line_get_values

Changes for v3:
 - only GPIO_V2 field renaming

Changes for v2:
 - improve documentation on fields shared by threads.
 - use READ_ONCE/WRITE_ONCE for shared fields rather than atomic_t
   which was overkill.

 drivers/gpio/gpiolib-cdev.c | 252 ++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.c      |   3 +
 drivers/gpio/gpiolib.h      |   4 +
 3 files changed, 248 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 12d5c6543c15..059d8e44c71b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -6,6 +6,7 @@
 #include <linux/build_bug.h>
 #include <linux/cdev.h>
 #include <linux/compat.h>
+#include <linux/compiler.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/file.h>
@@ -22,6 +23,7 @@
 #include <linux/spinlock.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
+#include <linux/workqueue.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
@@ -396,6 +398,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * events for the corresponding line request. This is drawn from the @req.
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
+ * @work: the worker that implements software debouncing
+ * @sw_debounced: flag indicating if the software debouncer is active
+ * @level: the current debounced physical level of the line
  */
 struct line {
 	struct gpio_desc *desc;
@@ -411,7 +416,27 @@ struct line {
 	 */
 	u64 timestamp;
 	u32 req_seqno;
+	/*
+	 * line_seqno is used by either edge_irq_thread() or
+	 * debounce_work_func() which are themselves mutually exclusive.
+	 */
 	u32 line_seqno;
+	/*
+	 * -- debouncer specific fields --
+	 */
+	struct delayed_work work;
+	/*
+	 * sw_debounce is shared by linereq_set_config(), which is the only
+	 * setter, and linereq_get_values(), which can live with a slightly
+	 * stale value.
+	 */
+	unsigned int sw_debounced;
+	/*
+	 * level is shared by debounce_work_func(), which is the only
+	 * setter, and linereq_get_values() which can live with a slightly
+	 * stale value.
+	 */
+	unsigned int level;
 };
 
 /**
@@ -539,6 +564,159 @@ static irqreturn_t edge_irq_handler(int irq, void *p)
 	return IRQ_WAKE_THREAD;
 }
 
+/*
+ * returns the current debounced logical value.
+ */
+static unsigned int debounced_value(struct line *line)
+{
+	unsigned int value;
+
+	/*
+	 * minor race - debouncer may be stopped here, so edge_detector_stop
+	 * must leave the value unchanged so the following will read the level
+	 * from when the debouncer was last running.
+	 */
+	value = READ_ONCE(line->level);
+
+	if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
+		value = !value;
+
+	return value;
+}
+
+static irqreturn_t debounce_irq_handler(int irq, void *p)
+{
+	struct line *line = p;
+
+	mod_delayed_work(system_wq, &line->work,
+		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period)));
+
+	return IRQ_HANDLED;
+}
+
+static void debounce_work_func(struct work_struct *work)
+{
+	struct gpio_v2_line_event le;
+	struct line *line = container_of(work, struct line, work.work);
+	struct linereq *lr;
+	int ret, level;
+
+	level = gpiod_get_raw_value_cansleep(line->desc);
+	if (level < 0) {
+		pr_debug_ratelimited("debouncer failed to read line value\n");
+		return;
+	}
+
+	if (READ_ONCE(line->level) == level)
+		return;
+
+	WRITE_ONCE(line->level, level);
+
+	/* -- edge detection -- */
+	if (!line->eflags)
+		return;
+
+	/* switch from physical level to logical - if they differ */
+	if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
+		level = !level;
+
+	/* ignore edges that are not being monitored */
+	if (((line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) && !level) ||
+	    ((line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) && level))
+		return;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&le, 0, sizeof(le));
+
+	lr = line->req;
+	le.timestamp = ktime_get_ns();
+	le.offset = gpio_chip_hwgpio(line->desc);
+	line->line_seqno++;
+	le.line_seqno = line->line_seqno;
+	le.seqno = (lr->num_lines == 1) ?
+		le.line_seqno : atomic_inc_return(&lr->seqno);
+
+	if (level)
+		/* Emit low-to-high event */
+		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+	else
+		/* Emit high-to-low event */
+		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+
+	ret = kfifo_in_spinlocked_noirqsave(&lr->events, &le,
+					    1, &lr->wait.lock);
+	if (ret)
+		wake_up_poll(&lr->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("event FIFO is full - event dropped\n");
+}
+
+static int debounce_setup(struct line *line,
+			  unsigned int debounce_period)
+{
+	unsigned long irqflags;
+	int ret, level, irq;
+
+	/* try hardware */
+	ret = gpiod_set_debounce(line->desc, debounce_period);
+	if (!ret) {
+		WRITE_ONCE(line->desc->debounce_period, debounce_period);
+		return ret;
+	}
+	if (ret != -ENOTSUPP)
+		return ret;
+
+	if (debounce_period) {
+		/* setup software debounce */
+		level = gpiod_get_raw_value_cansleep(line->desc);
+		if (level < 0)
+			return level;
+
+		irq = gpiod_to_irq(line->desc);
+		if (irq <= 0)
+			return -ENODEV;
+
+		WRITE_ONCE(line->level, level);
+		irqflags = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
+		ret = request_irq(irq, debounce_irq_handler, irqflags,
+				  line->req->label, line);
+		if (ret)
+			return ret;
+
+		WRITE_ONCE(line->sw_debounced, 1);
+		line->irq = irq;
+	}
+	return 0;
+}
+
+static bool gpio_v2_line_config_debounced(struct gpio_v2_line_config *lc,
+					  unsigned int line_idx)
+{
+	unsigned int i;
+	u64 mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
+		    (lc->attrs[i].mask & mask))
+			return true;
+	}
+	return false;
+}
+
+static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
+					       unsigned int line_idx)
+{
+	unsigned int i;
+	u64 mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
+		    (lc->attrs[i].mask & mask))
+			return lc->attrs[i].attr.debounce_period;
+	}
+	return 0;
+}
+
 static void edge_detector_stop(struct line *line)
 {
 	if (line->irq) {
@@ -546,12 +724,18 @@ static void edge_detector_stop(struct line *line)
 		line->irq = 0;
 	}
 
+	cancel_delayed_work_sync(&line->work);
+	WRITE_ONCE(line->sw_debounced, 0);
 	line->eflags = 0;
+	/* do not change line->level - see comment in debounced_value */
 }
 
 static int edge_detector_setup(struct line *line,
+			       struct gpio_v2_line_config *lc,
+			       unsigned int line_idx,
 			       u64 eflags)
 {
+	u32 debounce_period;
 	unsigned long irqflags = 0;
 	int irq, ret;
 
@@ -562,8 +746,16 @@ static int edge_detector_setup(struct line *line,
 			return ret;
 	}
 	line->eflags = eflags;
+	if (gpio_v2_line_config_debounced(lc, line_idx)) {
+		debounce_period = gpio_v2_line_config_debounce_period(lc, line_idx);
+		ret = debounce_setup(line, debounce_period);
+		if (ret)
+			return ret;
+		WRITE_ONCE(line->desc->debounce_period, debounce_period);
+	}
 
-	if (!eflags)
+	/* detection disabled or sw debouncer will provide edge detection */
+	if (!eflags || READ_ONCE(line->sw_debounced))
 		return 0;
 
 	irq = gpiod_to_irq(line->desc);
@@ -588,15 +780,31 @@ static int edge_detector_setup(struct line *line,
 	return 0;
 }
 
-static int edge_detector_update(struct line *line, u64 eflags,
-				bool polarity_change)
+static int edge_detector_update(struct line *line,
+				struct gpio_v2_line_config *lc,
+				unsigned int line_idx,
+				u64 eflags, bool polarity_change)
 {
-	if ((line->eflags == eflags) && !polarity_change)
+	unsigned int debounce_period =
+		gpio_v2_line_config_debounce_period(lc, line_idx);
+
+	if ((line->eflags == eflags) && !polarity_change &&
+	    (READ_ONCE(line->desc->debounce_period) == debounce_period))
 		return 0;
 
-	edge_detector_stop(line);
+	/* sw debounced and still will be...*/
+	if ((debounce_period != 0) && READ_ONCE(line->sw_debounced)) {
+		line->eflags = eflags;
+		WRITE_ONCE(line->desc->debounce_period, debounce_period);
+		return 0;
+	}
+
+	/* reconfiguring edge detection or sw debounce being disabled */
+	if ((line->irq && !READ_ONCE(line->sw_debounced)) ||
+	    (!debounce_period && READ_ONCE(line->sw_debounced)))
+		edge_detector_stop(line);
 
-	return edge_detector_setup(line, eflags);
+	return edge_detector_setup(line, lc, line_idx, eflags);
 }
 
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
@@ -694,6 +902,11 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 		ret = gpio_v2_line_flags_validate(flags);
 		if (ret)
 			return ret;
+
+		/* debounce requires explicit input */
+		if (gpio_v2_line_config_debounced(lc, i) &&
+		    !(flags & GPIO_V2_LINE_FLAG_INPUT))
+			return -EINVAL;
 	}
 	return 0;
 }
@@ -728,7 +941,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	struct gpio_v2_line_values lv;
 	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
 	struct gpio_desc **descs;
-	unsigned int i, didx, num_get;
+	unsigned int i, val, didx, num_get;
 	int ret;
 
 	/* NOTE: It's ok to read values of output lines. */
@@ -767,7 +980,11 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	lv.bits = 0;
 	for (didx = 0, i = 0; i < lr->num_lines; i++) {
 		if (lv.mask & BIT_ULL(i)) {
-			if (test_bit(didx, vals))
+			if (lr->lines[i].sw_debounced)
+				val = debounced_value(&lr->lines[i]);
+			else
+				val = test_bit(didx, vals);
+			if (val)
 				lv.bits |= BIT_ULL(i);
 			didx++;
 		}
@@ -871,7 +1088,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			if (ret)
 				return ret;
 
-			ret = edge_detector_update(&lr->lines[i],
+			ret = edge_detector_update(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS,
 					polarity_change);
 			if (ret)
@@ -1065,8 +1282,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	lr->gdev = gdev;
 	get_device(&gdev->dev);
 
-	for (i = 0; i < ulr.num_lines; i++)
+	for (i = 0; i < ulr.num_lines; i++) {
 		lr->lines[i].req = lr;
+		WRITE_ONCE(lr->lines[i].sw_debounced, 0);
+		INIT_DELAYED_WORK(&lr->lines[i].work, debounce_work_func);
+	}
 
 	/* Make sure this is terminated */
 	ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
@@ -1126,7 +1346,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_linereq;
 
-			ret = edge_detector_setup(&lr->lines[i],
+			ret = edge_detector_setup(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
@@ -1597,6 +1817,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period;
+	unsigned int num_attrs = 0;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -1656,6 +1878,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
+	debounce_period = READ_ONCE(desc->debounce_period);
+	if (debounce_period) {
+		info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		info->attrs[num_attrs].debounce_period = debounce_period;
+		num_attrs++;
+	}
+	info->num_attrs = num_attrs;
+
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e4c81dca7f8b..8eb91f01debd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2046,6 +2046,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 #ifdef CONFIG_OF_DYNAMIC
 		desc->hog = NULL;
+#endif
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period, 0);
 #endif
 		ret = true;
 	}
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 39b356160937..671805a79a15 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -124,6 +124,10 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+#ifdef CONFIG_GPIO_CDEV
+	/* debounce period in microseconds */
+	unsigned int		debounce_period;
+#endif
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
-- 
2.28.0

