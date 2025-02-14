Return-Path: <linux-gpio+bounces-15978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40286A35315
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 01:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0F003ABC82
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3032A86359;
	Fri, 14 Feb 2025 00:40:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710D177F11;
	Fri, 14 Feb 2025 00:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493609; cv=none; b=p7SvMMDg5I0sAmYcyGzHuNjN0RTwpnvjtzo9XpiXX25XYkOAOS1ZplcDihwWBs1lrGIppqWtaFHININp1grC0ZgSt6s1tk5KkiDXT0u7Kqrf+tHRk/bjfE7V1jAwbWjYymZc/ZDsosiUeNJecFzxkdDR9gRlAyQIVohU8AAia2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493609; c=relaxed/simple;
	bh=G8oxcqO+dc9UTnFKaCm94HcHeWF2Pu0JSvz8JhDF3Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSwi+g9TIta5mhhvG88k3z/bITm/oGG7k1QWfVB2c5tyR+jABibqUWoQBdYFCwyeKyAL6HIq+xM3Rdkm6m0Ah14hJ+dL+cJidSwK2J6nCwULmepGTqGr5sI0iCbISQ+ZBekIwNHzQn8mJBOwQAC6C6AVGTuIPiDzm6aB/eHSROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5901A1682;
	Thu, 13 Feb 2025 16:40:27 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340443F5A1;
	Thu, 13 Feb 2025 16:40:05 -0800 (PST)
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
Subject: [PATCH v2 4/8] pinctrl: sunxi: support moved power configuration registers
Date: Fri, 14 Feb 2025 00:37:30 +0000
Message-ID: <20250214003734.14944-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214003734.14944-1-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
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
index 83a031ceb29f2..a1057122272bd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_CTL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
 		reg &= ~BIT(bank);
-		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
+		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 		fallthrough;
@@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		val = uV <= 1800000 ? 1 : 0;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
-		reg = readl(pctl->membase + PIO_POW_MOD_SEL_REG);
+		reg = readl(pctl->membase + pctl->pow_mod_sel_offset +
+			    PIO_POW_MOD_SEL_OFS);
 		reg &= ~(1 << bank);
-		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
+		writel(reg | val << bank,
+		       pctl->membase + pctl->pow_mod_sel_offset +
+		       PIO_POW_MOD_SEL_OFS);
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
index 6cf721876d89d..a93385e456a57 100644
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
+#define PIO_POW_MOD_SEL_OFS		0x004
 
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


