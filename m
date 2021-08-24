Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27203F6332
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbhHXQuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:10295 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233500AbhHXQuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:50:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550815"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036954"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:53 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 17/20] pwm: Add second alignment to the core PWM interface
Date:   Tue, 24 Aug 2021 22:17:58 +0530
Message-Id: <20210824164801.28896-18-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

The Intel(R) PMC Timed I/O driver uses the PWM interface to export a
clock from the platform. Normally, PWM output is not phase aligned to
any clock. To remedy this: add an additional PWM state parameter
specifying alignment in nanoseconds within the output period.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/pwm/core.c  |  7 +++++--
 drivers/pwm/sysfs.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/pwm.h |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index c658585ac3bc..5d6c64916e51 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -271,6 +271,7 @@ int pwmchip_add(struct pwm_chip *chip)
 		pwm->chip = chip;
 		pwm->pwm = chip->base + i;
 		pwm->hwpwm = i;
+		pwm->state.alignment = 0;
 
 		radix_tree_insert(&pwm_tree, pwm->pwm, pwm);
 	}
@@ -535,7 +536,8 @@ int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 	int err;
 
 	if (!pwm || !state || !state->period ||
-	    state->duty_cycle > state->period)
+	    state->duty_cycle > state->period ||
+	    state->alignment >= state->period)
 		return -EINVAL;
 
 	chip = pwm->chip;
@@ -544,7 +546,8 @@ int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 	    state->duty_cycle == pwm->state.duty_cycle &&
 	    state->polarity == pwm->state.polarity &&
 	    state->enabled == pwm->state.enabled &&
-	    state->usage_power == pwm->state.usage_power)
+	    state->usage_power == pwm->state.usage_power &&
+	    state->alignment == pwm->state.alignment)
 		return 0;
 
 	if (chip->ops->apply) {
diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
index 9903c3a7eced..5d020618d8ba 100644
--- a/drivers/pwm/sysfs.c
+++ b/drivers/pwm/sysfs.c
@@ -33,6 +33,41 @@ static struct pwm_device *child_to_pwm_device(struct device *child)
 	return export->pwm;
 }
 
+static ssize_t alignment_show(struct device *child,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	const struct pwm_device *pwm = child_to_pwm_device(child);
+	struct pwm_state state;
+
+	pwm_get_state(pwm, &state);
+
+	return sprintf(buf, "%llu\n", state.alignment);
+}
+
+static ssize_t alignment_store(struct device *child,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	struct pwm_export *export = child_to_pwm_export(child);
+	struct pwm_device *pwm = export->pwm;
+	struct pwm_state state;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	mutex_lock(&export->lock);
+	pwm_get_state(pwm, &state);
+	state.alignment = val;
+	ret = pwm_apply_state(pwm, &state);
+	mutex_unlock(&export->lock);
+
+	return ret ? : size;
+}
+
 static ssize_t period_show(struct device *child,
 			   struct device_attribute *attr,
 			   char *buf)
@@ -219,6 +254,7 @@ static DEVICE_ATTR_RW(period);
 static DEVICE_ATTR_RW(duty_cycle);
 static DEVICE_ATTR_RW(enable);
 static DEVICE_ATTR_RW(polarity);
+static DEVICE_ATTR_RW(alignment);
 static DEVICE_ATTR_RO(capture);
 
 static struct attribute *pwm_attrs[] = {
@@ -226,6 +262,7 @@ static struct attribute *pwm_attrs[] = {
 	&dev_attr_duty_cycle.attr,
 	&dev_attr_enable.attr,
 	&dev_attr_polarity.attr,
+	&dev_attr_alignment.attr,
 	&dev_attr_capture.attr,
 	NULL
 };
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index d805fee81e2c..17ca1ea7ba94 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -59,6 +59,7 @@ enum {
  *               output but has more freedom regarding signal form.
  *               If supported, the signal can be optimized, for example to
  *               improve EMI by phase shifting individual channels.
+ * @alignment: offset in ns to device clock second
  */
 struct pwm_state {
 	u64 period;
@@ -66,6 +67,7 @@ struct pwm_state {
 	enum pwm_polarity polarity;
 	bool enabled;
 	bool usage_power;
+	u64 alignment;
 };
 
 /**
-- 
2.17.1

