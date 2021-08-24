Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAED33F631A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhHXQtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232971AbhHXQtC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550671"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550671"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036717"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:14 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 04/20] gpio: Add input code to Intel PMC Timed I/O Driver
Date:   Tue, 24 Aug 2021 22:17:45 +0530
Message-Id: <20210824164801.28896-5-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

Implement poll() and setup_poll() methods in the PMC Timed I/O Driver
for added GPIO lib functionality.

The setup_poll() code configures the hardware to listen for events on
the Timed I/O interface.

The poll() interface returns the timestamp of the last event or
-EAGAIN if no events are available.

Use timekeeping event get_device_system_crosststamp() interface to
translate ART/TSC to CLOCK_REALTIME. The poll operation is driven from user
space and may not occur within the same timekeeping interval as the actual
event, necessiating the use of the get_device_system_crosststamp() with
an inteepolation window.

Uses snapshotting interface to extend the translation/interpolation
window beyond the current timekeeping interval because, poll operation
is driven from user space and may not occur within the same timekeeping
interval as the actual event. . Necessitating use of the
get_device_system_crosststamp() with an interpolation window.

The ktime snapshot is guaranteed to be updated at least every 1/8 second
using a work queue item minimizing the interpolation window.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 220 +++++++++++++++++++++++++++++-
 1 file changed, 219 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index e6436b56ebea..7e5e61054dea 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <uapi/linux/gpio.h>
 
@@ -33,6 +34,9 @@
 #define TGPIOCTL_PM			BIT(4)
 
 #define DRIVER_NAME		"intel-pmc-tio"
+#define GPIO_COUNT		1
+#define INPUT_SNAPSHOT_FREQ	8
+#define INPUT_SNAPSHOT_COUNT	3
 
 struct intel_pmc_tio_chip {
 	struct gpio_chip gch;
@@ -40,8 +44,29 @@ struct intel_pmc_tio_chip {
 	struct dentry *root;
 	struct debugfs_regset32 *regset;
 	void __iomem *base;
+	struct mutex lock;		/* Protects 'ctrl', time */
+	struct delayed_work input_work;
+	bool input_work_running;
+	bool systime_valid;
+	unsigned int systime_index;
+	struct system_time_snapshot systime_snapshot[INPUT_SNAPSHOT_COUNT];
+	u64 last_event_count;
+	u64 last_art_timestamp;
 };
 
+struct intel_pmc_tio_get_time_arg {
+	struct intel_pmc_tio_chip *tio;
+	u32 eflags;
+	u32 event_id;
+	u64 abs_event_count;
+};
+
+#define gch_to_intel_pmc_tio(i)					\
+	(container_of((i), struct intel_pmc_tio_chip, gch))
+
+#define inws_to_intel_pmc_tio(i)					\
+	(container_of((i), struct intel_pmc_tio_chip, input_work.work))
+
 static const struct debugfs_reg32 intel_pmc_tio_regs[] = {
 	{
 		.name = "TGPIOCTL",
@@ -81,6 +106,193 @@ static const struct debugfs_reg32 intel_pmc_tio_regs[] = {
 	},
 };
 
+static inline u32 intel_pmc_tio_readl(struct intel_pmc_tio_chip *tio,
+				      u32 offset)
+{
+	return readl(tio->base + offset);
+}
+
+static inline void intel_pmc_tio_writel(struct intel_pmc_tio_chip *tio,
+					u32 offset, u32 value)
+{
+	writel(value, tio->base + offset);
+}
+
+#define INTEL_PMC_TIO_RD_REG(offset)(			\
+		intel_pmc_tio_readl((tio), (offset)))
+#define INTEL_PMC_TIO_WR_REG(offset, value)(			\
+		intel_pmc_tio_writel((tio), (offset), (value)))
+
+static void intel_pmc_tio_enable_input(struct intel_pmc_tio_chip *tio,
+				       u32 eflags)
+{
+	bool rising, falling;
+	u32 ctrl;
+
+	/* Disable */
+	ctrl = INTEL_PMC_TIO_RD_REG(TGPIOCTL);
+	ctrl &= ~TGPIOCTL_EN;
+	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+
+	tio->last_event_count = 0;
+
+	/* Configure Input */
+	ctrl |= TGPIOCTL_DIR;
+	ctrl &= ~TGPIOCTL_EP;
+
+	rising = eflags & GPIO_V2_LINE_FLAG_EDGE_RISING;
+	falling = eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING;
+	if (rising && falling)
+		ctrl |= TGPIOCTL_EP_TOGGLE_EDGE;
+	else if (rising)
+		ctrl |= TGPIOCTL_EP_RISING_EDGE;
+	else
+		ctrl |= TGPIOCTL_EP_FALLING_EDGE;
+
+	/* Enable */
+	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+	ctrl |= TGPIOCTL_EN;
+	INTEL_PMC_TIO_WR_REG(TGPIOCTL, ctrl);
+}
+
+static void intel_pmc_tio_input_work(struct work_struct *input_work)
+{
+	struct intel_pmc_tio_chip *tio = inws_to_intel_pmc_tio(input_work);
+
+	mutex_lock(&tio->lock);
+
+	tio->systime_index = (tio->systime_index + 1) % INPUT_SNAPSHOT_COUNT;
+	if (tio->systime_index == INPUT_SNAPSHOT_COUNT - 1)
+		tio->systime_valid = true;
+	ktime_get_snapshot(&tio->systime_snapshot[tio->systime_index]);
+	schedule_delayed_work(&tio->input_work, HZ / INPUT_SNAPSHOT_FREQ);
+
+	mutex_unlock(&tio->lock);
+}
+
+static void intel_pmc_tio_start_input_work(struct intel_pmc_tio_chip *tio)
+{
+	if (tio->input_work_running)
+		return;
+
+	tio->systime_index = 0;
+	tio->systime_valid = false;
+	ktime_get_snapshot(&tio->systime_snapshot[tio->systime_index]);
+
+	schedule_delayed_work(&tio->input_work, HZ / INPUT_SNAPSHOT_FREQ);
+	tio->input_work_running = true;
+}
+
+static void intel_pmc_tio_stop_input_work(struct intel_pmc_tio_chip *tio)
+{
+	if (!tio->input_work_running)
+		return;
+
+	cancel_delayed_work_sync(&tio->input_work);
+	tio->input_work_running = false;
+}
+
+static int intel_pmc_tio_setup_poll(struct gpio_chip *chip, unsigned int offset,
+				    u32 *eflags)
+{
+	struct intel_pmc_tio_chip *tio;
+
+	if (offset != 0)
+		return -EINVAL;
+
+	tio = gch_to_intel_pmc_tio(chip);
+
+	mutex_lock(&tio->lock);
+	intel_pmc_tio_start_input_work(tio);
+	intel_pmc_tio_enable_input(tio, *eflags);
+	mutex_unlock(&tio->lock);
+
+	return 0;
+}
+
+static int intel_pmc_tio_get_time(ktime_t *device_time,
+				  struct system_counterval_t *system_counterval,
+				  void *ctx)
+{
+	struct intel_pmc_tio_get_time_arg *arg = (typeof(arg))ctx;
+	struct intel_pmc_tio_chip *tio = arg->tio;
+	u32 flags = arg->eflags;
+	u64 abs_event_count;
+	u32 rel_event_count;
+	u64 art_timestamp;
+	u32 dt_hi_s;
+	u32 dt_hi_e;
+	int err = 0;
+	u32 dt_lo;
+
+	/* Upper 64 bits of TCV are unlocked, don't use */
+	dt_hi_s = read_art_time() >> 32;
+	dt_lo = INTEL_PMC_TIO_RD_REG(TGPIOTCV31_0);
+	abs_event_count = INTEL_PMC_TIO_RD_REG(TGPIOECCV63_32);
+	abs_event_count <<= 32;
+	abs_event_count |= INTEL_PMC_TIO_RD_REG(TGPIOECCV31_0);
+	dt_hi_e = read_art_time() >> 32;
+
+	art_timestamp = ((dt_hi_e != dt_hi_s) && !(dt_lo & 0x80000000)) ?
+			 dt_hi_e : dt_hi_s;
+	art_timestamp <<= 32;
+	art_timestamp |= dt_lo;
+
+	rel_event_count = abs_event_count - tio->last_event_count;
+	if (rel_event_count == 0 || art_timestamp == tio->last_art_timestamp) {
+		err = -EAGAIN;
+		goto out;
+	}
+
+	tio->last_art_timestamp = art_timestamp;
+
+	*system_counterval = convert_art_to_tsc(art_timestamp);
+	arg->abs_event_count = abs_event_count;
+	arg->event_id = 0;
+	arg->event_id |= (flags & GPIO_V2_LINE_FLAG_EDGE_RISING) ?
+		GPIO_V2_LINE_EVENT_RISING_EDGE : 0;
+	arg->event_id |= (flags & GPIO_V2_LINE_FLAG_EDGE_FALLING) ?
+		GPIO_V2_LINE_EVENT_FALLING_EDGE : 0;
+
+out:
+	return err;
+}
+
+static int intel_pmc_tio_do_poll(struct gpio_chip *chip, unsigned int offset,
+				 u32 eflags, struct gpioevent_poll_data *data)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+	struct intel_pmc_tio_get_time_arg arg = {
+		.eflags = eflags, .tio = tio };
+	struct system_device_crosststamp xtstamp;
+	unsigned int i, stop;
+	int err = -EAGAIN;
+
+	mutex_lock(&tio->lock);
+
+	i = tio->systime_index;
+	stop = tio->systime_valid ?
+		tio->systime_index : INPUT_SNAPSHOT_COUNT - 1;
+	do {
+		err = get_device_system_crosststamp(intel_pmc_tio_get_time,
+						    &arg,
+						    &tio->systime_snapshot[i],
+						    &xtstamp);
+		if (!err) {
+			data->timestamp = ktime_to_ns(xtstamp.sys_realtime);
+			data->id = arg.event_id;
+			tio->last_event_count = arg.abs_event_count;
+		}
+		if (!err || err == -EAGAIN)
+			break;
+		i = (i + (INPUT_SNAPSHOT_COUNT - 1)) % INPUT_SNAPSHOT_COUNT;
+	} while (i != stop);
+
+	mutex_unlock(&tio->lock);
+
+	return err;
+}
+
 static int intel_pmc_tio_probe(struct platform_device *pdev)
 {
 	struct intel_pmc_tio_chip *tio;
@@ -111,10 +323,14 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 	debugfs_create_regset32("regdump", 0444, tio->root, tio->regset);
 
 	tio->gch.label = pdev->name;
-	tio->gch.ngpio = 0;
+	tio->gch.ngpio = GPIO_COUNT;
 	tio->gch.base = -1;
+	tio->gch.setup_poll = intel_pmc_tio_setup_poll;
+	tio->gch.do_poll = intel_pmc_tio_do_poll;
 
 	platform_set_drvdata(pdev, tio);
+	mutex_init(&tio->lock);
+	INIT_DELAYED_WORK(&tio->input_work, intel_pmc_tio_input_work);
 
 	err = devm_gpiochip_add_data(&pdev->dev, &tio->gch, tio);
 	if (err < 0)
@@ -136,6 +352,8 @@ static int intel_pmc_tio_remove(struct platform_device *pdev)
 	if (!tio)
 		return -ENODEV;
 
+	intel_pmc_tio_stop_input_work(tio);
+	mutex_destroy(&tio->lock);
 	debugfs_remove_recursive(tio->root);
 
 	return 0;
-- 
2.17.1

