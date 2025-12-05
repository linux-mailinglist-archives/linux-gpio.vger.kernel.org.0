Return-Path: <linux-gpio+bounces-29288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25661CA8667
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D909830296D5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 16:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B6B33E345;
	Fri,  5 Dec 2025 15:03:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595422DAFB5;
	Fri,  5 Dec 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947018; cv=none; b=fkD/BMjScoMFYA+6pxXAun3x6Ip1ZU37MwLHYJ5B3XwyH8oY8bwD9Hv1uUBpggti7bQPvo9JkMwCno5laxYy/h9Y8qV+amABTK0GRFDuKh6L7pM71QzhrxyHZvXurJI3OgDPirS6pUrXw7d+zokR4MnMbDipb5bxE9IzCc2D9sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947018; c=relaxed/simple;
	bh=EBpnXAVaSaqytYfPPWXECpG67N1Y1OCQkWaK/o3gftE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjkF1nmiBiW5WKJvepPV67lRR7ZiqgRaA5a4O0qBcGhGpigbYgr/7Hod8riJWxtIc125qejsJhrJeSCqEZYDVdZ3R1dRYoJ/+UqcHyVbqhASYSH8LDZlRSXPBf4BW41kMc+TAzaM9qXo2wAns5macgzsc+6kEq533vYzZCCyLA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: YhkQBUooQS2L7oAlJpTxoQ==
X-CSE-MsgGUID: 8ubxXUDVS7+q1qf8g0xx9Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2025 00:03:30 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5265F427BFED;
	Sat,  6 Dec 2025 00:03:27 +0900 (JST)
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
Subject: [PATCH v2 1/8] pinctrl: renesas: rzt2h: move GPIO enable/disable into separate function
Date: Fri,  5 Dec 2025 17:02:27 +0200
Message-ID: <20251205150234.2958140-2-cosmin-gabriel.tanislav.xa@renesas.com>
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

GPIO is enabled or disabled in multiple places, simplify code by moving
this logic into a separate function.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4826ff91cd90..c8ca5e13bba7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -119,6 +119,19 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
+				      u8 port, u8 pin, bool en)
+{
+	u8 reg = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
+
+	if (en)
+		reg &= ~BIT(pin);
+	else
+		reg |= BIT(pin);
+
+	rzt2h_pinctrl_writeb(pctrl, port, reg, PMC(port));
+}
+
 static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 				       u8 port, u8 pin, u8 func)
 {
@@ -133,8 +146,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	rzt2h_pinctrl_writew(pctrl, port, reg16, PM(port));
 
 	/* Temporarily switch to GPIO mode with PMC register */
-	reg16 = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
-	rzt2h_pinctrl_writeb(pctrl, port, reg16 & ~BIT(pin), PMC(port));
+	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
 
 	/* Select Pin function mode with PFC register */
 	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
@@ -142,8 +154,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	rzt2h_pinctrl_writeq(pctrl, port, reg64 | ((u64)func << (pin * 8)), PFC(port));
 
 	/* Switch to Peripheral pin function with PMC register */
-	reg16 = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
-	rzt2h_pinctrl_writeb(pctrl, port, reg16 | BIT(pin), PMC(port));
+	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, false);
 }
 
 static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
@@ -447,7 +458,6 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	int ret;
-	u8 reg;
 
 	ret = rzt2h_validate_pin(pctrl, offset);
 	if (ret)
@@ -460,9 +470,7 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	guard(spinlock_irqsave)(&pctrl->lock);
 
 	/* Select GPIO mode in PMC Register */
-	reg = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
-	reg &= ~BIT(bit);
-	rzt2h_pinctrl_writeb(pctrl, port, reg, PMC(port));
+	rzt2h_pinctrl_set_gpio_en(pctrl, port, bit, true);
 
 	return 0;
 }
-- 
2.52.0

