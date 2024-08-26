Return-Path: <linux-gpio+bounces-9167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C286795EDBB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023271C211B7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C31145FE8;
	Mon, 26 Aug 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHd81OGW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1B27701;
	Mon, 26 Aug 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665993; cv=none; b=JKGUjb86o53KfS7gERHRxkieWwXFRr/etQBOcFfbQRBGfHMI0anuHNpNy1bgkuwklBaGwdbgs0oPUaiKpirEakgfUp2pRAlgVxGHPbcrXfsFrtBO+6nBH82OcJYiXkYmUDNMTV6kFKMjjRVrCRqF91ULD77KaiMfO6/P64UKTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665993; c=relaxed/simple;
	bh=FM0aUTLDtyB6gqzlabbXPTBd7yBelmI/W35+tx3U+aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHid7bxgzTCPWvwOyvO/Pg1uPGdOoTOPcfSNtVfiCiafrZ8wyBsApvLkRO8Xm4z7y/kOltjI5kizrJqcl354ClEBZEcSyH82qAVq8Ca5wZgN3HlMLA3kOxliJXrluLXfEGKMG0RJxkzVrn+e3BAic8bUZldFtxcIINKIasfu6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHd81OGW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724665991; x=1756201991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FM0aUTLDtyB6gqzlabbXPTBd7yBelmI/W35+tx3U+aE=;
  b=SHd81OGWmbMululN22jhZ7HCJSjRHDT8Ifk0mZE8NZkShmg13O6Lzsie
   lax+yBltFMD2hHpNObC9qE500+JsWTl2NWt+awY1dxckBNEQeBMJE52pC
   EwO3AYic5uidpORUUZjQT4uY/FaqiE9mwVXgkA5YOH12W3SIKDJdIOzzY
   XrO3RclWpgmmqMxb296IlF3gc8VNcdcuKJqtP2bMlbWTrCkbwydrleNje
   HW9kNa+c6srkkcraqmVHsvGjnOC42mslwRZYobcUOXyOBMy3uN+2zP4XJ
   wf+FtCn8XnrAt+abTpKKwcEf2LrcgBzw0z1W1QLsMMFBpJWuvROHBSvaK
   A==;
X-CSE-ConnectionGUID: xkjXdhrMRV6bVfPLn/gsfQ==
X-CSE-MsgGUID: ZfGcdRxEQ7WYu8LzEoklYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="40548498"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="40548498"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:53:11 -0700
X-CSE-ConnectionGUID: rUaLih7UTVWeA32VhCL20Q==
X-CSE-MsgGUID: U5e3Kgi+S5SFPDGvTftcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62295820"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 26 Aug 2024 02:53:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7715A502; Mon, 26 Aug 2024 12:53:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: stmfx: Use string_choices API instead of ternary operator
Date: Mon, 26 Aug 2024 12:53:06 +0300
Message-ID: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use modern string_choices API instead of manually determining the
output using ternary operator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 6313be370eb7..d2c5321dd025 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
@@ -369,14 +370,14 @@ static void stmfx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 		return;
 
 	if (dir == GPIO_LINE_DIRECTION_OUT) {
-		seq_printf(s, "output %s ", val ? "high" : "low");
+		seq_printf(s, "output %s ", str_high_low(val));
 		if (type)
 			seq_printf(s, "open drain %s internal pull-up ",
 				   pupd ? "with" : "without");
 		else
 			seq_puts(s, "push pull no pull ");
 	} else {
-		seq_printf(s, "input %s ", val ? "high" : "low");
+		seq_printf(s, "input %s ", str_high_low(val));
 		if (type)
 			seq_printf(s, "with internal pull-%s ",
 				   pupd ? "up" : "down");
-- 
2.43.0.rc1.1336.g36b5255a03ac


