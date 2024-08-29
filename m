Return-Path: <linux-gpio+bounces-9377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54396477E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3C31C237EA
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B291D1AF4E3;
	Thu, 29 Aug 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leWnsdQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B91AD9FB;
	Thu, 29 Aug 2024 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940255; cv=none; b=ODOyKzyKAC/JR4OdWP2eNrlkzv7eiN0BTiHoNslzGybmZWb07Zewon+kWLxvKljqx2zMGmqo+NyFBYg/o89zsjcK2cBp6D8V5tV/17zOhHtwCVR3Digm5pxT6wQtSGLOb155F1T6scpPjc5Df0o3tVGMF7P80XUUfEsuQgpbFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940255; c=relaxed/simple;
	bh=Q9d+euuv8sNzdV23c+sfatEVDstPM/6KUFa2Cr4pam4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IP0uvI3w+UaziV7LaXvn8E+3kRKZ/fyCSOALFIOlsTq67rzY0pdA1AYJr/F4GjjNQwdcBFL5xi/fih85xXnUECKguTMKjS/qwHAZAUDZdiTNQEsifJMo+HUTPvqLE8zg9R9UwloShMLaLoekKKMW6HMzmLtJWgXzLxaVkcJuT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leWnsdQS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940253; x=1756476253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q9d+euuv8sNzdV23c+sfatEVDstPM/6KUFa2Cr4pam4=;
  b=leWnsdQSyaLelEW18IvVY5Lb5u9tuFPCjOxhjmKdWe16X25CcG23m8rz
   3Ucc5iSnHaD/U5YpDsojHTBZjDhLVfdZ7ARRQ1YUVKfw3pxVaGe/4Okh6
   sUEIseNLGEITGxuAMz1TQfBY4g8mvMeZx/aVMV853QLFOIZyLb318LeEV
   o7Qop4gI0Ewb/FsezRnCtaWIcoFIhIcb1yvZGk0OD8p2YK7a3wFbkuOWv
   c+zj2V5vYjDdNaqhmdw18z+UjlTF78UzUUQ8oU7VH5VpcMxRWUC3SbCv2
   SANitP6KS4Ydg6zt75bJ7OFCXj360NZHlvRCzGOuJ7K/GGQPuu42/1DRk
   g==;
X-CSE-ConnectionGUID: QIsMx8DeTkqqoH3evv1xlg==
X-CSE-MsgGUID: qvrFLtiFR9m9HtqTBTXv5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690595"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:10 -0700
X-CSE-ConnectionGUID: 2Tb6/zJgQRS5kxMOcs/txw==
X-CSE-MsgGUID: YcQgGu/KSqmyWqZtj/Pw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419836"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 75BC156D; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 4/6] pinctrl: intel: Implement high impedance support
Date: Thu, 29 Aug 2024 16:59:18 +0300
Message-ID: <20240829140406.357612-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
References: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-intel.c | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index c6013d967fa6..46530ee6e92d 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -652,6 +652,23 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
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
@@ -695,6 +712,12 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
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
@@ -793,6 +816,20 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 	return 0;
 }
 
+static void intel_gpio_set_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin)
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
+}
+
 static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 				     unsigned int pin, unsigned int debounce)
 {
@@ -855,6 +892,10 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return ret;
 			break;
 
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			intel_gpio_set_high_impedance(pctrl, pin);
+			break;
+
 		case PIN_CONFIG_INPUT_DEBOUNCE:
 			ret = intel_config_set_debounce(pctrl, pin,
 				pinconf_to_config_argument(configs[i]));
-- 
2.43.0.rc1.1336.g36b5255a03ac


