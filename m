Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B56625723B
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHaDXa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgHaDX0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:23:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E420BC061573;
        Sun, 30 Aug 2020 20:23:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ds1so2403408pjb.1;
        Sun, 30 Aug 2020 20:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vM2JNO1dVnrC7z6UDwNhKEfPKimEuy2Ft5KXHgXwsf0=;
        b=e2a/dcBCp4EMqw2GRg67m1f3NmpN5Gev34OdnQ1OjdkDk40eX4OgGgPte4YqwmT+4i
         juF3qIjeE85lAL7L1GgHF+Hlha/h/juhBB20uj6OTLUjC1NtqEe2f+cqAnlKBUjQ9Ayf
         a9zuN5wx6jsMwh6NOHZvbEUdsptQOBrdTQB9yz+MyX31F2HA3TZFUKiLTqghcYZoXixN
         SZviGxmjnaUj2pDz8wgo6qEnMi+zBAsIf4B7KXDeELzJKwgCcMEp+XsPIWlVAIa5/py3
         lVzRy2lLsdIcd1oyw+6zw1KF2itYU+r0IzAGFzvqMOsJllenBVaNWjEXRWb+nRB9QePU
         4xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vM2JNO1dVnrC7z6UDwNhKEfPKimEuy2Ft5KXHgXwsf0=;
        b=ggzo+Y0Bc7+6UP/PUG0r1AsP6JzelsQzBcW3nyZqvRSP5NSvOVMMO9LoVQSxfrrPWZ
         EWSsxuXFIg0GxLUWKoj5E8CGIzecSVyHZb1DygWqsfLZ/ROWGged6PNKi8E4Ot51vC7a
         bOw+xjLcNOsUvkVJJ767v7e8NyLYC11u75KwTG8wFDr2v4TTdwiF+k6DYJDl8/KK0K0h
         w2leoz1w7KQkARNbiqD+S7T21vnzJKy5RvybUr1SqBG07kRcuv4XeksAOdKRAPc51G1l
         ZyL6BlqDOIEMSXZ+bMOiznAUx4XKGNGxpMgczSVvf3sFj7vPmVHDPNTpL0lGkrUTmnzz
         Q5dw==
X-Gm-Message-State: AOAM5328YTGT6jKJfAD48l/Kb2akhA3iMU2tTX6m/W0nuivWPxoOy+ld
        /Dk2HfYm71sfKMcy3umdK8SxeqqzN7A=
X-Google-Smtp-Source: ABdhPJxO8zW18uV/ADWbvj3ZuNiezDm/77BVbGbVGdvWXmuKRremTeSSLoH5YayohhzIJ7G0PMRa3Q==
X-Received: by 2002:a17:90a:1741:: with SMTP id 1mr9368554pjm.173.1598844202898;
        Sun, 30 Aug 2020 20:23:22 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:23:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 12/20] gpiolib: cdev: support setting debounce
Date:   Mon, 31 Aug 2020 11:19:58 +0800
Message-Id: <20200831032006.1019978-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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
index 9f05bbd2161e..2493bcc1d6f7 100644
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
@@ -765,7 +978,11 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -867,7 +1084,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			if (ret)
 				return ret;
 
-			ret = edge_detector_update(&lr->lines[i],
+			ret = edge_detector_update(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS,
 					polarity_change);
 			if (ret)
@@ -1061,8 +1278,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
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
@@ -1122,7 +1342,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_linereq;
 
-			ret = edge_detector_setup(&lr->lines[i],
+			ret = edge_detector_setup(&lr->lines[i], lc, i,
 					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
@@ -1593,6 +1813,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period;
+	unsigned int num_attrs = 0;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -1652,6 +1874,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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

