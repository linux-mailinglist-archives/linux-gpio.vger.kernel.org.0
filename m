Return-Path: <linux-gpio+bounces-14901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD9A151BC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B9D5188D157
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBF5199254;
	Fri, 17 Jan 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsXDHxKy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008F185B72;
	Fri, 17 Jan 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123797; cv=none; b=l82LnPr3jpD/DsB6BkxtAUj1+3/iSyTLVr1VDm1FKqeSTATRcSBsGhLk6ZJ6rrIFtovjKgCuAqwqI8dztg8d5yzI5NUeFzYC+c3ynWWEC0y5cVIqukEyfXqtCP5AF0A0JaPS/2rYa9VbIcDJTB9+rl7v1zv9VrpII13oCgLf89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123797; c=relaxed/simple;
	bh=tRcWlSOroUx287qq0dxF5CHV/gQI/g0ncPhzp1JYlB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyMwEvBVLP2BquZ3WNfZdVBL3vPbgRF+bl+ovnc+tk2864ILt37bXjoqQ5emTBKsGG9YRiB5NXuRDt8aQhg2YyzoctgFwyzpENr4hufSXrneGK/km2nVZNRsY+GdZu0WxDjCdbdSp/NyeJGpZM8bYhN679JBTUAIbFfkFu1OwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsXDHxKy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123796; x=1768659796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tRcWlSOroUx287qq0dxF5CHV/gQI/g0ncPhzp1JYlB0=;
  b=MsXDHxKymBu6pEJVDm/oPqK1KcCD8QIU1iUFWgdpTuR0/DC6VUKXTwMv
   nY4ijvWdKyQUi88KGjqc7QzCdGAWKQfFyxtZsndj/4jUo7v0NumKyUBSJ
   lXNfkTPRDW8DNiflqBjI5+2ejWjuecX7HOX5mFqW0QNZHFxiM6NDEf4oX
   3RTbIQDesS249UCZzXetIvPfd0fIe1I/BsrdjMkyZ6MNTZ5QbME1WtlTZ
   83rRXfLRfVB57iH3+duv/z8cj7BDkXQnusEP8S9z9ixxMr9N9XzRaDSZE
   hcrQ9Pk79dDndkA2cV5Y4Lcjs7Ush5FnnS5QzN5VW8uud65sh0COkKrVO
   g==;
X-CSE-ConnectionGUID: rO8AfWQmT7GFiefePlEVow==
X-CSE-MsgGUID: XMteuurORlCHO2U3+iWvbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792841"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: k8addCTsSxePq04JuMV07A==
X-CSE-MsgGUID: a+GuW1i0RseSn1yFnaoxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671227"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 898EC41A; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 08/16] pinctrl: cy8c95x0; Switch to use for_each_set_clump8()
Date: Fri, 17 Jan 2025 16:21:52 +0200
Message-ID: <20250117142304.596106-9-andriy.shevchenko@linux.intel.com>
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

for_each_set_clump8() has embedded check for unset clump to skip.
Switch driver to use for_each_set_clump8().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index d3f4e20d219f..851b4b4fd4cb 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -616,21 +616,18 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -647,19 +644,16 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -668,8 +662,8 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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


