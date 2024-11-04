Return-Path: <linux-gpio+bounces-12502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB819BAFC5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3360A2828BD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9316E1AF0AC;
	Mon,  4 Nov 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTOinAKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9131AD3F6;
	Mon,  4 Nov 2024 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712983; cv=none; b=CDjZ6XQHoUMF8MKwDwRzLE75UnMLvUWBl7qxrVji5cpCwHhaAzrhzkoEk/NYQR/+OOvPS/ooCvsBmbiiG5jbrOplUleMjKkoi+QrFl5hZha5AmiEkZiTUuxB7qP+xwiBJNGguKDDRy18oAz8x62+L0uGnudI3RFRu+W/AUIbklI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712983; c=relaxed/simple;
	bh=nwoZv6RI/t7WIQO+Llzq3vqo716xkyZTrrmxMQ1Qo5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkSItogI8K5FvjfkET94Twmy8UnqWaq24362sIe07HtUaZKZsdvClgpfUhcNv4p5RR8ZiqenRqumMDoNlTN1UO954fYNLn910KNx7BenzLImwoQpnyV9YNSnOzsIe2QPKj4euxuZNA7pwCynmYs155FyADIXCiE3QT5wIPklDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTOinAKC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712982; x=1762248982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nwoZv6RI/t7WIQO+Llzq3vqo716xkyZTrrmxMQ1Qo5A=;
  b=XTOinAKCF0sm8Q7mGXbztYkT/mypycJn/Qw1AxDCSSaUUeflCC4iV9I6
   95eRbyVGJSdTQNsFHw4vcMXLjWelHlEIUCRY4AEr+M16vpeRihzBJ7Yiz
   4GC/nV0tsSxYYu62/PVS6wj3whlE3zxEW848u039DJRPp2nlQC/B/oc5Z
   UGBGxIrn12VnVOhDuuETmyGyB+hdp9FT4d2bGCX/jOhpdYJ08d2fFXRLB
   7FrddnUGMnVS9l87Bl/gqSvIm3SLt2ttk8D9VMuwHNMDFM667NL0Yik8h
   V49k98Dc9mDuBDBJiXuVGVuadGRbKbGO8URl3+9qVLZhdSS0UZw6RhAgw
   Q==;
X-CSE-ConnectionGUID: HacooeagS1WdldGSSHEfYA==
X-CSE-MsgGUID: mW+ecpHkSdC1bOs+jioDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620067"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:19 -0800
X-CSE-ConnectionGUID: MYYv3+lJR1OEQqIJMobIIg==
X-CSE-MsgGUID: u/T5IgnnRf6ay5P0MC8VNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127054"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9F70B17D; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:19 +0200
Message-ID: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
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
 drivers/input/keyboard/gpio_keys.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 380fe8dab3b0..5eef66516e37 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -531,12 +531,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		 * Legacy GPIO number, so request the GPIO here and
 		 * convert it to descriptor.
 		 */
-		unsigned flags = GPIOF_IN;
-
-		if (button->active_low)
-			flags |= GPIOF_ACTIVE_LOW;
-
-		error = devm_gpio_request_one(dev, button->gpio, flags, desc);
+		error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN, desc);
 		if (error < 0) {
 			dev_err(dev, "Failed to request GPIO %d, error %d\n",
 				button->gpio, error);
@@ -546,6 +541,9 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		bdata->gpiod = gpio_to_desc(button->gpio);
 		if (!bdata->gpiod)
 			return -EINVAL;
+
+		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
+			gpiod_toggle_active_low(bdata->gpiod);
 	}
 
 	if (bdata->gpiod) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


