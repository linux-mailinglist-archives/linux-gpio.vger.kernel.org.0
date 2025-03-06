Return-Path: <linux-gpio+bounces-17210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11991A55B3F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 00:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7C5177A2D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 23:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A10E280410;
	Thu,  6 Mar 2025 23:58:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680B62803F4;
	Thu,  6 Mar 2025 23:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305525; cv=none; b=nPZo3fiqMX/VWl3dq21xZc3YnW5Qbv79aognwFu3i5zGUO7NxSgAWDPwoqvpK02oJ2vzK1i220YIM9G4rOXU249hAkk6/DsZTE+IpQDUp4YdewWiLxBz56djj1xMOrAVurWAJ+J8pc03TG3+pLugheu55EB2voM6xiZhni8eaTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305525; c=relaxed/simple;
	bh=5311CB7PKuTOYh7jvOKlQAbT2S8zbJOs3GqaLPvEQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfFHXZB7JnQexZAEqvIcRR7/fwvX+1b+vzearnD2GdnOBZxAMrYriENZwTe9tX6gCaTMzFlCY4QaArXk23Jq4gpjOC3SI9dWnuN+rHV05eASjRUqIgpBUrvEA2AKVEQKD4ZlmlOoXK/n6e+cB1YUcMSRf2oBeqYYUEpQDIRqECY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D466169E;
	Thu,  6 Mar 2025 15:58:56 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214F73F673;
	Thu,  6 Mar 2025 15:58:42 -0800 (PST)
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
Subject: [PATCH v4 4/8] pinctrl: sunxi: support moved power configuration registers
Date: Thu,  6 Mar 2025 23:58:23 +0000
Message-ID: <20250306235827.4895-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner pincontroller IP features some registers to control the
withstand voltage of each pin group. So far those registers were always
located at the same offset, but the A523 SoC has moved them (probably to
accommodate all eleven pin banks).

Add a flag to note this feature, and use that to program the registers
either at offset 0x340 or 0x380. So far no pincontroller driver uses
this flag, but we need it for the upcoming A523 support.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 83a031ceb29f2..f1c5a991cf7b5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -736,9 +736,11 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_CTL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset +
+			    PIO_POW_MOD_CTL_OFS);
 		reg &= ~BIT(bank);
-		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
+		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset +
+		       PIO_POW_MOD_CTL_OFS);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 		fallthrough;
@@ -746,9 +748,10 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV <= 1800000 ? 1 : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_SEL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
 		reg &= ~(1 << bank);
-		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
+		writel(reg | val << bank,
+		       pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
 	default:
@@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		pctl->pull_regs_offset = PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = DLEVEL_FIELD_WIDTH;
 	}
+	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
+		pctl->pow_mod_sel_offset = PIO_11B_POW_MOD_SEL_REG;
+	else
+		pctl->pow_mod_sel_offset = PIO_POW_MOD_SEL_REG;
 
 	pctl->irq_array = devm_kcalloc(&pdev->dev,
 				       IRQ_PER_BANK * pctl->desc->irq_banks,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 6cf721876d89d..742fc795c7664 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -87,9 +87,11 @@
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
+#define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 
-#define PIO_POW_MOD_SEL_REG	0x340
-#define PIO_POW_MOD_CTL_REG	0x344
+#define PIO_POW_MOD_SEL_REG		0x340
+#define PIO_11B_POW_MOD_SEL_REG		0x380
+#define PIO_POW_MOD_CTL_OFS		0x004
 
 #define PIO_BANK_K_OFFSET		0x500
 
@@ -173,6 +175,7 @@ struct sunxi_pinctrl {
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
+	u32				pow_mod_sel_offset;
 };
 
 #define SUNXI_PIN(_pin, ...)					\
-- 
2.46.3


