Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F973F6333
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhHXQuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:10292 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhHXQuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:50:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550809"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550809"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036944"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:50 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 16/20] gpio: Add PWM capabilities to Intel(R) PMC TIO driver
Date:   Tue, 24 Aug 2021 22:17:57 +0530
Message-Id: <20210824164801.28896-17-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add minimal PWM capabilities to the Intel Timed I/O driver. Requires the
extended flags interface allowing the driver to manage PWM state
because only 50% duty cycle is supported. The PWM function is primarily
used to export a clock using this device.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 249 +++++++++++++++++++++++++++---
 1 file changed, 230 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index 7c4dd5c2661c..f8981e1e92a4 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -7,10 +7,15 @@
 #include <linux/acpi.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/pwm.h>
 #include <uapi/linux/gpio.h>
 
 #define TGPIOCTL		0x00
@@ -54,6 +59,14 @@ struct intel_pmc_tio_chip {
 	struct system_time_snapshot systime_snapshot[INPUT_SNAPSHOT_COUNT];
 	u64 last_event_count;
 	u64 last_art_timestamp;
+	u64 last_art_period;
+	u32 half_period;
+};
+
+struct intel_pmc_tio_pwm {
+	struct pwm_chip pch;
+	struct intel_pmc_tio_chip *tio;
+	struct gpio_desc *gpiod;
 };
 
 struct intel_pmc_tio_get_time_arg {
@@ -64,6 +77,9 @@ struct intel_pmc_tio_get_time_arg {
 	u64 abs_event_count;
 };
 
+#define pch_to_intel_pmc_tio_pwm(i) \
+	(container_of((i), struct intel_pmc_tio_pwm, pch))
+
 #define gch_to_intel_pmc_tio(i)					\
 	(container_of((i), struct intel_pmc_tio_chip, gch))
 
@@ -360,20 +376,17 @@ static int intel_pmc_tio_insert_edge(struct intel_pmc_tio_chip *tio, u32 *ctrl)
 	return 0;
 }
 
-static int intel_pmc_tio_direction_output(struct gpio_chip *chip, unsigned int offset,
-					  int value)
+static int _intel_pmc_tio_direction_output(struct intel_pmc_tio_chip *tio,
+					   u32 offset, int value,
+					   u64 period)
 {
-	struct intel_pmc_tio_chip *tio;
-	int err = 0;
 	u32 ctrl;
+	int err;
 	u64 art;
 
 	if (value)
 		return -EINVAL;
 
-	tio = gch_to_intel_pmc_tio(chip);
-
-	mutex_lock(&tio->lock);
 	ctrl = intel_pmc_tio_disable(tio);
 
 	/*
@@ -383,7 +396,7 @@ static int intel_pmc_tio_direction_output(struct gpio_chip *chip, unsigned int o
 	if (tio->output_high) {
 		err = intel_pmc_tio_insert_edge(tio, &ctrl);
 		if (err)
-			goto out;
+			return err;
 		tio->output_high = false;
 	}
 
@@ -394,27 +407,48 @@ static int intel_pmc_tio_direction_output(struct gpio_chip *chip, unsigned int o
 	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art >> 32);
 
 	ctrl &= ~(TGPIOCTL_DIR | TGPIOCTL_PM);
+	if (period != 0) {
+		ctrl |= TGPIOCTL_PM;
+		INTEL_PMC_TIO_WR_REG(TGPIOPIV31_0, period & 0xFFFFFFFF);
+		INTEL_PMC_TIO_WR_REG(TGPIOPIV63_32, period >> 32);
+	}
+
 	ctrl &= ~TGPIOCTL_EP;
 	ctrl |= TGPIOCTL_EP_TOGGLE_EDGE;
 
 	intel_pmc_tio_enable(tio, ctrl);
 
-out:
+	return 0;
+}
+
+static int intel_pmc_tio_direction_output(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+	int ret;
+
+	mutex_lock(&tio->lock);
+	ret =  _intel_pmc_tio_direction_output(tio, offset, value, 0);
 	mutex_unlock(&tio->lock);
 
-	return err;
+	return ret;
 }
 
-static int intel_pmc_tio_generate_output(struct gpio_chip *chip,
-					 unsigned int offset,
-					 struct gpio_output_event_data *data)
+static int _intel_pmc_tio_generate_output(struct intel_pmc_tio_chip *tio,
+					  unsigned int offset, u64 timestamp)
 {
-	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
-	ktime_t sys_realtime = ns_to_ktime(data->timestamp);
 	struct system_counterval_t sys_counter;
+	ktime_t sys_realtime;
 	u64 art_timestamp;
 	int err;
 
+	if (timestamp != 0) {
+		sys_realtime = ns_to_ktime(timestamp);
+	} else {
+		sys_realtime = ktime_get_real();
+		sys_realtime = ktime_add_ns(sys_realtime, NSEC_PER_SEC / 20);
+	}
+
 	err = ktime_convert_real_to_system_counter(sys_realtime, &sys_counter);
 	if (err)
 		return err;
@@ -423,18 +457,177 @@ static int intel_pmc_tio_generate_output(struct gpio_chip *chip,
 	if (err)
 		return err;
 
-	mutex_lock(&tio->lock);
-
 	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV63_32, art_timestamp >> 32);
 	INTEL_PMC_TIO_WR_REG(TGPIOCOMPV31_0, art_timestamp);
 
+	return 0;
+}
+
+static int intel_pmc_tio_generate_output(struct gpio_chip *chip,
+					 unsigned int offset,
+					 struct gpio_output_event_data *output_data)
+{
+	struct intel_pmc_tio_chip *tio = gch_to_intel_pmc_tio(chip);
+	int ret;
+
+	mutex_lock(&tio->lock);
+	ret =  _intel_pmc_tio_generate_output
+		(tio, offset, output_data->timestamp);
 	mutex_unlock(&tio->lock);
 
-	return 0;
+	return ret;
+}
+
+static int intel_pmc_tio_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct intel_pmc_tio_pwm *tio_pwm = pch_to_intel_pmc_tio_pwm(chip);
+	struct intel_pmc_tio_chip *tio = tio_pwm->tio;
+	int ret = 0;
+
+	mutex_lock(&tio->lock);
+
+	if (tio_pwm->gpiod) {
+		ret = -EBUSY;
+	} else {
+		struct gpio_desc *gpiod;
+
+		gpiod = gpiochip_request_own_desc
+			(&tio->gch, pwm->hwpwm, "intel-pmc-tio-pwm", 0, 0);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
+			goto out;
+		}
+
+		tio_pwm->gpiod = gpiod;
+	}
+
+out:
+	mutex_unlock(&tio->lock);
+	return ret;
 }
 
+#define MIN_ART_PERIOD (3)
+
+static int intel_pmc_tio_pwm_apply(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   const struct pwm_state *state)
+{
+	struct intel_pmc_tio_pwm *tio_pwm = pch_to_intel_pmc_tio_pwm(chip);
+	struct intel_pmc_tio_chip *tio = tio_pwm->tio;
+	bool start_output, change_period;
+	u64 art_period;
+	int ret = 0;
+
+	/* Only support 'normal' polarity */
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	mutex_lock(&tio->lock);
+
+	if (!state->enabled) {
+		if (pwm->state.enabled) {
+			intel_pmc_tio_disable(tio);
+			pwm->state.enabled = false;
+		}
+	}
+
+	/* 50% duty cycle only */
+	if (pwm->state.period != state->period &&
+	    pwm->state.duty_cycle != state->duty_cycle &&
+	    state->duty_cycle != state->period / 2) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	change_period = state->period != pwm->state.period ||
+		state->duty_cycle != pwm->state.duty_cycle ? state->enabled : false;
+
+	if (pwm->state.period != state->period) {
+		pwm->state.period = state->period;
+		pwm->state.duty_cycle = state->period / 2;
+	} else if (pwm->state.duty_cycle != state->duty_cycle) {
+		pwm->state.duty_cycle = state->duty_cycle;
+		pwm->state.period = state->duty_cycle * 2;
+	}
+
+	start_output = state->enabled && !pwm->state.enabled;
+	if (start_output || change_period) {
+		art_period = convert_art_ns_to_art(pwm->state.duty_cycle);
+		if (art_period < MIN_ART_PERIOD) {
+			ret = -EINVAL;
+			goto out;
+		}
+		tio->half_period = pwm->state.duty_cycle;
+	}
+
+	if (start_output) {
+		u64 start_time;
+		u32 nsec;
+
+		pwm->state.enabled = true;
+		start_time = ktime_get_real_ns();
+		div_u64_rem(start_time, NSEC_PER_SEC, &nsec);
+		start_time -= nsec;
+		start_time += 2 * NSEC_PER_SEC;
+		_intel_pmc_tio_direction_output(tio, pwm->hwpwm, 0, art_period);
+		ret = _intel_pmc_tio_generate_output(tio, pwm->hwpwm,
+						     start_time);
+		if (ret)
+			goto out;
+	} else if (change_period && tio->last_art_period != art_period) {
+		INTEL_PMC_TIO_WR_REG(TGPIOPIV31_0, art_period & 0xFFFFFFFF);
+		INTEL_PMC_TIO_WR_REG(TGPIOPIV63_32, art_period >> 32);
+		tio->last_art_period = art_period;
+	}
+
+out:
+	mutex_unlock(&tio->lock);
+
+	return ret;
+}
+
+/* Get initial state */
+static void intel_pmc_tio_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+					struct pwm_state *state)
+{
+	struct intel_pmc_tio_pwm *tio_pwm = pch_to_intel_pmc_tio_pwm(chip);
+	struct intel_pmc_tio_chip *tio = tio_pwm->tio;
+	u32 ctrl;
+
+	mutex_lock(&tio->lock);
+
+	ctrl = INTEL_PMC_TIO_RD_REG(TGPIOCTL);
+	state->enabled = ctrl & TGPIOCTL_EN && ctrl & TGPIOCTL_PM &&
+			!(ctrl & TGPIOCTL_DIR) ? true : false;
+
+	state->duty_cycle = tio->half_period;
+	state->period = state->duty_cycle * 2;
+
+	mutex_unlock(&tio->lock);
+}
+
+static void intel_pmc_tio_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct intel_pmc_tio_pwm *tio_pwm = pch_to_intel_pmc_tio_pwm(chip);
+	struct intel_pmc_tio_chip *tio = tio_pwm->tio;
+
+	tio->half_period = pwm->state.duty_cycle;
+
+	gpiochip_free_own_desc(tio_pwm->gpiod);
+	tio_pwm->gpiod = NULL;
+}
+
+static const struct pwm_ops intel_pmc_tio_pwm_ops = {
+	.request = intel_pmc_tio_pwm_request,
+	.free = intel_pmc_tio_pwm_free,
+	.apply = intel_pmc_tio_pwm_apply,
+	.get_state = intel_pmc_tio_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
 static int intel_pmc_tio_probe(struct platform_device *pdev)
 {
+	struct intel_pmc_tio_pwm *tio_pwm;
 	struct intel_pmc_tio_chip *tio;
 	int err;
 
@@ -479,11 +672,29 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto out_recurse_remove_tio_root;
 
+	tio_pwm = devm_kzalloc(&pdev->dev, sizeof(*tio_pwm), GFP_KERNEL);
+	if (!tio_pwm) {
+		err = -ENOMEM;
+		goto out_recurse_remove_tio_root;
+	}
+
+	tio_pwm->tio = tio;
+	tio_pwm->pch.dev = &pdev->dev;
+	tio_pwm->pch.ops = &intel_pmc_tio_pwm_ops;
+	tio_pwm->pch.npwm = GPIO_COUNT;
+	tio_pwm->pch.base = -1;
+
+	err = pwmchip_add(&tio_pwm->pch);
+	if (err)
+		goto out_recurse_remove_tio_root;
+
+	/* Make sure tio and device state are sync'd to a reasonable value */
+	tio->half_period = NSEC_PER_SEC / 2;
+
 	return 0;
 
 out_recurse_remove_tio_root:
 	debugfs_remove_recursive(tio->root);
-
 	return err;
 }
 
-- 
2.17.1

