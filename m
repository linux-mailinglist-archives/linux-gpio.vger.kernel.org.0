Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7723F22D4B4
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgGYEWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:08 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14720C0619D3;
        Fri, 24 Jul 2020 21:22:08 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t10so278977plz.10;
        Fri, 24 Jul 2020 21:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r6TQYZhJBbKXH4Ro283sftzI7yMctL1QL30sHzlwFUE=;
        b=SD4SN7p07hLXvy5mwIUH1k67Qc+VkSapzxNvFNfK5zMQLXOy5BQ5BSMbh/e7fyDuGl
         v5TOV62DPD1askhlyADfMBJAVcIFgqki1j/+iPeHvViwzEFaXm6sBK4U8IVRNZuzxow7
         KwHPkHNQV+4KVXy2o+D76gywWy9nQ7YV4rWbg9v3COJnovInpaVzORRFqMpQ8gHx1osV
         K9dFb/GTVLyusA/JQB8rJKP9xReEmJ2zH2Zsu6pHXFpgqH4vLP1QDCxyd2R9wc0Oqxlo
         01ed/ixTefk7FJXi2SD8RHZ8W6V9DHoDcsgMApbeOjoGEorBf6zr7qaVVbUocnMtf3pk
         VcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r6TQYZhJBbKXH4Ro283sftzI7yMctL1QL30sHzlwFUE=;
        b=Pzg4Rb2vGjlTGYjXN7LRGhvLvx3eicu6sy+qtUta1slBn5bF6+Q561KOBzLRxl24dA
         dSKgq48VGdKyvM7rVPfgSL3BUyI5Ei082HS/esSlmS+zrILjkGBDcKhzgCCAaA01KIPZ
         S/20ieY6HjsX0U+pzUaAoZIsvboZJchIJYLmde4Wreax/hNuLw3+INIXhYdtza1BpTKZ
         o6STiTwP9UtYcEFkO6CLyybShvw7UQxXRC94oaXNLxRS/SeOR/hrNHnSC1YVQEU+0Ccl
         gnkqR8j3brngmD8idteR3OIGEJdGBiT32ktbf/BoHaf5pLvWNyYmKyFXqPciiHQWIlSR
         qPaw==
X-Gm-Message-State: AOAM533JEO6+It+9C8L96e7ikm49vxyAZFrUCggKuDQN7gXOE6PBtNca
        VNn5qIGul48Xn+Sc/32Yu8Z+qEYD
X-Google-Smtp-Source: ABdhPJzaXPGNrp0SrKg014S0+wVu8P8+b7S6L+fkTGUI68CAXU3Dm+3JRcKT23LeGKBHcHEqX1wsDA==
X-Received: by 2002:a17:90b:811:: with SMTP id bk17mr8177325pjb.183.1595650926996;
        Fri, 24 Jul 2020 21:22:06 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 10/18] gpiolib: cdev: support setting debounce
Date:   Sat, 25 Jul 2020 12:19:47 +0800
Message-Id: <20200725041955.9985-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
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

Changes since v1:
 - improve documentation on fields shared by threads.
 - use READ_ONCE/WRITE_ONCE for shared fields rather than atomic_t
   which was overkill.


 drivers/gpio/gpiolib-cdev.c | 261 +++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h      |   4 +
 2 files changed, 260 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9f2f3336c62a..b6761d267a7d 100644
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
@@ -394,6 +396,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * for the corresponding line request. Ths is drawn from the @line.
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
+ * @work: the worker that implements software debouncing
+ * @sw_debounced: flag indicating if the software debouncer is active
+ * @level: the current debounced physical level of the line
  */
 struct edge_detector {
 	struct line *line;
@@ -405,7 +410,27 @@ struct edge_detector {
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
 
@@ -554,17 +583,212 @@ static int edge_detector_start(struct edge_detector *edet)
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
+	struct gpioline_event le;
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
+	if (((edet->flags == GPIOLINE_FLAG_V2_EDGE_RISING) && !level) ||
+	    ((edet->flags == GPIOLINE_FLAG_V2_EDGE_FALLING) && level))
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
+static int gpioline_config_debounced(struct gpioline_config *lc, int line_idx)
+{
+	int i;
+
+	for (i = lc->num_attrs - 1; i >= 0; i--) {
+		if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_DEBOUNCE) &&
+		    test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
+			return 1;
+	}
+	return 0;
+}
+
+static u32 gpioline_config_debounce_period(struct gpioline_config *lc,
+					   int line_idx)
+{
+	int i;
+
+	for (i = lc->num_attrs - 1; i >= 0; i--) {
+		if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_DEBOUNCE) &&
+		    test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
+			return lc->attrs[i].attr.debounce_period;
+	}
+	return 0;
 }
 
 static int edge_detector_setup(struct edge_detector *edet,
-			       struct gpioline_config *lc)
+			       struct gpioline_config *lc,
+			       int line_idx)
 {
+	int ret;
+
+	if (gpioline_config_debounced(lc, line_idx)) {
+		ret = debounce_setup(edet,
+			gpioline_config_debounce_period(lc, line_idx));
+		if (ret)
+			return ret;
+	}
 	if (edet->flags)
 		return edge_detector_start(edet);
 	return 0;
@@ -709,6 +933,11 @@ static int gpioline_config_validate(struct gpioline_config *lc, int num_lines)
 		ret = gpioline_flags_validate(flags);
 		if (ret)
 			return ret;
+
+		/* debounce requires explicit input */
+		if (gpioline_config_debounced(lc, i) &&
+		    !(flags & GPIOLINE_FLAG_V2_INPUT))
+			return -EINVAL;
 	}
 	return 0;
 }
@@ -766,7 +995,7 @@ static long line_get_values(struct line *line, void __user *ip)
 {
 	struct gpioline_values lv;
 	unsigned long *vals = (unsigned long *)lv.bits;
-	int ret;
+	int ret, i;
 
 	/* NOTE: It's ok to read values of output lines. */
 	memset(&lv, 0, sizeof(lv));
@@ -779,6 +1008,11 @@ static long line_get_values(struct line *line, void __user *ip)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < line->num_descs; i++) {
+		if (line->edets[i].sw_debounced)
+			assign_bit(i, vals, debounced_value(&line->edets[i]));
+	}
+
 	if (copy_to_user(ip, &lv, sizeof(lv)))
 		return -EFAULT;
 
@@ -880,6 +1114,12 @@ static long line_set_config_locked(struct line *line,
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
+			if (gpioline_config_debounced(lc, i)) {
+				ret = debounce_update(&line->edets[i],
+					gpioline_config_debounce_period(lc, i));
+				if (ret)
+					return ret;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1080,8 +1320,11 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_line;
 	}
 
-	for (i = 0; i < linereq.num_lines; i++)
+	for (i = 0; i < linereq.num_lines; i++) {
 		line->edets[i].line = line;
+		WRITE_ONCE(line->edets[i].sw_debounced, 0);
+		INIT_DELAYED_WORK(&line->edets[i].work, debounce_work_func);
+	}
 
 	/* Make sure this is terminated */
 	linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
@@ -1148,7 +1391,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_line;
 			line->edets[i].flags = flags & GPIOLINE_EDGE_FLAGS;
-			ret = edge_detector_setup(&line->edets[i], lc);
+			ret = edge_detector_setup(&line->edets[i], lc, i);
 			if (ret)
 				goto out_free_line;
 		}
@@ -1620,6 +1863,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
+	u32 debounce_period;
+	int num_attrs = 0;
 
 	/*
 	 * This function takes a mutex so we must check this before taking
@@ -1685,7 +1930,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIOLINE_FLAG_V2_EDGE_FALLING;
 
-	info->num_attrs = 0;
+	debounce_period = READ_ONCE(desc->debounce_period);
+	if (debounce_period) {
+		info->attrs[num_attrs].id = GPIOLINE_ATTR_ID_DEBOUNCE;
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
2.27.0

