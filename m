Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5420423FE7D
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgHIN1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIN1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:27:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1C6C061756;
        Sun,  9 Aug 2020 06:27:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i92so7854064pje.0;
        Sun, 09 Aug 2020 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QOvP8GF2dZv/tLwHycDLmSoRX2FziCq/oDOL8tIm8Po=;
        b=k58M+UutkqyGjC5e2uZq9P1nQVt4L0aGEBkDrWGRE+qTwutsaNNaupm75Z9vLRiB5V
         FljcNnlQCfN89TGdWZvhmsAlaOTEzngA+lFy5m+neGE12W+pnCK/Ci6mxn69wvZIcuWh
         jJhKwafOQiL7We2/6ZMUDYcysLTqisNFe5AEtayUaZ6c9QQ86tZpdmqHMOU68jgRt3xJ
         LrwejeC0/DQZbrjchVCr8egKSR2ogXZ4H+0jIbCZEpNQce4WVvGh9W2O5fUi9wJ+Tkxk
         RscrA1RgIfwAVClRUXO1B+1Lbaaa2q1OPVgRsG5QmJlRLmNbTEykQ/UlUUXL8VUQc+XG
         2DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QOvP8GF2dZv/tLwHycDLmSoRX2FziCq/oDOL8tIm8Po=;
        b=mieOVVA6vibyqcoAkSGanuNSpcWPDn9HbWLFM7p9Ryhc2JMJtNDu2kEWuG3+FnxzUB
         lkapU4LQo4nyBsbupCvW4Ds0wFauVPG+xPTKp3G3Yw32iWaL5aWeI8F2NLPBdlXrrC1x
         YLW3tN5UCjO8qQbHTxaO1cEiXVOssDpjKsxc8FAOWZAj0wa1X8WhAo4oTJ/ttY0WpIdu
         SATneFI3qCJTnbM4u14asaIo6EKAPThLxan+1FJbHcpaQerqYTIAhEBBLclDBer42Zzp
         PAxbpEaPCGoagFb+1o7kE3wfoRXauEn5yVaO3sI1/U7FIpfUr1i5lc8Yxrgka64Y5/uc
         Ff+g==
X-Gm-Message-State: AOAM530pNSHMBGsM3KdA5mUEojfbNw1T1SYSb5t2Pwxpj8kp6riyTzdl
        2gvxcK3tphdOLJfgRfc5xjzwDtTB
X-Google-Smtp-Source: ABdhPJxZDfwcJezQA1d8xNFDyVgf78+6SJHFnxilqLuzDjNGPaDXa/t2+QQEXepMtx6J4MPeiQ7Pmw==
X-Received: by 2002:a17:90b:358d:: with SMTP id mm13mr20122630pjb.88.1596979629470;
        Sun, 09 Aug 2020 06:27:09 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:27:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 10/18] gpiolib: cdev: support setting debounce
Date:   Sun,  9 Aug 2020 21:25:21 +0800
Message-Id: <20200809132529.264312-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
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
debounce value if edge detection is enabled.  Changing the debounce with
edge detection enabled is a very unlikely use case, so it is preferable
to disallow it rather than complicate the code to allow it.
Should the user wish to alter the debounce value in such cases they will
need to release and re-request the line.

Changes since v2:
 - only GPIO_V2 field renaming

Changes since v1:
 - improve documentation on fields shared by threads.
 - use READ_ONCE/WRITE_ONCE for shared fields rather than atomic_t
   which was overkill.

 drivers/gpio/gpiolib-cdev.c | 265 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h      |   4 +
 2 files changed, 263 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2f5cc835133c..8884478d1535 100644
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
@@ -395,6 +397,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * for the corresponding line request. Ths is drawn from the @line.
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
+ * @work: the worker that implements software debouncing
+ * @sw_debounced: flag indicating if the software debouncer is active
+ * @level: the current debounced physical level of the line
  */
 struct edge_detector {
 	struct line *line;
@@ -406,7 +411,27 @@ struct edge_detector {
 	 */
 	u64 timestamp;
 	u32 seqno;
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
+	 * sw_debounce is shared by line_set_config(), which is the only
+	 * setter, and line_ioctl(), which can live with a slightly stale
+	 * value.
+	 */
+	unsigned int sw_debounced;
+	/*
+	 * level is shared by debounce_work_func(), which is the only
+	 * setter, and line_ioctl() which can live with a slightly stale
+	 * value.
+	 */
+	unsigned int level;
 };
 
 /**
@@ -523,6 +548,10 @@ static int edge_detector_start(struct edge_detector *edet)
 	int ret, irq, irqflags = 0;
 	struct gpio_desc *desc;
 
+	if (READ_ONCE(edet->sw_debounced))
+		/* debouncer is setup and will provide edge detection */
+		return 0;
+
 	desc = edge_detector_desc(edet);
 	irq = gpiod_to_irq(desc);
 
@@ -554,17 +583,215 @@ static int edge_detector_start(struct edge_detector *edet)
 	return 0;
 }
 
+/*
+ * returns the current debounced logical value.
+ */
+static int debounced_value(struct edge_detector *edet)
+{
+	int value;
+
+	/*
+	 * minor race - debouncer may be stopped here, so edge_detector_stop
+	 * must leave the value unchanged so the following will read the level
+	 * from when the debouncer was last running.
+	 */
+	value = READ_ONCE(edet->level);
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
+			 usecs_to_jiffies(READ_ONCE(desc->debounce_period)));
+
+	return IRQ_HANDLED;
+}
+
+static void debounce_work_func(struct work_struct *work)
+{
+	struct gpio_v2_line_event le;
+	int ret, level;
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
+	if (READ_ONCE(edet->level) == level)
+		return;
+
+	WRITE_ONCE(edet->level, level);
+
+	/* -- edge detection -- */
+	if (!edet->flags)
+		return;
+
+	/* switch from physical level to logical - if they differ */
+	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+		level = !level;
+
+	/* ignore edges that are not being monitored */
+	if (((edet->flags == GPIO_V2_LINE_FLAG_EDGE_RISING) && !level) ||
+	    ((edet->flags == GPIO_V2_LINE_FLAG_EDGE_FALLING) && level))
+		return;
+
+	/* Do not leak kernel stack to userspace */
+	memset(&le, 0, sizeof(le));
+
+	line = edet->line;
+	le.timestamp = ktime_get_ns();
+	le.offset = gpio_chip_hwgpio(desc);
+	edet->line_seqno++;
+	le.line_seqno = edet->line_seqno;
+	le.seqno = (line->num_descs == 1) ?
+		le.line_seqno : atomic_inc_return(&line->seqno);
+
+	if (level)
+		/* Emit low-to-high event */
+		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+	else
+		/* Emit high-to-low event */
+		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
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
+		WRITE_ONCE(desc->debounce_period, debounce_period);
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
+		WRITE_ONCE(edet->level, level);
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
+		WRITE_ONCE(edet->sw_debounced, 1);
+		edet->irq = irq;
+	}
+	WRITE_ONCE(desc->debounce_period, debounce_period);
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
+	WRITE_ONCE(edet->sw_debounced, 0);
+	/* do not change edet->level - see comment in debounced_value */
+
+	if (desc)
+		WRITE_ONCE(desc->debounce_period, 0);
+}
+
+static int debounce_update(struct edge_detector *edet,
+			   unsigned int debounce_period)
+{
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
+	if (READ_ONCE(desc->debounce_period) == debounce_period)
+		return 0;
+
+	if (!READ_ONCE(edet->sw_debounced))
+		return debounce_setup(edet, debounce_period);
+
+	if (!debounce_period)
+		edge_detector_stop(edet);
+	else
+		WRITE_ONCE(desc->debounce_period, debounce_period);
+	return 0;
+}
+
+static int gpio_v2_line_config_debounced(struct gpio_v2_line_config *lc,
+					 int line_idx)
+{
+	int i;
+	unsigned long long mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
+		    (lc->attrs[i].mask & mask))
+			return 1;
+	}
+	return 0;
+}
+
+static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
+					       int line_idx)
+{
+	int i;
+	unsigned long long mask = BIT_ULL(line_idx);
+
+	for (i = 0; i < lc->num_attrs; i++) {
+		if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
+		    (lc->attrs[i].mask & mask))
+			return lc->attrs[i].attr.debounce_period;
+	}
+	return 0;
 }
 
 static int edge_detector_setup(struct edge_detector *edet,
-			       struct gpio_v2_line_config *lc)
+			       struct gpio_v2_line_config *lc,
+			       int line_idx)
 {
+	int ret;
+
+	if (gpio_v2_line_config_debounced(lc, line_idx)) {
+		ret = debounce_setup(edet,
+			gpio_v2_line_config_debounce_period(lc, line_idx));
+		if (ret)
+			return ret;
+	}
 	if (edet->flags)
 		return edge_detector_start(edet);
 	return 0;
@@ -703,6 +930,11 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
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
@@ -762,7 +994,7 @@ static long line_get_values(struct line *line, void __user *ip)
 	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
 	DECLARE_BITMAP(mask, GPIO_V2_LINES_MAX);
 	struct gpio_desc **descs;
-	int ret, i, didx, num_get = 0;
+	int ret, i, val, didx, num_get = 0;
 
 	/* NOTE: It's ok to read values of output lines. */
 	if (copy_from_user(&lv, ip, sizeof(lv)))
@@ -799,7 +1031,11 @@ static long line_get_values(struct line *line, void __user *ip)
 	lv.bits = 0;
 	for (didx = 0, i = 0; i < line->num_descs; i++) {
 		if (test_bit(i, mask)) {
-			if (test_bit(didx, vals))
+			if (line->edets[i].sw_debounced)
+				val = debounced_value(&line->edets[i]);
+			else
+				val = test_bit(didx, vals);
+			if (val)
 				lv.bits |= BIT_ULL(i);
 			didx++;
 		}
@@ -907,6 +1143,12 @@ static long line_set_config_locked(struct line *line,
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
+			if (gpio_v2_line_config_debounced(lc, i)) {
+				ret = debounce_update(&line->edets[i],
+					gpio_v2_line_config_debounce_period(lc, i));
+				if (ret)
+					return ret;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1109,8 +1351,11 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_line;
 	}
 
-	for (i = 0; i < lr.num_lines; i++)
+	for (i = 0; i < lr.num_lines; i++) {
 		line->edets[i].line = line;
+		WRITE_ONCE(line->edets[i].sw_debounced, 0);
+		INIT_DELAYED_WORK(&line->edets[i].work, debounce_work_func);
+	}
 
 	/* Make sure this is terminated */
 	lr.consumer[sizeof(lr.consumer)-1] = '\0';
@@ -1177,7 +1422,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_line;
 			line->edets[i].flags = flags & GPIO_V2_LINE_EDGE_FLAGS;
-			ret = edge_detector_setup(&line->edets[i], lc);
+			ret = edge_detector_setup(&line->edets[i], lc, i);
 			if (ret)
 				goto out_free_line;
 		}
@@ -1649,6 +1894,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period;
+	int num_attrs = 0;
 
 	/*
 	 * This function takes a mutex so we must check this before taking
@@ -1714,7 +1961,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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

