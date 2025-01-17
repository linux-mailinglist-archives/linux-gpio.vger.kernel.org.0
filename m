Return-Path: <linux-gpio+bounces-14897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F7A151B0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F2C1656D5
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E49018950A;
	Fri, 17 Jan 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4gbAYie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E614B080;
	Fri, 17 Jan 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123796; cv=none; b=mqWmw4YYDi1Tny+JRul4sJi1hayPZxrtUt1SeCGNFmR7UPaG3NfBn/mvMxe/Yh+IuygB01ny90DB1fD77tSu9dadYuxS5L1E8v8MHK8di/xZeSqHEXKew3JvPgmC5t/SvAJMCp7g5FDXmRBonqNYfDYobqrsHa8RykfjBWaBDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123796; c=relaxed/simple;
	bh=OOD3gfnz7T58XAYf2c+N69hHx8SAgM1DlcIedFa0t20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUvggxKpUrUELn/4ei4UJmCSDOtkx50VhjXsNaclLK6i1dJ0w/cBdvJjSmNf39glxih95MGfNYT0LGyP2qg8A3TuAFqRkVFgeLjLx99L9B+IGiQrH/6bHVPQmmNXoLmIhHz5gPJLRl9sEQn7cMhYqy39dM/B2E0SB7wDpydAX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4gbAYie; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123794; x=1768659794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OOD3gfnz7T58XAYf2c+N69hHx8SAgM1DlcIedFa0t20=;
  b=Z4gbAYiePNiZ3ipK+ubyeSnPTDvasQe1XpCT+fkK32fY5sdB6oO+JiPP
   plLHuF0lQ4LTMMY0j9Y2VrV7PEbaASG1v3ftiTA14XhVoDY+YnvJgLVoa
   MkfI6ZxnWf8zzDXZ3PTean1kFxAQW5LOWaWDB0FT8PI2FdAwjVDYcJqGD
   tAbkOvOFvn6u4a2ExRy3AAm4l8wzHUpbYP0GUa2UyqfQtSihPHEdYvku2
   E8kNZEu8IJDQ/IGckzjwJjDqJafhRQ066Y1uN5eERZm1EJBA4ybsg2+Hp
   nmXCqGcFlPYlVIW+oA4Y6AiKtpSN+DZqFbPBRFFube71FLNgbJJ8sFh7E
   g==;
X-CSE-ConnectionGUID: xIst4NFRRVaqtYM8O+OVDA==
X-CSE-MsgGUID: /XEcPfutTA+UdIytvdn1SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792832"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: fbfDCHeSQhCOcSv1uwRHNg==
X-CSE-MsgGUID: AVWmVrHwRFmhxk3MLQboqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671224"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79493400; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 07/16] pinctrl: cy8c95x0: Use better bitmap APIs where appropriate
Date: Fri, 17 Jan 2025 16:21:51 +0200
Message-ID: <20250117142304.596106-8-andriy.shevchenko@linux.intel.com>
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

There are bitmap_gather() and bitmap_scatter() that are factually
reimplemented in the driver. Use better bitmap APIs where appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 970b6842b05b..d3f4e20d219f 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -137,7 +137,7 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  * @irq_trig_low:   I/O bits affected by a low voltage level
  * @irq_trig_high:  I/O bits affected by a high voltage level
  * @push_pull:      I/O bits configured as push pull driver
- * @shiftmask:      Mask used to compensate for Gport2 width
+ * @map:            Mask used to compensate for Gport2 width
  * @nport:          Number of Gports in this chip
  * @gpio_chip:      gpiolib chip
  * @driver_data:    private driver data
@@ -158,7 +158,7 @@ struct cy8c95x0_pinctrl {
 	DECLARE_BITMAP(irq_trig_low, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_high, MAX_LINE);
 	DECLARE_BITMAP(push_pull, MAX_LINE);
-	DECLARE_BITMAP(shiftmask, MAX_LINE);
+	DECLARE_BITMAP(map, MAX_LINE);
 	unsigned int nport;
 	struct gpio_chip gpio_chip;
 	unsigned long driver_data;
@@ -621,13 +621,8 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
-	bitmap_andnot(tmask, mask, chip->shiftmask, MAX_LINE);
-	bitmap_shift_left(tmask, tmask, 4, MAX_LINE);
-	bitmap_replace(tmask, tmask, mask, chip->shiftmask, BANK_SZ * 3);
-
-	bitmap_andnot(tval, val, chip->shiftmask, MAX_LINE);
-	bitmap_shift_left(tval, tval, 4, MAX_LINE);
-	bitmap_replace(tval, tval, val, chip->shiftmask, BANK_SZ * 3);
+	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
+	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
 	for (unsigned int i = 0; i < chip->nport; i++) {
 		/* Skip over unused banks */
@@ -652,19 +647,13 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 {
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
-	DECLARE_BITMAP(tmp, MAX_LINE);
 	int read_val;
 	u8 bits;
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
-	bitmap_andnot(tmask, mask, chip->shiftmask, MAX_LINE);
-	bitmap_shift_left(tmask, tmask, 4, MAX_LINE);
-	bitmap_replace(tmask, tmask, mask, chip->shiftmask, BANK_SZ * 3);
-
-	bitmap_andnot(tval, val, chip->shiftmask, MAX_LINE);
-	bitmap_shift_left(tval, tval, 4, MAX_LINE);
-	bitmap_replace(tval, tval, val, chip->shiftmask, BANK_SZ * 3);
+	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
+	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
 	for (unsigned int i = 0; i < chip->nport; i++) {
 		/* Skip over unused banks */
@@ -684,8 +673,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	}
 
 	/* Fill the 4 bit gap of Gport2 */
-	bitmap_shift_right(tmp, tval, 4, MAX_LINE);
-	bitmap_replace(val, tmp, tval, chip->shiftmask, MAX_LINE);
+	bitmap_gather(tval, val, chip->map, MAX_LINE);
 
 	return 0;
 }
@@ -1484,8 +1472,11 @@ static int cy8c95x0_probe(struct i2c_client *client)
 		return PTR_ERR(chip->regmap);
 
 	bitmap_zero(chip->push_pull, MAX_LINE);
-	bitmap_zero(chip->shiftmask, MAX_LINE);
-	bitmap_set(chip->shiftmask, 0, 20);
+
+	/* Setup HW pins mapping */
+	bitmap_fill(chip->map, MAX_LINE);
+	bitmap_clear(chip->map, 20, 4);
+
 	mutex_init(&chip->i2c_lock);
 
 	if (dmi_first_match(cy8c95x0_dmi_acpi_irq_info)) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


