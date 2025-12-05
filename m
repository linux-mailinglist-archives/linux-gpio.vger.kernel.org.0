Return-Path: <linux-gpio+bounces-29289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D1CA846E
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 16:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4459F348270A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 15:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94221662E7;
	Fri,  5 Dec 2025 15:03:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2A533D6F5;
	Fri,  5 Dec 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947022; cv=none; b=mblI8z0E4xpJFatML8p1hCOhAEVrm2I1xxo3BA4jN3JFI9KhyUaog+M2wxeAYu5ThHFuKL5Vmx/mAMgrNe1qTYwgEHdeVoNU0GmoDkL+lZ2zrlwxfMK8Biw7yO+DgaYFkp6aqi+7KlJT/KUbVy3SSLke5vlI8/Uk/cTT0DijKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947022; c=relaxed/simple;
	bh=aauuxomXKeTzaNszVdOioVPuKyxz6ErnHfbNxpbBi9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o31G1yjU1My6ltRQAv54izwBcgUfphLnYSegZygHUmzkV/bocKQIdzLzHBB2wESPltBz0MyvV0WWnk6gKh80sbMN91ae5zM6fU35BwOH4vsbs/9BV2dMe7HOklUEjsx0b/NLfnrYHuYS15WgkDmWddVuqRLnRgfJjZshfvt05Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: EBZM3WQJRkKjX3ILl5Ku4A==
X-CSE-MsgGUID: 5R/zX7rFQtmTfpoc5WPqAQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2025 00:03:35 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26EF3427BFED;
	Sat,  6 Dec 2025 00:03:31 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 2/8] pinctrl: renesas: rzt2h: allow .get_direction() for IRQ function GPIOs
Date: Fri,  5 Dec 2025 17:02:28 +0200
Message-ID: <20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting up an IRQ would normally be done in the .activate() and
.deactivate() ops of the IRQ domain, but for hierarchical IRQ domains
the .activate() and .deactivate() ops are overridden in the
gpiochip_hierarchy_setup_domain_ops() function.

As such, activating and deactivating need to be done in the .translate()
and .free() ops of the IRQ domain.

For RZ/T2H and RZ/N2H, interrupts go through the pin controller, into
the ICU, which level-translates them and forwards them to the GIC.

To use a GPIO as an interrupt it needs to be put into peripheral
function mode 0, which will connect it to the IRQ lines of the ICU.

The IRQ chip .child_to_parent_hwirq() callback is called as part of the
IRQ fwspec parsing logic (as part of irq_create_of_mapping()) which
happens before the IRQ is requested (as part of gpiochip_lock_as_irq()).

gpiochip_lock_as_irq() calls gpiod_get_direction() if the
.get_direction() callback is provided to ensure that the GPIO line is
set up as input.

In our case, IRQ function is separate from GPIO, and both cannot be true
at the same time.

Return GPIO_LINE_DIRECTION_IN even if pin is in IRQ function to allow
this setup to work.

Hold the spinlock to ensure atomicity between reading the PMC register
(which determines whether the pin is in GPIO mode or not) and reading
the function of the pin when it is not in GPIO mode.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index c8ca5e13bba7..722551723e06 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -51,6 +51,7 @@
 
 #define PFC_MASK		GENMASK_ULL(5, 0)
 #define PFC_PIN_MASK(pin)	(PFC_MASK << ((pin) * 8))
+#define PFC_FUNC_INTERRUPT	0
 
 /*
  * Use 16 lower bits [15:0] for pin identifier
@@ -494,6 +495,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
+	u64 reg64;
 	u16 reg;
 	int ret;
 
@@ -501,8 +503,25 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit))
+	guard(spinlock_irqsave)(&pctrl->lock);
+
+	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
+		/*
+		 * When a GPIO is being requested as an IRQ, the pinctrl
+		 * framework expects to be able to read the GPIO's direction.
+		 * IRQ function is separate from GPIO, and enabling it takes the
+		 * pin out of GPIO mode.
+		 * At this point, .child_to_parent_hwirq() has already been
+		 * called to enable the IRQ function.
+		 * Default to input direction for IRQ function.
+		 */
+		reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+		reg64 = (reg64 >> (bit * 8)) & PFC_MASK;
+		if (reg64 == PFC_FUNC_INTERRUPT)
+			return GPIO_LINE_DIRECTION_IN;
+
 		return -EINVAL;
+	}
 
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg = (reg >> (bit * 2)) & PM_MASK;
-- 
2.52.0

