Return-Path: <linux-gpio+bounces-30469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7ED17DEB
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBD863002B90
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E630F340D86;
	Tue, 13 Jan 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSnCPVMb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B5389471;
	Tue, 13 Jan 2026 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298964; cv=none; b=F8C29wR/ZuAXunVOzRW9xXnNmRJVCtF3LtF0GkuSzUZ915pyEH3eQIMUe4wO++tYU1HgG9rLII0rz4M0EzlgdNjDdeEOftFCRe4DeT8BFCzXSE2boxF26FSHUvOErtEvnT9ETqQbJ7S6BUV1J3uACK8dU1MjCQZQbiwz4Xij3XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298964; c=relaxed/simple;
	bh=onoSheMZeMETO1XT2Xbd67jToSe4R4peJZ0aLgTxIxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApR/pv6QYGkm7ualit/tzJnbR8vVuzxOIKU3w3iJ5zzjG7MRqK8igcrfl8/f69xJGzJtBD+jSDtRRoatF/U0QUgP6z5wQF0HC9Tync3DGJIPOqJ9OVNTk4p2HoWKMY1uUh8JM0ekth69KS4f9IAab36X3kFoSGVyqw6m0+sWOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSnCPVMb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298960; x=1799834960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=onoSheMZeMETO1XT2Xbd67jToSe4R4peJZ0aLgTxIxg=;
  b=aSnCPVMbGFd6i1ROzPU9+SXEPCigLvDxV7p8xLHCu1ZByjaA+bGxCWjs
   oD0DWmHQpsgg/AoAt0KL/tugXp2Z8Do4+NMkUK/O9YB8XXDLvb8+LRvNE
   87OS7JU8M0dd9TSh76IwYz5njkQB18koWbwawUUPCnlxcMlDMqDaPFuu6
   YN6hg8KVqqJFjMWRVgqve3od9frkju30enQGHUzXl94iCLJdJD1Il/8O1
   Y35c6mRfLjlr818T/5PxC2IP1+STWT4Qys0jzyL9xWG5lWvdmRbu4XmPs
   WQk5JVs5BYKfWQFeUVm9++vdagsIbaKRDOSI9K3z35uHryyPKOxgU0tSl
   Q==;
X-CSE-ConnectionGUID: DWQ6HcWsQO2qxPjJLIqCkw==
X-CSE-MsgGUID: zUIh2RQsQi+UAB57VtH8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69637698"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69637698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:09:19 -0800
X-CSE-ConnectionGUID: UjSJoQ/ESYa3+azA2z/hjw==
X-CSE-MsgGUID: XepG0crlTXanJp9hmsZvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203555914"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 02:09:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 371C49B; Tue, 13 Jan 2026 11:09:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 2/3] gpio: pca9570: Don't use "proxy" headers
Date: Tue, 13 Jan 2026 11:08:05 +0100
Message-ID: <20260113100913.136777-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca9570.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index eae35135c71e..a41837f1201b 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -9,11 +9,15 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/bits.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 #define SLG7XL45106_GPO_REG	0xDB
 
-- 
2.50.1


