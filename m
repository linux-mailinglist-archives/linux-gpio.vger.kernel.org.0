Return-Path: <linux-gpio+bounces-3033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992984B6EC
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C1A1F24516
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617B413175D;
	Tue,  6 Feb 2024 13:51:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53B3131749;
	Tue,  6 Feb 2024 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707227490; cv=none; b=f5AaebpGTTr7qKorrt7Bg7vMlYfhZvGHRil8e1wjsyg+1bINA4yw4zYmuzZ+xe7JqNPmcuST9aE0HgpAxweSGsaX9FhL+ir8peV0oQo/g+nnRv3tMont4uiktOhFfrZ0r6GQ3CjqDz0W6uvtKtKf0R8QqyfkZSKK5qleHYKfl0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707227490; c=relaxed/simple;
	bh=gtLKIzacJzTv3Cp16d7ixtHYPrM7F/YW/CHd5zJCBIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=de1mCZs4wvuITlS3aFztqCtAkDU4e+V4MXFBXmp0rqWh1M3zyrggZgaho2is6eDsaL2HIPOPXyZZ8Q1OBxibGDvIcDaMNso52DKmPEYmFSOJWZWWewCAaKcIxni/9x0FgzejS6TIwb5fuWljcB19tkN6CQAlBMEaK92o1LKRQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,247,1701097200"; 
   d="scan'208";a="193057618"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2024 22:51:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.237])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C48C7420FAA2;
	Tue,  6 Feb 2024 22:51:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
Date: Tue,  6 Feb 2024 13:51:14 +0000
Message-Id: <20240206135115.151218-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzg2l_gpio_irq_{en,dis}able by adding a helper function
rzg2l_gpio_irq_endisable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 40 ++++++++++---------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 03725a3c6703..d400dcb048fc 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1809,11 +1809,9 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl
 	return gpioint;
 }
 
-static void rzg2l_gpio_irq_disable(struct irq_data *d)
+static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
+				     unsigned int hwirq, bool enable)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
-	unsigned int hwirq = irqd_to_hwirq(d);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
 	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
@@ -1821,8 +1819,6 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
 	unsigned long flags;
 	void __iomem *addr;
 
-	irq_chip_disable_parent(d);
-
 	addr = pctrl->base + ISEL(off);
 	if (bit >= 4) {
 		bit -= 4;
@@ -1830,9 +1826,21 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
 	}
 
 	spin_lock_irqsave(&pctrl->lock, flags);
-	writel(readl(addr) & ~BIT(bit * 8), addr);
+	if (enable)
+		writel(readl(addr) | BIT(bit * 8), addr);
+	else
+		writel(readl(addr) & ~BIT(bit * 8), addr);
 	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
 
+static void rzg2l_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	irq_chip_disable_parent(d);
+	rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
 	gpiochip_disable_irq(gc, hwirq);
 }
 
@@ -1841,25 +1849,9 @@ static void rzg2l_gpio_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
-	u64 *pin_data = pin_desc->drv_data;
-	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
-	u8 bit = RZG2L_PIN_ID_TO_PIN(hwirq);
-	unsigned long flags;
-	void __iomem *addr;
 
 	gpiochip_enable_irq(gc, hwirq);
-
-	addr = pctrl->base + ISEL(off);
-	if (bit >= 4) {
-		bit -= 4;
-		addr += 4;
-	}
-
-	spin_lock_irqsave(&pctrl->lock, flags);
-	writel(readl(addr) | BIT(bit * 8), addr);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
-
+	rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
 	irq_chip_enable_parent(d);
 }
 
-- 
2.25.1


