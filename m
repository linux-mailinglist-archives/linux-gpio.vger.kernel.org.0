Return-Path: <linux-gpio+bounces-14903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD7A151C1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A28188DA32
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1701E86333;
	Fri, 17 Jan 2025 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvhWPoNW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8DC1990C1;
	Fri, 17 Jan 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123799; cv=none; b=DQg59yvTpJ+hgL170Xakh1wEVZg+esHFL4yTBqMU84OZK4E0PGpfN4ZB8W0ry6EBaapw58kZn60yPFIytc+8vMQDCZAH6lxY6Ew0VW+ql8V2dLrx/Qk4yiQV+2Gn7Bg7HKdg7uxfsjhBcyLKNfaOOaIML5O3UvmGwlWovhCagig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123799; c=relaxed/simple;
	bh=e+vy5gdsWQy17qO5/JqKII1U70Q5O6U013x6DVlLJPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AL0pqqLYxuWZZzbwYRs2JVh9bd3K8Fa16my+k+bBirMNMG659nJwc9Cj0hvVWyGa0iYeE7o3Tt/w39OPZn8kK2aw/KcsOj/bL4alyvjL67cU2Fc+/A4nlQCLtt9TzWCmTvqGHvufUwcGtFp8pcb3+KqbANJHRYD3zl4Kw6fY4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvhWPoNW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123798; x=1768659798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e+vy5gdsWQy17qO5/JqKII1U70Q5O6U013x6DVlLJPk=;
  b=DvhWPoNW3HH64i2QxdGjMdeBUgqf7eEXrDHTrIRIE7KYnK2FgJJCHbak
   IBrIlQp9IjAMHOmeF0HEiF0ri7jzpQ8SKMnlTkdTokzctSHakbmqN9RnN
   ynBRsYuPm+1ClzRKbvducVTQUEOIceO5TY6Ooep2k3v04XCna2LCfBajd
   f9FmKlmdo3SC67ULQ7diB1665GceSY3cDsDwVbFejL9mse4KnF9rwrMt3
   GORTAjyKaDzm09EESG+XRiK2YF0cm5t/5pIEA/uWeCd3mqRMfOeXqa6Bt
   vedKpVJLoX4KJ4Xlj+1vycuCoeiL8cKccPftXv2+I/KFhww9MqkkMB6VS
   Q==;
X-CSE-ConnectionGUID: I6H+P4QmSuCLS/lzA3C/JQ==
X-CSE-MsgGUID: sWYsERFwT+O9pw3rOECigw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792848"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: ZHD3lPgSQ72bzYiPE2djtw==
X-CSE-MsgGUID: OxkXDcCXSryGNjBfr14s1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671229"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BD7D256B; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 13/16] pinctrl: cy8c95x0: Get rid of cy8c95x0_pinmux_direction() forward declaration
Date: Fri, 17 Jan 2025 16:21:57 +0200
Message-ID: <20250117142304.596106-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is used before being defined. Just move it up enough to
get rid of forward declaration.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 54 ++++++++++++++----------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 657e9fe40e38..fc9c6d293198 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -310,9 +310,6 @@ static const char * const cy8c95x0_groups[] = {
 	"gp77",
 };
 
-static int cy8c95x0_pinmux_direction(struct cy8c95x0_pinctrl *chip,
-				     unsigned int pin, bool input);
-
 static inline u8 cypress_get_port(struct cy8c95x0_pinctrl *chip, unsigned int pin)
 {
 	/* Account for GPORT2 which only has 4 bits */
@@ -671,6 +668,31 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	return 0;
 }
 
+static int cy8c95x0_pinmux_direction(struct cy8c95x0_pinctrl *chip, unsigned int pin, bool input)
+{
+	u8 port = cypress_get_port(chip, pin);
+	u8 bit = cypress_get_pin_mask(chip, pin);
+	int ret;
+
+	ret = cy8c95x0_regmap_write_bits(chip, CY8C95X0_DIRECTION, port, bit, input ? bit : 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Disable driving the pin by forcing it to HighZ. Only setting
+	 * the direction register isn't sufficient in Push-Pull mode.
+	 */
+	if (input && test_bit(pin, chip->push_pull)) {
+		ret = cy8c95x0_regmap_write_bits(chip, CY8C95X0_DRV_HIZ, port, bit, bit);
+		if (ret)
+			return ret;
+
+		__clear_bit(pin, chip->push_pull);
+	}
+
+	return 0;
+}
+
 static int cy8c95x0_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
 {
 	return pinctrl_gpio_direction_input(gc, off);
@@ -1228,32 +1250,6 @@ static int cy8c95x0_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return cy8c95x0_set_mode(chip, pin, false);
 }
 
-static int cy8c95x0_pinmux_direction(struct cy8c95x0_pinctrl *chip,
-				     unsigned int pin, bool input)
-{
-	u8 port = cypress_get_port(chip, pin);
-	u8 bit = cypress_get_pin_mask(chip, pin);
-	int ret;
-
-	ret = cy8c95x0_regmap_write_bits(chip, CY8C95X0_DIRECTION, port, bit, input ? bit : 0);
-	if (ret)
-		return ret;
-
-	/*
-	 * Disable driving the pin by forcing it to HighZ. Only setting
-	 * the direction register isn't sufficient in Push-Pull mode.
-	 */
-	if (input && test_bit(pin, chip->push_pull)) {
-		ret = cy8c95x0_regmap_write_bits(chip, CY8C95X0_DRV_HIZ, port, bit, bit);
-		if (ret)
-			return ret;
-
-		__clear_bit(pin, chip->push_pull);
-	}
-
-	return 0;
-}
-
 static int cy8c95x0_gpio_set_direction(struct pinctrl_dev *pctldev,
 				       struct pinctrl_gpio_range *range,
 				       unsigned int pin, bool input)
-- 
2.43.0.rc1.1336.g36b5255a03ac


