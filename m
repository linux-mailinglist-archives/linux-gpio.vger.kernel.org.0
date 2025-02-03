Return-Path: <linux-gpio+bounces-15263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF8A25A8D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E233A7731
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93D20550E;
	Mon,  3 Feb 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBnGrqay"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BDE204F8B;
	Mon,  3 Feb 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588514; cv=none; b=iBI4yI97gZHHIvwwvzPb4/UEJ+X92ivgwOd3sIeAHoShT4dssyhgpsvzbUIHNxkcxrb/RwxN8wEHcYfWPn3uWh7zQFFC6aQJTwQfvecStE1OZ+IDzJ0quZxxox2LpBv+QxYxQCkurLzvzFWCybSxeB4fW3OyH4EQM4vF9NKeoYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588514; c=relaxed/simple;
	bh=MGRTKb3BRfce0g3Zemq37xOaocZsf88w4v3e8RmEEpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vgcu8WkkZPogE5yqqwDgzNgGn0c6+qBzMZdFSKf0ID+Kw3q52FuroYS799jrKr5L5KOsWVPEU0Y1d3ZS17jJ45YBYmQqAg4djK1yBdcaNwvw6lQdpmu8DNb1zmHo6kzrnxFvUi34psblgaTmpc0GXJ4hrtNDdJSgWCU4+/+7T/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBnGrqay; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588513; x=1770124513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MGRTKb3BRfce0g3Zemq37xOaocZsf88w4v3e8RmEEpY=;
  b=cBnGrqayt33sxOGCJMgPks+fnfnUdR2RByVtRlsNP7QzCsAM0eRzR1aA
   LrROId83J8xIBn8DkN0H07sD5hAFy/UEgjZw0C/Xh7Yg82+xcW8Y857dp
   16KBcoJnPYSatYx4+oJ2VtPZii/9IUK7jGq8sRl51wXz//u9Js4VU64vS
   hDr294UO9+82BiQHACXRIbS9RQZ2VCmR1Mx0MFijDKczutse1b1XkA6Rl
   O41RBtAWrNqm+ueRxQdGBmN1+YNIJCS6bWu0vy+UoPD5EO7K9FbZS7eYu
   cuftQMBAfzoDZrzXpCXAugXo7KSl1MR1mHYCYEc6E3nIgw/CCQHwvuApD
   g==;
X-CSE-ConnectionGUID: ZcRb6aumTEStGE3n+XEgHg==
X-CSE-MsgGUID: fjXraRMrSrSAo4NfIkrsRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217680"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217680"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: jtFCd1AuSv6QoeIGk3oTNQ==
X-CSE-MsgGUID: kapxb2AIRryaXgOi59cSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287397"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E16A849A; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 06/14] pinctrl: cy8c95x0; Switch to use for_each_set_clump8()
Date: Mon,  3 Feb 2025 15:10:32 +0200
Message-ID: <20250203131506.3318201-7-andriy.shevchenko@linux.intel.com>
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

for_each_set_clump8() has embedded check for unset clump to skip.
Switch driver to use for_each_set_clump8().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 52d8a44bb44e..93fb8afab643 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -617,21 +617,18 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 {
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
+	unsigned long bits, offset;
 	int write_val;
-	u8 bits;
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
 	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
 	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
-	for (unsigned int i = 0; i < chip->nport; i++) {
-		/* Skip over unused banks */
-		bits = bitmap_get_value8(tmask, i * BANK_SZ);
-		if (!bits)
-			continue;
+	for_each_set_clump8(offset, bits, tmask, chip->tpin) {
+		unsigned int i = offset / 8;
 
-		write_val = bitmap_get_value8(tval, i * BANK_SZ);
+		write_val = bitmap_get_value8(tval, offset);
 
 		ret = cy8c95x0_regmap_update_bits(chip, reg, i, bits, write_val);
 		if (ret < 0) {
@@ -648,19 +645,16 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 {
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
+	unsigned long bits, offset;
 	int read_val;
-	u8 bits;
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
 	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
 	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
-	for (unsigned int i = 0; i < chip->nport; i++) {
-		/* Skip over unused banks */
-		bits = bitmap_get_value8(tmask, i * BANK_SZ);
-		if (!bits)
-			continue;
+	for_each_set_clump8(offset, bits, tmask, chip->tpin) {
+		unsigned int i = offset / 8;
 
 		ret = cy8c95x0_regmap_read(chip, reg, i, &read_val);
 		if (ret < 0) {
@@ -669,8 +663,8 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 		}
 
 		read_val &= bits;
-		read_val |= bitmap_get_value8(tval, i * BANK_SZ) & ~bits;
-		bitmap_set_value8(tval, read_val, i * BANK_SZ);
+		read_val |= bitmap_get_value8(tval, offset) & ~bits;
+		bitmap_set_value8(tval, read_val, offset);
 	}
 
 	/* Fill the 4 bit gap of Gport2 */
-- 
2.43.0.rc1.1336.g36b5255a03ac


