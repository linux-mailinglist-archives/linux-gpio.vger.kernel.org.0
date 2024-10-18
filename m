Return-Path: <linux-gpio+bounces-11609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE739A3984
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D19A1C2406D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854FD19004B;
	Fri, 18 Oct 2024 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SwJTnMK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6819066D
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242629; cv=none; b=O9aVlq9PMuP7NDTmU22IjUzVwkcgZWMUSi9eO5G5h2zo3aClM++8o7P3rP8Zl6y9YP8ym/LER5ueHlsVumMBGccNCVjvKcJGUPk/gnJJxPEhMoAwgg5SqTTWdq9TT6bD57tFKSicFEmZ1Wbw1fdL6O6/GvFP7GcleIq/PxbwiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242629; c=relaxed/simple;
	bh=Y6ydoHY2HpsK8/L2hWNEthXCW5yOTtkkUFG5ZyOBLHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5N71NdVtp/NetaKLoSKHMtdCPGYLDIvmQfEsszelXDoLMpfyHU6x8xHGwy24xeiHUjxXmozDa1xrmnehLng8uonu1+mh+7opay2tHbhU0M1jFMnMynleF/HmMzagZiOxiN7DX93TgRbvSEoEs2PcIbZat4HrYGoihYJDpvbPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SwJTnMK9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e690479cso2152881e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729242625; x=1729847425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNIOspkDRS2AyiERRhXLD4LKdJKYWTfCk5EQAGqlBPE=;
        b=SwJTnMK9GCVVi2urUKXFUxH6dU86hoBallKMPRIyp5lkPST9Bx2w5Ufzytk+1zDFQE
         4rYqI3gTSVwOY4W3WPwP1f1ug0ZweaYVdKJtYfHhXJ8XWjw+9zbb7SLxnnhmgVNcu0Qk
         nEv/iKStu6aT5ez6yr0zlDqXqlxPT7SZUsmLCHOMFVj2E1ix3+cnLV8xBdW47XHh4FjG
         omPtJ/87P780/DP6ftSmKf3YhrO9WsD1jc+ZFiVAYmg9cEHiEyAERCTlWYM6wxkG18We
         6kyX4zLWKpcuQQ4X7Uub2PIN3DkjPP8Erv1fnRU1T/aTD0rqGn3STiKPPAZKydO9Tu3l
         toHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242625; x=1729847425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNIOspkDRS2AyiERRhXLD4LKdJKYWTfCk5EQAGqlBPE=;
        b=wh+AsMAWawbxdUV66rGsam/In0mdsmVPlzPcN7tu5QxxTO0pCN7wuE9sDtRwzEpp3H
         vYp4xq0InhNGz1jMy/ewfbYe6FiuI+FqIPDaFygYmUeFxCY6qGae4RXEX/hB1OLPzSNI
         sbFf9Arlzq1I2w16YBoffQbj3lPffweRnmmNHPc/WKrFRw9c5UZCd3CDjhfN5wq8bBom
         ODycANPBRRhUn4du8d6Ua75LZ2gGN4pXcZKwAuWP7HlO/tABpqfOTZpenHa3n35V9HSo
         DXEVLJVEjC4U7+e5G297S11FHg35ngYP3AycUWpfIPQWpEjolnqwiLFdpbWi9rplAo+Z
         tt4A==
X-Gm-Message-State: AOJu0YzY5KDoqU0UPOi9xc+o7fLoXHmoR49Jkkv8Av43di9+2A2PB05D
	cp7BH5xFsnVLhd2c8sbtRXAJuR7txBIQGoFlby3TvvTKYOJhhQZrXA2ubbuLgvT/j3mUK5v5Ao6
	5
X-Google-Smtp-Source: AGHT+IG9lDr7420PifdaZORYUPCkkifw/UqTKWLCb1V9LIKLZap4dBL495YpWfETodO3++FTjOGugA==
X-Received: by 2002:a05:6512:108f:b0:538:9e40:94b with SMTP id 2adb3069b0e04-53a1546c877mr1068202e87.19.1729242624865;
        Fri, 18 Oct 2024 02:10:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe76bsm18700455e9.10.2024.10.18.02.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:10:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 11:10:11 +0200
Subject: [PATCH v5 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-gpio-notify-in-kernel-events-v5-3-c79135e58a1c@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13582;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KMwpLTqbSzLk7Bonso7QQ+aG3uhStA029vtPSa2jEoU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEiX6IzJTOuYbONcHyrBCFHVgpJd3a/0FaltnG
 268oSgDitCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxIl+gAKCRARpy6gFHHX
 crw0D/46uyZzdn87PjkdoBPDF+HFpXlUofAy/WuVwbjo+7rdY3i0MYj2KcoX3OnsF7nGyRooads
 RBYGHo7EtGwuGR4O7+T/ljU/ExDLYOCJpBL/b0wvjftUo8adDqpDEHAhhfN65ToKVIpTq9OfMCt
 3e6FaD6sM2jEeR6PwztBo2hhPhqeT2teqUKqHhRm6rQ0ItHIJcw3Y41xya3sHwXfmYBW5TVel1s
 Qxrom8EIcNpwPqk+Y0ZG2l+OPtz2T2ExuyxWenFsxLPULzFAjEsHaIBzbLaoj7GXf56cPEvyv8W
 rVVTUt64jTrYAYwkLrIq0dgs0nchdsmesOEAmI6wnjVC8uEYX6GfU/6HsqKI1QTl0i7wfdZatqy
 psFJ79cTVMI0atsInmeZoBpw0y6wOLII48v0suTyX4OiZjk8NhAlChGZZZIIfTpf0KCANK8xa4H
 ujdQlAmrxduMbDUGElWJM6JrI2SmhHFw1R04ssiCOibvNV1TM20UNNB48b6MFF9jZUg7Qu1//NW
 aGe7k7u38cxl8Pp0gGIzD21W6L4UItJccYJTWOnDoPo7c1QejkVomUi5rnaWUQt0J9aF7PFl6E8
 pudRa+lxOjgPKnJDIkAnfq9hgTUhLStqrh2/nGfMFk2idEIN1LvJXtacZVk3scIvLUwNVA/g6t7
 yLnn5rR0eNTm6+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This effectively reverts commits 9344e34e7992 ("gpiolib: cdev: relocate
debounce_period_us from struct gpio_desc") and d8543cbaf979 ("gpiolib:
remove debounce_period_us from struct gpio_desc") and goes back to
storing the debounce period in microseconds in the GPIO descriptor

We're doing it in preparation for notifying the user-space about
in-kernel line config changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 163 ++++++--------------------------------------
 drivers/gpio/gpiolib.c      |  18 ++++-
 drivers/gpio/gpiolib.h      |   5 ++
 3 files changed, 43 insertions(+), 143 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b0050250ac3a..d55d2a246d41 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -23,7 +23,6 @@
 #include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
-#include <linux/rbtree.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/timekeeping.h>
@@ -421,7 +420,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 /**
  * struct line - contains the state of a requested line
- * @node: to store the object in supinfo_tree if supplemental
  * @desc: the GPIO descriptor for this line.
  * @req: the corresponding line request
  * @irq: the interrupt triggered in response to events on this GPIO
@@ -434,7 +432,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @line_seqno: the seqno for the current edge event in the sequence of
  * events for this line.
  * @work: the worker that implements software debouncing
- * @debounce_period_us: the debounce period in microseconds
  * @sw_debounced: flag indicating if the software debouncer is active
  * @level: the current debounced physical level of the line
  * @hdesc: the Hardware Timestamp Engine (HTE) descriptor
@@ -443,7 +440,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @last_seqno: the last sequence number before debounce period expires
  */
 struct line {
-	struct rb_node node;
 	struct gpio_desc *desc;
 	/*
 	 * -- edge detector specific fields --
@@ -477,15 +473,6 @@ struct line {
 	 * -- debouncer specific fields --
 	 */
 	struct delayed_work work;
-	/*
-	 * debounce_period_us is accessed by debounce_irq_handler() and
-	 * process_hw_ts() which are disabled when modified by
-	 * debounce_setup(), edge_detector_setup() or edge_detector_stop()
-	 * or can live with a stale version when updated by
-	 * edge_detector_update().
-	 * The modifying functions are themselves mutually exclusive.
-	 */
-	unsigned int debounce_period_us;
 	/*
 	 * sw_debounce is accessed by linereq_set_config(), which is the
 	 * only setter, and linereq_get_values(), which can live with a
@@ -518,17 +505,6 @@ struct line {
 #endif /* CONFIG_HTE */
 };
 
-/*
- * a rbtree of the struct lines containing supplemental info.
- * Used to populate gpio_v2_line_info with cdev specific fields not contained
- * in the struct gpio_desc.
- * A line is determined to contain supplemental information by
- * line_has_supinfo().
- */
-static struct rb_root supinfo_tree = RB_ROOT;
-/* covers supinfo_tree */
-static DEFINE_SPINLOCK(supinfo_lock);
-
 /**
  * struct linereq - contains the state of a userspace line request
  * @gdev: the GPIO device the line request pertains to
@@ -542,8 +518,7 @@ static DEFINE_SPINLOCK(supinfo_lock);
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
  * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
- * of configuration, particularly multi-step accesses to desc flags and
- * changes to supinfo status.
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -559,103 +534,6 @@ struct linereq {
 	struct line lines[] __counted_by(num_lines);
 };
 
-static void supinfo_insert(struct line *line)
-{
-	struct rb_node **new = &(supinfo_tree.rb_node), *parent = NULL;
-	struct line *entry;
-
-	guard(spinlock)(&supinfo_lock);
-
-	while (*new) {
-		entry = container_of(*new, struct line, node);
-
-		parent = *new;
-		if (line->desc < entry->desc) {
-			new = &((*new)->rb_left);
-		} else if (line->desc > entry->desc) {
-			new = &((*new)->rb_right);
-		} else {
-			/* this should never happen */
-			WARN(1, "duplicate line inserted");
-			return;
-		}
-	}
-
-	rb_link_node(&line->node, parent, new);
-	rb_insert_color(&line->node, &supinfo_tree);
-}
-
-static void supinfo_erase(struct line *line)
-{
-	guard(spinlock)(&supinfo_lock);
-
-	rb_erase(&line->node, &supinfo_tree);
-}
-
-static struct line *supinfo_find(struct gpio_desc *desc)
-{
-	struct rb_node *node = supinfo_tree.rb_node;
-	struct line *line;
-
-	while (node) {
-		line = container_of(node, struct line, node);
-		if (desc < line->desc)
-			node = node->rb_left;
-		else if (desc > line->desc)
-			node = node->rb_right;
-		else
-			return line;
-	}
-	return NULL;
-}
-
-static void supinfo_to_lineinfo(struct gpio_desc *desc,
-				struct gpio_v2_line_info *info)
-{
-	struct gpio_v2_line_attribute *attr;
-	struct line *line;
-
-	guard(spinlock)(&supinfo_lock);
-
-	line = supinfo_find(desc);
-	if (!line)
-		return;
-
-	attr = &info->attrs[info->num_attrs];
-	attr->id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
-	attr->debounce_period_us = READ_ONCE(line->debounce_period_us);
-	info->num_attrs++;
-}
-
-static inline bool line_has_supinfo(struct line *line)
-{
-	return READ_ONCE(line->debounce_period_us);
-}
-
-/*
- * Checks line_has_supinfo() before and after the change to avoid unnecessary
- * supinfo_tree access.
- * Called indirectly by linereq_create() or linereq_set_config() so line
- * is already protected from concurrent changes.
- */
-static void line_set_debounce_period(struct line *line,
-				     unsigned int debounce_period_us)
-{
-	bool was_suppl = line_has_supinfo(line);
-
-	WRITE_ONCE(line->debounce_period_us, debounce_period_us);
-
-	/* if supinfo status is unchanged then we're done */
-	if (line_has_supinfo(line) == was_suppl)
-		return;
-
-	/* supinfo status has changed, so update the tree */
-	if (was_suppl)
-		supinfo_erase(line);
-	else
-		supinfo_insert(line);
-}
-
 #define GPIO_V2_LINE_BIAS_FLAGS \
 	(GPIO_V2_LINE_FLAG_BIAS_PULL_UP | \
 	 GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN | \
@@ -823,7 +701,7 @@ static enum hte_return process_hw_ts(struct hte_ts_data *ts, void *p)
 		line->total_discard_seq++;
 		line->last_seqno = ts->seq;
 		mod_delayed_work(system_wq, &line->work,
-		  usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
+		  usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 	} else {
 		if (unlikely(ts->seq < line->line_seqno))
 			return HTE_CB_HANDLED;
@@ -964,7 +842,7 @@ static irqreturn_t debounce_irq_handler(int irq, void *p)
 	struct line *line = p;
 
 	mod_delayed_work(system_wq, &line->work,
-		usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
+		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 
 	return IRQ_HANDLED;
 }
@@ -1047,7 +925,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 	/* try hardware */
 	ret = gpiod_set_debounce(line->desc, debounce_period_us);
 	if (!ret) {
-		line_set_debounce_period(line, debounce_period_us);
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
 		return ret;
 	}
 	if (ret != -ENOTSUPP)
@@ -1132,7 +1010,8 @@ static void edge_detector_stop(struct line *line)
 	cancel_delayed_work_sync(&line->work);
 	WRITE_ONCE(line->sw_debounced, 0);
 	WRITE_ONCE(line->edflags, 0);
-	line_set_debounce_period(line, 0);
+	if (line->desc)
+		WRITE_ONCE(line->desc->debounce_period_us, 0);
 	/* do not change line->level - see comment in debounced_value() */
 }
 
@@ -1165,7 +1044,7 @@ static int edge_detector_setup(struct line *line,
 		ret = debounce_setup(line, debounce_period_us);
 		if (ret)
 			return ret;
-		line_set_debounce_period(line, debounce_period_us);
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
 	}
 
 	/* detection disabled or sw debouncer will provide edge detection */
@@ -1213,12 +1092,12 @@ static int edge_detector_update(struct line *line,
 			gpio_v2_line_config_debounce_period(lc, line_idx);
 
 	if ((active_edflags == edflags) &&
-	    (READ_ONCE(line->debounce_period_us) == debounce_period_us))
+	    (READ_ONCE(line->desc->debounce_period_us) == debounce_period_us))
 		return 0;
 
 	/* sw debounced and still will be...*/
 	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
-		line_set_debounce_period(line, debounce_period_us);
+		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
 		/*
 		 * ensure event fifo is initialised if edge detection
 		 * is now enabled.
@@ -1677,7 +1556,6 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 
 static void linereq_free(struct linereq *lr)
 {
-	struct line *line;
 	unsigned int i;
 
 	if (lr->device_unregistered_nb.notifier_call)
@@ -1685,14 +1563,10 @@ static void linereq_free(struct linereq *lr)
 						   &lr->device_unregistered_nb);
 
 	for (i = 0; i < lr->num_lines; i++) {
-		line = &lr->lines[i];
-		if (!line->desc)
-			continue;
-
-		edge_detector_stop(line);
-		if (line_has_supinfo(line))
-			supinfo_erase(line);
-		gpiod_free(line->desc);
+		if (lr->lines[i].desc) {
+			edge_detector_stop(&lr->lines[i]);
+			gpiod_free(lr->lines[i].desc);
+		}
 	}
 	kfifo_free(&lr->events);
 	kfree(lr->label);
@@ -2363,6 +2237,7 @@ static void gpio_v2_line_info_changed_to_v1(
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpio_v2_line_info *info)
 {
+	u32 debounce_period_us;
 	unsigned long dflags;
 	const char *label;
 
@@ -2435,6 +2310,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 	else if (test_bit(FLAG_EVENT_CLOCK_HTE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
+
+	debounce_period_us = READ_ONCE(desc->debounce_period_us);
+	if (debounce_period_us) {
+		info->attrs[info->num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		info->attrs[info->num_attrs].debounce_period_us =
+							debounce_period_us;
+		info->num_attrs++;
+	}
 }
 
 struct gpio_chardev_data {
@@ -2540,7 +2423,6 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 	gpio_desc_to_lineinfo(desc, &lineinfo);
-	supinfo_to_lineinfo(desc, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 		if (watch)
@@ -2633,7 +2515,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	chg.event_type = action;
 	chg.timestamp_ns = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
-	supinfo_to_lineinfo(desc, &chg.info);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
 	if (ret)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b1ce213d3a23..807bee86afd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2432,7 +2432,9 @@ static void gpiod_free_commit(struct gpio_desc *desc)
 #endif
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
-
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
+#endif
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }
@@ -2564,6 +2566,8 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 
 static int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
+	int ret;
+
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
 		return -ENODEV;
@@ -2571,7 +2575,17 @@ static int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 	if (!guard.gc->set_config)
 		return -ENOTSUPP;
 
-	return guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+#ifdef CONFIG_GPIO_CDEV
+	/*
+	 * Special case - if we're setting debounce period, we need to store
+	 * it in the descriptor in case user-space wants to know it.
+	 */
+	if (!ret && pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
+		WRITE_ONCE(desc->debounce_period_us,
+			   pinconf_to_config_argument(config));
+#endif
+	return ret;
 }
 
 static int gpio_set_config_with_argument(struct gpio_desc *desc,
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 067197d61d57..8daba06eb472 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -165,6 +165,7 @@ struct gpio_desc_label {
  * @label:		Name of the consumer
  * @name:		Line name
  * @hog:		Pointer to the device node that hogs this line (if any)
+ * @debounce_period_us:	Debounce period in microseconds
  *
  * These are obtained using gpiod_get() and are preferable to the old
  * integer-based handles.
@@ -202,6 +203,10 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+#ifdef CONFIG_GPIO_CDEV
+	/* debounce period in microseconds */
+	unsigned int		debounce_period_us;
+#endif
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)

-- 
2.43.0


