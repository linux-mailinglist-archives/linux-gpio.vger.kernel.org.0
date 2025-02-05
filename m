Return-Path: <linux-gpio+bounces-15379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B50A2870F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 514F17A5DB7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0782522C358;
	Wed,  5 Feb 2025 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsWr45Uv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE222B8A7;
	Wed,  5 Feb 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749178; cv=none; b=HtaNrf5YfxiOQfWYKciScNd7eyzVtD8UwUbQy3CThH0buVOWWDgyJ+5RTxXBIAxjf7tGVONfBA3icDb8L4zVvzqLUkS1yaWvKxLthMO6lyFdnuLRarc+Jbt3d/np6eMrsgt2bGDvWkLEo31SMz/3YiIygisiGeR9nvu/0szyza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749178; c=relaxed/simple;
	bh=BHuiUtSV91zBPe3AHwqHvnwH0yVBbd7xycQRGNHlHU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/QjMarPU9LJmb5zvZ7b+Y7Ff+sIUiDAGfFEJhNJ1s5TRD0Fd2rspTy+9KFv+vfBwuiUSr9m2z8LAzNE9KP33qgPlekUD4qKQV16qs9iRiusCaKvD9ZXUdyryKfeLw1Xs3A+DJ+EkhTUOFQS266xBOAMlSUhgGbPvDk97DxeghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsWr45Uv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749177; x=1770285177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHuiUtSV91zBPe3AHwqHvnwH0yVBbd7xycQRGNHlHU4=;
  b=PsWr45Uv8FdChalqEC2HDsxCIMKuleQFbVkZrXcqciEizJ73y6OVnRbi
   jShPAjagzTGszMlvGuN8IKFwha73MnvmapKI+fODWwxlCSJAT5o6gxYbQ
   qBx3uxdORg7DQwZJPQxkkT5G2vNlxg5AhS7EMtBC08as86GGJAaqqMx1w
   KFPvs8Siwi+Aa7/jHvhlx/92cABqoz5f0pYzRx7lHmAl9XYzqGJ6KrFBg
   an55eih+D5XZRSWGXyGPBdp3ICHcrldgxpNCdePjLhWp4P2NU2q8xu/Qf
   3Jlp5tOg2wV/z6mN8IClQJ6wZdA43NrMZy1Tya6VsCt7CyszVHXcVV6b+
   Q==;
X-CSE-ConnectionGUID: hKiw3KcwQcSOirOb7d+vZA==
X-CSE-MsgGUID: USWg42UdSjex+oiyzidbDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922059"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:49 -0800
X-CSE-ConnectionGUID: NmD2/YhzQtasqBOF9Vaiew==
X-CSE-MsgGUID: wCLm2/SaRW6UUO4RtZlJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822420"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9B6F5299; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 01/10] pinctrl: cy8c95x0: Use better bitmap APIs where appropriate
Date: Wed,  5 Feb 2025 11:51:11 +0200
Message-ID: <20250205095243.512292-2-andriy.shevchenko@linux.intel.com>
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

There are bitmap_gather() and bitmap_scatter() that are factually
reimplemented in the driver. Use better bitmap APIs where appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index d73004b4a45e..f53dbcaf9a32 100644
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
@@ -622,13 +622,8 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -653,19 +648,13 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -685,8 +674,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	}
 
 	/* Fill the 4 bit gap of Gport2 */
-	bitmap_shift_right(tmp, tval, 4, MAX_LINE);
-	bitmap_replace(val, tmp, tval, chip->shiftmask, MAX_LINE);
+	bitmap_gather(val, tval, chip->map, MAX_LINE);
 
 	return 0;
 }
@@ -1486,8 +1474,11 @@ static int cy8c95x0_probe(struct i2c_client *client)
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


