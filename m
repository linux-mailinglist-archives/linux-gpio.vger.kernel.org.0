Return-Path: <linux-gpio+bounces-15665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D8A2F98B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 20:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F35A1656F6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 19:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6DB2505C5;
	Mon, 10 Feb 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCZ01I2Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38019D882;
	Mon, 10 Feb 2025 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217158; cv=none; b=aNITcLBslgqmeD8YXY/7mopd3ifwWBcZ1UEaWhprmtlsKQAM914yJ6+j30CpbTjcrXBrN+pYl7HJhFemZ1+NjVq4pzNN+IIycLZ5HWWqU77tPabHxlmPeGATeIgfoF5YH8zfFVevVWYbcWwmtV/pBtSA4Uwd9mwsJN7UwtfIpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217158; c=relaxed/simple;
	bh=8KzaiMOk7ooY/+89w1A/05cPEDCy2o8tU1Bt/Ipw7Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGdTgK7AvFeXemnfbK6MFm9YgFCMBjFCLsoJvLMa9JdgkfvOl9HkCkDiy9Kl5PvrT4H20eOOUzjUZ7jDAkvNctdiWhSX7RjhYTozQQR+MHshPCTohWh/jaspKgehFY8NMJohpcn3qKWd6jhBP0GjBkwCCXZM88wE2JwG+TPm/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCZ01I2Y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739217157; x=1770753157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8KzaiMOk7ooY/+89w1A/05cPEDCy2o8tU1Bt/Ipw7Qk=;
  b=YCZ01I2YkitTkag8leHBmgRn5sZeO+SV0BSCPDe/l1jjN8Gj5tYnvD9m
   Xk6XuxgA0o5zaWfofCX5wFEFLqQzwSvlcP+ui0c9KTaq1QXi01fR7IUv8
   lZwBA0UZbRg5QIlk/jXmykj/hHPv96/O+ETKqkn0/Rbj+6/Z6GCqfVvh+
   pORYhQWFC0C2J5zuAUoMH+SQmGqa/Sir0RKBRmNLao+RoArDr4ow2HJ7v
   PrGETDA5bDKtnUOMufEwrUNs7dhocJnAH5N9CKJEx24EkicX3BzcdKOpF
   F6BJwNLW3yIkOWplyRVQxwdC+yMwOxMrC0s2mL5iz9yY/fvahYv7xgl6G
   A==;
X-CSE-ConnectionGUID: 4Fc/Ph/9SU+WmUpmCJ0S2Q==
X-CSE-MsgGUID: TF/SyECPTOq+tBzvE2fcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42654478"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="42654478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 11:52:36 -0800
X-CSE-ConnectionGUID: 4+qEU5AfTFSrEpBBaqIhmw==
X-CSE-MsgGUID: 0UjCHUAnS7qCdadYPnbZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112738593"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2025 11:52:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D343531C; Mon, 10 Feb 2025 21:52:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexis GUILLEMET <alexis.guillemet@dunasys.com>
Subject: [PATCH v1 2/2] pinctrl: intel: Fix wrong bypass assignment in intel_pinctrl_probe_pwm()
Date: Mon, 10 Feb 2025 21:44:51 +0200
Message-ID: <20250210195230.490904-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
References: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When instantiating PWM, the bypass should be set to false. The field
is used for the selected Intel SoCs that do not have PWM feature enabled
in their pin control IPs.

Fixes: eb78d3604d6b ("pinctrl: intel: Enumerate PWM device when community has a capability")
Reported-by: Alexis GUILLEMET<alexis.guillemet@dunasys.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 5c04079e852b..8d1f4e7a2fe2 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1543,7 +1543,6 @@ static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
 		.clk_rate = 19200000,
 		.npwm = 1,
 		.base_unit_bits = 22,
-		.bypass = true,
 	};
 	struct pwm_chip *chip;
 
-- 
2.45.1.3035.g276e886db78b


