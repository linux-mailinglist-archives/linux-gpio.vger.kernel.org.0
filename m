Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA73F6339
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhHXQuX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:10295 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234047AbhHXQuQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:50:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550844"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550844"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684037002"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:59 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 19/20] gpio: Add GPIO monitor line to Intel(R) Timed I/O Driver
Date:   Tue, 24 Aug 2021 22:18:00 +0530
Message-Id: <20210824164801.28896-20-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

The device's PWM output is initially aligned with the system clock using
the 'alignment' state parameter. Small differences between
the system clock rate and nominal ART rate cause the Timed I/O clock to
drift over time.

To solve this: add a secondary input only 'virtual' GPIO line to monitor
the PWM output. This is possible because the I/O lines in the Intel PMC
Timed I/O driver can simultaneously generate output and capture input.
By timestamping the PWM output using the monitor line, the output can be
adjusted using a PI controller to maintain alignment with the system
clock (or any related clock).

NOTE: It is not possible to capture either rising or falling edges
using the 'monitor' interface. Requesting anything other than any/all
edges results in an error.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 82 +++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index 1b0eea7b3b2f..b0db6f545ec6 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -40,10 +40,14 @@
 #define TGPIOCTL_PM			BIT(4)
 
 #define DRIVER_NAME		"intel-pmc-tio"
-#define GPIO_COUNT		1
+#define GPIO_COUNT		2
 #define INPUT_SNAPSHOT_FREQ	8
 #define INPUT_SNAPSHOT_COUNT	3
 
+#define EDGE_FLAGS \
+	(GPIO_V2_LINE_FLAG_EDGE_RISING | \
+	 GPIO_V2_LINE_FLAG_EDGE_FALLING)
+
 struct intel_pmc_tio_chip {
 	struct gpio_chip gch;
 	struct platform_device *pdev;
@@ -54,7 +58,9 @@ struct intel_pmc_tio_chip {
 	struct delayed_work input_work;
 	bool input_work_running;
 	bool systime_valid;
+	bool input;
 	bool output_high;
+	bool monitor;
 	unsigned int systime_index;
 	u32 half_period;
 	u32 alignment;
@@ -243,14 +249,25 @@ static int intel_pmc_tio_setup_poll(struct gpio_chip *chip, unsigned int offset,
 {
 	struct intel_pmc_tio_chip *tio;
 
-	if (offset != 0)
+	if (offset > 1)
+		return -EINVAL;
+
+	/* The monitor line inherits the configuration from the output line */
+	if (offset == 1 && (*eflags & EDGE_FLAGS) != EDGE_FLAGS)
 		return -EINVAL;
 
 	tio = gch_to_intel_pmc_tio(chip);
 
 	mutex_lock(&tio->lock);
+	if (!tio->monitor && !tio->input) {
+		mutex_unlock(&tio->lock);
+		return -EINVAL;
+	}
+
 	intel_pmc_tio_start_input_work(tio);
-	intel_pmc_tio_enable_input(tio, *eflags);
+	if (offset == 0)
+		intel_pmc_tio_enable_input(tio, *eflags);
+
 	mutex_unlock(&tio->lock);
 
 	return 0;
@@ -341,6 +358,54 @@ static int intel_pmc_tio_do_poll(struct gpio_chip *chip, unsigned int offset,
 	return err;
 }
 
+static int intel_pcm_tio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return -EIO;
+}
+
+static int intel_pcm_tio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+	int ret = 0;
+
+	mutex_lock(&tio->lock);
+
+	if (offset == 0) {
+		if (!tio->monitor)
+			tio->input = true;
+		else
+			ret = -EBUSY;
+	} else { /* offset = 1 */
+		if (!tio->input)
+			tio->monitor = true;
+		else
+			ret = -EBUSY;
+	}
+
+	if (!ret)
+		tio->last_event_count = 0;
+
+	mutex_unlock(&tio->lock);
+
+	return ret;
+}
+
+static void intel_pmc_tio_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+
+	if (offset == 0 && tio->input) {
+		tio->input = false;
+		intel_pmc_tio_disable(tio);
+	}
+
+	if (offset == 1)
+		tio->monitor = false;
+
+	if (!tio->monitor && !tio->input)
+		intel_pmc_tio_stop_input_work(tio);
+}
+
 static int intel_pmc_tio_insert_edge(struct intel_pmc_tio_chip *tio, u32 *ctrl)
 {
 	struct system_counterval_t sys_counter;
@@ -428,6 +493,9 @@ static int intel_pmc_tio_direction_output(struct gpio_chip *chip,
 	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
 	int ret;
 
+	if (offset != 0)
+		return -ENODEV;
+
 	mutex_lock(&tio->lock);
 	ret =  _intel_pmc_tio_direction_output(tio, offset, value, 0);
 	mutex_unlock(&tio->lock);
@@ -443,6 +511,9 @@ static int _intel_pmc_tio_generate_output(struct intel_pmc_tio_chip *tio,
 	u64 art_timestamp;
 	int err;
 
+	if (offset != 0)
+		return -ENODEV;
+
 	if (timestamp != 0) {
 		sys_realtime = ns_to_ktime(timestamp);
 	} else {
@@ -667,6 +738,9 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 	tio->gch.do_poll = intel_pmc_tio_do_poll;
 	tio->gch.generate_output = intel_pmc_tio_generate_output;
 	tio->gch.direction_output = intel_pmc_tio_direction_output;
+	tio->gch.free = intel_pmc_tio_gpio_free;
+	tio->gch.direction_input = intel_pcm_tio_direction_input;
+	tio->gch.get = intel_pcm_tio_get;
 
 	platform_set_drvdata(pdev, tio);
 	mutex_init(&tio->lock);
@@ -686,7 +760,7 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 	tio_pwm->tio = tio;
 	tio_pwm->pch.dev = &pdev->dev;
 	tio_pwm->pch.ops = &intel_pmc_tio_pwm_ops;
-	tio_pwm->pch.npwm = GPIO_COUNT;
+	tio_pwm->pch.npwm = GPIO_COUNT - 1;
 	tio_pwm->pch.base = -1;
 
 	err = pwmchip_add(&tio_pwm->pch);
-- 
2.17.1

