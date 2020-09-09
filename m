Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964A3262D3A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgIIKcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgIIK2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660FDC061755;
        Wed,  9 Sep 2020 03:28:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1107362pjh.5;
        Wed, 09 Sep 2020 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7TeNCaqKSTnyTuX6BFVWPl+Bs6Hb/F7xQb/M0LayZzI=;
        b=uXCoDRRQrUUfSf2PSAElvpPeGpgfooWrxzGgD6QfjBMFvBqVnXizfXXmirhbT53M9d
         otUBpCruPhaLf7hIYylJ1ffsdeUHE+wLUwN21Yh/64tEiO7LsNYEjEfGsWc96RK5CLRj
         M8Vfj+u4EPAQVAlupENSLngW2Tty+fF1ESHAOCokxlKm/CAZ4KM9AGaEalnazzonvvQX
         7ntXMAO4+hQ1BM3zblkhnj6jwTfeM/OazJI9n5cpMBSFnB/wTgSvJPBW0kK99cU+a5vv
         qjrENTXwK1IkicUjChWbEE56Txweu2j9CYRSiweesCo0sG8LGfTVBvZqJRA8q0xEf0vt
         qenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7TeNCaqKSTnyTuX6BFVWPl+Bs6Hb/F7xQb/M0LayZzI=;
        b=jhZ8GQygG/kwXn+5PM+VEnjI/9aBQWpB+6d+5zTDH+HpUlLdtCWFc0OHSQekrA0+Wk
         fLYiU0SVIPgX0zw9BPgKtbF7/jNZHCJZLeppApgN+Zycp8PP/8W2iqdcG+gXIVpkAFjU
         zj/rsW0P+e0rYWFgp+GC3aiDT/Ks099eJ8GnZ1U6O6Ze1FURStArA8W9M6LMBhynb9FZ
         t0ztXQiFTX+u0dROWPitqYYGOqKn97qIpCq+we8u8qY7vS6Sfv5kP2NVXYIqsH0Vh5Gj
         2LQhrXP17GilKDF3snBFmv53IP+zZ3micwfiAVXA4EmVX/wrCUpVHL5KmrT4C28i6Kl+
         T/1Q==
X-Gm-Message-State: AOAM532A6W+c9Q2tkmDxDCW99EcK8ubC/vfYGRwXM0K6wcWhZ2QBOoNn
        90OJ5zjdEr13YnZ7FyX9JYy6yMmwj+w=
X-Google-Smtp-Source: ABdhPJzdMhsE6hVODyQVVz+99RTzyTTZ6j4of5UIyD1NcR1V9JOQtqwKBii2s3yF8O9/lJiWmSh5tw==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr232651pjn.119.1599647294126;
        Wed, 09 Sep 2020 03:28:14 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Wed,  9 Sep 2020 18:26:30 +0800
Message-Id: <20200909102640.1657622-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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
index 7161c8921298..b6da92d9dba1 100644
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
@@ -762,6 +779,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -770,6 +855,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -930,6 +1017,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
-- 
2.28.0

