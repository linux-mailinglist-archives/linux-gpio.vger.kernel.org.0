Return-Path: <linux-gpio+bounces-20833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E5AC9C96
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC4E18980B0
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 19:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFD519E98C;
	Sat, 31 May 2025 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgg4qCxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653CE2F30;
	Sat, 31 May 2025 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748721490; cv=none; b=CGLYjLz2OL8k1OoohISBPV5sbyQBRhp0CVm3Tj3KJBUHUV/KyWwsls3mHjJttvumVOC37ogSeKCkRh05FWrFFEAcIE+/osRa3ik2o2n2tpalR+WeSQ5tPYXjoyNciLCuOAmnWnj+AwapRBiLKSdgE34ZVs5+O+X/qd6zm+rB3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748721490; c=relaxed/simple;
	bh=cS6RetvDrJ54xQiduwGgcXfUkVI+OytEPSdpzia4usM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0kcw3FjCXvxtIE4fEEwTM1s/+cZNAWrhxa4Erc36TVxDnfUvQfbvk2wpZV0i+k9hJIoW+sRtpwJFWLpbxpOBSdoJ9Nr5s9ux1kDKT5GNlTivt2/N7fKJeHRGqfPKslmovyazMbuhbUSiEz+F6UbPEFCjOp2z0gRO6cuUhK65t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgg4qCxf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748721488; x=1780257488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cS6RetvDrJ54xQiduwGgcXfUkVI+OytEPSdpzia4usM=;
  b=Kgg4qCxfvwcoLKLPqSbOEKKuzZ39zvHUeVPljDaH55WjAIDL2KZh8H5K
   0ngfZLAHPdUrFYX92c5KgVvujS4Mwia+gS7JEVlEGH1mc6S39d5ZR2NO1
   DTDdjBaYMl3jtO0TeApZl9eyBUYILWgQIPgLaaHPzWiyxUdNLcqUbcnbS
   K5M5ebESCqbFVtgCttfAtTqQtYLMnUGLGDRrtJcfbcDyq9M3LgPYQ6/T9
   5oZMVej6bK0y0TjlrkyEJn9fUdPXQ7CLTKkCoXPynqByDofV4mMX3VqvM
   UQ0GvUUOuDH1QXDpi5ikoVg9t8Le3IuJeMn2z1Wqu0lJwFUd1ud6hjUkt
   g==;
X-CSE-ConnectionGUID: CM264ZbCTZWZXTqq9U8nww==
X-CSE-MsgGUID: ax6bk0HqQ8SB8OyLDTIntA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50886635"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50886635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:58:07 -0700
X-CSE-ConnectionGUID: ID8IbQcyS6mUPVmjLVGCAw==
X-CSE-MsgGUID: u0QZIVftRym/cWNTh1o1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149455595"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 12:58:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 04616386; Sat, 31 May 2025 22:58:04 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/2] gpiolib: Move GPIO_DYNAMIC_* constants to its only user
Date: Sat, 31 May 2025 22:55:44 +0300
Message-ID: <20250531195801.3632110-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to export GPIO_DYNAMIC_* constants, especially via
legacy header which is subject to remove. Move the mentioned constants
to its only user, i.e. gpiolib.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 13 +++++++++++++
 include/linux/gpio.h   | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 839948b859e3..85296419a514 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -74,6 +74,19 @@ static const struct bus_type gpio_bus_type = {
 	.match = gpio_bus_match,
 };
 
+/*
+ * At the end we want all GPIOs to be dynamically allocated from 0.
+ * However, some legacy drivers still perform fixed allocation.
+ * Until they are all fixed, leave 0-512 space for them.
+ */
+#define GPIO_DYNAMIC_BASE	512
+/*
+ * Define the maximum of the possible GPIO in the global numberspace.
+ * While the GPIO base and numbers are positive, we limit it with signed
+ * maximum as a lot of code is using negative values for special cases.
+ */
+#define GPIO_DYNAMIC_MAX	INT_MAX
+
 /*
  * Number of GPIOs to use for the fast path in set array
  */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 1893e5d4c0c9..d105a207eaa2 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -45,19 +45,6 @@ static inline bool gpio_is_valid(int number)
  * extra memory (for code and for per-GPIO table entries).
  */
 
-/*
- * At the end we want all GPIOs to be dynamically allocated from 0.
- * However, some legacy drivers still perform fixed allocation.
- * Until they are all fixed, leave 0-512 space for them.
- */
-#define GPIO_DYNAMIC_BASE	512
-/*
- * Define the maximum of the possible GPIO in the global numberspace.
- * While the GPIO base and numbers are positive, we limit it with signed
- * maximum as a lot of code is using negative values for special cases.
- */
-#define GPIO_DYNAMIC_MAX	INT_MAX
-
 /* Always use the library code for GPIO management calls,
  * or when sleeping may be involved.
  */
-- 
2.47.2


