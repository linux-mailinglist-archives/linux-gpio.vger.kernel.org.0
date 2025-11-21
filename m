Return-Path: <linux-gpio+bounces-28943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F02C78CA5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 494CC2DCC4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E643328E8;
	Fri, 21 Nov 2025 11:27:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CAD349B18;
	Fri, 21 Nov 2025 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724458; cv=none; b=FpHEw8xUqKlZvqpxMRgGWo4FevvhlmIVzzhFnnqsahUvSTrM46j4v62T4r12kH4ZDTklQ/+Rm37BK2rbnmvHONeB0BPFN7RnwiivcOiXQ+KYZaqEaUjbOBF+KR5U3V1SKMDIGnybV8Ib/6rw0mw39QaWabR0MsQtCUPJ3n9qBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724458; c=relaxed/simple;
	bh=klJ60W1s9oApIIjE2ZfuIqQ2FZQ+YUrFqVgY9ve4wSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuOQmAFgXs32JEuszMuqsFqath2oRcgK+iozZVgFxl3ILRs17kZoHU9n0jZBd9zrIc80y/CYYiKzaczTMgyNK6lWjAjqc26MleK7xJbkXij8sSJ5rej2aLBKJ1T1CNQoehoeGecWDK2oPJwIjmzkPndTVOm61O+YyZofWcC4/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: lO6yrw93RsetqUfdJpAzKw==
X-CSE-MsgGUID: SvwER24bS2K9BUpP74zAaQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:24 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1D41D437C1A1;
	Fri, 21 Nov 2025 20:27:19 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH 2/8] pinctrl: renesas: rzt2h: allow .get_direction() for IRQ function GPIOs
Date: Fri, 21 Nov 2025 13:26:20 +0200
Message-ID: <20251121112626.1395565-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

Question for reviewers:

Is this the correct approach to handle this situation? I'm open to
suggestions about how to handle this more properly, but I have seen
similar approaches in other drivers where non-GPIO functions return
input direction. To make sure we don't affect other functions, since we
only need this to work for IRQ, I have added a check to make sure we're
in IRQ functions, which actually makes sense to have an input direction,
from a hardware perspective.

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


