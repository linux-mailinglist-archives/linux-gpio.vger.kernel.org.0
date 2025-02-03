Return-Path: <linux-gpio+bounces-15260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74289A25A86
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DF53A6D91
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8052204F78;
	Mon,  3 Feb 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fqrs+6n8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9D3201002;
	Mon,  3 Feb 2025 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588512; cv=none; b=QPY0P/4SHN2MdjSudZNkGUlE5LT49Wksy3RhzdPsWRiPBZS2vYjJ7hR5YAkH2oa1Nf2WfEThsS+Q3H1vU+P+uiXLPxycGdR+nPOg91VWb12DziIMtfCa2eGoUwaOgSt6YFNFGfiePKKwV+LsmAHb/6YjESkUuclLptWZRXC5PLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588512; c=relaxed/simple;
	bh=gs4Zt0xEqSo1Z8vwU6FIloykVDGXSg9fCQEbpQ8eQ6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VuBFCeaIGrDTvMkRdG2plI8kV0Tj3KadKYG4PMfn2G+D/RBtIDqJnWsBtwrQmgkf44hzK6R6wUM1GyoNryuzAYqDDw84B54NUnF9LPwatbr6UCZMqdp9isgQpjpVYjjNlfFNH+7JIrjfYfzZrJeLypVpedbNnZMwEZ8VTIKFczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fqrs+6n8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588510; x=1770124510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gs4Zt0xEqSo1Z8vwU6FIloykVDGXSg9fCQEbpQ8eQ6A=;
  b=Fqrs+6n8/HOz3yxeF0SoCrhUcKGHDHch1/pBz1xrTz39OiHcwoelPuqk
   oZDs+LeRhnTRLDNm1WntdSh/vMnWw9r5B8G8+xmnfVYP3W7JnSSN4mogL
   +up2jbr90m31USOgJKv3BYQYMbq5L9Eg/37AzXRtklp7YvlRo8biXlcv4
   ozP+oPFdAFTqytnrA+Z7wfHDZDeTO2dSuQnbo/22sNmRJ5ypIyQ+kPS00
   OvUdDQw78M7RNYWDPtfzxaGMC9TGt5bEspEHFDDMHcDLoqEFy5ntX+s2e
   gjHZmtZE3Uvc05JBV5nCteEG/C4td/xcpB8s9JWuoB2n1v/dIVX+xfWCM
   Q==;
X-CSE-ConnectionGUID: A215SaStRy+NNw90fDnTIg==
X-CSE-MsgGUID: u61jVJE9TXS7ZWFmHE0N/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217670"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:10 -0800
X-CSE-ConnectionGUID: 7fczzyh7TOC1JDXJOJywcw==
X-CSE-MsgGUID: oc6XXRZiSnGdlz4wZXgZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287393"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BAA05399; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 02/14] pinctrl: cy8c95x0: Avoid accessing reserved registers
Date: Mon,  3 Feb 2025 15:10:28 +0200
Message-ID: <20250203131506.3318201-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
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
index cda9e1b6fed6..192a37c28a1d 100644
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


