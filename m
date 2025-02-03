Return-Path: <linux-gpio+bounces-15269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D2A25A91
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84AA218888BF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE1B205E32;
	Mon,  3 Feb 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6blbxl4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5A205519;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588517; cv=none; b=X6rLJZb5fOXhmfeFb0njD9uTbNHkxJ4fDgIrvcoTu+WSXecB4ekAx8KPVKBBYchhrfA5O35kK0NqD4XYv506pVQN2GqrD58qsH3JIVHvxaRn3Uu3Vxyvb+UUXbyMXDK2AzqDxr0U+0beJ+KNJL2Ir52J82VLVxgNcaZqtbII30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588517; c=relaxed/simple;
	bh=9hbhJ/OGcbx2u5M6L6AVNb9EanjkqtbRFH64m31jAH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlaZ4lhKdAdOjU8laaKz9NhTsMOFr7hy1Lqex/stQmQ7s+M6nlB3vm5NNwksf3vXJgxj5OOL6wqcCouhZSsuZxK2a0AZTcBEahBI7DFqLbFcOmHvezE5cdf1owwTh9sAaBO0h48Nbakh1UOjyNM3iRa1QLAgT0Z/MVoixSZYY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6blbxl4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588515; x=1770124515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9hbhJ/OGcbx2u5M6L6AVNb9EanjkqtbRFH64m31jAH8=;
  b=L6blbxl4rzWKdPAdquqKHzQFfmOW8iGncJzoQ9+DgD7hnfvL+NNx7+r5
   j09C07VGV8Zdy7eWpMQ7euNUaMUQS1IEnobuy69iXdF6AJUwPTghjc8Qe
   F+zwGjqnFNvkpzdEoQ32UZ9u9PTGOOjtaT1wNMDBcSX24TgVqWI5bSg0Q
   DN12nRaDGqFRUkuFR7CjsCr5Le8LNU2iqoswKiJXtLtqyE6zeY2n42eMM
   rrHV0zxwC17S7nq05Wl2XDq9RS2hqBOte9wXYaouFOqC1t2NQ7uqEcRwa
   qC9498aBVzFYcocFwC8hZeYQiE7VuvkA+UHZCsgga8neWJRXjRIT5BzD9
   A==;
X-CSE-ConnectionGUID: tUXKU0MBTT2gW6oMej7RTA==
X-CSE-MsgGUID: wjDAOAIvT+ewtDEemFg4RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217692"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: yNs2vvw9RwyGpCQN1sIZFA==
X-CSE-MsgGUID: 0k4aAtZYSjyQ9uPqA1+y+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287398"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D73983A7; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 05/14] pinctrl: cy8c95x0: Use better bitmap APIs where appropriate
Date: Mon,  3 Feb 2025 15:10:31 +0200
Message-ID: <20250203131506.3318201-6-andriy.shevchenko@linux.intel.com>
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

There are bitmap_gather() and bitmap_scatter() that are factually
reimplemented in the driver. Use better bitmap APIs where appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index d73004b4a45e..52d8a44bb44e 100644
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
+	bitmap_gather(tval, val, chip->map, MAX_LINE);
 
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


