Return-Path: <linux-gpio+bounces-12505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE49BAFD5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B734D283046
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E9B1B0F33;
	Mon,  4 Nov 2024 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGpRmAl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA8E1AF0A0;
	Mon,  4 Nov 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712985; cv=none; b=rV3apjAV4LK5N8AeW1PzHHCXM6lhhLt0g+ERP1j6yrz9djezu2pSj9OIWXe6CttnZ+Rsg4Yl5WSDYxETQhIUg8/VbSUHgeM9e6lnF6BKLZlhzO+liKnT/GFusJHvKXYzxGyimR6BSF2ceSrcgUxXpa1CqrS5KlUXP44U5FU0naI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712985; c=relaxed/simple;
	bh=vZMtd1T590YnZLPRvMitwgFNTD+hNyBhf6P6IUabJ8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnm6nYjiqztV0THzz2hCe0qylcGraGIZSfLcIuLDaz23HLdG3Oe0nxCbNe34FcHcBFBrEv+NI30ER8cb4JNtRqdFvzGkO7U9esfCCBJcwgLNR1WVHbaG0rvhbt/byFtb73/mlkn6/k7sepvKzL9LDbRkWuIqKq4Q0ISkU5VYoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGpRmAl8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712984; x=1762248984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vZMtd1T590YnZLPRvMitwgFNTD+hNyBhf6P6IUabJ8s=;
  b=KGpRmAl8pl+DBl2o9QsdZ3MijTvr5+mCAqiewO3RiIFNJcnSDTnNYPly
   jcNsexOK8TUqoLRWN+7fkEQG/mwYEQTnGR6U1AmbGul8+QTbHSEbmA0Nl
   l4jdAPZaQzoz0MaJWvZN7NZQl7KuW7fENEYyAxHIxQdD57XvU5pDuKn2N
   2savxXY2uz+abdeQeVATA3ygbg6oZS+UAfFldXqmOq+/fX6nALIs7U64z
   xdhG6kcG2JvFfFgMt7PSTxbF0epMLJIuf61tmALyIiDsTCrmeXHBXfU1q
   6Jxj46M5ZVwwJgYId3hiT3jpTTTFA+MvQE7usdiQ28EL9OMQa92+V4FKr
   Q==;
X-CSE-ConnectionGUID: xN4R/pzXQ7uiptUfJWuC2A==
X-CSE-MsgGUID: YSV/pTB2SbKXdNqD2X7VHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620090"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620090"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:20 -0800
X-CSE-ConnectionGUID: UCIDPEfhSVKAFG44XKPZtQ==
X-CSE-MsgGUID: 697U+mSATYmDf45+hbnpFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127055"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B69AC320; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:21 +0200
Message-ID: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
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
 drivers/leds/leds-gpio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 0d59b0bbc002..a3428b22de3a 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
-	unsigned long flags = GPIOF_OUT_INIT_LOW;
 	int ret;
 
 	/*
@@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	if (!gpio_is_valid(template->gpio))
 		return ERR_PTR(-ENOENT);
 
-	if (template->active_low)
-		flags |= GPIOF_ACTIVE_LOW;
-
-	ret = devm_gpio_request_one(dev, template->gpio, flags,
+	ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
 				    template->name);
 	if (ret < 0)
 		return ERR_PTR(ret);
@@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	if (!gpiod)
 		return ERR_PTR(-EINVAL);
 
+	if (template->active_low ^ gpiod_is_active_low(gpiod))
+		gpiod_toggle_active_low(gpiod);
+
 	return gpiod;
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


