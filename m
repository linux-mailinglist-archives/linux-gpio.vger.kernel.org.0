Return-Path: <linux-gpio+bounces-17220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E1A55FE7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 06:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ECFF177968
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 05:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF8219CD16;
	Fri,  7 Mar 2025 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiOxcBQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190F19C566;
	Fri,  7 Mar 2025 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324985; cv=none; b=Xy/WcEBJhV1vJM4ER4Xv+CGRb8W3853EQmy9jTR0cex3djBBa7FtZ0XqjCXMvwbr+y8KCl9jUMqK9kAt7ov1a9BhfmZqZOJPTuDDKdpPVQRZBDHR3fV9fhTaseGdCn+slJnvD3r84YejjbWbvGklRSIRgmnFc+BtcfQKCGhF0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324985; c=relaxed/simple;
	bh=hFUryWsDI/x1+UyJwD1J1wtnUu6+KwV5oMs/3+d9nec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fzDAxv3LrOKXkQtCQA1Vr5NH6ccXd5nv+Vd3whg2lJ+F1QPRzCPW6A0nKF/jOIQY3wy0MrzrFU6qwuJ8GgdoVj6XNLSTIw1LLth105qiscEVsePoVFudPUSTF2DbqbDR3W0ME+9R/S2nWo3t2QEArZveYis+BvcjGtITRaXAmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiOxcBQF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324983; x=1772860983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFUryWsDI/x1+UyJwD1J1wtnUu6+KwV5oMs/3+d9nec=;
  b=BiOxcBQFgFgm5C6YLeCCTRANp6Pawufr8vMNB1F0mCrLPIYnybEbLiih
   F6DhUwB4JRcQ99cYQs6S7jmdq5EagJvpA2y327qVf+51BwkyNS31+myD/
   TZ2YydWQoiEWmb1BKmBNAXnbdu2uwOaJ3nZkV+cFnOMHIk8A/N9DgzHjd
   mD2iX0hDsC/JI5CBJOPkpU+GtiaKN6Qt7q3cR4T6nq2MRWqwJlLfWvEH3
   kPXuFjlPkTLNo0Yz+rfrB2JYtW/IFnJrxFDj9iW4wdrH+QhjSzhaGs21/
   mwWtRSR7qOnlwbqZiHksoqGEbTVEzYt9hmByG1rlS5AEZmcaW/vFlCp4T
   Q==;
X-CSE-ConnectionGUID: 12Thrk1GTyumCSZQM1f+hw==
X-CSE-MsgGUID: RQAkLRrcRRCOSyzpw2P/VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46292956"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46292956"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:23:03 -0800
X-CSE-ConnectionGUID: +TapA2RkSEObncd1Q65a0g==
X-CSE-MsgGUID: OI9zxtdQRYyG57yj89qtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119232167"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 21:23:00 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 4/5] pps: generators: tio: move to match_data() model
Date: Fri,  7 Mar 2025 10:52:30 +0530
Message-Id: <20250307052231.551737-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307052231.551737-1-raag.jadav@intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use device_get_match_data() which allows configuring platform
specific data like number of pins and MMIO registers for TIO.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pps/generators/pps_gen_tio.c | 33 ++++++++++++++++++++--------
 drivers/pps/generators/pps_gen_tio.h | 19 +++++++++++++---
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/pps/generators/pps_gen_tio.c b/drivers/pps/generators/pps_gen_tio.c
index 7f2aab1219af..6e3a4b198259 100644
--- a/drivers/pps/generators/pps_gen_tio.c
+++ b/drivers/pps/generators/pps_gen_tio.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pps_gen_kernel.h>
+#include <linux/property.h>
 #include <linux/timekeeping.h>
 #include <linux/types.h>
 
@@ -28,7 +29,7 @@ static inline u32 pps_tio_read(u32 offset, struct pps_tio *tio)
 
 static inline void pps_ctl_write(u32 value, struct pps_tio *tio)
 {
-	writel(value, tio->base + TIOCTL);
+	writel(value, tio->base + tio->regs.ctl);
 }
 
 /*
@@ -37,7 +38,7 @@ static inline void pps_ctl_write(u32 value, struct pps_tio *tio)
  */
 static inline void pps_compv_write(u64 value, struct pps_tio *tio)
 {
-	hi_lo_writeq(value, tio->base + TIOCOMPV);
+	hi_lo_writeq(value, tio->base + tio->regs.compv);
 }
 
 static inline ktime_t first_event(struct pps_tio *tio)
@@ -49,7 +50,7 @@ static u32 pps_tio_disable(struct pps_tio *tio)
 {
 	u32 ctrl;
 
-	ctrl = pps_tio_read(TIOCTL, tio);
+	ctrl = pps_tio_read(tio->regs.ctl, tio);
 	pps_compv_write(0, tio);
 
 	ctrl &= ~TIOCTL_EN;
@@ -63,7 +64,7 @@ static void pps_tio_enable(struct pps_tio *tio)
 {
 	u32 ctrl;
 
-	ctrl = pps_tio_read(TIOCTL, tio);
+	ctrl = pps_tio_read(tio->regs.ctl, tio);
 	ctrl |= TIOCTL_EN;
 	pps_ctl_write(ctrl, tio);
 	tio->pps_gen->enabled = true;
@@ -112,7 +113,7 @@ static enum hrtimer_restart hrtimer_callback(struct hrtimer *timer)
 	 * Check if any event is missed.
 	 * If an event is missed, TIO will be disabled.
 	 */
-	event_count = pps_tio_read(TIOEC, tio);
+	event_count = pps_tio_read(tio->regs.ec, tio);
 	if (tio->prev_count && tio->prev_count == event_count)
 		goto err;
 	tio->prev_count = event_count;
@@ -172,6 +173,7 @@ static int pps_tio_get_time(struct pps_gen_device *pps_gen,
 static int pps_gen_tio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct pps_tio_data *data;
 	struct pps_tio *tio;
 
 	if (!(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ) &&
@@ -184,6 +186,11 @@ static int pps_gen_tio_probe(struct platform_device *pdev)
 	if (!tio)
 		return -ENOMEM;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	tio->regs = data->regs;
 	tio->gen_info.use_system_clock = true;
 	tio->gen_info.enable = pps_tio_gen_enable;
 	tio->gen_info.get_time = pps_tio_get_time;
@@ -216,11 +223,19 @@ static void pps_gen_tio_remove(struct platform_device *pdev)
 	pps_gen_unregister_source(tio->pps_gen);
 }
 
+static const struct pps_tio_data pmc_data = {
+	.regs = {
+		.ctl = TIOCTL_PMC,
+		.compv = TIOCOMPV_PMC,
+		.ec = TIOEC_PMC,
+	},
+};
+
 static const struct acpi_device_id intel_pmc_tio_acpi_match[] = {
-	{ "INTC1021" },
-	{ "INTC1022" },
-	{ "INTC1023" },
-	{ "INTC1024" },
+	{ "INTC1021", (kernel_ulong_t)&pmc_data },
+	{ "INTC1022", (kernel_ulong_t)&pmc_data },
+	{ "INTC1023", (kernel_ulong_t)&pmc_data },
+	{ "INTC1024", (kernel_ulong_t)&pmc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, intel_pmc_tio_acpi_match);
diff --git a/drivers/pps/generators/pps_gen_tio.h b/drivers/pps/generators/pps_gen_tio.h
index 5033d5efdf92..4329b6dbd598 100644
--- a/drivers/pps/generators/pps_gen_tio.h
+++ b/drivers/pps/generators/pps_gen_tio.h
@@ -18,9 +18,10 @@
 
 struct device;
 
-#define TIOCTL			0x00
-#define TIOCOMPV		0x10
-#define TIOEC			0x30
+/* PMC Registers */
+#define TIOCTL_PMC			0x00
+#define TIOCOMPV_PMC			0x10
+#define TIOEC_PMC			0x30
 
 /* Control Register */
 #define TIOCTL_EN			BIT(0)
@@ -36,9 +37,21 @@ struct device;
 #define MAGIC_CONST			(NSEC_PER_SEC - SAFE_TIME_NS)
 #define ART_HW_DELAY_CYCLES		2
 
+struct pps_tio_regs {
+	u32 ctl;
+	u32 compv;
+	u32 ec;
+};
+
+struct pps_tio_data {
+	struct pps_tio_regs regs;
+	u32 num_pins;
+};
+
 struct pps_tio {
 	struct pps_gen_source_info gen_info;
 	struct pps_gen_device *pps_gen;
+	struct pps_tio_regs regs;
 	struct hrtimer timer;
 	void __iomem *base;
 	u32 prev_count;
-- 
2.34.1


