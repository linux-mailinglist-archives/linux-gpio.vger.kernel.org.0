Return-Path: <linux-gpio+bounces-14899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E1A151B6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE9F21654DD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C28195811;
	Fri, 17 Jan 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3JO37TF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838D51632D9;
	Fri, 17 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123797; cv=none; b=NzbKxND3jz8K2nZTJX7BPVQwrjV96Oc73/akrfG2wsJOVWRnD0ZNwyWLeIi3SL3JgK1cuqN8jOWx+r+5H7OHu5A/FvRgthS5N2GsDkCtpWFC1Fc37IiwxR8DWeSxsP5nlg5UUw0bLGAo6MykwHWqmEaqUIqHTqLbKH/mGnkrI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123797; c=relaxed/simple;
	bh=DtYAZERdCjS5aLTd06py+szljDXDA3OPoURmr1mXSMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lktrdy4rw4DUHzATChilKSlpTVcZlUv6WfIAvQQTKNK8f9iBIRa+RbJ5qwVOIxjF3K8jVydWE7I3M7n1IKNtecN0g92XziKSnBPCKgY6NRJkQU7O1C/4crS9iCMegRMu+0Du98W+ciWaR4fwwU4mRvAe5g3lSBsDx1PDD3XLqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3JO37TF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123795; x=1768659795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DtYAZERdCjS5aLTd06py+szljDXDA3OPoURmr1mXSMA=;
  b=C3JO37TF8FMqK2cOlS+vK7QhnRXnnnV7ZQETdKZee37mq5gMU/PFebMW
   7FBeStkmy5EcVafXN+Aozo2/fyyR0F9PFyFc/W/2PFUfHqDSR+eIsQIQY
   423isLc8OZYoB9TAN3hNwPI8c2O8D2/wswI9WYPiAvBxeNyYZN2CdqUE/
   nHFq8H2cwHMCS972Jz5uvymxsvOmRmZVJOMk9rIXqB0Falek9kKdZbf+h
   GEF20Uuuf11IMbGQtgsxaN0sxFOZActjfHecjXvcR6Q/qILBMQ5fnsfGx
   M3n4U1ocur1GWnnLavigoGk6h/7Wze+yhFLQboEinn6V6l51umcPt+Ame
   Q==;
X-CSE-ConnectionGUID: zU7MMAiHRQu6pnH0l1BTVw==
X-CSE-MsgGUID: O/1hQV9mRV6jkVLunr408A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792835"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792835"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: XCerqqrVQ7qXJcixPQQfXA==
X-CSE-MsgGUID: QP5YNIAuSg+h5P958t31XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671225"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 997C54CC; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 10/16] pinctrl: cy8c95x0: Remove redundant check in cy8c95x0_regmap_update_bits_base()
Date: Fri, 17 Jan 2025 16:21:54 +0200
Message-ID: <20250117142304.596106-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is never called with the PORTSEL register in the argument.
Drop unneeded check, but rescue a comment. While at it, drop inline
and allow any compiler to choose better stragy (note, that inline in
C code is only a recomendation to most of the modern compilers anyway).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 61225beb0714..3907970a3e6e 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -476,20 +476,14 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 #endif
 };
 
-static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
-						   unsigned int reg,
-						   unsigned int port,
-						   unsigned int mask,
-						   unsigned int val,
-						   bool *change, bool async,
-						   bool force)
+/* Caller should never modify PORTSEL directly */
+static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
+					    unsigned int reg, unsigned int port,
+					    unsigned int mask, unsigned int val,
+					    bool *change, bool async, bool force)
 {
 	int ret, off, i;
 
-	/* Caller should never modify PORTSEL directly */
-	if (reg == CY8C95X0_PORTSEL)
-		return -EINVAL;
-
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
-- 
2.43.0.rc1.1336.g36b5255a03ac


