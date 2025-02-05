Return-Path: <linux-gpio+bounces-15370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25EA2869B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26050188294D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B75D22A809;
	Wed,  5 Feb 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtZ7cEpg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406D22A1CD;
	Wed,  5 Feb 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747929; cv=none; b=pDlI1MGIc59iGHgcIQy+I/uQTGzES8zWG9XPmVsE5o5hJ8rB13TPaRa8e5ytlKwP0x/cGbCKjvM+9WRPZavFJY5xANvr0lUMseXHKntSGMnwFeXE2d3Z+OkI29xLgyX/QLKrOMw3DHPNYzFiESRhhdN8caFvvreZd00ETgBCShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747929; c=relaxed/simple;
	bh=eHxpZj/qg2ID/KeN2wK/bM2xcQGbbf7k3wokyWvv4rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOD1meo+npoAos2g+C6cSqwVv2xADLKLh2JlLnhy90RubBYRxc8B2zEfr4L6Hqnh8n8PqP7kxckcBTnk5BwTAL/o7O3NR4LgEA4C62pxU5hLJcRRTe9ukCJmCtRiPIp+HPH9iRF4RnMLj8FVmN6+vJPJN3bn94VTDIXaiPwPTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtZ7cEpg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747928; x=1770283928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eHxpZj/qg2ID/KeN2wK/bM2xcQGbbf7k3wokyWvv4rw=;
  b=jtZ7cEpgvkAjc8ea+7gWfZDghFv4kIkYtmTNuet+rqPgPk78rOoHx9Vq
   cBtSvXqbNUEtyY4Wr2c0eTrWLmB/AtCgtqELFWo5BQqIDLnPkbI96pBtm
   PbWKjMxXFSlGoLsxKnVJiFFm93Fhkyt4mUibgB5Kxo3FAZGtYVai3J676
   q6Ga4jqqxSZxMqTYjy6qgka4dZSY9P1AQjVdeU0Nf4nETUiWJG29ZRwdh
   YJs8/kNjVQ2+35qsCwnLD3Nu3Z8DMojreNJ03+LTuDmFibj4VV4QOyclm
   TyIU8p1cV51XMZ+SuELU+exOlQxBcoouNy4fW3R7vMXGnYRSZHbmhiQay
   w==;
X-CSE-ConnectionGUID: JBJ3zWUNT72ryUp9vaz5dQ==
X-CSE-MsgGUID: oonX8s3kRnegumoDL7831Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39189574"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39189574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:32:05 -0800
X-CSE-ConnectionGUID: WQidQxV/SLGzESNWYIEYsQ==
X-CSE-MsgGUID: ViPIXb7zQ2uBe47wjStDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115466167"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Feb 2025 01:32:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2F4A73A7; Wed, 05 Feb 2025 11:32:01 +0200 (EET)
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
Subject: [PATCH v2 2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
Date: Wed,  5 Feb 2025 11:31:11 +0200
Message-ID: <20250205093200.373709-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
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
 drivers/gpio/gpio-xilinx.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 1ff527ccf6c7..c58a7e1349b4 100644
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
@@ -385,14 +370,15 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset), enable;
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__clear_bit(bit, chip->enable);
 
-	if (xgpio_get_value32(chip->enable, bit) == 0) {
+	enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
+	if (enable == 0) {
 		/* Disable per channel interrupt */
 		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
 		temp &= ~mask;
@@ -412,17 +398,15 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
-	u32 old_enable = xgpio_get_value32(chip->enable, bit);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset), enable;
 	u32 mask = BIT(bit / 32), val;
 
 	gpiochip_enable_irq(&chip->gc, irq_offset);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	__set_bit(bit, chip->enable);
-
-	if (old_enable == 0) {
+	enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
+	if (enable == 0) {
 		/* Clear any existing per-channel interrupts */
 		val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 		val &= mask;
@@ -437,6 +421,8 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
 	}
 
+	__set_bit(bit, chip->enable);
+
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


