Return-Path: <linux-gpio+bounces-16891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D04A4B73D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8B93B048C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78471E5B6F;
	Mon,  3 Mar 2025 04:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQcPQTy7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040751E5706;
	Mon,  3 Mar 2025 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977280; cv=none; b=LqxHNwJE2d7f6Umi2ALP0uBsd/X1GzOpi4MOjkuVUnG2j7/kVZt9aXzmm/NaGMspLB2zFKC98/YjN/BZmfxYOuqtVRUB0wkK7KwYAjOspgkzUwckkCQP6BKKNICzWScpt7iSiUxpk7MsZUWGSzb1cHHV3zUN6C5LGbZcLfQZ5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977280; c=relaxed/simple;
	bh=hFUryWsDI/x1+UyJwD1J1wtnUu6+KwV5oMs/3+d9nec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uPTtWMdBK7QDRPRJomCVIF4+HjTWlrixgsGDg4gLbzXpy5tQWgyP41iC/TBTNU+9AJAg9VlnrgYGILTZyMHb192Zsj17VkpzXE4Ztwe1FdkDjqMutk5drF3mYUKetHLU+xMmk9zXDYG3iXOCZ6Op9bXDEW2I2uNR9wTxozLznzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQcPQTy7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977279; x=1772513279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFUryWsDI/x1+UyJwD1J1wtnUu6+KwV5oMs/3+d9nec=;
  b=BQcPQTy7wnO9tgNVd0ZLMQlvHabn5T8DJLuLcvfW4JLwUMQ4Co5FI2Fd
   iFwDK+NtaXTrHoxGbRQj/BRGl91ok4ZzukqezYAUYP+1ao7E0XiL4O74h
   l6PaRbzH8ggIHWveA6UsN7XL17eGhdCbuMrovGuE0LLXejt9/1pZXwAQN
   wvQYg/jSlcJR6P4lMvDWD+2x5EIk+8WJK8azFHmhcDkJiim9dwurU/W5E
   Li1LmcbtV/OyLc6+tjJRZHF7gC+tarIeh7sjadyQnqUvfk8nlDjk3IjOf
   60IT+nslbznya2ObN1x6Hdk+nJQBPFR6cBk3kSJpyCu26LqvbCRwFfAf2
   Q==;
X-CSE-ConnectionGUID: /QrkII0wQTqJekX2LmRjAw==
X-CSE-MsgGUID: 94/fSLAwTLubO0Yfbpga7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382085"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:47:58 -0800
X-CSE-ConnectionGUID: qD23Thi5Ram65Z9cuXRtWw==
X-CSE-MsgGUID: UlEJPod2TwyXiIBMmFrWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123964"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:56 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 4/5] pps: generators: tio: move to match_data() model
Date: Mon,  3 Mar 2025 10:17:44 +0530
Message-Id: <20250303044745.268964-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303044745.268964-1-raag.jadav@intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
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


