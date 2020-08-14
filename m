Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76792443C2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgHNDEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:04:44 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA52C061757;
        Thu, 13 Aug 2020 20:04:44 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d19so3831989pgl.10;
        Thu, 13 Aug 2020 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8MdEP1TURqiymzpiwzLI7qTGkDqV1DsGXdBMPVzZSfs=;
        b=tDDVWvGAEuXrV8THptJOrsC5ZdDjVPJFLEeizzI0ntrW2raKdA+RsyZMeeOrhlQdkK
         oe1iHDwIJ0jkT3AiITzBGGNsoWDefx+aqxBK9tcH0GWgidyuA7ltLZ/yqaG/GqiuvHrg
         nSsH2Zl1mlfBP8PWsGX+NiNg6bL+mTvFytvURJqQvQ41q4dKqCNPKQOqnNPFphMKlkjH
         reQmgTMqfI5Wn2vLqOnezSaOUUQHvYHknLgrB19nfEX34F3jaBOgsTepybjyVSoQDzzi
         6w0JuzyuQ8Axv1usUA9Vonyuk+CvKxXoWSJUs0Nq4757EmwJmIEMHge56AaQFf9xMulu
         4nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8MdEP1TURqiymzpiwzLI7qTGkDqV1DsGXdBMPVzZSfs=;
        b=W++n+CPK0e6Elu0SwE2J5mYbflC+QQPlJXz7rch3MYxLe7KqKvbZBrxgHQ6aSgSSiq
         GCBfCUrYBUunCnS9adQIzKoNEHWlx7YYCoX80QzI8xq5rOm2JZtcEiZ+nRaaGY6IU8Wf
         EXR8xD51gsfMCLzBGz1TdusfsztdLFNKhaQt6LjEpC06+KA5WbZsWdlmT6WR7J9Qyza6
         9bUb5u+K0FN1E7DIyXxLlY4IhuqXDP+g3UNasTO+gqxumjF0/iLrQCVj8oz+Ws5hnIae
         rnzsJXIQz+oqcy9r0i4mLk7dkhMewObcNP0IhugO1zB1lSpBEUkZAlUH0XvJH5qonnFL
         xCOw==
X-Gm-Message-State: AOAM532+TJ182+nyZLyV+B+6zzEKit4neeY0XkEGSqhzv8ZIPwe/erpV
        ENar1hABVvfZUEuzTf/xoN44HqwI
X-Google-Smtp-Source: ABdhPJyqjlGoSm7zqfCEYRZKoRX8FlfRlIw9idsScYmZnkK+yIdYKVkI9dn/FAbBS/SbczDhGnKxcg==
X-Received: by 2002:aa7:93ad:: with SMTP id x13mr316554pff.33.1597374284123;
        Thu, 13 Aug 2020 20:04:44 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:04:43 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Fri, 14 Aug 2020 11:02:47 +0800
Message-Id: <20200814030257.135463-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1d42a01f5414..04472c2b6678 100644
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
@@ -418,6 +419,8 @@ struct edge_detector {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_descs is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @edets: an array of edge detectors, of size @num_descs
  * @descs: the GPIO descriptors held by this line request, with @num_descs
  * elements.
@@ -429,6 +432,7 @@ struct line {
 	wait_queue_head_t wait;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct edge_detector *edets;
 	struct gpio_desc *descs[];
 };
@@ -703,6 +707,30 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
+static int gpio_v2_line_config_change_validate(struct line *line,
+					       struct gpio_v2_line_config *lc)
+{
+	int i;
+	u64 flags;
+	struct gpio_desc *desc;
+
+	for (i = 0; i < line->num_descs; i++) {
+		desc = line->descs[i];
+		flags = gpio_v2_line_config_flags(lc, i);
+		/* disallow edge detection changes */
+		if (line->edets[i].flags != (flags & GPIO_V2_LINE_EDGE_FLAGS))
+			return -EINVAL;
+
+		if (line->edets[i].flags) {
+			/* disallow polarity changes */
+			if (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
+			    ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0))
+				return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 						    unsigned long *flagsp)
 {
@@ -783,6 +811,67 @@ static long line_get_values(struct line *line, void __user *ip)
 	return 0;
 }
 
+static long line_set_config_locked(struct line *line,
+				   struct gpio_v2_line_config *lc)
+{
+	struct gpio_desc *desc;
+	int i, ret;
+	u64 flags;
+
+	ret = gpio_v2_line_config_change_validate(line, lc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < line->num_descs; i++) {
+		desc = line->descs[i];
+		flags = gpio_v2_line_config_flags(lc, i);
+
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
+			int val = gpio_v2_line_config_output_value(lc, i);
+
+			edge_detector_stop(&line->edets[i]);
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+			ret = gpiod_direction_input(desc);
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
+static long line_set_config(struct line *line, void __user *ip)
+{
+	struct gpio_v2_line_config lc;
+	int ret;
+
+	if (copy_from_user(&lc, ip, sizeof(lc)))
+		return -EFAULT;
+
+	ret = gpio_v2_line_config_validate(&lc, line->num_descs);
+	if (ret)
+		return ret;
+
+	mutex_lock(&line->config_mutex);
+
+	ret = line_set_config_locked(line, &lc);
+
+	mutex_unlock(&line->config_mutex);
+
+	return ret;
+}
+
 static long line_ioctl(struct file *file, unsigned int cmd,
 		       unsigned long arg)
 {
@@ -791,6 +880,8 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return line_get_values(line, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return line_set_config(line, ip);
 
 	return -EINVAL;
 }
@@ -964,6 +1055,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&line->config_mutex);
 	init_waitqueue_head(&line->wait);
 	if (has_edge_detection) {
 		size = lr.event_buffer_size;
-- 
2.28.0

