Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817C028DC1E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387595AbgJNIy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJNIyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:54:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC16BC04587A;
        Tue, 13 Oct 2020 23:28:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so1370298pff.6;
        Tue, 13 Oct 2020 23:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGsSOPVmEcKNiuYtsh4AiINTr+nIPPhY6elwImv81fo=;
        b=MHAkAdbRFld7ghGXQ9aJ0hobWBZA7B40jhGnBCJIwv/o43RKYT+sYfYa51tujLjkcz
         wI9jQM7oyYMtCk1+oH2a0e2r3LWE1XUSYNsqRnjbm++9sPheI1hMkS6bbojEjTaJqSA9
         w3cEIaHXl0DiWQUVENih0J6peIXfJgIT6Vf2QnQQnoXGZsIUuISqyeM7/s0IsV1zsWve
         ZYdS64yyG1APZ/4NvUyo5v+n/SheXxMkdLjiAah/ac05pikwkApiLuHEpo1zAXxk+f1z
         qyKSQHZkY0WzbTyW539Zp7ixB6ceaxA0SAGeCs0DEHNVL/KEIYN8CFKU39U9ur9+hKNd
         nYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGsSOPVmEcKNiuYtsh4AiINTr+nIPPhY6elwImv81fo=;
        b=sGZERoQgZxdWh/knwFohGchG6q3TyRvPCwl+rA6Ra06LWzjIoccYX8SSF+4ydsEI2k
         bcTWAQ6PA8f+Sxy4GxqHmFR8VZCHbmyoXUX+LlDc+U0TjHKjYeowpYBTQbj8Er4s9Nvt
         UUBexT1WhcNUSF95cFpSmaffzU58otULDo/rqG8yoZZ9ddq8Z6zsXMJNkM6L7C8pIslS
         UCCWuMAWAnuqs5HF2mJWrClP50CAMFDw0B38LOYe/HC6mQIFccn3TC3/EE82JspRrF04
         iiKKHt4aZdXtXaKffSif/vWKaw9YYnuT1d7KmS9/EhmyqfnAbSUBmiD8DYws/fUFuAbi
         UuLw==
X-Gm-Message-State: AOAM531icOvYAMeLkXogD+tAqeYrr3bPifMPJM5DWqP6K8o9bjTGpy2v
        RxcMg0Ls5+svXs98huGI3hsxwscIAa1MWQ==
X-Google-Smtp-Source: ABdhPJwmSOL6b4wqp0LIcycaipWFTuG4u67cgH5I79c/9eXB/V62dY2HISORc6Gd+VR9/tqOM/N1Ag==
X-Received: by 2002:a63:1f0f:: with SMTP id f15mr2606767pgf.312.1602656898939;
        Tue, 13 Oct 2020 23:28:18 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q24sm1803266pgb.12.2020.10.13.23.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:28:18 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        Jack Winch <sunt.un.morcov@gmail.com>
Subject: [PATCH 1/3] gpiolib: cdev: allow edge event timestamps to be configured as REALTIME
Date:   Wed, 14 Oct 2020 14:27:38 +0800
Message-Id: <20201014062740.78977-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014062740.78977-1-warthog618@gmail.com>
References: <20201014062740.78977-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Using CLOCK_REALTIME as the source for event timestamps is crucial for
some specific applications, particularly those requiring timetamps
relative to a PTP clock, so provide an option to switch the event
timestamp source from the default CLOCK_MONOTONIC to CLOCK_REALTIME.

Note that CLOCK_REALTIME was the default source clock for GPIO until
Linux 5.7 when it was changed to CLOCK_MONOTONIC due to issues with the
shifting of the realtime clock.
Providing this option maintains the CLOCK_MONOTONIC as the default,
while also providing a path forward for those dependent on the pre-5.7
behaviour.

Suggested-by: Jack Winch <sunt.un.morcov@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 21 ++++++++++++++++++---
 drivers/gpio/gpiolib.h      |  1 +
 include/uapi/linux/gpio.h   | 12 +++++++++---
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 678de9264617..147626a78a92 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -515,6 +515,7 @@ struct linereq {
 	 GPIO_V2_LINE_DIRECTION_FLAGS | \
 	 GPIO_V2_LINE_DRIVE_FLAGS | \
 	 GPIO_V2_LINE_EDGE_FLAGS | \
+	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
 	 GPIO_V2_LINE_BIAS_FLAGS)
 
 static void linereq_put_event(struct linereq *lr,
@@ -535,6 +536,14 @@ static void linereq_put_event(struct linereq *lr,
 		pr_debug_ratelimited("event FIFO is full - event dropped\n");
 }
 
+static unsigned long line_event_timestamp(struct line *line)
+{
+	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
+		return ktime_get_real_ns();
+
+	return ktime_get_ns();
+
+}
 static irqreturn_t edge_irq_thread(int irq, void *p)
 {
 	struct line *line = p;
@@ -553,7 +562,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 		 * which case we didn't get the timestamp from
 		 * edge_irq_handler().
 		 */
-		le.timestamp_ns = ktime_get_ns();
+		le.timestamp_ns = line_event_timestamp(line);
 		if (lr->num_lines != 1)
 			line->req_seqno = atomic_inc_return(&lr->seqno);
 	}
@@ -598,7 +607,7 @@ static irqreturn_t edge_irq_handler(int irq, void *p)
 	 * Just store the timestamp in hardirq context so we get it as
 	 * close in time as possible to the actual event.
 	 */
-	line->timestamp_ns = ktime_get_ns();
+	line->timestamp_ns = line_event_timestamp(line);
 
 	if (lr->num_lines != 1)
 		line->req_seqno = atomic_inc_return(&lr->seqno);
@@ -673,7 +682,7 @@ static void debounce_work_func(struct work_struct *work)
 	memset(&le, 0, sizeof(le));
 
 	lr = line->req;
-	le.timestamp_ns = ktime_get_ns();
+	le.timestamp_ns = line_event_timestamp(line);
 	le.offset = gpio_chip_hwgpio(line->desc);
 	line->line_seqno++;
 	le.line_seqno = line->line_seqno;
@@ -977,6 +986,9 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 		   flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
 	assign_bit(FLAG_BIAS_DISABLE, flagsp,
 		   flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+
+	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1940,6 +1952,9 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
+	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+
 	debounce_period_us = READ_ONCE(desc->debounce_period_us);
 	if (debounce_period_us) {
 		info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b674b5bb980e..2f228ffe8320 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -116,6 +116,7 @@ struct gpio_desc {
 #define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
 #define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
 #define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
+#define FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 2072c260f5d0..e4eb0b8c5cf9 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -65,6 +65,7 @@ struct gpiochip_info {
  * @GPIO_V2_LINE_FLAG_BIAS_PULL_UP: line has pull-up bias enabled
  * @GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN: line has pull-down bias enabled
  * @GPIO_V2_LINE_FLAG_BIAS_DISABLED: line has bias disabled
+ * @GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME: line events contain REALTIME timestamps
  */
 enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_USED			= _BITULL(0),
@@ -78,6 +79,7 @@ enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_BIAS_PULL_UP		= _BITULL(8),
 	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
 	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
+	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
 };
 
 /**
@@ -270,9 +272,6 @@ enum gpio_v2_line_event_id {
 /**
  * struct gpio_v2_line_event - The actual event being pushed to userspace
  * @timestamp_ns: best estimate of time of event occurrence, in nanoseconds.
- * The @timestamp_ns is read from %CLOCK_MONOTONIC and is intended to allow
- * the accurate measurement of the time between events. It does not provide
- * the wall-clock time.
  * @id: event identifier with value from &enum gpio_v2_line_event_id
  * @offset: the offset of the line that triggered the event
  * @seqno: the sequence number for this event in the sequence of events for
@@ -280,6 +279,13 @@ enum gpio_v2_line_event_id {
  * @line_seqno: the sequence number for this event in the sequence of
  * events on this particular line
  * @padding: reserved for future use
+ *
+ * By default the @timestamp_ns is read from %CLOCK_MONOTONIC and is
+ * intended to allow the accurate measurement of the time between events.
+ * It does not provide the wall-clock time.
+ *
+ * If the %GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME flag is set then the
+ * @timestamp_ns is read from %CLOCK_REALTIME.
  */
 struct gpio_v2_line_event {
 	__aligned_u64 timestamp_ns;
-- 
2.28.0

