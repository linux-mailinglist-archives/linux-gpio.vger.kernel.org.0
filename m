Return-Path: <linux-gpio+bounces-16890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A0A4B73A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635AB1887D95
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2E51E51F5;
	Mon,  3 Mar 2025 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZDugyf3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB91E3DEB;
	Mon,  3 Mar 2025 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977277; cv=none; b=Q9IXwRdCCk67nxOrNKLJFnn12+dUSvuhO9XzZTNoxoCuWD/PNhFV2bWuuNTHyn7VG3iFU9sh44oQtJXHk4xcW9SIHPTPvvykiEPTAl4FLdoabw+dx1SM0RAtAPQihrJUzAXMJvOZiNXQFYWc/MJjv7AjeSZX9cjwckqKzWXtc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977277; c=relaxed/simple;
	bh=ly2+UQPrNEC+dhK+lw2hYNlNtYQJW3WWubbEtSJyOss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JRAI86lStzIArwem3tcOV5MPiug7oXOkNkCMCUjHeTNQF3VjYwDGt0hbTSRkKJTr+gjr8TLxEEgsx36en9h8PCwlyGhcL7Mp2BZKf7fN7AL/6Ro+Aqavwfm+irtX18PFJEaPRFiRLr6XB7IOj67XKd2tM/jqxlDnBed/F7z5dlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZDugyf3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977276; x=1772513276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ly2+UQPrNEC+dhK+lw2hYNlNtYQJW3WWubbEtSJyOss=;
  b=RZDugyf30aSTLmc562d3JfrZ1Pi6UoXnfpTuKWbV3zgPJoSC2t3aOih2
   rGP6iHNX6tqJiJM+XGSfWtA+uNjJtgfmhTl78HH8EYbqzoVf/HV1MVST1
   l7EMkKhNomh+YQAYnI5zk8wiQsSUD26H6hwKxRnbUsMzkByvj+kPv3F47
   S+wD48Ua/7tmAYXrYs9MC8sWdnkbPMHjvzwK0bvrMzPRO+rgCI77CGN48
   mAmf5KZU2XCPMqK6XfMVV9RA3CkrykUYElYFVb1lpHep7k0TSaCB/mebG
   VeOAiKX8E6tpACF+NhrtrYrfe9SJK0tI0p3/h83DJ+CrM6fRI+UMLQvxU
   A==;
X-CSE-ConnectionGUID: JKk+AvgpQfmtMP6GGbDeRA==
X-CSE-MsgGUID: XRdcpV2QTO+Eng9MAQPPqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382074"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:47:56 -0800
X-CSE-ConnectionGUID: P80XCKM+TiSSq6RM87gFHg==
X-CSE-MsgGUID: Y3je1SV1RSmL/0ns1gIf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123957"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:53 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/5] pps: generators: tio: split pps_gen_tio.h
Date: Mon,  3 Mar 2025 10:17:43 +0530
Message-Id: <20250303044745.268964-4-raag.jadav@intel.com>
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

Split macros and structure definition to header file for better
maintainability.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pps/generators/pps_gen_tio.c | 30 +----------------
 drivers/pps/generators/pps_gen_tio.h | 49 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 29 deletions(-)
 create mode 100644 drivers/pps/generators/pps_gen_tio.h

diff --git a/drivers/pps/generators/pps_gen_tio.c b/drivers/pps/generators/pps_gen_tio.c
index 6c46b46c66cd..7f2aab1219af 100644
--- a/drivers/pps/generators/pps_gen_tio.c
+++ b/drivers/pps/generators/pps_gen_tio.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2024 Intel Corporation
  */
 
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -21,33 +19,7 @@
 
 #include <asm/cpu_device_id.h>
 
-#define TIOCTL			0x00
-#define TIOCOMPV		0x10
-#define TIOEC			0x30
-
-/* Control Register */
-#define TIOCTL_EN			BIT(0)
-#define TIOCTL_DIR			BIT(1)
-#define TIOCTL_EP			GENMASK(3, 2)
-#define TIOCTL_EP_RISING_EDGE		FIELD_PREP(TIOCTL_EP, 0)
-#define TIOCTL_EP_FALLING_EDGE		FIELD_PREP(TIOCTL_EP, 1)
-#define TIOCTL_EP_TOGGLE_EDGE		FIELD_PREP(TIOCTL_EP, 2)
-
-/* Safety time to set hrtimer early */
-#define SAFE_TIME_NS			(10 * NSEC_PER_MSEC)
-
-#define MAGIC_CONST			(NSEC_PER_SEC - SAFE_TIME_NS)
-#define ART_HW_DELAY_CYCLES		2
-
-struct pps_tio {
-	struct pps_gen_source_info gen_info;
-	struct pps_gen_device *pps_gen;
-	struct hrtimer timer;
-	void __iomem *base;
-	u32 prev_count;
-	spinlock_t lock;
-	struct device *dev;
-};
+#include "pps_gen_tio.h"
 
 static inline u32 pps_tio_read(u32 offset, struct pps_tio *tio)
 {
diff --git a/drivers/pps/generators/pps_gen_tio.h b/drivers/pps/generators/pps_gen_tio.h
new file mode 100644
index 000000000000..5033d5efdf92
--- /dev/null
+++ b/drivers/pps/generators/pps_gen_tio.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel PPS signal Generator Driver
+ *
+ * Copyright (C) 2025 Intel Corporation
+ */
+
+#ifndef _PPS_GEN_TIO_H_
+#define _PPS_GEN_TIO_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/hrtimer.h>
+#include <linux/pps_gen_kernel.h>
+#include <linux/spinlock_types.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+struct device;
+
+#define TIOCTL			0x00
+#define TIOCOMPV		0x10
+#define TIOEC			0x30
+
+/* Control Register */
+#define TIOCTL_EN			BIT(0)
+#define TIOCTL_DIR			BIT(1)
+#define TIOCTL_EP			GENMASK(3, 2)
+#define TIOCTL_EP_RISING_EDGE		FIELD_PREP(TIOCTL_EP, 0)
+#define TIOCTL_EP_FALLING_EDGE		FIELD_PREP(TIOCTL_EP, 1)
+#define TIOCTL_EP_TOGGLE_EDGE		FIELD_PREP(TIOCTL_EP, 2)
+
+/* Safety time to set hrtimer early */
+#define SAFE_TIME_NS			(10 * NSEC_PER_MSEC)
+
+#define MAGIC_CONST			(NSEC_PER_SEC - SAFE_TIME_NS)
+#define ART_HW_DELAY_CYCLES		2
+
+struct pps_tio {
+	struct pps_gen_source_info gen_info;
+	struct pps_gen_device *pps_gen;
+	struct hrtimer timer;
+	void __iomem *base;
+	u32 prev_count;
+	spinlock_t lock;
+	struct device *dev;
+};
+
+#endif /* _PPS_GEN_TIO_H_ */
-- 
2.34.1


