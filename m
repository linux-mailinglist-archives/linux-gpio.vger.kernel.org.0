Return-Path: <linux-gpio+bounces-3032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9684B6EA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB771C2365A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28017131753;
	Tue,  6 Feb 2024 13:51:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46E13174B;
	Tue,  6 Feb 2024 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707227488; cv=none; b=l8Cb1HUySsXJJc25ONl1uNEeT47Z3xcP/jEszlg35ZHme01l/XBqvIlP0Ayh9u7MlavjGxCHxUVSSshZzwomvDFZCbzuN4AkD5E8lZEoDXE+ACPf1O475kprfoU+5mXyAmbqbl74hUiBuSEGWYrPlQ0XLZErjBRHztffpKh0Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707227488; c=relaxed/simple;
	bh=NTA2GE785l4dOh9g0skx7+mkZhJ9b2i9m+JQM7MMkf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n6Mej05Y9Lvts66iuRN8MiH2zuYLCvUojpE5BwcZLZY7BYZPlYj3MMJZHsii2QIpB+R/kZnQlBaU9J7qUIMo6tjQSphoSlRGQo8t6BMXFv3q4u+7c5ektCzqZylRQIf3TkNxRDCFExnxeCFauW0Sw/NRUtDyzAYH229827/PhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,247,1701097200"; 
   d="scan'208";a="196969540"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Feb 2024 22:51:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.237])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E14D8420FAA2;
	Tue,  6 Feb 2024 22:51:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Configure interrupt input mode
Date: Tue,  6 Feb 2024 13:51:13 +0000
Message-Id: <20240206135115.151218-2-biju.das.jz@bp.renesas.com>
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

Configure GPIO interrupt as input mode. Also if the bootloader sets
gpio interrupt pin as function, override it as gpio.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced u32->u64 for pin_data
 * Added rzg2l_gpio_free() for error path for bitmap_find_free_region().
 * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 37 +++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 818dccdd70da..03725a3c6703 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1894,6 +1894,26 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
+	u64 *pin_data = pin_desc->drv_data;
+	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
+	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
+	u8 reg8;
+	int ret;
+
+	reg8 = readb(pctrl->base + PMC(off));
+	if (reg8 & BIT(bit)) {
+		ret = rzg2l_gpio_request(chip, offset);
+		if (ret)
+			return ret;
+	}
+
+	return rzg2l_gpio_direction_input(chip, offset);
+}
+
 static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					    unsigned int child,
 					    unsigned int child_type,
@@ -1903,16 +1923,24 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 	int gpioint, irq;
+	int ret;
 
 	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
+	ret = rzg2l_gpio_interrupt_input_mode(gc, child);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 	irq = bitmap_find_free_region(pctrl->tint_slot, RZG2L_TINT_MAX_INTERRUPT, get_order(1));
 	spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-	if (irq < 0)
-		return -ENOSPC;
+	if (irq < 0) {
+		ret = -ENOSPC;
+		goto err;
+	}
+
 	pctrl->hwirq[irq] = child;
 	irq += RZG2L_TINT_IRQ_START_INDEX;
 
@@ -1920,6 +1948,10 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	*parent_type = IRQ_TYPE_LEVEL_HIGH;
 	*parent = RZG2L_PACK_HWIRQ(gpioint, irq);
 	return 0;
+
+err:
+	rzg2l_gpio_free(gc, child);
+	return ret;
 }
 
 static int rzg2l_gpio_populate_parent_fwspec(struct gpio_chip *chip,
@@ -1952,6 +1984,7 @@ static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 
 		for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
 			if (pctrl->hwirq[i] == hwirq) {
+				rzg2l_gpio_free(gc, hwirq);
 				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 				bitmap_release_region(pctrl->tint_slot, i, get_order(1));
 				spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-- 
2.25.1


