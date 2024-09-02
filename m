Return-Path: <linux-gpio+bounces-9585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C779688E1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DADC1F23516
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63C8210186;
	Mon,  2 Sep 2024 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGV0uQRe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B220FAA9;
	Mon,  2 Sep 2024 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283924; cv=none; b=P58Uac5ubwm+C9zVF10KwJHaNIb5XMl6CC/ZxNuUUYkVzvojDiO5/wHKNRBIVqgoOxMRIH9NGaO9gifUSQzxqiUHq5wrAMsax/lD1+tr8MHIzdT4NCZg46aCCNY/cu+X2jfO1tdMY5kStMFBGsVYIouOiyE/tJ4m9ZjCf04aWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283924; c=relaxed/simple;
	bh=BSXDsgKfV65tn6E/T8L5w0XQjbUaQBnlDePaCFf+QeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgkipItYINxP3YZXZAt8lN1NOX4qugC+wN+Yan04ZGfqQjcEVZIBTm46bUTDM326hqFJN2nDbkI76nDpaOgK+M5vCaS3MGej58mqXpxZFqoTzogxKAXcY/C9xeabGfhE7yhFoNFVdHm9/tc6BiPPxEi+rfftcLrubFXO2B7G/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGV0uQRe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283923; x=1756819923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BSXDsgKfV65tn6E/T8L5w0XQjbUaQBnlDePaCFf+QeQ=;
  b=VGV0uQReLfvRflD4ZDENZNOMw2PzFKkTnu4Vnhm2mtFsiviD4cK4kYST
   5ghDRml53jmaoIi8Ul8UCULSiuIWKhESZfz2/Qnp1FV0hAF5uhYtz6nvO
   6zFM4KklFvUXkeXcCv3hFbvFM1p0wgvxzHKCaj6EtLihvxRgXuGS3swWG
   uUHVpSOIE7jBqkWvOfVqV6t9WIFUs87mtKFnq23jOLt7c4FHO/UfWuOHm
   V04xI0BrvsBsyosREbIGbIOB+pKv2MtqMuJjQtaeZcMUiMqGOWapUszuo
   otkR/9ipk0ihE71fTN+OawY2Jhc5IE6mR7gMtPB9vddqvC+PLW/L4OUWG
   g==;
X-CSE-ConnectionGUID: NmBSXSTLSOuzArYaXUHrnw==
X-CSE-MsgGUID: TZ6iuN2sRiGP/dR1mI0W2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41364551"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="41364551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: Xo8z+4PHS7eblkAJoP8AUg==
X-CSE-MsgGUID: BkoQAzn0TTGgZ3P7+2BLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64293993"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 792E4AF3; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 5/5] gpio: stmpe: Sort headers
Date: Mon,  2 Sep 2024 16:30:44 +0300
Message-ID: <20240902133148.2569486-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the headers in alphabetic order in order to ease
the maintenance for this part.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index c1fb06925e09..75a3633ceddb 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -5,16 +5,16 @@
  * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Ericsson
  */
 
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/gpio/driver.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/stmpe.h>
 #include <linux/property.h>
+#include <linux/platform_device.h>
 #include <linux/seq_file.h>
-#include <linux/bitops.h>
+#include <linux/slab.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
-- 
2.43.0.rc1.1336.g36b5255a03ac


