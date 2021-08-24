Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9403F6329
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbhHXQtf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:10275 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233258AbhHXQtX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550754"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550754"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036865"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:35 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 11/20] gpio: Add event count interface to gpiolib
Date:   Tue, 24 Aug 2021 22:17:52 +0530
Message-Id: <20210824164801.28896-12-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add a flag for event count and an extended structure to capture the event
count when the flag is enabled.

Intel(R) PMC Timed I/O device has an event count register counting
the number of missed input edges. The register interface captures the
event count and timestamp of the last event. For an event rate
exceeding the rate that software can read events, the software can use
the missed event count to calculate average event rates.

The application requests one or both rising and falling edges when
initializing the interface. The count of the selected edge type is
optionally selected with an added event type flag. The event count is
returned in an extended buffer using the read() interface.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 28 +++++++++++++++++++---------
 include/linux/gpio/driver.h |  1 +
 include/uapi/linux/gpio.h   | 12 ++++++++++++
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1df28a71f88b..3b5719d5e2dc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -518,7 +518,8 @@ struct linereq {
 	 GPIO_V2_LINE_DRIVE_FLAGS | \
 	 GPIO_V2_LINE_EDGE_FLAGS | \
 	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
-	 GPIO_V2_LINE_BIAS_FLAGS)
+	 GPIO_V2_LINE_BIAS_FLAGS | \
+	 GPIO_V2_LINE_FLAG_EVENT_COUNT)
 
 static void linereq_put_event(struct linereq *lr,
 			      struct gpio_v2_line_event *le)
@@ -1252,10 +1253,14 @@ static ssize_t linereq_read(struct file *file,
 	struct linereq *lr = file->private_data;
 	struct gpioevent_poll_data poll_data;
 	struct gpio_v2_line_event le;
+	size_t min_userbuf_size;
 	ssize_t bytes_read = 0;
 	int ret, offset;
 
-	if (count < sizeof(le))
+	min_userbuf_size = sizeof(le);
+	min_userbuf_size += lr->lines[0].eflags & GPIO_V2_LINE_FLAG_EVENT_COUNT ?
+					sizeof(struct gpio_v2_line_event_ext) : 0;
+	if (count < min_userbuf_size)
 		return -EINVAL;
 
 	/* Without an IRQ, we can only poll */
@@ -1270,12 +1275,17 @@ static ssize_t linereq_read(struct file *file,
 					      lr->lines[offset].eflags, &poll_data);
 		if (ret)
 			return ret;
-		event = kzalloc(sizeof(*event), GFP_KERNEL);
+		event = kzalloc(min_userbuf_size, GFP_KERNEL);
 		event->timestamp_ns = poll_data.timestamp;
 		event->id = poll_data.id;
-		if (copy_to_user(buf, (void *)&event, sizeof(event)))
-			return -EFAULT;
-		return sizeof(event);
+		if (lr->lines[offset].eflags & GPIO_V2_LINE_FLAG_EVENT_COUNT)
+			event->ext[0].event_count = poll_data.event_count;
+
+		ret = copy_to_user(buf, (void *)event, min_userbuf_size);
+		if (ret)
+			ret = -EFAULT;
+		kfree(event);
+		return ret ? ret : min_userbuf_size;
 	}
 
 	do {
@@ -1396,7 +1406,7 @@ static int setup_input(struct linereq *lr, struct gpio_v2_line_config *lc,
 	ret = edge_detector_setup(&lr->lines[line_no], lc, line_no,
 				  lflags & GPIO_V2_LINE_EDGE_FLAGS);
 	if (ret < 0) {
-		if (ret != -ENXIO) {
+		if (ret == -ENXIO) {
 			if (lr->gdev->chip->setup_poll &&
 			    lr->gdev->chip->setup_poll(lr->gdev->chip, offset,
 						       &lflags) == 0 &&
@@ -1513,7 +1523,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 				goto out_free_linereq;
 		}
 
-		file_flags = O_RDONLY | O_CLOEXEC;
+		file_flags = O_CLOEXEC;
 		file_flags |= output ? O_WRONLY : O_RDONLY;
 		file_flags |= (!output && !lr->lines[i].irq) ? O_NONBLOCK : 0;
 
@@ -1524,7 +1534,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			offset);
 	}
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd_flags(file_flags);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_linereq;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 561e289434aa..09637fcbfd52 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -493,6 +493,7 @@ struct gpio_chip {
 struct gpioevent_poll_data {
 	__u64 timestamp;
 	__u32 id;
+	__u32 event_count;
 };
 
 struct gpio_output_event_data {
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index c39efc459b9f..e7fff2a205ec 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
 	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
 	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
+	GPIO_V2_LINE_FLAG_EVENT_COUNT           = _BITULL(12),
 };
 
 /**
@@ -270,6 +271,15 @@ enum gpio_v2_line_event_id {
 	GPIO_V2_LINE_EVENT_UNKNOWN_EDGE = 3,
 };
 
+/**
+ * struct gpio_v2_line_event_ext - Extended gpio line event
+ * @event_count: count of events
+ */
+struct gpio_v2_line_event_ext {
+	__u32 event_count;
+	__u32 reserved[3];
+};
+
 /**
  * struct gpio_v2_line_event - The actual event being pushed to userspace
  * @timestamp_ns: best estimate of time of event occurrence, in nanoseconds.
@@ -280,6 +290,7 @@ enum gpio_v2_line_event_id {
  * @line_seqno: the sequence number for this event in the sequence of
  * events on this particular line
  * @padding: reserved for future use
+ * @gpio_v2_line_event_ext: Extended gpio line event
  *
  * By default the @timestamp_ns is read from %CLOCK_MONOTONIC and is
  * intended to allow the accurate measurement of the time between events.
@@ -296,6 +307,7 @@ struct gpio_v2_line_event {
 	__u32 line_seqno;
 	/* Space reserved for future use. */
 	__u32 padding[6];
+	struct gpio_v2_line_event_ext ext[];
 };
 
 /**
-- 
2.17.1

