Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F2823FE79
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHIN06 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgHIN05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:57 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E48C061756;
        Sun,  9 Aug 2020 06:26:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so3463961pgf.0;
        Sun, 09 Aug 2020 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcrvDeCNpQs7mXE2OMv5MhmIl6eGSB/h4qSTdc8P7tk=;
        b=I/+fEa3Kd/eqsGjR8s5R9iBnzcGnKXi1sLiuFitK2Xa4CXScjPC0vZjEh3wInzwufN
         3hLBWpm5v/Uzw5LVDU47LqncTG2aoHHC5Cl2HWGqzjBiaUF2PKSRlsvvdTCXw6sLoaCX
         eQcxGMgkYKuwh4a3vnqfk45zozcm+P7qQjpIkWlAhx5RQYH6ZzJN5U4GyqmG92zYc8vT
         gHZGVgAIOdtiruKfqnBJka0qS4edzAOMWoSEWw/UA9HcrOTOErAPp/YhYI7G0Os/wmAX
         x2aaLTeIwhKfIzBA2mqfU9jEB53AnT8FTnrAvrtPGnhYzg2h5PPn2kDBxdzQumd2NQ48
         /KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcrvDeCNpQs7mXE2OMv5MhmIl6eGSB/h4qSTdc8P7tk=;
        b=EnFKnWdHt4kdPuS7P/0lcCmI5mgZCHZr5L75v8NkFsVv2TgclaCVR1Cr0LtnQaZFAs
         iQXb745jOc9D3SBZe6Yc1UDsN4cf+XEi5etFzcx+XwpvMgLEhN9GWulvVHcPtm/MwTNa
         AhDHH8u/w1sCo//pZUnmt3T9f6kqCHrIG4yk9SDY3AeEu82rtfyURNDDM6Koe3z7XLvs
         ekgwoQJduYOkhPiQQ2CuLttOQECr32fTXqtKGw+YNRboJRI1nF77MUdLZcjKArjwHBAq
         8TOATK/j8S6lYhsZHPntD5sFb0kuWFSdfnj1wcmbfRVJQygfngeF8jszNzXD0f90wDnZ
         Js5g==
X-Gm-Message-State: AOAM530eprsix0ZfPuGLBkOGnqeStGvUf9DJb5EWas8mDYXn3LtXt4bM
        VSYgYT5DsowXjCPe8TXJ9M8jhWIR
X-Google-Smtp-Source: ABdhPJy90/KHX4pAjeocHI0159NMO4J+Aw3aUj8+YQccg35kDHAw+rbhCKJrZRoJlmdIlMBVzWwAfA==
X-Received: by 2002:a65:6289:: with SMTP id f9mr18218295pgv.272.1596979617017;
        Sun, 09 Aug 2020 06:26:57 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:26:56 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 08/18] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Sun,  9 Aug 2020 21:25:19 +0800
Message-Id: <20200809132529.264312-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
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
index c1b916224240..d34dad50a048 100644
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

