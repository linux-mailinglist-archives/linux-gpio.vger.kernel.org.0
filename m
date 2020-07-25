Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F035922D4B1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgGYEVx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:21:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40146C0619D3;
        Fri, 24 Jul 2020 21:21:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a9so6428252pjd.3;
        Fri, 24 Jul 2020 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fapEZEJ9DNw3FFZOxwjkh9bO3pSC0CYjBXyWNSjW8/M=;
        b=Hc2sXhkBeA5aT/22dTUKuNW8txca6l6WFuEr33aooY8tBXUnwvo/jor254iLcgd/AZ
         T9DDScdUNdwYAW3n5IOyWO0qld1mbJbqK4bQrYV3fzfjgKkoE+SseuoN12aIdYB+aw8H
         oqqsME5u86umqVk5AcMGuO2xWwOJIM9NECCkXM7HPM8GPwohn7HArvtKCFaVQjWgTQfV
         MGnu7ZaP3qB8I4uJbarupxxjNA94VqPABmqCF+jTKBoXjKRgQWY6Uwmt3Dr5ASt6zzVa
         FGILibfMMFIlwss5BOwu9Jq5NQek1XwqkhsZxSVK+ulQkP+X0kHsDdY7TVaBME/hIWJL
         bW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fapEZEJ9DNw3FFZOxwjkh9bO3pSC0CYjBXyWNSjW8/M=;
        b=hbEY0ZwdQWb5abnqRJOZ0oQyWv5FevGn+FqLMO2bj0THLEpkc+XWk1wO/T1G+GZ0/z
         f/RYCjc/5B/fMkyIrF7DArpG+jk3GNJZ3j7dJBUHoe437mEUyWayqe/ttrOSG7hIMA8h
         bpGrq1CwIFD8xdiq+PXDujeNkMJbmmLsvL0DzNPp3YyitTqX88i2kMM/7WO2mL4ZlXr7
         Py4Mm8G9vsKMf5VDZBnOrRAJQzBigjUXUETcw65ChnippnglZ6VbzBKhS5PHJgho37Rt
         wMc543b0yb8K9BuqUfbU+fUVhweGrvKy7tnaWCowTCH52RxadbO63qXqXL9nAeq0d1Zz
         VdWw==
X-Gm-Message-State: AOAM531BtEeZHunyvriXJkaBpvBExidSr/s60L1o9+6o8h8k6z7eR0Sz
        GhqRkHdx1CblWjxkMRC4wWnTioNt
X-Google-Smtp-Source: ABdhPJzfPMVxbLtrelmVqBheSfa77gvCUdYanx64Nx1v+VddqDlbHuO0cV9XEfixMA+Cqy5e5rjKyg==
X-Received: by 2002:a17:902:bb82:: with SMTP id m2mr10907985pls.61.1595650912321;
        Fri, 24 Jul 2020 21:21:52 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:21:51 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 08/18] gpiolib: cdev: support GPIOLINE_SET_CONFIG_IOCTL
Date:   Sat, 25 Jul 2020 12:19:45 +0800
Message-Id: <20200725041955.9985-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIOLINE_SET_CONFIG_IOCTL, the uAPI v2
line set config ioctl.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 91 +++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 8caebb460557..9d944ca0ff59 100644
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
@@ -417,6 +418,8 @@ struct edge_detector {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_descs is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, partiuclarly multi-step accesses to desc flags.
  * @edets: an array of edge detectors, of size @num_descs
  * @descs: the GPIO descriptors held by this line request, with @num_descs
  * elements.
@@ -428,6 +431,7 @@ struct line {
 	wait_queue_head_t wait;
 	DECLARE_KFIFO_PTR(events, struct gpioline_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct edge_detector *edets;
 	/* descs must be last so it can be dynamically sized */
 	struct gpio_desc *descs[];
@@ -709,6 +713,30 @@ static int gpioline_config_validate(struct gpioline_config *lc, int num_lines)
 	return 0;
 }
 
+static int gpioline_config_change_validate(struct line *line,
+					   struct gpioline_config *lc)
+{
+	int i;
+	u64 flags;
+	struct gpio_desc *desc;
+
+	for (i = 0; i < line->num_descs; i++) {
+		desc = line->descs[i];
+		flags = gpioline_config_flags(lc, i);
+		/* disallow edge detection changes */
+		if (line->edets[i].flags != (flags & GPIOLINE_EDGE_FLAGS))
+			return -EINVAL;
+
+		if (line->edets[i].flags) {
+			/* disallow polarity changes */
+			if (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
+			    ((flags & GPIOLINE_FLAG_V2_ACTIVE_LOW) != 0))
+				return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 static void gpioline_config_flags_to_desc_flags(u64 flags,
 						unsigned long *flagsp)
 {
@@ -757,6 +785,66 @@ static long line_get_values(struct line *line, void __user *ip)
 	return 0;
 }
 
+static long line_set_config_locked(struct line *line,
+				   struct gpioline_config *lc)
+{
+	struct gpio_desc *desc;
+	int i, ret;
+	u64 flags;
+
+	ret = gpioline_config_change_validate(line, lc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < line->num_descs; i++) {
+		desc = line->descs[i];
+		flags = gpioline_config_flags(lc, i);
+
+		gpioline_config_flags_to_desc_flags(flags, &desc->flags);
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIOLINE_FLAG_V2_OUTPUT) {
+			int val = gpioline_config_output_value(lc, i);
+
+			edge_detector_stop(&line->edets[i]);
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (flags & GPIOLINE_FLAG_V2_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				return ret;
+		}
+
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIOLINE_CHANGED_CONFIG, desc);
+	}
+	return 0;
+}
+
+static long line_set_config(struct line *line, void __user *ip)
+{
+	struct gpioline_config lc;
+	int ret;
+
+	if (copy_from_user(&lc, ip, sizeof(lc)))
+		return -EFAULT;
+
+	ret = gpioline_config_validate(&lc, line->num_descs);
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
@@ -765,6 +853,8 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIOLINE_GET_VALUES_IOCTL)
 		return line_get_values(line, ip);
+	else if (cmd == GPIOLINE_SET_CONFIG_IOCTL)
+		return line_set_config(line, ip);
 
 	return -EINVAL;
 }
@@ -937,6 +1027,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&line->config_mutex);
 	init_waitqueue_head(&line->wait);
 	if (has_edge_detection) {
 		size = linereq.event_buffer_size;
-- 
2.27.0

