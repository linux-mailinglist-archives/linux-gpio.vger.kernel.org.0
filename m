Return-Path: <linux-gpio+bounces-15380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B565CA28711
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A723A518D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A8822CBED;
	Wed,  5 Feb 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqRJMn7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9E22C355;
	Wed,  5 Feb 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749180; cv=none; b=FjwalLPoCyDAUdBh7qqM8rPu8pu08mLD0e2CBwgA/WnIy+c3wHPHmUNXUCmXDxEfM96H5iMlHSjINgmQkzZnHNAcviwbbNoiLsTC78j5xYljqfkskv1u4w2qVJXr06U2BDZf7INNmZeIoV/hY90KIZqnKxzWjCttXa9Z2ZGEeL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749180; c=relaxed/simple;
	bh=hx2GED+KzknC2aIdo2tmM0oA+QVXDCoaWc8rqNOrIQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyWyCW3xkRUXHfy1yZOPlo8VDirrJfSAk/ka2XCj6QI8fLrzEroRuqrcEvB8WAihhAioa1GPnOt8LLYPIGu4gCJVvX+uNL91ldojN2I2GV7SSIlXwCjDo33LDRLUS6bgJ2voZJDDiWwmoecrYnltL4TtP0CyJTiV5UU7/Dv1ncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqRJMn7K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749179; x=1770285179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hx2GED+KzknC2aIdo2tmM0oA+QVXDCoaWc8rqNOrIQY=;
  b=SqRJMn7Kr4rln4kdenCD6hjT+k/gmB/ned1QVGe8iKhxBEANJaD4HL5X
   sLLbRtMl0HFf11EBZT7GG20DZ7oEeTKlHGWerpZ9lKzKgWOuAgZeSjw2v
   6QHrjZoQopQts+K5ui23i0G2uyChhvlRDy0KBfZwsHKn0mcmMLrdr63+9
   JyEamb+1D0SWfRph8Ktoy2zysGKDGyfnzr1Ym/gmGLvwi/20Byd3Un4F/
   FpB9IT5IpnFQcbl7EzaaLVfO+gM0IBqfTWU1B2EmGWQzQJfiMj81QjT7K
   jFDeyCMryiMm1mWikSvoPJg6qUMjTFsLlZn3TZHN9i9yk+PW+k9/Yvf5s
   A==;
X-CSE-ConnectionGUID: lgUzN+yRRr6S3jP1xiHH2Q==
X-CSE-MsgGUID: RFVH9w2vRhGqINIB8us2PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922070"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:51 -0800
X-CSE-ConnectionGUID: +vSdjsUtTdea0WitTjtoWg==
X-CSE-MsgGUID: Gyu5BE4tRWmjqj8EpvHzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822427"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ED2184F0; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 07/10] pinctrl: cy8c95x0: Get rid of cy8c95x0_pinmux_direction() forward declaration
Date: Wed,  5 Feb 2025 11:51:17 +0200
Message-ID: <20250205095243.512292-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
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
index 7e79f20f4d78..3f2bdaea58b4 100644
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
@@ -672,6 +669,31 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -1229,32 +1251,6 @@ static int cy8c95x0_gpio_request_enable(struct pinctrl_dev *pctldev,
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


