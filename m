Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983CF3F633D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbhHXQu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:10298 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233970AbhHXQtw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550799"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550799"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036936"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:48 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 15/20] pwm: Add capability for PWM Driver managed state
Date:   Tue, 24 Aug 2021 22:17:56 +0530
Message-Id: <20210824164801.28896-16-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

Add additional flag that can be set by drivers to indicate that the
driver will manage its own PWM state. When calling pwm_ops.apply the
driver applies the requested state change to the pwm_device reconciling,
if possible, any conflicting requests.

Intel(R) Timed I/O devices support very limited PWM capabilities. The
duty cycle must always be 50% of the period. When changing one parameter
at a time through the sysfs interface, it isn't possible for the user or
the PWM subsystem to maintain this relation.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/pwm/core.c  | 3 ++-
 include/linux/pwm.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 35e894f4a379..c658585ac3bc 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -554,7 +554,8 @@ int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 
 		trace_pwm_apply(pwm, state);
 
-		pwm->state = *state;
+		if (!test_bit(PWMF_DRIVERMANAGEDSTATE, &pwm->flags))
+			pwm->state = *state;
 
 		/*
 		 * only do this after pwm->state was applied as some
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index a0b7e43049d5..d805fee81e2c 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -46,6 +46,7 @@ struct pwm_args {
 enum {
 	PWMF_REQUESTED = 1 << 0,
 	PWMF_EXPORTED = 1 << 1,
+	PWMF_DRIVERMANAGEDSTATE = 1 << 2,
 };
 
 /*
-- 
2.17.1

