Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6D73F631F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhHXQtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:10243 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233390AbhHXQtO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550704"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550704"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036796"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:23 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 07/20] gpio: Add output event generation method to GPIOLIB and PMC Driver
Date:   Tue, 24 Aug 2021 22:17:48 +0530
Message-Id: <20210824164801.28896-8-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Intel Timed I/O hardware supports output scheduled in hardware. Enable
this functionality using GPIOlib

Adds GPIOlib generate_output() hook into the driver. The driver is
supplied with a timestamp in terms of realtime system clock (the same
used for input timestamping). The driver must know how to translate this
into a timebase meaningful for the hardware.

Adds userspace write() interface. Output can be selected using the line
event create ioctl. The write() interface takes a single timestamp
event request parameter. An output edge rising or falling is generated
for each event request.

The user application supplies a trigger time in terms of the realtime
clock the driver converts this into the corresponding ART clock value
that is used to 'arm' the output.

Work around device quirk that doesn't allow the output to be explicitly
set. Instead, count the output edges and insert an additional edge as
needed to reset the output to zero.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 154 ++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib-cdev.c       |  49 +++++++++-
 include/linux/gpio/driver.h       |   9 ++
 include/uapi/linux/gpio.h         |   8 ++
 4 files changed, 210 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index 7e5e61054dea..f57f521edc40 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -6,6 +6,7 @@
 
 #include <linux/acpi.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -48,6 +49,7 @@ struct intel_pmc_tio_chip {
 	struct delayed_work input_work;
 	bool input_work_running;
 	bool systime_valid;
+	bool output_high;
 	unsigned int systime_index;
 	struct system_time_snapshot systime_snapshot[INPUT_SNAPSHOT_COUNT];
 	u64 last_event_count;
@@ -123,6 +125,38 @@ static inline void intel_pmc_tio_writel(struct intel_pmc_tio_chip *tio,
 #define INTEL_PMC_TIO_WR_REG(offset, value)(			\
 		intel_pmc_tio_writel((tio), (offset), (value)))
 
+/* Must hold mutex */
+static u32 intel_pmc_tio_disable(struct intel_pmc_tio_chip *tio)
+{
+	u32 ctrl;
+	u64 art;
+
+	ctrl = INTEL_PMC_TIO_RD_REG(TGPIOCTL);
+	if (!(ctrl & TGPIOCTL_DIR) && ctrl & TGPIOCTL_EN) {
+		/* 'compare' value is invalid */
+		art = read_art_time();
+		--art;
+		INTEL_PMC_TIO_WR_REG(TGPIOCOMPV31_0, art & 0xFFFFFFFF);
+		INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art >> 32);
+		udelay(1);
+		tio->output_high = (INTEL_PMC_TIO_RD_REG(TGPIOEC31_0) & 0x1);
+	}
+
+	if (ctrl & TGPIOCTL_EN) {
+		ctrl &= ~TGPIOCTL_EN;
+		INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+	}
+
+	return ctrl;
+}
+
+static void intel_pmc_tio_enable(struct intel_pmc_tio_chip *tio, u32 ctrl)
+{
+	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+	ctrl |= TGPIOCTL_EN;
+	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+}
+
 static void intel_pmc_tio_enable_input(struct intel_pmc_tio_chip *tio,
 				       u32 eflags)
 {
@@ -131,10 +165,6 @@ static void intel_pmc_tio_enable_input(struct intel_pmc_tio_chip *tio,
 
 	/* Disable */
 	ctrl = INTEL_PMC_TIO_RD_REG(TGPIOCTL);
-	ctrl &= ~TGPIOCTL_EN;
-	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
-
-	tio->last_event_count = 0;
 
 	/* Configure Input */
 	ctrl |= TGPIOCTL_DIR;
@@ -150,9 +180,7 @@ static void intel_pmc_tio_enable_input(struct intel_pmc_tio_chip *tio,
 		ctrl |= TGPIOCTL_EP_FALLING_EDGE;
 
 	/* Enable */
-	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
-	ctrl |= TGPIOCTL_EN;
-	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+	intel_pmc_tio_enable(tio, ctrl);
 }
 
 static void intel_pmc_tio_input_work(struct work_struct *input_work)
@@ -293,6 +321,115 @@ static int intel_pmc_tio_do_poll(struct gpio_chip *chip, unsigned int offset,
 	return err;
 }
 
+static int intel_pmc_tio_insert_edge(struct intel_pmc_tio_chip *tio, u32 *ctrl)
+{
+	struct system_counterval_t sys_counter;
+	ktime_t trigger;
+	int err;
+	u64 art;
+
+	trigger = ktime_get_real();
+	trigger = ktime_add_ns(trigger, NSEC_PER_SEC / 20);
+
+	err = ktime_convert_real_to_system_counter(trigger, &sys_counter);
+	if (err)
+		return err;
+
+	err = convert_tsc_to_art(&sys_counter, &art);
+	if (err)
+		return err;
+
+	/* In disabled state */
+	*ctrl &= ~(TGPIOCTL_DIR | TGPIOCTL_PM);
+	*ctrl &= ~TGPIOCTL_EP;
+	*ctrl |= TGPIOCTL_EP_TOGGLE_EDGE;
+
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV31_0, art & 0xFFFFFFFF);
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art >> 32);
+
+	intel_pmc_tio_enable(tio, *ctrl);
+
+	/* sleep for 100 milli-second */
+	msleep(2 * (MSEC_PER_SEC / 20));
+
+	*ctrl = intel_pmc_tio_disable(tio);
+
+	return 0;
+}
+
+static int intel_pmc_tio_direction_output(struct gpio_chip *chip, unsigned int offset,
+					  int value)
+{
+	struct intel_pmc_tio_chip *tio;
+	int err = 0;
+	u32 ctrl;
+	u64 art;
+
+	if (value)
+		return -EINVAL;
+
+	tio = gch_to_intel_pmc_tio(chip);
+
+	mutex_lock(&tio->lock);
+	ctrl = intel_pmc_tio_disable(tio);
+
+	/*
+	 * Make sure the output is zero'ed by inserting an edge as needed
+	 * Only need to worry about this when restarting output
+	 */
+	if (tio->output_high) {
+		err = intel_pmc_tio_insert_edge(tio, &ctrl);
+		if (err)
+			goto out;
+		tio->output_high = false;
+	}
+
+	/* Enable the device, be sure that the 'compare(COMPV)' value is invalid */
+	art = read_art_time();
+	--art;
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV31_0, art & 0xFFFFFFFF);
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art >> 32);
+
+	ctrl &= ~(TGPIOCTL_DIR | TGPIOCTL_PM);
+	ctrl &= ~TGPIOCTL_EP;
+	ctrl |= TGPIOCTL_EP_TOGGLE_EDGE;
+
+	intel_pmc_tio_enable(tio, ctrl);
+
+out:
+	mutex_unlock(&tio->lock);
+
+	return err;
+}
+
+static int intel_pmc_tio_generate_output(struct gpio_chip *chip,
+					 unsigned int offset,
+					 struct gpio_output_event_data *data)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+	ktime_t sys_realtime = ns_to_ktime(data->timestamp);
+	struct system_counterval_t sys_counter;
+	u64 art_timestamp;
+	int err;
+
+	err = ktime_convert_real_to_system_counter(sys_realtime, &sys_counter);
+	if (err)
+		return err;
+
+	err = convert_tsc_to_art(&sys_counter, &art_timestamp);
+	if (err)
+		return err;
+
+	mutex_lock(&tio->lock);
+
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art_timestamp >> 32);
+	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV31_0, art_timestamp);
+
+	mutex_unlock(&tio->lock);
+
+	return 0;
+}
+
 static int intel_pmc_tio_probe(struct platform_device *pdev)
 {
 	struct intel_pmc_tio_chip *tio;
@@ -327,10 +464,13 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 	tio->gch.base = -1;
 	tio->gch.setup_poll = intel_pmc_tio_setup_poll;
 	tio->gch.do_poll = intel_pmc_tio_do_poll;
+	tio->gch.generate_output = intel_pmc_tio_generate_output;
+	tio->gch.direction_output = intel_pmc_tio_direction_output;
 
 	platform_set_drvdata(pdev, tio);
 	mutex_init(&tio->lock);
 	INIT_DELAYED_WORK(&tio->input_work, intel_pmc_tio_input_work);
+	tio->output_high = false;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &tio->gch, tio);
 	if (err < 0)
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index cb6b9155884c..1df28a71f88b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1221,6 +1221,29 @@ static __poll_t linereq_poll(struct file *file,
 	return events;
 }
 
+static ssize_t linereq_write(struct file *filep, const char __user *buf,
+			     size_t count, loff_t *f_ps)
+{
+	struct linereq *lr = filep->private_data;
+	struct gpio_output_event out_event;
+	struct gpio_output_event_data out_data;
+	int offset, err;
+
+	if (count < sizeof(struct gpio_output_event))
+		return -EINVAL;
+
+	if (copy_from_user(&out_event, buf, sizeof(out_event)))
+		return -EFAULT;
+
+	out_data.timestamp = out_event.timestamp;
+	offset = gpio_chip_hwgpio(lr->lines[0].desc);
+	err = lr->gdev->chip->generate_output(lr->gdev->chip, offset, &out_data);
+	if (err)
+		return err;
+
+	return sizeof(struct gpio_output_event);
+}
+
 static ssize_t linereq_read(struct file *file,
 			    char __user *buf,
 			    size_t count,
@@ -1302,6 +1325,8 @@ static void linereq_free(struct linereq *lr)
 
 	for (i = 0; i < lr->num_lines; i++) {
 		edge_detector_stop(&lr->lines[i]);
+		if (lr->lines[i].irq)
+			free_irq(lr->lines[i].irq, lr);
 		if (lr->lines[i].desc)
 			gpiod_free(lr->lines[i].desc);
 	}
@@ -1319,7 +1344,18 @@ static int linereq_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static const struct file_operations line_fileops = {
+static const struct file_operations line_output_fileops = {
+	.release = linereq_release,
+	.write = linereq_write,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = linereq_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = linereq_ioctl_compat,
+#endif
+};
+
+static const struct file_operations line_input_fileops = {
 	.release = linereq_release,
 	.read = linereq_read,
 	.poll = linereq_poll,
@@ -1382,6 +1418,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	struct gpio_v2_line_request ulr;
 	struct gpio_v2_line_config *lc;
 	unsigned int file_flags;
+	bool output = false;
 	struct linereq *lr;
 	struct file *file;
 	u64 flags;
@@ -1458,11 +1495,12 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		if (ret < 0)
 			goto out_free_linereq;
 
+		output = flags & GPIO_V2_LINE_FLAG_OUTPUT;
 		/*
 		 * Lines have to be requested explicitly for input
 		 * or output, else the line will be treated "as is".
 		 */
-		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
+		if (output) {
 			int val = gpio_v2_line_config_output_value(lc, i);
 
 			ret = gpiod_direction_output(desc, val);
@@ -1476,6 +1514,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		file_flags = O_RDONLY | O_CLOEXEC;
+		file_flags |= output ? O_WRONLY : O_RDONLY;
+		file_flags |= (!output && !lr->lines[i].irq) ? O_NONBLOCK : 0;
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
 					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
@@ -1490,7 +1530,10 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_linereq;
 	}
 
-	file = anon_inode_getfile("gpio-line", &line_fileops, lr,
+	file = anon_inode_getfile("gpio-line",
+				  output ? &line_output_fileops :
+				  &line_input_fileops,
+				  lr,
 				  file_flags);
 	if (IS_ERR(file)) {
 		ret = PTR_ERR(file);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f5b971ad40bc..561e289434aa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -18,6 +18,7 @@ struct seq_file;
 struct gpio_device;
 struct module;
 struct gpioevent_poll_data;
+struct gpio_output_event_data;
 enum gpiod_flags;
 enum gpio_lookup_flags;
 
@@ -310,6 +311,7 @@ struct gpio_irq_chip {
  *	event flags and driver returns accepted flags.
  * @do_poll: optional routine for devices that don't support interrupts.
  *	Returns event specification in data parameter.
+ * @generate_output: generate out event. Takes timestamp as input.
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
@@ -409,6 +411,9 @@ struct gpio_chip {
 	int                     (*do_poll)(struct gpio_chip *chip,
 					   unsigned int offset, u32 eflags,
 					   struct gpioevent_poll_data *data);
+	int                     (*generate_output)(struct gpio_chip *chip,
+						   unsigned int offset,
+						   struct gpio_output_event_data *data);
 
 	int			base;
 	u16			ngpio;
@@ -490,6 +495,10 @@ struct gpioevent_poll_data {
 	__u32 id;
 };
 
+struct gpio_output_event_data {
+	__u64 timestamp;
+};
+
 extern const char *gpiochip_is_requested(struct gpio_chip *gc,
 			unsigned int offset);
 
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index ed84805baee8..c39efc459b9f 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -298,6 +298,14 @@ struct gpio_v2_line_event {
 	__u32 padding[6];
 };
 
+/**
+ * struct gpio_output_event - Output event request
+ * @timestamp: When the time should occur
+ */
+struct gpio_output_event {
+	__u64 timestamp;
+};
+
 /*
  * ABI v1
  *
-- 
2.17.1

