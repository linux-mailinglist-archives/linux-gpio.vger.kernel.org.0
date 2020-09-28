Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32BD27A4D3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgI1AbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgI1AbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:31:04 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD09EC0613CE;
        Sun, 27 Sep 2020 17:31:04 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so7747404pfn.9;
        Sun, 27 Sep 2020 17:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xfjy4YEAEexPX8kqFdfDjo/3VVBQSCZeNT9dfotqO9s=;
        b=NSg+4LnkgUcZuNYpZ5KFnpFuIunc6Mhhm4ZnSxW6I7xC3+JVRuMTZgY2lP4KumL+Qt
         54arH18ULG5WuIs0xA3hbmmTniFB5T3Iw+LwSrr7QV395Q9OrkS83uAqn/onL4lFtO8x
         FlQPeR+zcM2J4i9rrpnT3PeEqEGydwQFMiPTkV1PJTUeA/uKg0aTU1GSqlVKXhXNVyVD
         QXD8ZYnU/0Z+DZcvmAiHRH4In4g5YiEJDZDNXKsQuI7dcxmCm146GPK3e5eQAUBhVXGt
         XNZplLmzM3H5VJZCdHLR0DplfIBNBNym/dpK8utBWLTPPIsBWkpEV8H2AVPIVXrwkKTI
         UZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xfjy4YEAEexPX8kqFdfDjo/3VVBQSCZeNT9dfotqO9s=;
        b=k72CLB8CyUQ5t+TduoQYJoK3PPwuferzWeI4X6cjy7CIMEeg06EkuSGTQfxOkMGjqd
         acjuvEZ5OMvQst2hS/uk7N1mMMgutHXOxdNg39CmW7ncwyEA7mTyLE/NxC8CUqBZajzG
         dsESYpfOTJ/OgaYhDucsFG6U1HyL1ggcJAI9dH6VDXhsZHNpxHkdzIUDKtjhqqDeO0rS
         1QM3aqiWLgoIzl4JQnvoNeoYFPVaB+BuakJAQD9ES4lFBJ2Om1Ey8lULYisZtbZbH0XX
         9NGp+naLkE0OMGCQ3A9fUZlfoj1UU+oR+0U7XAy+TJkqS1UOhcnJNVb+w9zc903IDFAs
         D+GA==
X-Gm-Message-State: AOAM530gp3uolmfM9UkDd7r+8XJpxAo+ntcI9XP2UHvETo/WzCzew7yN
        5YoSHvghswm8+M+EkZqsKhghTDQp0ozXNw==
X-Google-Smtp-Source: ABdhPJy3OnTdO+7uDaFhsLsGMaTUATPlroO7raEo2uoHYz209a5j0IDTHs6t8jFZUjSaiUn4wX/lDw==
X-Received: by 2002:a63:2e42:: with SMTP id u63mr7158142pgu.292.1601253063745;
        Sun, 27 Sep 2020 17:31:03 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:31:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 12/20] gpiolib: cdev: support setting debounce
Date:   Mon, 28 Sep 2020 08:27:59 +0800
Message-Id: <20200928002807.12146-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes for v10:
 - as per cover letter

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

 drivers/gpio/gpiolib-cdev.c | 247 ++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.c      |   3 +
 drivers/gpio/gpiolib.h      |   4 +
 3 files changed, 244 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 25536aae3e18..73386fcc252d 100644
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
@@ -415,6 +417,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * events for the corresponding line request. This is drawn from the @req.
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
+ * @work: the worker that implements software debouncing
+ * @sw_debounced: flag indicating if the software debouncer is active
+ * @level: the current debounced physical level of the line
  */
 struct line {
 	struct gpio_desc *desc;
@@ -431,7 +436,28 @@ struct line {
 	 */
 	u64 timestamp_ns;
 	u32 req_seqno;
+	/*
+	 * line_seqno is accessed by either edge_irq_thread() or
+	 * debounce_work_func(), which are themselves mutually exclusive,
+	 * so no additional protection is necessary.
+	 */
 	u32 line_seqno;
+	/*
+	 * -- debouncer specific fields --
+	 */
+	struct delayed_work work;
+	/*
+	 * sw_debounce is accessed by linereq_set_config(), which is the
+	 * only setter, and linereq_get_values(), which can live with a
+	 * slightly stale value.
+	 */
+	unsigned int sw_debounced;
+	/*
+	 * level is accessed by debounce_work_func(), which is the only
+	 * setter, and linereq_get_values() which can live with a slightly
+	 * stale value.
+	 */
+	unsigned int level;
 };
 
 /**
@@ -572,6 +598,154 @@ static irqreturn_t edge_irq_handler(int irq, void *p)
 	return IRQ_WAKE_THREAD;
 }
 
+/*
+ * returns the current debounced logical value.
+ */
+static bool debounced_value(struct line *line)
+{
+	bool value;
+
+	/*
+	 * minor race - debouncer may be stopped here, so edge_detector_stop()
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
+		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
+
+	return IRQ_HANDLED;
+}
+
+static void debounce_work_func(struct work_struct *work)
+{
+	struct gpio_v2_line_event le;
+	struct line *line = container_of(work, struct line, work.work);
+	struct linereq *lr;
+	int level;
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
+	le.timestamp_ns = ktime_get_ns();
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
+	linereq_put_event(lr, &le);
+}
+
+static int debounce_setup(struct line *line,
+			  unsigned int debounce_period_us)
+{
+	unsigned long irqflags;
+	int ret, level, irq;
+
+	/* try hardware */
+	ret = gpiod_set_debounce(line->desc, debounce_period_us);
+	if (!ret) {
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		return ret;
+	}
+	if (ret != -ENOTSUPP)
+		return ret;
+
+	if (debounce_period_us) {
+		/* setup software debounce */
+		level = gpiod_get_raw_value_cansleep(line->desc);
+		if (level < 0)
+			return level;
+
+		irq = gpiod_to_irq(line->desc);
+		if (irq < 0)
+			return -ENXIO;
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
+			return lc->attrs[i].attr.debounce_period_us;
+	}
+	return 0;
+}
+
 static void edge_detector_stop(struct line *line)
 {
 	if (line->irq) {
@@ -579,12 +753,18 @@ static void edge_detector_stop(struct line *line)
 		line->irq = 0;
 	}
 
+	cancel_delayed_work_sync(&line->work);
+	WRITE_ONCE(line->sw_debounced, 0);
 	line->eflags = 0;
+	/* do not change line->level - see comment in debounced_value() */
 }
 
 static int edge_detector_setup(struct line *line,
+			       struct gpio_v2_line_config *lc,
+			       unsigned int line_idx,
 			       u64 eflags)
 {
+	u32 debounce_period_us;
 	unsigned long irqflags = 0;
 	int irq, ret;
 
@@ -595,8 +775,16 @@ static int edge_detector_setup(struct line *line,
 			return ret;
 	}
 	line->eflags = eflags;
+	if (gpio_v2_line_config_debounced(lc, line_idx)) {
+		debounce_period_us = gpio_v2_line_config_debounce_period(lc, line_idx);
+		ret = debounce_setup(line, debounce_period_us);
+		if (ret)
+			return ret;
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+	}
 
-	if (!eflags)
+	/* detection disabled or sw debouncer will provide edge detection */
+	if (!eflags || READ_ONCE(line->sw_debounced))
 		return 0;
 
 	irq = gpiod_to_irq(line->desc);
@@ -621,15 +809,31 @@ static int edge_detector_setup(struct line *line,
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
+	unsigned int debounce_period_us =
+		gpio_v2_line_config_debounce_period(lc, line_idx);
+
+	if ((line->eflags == eflags) && !polarity_change &&
+	    (READ_ONCE(line->desc->debounce_period_us) == debounce_period_us))
 		return 0;
 
-	edge_detector_stop(line);
+	/* sw debounced and still will be...*/
+	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
+		line->eflags = eflags;
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		return 0;
+	}
+
+	/* reconfiguring edge detection or sw debounce being disabled */
+	if ((line->irq && !READ_ONCE(line->sw_debounced)) ||
+	    (!debounce_period_us && READ_ONCE(line->sw_debounced)))
+		edge_detector_stop(line);
 
-	return edge_detector_setup(line, eflags);
+	return edge_detector_setup(line, lc, line_idx, eflags);
 }
 
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
@@ -727,6 +931,11 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
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
@@ -766,6 +975,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
 	struct gpio_desc **descs;
 	unsigned int i, didx, num_get;
+	bool val;
 	int ret;
 
 	/* NOTE: It's ok to read values of output lines. */
@@ -804,7 +1014,11 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -908,7 +1122,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			if (ret)
 				return ret;
 
-			ret = edge_detector_update(&lr->lines[i],
+			ret = edge_detector_update(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS,
 					polarity_change);
 			if (ret)
@@ -1102,8 +1316,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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
@@ -1164,7 +1381,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_linereq;
 
-			ret = edge_detector_setup(&lr->lines[i],
+			ret = edge_detector_setup(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
@@ -1634,6 +1851,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period_us;
+	unsigned int num_attrs = 0;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -1694,6 +1913,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
+	debounce_period_us = READ_ONCE(desc->debounce_period_us);
+	if (debounce_period_us) {
+		info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		info->attrs[num_attrs].debounce_period_us = debounce_period_us;
+		num_attrs++;
+	}
+	info->num_attrs = num_attrs;
+
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aa20481e9452..3cdf9effc13a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2097,6 +2097,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 #ifdef CONFIG_OF_DYNAMIC
 		desc->hog = NULL;
+#endif
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
 #endif
 		ret = true;
 	}
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 39b356160937..b674b5bb980e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -124,6 +124,10 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+#ifdef CONFIG_GPIO_CDEV
+	/* debounce period in microseconds */
+	unsigned int		debounce_period_us;
+#endif
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
-- 
2.28.0

