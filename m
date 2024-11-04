Return-Path: <linux-gpio+bounces-12507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE4A9BAFE1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027F0283F3E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBAF1B3958;
	Mon,  4 Nov 2024 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmsGN5d0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA701AE01F;
	Mon,  4 Nov 2024 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712990; cv=none; b=Cljt9+64fMosPCc+cZqC6q+4YjJhTy3Blza5ignzo6YeMlKT5DrkbcWvnBJ6jsM1SNaJgCX52U3TM0lHChDZFlOHN7ClA9U5fg4+KxWH3B/imzQ7JNmy2So4sexh5KfCT0ZdZ2gdeFRdWhhqjalp1VJJ4CRCWfGyXM1U7Jq0/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712990; c=relaxed/simple;
	bh=Sc+eqveINCgjfeZ/XCA8LOsWGvrDOO3Z75MHxHV6gP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt+RPlEdvCZsyLcedYLWecW1tqWl4Unb0QTaHpo6LVY2MBYXq+g/UWw9gFthakmBjcDBSW6LQBQai2XenkMd/jYj2HJQkC9W1B/ZDtZA7wwZExRtelWTeqaI5LOeX6OoSw5bdhZXfxJUnUQbfn6a+gku6MkdfMGr4+WmQeyv9Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmsGN5d0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712989; x=1762248989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sc+eqveINCgjfeZ/XCA8LOsWGvrDOO3Z75MHxHV6gP0=;
  b=cmsGN5d0H45SlHE2iorkOF4oDGsx0dkzWCvZqWymjaX6giruS7iDSnAt
   CLQeiOMSud5hKCG4ejQ1CoV7brTpn+ImUgZ1LFZzc1B3oDIhFN2yK1XCL
   Tfq0Uk1CkFTzQCYjg3gKgzUaTKLhXoFMpy/uiOKvXph4YsEsW6uVlN08L
   P7rYVvL2ERf+KTF7dhEtFYCJ9amvHXn4qQoZIT1tlAMmJ+KFCpjGGbfmh
   zV9TEK++pm0l+8YuU82ygtvMYhptdflipxeQl7PP38Ug2ZjIXbUI2UgtB
   zAP02g5A7uR3Fwxvb8Na1wDPxf/+J/wnf2B4TJpqPJDGAtOR1tKk9ii4M
   g==;
X-CSE-ConnectionGUID: fCGnczMRShubdAUWnlhnBA==
X-CSE-MsgGUID: tuH0gCZQQwWibhfRlgAwSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620092"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:21 -0800
X-CSE-ConnectionGUID: Ah+BKPYZTaqhFdk5MbXoWg==
X-CSE-MsgGUID: 7yc422SjSi6VFqbnsmzs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127064"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D17216CE; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:23 +0200
Message-ID: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 7d3a8a5f3796..f9a55d4f189f 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2355,18 +2355,19 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0, gpio;
 	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
-	unsigned long gpio_flags;
 
 	if (mach) {
-		gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
 		gpio = mach->gpio_pullup;
 		if (gpio_is_valid(gpio)) {
 			retval = devm_gpio_request_one(&pdev->dev, gpio,
-						       gpio_flags,
+						       GPIOF_OUT_INIT_LOW,
 						       "USB D+ pullup");
 			if (retval)
 				return retval;
 			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
+
+			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
+				gpiod_toggle_active_low(udc->gpiod);
 		}
 		udc->udc_command = mach->udc_command;
 	} else {
-- 
2.43.0.rc1.1336.g36b5255a03ac


