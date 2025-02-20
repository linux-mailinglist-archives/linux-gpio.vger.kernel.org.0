Return-Path: <linux-gpio+bounces-16324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDDA3DF58
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B557423197
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555E21FFC4F;
	Thu, 20 Feb 2025 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSSASs3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0311FF7BF;
	Thu, 20 Feb 2025 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066644; cv=none; b=czGmIHOP1cVoEwhwHrG61ipA4xd8ThPIeJJTPAt4R1nZghrWAoy2Hkt+nV1FYhsffx08/V9gVX8N6qZ6yQgnGyTF/AtVb8ZohTHbb9qlUGWm4bVIyf+QPWDbaYiMrbUu1AUH8Y086TS42SfCSMHelBMbyB9UyC0DRp4X0X01b+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066644; c=relaxed/simple;
	bh=vzatA26r+R++ycxiPiSLdTkUwvefNCuHV3tAWddTjKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g/D5P9cmbG+TAW+WqsXGDI7fHOPoMNkYxU6aFaHka3tWwWYrR/xCjjvzdnTARpouBZxxalRj3u4J5QPcpGUMKgOb1vhFs2GrfWppfUi2V8O3PrqpqSWV0L1k5GgOzJL2FdS1FmXG1whl6HFmslUkVNiXUWRrAAAIB7IeJCEiGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSSASs3Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066642; x=1771602642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vzatA26r+R++ycxiPiSLdTkUwvefNCuHV3tAWddTjKA=;
  b=GSSASs3Qb1Md0aITYVdtV8Ce/smzyT+vIQ07P2TAgvE3B6uR1DTE++g0
   UXLMIruFyEcYvACDste3NzElyGvE4lPPP+0YR4LXe4bapJBLgZjaSHJGx
   MyVlBtCWaw6S+nt6fDw2F4lqD/wGGqW5D2zB2LPX29Rilr/HUnVbAdb75
   vmCcCdrprTSQGGEcqxoihMp9jnSq/9SFZMC59sBy5YZpzAlGVo6KwYGb2
   Oe9k1zcJmpI7co+Q8i1X6mzUKOSbShqQwOFlPizr6kYu7JZoU0kB0BcnA
   r0rXFcr2RRcXaki5D6kxGz2rry4Zbmbikl/9J3zukQ30W2yVvB+OE2bnZ
   Q==;
X-CSE-ConnectionGUID: YmiK27C6RmK1ScI4iyKqCQ==
X-CSE-MsgGUID: IYeTtdPkSFa1ojSGIoa6Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40988444"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40988444"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:50:41 -0800
X-CSE-ConnectionGUID: LqBONMYDR1CntdZcKgPp2g==
X-CSE-MsgGUID: IsN/WvdSRACAcjkGJV+A9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115291368"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 07:50:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C609A2D0; Thu, 20 Feb 2025 17:50:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use for_each_gpiochip_node() helper
Date: Thu, 20 Feb 2025 17:50:11 +0200
Message-ID: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch the code to use for_each_gpiochip_node() helper.

While at it, correct header inclusion as device property APIs
are provided in property.h.

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed Subject, added tag (J. Neuschäfer)

 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index cdad4ef11a2f..2f97accef837 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -10,7 +10,6 @@
 //   block, shared between all GPIO banks
 
 #include <linux/device.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -18,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/pinctrl/pinconf.h>
@@ -1033,7 +1033,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		return dev_err_probe(dev, PTR_ERR(pctrl->gpio_base),
 				     "Resource fail for GPIO controller\n");
 
-	device_for_each_child_node(dev, child)  {
+	for_each_gpiochip_node(dev, child) {
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1044,9 +1044,6 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		u32 reg;
 		int i;
 
-		if (!fwnode_property_read_bool(child, "gpio-controller"))
-			continue;
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret < 0)
 			return ret;
-- 
2.45.1.3035.g276e886db78b


