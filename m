Return-Path: <linux-gpio+bounces-12238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C59B320B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341001C21B50
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091BA1DD531;
	Mon, 28 Oct 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkLFOp+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AD1DC74E;
	Mon, 28 Oct 2024 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123100; cv=none; b=jyjlscsWidwkmA1pskcQR6jI0wW8f27EnAoXGsKTP+Al5475yvAO4L15T+ejPgOsckra/ZXIb7g1dD2BiVda0cNauOczv5BsKoDmvH2exc1cuKgxVp/g9LoLaL0Ab6U7R81c8HGzQxfg38LcIQ7Bn1XMDSXOgAEp4Jgk+lLfV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123100; c=relaxed/simple;
	bh=qiCDy8v8JsMqzS/jgUz8QRU58SpXGFn68aaEOJjUDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jeFcP9EeRd6MM+w66sOuoZ8Qq+MbGiJlnCVKLzO0k/EsSDMoAIzw1ET2erirupsa+haljNvQ9XnE5X7aBJeWQTIq/kfwEuOBHXHhy5xKPA3LZFohKUSwMaK8VmkOdbO8F6GFetaT6uucGLalMZPPeVuZe9kbCYo2THc0meGMNs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkLFOp+i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730123099; x=1761659099;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qiCDy8v8JsMqzS/jgUz8QRU58SpXGFn68aaEOJjUDxA=;
  b=gkLFOp+ipYJS9PQqArwcdZ+e7Yu3DALkHZIYPNeoyVqfc09mB6l/TtGM
   dS1f62oCDqbSOJmFWEvSNsLaHbs/Yalmy5YbpRDzcbBgNSHMA7S1Yo1QN
   4i4NNF9aWkYu8y5b6JZuVelePP6w+8Y0Zshm0G9kDcqlGCR/JETuqCJeh
   jYo6IEMtn657gy1ts/QNuq2y+usYPLc3og5gdsS6pp+EY4ufQ/SNM2fMY
   OeG+r572g4jGDgQ8WvyhcsMSXfMyunMEevy0FwShQBoCOshL7OLKFW2tr
   d1VKEfOEuIVyxXQbcTjtZD9skY/NSk5Zurd3Eij3IF8ZJ4yoWxo2oOsAh
   Q==;
X-CSE-ConnectionGUID: 383OAQZ+TLGmbBgLW4uIxw==
X-CSE-MsgGUID: nrg7ll73S+ujgnuRgwalRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33414712"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33414712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:44:58 -0700
X-CSE-ConnectionGUID: DRvrCLc0SAadFtO0NyhvWQ==
X-CSE-MsgGUID: knKsqtRvQSevsMmnn2BgFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="85571758"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2024 06:44:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 238972DF; Mon, 28 Oct 2024 15:44:55 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: Use traditional pattern when checking error codes
Date: Mon, 28 Oct 2024 15:43:39 +0200
Message-ID: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of 'if (ret == 0)' switch to "check for the error first" rule.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

While it gives a "+" (plus) statistics it makes the code easier to read
and maintain (when, e.g., want to add somethning in between touched lines).

 drivers/gpio/gpiolib.c | 104 ++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 48 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5666c462248c..a9a3e032ed5b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2674,10 +2674,11 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
 	ret = gpio_set_config_with_argument_optional(desc,
 						     PIN_CONFIG_INPUT_DEBOUNCE,
 						     debounce);
-	if (!ret)
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	if (ret)
+		return ret;
 
-	return ret;
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	return 0;
 }
 
 /**
@@ -2697,16 +2698,17 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	VALIDATE_DESC(desc);
 
 	ret = gpiod_direction_input_nonotify(desc);
-	if (ret == 0)
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	if (ret)
+		return ret;
 
-	return ret;
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
-	int ret = 0;
+	int ret;
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
@@ -2733,6 +2735,8 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	if (guard.gc->direction_input) {
 		ret = guard.gc->direction_input(guard.gc,
 						gpio_chip_hwgpio(desc));
+		if (ret)
+			goto out_trace_direction;
 	} else if (guard.gc->get_direction &&
 		  (guard.gc->get_direction(guard.gc,
 					   gpio_chip_hwgpio(desc)) != 1)) {
@@ -2741,11 +2745,11 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 			   __func__);
 		return -EIO;
 	}
-	if (ret == 0) {
-		clear_bit(FLAG_IS_OUT, &desc->flags);
-		ret = gpio_set_bias(desc);
-	}
 
+	clear_bit(FLAG_IS_OUT, &desc->flags);
+	ret = gpio_set_bias(desc);
+
+out_trace_direction:
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
 
 	return ret;
@@ -2774,6 +2778,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	if (guard.gc->direction_output) {
 		ret = guard.gc->direction_output(guard.gc,
 						 gpio_chip_hwgpio(desc), val);
+		if (ret)
+			goto out_trace_value_and_direction;
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction &&
@@ -2790,8 +2796,9 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		guard.gc->set(guard.gc, gpio_chip_hwgpio(desc), val);
 	}
 
-	if (!ret)
-		set_bit(FLAG_IS_OUT, &desc->flags);
+	set_bit(FLAG_IS_OUT, &desc->flags);
+
+out_trace_value_and_direction:
 	trace_gpio_value(desc_to_gpio(desc), 0, val);
 	trace_gpio_direction(desc_to_gpio(desc), 0, ret);
 	return ret;
@@ -2816,10 +2823,11 @@ int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	VALIDATE_DESC(desc);
 
 	ret = gpiod_direction_output_raw_commit(desc, value);
-	if (ret == 0)
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	if (ret)
+		return ret;
 
-	return ret;
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
 
@@ -2843,10 +2851,11 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	VALIDATE_DESC(desc);
 
 	ret = gpiod_direction_output_nonotify(desc, value);
-	if (ret == 0)
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	if (ret)
+		return ret;
 
-	return ret;
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
@@ -2877,19 +2886,15 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
-		if (value) {
-			ret = gpiod_direction_input_nonotify(desc);
+		if (value)
 			goto set_output_flag;
-		}
 	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
-		if (!value) {
-			ret = gpiod_direction_input_nonotify(desc);
+		if (!value)
 			goto set_output_flag;
-		}
 	} else {
 		gpio_set_config(desc, PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
@@ -2901,15 +2906,17 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return gpiod_direction_output_raw_commit(desc, value);
 
 set_output_flag:
+	ret = gpiod_direction_input_nonotify(desc);
+	if (ret)
+		return ret;
 	/*
 	 * When emulating open-source or open-drain functionalities by not
 	 * actively driving the line (setting mode to input) we still need to
 	 * set the IS_OUT flag or otherwise we won't be able to set the line
 	 * value anymore.
 	 */
-	if (ret == 0)
-		set_bit(FLAG_IS_OUT, &desc->flags);
-	return ret;
+	set_bit(FLAG_IS_OUT, &desc->flags);
+	return 0;
 }
 
 /**
@@ -2994,25 +3001,25 @@ int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 	VALIDATE_DESC(desc);
 
 	ret = gpio_do_set_config(desc, config);
-	if (!ret) {
-		/* These are the only options we notify the userspace about. */
-		switch (pinconf_to_config_param(config)) {
-		case PIN_CONFIG_BIAS_DISABLE:
-		case PIN_CONFIG_BIAS_PULL_DOWN:
-		case PIN_CONFIG_BIAS_PULL_UP:
-		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
-		case PIN_CONFIG_DRIVE_PUSH_PULL:
-		case PIN_CONFIG_INPUT_DEBOUNCE:
-			gpiod_line_state_notify(desc,
-						GPIO_V2_LINE_CHANGED_CONFIG);
-			break;
-		default:
-			break;
-		}
+	if (ret)
+		return ret;
+
+	/* These are the only options we notify the userspace about */
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+		break;
+	default:
+		break;
 	}
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_set_config);
 
@@ -3730,10 +3737,11 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 	VALIDATE_DESC(desc);
 
 	ret = desc_set_label(desc, name);
-	if (ret == 0)
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	if (ret)
+		return ret;
 
-	return ret;
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


