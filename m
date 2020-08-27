Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A07254703
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgH0OgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgH0ODz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:03:55 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3455FC0619C4;
        Thu, 27 Aug 2020 07:03:07 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id p11so3573939pfn.11;
        Thu, 27 Aug 2020 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S4Xa3BFRPcqJPxsgjYTiIijreo6sqSK/Q3rnsnWUnmQ=;
        b=sBiftOV25rx2mzW7BJ7GcHH4Id6f/80yqStCtZ4TGfBMYgga7QKahHbKnKXMuEjqgP
         pousMFbUHf8JaO0ASl0skFN/749+jQ7LYo5GjvioBl22VCD0ogks9z6IM4yI2QLYoRjL
         9x9VYlff710t07VYUrTk5FIHEjGF6WUAFeASEcfPzO1Aa1AvAR/ar2iQi3D8A3pqVZgV
         4bDZWrEpmPcvkQhcf/7jnx9eu/1KK7nkA4BayIbB16khLvTEWQldX6VdUee1m/3SXxXD
         YNzAAUUxRnQL9WSoB+jJ8AhGWTjQOaRgjQBKJiZsTBE/GG3jiz5BlSvPbAphphw4hCAB
         Gc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4Xa3BFRPcqJPxsgjYTiIijreo6sqSK/Q3rnsnWUnmQ=;
        b=Af4zJ6T7uqEm2DxE4Zw3qUzwBwcwbFM8wAmhXwwgP+n+MMJSicm6L0j6mnUpm78/xv
         YtM+C8rwJYweauFjXpogH/5PaJnL1WtuaR9vKAz42nmjIIb1Xya85YuUZkP/zJ2h+2+1
         xbl3J4RF0B73hXvgNleIFcCW85MnbtInal+zDGs5AnziDwsCmrb1Knzx0ZbC5A9MLX1i
         PtOxcrGlY0Xo+tjBNPJvgvKiNCggzhVGb7BOJJS4xSbuuVdldDX1HbuQBHlahSfZC2bJ
         8XZ/R5voFhiQ1aCV56QIDP9p0hQBrEc/tf2u/8qMNku4tdxxuaItPlNxEC3m5iWANBeb
         oUIg==
X-Gm-Message-State: AOAM5302IouaDp5KbpfAB5ev6XIDguHXXpVemZbKR2I//CZtgZGp2W8l
        b2beadCSTUojYjE3IbDOFZGrVAMBIbg=
X-Google-Smtp-Source: ABdhPJzxT3Ymw6R1fm68ASqrONuanLsmJFCrzR3UoUSZynOC3PBBUk5H6OtwUpPjxiT3sncVboUlBg==
X-Received: by 2002:aa7:95ad:: with SMTP id a13mr8962195pfk.136.1598536985693;
        Thu, 27 Aug 2020 07:03:05 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:03:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 12/20] gpiolib: cdev: support setting debounce
Date:   Thu, 27 Aug 2020 22:00:12 +0800
Message-Id: <20200827140020.159627-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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

Due to the tight integration between the debouncer and edge detection,
and to avoid particular corner cases, it is not allowed to alter the
debounce value if edge detection is enabled.  Changing the debounce with
edge detection enabled is a very unlikely use case, so it is preferable
to disallow it rather than complicate the code to allow it.
Should the user wish to alter the debounce value in such cases they will
need to release and re-request the line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

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

 drivers/gpio/gpiolib-cdev.c | 254 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h      |   4 +
 2 files changed, 252 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3d2d9eefdfa0..b93479a98637 100644
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
@@ -518,6 +543,10 @@ static int edge_detector_start(struct line *line)
 	unsigned long irqflags = 0;
 	int irq, ret;
 
+	if (READ_ONCE(line->sw_debounced))
+		/* debouncer is setup and will provide edge detection */
+		return 0;
+
 	irq = gpiod_to_irq(line->desc);
 	if (irq <= 0)
 		return -ENODEV;
@@ -543,17 +572,204 @@ static int edge_detector_start(struct line *line)
 	return 0;
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
+		line->line_seqno = 0;
+		irqflags = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
+		ret = request_irq(irq, debounce_irq_handler, irqflags,
+				  line->req->label, line);
+		if (ret)
+			return ret;
+
+		WRITE_ONCE(line->sw_debounced, 1);
+		line->irq = irq;
+	}
+	WRITE_ONCE(line->desc->debounce_period, debounce_period);
+	return 0;
+}
+
 static void edge_detector_stop(struct line *line)
 {
 	if (line->irq) {
 		free_irq(line->irq, line);
 		line->irq = 0;
 	}
+
+	cancel_delayed_work_sync(&line->work);
+	WRITE_ONCE(line->sw_debounced, 0);
+	/* do not change line->level - see comment in debounced_value */
+
+	if (line->desc)
+		WRITE_ONCE(line->desc->debounce_period, 0);
+}
+
+static int debounce_update(struct line *line,
+			   unsigned int debounce_period)
+{
+	if (READ_ONCE(line->desc->debounce_period) == debounce_period)
+		return 0;
+
+	if (!READ_ONCE(line->sw_debounced))
+		return debounce_setup(line, debounce_period);
+
+	if (!debounce_period)
+		edge_detector_stop(line);
+	else
+		WRITE_ONCE(line->desc->debounce_period, debounce_period);
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
 }
 
 static int edge_detector_setup(struct line *line,
-			       struct gpio_v2_line_config *lc)
+			       struct gpio_v2_line_config *lc,
+			       unsigned int line_idx)
 {
+	int ret;
+
+	if (gpio_v2_line_config_debounced(lc, line_idx)) {
+		ret = debounce_setup(line,
+			gpio_v2_line_config_debounce_period(lc, line_idx));
+		if (ret)
+			return ret;
+	}
 	if (line->eflags)
 		return edge_detector_start(line);
 	return 0;
@@ -693,6 +909,11 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
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
@@ -750,7 +971,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	struct gpio_v2_line_values lv;
 	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
 	struct gpio_desc **descs;
-	unsigned int i, didx, num_get;
+	unsigned int i, val, didx, num_get;
 	int ret;
 
 	/* NOTE: It's ok to read values of output lines. */
@@ -787,7 +1008,11 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -888,6 +1113,12 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
+			if (gpio_v2_line_config_debounced(lc, i)) {
+				ret = debounce_update(&lr->lines[i],
+					gpio_v2_line_config_debounce_period(lc, i));
+				if (ret)
+					return ret;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1083,8 +1314,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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
@@ -1151,7 +1385,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_linereq;
 			lr->lines[i].eflags = flags & GPIO_V2_LINE_EDGE_FLAGS;
-			ret = edge_detector_setup(&lr->lines[i], lc);
+			ret = edge_detector_setup(&lr->lines[i], lc, i);
 			if (ret)
 				goto out_free_linereq;
 		}
@@ -1621,6 +1855,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period;
+	unsigned int num_attrs = 0;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -1680,7 +1916,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
-	info->num_attrs = 0;
+	debounce_period = READ_ONCE(desc->debounce_period);
+	if (debounce_period) {
+		info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		info->attrs[num_attrs].debounce_period = debounce_period;
+		num_attrs++;
+	}
+	info->num_attrs = num_attrs;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
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

