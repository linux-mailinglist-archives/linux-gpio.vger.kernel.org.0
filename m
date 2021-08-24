Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFC63F6315
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhHXQs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:48:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhHXQsz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:48:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550651"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036678"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:07 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 02/20] gpio: Add GPIO polling interface to GPIO lib
Date:   Tue, 24 Aug 2021 22:17:43 +0530
Message-Id: <20210824164801.28896-3-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Some Intel Timed I/O devices do not implement IRQ functionality. Augment
read() interface to allow polling.

Add two GPIO device methods: setup_poll() and poll():
- setup_poll() configures the GPIO interface e.g. capture rising edges
- poll() checks for events on the interface

To implement polling, the driver must implement the two functions above
and should either leave to_irq() method NULL or return irq 0.

setup_poll() should configure the hardware to 'listen' for input events.

poll() driver implementation must return the realtime timestamp
corresponding to the event and -EAGAIN if no data is available.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 28 ++++++++++++++++++++++++++--
 include/linux/gpio/driver.h | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c7b5446d01fd..4741bf34750b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1227,13 +1227,34 @@ static ssize_t linereq_read(struct file *file,
 			    loff_t *f_ps)
 {
 	struct linereq *lr = file->private_data;
+	struct gpioevent_poll_data poll_data;
 	struct gpio_v2_line_event le;
 	ssize_t bytes_read = 0;
-	int ret;
+	int ret, offset;
 
 	if (count < sizeof(le))
 		return -EINVAL;
 
+	/* Without an IRQ, we can only poll */
+	offset = gpio_chip_hwgpio(lr->gdev->descs);
+	if (lr->lines[offset].irq == 0) {
+		struct gpio_v2_line_event *event;
+
+		if (!(file->f_flags & O_NONBLOCK))
+			return -ENODEV;
+
+		ret = lr->gdev->chip->do_poll(lr->gdev->chip, offset,
+					      lr->lines[offset].eflags, &poll_data);
+		if (ret)
+			return ret;
+		event = kzalloc(sizeof(*event), GFP_KERNEL);
+		event->timestamp_ns = poll_data.timestamp;
+		event->id = poll_data.id;
+		if (copy_to_user(buf, (void *)&event, sizeof(event)))
+			return -EFAULT;
+		return sizeof(event);
+	}
+
 	do {
 		spin_lock(&lr->wait.lock);
 		if (kfifo_is_empty(&lr->events)) {
@@ -1314,6 +1335,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpio_v2_line_request ulr;
 	struct gpio_v2_line_config *lc;
+	unsigned int file_flags;
 	struct linereq *lr;
 	struct file *file;
 	u64 flags;
@@ -1411,6 +1433,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 				goto out_free_linereq;
 		}
 
+		file_flags = O_RDONLY | O_CLOEXEC;
+
 		blocking_notifier_call_chain(&desc->gdev->notifier,
 					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
@@ -1425,7 +1449,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	file = anon_inode_getfile("gpio-line", &line_fileops, lr,
-				  O_RDONLY | O_CLOEXEC);
+				  file_flags);
 	if (IS_ERR(file)) {
 		ret = PTR_ERR(file);
 		goto out_put_unused_fd;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3a268781fcec..f5b971ad40bc 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -17,6 +17,7 @@ struct device_node;
 struct seq_file;
 struct gpio_device;
 struct module;
+struct gpioevent_poll_data;
 enum gpiod_flags;
 enum gpio_lookup_flags;
 
@@ -304,6 +305,11 @@ struct gpio_irq_chip {
  * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
  *	requires special mapping of the pins that provides GPIO functionality.
  *	It is called after adding GPIO chip and before adding IRQ chip.
+ * @setup_poll: optional routine for devices that don't support interrupts.
+ *	Takes flags argument as in/out parameter, where caller requests
+ *	event flags and driver returns accepted flags.
+ * @do_poll: optional routine for devices that don't support interrupts.
+ *	Returns event specification in data parameter.
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
@@ -396,6 +402,14 @@ struct gpio_chip {
 
 	int			(*add_pin_ranges)(struct gpio_chip *gc);
 
+	int                     (*setup_poll)(struct gpio_chip *chip,
+					      unsigned int offset,
+					      u32 *eflags);
+
+	int                     (*do_poll)(struct gpio_chip *chip,
+					   unsigned int offset, u32 eflags,
+					   struct gpioevent_poll_data *data);
+
 	int			base;
 	u16			ngpio;
 	const char		*const *names;
@@ -471,6 +485,11 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
+struct gpioevent_poll_data {
+	__u64 timestamp;
+	__u32 id;
+};
+
 extern const char *gpiochip_is_requested(struct gpio_chip *gc,
 			unsigned int offset);
 
-- 
2.17.1

