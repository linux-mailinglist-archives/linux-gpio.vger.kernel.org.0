Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2A63F6321
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhHXQtS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:18 -0400
Received: from mga02.intel.com ([134.134.136.20]:10241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233027AbhHXQtR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550726"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550726"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036842"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:30 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 09/20] arch: x86: Add TSC to ART translation
Date:   Tue, 24 Aug 2021 22:17:50 +0530
Message-Id: <20210824164801.28896-10-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add a function to convert TSC(Time Stamp Capture) time to ART.

The Intel(R) PMC Timed I/O device uses ART to trigger output events.

The TSC to ART translation converts the TSC value yielded by
ktime_convert_real_to_system_counter() to ART. The conversion is
required to program the COMPV register that will be compared against
the art time to generate output events.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 arch/x86/include/asm/tsc.h |  3 +++
 arch/x86/kernel/tsc.c      | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index a50b0102e5c1..f1de7ede3ec9 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -8,6 +8,8 @@
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 
+struct system_counterval_t;
+
 /*
  * Standard way to access the cycle counter.
  */
@@ -29,6 +31,7 @@ static inline cycles_t get_cycles(void)
 }
 
 extern u64 read_art_time(void);
+extern int convert_tsc_to_art(const struct system_counterval_t *tsc, u64 *art);
 extern struct system_counterval_t convert_art_to_tsc(u64 art);
 extern struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns);
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index bbab6cf1a73b..040109228100 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1231,22 +1231,43 @@ int unsynchronized_tsc(void)
 }
 
 /*
- * Converts the current TSC to the current ART value using conversion
+ * Converts input TSC to the corresponding ART value using conversion
  * factors discovered by detect_art()
  */
-u64 read_art_time(void)
+int convert_tsc_to_art(const struct system_counterval_t *system_counter, u64 *art)
 {
-	u64 tsc, tmp, res, rem;
+	u64 tmp, res, rem;
+
+	if (system_counter->cs != art_related_clocksource)
+		return -EINVAL;
 
-	tsc = read_tsc(NULL) - art_to_tsc_offset;
-	rem = do_div(tsc, art_to_tsc_numerator);
+	res = system_counter->cycles - art_to_tsc_offset;
+	rem = do_div(res, art_to_tsc_numerator);
 
-	res = tsc * art_to_tsc_denominator;
+	*art = res * art_to_tsc_denominator;
 	tmp = rem * art_to_tsc_denominator;
 
 	do_div(tmp, art_to_tsc_numerator);
+	*art += tmp;
+
+	return 0;
+}
+EXPORT_SYMBOL(convert_tsc_to_art);
+
+/*
+ * Converts the current TSC to the current ART value using conversion
+ * factors discovered by detect_art()
+ */
+u64 read_art_time(void)
+{
+	struct system_counterval_t tsc;
+	u64 art = 0;
+
+	tsc.cs = art_related_clocksource;
+	tsc.cycles = read_tsc(NULL);
+	convert_tsc_to_art(&tsc, &art);
 
-	return res + tmp;
+	return art;
 }
 EXPORT_SYMBOL(read_art_time);
 
-- 
2.17.1

