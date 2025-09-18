Return-Path: <linux-gpio+bounces-24690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F348DB2E99F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2E427B8BBA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2445A1F418D;
	Thu, 21 Aug 2025 00:45:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844731F3B8A;
	Thu, 21 Aug 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737154; cv=none; b=GNuLeib4jiKCN3wCk+WZR3ckqOCGpTiSLVoC3YDUc77maTkFWPx7pc3xdqdFYIQFyObBwgqWF7gxBPypjKUg7D3axxBDDhIHAGMN2CE+2ToSHTlFwvQaURG22Kv1XqSSwbKcTYg4iQDP2vwZsFWfgLj3fR0VeUBbJMbU1QlXR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737154; c=relaxed/simple;
	bh=jozEb0f0lNOe2D0qrYOZ98c5Ny8E0O7w6CaUZ0yB2dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBsd053fss149RtzPhxbrUQKPmTDDcTNkxF1W3KMX0xdiBA1/bEh9Fnf6yIZFoSav0Zs/xoFjM8jQuSls8Oap3xgoZlXQDUWJKzkZ1nyA1sZTORdoxmb5M7dRAndmYiE7E9/DXnrXWCNF5ItvMaoaKgASrjhw7YiU2Oy4UNP5WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43E31F37;
	Wed, 20 Aug 2025 17:45:43 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D1543F63F;
	Wed, 20 Aug 2025 17:45:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 5/9] pinctrl: sunxi: support A733 generation MMIO register layout
Date: Thu, 21 Aug 2025 01:42:28 +0100
Message-ID: <20250821004232.8134-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After Allwinner changed the layout of the pinctrl/GPIO IP MMIO register
frame only a few years back, the new SoC generation (starting with the
A733) changes the layout again: each port now uses 128 instead of 36 or 48
bytes, and the drive level registers move to make space for the new
set/clear data registers. Also the PortA registers start at offset 0x80
instead of 0x0 as before, to make room for non-bank specific registers,
like the pow_mod_sel registers, at the beginning of the MMIO frame. Finally
the IRQ registers move into each bank's region.

Add yet another quirk bit to mark this case, and set the existing register
offset values to match the new layout. This also requires to add new
members to struct sunxi_pinctrl, to accommodate the extra changes. The
actual runtime code changes are fortunately minor.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 14 ++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 14 ++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 540fa6c285cfc..ff7c5439a458e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -65,7 +65,7 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip;
  */
 static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
-	u32 offset = 0;
+	u32 offset = pctl->bank_offset;
 
 	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
@@ -102,7 +102,7 @@ static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 {
 	u32 offset = pin % PINS_PER_BANK * pctl->dlevel_field_width;
 
-	*reg   = sunxi_bank_offset(pctl, pin) + DLEVEL_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + pctl->drv_regs_offset +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(pctl->dlevel_field_width) - 1) << *shift;
@@ -1526,15 +1526,25 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
+	} else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT) {
+		pctl->bank_mem_size = A733_BANK_MEM_SIZE;
+		pctl->bank_offset = A733_BANK_OFFSET;
+		pctl->drv_regs_offset = A733_DLEVEL_REGS_OFFSET;
+		pctl->pull_regs_offset = A733_PULL_REGS_OFFSET;
+		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
 	} else {
 		pctl->bank_mem_size = BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = DLEVEL_FIELD_WIDTH;
 	}
 	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
 		pctl->pow_mod_sel_offset = PIO_11B_POW_MOD_SEL_REG;
+	else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		pctl->pow_mod_sel_offset = PIO_NCAT3_POW_MOD_SEL_REG;
 	else
 		pctl->pow_mod_sel_offset = PIO_POW_MOD_SEL_REG;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 252cf58387e33..2b9e93972a5d3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -53,6 +53,12 @@
 #define D1_DLEVEL_FIELD_WIDTH	4
 #define D1_PULL_REGS_OFFSET	0x24
 
+#define A733_BANK_MEM_SIZE	0x80
+#define A733_BANK_OFFSET	0x80
+#define A733_DLEVEL_REGS_OFFSET	0x20
+#define A733_PULL_REGS_OFFSET	0x30
+#define A733_IRQ_REGS_OFFSET	0x40
+
 #define PINS_PER_BANK		32
 
 #define IRQ_PER_BANK		32
@@ -92,7 +98,9 @@
 #define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
+#define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
 
+#define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
 #define PIO_11B_POW_MOD_SEL_REG		0x380
 #define PIO_POW_MOD_CTL_OFS		0x004
@@ -177,6 +185,8 @@ struct sunxi_pinctrl {
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;
+	u32				bank_offset;
+	u32				drv_regs_offset;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
 	u32				pow_mod_sel_offset;
@@ -236,6 +246,10 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		       A733_IRQ_REGS_OFFSET;
+
 	return IRQ_REGS_OFFSET +
 	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
 }
-- 
2.46.3


