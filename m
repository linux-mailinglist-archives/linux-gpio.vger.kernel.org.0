Return-Path: <linux-gpio+bounces-15381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DEA28714
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C70A7A06C4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD1A22D4C1;
	Wed,  5 Feb 2025 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTKWnDQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481622B59A;
	Wed,  5 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749181; cv=none; b=nMQj8SWSb990bcsBhXOsk/Mg89/247Oi5ZLBv6hojRQtLpyGwZMCXCi9TXWfKjyLv6RD+ZMiDnYEqIN3NkYt0M/t64Cj6WfzPxcTiwgUZ1KGYjyXnZQiZroIJURloQHLaBt19jR6CCcP3GzpKjORJoFJk9nNRJ5RQjVdpaNGT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749181; c=relaxed/simple;
	bh=tZcHogWpC3u+t+y2IsGjxMavEbq1olEFTwGR+RsGkcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdWxh0z7XAHvZ0Tu2W0SDEWtMt2P6pIFYGUk4FMqy2IygVbsTE7yJb5C95o7BB9G0wB7ZWYAszZEc61TEJ2DbVPHZbZbfBbQuI8GHImzSbKmDCb7t1nWs/mI2pTFTy2KO6aa/tN6sQnw6ome/lwAT1BPBohKHnF8eSGIgdh+bpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTKWnDQb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749176; x=1770285176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tZcHogWpC3u+t+y2IsGjxMavEbq1olEFTwGR+RsGkcs=;
  b=QTKWnDQbIF2gkK0wpBu1qa9gJiyZ8hO6ngy6z/lxqGoKSQlGHeW9esu7
   GsptnN9CvyngIjdf26Rw1hUAQkOMM8yeslsAESjV4QCLat/uVIyGN5zc5
   NwC8PpFDESwI20+uzwgsgnSywWgz47XvWEGLTZ5+V4FZcD/lahdMDfZ6G
   3mXJtJAjHvqVBokNyCki5rEd2ytALCBBbqcg7SqXcbMnyxpQT0Aga3L8r
   faI9Hic4dKJRGyYf5sTFWl8yQDXLkyyTQyEqtI3HkWKol/Le/3LAgH3M6
   qRsxHwIOJK8eSFP7v0UVuU9RFx0F/+u/WkhQDQFdEBeuqxRgUP6c9ZAKR
   Q==;
X-CSE-ConnectionGUID: m5dNAUZlQSOzZbkCUVHNNA==
X-CSE-MsgGUID: pwxbIslKRPSbZ6QNIxASYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922061"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:49 -0800
X-CSE-ConnectionGUID: WUTYvjSAR3Cx5QL8OwhTXQ==
X-CSE-MsgGUID: SCQnpLnuSEqqtMkKWxKW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822421"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B47D23A7; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 02/10] pinctrl: cy8c95x0; Switch to use for_each_set_clump8()
Date: Wed,  5 Feb 2025 11:51:12 +0200
Message-ID: <20250205095243.512292-3-andriy.shevchenko@linux.intel.com>
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

for_each_set_clump8() has embedded check for unset clump to skip.
Switch driver to use for_each_set_clump8().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index f53dbcaf9a32..0eb570952f3f 100644
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


