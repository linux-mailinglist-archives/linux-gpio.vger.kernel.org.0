Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8A83F632E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbhHXQuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:10241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233433AbhHXQtP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550718"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550718"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036822"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:26 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 08/20] kernel: time: Add system time to system counter translation
Date:   Tue, 24 Aug 2021 22:17:49 +0530
Message-Id: <20210824164801.28896-9-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

The GPIOlib event generation interface supplies a time in terms of the
realtime system clock. The driver must translate the system clock to
something meaningful to the hardware.

The Intel(R) PMC Timed I/O hardware uses ART to trigger events. For
most Intel(R) platforms that use TSC for timekeeping this added
function translates from system clock to TSC. The relation between TSC
and ART is easily derived from CPUID[15H].

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 include/linux/timekeeping.h |  3 ++
 kernel/time/timekeeping.c   | 63 +++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index 78a98bdff76d..46ee524ca1a0 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -277,6 +277,9 @@ struct system_counterval_t {
 	struct clocksource	*cs;
 };
 
+extern int ktime_convert_real_to_system_counter(ktime_t sys_realtime,
+						struct system_counterval_t *ret);
+
 /*
  * Get cross timestamp between system clock and device clock
  */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 8a364aa9881a..69e4be8f1bfb 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -369,6 +369,31 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 
 /* Timekeeper helper functions. */
 
+#ifdef CONFIG_ARCH_USES_GETTIMEOFFSET
+static u32 default_arch_gettimeoffset(void) { return 0; }
+u32 (*arch_gettimeoffset)(void) = default_arch_gettimeoffset;
+#else
+static inline u32 arch_gettimeoffset(void) { return 0; }
+#endif
+
+static inline u64 timekeeping_ns_delta_to_cycles(const struct tk_read_base *tkr,
+						 u64 nsec)
+{
+	u64 cycles;
+
+	/* If arch requires, subtract get_arch_timeoffset() */
+	cycles = nsec - arch_gettimeoffset();
+
+	if (fls64(cycles) + tkr->shift > sizeof(cycles) * 8)
+		return (typeof(cycles))-1;
+
+	cycles <<= tkr->shift;
+	cycles -= tkr->xtime_nsec;
+	do_div(cycles, tkr->mult);
+
+	return cycles;
+}
+
 static inline u64 timekeeping_delta_to_ns(const struct tk_read_base *tkr, u64 delta)
 {
 	u64 nsec;
@@ -1284,6 +1309,44 @@ int get_device_system_crosststamp(int (*get_time_fn)
 }
 EXPORT_SYMBOL_GPL(get_device_system_crosststamp);
 
+/**
+ * ktime_convert_real_to_system_counter - Convert system time to counter value
+ * @sys_realtime:	REALTIME clock value to convert
+ * @ret:		Computed system counter value with clocksource pointer
+ *
+ * Converts a supplied, future REALTIME clock value to the corresponding
+ *	system counter value. Returns current clock source in 'ret'.
+ */
+int ktime_convert_real_to_system_counter(ktime_t sys_realtime,
+					 struct system_counterval_t *ret)
+{
+	struct timekeeper *tk = &tk_core.timekeeper;
+	u64 ns_delta;
+	ktime_t base_real;
+	unsigned int seq;
+
+	do {
+		seq = read_seqcount_begin(&tk_core.seq);
+
+		base_real = ktime_add(tk->tkr_mono.base,
+				      tk_core.timekeeper.offs_real);
+		if (ktime_compare(sys_realtime, base_real) < 0)
+			return -EINVAL;
+
+		ret->cs = tk->tkr_mono.clock;
+		ns_delta = ktime_to_ns(ktime_sub(sys_realtime, base_real));
+		ret->cycles = timekeeping_ns_delta_to_cycles(&tk->tkr_mono,
+							     ns_delta);
+		if (ret->cycles == (typeof(ret->cycles))-1)
+			return -ERANGE;
+
+		ret->cycles += tk->tkr_mono.cycle_last;
+	} while (read_seqcount_retry(&tk_core.seq, seq));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ktime_convert_real_to_system_counter);
+
 /**
  * do_settimeofday64 - Sets the time of day.
  * @ts:     pointer to the timespec64 variable containing the new time
-- 
2.17.1

