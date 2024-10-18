Return-Path: <linux-gpio+bounces-11641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0679A404B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6218D1F29C23
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2761DEFE1;
	Fri, 18 Oct 2024 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6i6NlX7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD713EA76;
	Fri, 18 Oct 2024 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259159; cv=none; b=FFMY2OalqAy6odtZgHelgHH1X7kCG0HygGKH9jC/x1rZ47JLbTxLRoPRcUu282YW/eFZiBSBnQEPWhD0ux2zrAybXp18NRm5O71sYH8OPHMrRaOT4ynw15AcgGFWB7n33k/+OZNHjeNX5h0MIcoa+DWog544U4z+717rmhVN/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259159; c=relaxed/simple;
	bh=EaXsiVIiRgaxgG7fRrDXgJJ9N6V1vsqdPGrPgKw+2KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUlTnfE1yZxXFLXEKqza05czdqrP+WUjnPa0Ya44dSBPtHGxxYFfvNMv3qt0BV04UkggszPN9NC573o1dPgOTx6eVZyzns+EUhPcktyBzZbWzkhgMwFFH7qTunLWAc8MSAh/vL5Wh0wB9omRo+dQ2ug66y/r9DdYW/hX50c2+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6i6NlX7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259158; x=1760795158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EaXsiVIiRgaxgG7fRrDXgJJ9N6V1vsqdPGrPgKw+2KY=;
  b=h6i6NlX7MKRlOxNxrB+Xo5VvhSWRFxdGlxYZG/k1BLyEn0ChiyVW1vuk
   jPigWPcXEfCmRxdZDfPs4CZTaF8Juezo5t4ePZNUQMT3kPPckiE/Ugaic
   HxubA9c5onqsT3HM7hPi+HKyC4ljLOWzrtQ+XNAiy1YcQ0W8LXdfgpUKw
   5FgEsLDzOtxwVNJRkxb2xl6cuqO1gm73IjweMl9Vw5PkIhpX8NSO4CNaT
   T1HwzKDIi/KTrM9TnKWL5yWUcVro/AdxPBu+ocw4t6oU4+A+J0CEEB6xG
   GrB8yqR6sHO+8CkUewMgAHH4/ZehivCV0NbPnD9S9Gt0mTSaiu5MlNiLa
   g==;
X-CSE-ConnectionGUID: nPGzfGgvTrGvMZckfEyZyQ==
X-CSE-MsgGUID: UVVtN0MZRSmDLBEw/1qVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251811"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:45:57 -0700
X-CSE-ConnectionGUID: 4UoSXaaTQmaAMuziW1HNxQ==
X-CSE-MsgGUID: d9Syj35mTuWfG6acH3pmwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83936181"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CDC975A7; Fri, 18 Oct 2024 16:45:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 4/4] gpio: xgene-sb: don't use "proxy" headers
Date: Fri, 18 Oct 2024 16:45:03 +0300
Message-ID: <20241018134550.2071101-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
References: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 206f03a7a7aa..48b829733b15 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -8,12 +8,19 @@
  *		Quan Nguyen <qnguyen@apm.com>.
  */
 
-#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
 #include <linux/gpio/driver.h>
-#include <linux/acpi.h>
 
 #include "gpiolib-acpi.h"
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


