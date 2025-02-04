Return-Path: <linux-gpio+bounces-15349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA039A27ABF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 20:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E5F161B99
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 19:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAC6219A8F;
	Tue,  4 Feb 2025 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezdFq2Ad"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61C219A89;
	Tue,  4 Feb 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695747; cv=none; b=AyFzrvfm2aBRbzshJUn4rdHznhknIjSyoGS8rFv8bsrZmma0Ct6IRLkoayRCWVGJI6cbPlrhnEvfCCRlZEa7ncyw9D0/9ITSIZ9+ayq1Kh939BoJpfoPhilFcKMOnDPLujIQyZ9lPSQp3kGPduIMoKmyGTTZOUkvj7yifssC3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695747; c=relaxed/simple;
	bh=uPcVdAtRWpZ0AglXlZdSj+u1jA9t4CapbWMO23b2j00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oxi+LGBGbFJcp/eEKWsdA/+R3Dx5HT8XHP3fOD8sOEORWpTr3GT9UHz+ByHUAw8Xukgg24K9Ns4aC5rd2M36I0b1OUujML7ckkQ4rmKdk1rnLOaosYP5d7vT4/6FUs/yqWKBs3tt25p7y9An5VhAt86Qgzz6hZYCl9C41hERG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezdFq2Ad; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695746; x=1770231746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPcVdAtRWpZ0AglXlZdSj+u1jA9t4CapbWMO23b2j00=;
  b=ezdFq2AdanOSfwvcSxT7bXxezLfLFbA7/9R4dawnFhQhehF2MKgvbGE8
   MOwH2HtLvSwXcmLObD5Ti/wzneL/f5xgzwq9Sp/NlPh5Z/1kYIGs1EB+b
   qFK6J59NNnjkBhaz5n0r7uuGclHguPLXuN37JlsxQQfX0I7xmbNAMBPmi
   7G8L7rBvPhlDpkaO87Aw5OY3ZI6eJbMTNv6paUEMryY0OayDatpXzNZWy
   6wEewbGVmWwG4WWLzJLY0oU1+9f2HG/52FN8U0mtWqlkgkR97XLdDuP0n
   CZ0P74qg31pEXPX8pXf+IXbRRCcD/MwGPIlZvzjWPpImogAvKwVUboiLb
   Q==;
X-CSE-ConnectionGUID: IT1MJLKTQK6vFc+SM92oUQ==
X-CSE-MsgGUID: mSoo7NT3ST6OwOYENjQjhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501841"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501841"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:24 -0800
X-CSE-ConnectionGUID: up+77qcoR6eg2GWYh9wVGQ==
X-CSE-MsgGUID: 2/Udqy5eQ/WDHsAI1cB4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542482"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9FD0C399; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
Date: Tue,  4 Feb 2025 21:00:48 +0200
Message-ID: <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relatively recently bitmap APIs were expanded by introduction of
bitmap_read() and bitmap_write(). These APIs are generic ones
that may replace custom functions in this driver, i.e. xgpio_get_value32()
and xgpio_set_value32(). Do replace them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 1ff527ccf6c7..91015ff8a17b 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -71,23 +71,6 @@ struct xgpio_instance {
 	struct clk *clk;
 };
 
-static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
-{
-	const size_t index = BIT_WORD(bit);
-	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
-
-	return (map[index] >> offset) & 0xFFFFFFFFul;
-}
-
-static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
-{
-	const size_t index = BIT_WORD(bit);
-	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
-
-	map[index] &= ~(0xFFFFFFFFul << offset);
-	map[index] |= (unsigned long)v << offset;
-}
-
 static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 {
 	switch (ch) {
@@ -103,15 +86,17 @@ static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 static void xgpio_read_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	unsigned long value = xgpio_readreg(addr);
 
-	xgpio_set_value32(a, bit, xgpio_readreg(addr));
+	bitmap_write(a, value, round_down(bit, 32), 32);
 }
 
 static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	unsigned long value = bitmap_read(a, round_down(bit, 32), 32);
 
-	xgpio_writereg(addr, xgpio_get_value32(a, bit));
+	xgpio_writereg(addr, value);
 }
 
 static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
@@ -386,13 +371,14 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
 	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
+	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__clear_bit(bit, chip->enable);
 
-	if (xgpio_get_value32(chip->enable, bit) == 0) {
+	if (old_enable == 0) {
 		/* Disable per channel interrupt */
 		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
 		temp &= ~mask;
@@ -413,7 +399,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
 	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
-	u32 old_enable = xgpio_get_value32(chip->enable, bit);
+	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
 	u32 mask = BIT(bit / 32), val;
 
 	gpiochip_enable_irq(&chip->gc, irq_offset);
-- 
2.43.0.rc1.1336.g36b5255a03ac


