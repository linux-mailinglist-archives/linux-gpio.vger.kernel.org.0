Return-Path: <linux-gpio+bounces-17219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD4A55FE4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 06:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8F91775DC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 05:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E7019ABAC;
	Fri,  7 Mar 2025 05:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOBTSd0y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AFF199235;
	Fri,  7 Mar 2025 05:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324982; cv=none; b=VinMAnLFA62KB44OsIvomkN9H3yLA3MCK2atat58uck33GqCblIhrIbeZUzBuKLE070WS+fylKMDFk66yU7BKgnRqRGYnE4nVM3yxqoeH2si/uTfkc0Wr3c5PVppRf7yJSk2+ak0fR8fYnyRTsT/yruA4segRP/RWrHs5DEMYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324982; c=relaxed/simple;
	bh=ly2+UQPrNEC+dhK+lw2hYNlNtYQJW3WWubbEtSJyOss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HyW5CM1SMCztUXVt+sJevMSV9/qkPjXdLwP4lm6jorWDkNhIxP3hvgy95lYbsJ66MyoZnrkWdI97IMrW/n6SQqi6cr6Z9v+vDr5pBbFG4yL8/qqpNWJUHX2ZZDoA0cmfkzKHq5FF4XCTybHEWsBhesWNhnE/8TkRg74Swvw3MwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOBTSd0y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324980; x=1772860980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ly2+UQPrNEC+dhK+lw2hYNlNtYQJW3WWubbEtSJyOss=;
  b=gOBTSd0yDW3eO0eJFVZMq04wGhSWwYOR4kcM9tRV2A8BTYvShWeATCNK
   InLxt0XGai+1HYTq+MI4FPWFFrK2GOJnsjnHqJQDgCZwNsWkMBIqb6Nw7
   4KCzVMlT1ZLwTnS8Jk2vtpi9AjhQPPecU/XQ+T3dCGRpjwyrzxY+TgXqx
   eWWc/QzGnbqVNvF1mEbuztw/vwB2LFLJJ8kZgcJAXNtwi2hDfnfTr7s6z
   5nhiZAj4taoc6p1akqnkETMy2zgDUaZZNbXGQoNjmA1Pox9K1vynWxInF
   sCJdmmQoMu9UcQ4lzOsd+15erI+3Aglp8qlmn22WaDsmdhYcV4fPDZ841
   g==;
X-CSE-ConnectionGUID: iMWFpdZSRiiWEoDY+QhrpQ==
X-CSE-MsgGUID: 9sMEvpY+Q46A7hH9vQAx6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46292951"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46292951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:23:00 -0800
X-CSE-ConnectionGUID: FFKrmnI2RIGY2kFG6XLzsQ==
X-CSE-MsgGUID: LTKRDJU5RV6KvAn3IWb5lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119232162"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 21:22:57 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/5] pps: generators: tio: split pps_gen_tio.h
Date: Fri,  7 Mar 2025 10:52:29 +0530
Message-Id: <20250307052231.551737-4-raag.jadav@intel.com>
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


