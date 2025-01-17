Return-Path: <linux-gpio+bounces-14894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74378A151AE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A129E1653E3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8AD1632F2;
	Fri, 17 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f72iMeYA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88D78F58;
	Fri, 17 Jan 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123795; cv=none; b=rYo29VNsTPYSnsdp25Fy8S4/QvTbjcq1eZPXJCFky6BVEFG94GzOjTrDir6nRs5mJa8FOtuUrXkNkQ5I3q0lrBRuY3O8Z2qbYe+qveMLiiUpCdd0dnFiqE9Ea42wjQLi/KWCFICc2X6tbDdiqOst8PQ29aYw3HxzgRFE2RBW3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123795; c=relaxed/simple;
	bh=H32YdHMMv4yHDqvULzoY5QGRkWug33PDrCdVmxdPSBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTvyEtPZcov6YQsNDFrudPpbKOv/aVtzVGu/OxQarQ0s6Ap6eZh/+gFp04GC02S9H5hxr6iOzk1b5EugXLbTopqO52WOZdZKPQS4bhmwlRogjQsYZ81fTPxffZ6A2q79wufC/uMOjl8H4aMedC5IDLSO2CSV8HC1vuO0TqEaYkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f72iMeYA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123793; x=1768659793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H32YdHMMv4yHDqvULzoY5QGRkWug33PDrCdVmxdPSBI=;
  b=f72iMeYAXAK/2YLnK1Tj0OjHjZHXWbO8ZxzOtNT4jrwHYiryaS0b5Phd
   hEmNf0w1zFmP7a1QEjdoP1qWp5VmEKj9z3o7tmp5GL/lxExMlw9SqDIcn
   fP3xuNJduSkzi5ciA9ZSdfNGNqnBhxBlq6jIPHwpVH5ehJNfDgkPEd8SK
   g6etJ25I4Rcwsrekswhik0IaKIzmyFUtpDmyvj/+Xcx75WsVyHlyCshlm
   IY6kxuZBMT1W4Z7MOe6Ys5FxPdh8QWh7ix1rVBlNBE1U7GnY27cslersR
   YOO1PmmAtgoDNw0FE9VeakPdNqCN9b92+NHjhCdEHO+n2bpubqN9+AEoo
   A==;
X-CSE-ConnectionGUID: wW8lKGjCT2euudmdMFY9Rg==
X-CSE-MsgGUID: Jr3qBa1bTmar6brU71ajqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792829"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:11 -0800
X-CSE-ConnectionGUID: gsqgxV3DTsyTr6qRowkajw==
X-CSE-MsgGUID: G5JKRW7HTOe2iMdvQxMCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6A66539C; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 06/16] pinctrl: cy8c95x0: Avoid accessing reserved registers
Date: Fri, 17 Jan 2025 16:21:50 +0200
Message-ID: <20250117142304.596106-7-andriy.shevchenko@linux.intel.com>
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

The checks for vrtual registers in the cy8c95x0_readable_register()
and cy8c95x0_writeable_register() are not aligned and broken.

Fix that by explicitly avoiding reserved registers to be accessed.

Fixes: 71e4001a0455 ("pinctrl: pinctrl-cy8c95x0: Fix regcache")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index e98eba17cd13..970b6842b05b 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -328,14 +328,14 @@ static int cypress_get_pin_mask(struct cy8c95x0_pinctrl *chip, unsigned int pin)
 static bool cy8c95x0_readable_register(struct device *dev, unsigned int reg)
 {
 	/*
-	 * Only 12 registers are present per port (see Table 6 in the
-	 * datasheet).
+	 * Only 12 registers are present per port (see Table 6 in the datasheet).
 	 */
-	if (reg >= CY8C95X0_VIRTUAL && (reg % MUXED_STRIDE) < 12)
-		return true;
+	if (reg >= CY8C95X0_VIRTUAL && (reg % MUXED_STRIDE) >= 12)
+		return false;
 
 	switch (reg) {
 	case 0x24 ... 0x27:
+	case 0x31 ... 0x3f:
 		return false;
 	default:
 		return true;
@@ -344,8 +344,11 @@ static bool cy8c95x0_readable_register(struct device *dev, unsigned int reg)
 
 static bool cy8c95x0_writeable_register(struct device *dev, unsigned int reg)
 {
-	if (reg >= CY8C95X0_VIRTUAL)
-		return true;
+	/*
+	 * Only 12 registers are present per port (see Table 6 in the datasheet).
+	 */
+	if (reg >= CY8C95X0_VIRTUAL && (reg % MUXED_STRIDE) >= 12)
+		return false;
 
 	switch (reg) {
 	case CY8C95X0_INPUT_(0) ... CY8C95X0_INPUT_(7):
@@ -353,6 +356,7 @@ static bool cy8c95x0_writeable_register(struct device *dev, unsigned int reg)
 	case CY8C95X0_DEVID:
 		return false;
 	case 0x24 ... 0x27:
+	case 0x31 ... 0x3f:
 		return false;
 	default:
 		return true;
-- 
2.43.0.rc1.1336.g36b5255a03ac


