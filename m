Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F9627A4CF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgI1Aao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgI1Aao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:30:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FADC0613CE;
        Sun, 27 Sep 2020 17:30:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s14so1442901pju.1;
        Sun, 27 Sep 2020 17:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=imYtZiSX5AvWbH/xY/JjjqLmyT8ivLM44f4A3aeUozs=;
        b=i7Rn2dvb++mzLSNbsHPhMTk0eBbBOGSUr0Q+b6IYgqimkBeGNaRyOppX51BfEGx9CY
         Ozg69Pj25EBuQe3YNF6DoDYycPcJicoQXaetr7a8X3NAMG4wMIk4j7zRZSALZQE3kylo
         uE19QjsbzPY2rizHxATxNU5RLDupVOoxiYDglO3NyD+MHr0JLWfxozfZe6p9gRiZoohs
         iUcnByVPXBZidLvaR74TTxe6W4LuCjx+M+2i15G/5dFOWqs556GEabQ2iPwlZxSgPMQ8
         WzHl51h7eHkGst0PfJF4Nk+BFBOw+2UvburU9ZTLAM0SWlcLF3f19jKO22uekHRbzKgQ
         7d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=imYtZiSX5AvWbH/xY/JjjqLmyT8ivLM44f4A3aeUozs=;
        b=iLwGvSBBtzaufVbzp5O8ry7WbJhGWCZql47TvPZUpJ0Vtg7eKwfJ44KJSD/Z1Ij7Cj
         e3UKD6l0hUbceAFpW/jkRFMgLV3z50t/Hq6N8ZMkLTjtVhhyyrDnZ69BR7k88VDB18OI
         MPQx4YzT6jGjCnZlqi1X4TfKgbY57JTapXZZ1kohE2oxNjZuauMOoQKhWS5MTG3XGQPf
         RqxLYjzx0aq4EYYFX2d99Hx4n7j7NN30aBVBRtJtnHOn7zIgKCe4pRHv5nSj8NI0GubO
         hCgy7j5IS8rJ1/0jTHHOP3J7at/FTxryShRd+Ltw9joU4yPdRwMK7az27+SmAiJe9Xph
         EMUw==
X-Gm-Message-State: AOAM533n8dC3ZSnLHgWpyz0LyW3ip9EztARV2vV2wJw53rwgJw0fCUq2
        3wL3vWU2iyEoChXv1I3XGQZKhOGwVlDyPA==
X-Google-Smtp-Source: ABdhPJwGk7XnXmlNvvpF9HREUQ2lVj76/fT/cR33UqDFbII82c4MckDAR3+xffUDGG3OQiq88oSXVQ==
X-Received: by 2002:a17:90a:156:: with SMTP id z22mr7188799pje.140.1601253043313;
        Sun, 27 Sep 2020 17:30:43 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:30:42 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Mon, 28 Sep 2020 08:27:57 +0800
Message-Id: <20200928002807.12146-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 868fcf89478c..608cdbd1d579 100644
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
@@ -444,6 +445,8 @@ struct line {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -454,6 +457,7 @@ struct linereq {
 	u32 event_buffer_size;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct line lines[];
 };
 
@@ -574,6 +578,8 @@ static void edge_detector_stop(struct line *line)
 		free_irq(line->irq, line);
 		line->irq = 0;
 	}
+
+	line->eflags = 0;
 }
 
 static int edge_detector_setup(struct line *line,
@@ -615,6 +621,17 @@ static int edge_detector_setup(struct line *line,
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
@@ -799,6 +816,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
+			(!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
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
@@ -807,6 +892,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -968,6 +1055,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
-- 
2.28.0

