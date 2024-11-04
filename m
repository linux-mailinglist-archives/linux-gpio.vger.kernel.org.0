Return-Path: <linux-gpio+bounces-12503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 749939BAFCC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C0FF1F21CFD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357D51AF0D3;
	Mon,  4 Nov 2024 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBktejPa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40F1ADFE2;
	Mon,  4 Nov 2024 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712983; cv=none; b=AieqM1hRd/mHRmIrRLBsukYwDDUCfK34ohphai7qITuEOmGFSXLAnAh8BrHHhH7OnDpaP689SAY2srme47N1s7V2nwAhXTI21sfzYFyXN037mN/OcyYYCx0Z5My/2Ees1YI/wJfRCobsOJfp1QoFDhtDc2inDKMGG5hSK/h0TZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712983; c=relaxed/simple;
	bh=kUCUIekHAy2hQVeY+KDx2ZmkPhmDOVUUdVI2qaPtf0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzRwS9ZWZ7M18UlCZSiSkye8frDm8445WsaXmbmRYh6VKJUIcCn/qPL+GsvOwYt2Kqhwp9sQf7fOpnjJfYZvxVtUNGwmyGhAw+wI3KFm91JCENPajxIEzwhZxDNN+HA7DalmoI6Z0ecp6g4qWuq3ffVVVKHAFqFwDqW1D95/8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBktejPa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712982; x=1762248982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kUCUIekHAy2hQVeY+KDx2ZmkPhmDOVUUdVI2qaPtf0A=;
  b=UBktejPaI/zFLOeLkY9Ms2qREZeAkHOZFas4aVttu9PULi5fkpRhNR3a
   LkekdJqNAhryBaT040G6kp+++fnQ8Mm1rhSEl1hKDD/5PIGI8WOWqqRxn
   Pzfn/hSAjFl53w9z4CHvQTFR4aYZmyuvXvhbH+1OHj3bICfe8HJlTQtpZ
   TjMe/ivE7CiBN4f7/VVjQvW8Wqtls56tnGz9/bI0PnK9eF39jWIt0zpJK
   2nYu1TaoV1A8oronWNok0JzbVZH8McVc/F5Bqn3lfButOSIfL1qUH2ChE
   bBC9nK0xTUtUrFNo0gu0ACQEqOH9SCtAIlrJdOLFSZgi323xT99oGdBV7
   A==;
X-CSE-ConnectionGUID: CJj6V8J9TH+QxhcTqQHLMA==
X-CSE-MsgGUID: S0qxHZ17SxC8ZzvLHbCopQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278749"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: hvVNDrAtT+ibO2wGuf0PZw==
X-CSE-MsgGUID: jao+gc8dRpqEnOSD9mauAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481189"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AD59626A; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:20 +0200
Message-ID: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
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
 drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 41ca0d3c9098..e6707d72210e 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -306,13 +306,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 			 * Legacy GPIO number so request the GPIO here and
 			 * convert it to descriptor.
 			 */
-			unsigned flags = GPIOF_IN;
-
-			if (button->active_low)
-				flags |= GPIOF_ACTIVE_LOW;
-
-			error = devm_gpio_request_one(dev, button->gpio,
-					flags, button->desc ? : DRV_NAME);
+			error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN,
+						      button->desc ? : DRV_NAME);
 			if (error)
 				return dev_err_probe(dev, error,
 						     "unable to claim gpio %u\n",
@@ -325,6 +320,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 					button->gpio);
 				return -EINVAL;
 			}
+
+			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
+				gpiod_toggle_active_low(bdata->gpiod);
 		}
 
 		bdata->last_state = -1;
-- 
2.43.0.rc1.1336.g36b5255a03ac


