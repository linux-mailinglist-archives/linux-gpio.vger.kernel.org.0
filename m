Return-Path: <linux-gpio+bounces-1275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02B80E3E8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 06:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0581F21EE6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 05:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BC214F9B;
	Tue, 12 Dec 2023 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St9G1UpO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E774A1;
	Mon, 11 Dec 2023 21:43:30 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c659db0ce2so4408335a12.0;
        Mon, 11 Dec 2023 21:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702359809; x=1702964609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTiRVhNXg8I3Ixq+A5Iayl3CE87f/+Zaz2YhLRYre0A=;
        b=St9G1UpO/pGbq2JYOqD5ih/hzMf8L2rFPsnqQyLZXtrfIMa/SoprtXloUHObV0uswJ
         7WBWA9pPtozlEGiJxlMYYU1mfNX+IsmD8wA/tCJENObfHpdh3w9uCTJZUvg1M9iakAeq
         E7U/KJc930tFUsniok2f2Ij9EnXf47rTQqE204kbeevvkTfHdmjjtatF3Jah9zDMt+K6
         1hMsXP7eM0zhpm3bCe7lqGWDZXa72D2ymdAMbR7GRz6Ax9ClM/NDzpRKVrErKWietIk5
         PyETirld6VLfs6ya0c1Jw7gQPJlHPBfKxxPD8wv/g0HOB9wDenzqm+BlYJxXrDMNKs9o
         6A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359809; x=1702964609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTiRVhNXg8I3Ixq+A5Iayl3CE87f/+Zaz2YhLRYre0A=;
        b=MY/M9weyw6H6+EIvGKXPisynNdJbdjX3ZzELN97JxcLxkpvjSEVopdnJxQ3gl5x+h1
         FiIxeMxL12xb5fw7O03/XWjik90JRmArGwG4erjqIPGWimPj27bn/k6aVLrn6tOmuunc
         FUEU253+WEA+GpQrCMWy8moWD09S9mf68jey/nD3RhpFAYGMht2kj+OwGqf4g4fZeT9l
         8wGP0k9FILioDJS8y3gqei6APFmpWsWUg4WW639/igRhfr0OClsSdM9JlBuxhDFRBTzk
         bxolLjkvXTRjNjt5dJFdT6sRRGDFsP204f/MCDGwySMZRGIAEfQatGh9OzZURiFoaoFc
         Pdrw==
X-Gm-Message-State: AOJu0YzjBYjv8zzXw/5ZJRZK3tmV5k3fL4ANvA7NvCBlrTdm0V5US/5e
	rE0F7hodS68yDMB07Uhl5/GW0PIjMLo=
X-Google-Smtp-Source: AGHT+IH/k33FXby19xG8Mh7QTbPStg3NNhkv/WxGTwHgy/jTCkXY771/zTupDcO4F4zqAlnORjbM1A==
X-Received: by 2002:a17:903:40c8:b0:1b8:90bd:d157 with SMTP id t8-20020a17090340c800b001b890bdd157mr7246429pld.26.1702359809356;
        Mon, 11 Dec 2023 21:43:29 -0800 (PST)
Received: from rigel.home.arpa (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001d0be32b0basm7591836plf.217.2023.12.11.21.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:29 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
Date: Tue, 12 Dec 2023 13:42:50 +0800
Message-Id: <20231212054253.50094-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212054253.50094-1-warthog618@gmail.com>
References: <20231212054253.50094-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the debounce period for a requested line locally, rather than in
the debounce_period_us field in the gpiolib struct gpio_desc.

Add a global tree of lines containing supplemental line information
to make the debounce period available to be reported by the
GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 167 +++++++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 02ffda6c1e51..7999c1a72cfa 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
+#include <linux/rbtree.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/timekeeping.h>
@@ -462,6 +463,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 /**
  * struct line - contains the state of a requested line
  * @desc: the GPIO descriptor for this line.
+ * @node: to store the object in supinfo if supplemental
  * @req: the corresponding line request
  * @irq: the interrupt triggered in response to events on this GPIO
  * @edflags: the edge flags, GPIO_V2_LINE_FLAG_EDGE_RISING and/or
@@ -473,6 +475,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
  * @work: the worker that implements software debouncing
+ * @debounce_period_us: the debounce period in microseconds
  * @sw_debounced: flag indicating if the software debouncer is active
  * @level: the current debounced physical level of the line
  * @hdesc: the Hardware Timestamp Engine (HTE) descriptor
@@ -482,6 +485,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  */
 struct line {
 	struct gpio_desc *desc;
+	struct rb_node node;
 	/*
 	 * -- edge detector specific fields --
 	 */
@@ -514,6 +518,15 @@ struct line {
 	 * -- debouncer specific fields --
 	 */
 	struct delayed_work work;
+	/*
+	 * debounce_period_us is accessed by debounce_irq_handler() and
+	 * process_hw_ts() which are disabled when modified by
+	 * debounce_setup(), edge_detector_setup() or edge_detector_stop()
+	 * or can live with a stale version when updated by
+	 * edge_detector_update().
+	 * The modifying functions are themselves mutually exclusive.
+	 */
+	unsigned int debounce_period_us;
 	/*
 	 * sw_debounce is accessed by linereq_set_config(), which is the
 	 * only setter, and linereq_get_values(), which can live with a
@@ -546,6 +559,22 @@ struct line {
 #endif /* CONFIG_HTE */
 };
 
+/**
+ * struct supinfo - supplementary line info
+ * Used to populate gpio_v2_line_info with cdev specific fields not contained
+ * in the struct gpio_desc.
+ * A line is determined to contain supplemental information by
+ * line_is_supplemental().
+ * @lock: lock covering @tree
+ * @tree: a rbtree of the struct lines containing the supplemental info
+ */
+struct supinfo {
+	spinlock_t lock;
+	struct rb_root tree;
+};
+
+static struct supinfo supinfo;
+
 /**
  * struct linereq - contains the state of a userspace line request
  * @gdev: the GPIO device the line request pertains to
@@ -575,6 +604,100 @@ struct linereq {
 	struct line lines[] __counted_by(num_lines);
 };
 
+static void supinfo_init(void)
+{
+	supinfo.tree = RB_ROOT;
+	spin_lock_init(&supinfo.lock);
+}
+
+static void supinfo_insert(struct line *line)
+{
+	struct rb_node **new = &(supinfo.tree.rb_node), *parent = NULL;
+	struct line *entry;
+
+	spin_lock(&supinfo.lock);
+	while (*new) {
+		entry = container_of(*new, struct line, node);
+
+		parent = *new;
+		if (line->desc < entry->desc) {
+			new = &((*new)->rb_left);
+		} else if (line->desc > entry->desc) {
+			new = &((*new)->rb_right);
+		} else {
+			pr_warn("%s: duplicate line inserted\n", __func__);
+			goto out_unlock;
+		}
+	}
+
+	rb_link_node(&line->node, parent, new);
+	rb_insert_color(&line->node, &supinfo.tree);
+out_unlock:
+	spin_unlock(&supinfo.lock);
+}
+
+static void supinfo_erase(struct line *line)
+{
+	spin_lock(&supinfo.lock);
+	rb_erase(&line->node, &supinfo.tree);
+	spin_unlock(&supinfo.lock);
+}
+
+static struct line *supinfo_find(struct gpio_desc *desc)
+{
+	struct rb_node *node = supinfo.tree.rb_node;
+	struct line *line;
+
+	while (node) {
+		line = container_of(node, struct line, node);
+		if (desc < line->desc)
+			node = node->rb_left;
+		else if (desc > line->desc)
+			node = node->rb_right;
+		else
+			return line;
+	}
+	return NULL;
+}
+
+static void supinfo_to_lineinfo(struct gpio_desc *desc,
+				struct gpio_v2_line_info *info)
+{
+	struct gpio_v2_line_attribute *attr;
+	struct line *line;
+
+	spin_lock(&supinfo.lock);
+	line = supinfo_find(desc);
+	if (line) {
+		attr = &info->attrs[info->num_attrs];
+		attr->id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		attr->debounce_period_us = READ_ONCE(line->debounce_period_us);
+		info->num_attrs++;
+	}
+	spin_unlock(&supinfo.lock);
+}
+
+static inline bool line_is_supplemental(struct line *line)
+{
+	return READ_ONCE(line->debounce_period_us) != 0;
+}
+
+static void line_set_debounce_period(struct line *line,
+				     unsigned int debounce_period_us)
+{
+	bool was_suppl = line_is_supplemental(line);
+
+	WRITE_ONCE(line->debounce_period_us, debounce_period_us);
+
+	if (line_is_supplemental(line) == was_suppl)
+		return;
+
+	if (was_suppl)
+		supinfo_erase(line);
+	else
+		supinfo_insert(line);
+}
+
 #define GPIO_V2_LINE_BIAS_FLAGS \
 	(GPIO_V2_LINE_FLAG_BIAS_PULL_UP | \
 	 GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN | \
@@ -723,7 +846,7 @@ static enum hte_return process_hw_ts(struct hte_ts_data *ts, void *p)
 		line->total_discard_seq++;
 		line->last_seqno = ts->seq;
 		mod_delayed_work(system_wq, &line->work,
-		  usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
+		  usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
 	} else {
 		if (unlikely(ts->seq < line->line_seqno))
 			return HTE_CB_HANDLED;
@@ -864,7 +987,7 @@ static irqreturn_t debounce_irq_handler(int irq, void *p)
 	struct line *line = p;
 
 	mod_delayed_work(system_wq, &line->work,
-		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
+		usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
 
 	return IRQ_HANDLED;
 }
@@ -946,7 +1069,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 	/* try hardware */
 	ret = gpiod_set_debounce(line->desc, debounce_period_us);
 	if (!ret) {
-		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		line_set_debounce_period(line, debounce_period_us);
 		return ret;
 	}
 	if (ret != -ENOTSUPP)
@@ -1025,8 +1148,7 @@ static void edge_detector_stop(struct line *line)
 	cancel_delayed_work_sync(&line->work);
 	WRITE_ONCE(line->sw_debounced, 0);
 	WRITE_ONCE(line->edflags, 0);
-	if (line->desc)
-		WRITE_ONCE(line->desc->debounce_period_us, 0);
+	line_set_debounce_period(line, 0);
 	/* do not change line->level - see comment in debounced_value() */
 }
 
@@ -1051,7 +1173,7 @@ static int edge_detector_setup(struct line *line,
 		ret = debounce_setup(line, debounce_period_us);
 		if (ret)
 			return ret;
-		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		line_set_debounce_period(line, debounce_period_us);
 	}
 
 	/* detection disabled or sw debouncer will provide edge detection */
@@ -1093,12 +1215,12 @@ static int edge_detector_update(struct line *line,
 			gpio_v2_line_config_debounce_period(lc, line_idx);
 
 	if ((active_edflags == edflags) &&
-	    (READ_ONCE(line->desc->debounce_period_us) == debounce_period_us))
+	    (READ_ONCE(line->debounce_period_us) == debounce_period_us))
 		return 0;
 
 	/* sw debounced and still will be...*/
 	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
-		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		line_set_debounce_period(line, debounce_period_us);
 		return 0;
 	}
 
@@ -1573,6 +1695,7 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 
 static void linereq_free(struct linereq *lr)
 {
+	struct line *line;
 	unsigned int i;
 
 	if (lr->device_unregistered_nb.notifier_call)
@@ -1580,9 +1703,12 @@ static void linereq_free(struct linereq *lr)
 						   &lr->device_unregistered_nb);
 
 	for (i = 0; i < lr->num_lines; i++) {
-		if (lr->lines[i].desc) {
-			edge_detector_stop(&lr->lines[i]);
-			gpiod_free(lr->lines[i].desc);
+		line = &lr->lines[i];
+		if (line->desc) {
+			edge_detector_stop(line);
+			if (line_is_supplemental(line))
+				supinfo_erase(line);
+			gpiod_free(line->desc);
 		}
 	}
 	kfifo_free(&lr->events);
@@ -2274,8 +2400,6 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
-	u32 debounce_period_us;
-	unsigned int num_attrs = 0;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -2341,14 +2465,6 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	else if (test_bit(FLAG_EVENT_CLOCK_HTE, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
 
-	debounce_period_us = READ_ONCE(desc->debounce_period_us);
-	if (debounce_period_us) {
-		info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
-		info->attrs[num_attrs].debounce_period_us = debounce_period_us;
-		num_attrs++;
-	}
-	info->num_attrs = num_attrs;
-
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
@@ -2455,6 +2571,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 	gpio_desc_to_lineinfo(desc, &lineinfo);
+	supinfo_to_lineinfo(desc, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 		if (watch)
@@ -2545,6 +2662,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	chg.event_type = action;
 	chg.timestamp_ns = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
+	supinfo_to_lineinfo(desc, &chg.info);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
 	if (ret)
@@ -2812,3 +2930,10 @@ void gpiolib_cdev_unregister(struct gpio_device *gdev)
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
+
+static int __init gpiolib_cdev_init(void)
+{
+	supinfo_init();
+	return 0;
+}
+postcore_initcall(gpiolib_cdev_init);
-- 
2.39.2


