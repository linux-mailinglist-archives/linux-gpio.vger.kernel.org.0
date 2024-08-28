Return-Path: <linux-gpio+bounces-9288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B55C96303B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A4F1C2091F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D4A1AB505;
	Wed, 28 Aug 2024 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zq9vQXZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5B1850B5;
	Wed, 28 Aug 2024 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870430; cv=none; b=fMbMKvUCPN3eCVUw2gDjhYeB7y93bdb+s1QC3p6DrPxLgidA3uf4SedqZA/Lv0sxcyHC5XOn9++eVssvQkbRenuL9O2GoXsGY/wZnPcnY+3tAWqe86AhGRU24PxSJa9qAl5OeYW6Ec3AdSs6/vtudo0Tbk+1hztsHEK9EJ64+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870430; c=relaxed/simple;
	bh=slxG1lgGDmyYFirqKspE+15a7/dXncQioMPkr/tOEC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lj7Ufy6vfAzgHkK199bmXS75YxFu2APgjAKb+rGHkSwCh416otxqhsYcrfMpkgqmF6b4YxZ0z+P5j2gxkoyLDjDR8MAgyYcHgQCJqVABvQMNaMidLxysHlpOicgdv64TFgAsFQr3SX4Wb0fDBIZRmYM4HXS6FioJNSv8gXJ7dCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zq9vQXZt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870428; x=1756406428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=slxG1lgGDmyYFirqKspE+15a7/dXncQioMPkr/tOEC8=;
  b=Zq9vQXZtTvk5t1zMyLsyrExCBkViPeDzA9DYKNdHfcHO5/dZremksQOC
   nrurLbwtEUUCK7G4zUgSAweyOING+spxUQ4vSiC1EB1xrm55eLgTY6Opn
   IFYhlPA1CN1KAp3QoDHtMTy/IXZFH1OzsRUd284DW9hMsY9esz/PAmC1P
   WkI+c7aH5vm3mSA+q4Hv2CaKaB9XfC6NcfaG+Umg4Gpu6WM30VozAZDNL
   S5MylO6J/PH0NLo7iOjmDaseweb2BovkRlvLpJ5TnS+SZC1lwKelftjk3
   eI/z5beGlzT7r2lG/1NWorBSXMdfIYxIrbWAZ5U8O3RUlRvpbZK8cWYmw
   g==;
X-CSE-ConnectionGUID: nZ3DXcJZSXaRpCDTjj+8LQ==
X-CSE-MsgGUID: XeJdZLbuR9y7OrLx2IsqjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13265377"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="13265377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:27 -0700
X-CSE-ConnectionGUID: tl+FoSkuRqqbudOY9p0PKg==
X-CSE-MsgGUID: FK0epJ/qRIeI3zSCH7uXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63376487"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 11:40:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0584730E; Wed, 28 Aug 2024 21:40:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 4/5] pinctrl: intel: Implement high impedance support
Date: Wed, 28 Aug 2024 21:38:37 +0300
Message-ID: <20240828184018.3097386-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement high impedance support for Intel pin control hardware.
It allows to set high impedance and check it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3a135cfe435f..ae30969b2dee 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -78,6 +78,7 @@
 #define PADCFG0_GPIODIS_FULL		3
 #define PADCFG0_GPIORXDIS		BIT(9)
 #define PADCFG0_GPIOTXDIS		BIT(8)
+#define PADCFG0_GPIODIS			(BIT(9) | BIT(8))
 #define PADCFG0_GPIORXSTATE		BIT(1)
 #define PADCFG0_GPIOTXSTATE		BIT(0)
 
@@ -654,6 +655,23 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 	return 0;
 }
 
+static int intel_config_get_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin,
+					   enum pin_config_param param, u32 *arg)
+{
+	void __iomem *padcfg0;
+	u32 value;
+
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
+	scoped_guard(raw_spinlock_irqsave, &pctrl->lock)
+		value = readl(padcfg0);
+
+	if (__intel_gpio_get_direction(value) != PAD_CONNECT_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int intel_config_get_debounce(struct intel_pinctrl *pctrl, unsigned int pin,
 				     enum pin_config_param param, u32 *arg)
 {
@@ -697,6 +715,12 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			return ret;
 		break;
 
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		ret = intel_config_get_high_impedance(pctrl, pin, param, &arg);
+		if (ret)
+			return ret;
+		break;
+
 	case PIN_CONFIG_INPUT_DEBOUNCE:
 		ret = intel_config_get_debounce(pctrl, pin, param, &arg);
 		if (ret)
@@ -795,6 +819,22 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 	return 0;
 }
 
+static int intel_gpio_set_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin)
+{
+	void __iomem *padcfg0;
+	u32 value;
+
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+	value = readl(padcfg0);
+	value = __intel_gpio_set_direction(value, false, false);
+	writel(value, padcfg0);
+
+	return 0;
+}
+
 static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 				     unsigned int pin, unsigned int debounce)
 {
@@ -857,6 +897,12 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return ret;
 			break;
 
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			ret = intel_gpio_set_high_impedance(pctrl, pin);
+			if (ret)
+				return ret;
+			break;
+
 		case PIN_CONFIG_INPUT_DEBOUNCE:
 			ret = intel_config_set_debounce(pctrl, pin,
 				pinconf_to_config_argument(configs[i]));
-- 
2.43.0.rc1.1336.g36b5255a03ac


