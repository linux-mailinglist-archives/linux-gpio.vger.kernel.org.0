Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868DB3F6336
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhHXQuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:18 -0400
Received: from mga02.intel.com ([134.134.136.20]:10298 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233839AbhHXQuP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:50:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550829"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550829"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036975"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:56 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 18/20] gpio: Add PWM alignment support to the Intel(R) PMC Timed I/O driver
Date:   Tue, 24 Aug 2021 22:17:59 +0530
Message-Id: <20210824164801.28896-19-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add capability to align PWM outbput with the realtime system clock by
adding an 'alignment' paramerter.  The realtime system clock is used
because it is already used for timestamping in GPIOlib and is easily
relatable to ART which drives the logic.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index f8981e1e92a4..1b0eea7b3b2f 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -56,11 +56,12 @@ struct intel_pmc_tio_chip {
 	bool systime_valid;
 	bool output_high;
 	unsigned int systime_index;
+	u32 half_period;
+	u32 alignment;
 	struct system_time_snapshot systime_snapshot[INPUT_SNAPSHOT_COUNT];
 	u64 last_event_count;
 	u64 last_art_timestamp;
 	u64 last_art_period;
-	u32 half_period;
 };
 
 struct intel_pmc_tio_pwm {
@@ -550,6 +551,7 @@ static int intel_pmc_tio_pwm_apply(struct pwm_chip *chip,
 		pwm->state.period = state->duty_cycle * 2;
 	}
 
+	pwm->state.alignment = state->alignment;
 	start_output = state->enabled && !pwm->state.enabled;
 	if (start_output || change_period) {
 		art_period = convert_art_ns_to_art(pwm->state.duty_cycle);
@@ -566,8 +568,9 @@ static int intel_pmc_tio_pwm_apply(struct pwm_chip *chip,
 
 		pwm->state.enabled = true;
 		start_time = ktime_get_real_ns();
-		div_u64_rem(start_time, NSEC_PER_SEC, &nsec);
+		div_u64_rem(start_time, pwm->state.period, &nsec);
 		start_time -= nsec;
+		start_time += pwm->state.alignment;
 		start_time += 2 * NSEC_PER_SEC;
 		_intel_pmc_tio_direction_output(tio, pwm->hwpwm, 0, art_period);
 		ret = _intel_pmc_tio_generate_output(tio, pwm->hwpwm,
@@ -602,6 +605,7 @@ static void intel_pmc_tio_pwm_get_state(struct pwm_chip *chip, struct pwm_device
 
 	state->duty_cycle = tio->half_period;
 	state->period = state->duty_cycle * 2;
+	state->alignment = tio->alignment;
 
 	mutex_unlock(&tio->lock);
 }
@@ -612,6 +616,7 @@ static void intel_pmc_tio_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm
 	struct intel_pmc_tio_chip *tio = tio_pwm->tio;
 
 	tio->half_period = pwm->state.duty_cycle;
+	tio->alignment = pwm->state.alignment;
 
 	gpiochip_free_own_desc(tio_pwm->gpiod);
 	tio_pwm->gpiod = NULL;
@@ -689,6 +694,7 @@ static int intel_pmc_tio_probe(struct platform_device *pdev)
 		goto out_recurse_remove_tio_root;
 
 	/* Make sure tio and device state are sync'd to a reasonable value */
+	tio->alignment = 0;
 	tio->half_period = NSEC_PER_SEC / 2;
 
 	return 0;
-- 
2.17.1

