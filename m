Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAD4257237
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHaDXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgHaDXI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:23:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAF9C061573;
        Sun, 30 Aug 2020 20:23:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id g6so2267799pjl.0;
        Sun, 30 Aug 2020 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQjtjNn+o4n35tyxinGfLLqiIK7QPsodcHqGHhteAow=;
        b=rMv1YBqUjVTcPwofeKqOa22PV61G5+E3ym5xM2gMom4XdPqNwvaj9Syv3AxSto3UV3
         cdynGi1rQeJEYibF1PF/cmAa78kh4J5k4PpBkksdXPlb/c0DUyH+nlj052bsNTZU1fRQ
         L+9al72SV9pEXhwAiAHIMRePk3Rqaor2G+/2YKy+ScjpOLgSlaeKFWIySCtsGCSzwB8i
         1ElgZm39cMUJUk8svBKduxdWKcMe4k0imVAUn1FdvSZmhR+JiIOYYibiKzAAuU83m4hW
         DZ48ozTwc5+iXcEccQYInETIb+X0zQ4IltjDQ8EhMFAyb/qiigQGSL3szkq5JXo3EyEG
         8G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQjtjNn+o4n35tyxinGfLLqiIK7QPsodcHqGHhteAow=;
        b=WUZGOfH2akNVUD1eYhs0DLr4eOEwWrx92P8ciHQ8zxZWg3A/3aOvScsTOktI13UOPy
         CkhSJNihy0WYJYUz5HMYwzld7N6DRCzSwAR76ibA8F33VNmvnW/KmbmRW2W3R4nOcQrD
         ULryyS0SBhTHtYm9ZRaI/HUj0pPC4oPS11/9XNhisC3aPP5p2JEuhTa8hbYp+bJPofiA
         3wgb4v4yYS17hByafKE6pdEe16OrxxWFvH79LbeSI3x/hj3W579gEToT3Zv9B0mdKuf9
         s39gmA0xFiD5V2CtQO9J8oMOdGe4vZl5NNwFEMD5wSCRw3OiEjBspqP+VXvE8GJxLtsg
         K6lg==
X-Gm-Message-State: AOAM530QzZPPGYJCe3N+JeD4RyUzJQ2+yuirZVaaLyJinGJ/CJHpS85+
        sER8NMjn3xc/SA3rskxEZP6nSCZhZAk=
X-Google-Smtp-Source: ABdhPJxI7oakMz7wpV4O5+kEIc1KOTvPwBNwxRLwlIMA57s22UNyUnPNbENYFaNIUAgfAc7gIPObGg==
X-Received: by 2002:a17:90a:2e0f:: with SMTP id q15mr8999492pjd.49.1598844181581;
        Sun, 30 Aug 2020 20:23:01 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:23:00 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Mon, 31 Aug 2020 11:19:56 +0800
Message-Id: <20200831032006.1019978-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
line set config ioctl.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 904216a67ed1..936b8c9958dd 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
 #include <linux/spinlock.h>
@@ -424,6 +425,8 @@ struct line {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -434,6 +437,7 @@ struct linereq {
 	u32 event_buffer_size;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct line lines[];
 };
 
@@ -541,6 +545,8 @@ static void edge_detector_stop(struct line *line)
 		free_irq(line->irq, line);
 		line->irq = 0;
 	}
+
+	line->eflags = 0;
 }
 
 static int edge_detector_setup(struct line *line,
@@ -582,6 +588,17 @@ static int edge_detector_setup(struct line *line,
 	return 0;
 }
 
+static int edge_detector_update(struct line *line, u64 eflags,
+				bool polarity_change)
+{
+	if ((line->eflags == eflags) && !polarity_change)
+		return 0;
+
+	edge_detector_stop(line);
+
+	return edge_detector_setup(line, eflags);
+}
+
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
 				     unsigned int line_idx)
 {
@@ -760,6 +777,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	return 0;
 }
 
+static long linereq_set_config_unlocked(struct linereq *lr,
+					struct gpio_v2_line_config *lc)
+{
+	struct gpio_desc *desc;
+	unsigned int i;
+	u64 flags;
+	bool polarity_change;
+	int ret;
+
+	for (i = 0; i < lr->num_lines; i++) {
+		desc = lr->lines[i].desc;
+		flags = gpio_v2_line_config_flags(lc, i);
+		polarity_change =
+			(test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
+			 ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
+
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
+			int val = gpio_v2_line_config_output_value(lc, i);
+
+			edge_detector_stop(&lr->lines[i]);
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				return ret;
+
+			ret = edge_detector_update(&lr->lines[i],
+					flags & GPIO_V2_LINE_EDGE_FLAGS,
+					polarity_change);
+			if (ret)
+				return ret;
+		}
+
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIO_V2_LINE_CHANGED_CONFIG,
+					     desc);
+	}
+	return 0;
+}
+
+static long linereq_set_config(struct linereq *lr, void __user *ip)
+{
+	struct gpio_v2_line_config lc;
+	int ret;
+
+	if (copy_from_user(&lc, ip, sizeof(lc)))
+		return -EFAULT;
+
+	ret = gpio_v2_line_config_validate(&lc, lr->num_lines);
+	if (ret)
+		return ret;
+
+	mutex_lock(&lr->config_mutex);
+
+	ret = linereq_set_config_unlocked(lr, &lc);
+
+	mutex_unlock(&lr->config_mutex);
+
+	return ret;
+}
+
 static long linereq_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -768,6 +853,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -928,6 +1015,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
-- 
2.28.0

