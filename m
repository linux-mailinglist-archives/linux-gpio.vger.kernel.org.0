Return-Path: <linux-gpio+bounces-13046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF49CDE60
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 13:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8D02829BA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 12:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CFC1BD017;
	Fri, 15 Nov 2024 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESODNdR2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6751B6D15;
	Fri, 15 Nov 2024 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731674304; cv=none; b=trSx3dnS93R+DLuldfqjBltpAtK6g4J3rWq3PtPJKAWR9FdsAU0hm37rEnaMcaZCP5aBBuBuw2CrkwpE/OBAM0bMsyx7ojtnB7uUtcbeGeZGLFtEPzYzPJTWHlAfEXfNO+hpzv7Tv62W6bh6T+rTuJ8gSArI25KGqimRlcSEQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731674304; c=relaxed/simple;
	bh=1oHg+LbV7JRVw8M8cf1veFksf5mFMdT1aD7/aPi0gjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsgHAbCEeaSWtzf8iCtB/vCk+ImjIWuRz5rupA9AGYniKXJEMqEyNUGcCyXmGaBoBvaKFe9yUegXL8lCWTtdABgdualct9jSye7PoPEwNr5zjMMN3b+Dfi9amZkBkttcl47N+G4rWQ2OTK23h1QhZWq/xlkAXcixPGNRU1HD8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESODNdR2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731674304; x=1763210304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1oHg+LbV7JRVw8M8cf1veFksf5mFMdT1aD7/aPi0gjg=;
  b=ESODNdR27mt8TzkEKbShWurMWUrfzGLVijPTgh6GmkiXX7mDiTzrKVEs
   WT9zuNJN5HBrqYU9twVbr7ReqKoLwpBjmtu0gz+Wq2plPOrV+L+ANytop
   XRftFJfDEz7SsKerb9TVtSd1pbsv3nYYyESOr9a5OvNiZjNzi+cvPKAGQ
   3V3ssS7IWxmJ240omhb7ugaGShs4HhJ3HFKD32KO8K4K5idhqvulWM/jx
   gTXK+1XquPHFDukY+ax+GTBkExicltdK7tMKnACOfb447QgkllFL4kDiC
   abLqkNaydP9dyb3p1I6eNdQQy6BIHbNjV7FQnshFOLsw6SdGeprijxKw2
   w==;
X-CSE-ConnectionGUID: 8/yFmkqZTquKo2ZvhX7z/g==
X-CSE-MsgGUID: kRO8DjoeS0GeEYO+fSAexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="43078126"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="43078126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 04:38:23 -0800
X-CSE-ConnectionGUID: vmSUrgzTRnGzrDdvsUDXyg==
X-CSE-MsgGUID: 25HYhWgoTzut8zUH2xmVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="126092110"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2024 04:38:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E6E451AC; Fri, 15 Nov 2024 14:38:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: zevio: Add missed label initialisation
Date: Fri, 15 Nov 2024 14:38:16 +0200
Message-ID: <20241115123816.3906238-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialise the GPIO chip label correctly.

Fixes: cf8f4462e5fa ("gpio: zevio: drop of_gpio.h header")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-zevio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 2de61337ad3b..d7230fd83f5d 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -169,6 +170,7 @@ static const struct gpio_chip zevio_gpio_chip = {
 /* Initialization */
 static int zevio_gpio_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct zevio_gpio *controller;
 	int status, i;
 
@@ -180,6 +182,10 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 	controller->chip = zevio_gpio_chip;
 	controller->chip.parent = &pdev->dev;
 
+	controller->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!controller->chip.label)
+		return -ENOMEM;
+
 	controller->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(controller->regs))
 		return dev_err_probe(&pdev->dev, PTR_ERR(controller->regs),
-- 
2.43.0.rc1.1336.g36b5255a03ac


