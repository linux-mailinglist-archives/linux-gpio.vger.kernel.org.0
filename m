Return-Path: <linux-gpio+bounces-15270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E8A25A9E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCDB23A86CE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2003D2063E5;
	Mon,  3 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCsc68D2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42D201009;
	Mon,  3 Feb 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588517; cv=none; b=cO/FkAuLDS+x+Eltkic6uo+Q2I6suziUc2ClTJ4C51hAAZQkeeQsLwoIaHGglh+NueZ15SlOo6nZ7wsz+jGSzTXFcbvt1jLePmeBuYqxvUfbPPbk9l3Vb1iwW74KUPTLCqmCbCeidb2q4YVtw7E4HQk2jQzML63AzrKNiXrcC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588517; c=relaxed/simple;
	bh=JQ0rNWoHugO8PQxdBUOFs2VhxzGvM6HnIwqk++NLNmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtC8JOewgHjKIzkmLoV/H4Pd6obH5OgKlg/qfDba1Rxne+gRkt9nyNqGZxGmJrsLhxw8fAkSBDCoipii+V1nrPeRWTNEwZ+MUkiW3C96eluWeSzaMHQrsuGyrMtpjI5uU/NqJTAoAlG0/iWLurVyCXf+MoITarXeZ8GwB9Ok7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCsc68D2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588515; x=1770124515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JQ0rNWoHugO8PQxdBUOFs2VhxzGvM6HnIwqk++NLNmo=;
  b=aCsc68D2g81WiXL4Pkc9FsglAKxh8oqP2JqHiE6lKmLw1iEy9Kbz9PIS
   UtxL1hEwOQ2zrOJB/b8m4ogbOQ/UeDarXdLIKy7qKGtQfWnPGFUzbj7af
   uBP6B/ufK/NHqPzTRmgl5yjvxRd8e7fZuQW6lBvLSJeHcSq9IffjfTMZz
   fUo2L7PDB2jTX7jFN92VC3DJDJtagm7zI8PUDQ0tN21qC6U3s6Iq9wKYm
   Npbu51kShY1TxriXUufnPqSYHfZtW62Xb30yGaHPzH8eSe32T4y8xrHxp
   jTYHTQMxpPEkbKLGYJvezo4i+IPt0O8ZqMecuwR1RyXYrRfVvMgonveMH
   A==;
X-CSE-ConnectionGUID: kw7vFXS/STW+E3eY6C6F7A==
X-CSE-MsgGUID: yKmcSY86TF6OC+brYS5ojA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615963"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: zLsDOUakTdGa4M+r3m858g==
X-CSE-MsgGUID: txpfJLVISWaH07+vZwrnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854206"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 21FF6627; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 11/14] pinctrl: cy8c95x0: Get rid of cy8c95x0_pinmux_direction() forward declaration
Date: Mon,  3 Feb 2025 15:10:37 +0200
Message-ID: <20250203131506.3318201-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
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
index 0aad4ed79699..a83a1b13a97f 100644
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


