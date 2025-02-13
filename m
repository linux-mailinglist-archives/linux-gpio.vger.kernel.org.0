Return-Path: <linux-gpio+bounces-15955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDAA34E7B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6490916C685
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE759206F2A;
	Thu, 13 Feb 2025 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHAnpFY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9828A2CE;
	Thu, 13 Feb 2025 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739475118; cv=none; b=mcXkO3r/jimHFnbw85Ue2CzIA6FzmPBk0XC7Cdp0WzVI9fwyxGSLOc7aOto+M/E1lcTwkKlLjVle4Tff7DrPCzDTJI35tmxQ5FcdcwpOOZGa7f9xfcuHlhZ3LUyRLoSZLSrrTIq2noN6Cgx3pjrynzABFExq2ECK9qFZqAM0Lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739475118; c=relaxed/simple;
	bh=3isR7VFoqzfVxZrvhDXXIeUYz1Uzy8aLfsgglxXjle0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qo1fM8rvd/0QIxXCvHs46VYpdf8Bktl5C9I9ayZt/wLvgfu61vLB8RHJtYpSL7J5Hte5CuFNqStTqaNpZFZXGzJIDLbpGFCgWnh6bp0G29wJlJRtU0ROpoSBa38XVXELNVmFiRHWXKXBGDPzqhcvHXUxU3F6iAAL0jg87Pw1N1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHAnpFY2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739475117; x=1771011117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3isR7VFoqzfVxZrvhDXXIeUYz1Uzy8aLfsgglxXjle0=;
  b=GHAnpFY2xzbmKNtalUB5N7/dIGX8pQx8WfVM5FGV73WFTLcqkIYPAgBa
   JnaZD2riiqvr7mCetvCBZ3YZrdjaqTaJa5EmyfM4LwO9kCJjFNy4dBoYn
   jEkQL3lnjdJF7idy1rLSDccNtqGcIH481r/NtEblIGfmeokm4MrS7jMmW
   ejJjUIIsZQj+h/fRlCE9loSiM76wPJnabZJ09lAE90rMO+y/7j5Py1F8A
   aYhdbQnKTKmzyRXnuHRmbxsQuuf3hqVrE6Jig+bqIS0RGutgZDVJ+pEVT
   BMnXSBKGqHE5y2tFd8yphSKOHvkHMUggg2MgetMhn3bTjQNJb8dyN52QB
   Q==;
X-CSE-ConnectionGUID: yjR+eW4VSwSKsBHdARw2Qw==
X-CSE-MsgGUID: 4vKCwn0dS9iSY79yGun8/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39386877"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39386877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:31:56 -0800
X-CSE-ConnectionGUID: ilCaPk/2Qx+K/0Rtci5tTQ==
X-CSE-MsgGUID: ltjIHdYaRPem+FF+Ox2RJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136472326"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2025 11:31:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6A1B91FD; Thu, 13 Feb 2025 21:31:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node() helper
Date: Thu, 13 Feb 2025 21:31:52 +0200
Message-ID: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the code to use for_each_gpiochip_node() helper.

While at it, correct header inclusion as device property APIs
are provided in property.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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


