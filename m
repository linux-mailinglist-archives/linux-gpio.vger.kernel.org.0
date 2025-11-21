Return-Path: <linux-gpio+bounces-28942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CDC78CD8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2349D4EF111
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598B734B185;
	Fri, 21 Nov 2025 11:27:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BEC33D6E2;
	Fri, 21 Nov 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724448; cv=none; b=uLzPa1XlEgamb//qYWt+EfSc1ChPy8BZoK+H4AsowtLt//T0yoJnUJ6QTNqERuMF79ZQsW49laIv2J852+32lHjxIv7Kq0tc1Fbh0JGKpCVkJA3Z+CF7UZ7/sM+IOy865vLdQznpUcD25oCXXJkcw8qekSoyOphA8NQFGFeCjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724448; c=relaxed/simple;
	bh=mRmz3mMydgJHlIfRmyW5ZP16zIb1SsOWfgCcOB7MVac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFAAKB6UBmyqISpWYV0OkIcx/ivCv4F40qoXqzPJRCsRhIrQJTZTGnNs6uFcXUFr3Tv40jpcWx0qKBhIqxQFALGEoTXYf3odA9kDYSuvSPV3WqD0bfPT0jjFzvUv3BbuG3lHdM6AC3ebDmAQtusO8S38KXhJgbstqH13UD0msjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: TR8Fe3V1RbC375+vU0VE1Q==
X-CSE-MsgGUID: nWCMfZBAR8irMfw2G6NJDw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:18 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F33C437C1A2;
	Fri, 21 Nov 2025 20:27:14 +0900 (JST)
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
Subject: [PATCH 1/8] pinctrl: renesas: rzt2h: move GPIO enable/disable into separate function
Date: Fri, 21 Nov 2025 13:26:19 +0200
Message-ID: <20251121112626.1395565-2-cosmin-gabriel.tanislav.xa@renesas.com>
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

GPIO is enabled or disabled in multiple places, simplify code by moving
this logic into a separate function.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
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


