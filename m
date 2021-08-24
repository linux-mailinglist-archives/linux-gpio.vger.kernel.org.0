Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8713F632F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhHXQuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:10295 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233960AbhHXQtv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550784"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036922"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:45 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 14/20] arch/x86: Add ART nanosecond to ART conversion
Date:   Tue, 24 Aug 2021 22:17:55 +0530
Message-Id: <20210824164801.28896-15-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

The PWM 'apply' interface uses units of nominal nanoseconds for period and
the Intel(R) PMC Timed I/O hardware requires a period in terms of ART
cycles. Add a function using ART conversion coefficients determined at boot
time by the TSC initialization code to convert from ART in nominal
nanoseconds to ART cycles.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index f1de7ede3ec9..e53507df92e1 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -34,6 +34,7 @@ extern u64 read_art_time(void);
 extern int convert_tsc_to_art(const struct system_counterval_t *tsc, u64 *art);
 extern struct system_counterval_t convert_art_to_tsc(u64 art);
 extern struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns);
+extern u64 convert_art_ns_to_art(u64 art_ns);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 040109228100..381d15894dd2 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1329,6 +1329,38 @@ struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns)
 }
 EXPORT_SYMBOL(convert_art_ns_to_tsc);
 
+/*
+ * convert_art_ns_to_art() - Convert ART in nanoseconds to ART
+ * @art_ns: ART (Always Running Timer) in nominal nanoseconds
+ *
+ * Computes the ART cycles given the duration in nominal nanoseconds
+ *
+ * This is valid when CPU feature flag X86_FEATURE_TSC_KNOWN_FREQ is set
+ * indicating the tsc_khz is derived from CPUID[15H]. Drivers should check
+ * that this flag is set before conversion to ART is attempted.
+ *
+ * Return:
+ *	u64 ART value rounded to nearest cycle corresponding to nanosecond
+ *	duration input
+ */
+u64 convert_art_ns_to_art(u64 art_ns)
+{
+	u64 tmp, res, rem;
+	u32 crystal_khz;
+
+	crystal_khz = (tsc_khz * art_to_tsc_denominator) /
+		art_to_tsc_numerator;
+
+	rem = do_div(art_ns, USEC_PER_SEC);
+	res = art_ns * crystal_khz;
+	tmp = rem * crystal_khz;
+
+	rem = do_div(tmp, USEC_PER_SEC);
+	res += rem < USEC_PER_SEC / 2 ? tmp : tmp + 1;
+
+	return res;
+}
+EXPORT_SYMBOL(convert_art_ns_to_art);
 
 static void tsc_refine_calibration_work(struct work_struct *work);
 static DECLARE_DELAYED_WORK(tsc_irqwork, tsc_refine_calibration_work);
-- 
2.17.1

