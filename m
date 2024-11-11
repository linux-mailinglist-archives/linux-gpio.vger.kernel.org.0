Return-Path: <linux-gpio+bounces-12795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 360369C35B5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 01:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F511C20340
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 00:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454F45BEC;
	Mon, 11 Nov 2024 00:58:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356481F931;
	Mon, 11 Nov 2024 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731286684; cv=none; b=ENMaxgf9GHpmqeBWn0wCJy9PZsEprOkGJi/WO6ATORY7tvcfGGhoIHZEAIyM3qAeoz0ovU9jt8A7KNYC30lffoW/hm89Ue0Okr4OozU90pGqpMsskHysEyp1hx2WHaUAwbTnuFLKwmoaSqpfPFLEyHF5z4gqOF9RZz8ztXzBm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731286684; c=relaxed/simple;
	bh=UPrUuyKIXil+KtrezhMvWwKZXfHP+HPqTxW+O3vFRLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlaTxxb7hdd5c6E8Kbyh3yPWTBlZhqlGdE0PmYP7kNpj9Hf36NmBeZ0yTetJulmJS+kXKUKsdRez7mNt8dq0hlY0j7arLM154s1iqRvs/5SPnkSLpJyWeGZnjblqBwoBIBOxx+6jRWJUSyRvZyOi/jUPWdzTIMzcitybNBuMu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C032C1CDD;
	Sun, 10 Nov 2024 16:58:32 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D3E3F66E;
	Sun, 10 Nov 2024 16:58:01 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] pinctrl: sunxi: move bank K register offset
Date: Mon, 11 Nov 2024 00:57:45 +0000
Message-ID: <20241111005750.13071-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111005750.13071-1-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner pincontroller register layout used to allow for at least
11 banks per controller, any more banks would reside at a second
controller instance.
When the per-bank register map size was increased with the D1, it turned
out that the last bank (port K) of those maximum 11 banks actually would
not fit anymore in the 512 bytes reserved for the pincontroller registers.
On new SoCs Allwinner thus moved the last bank beyond the existing
registers, at offset 0x500.

So far SoCs never used more than 9 banks per controller, but the new
Allwinner A523 actually uses all 11 banks. Since that SoC also uses the
extended layout, its PortK needs to be programmed at offset 0x500.

Factor out the bank offset calculation into a new function, and handle
the case for the last bank separately. Since none of the older SoCs ever
used PortK, we can ignore this case, and just always use offset 0x500
for the last bank.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 ++++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index ae281a3c2ed34..83a031ceb29f2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -58,13 +58,29 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip;
  * The following functions calculate the register and the bit offset to access.
  * They take a pin number which is relative to the start of the current device.
  */
+
+/*
+ * When using the extended register layout, Bank K does not fit into the
+ * space used for the other banks. Instead it lives at offset 0x500.
+ */
+static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
+{
+	u32 offset = 0;
+
+	if (pin >= PK_BASE) {
+		pin -= PK_BASE;
+		offset = PIO_BANK_K_OFFSET;
+	}
+
+	return offset + (pin / PINS_PER_BANK) * pctl->bank_mem_size;
+}
+
 static void sunxi_mux_reg(const struct sunxi_pinctrl *pctl,
 			  u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * MUX_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + MUX_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + MUX_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(MUX_FIELD_WIDTH) - 1) << *shift;
@@ -73,10 +89,9 @@ static void sunxi_mux_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
 			   u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * DATA_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + DATA_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + DATA_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(DATA_FIELD_WIDTH) - 1) << *shift;
@@ -85,10 +100,9 @@ static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 			     u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * pctl->dlevel_field_width;
 
-	*reg   = bank * pctl->bank_mem_size + DLEVEL_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + DLEVEL_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(pctl->dlevel_field_width) - 1) << *shift;
@@ -97,10 +111,9 @@ static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_pull_reg(const struct sunxi_pinctrl *pctl,
 			   u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * PULL_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + pctl->pull_regs_offset +
+	*reg   = sunxi_bank_offset(pctl, pin) + pctl->pull_regs_offset +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(PULL_FIELD_WIDTH) - 1) << *shift;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8e2eca45b57f8..37a64624142b6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -25,6 +25,8 @@
 #define PG_BASE	192
 #define PH_BASE	224
 #define PI_BASE	256
+#define PJ_BASE	288
+#define PK_BASE	320
 #define PL_BASE	352
 #define PM_BASE	384
 #define PN_BASE	416
@@ -89,6 +91,8 @@
 #define PIO_POW_MOD_SEL_REG	0x340
 #define PIO_POW_MOD_CTL_REG	0x344
 
+#define PIO_BANK_K_OFFSET		0x500
+
 enum sunxi_desc_bias_voltage {
 	BIAS_VOLTAGE_NONE,
 	/*
-- 
2.46.2


