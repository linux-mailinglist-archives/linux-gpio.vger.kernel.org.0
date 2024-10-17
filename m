Return-Path: <linux-gpio+bounces-11505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A69A1CCF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF7B1F22CB2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB461D47A3;
	Thu, 17 Oct 2024 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oVGZizqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53DD1D2B28
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152871; cv=none; b=HLdRnY+tjZc0fmWFOkJ08FWo0xTB7N2tLSiyh2Jo0kgc9fRltFQn2ZOf06AUSDLD7k2zijTC3oIN1wwvjl/0ONapIt53L64aEgtOQ7AimQ8KwTsFa7eNu9XgdfaYzg5kbsVhczTRPZpPcx63LVRtgOa5w/qNkbphKRH1HHFVc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152871; c=relaxed/simple;
	bh=Y6ydoHY2HpsK8/L2hWNEthXCW5yOTtkkUFG5ZyOBLHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZgBcBeoJpIokLA/1q5B1YbtDsky3r/a/tddIO60tnGvU8kz5s311ZSH+e0Degy6p5GXozkYoCWYJIGlu2uap1qMrzQ11TD7v7hWglptghST++Jr3Qnw2R07xhksjxYPTaC0Txy6NtCGR09U5Ra56FejQ1NerUnLmqtnvyVsX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oVGZizqc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so457790f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152867; x=1729757667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNIOspkDRS2AyiERRhXLD4LKdJKYWTfCk5EQAGqlBPE=;
        b=oVGZizqcMvhNFuR8H+vxWgItECEt8lFof9lD655kNGA0lFurz6GLlUScRfYHzDUX/K
         BQOiznU4cmpd9nx2EzydciBaWAPOeLGZF/+Ri5CUkum8xBma+cLCEWTH8UsyrJbHzWkQ
         mGu/0IoGwxPpDTpubpOhaQ04WonX9Yy/Ut8+ePT9MKdT5IpE5Tx3Dth6Mu8Uo7thjn34
         nKl3YOJwAE4bW2/D8bIliP+D3cswmKnIsL+oWCfP8fDZgGCuWavobdGr7h4BlY5hDk+p
         qi39Pg8OUDJldQ+CYaV+XN3hNzgvRzAoD4PtE/8scRAQTp63QUj5g/WvRcqyu3rrRczM
         0knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152867; x=1729757667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNIOspkDRS2AyiERRhXLD4LKdJKYWTfCk5EQAGqlBPE=;
        b=TeyMoWGzLqJDecnT4pm9iArhAW1KPwB/dqA5rLf2z1mOP3m8+5tE94FH5y9+8XVtMv
         bZdNJ1qeNZ5DlHYJEDTIJW8UfrpsYM/S3cvX7F+61RNSHA+BC2lfrQiHU3QCvyxx7kRi
         OjoEW+PuCviVlpNgciN4gi969lyOtFgEF5fGQsvAMKw4PL5lOr7LX8Yo9VDU8C/Qk4UG
         XQ/xijiRPqa3IxR+O5NDbinT4pprZgWD84Gi3xXgYhWAqBcSE0zuLeX/UX43v23+nmys
         uZf5umceHea+RvKu30LUs0QC5hBbhr7le3Z57NGg3mO0d3fSq0urPtBX9Q5Z0Tp0OTFW
         +ykA==
X-Gm-Message-State: AOJu0YzOEJ+YvIYU3aOvgoUgjQ1SirN7PF7GzzQt80qpsD9evLOS98Vh
	V3rkGp4xqkCeCZju9Rx6v4sCQCJDdCVDWF/hI/UCxJJnCM7LyaRVbgM3kgO0s+0=
X-Google-Smtp-Source: AGHT+IGKMPPopBXB9GhVXxjvwJjItMobARzH/XoVpj9q9lAkKZYlkf9r8FM1HiK3YV1xwZQfGSZ5hQ==
X-Received: by 2002:a5d:568b:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-37d55262d47mr14631834f8f.46.1729152866922;
        Thu, 17 Oct 2024 01:14:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:11 +0200
Subject: [PATCH v4 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13582;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KMwpLTqbSzLk7Bonso7QQ+aG3uhStA029vtPSa2jEoU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMdcUCX63EqaIQF3Z3mJ2qQ2vpwPcLZytM4yg
 Zq4Y+3QCMGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXAAKCRARpy6gFHHX
 crZ9EACU9+UlQirlcChF/kdVJMRhR4PDrxEGPOfJEZWLIdZc8TMu4RtbphFZWPOQGhhIuMUo0aZ
 2S78hiEN4ZthdjueBUB/IAcFQ/K488WzSsFvOlpKNr9N3soolGRIRtbbxyNYLgiD8xobIIZ0zZM
 2nqU75vS3DjO440Fn2JWJzgTp9qBHFk0cE1cknH9+C+yWyv3mnMnLKJ3Fycxa+mCIzgT3oOAIlt
 YN+IJak0Dem8ghjWkHcc8mR3K4T8WgO+35P5ah+AWa75ikGmod4Ozz07xnmwedV+IQz1yeywgfU
 gWDYnVV4QGWsPrGIYRdXQwwH3NKntqWr59q9ks5RZ6j3xJU1+NHSacT1Psicn29AAWqBIi9aFLc
 z3c644Sj1LVnpMGBT5FjaGQfxZONw2FZsXAIuv5ZxwI/e+P8i62ezTb33aTbgY1MmQYDf9ywH8L
 lyIfiL3qO+L5bT5jg6zGW44THYh9solO0Nl8olDB430uMdEphG/V6MSsp3Z9oU/680D+mEnrddx
 dvpse1gTsx4RD7p6us5wlW3e396DKIX6IfjysUNRz47yX53cbb+RcGvrM68WKRyvzZDv4UYP8LT
 J6wm31RQf82tt8vFlXe9IUulaQ6Me+R75HqMbHxFXzFiYl5PhdNXthc3IHxszYXPPlJMtPkf3kh
 NeuP6oFOJ6ZJI8Q==
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


