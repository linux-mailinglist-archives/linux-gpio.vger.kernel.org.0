Return-Path: <linux-gpio+bounces-20836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90BAC9CDA
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 23:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349F418990B9
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3225F1C1F13;
	Sat, 31 May 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYpWM+9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA10139D;
	Sat, 31 May 2025 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726622; cv=none; b=qzrVwfT58vwMuH+RLiOmhILqk4P+9teqVRMyirW7sWOgsn4IVnEmjW6wzO3ZBuUEhxWJnxlyYY34uZtSlRSwffAuFAQWoNaymsyfXQOcJgBVJw3rhR+AjeuzNFB0MaUWaa406yv8cTXbADC/hRa3F7Zx62pPSy7B6z4vesyCQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726622; c=relaxed/simple;
	bh=fO2IZVQirqF8M5hIKmy/1EuXz2JFWuUbdV/fET9QHAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8Av8fpTa/MzSnH0DNxk+6GetyS7YyHFPXUf+PnyXE/7LYfyC8/JHX8Jk0kuUGlrSvXK4U2x1phtQSvP8nSvPxG/X5dQ46Hp20QSx83VCsvqd4Cm5yIuIn7y5sLF5adMUQJntNQn8Q1YlUkFFO5yBdxrJSaYkuUqu3r8dLTNoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYpWM+9h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726620; x=1780262620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fO2IZVQirqF8M5hIKmy/1EuXz2JFWuUbdV/fET9QHAw=;
  b=HYpWM+9hUHxq3+k9iD9ZkiRi/IHZn9YehmaX6gbBZPRkHZADbkSk4BXN
   jsFDd5CG8luI3A2qYX9y/lTIiMxdlgcJSDIdgj+xoJm9/AGf1IeOv0SvO
   xNree+gMWyhja/u8/TzrkMqlmmSOXa200ZU9auEk58dcOyg7uy2zyG7y/
   nUgwy6meExqHhM17NAiB5WKBtffq16VWkdrWy/Ggt3ZHBqizj+DrS6Ncc
   p+KYLjFdT1MYoN0q7SpkOg/pd4biHOC58NlqFvjglhvwdReIsSHbaSZHM
   BU33NC+bzRNM6oV7iRTHSNA3ziS9sPvdhCru+Vycc21V7RpF2qNRsj1WA
   w==;
X-CSE-ConnectionGUID: 47OBXVsmRemffl70hjOL/w==
X-CSE-MsgGUID: oxcQr4ZLS1eAuKN8T/CIPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50888682"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50888682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:39 -0700
X-CSE-ConnectionGUID: VjJhx55BRL+5PD+MaTcO0g==
X-CSE-MsgGUID: 75ksBrGuTLeQXQQ0MVpOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144161858"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 14:23:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6A46BAF; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
Date: Sun,  1 Jun 2025 00:21:38 +0300
Message-ID: <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_gpio_request() is going to be removed. This driver is only user of that
API. Convert it to use different API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 24eb1ae78e45..366abdab095c 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2348,15 +2348,14 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 	dev->transceiver = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 
 	if (gpio_is_valid(dev->mach->gpio_pullup)) {
-		retval = devm_gpio_request(&pdev->dev, dev->mach->gpio_pullup,
-					   "pca25x_udc GPIO PULLUP");
+		retval = devm_gpio_request_one(&pdev->dev, dev->mach->gpio_pullup,
+					       GPIOF_OUT_INIT_LOW, "pca25x_udc GPIO PULLUP");
 		if (retval) {
 			dev_dbg(&pdev->dev,
 				"can't get pullup gpio %d, err: %d\n",
 				dev->mach->gpio_pullup, retval);
 			goto err;
 		}
-		gpio_direction_output(dev->mach->gpio_pullup, 0);
 	}
 
 	timer_setup(&dev->timer, udc_watchdog, 0);
-- 
2.47.2


