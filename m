Return-Path: <linux-gpio+bounces-7684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C73917229
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A081F26A5F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E874D17DE22;
	Tue, 25 Jun 2024 20:03:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E73117DE0C;
	Tue, 25 Jun 2024 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345823; cv=none; b=IsBCAiUuLv62xLizM9vdKvXCfiRKeHCeuBdZGu7f4yA2WOc+pec2BEBA0SsQi2fzWhfktaZ2Y0LZ2cH2egPsA1cVqEgXXfshN/n5kW01NSr14GXHXxYzvjSnsh7txMBHdHTuhjfdCZvaUjZI5y+KHzFoW7YJergJhbnL8vDI2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345823; c=relaxed/simple;
	bh=PQ38n2GtBOmpjYuNoPEp4H7/0vtp0uY17W0lMqGQ1Zw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HUX1MZWL9HjqTFbyBv3p1piYeap2ENlRm9rb7bPq+G90o4jpp7AfQs9aisj4NxPPF1Qrp9QJvY3z92GzOxILkfABns59QztrLKRdLBfpQ5YdZx6P3pwS3BE6elHVWulotmfIyebAnunalS+xdow3SyKbxlJHSTKYqnxo3WgJrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="209263964"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 05:03:40 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C86C6400C4E6;
	Wed, 26 Jun 2024 05:03:36 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions
Date: Tue, 25 Jun 2024 21:03:09 +0100
Message-Id: <20240625200316.4282-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable naming in the various OEN functions has been confusing. We
were passing the _pin & bit variables from rzg2l_pinctrl_pinconf_get()
and rzg2l_pinctrl_pinconf_set() as the offset & pin argument to the
oen_read() and oen_write() functions. This doesn't make sense, the first
of these isn't actually an offset and the second is not needed for
RZ/V2H but leads to confusion with the bit variable used within these
functions.

To tidy this up, instead pass the _pin variable directly to the
oen_read() and oen_write() functions with consistent naming. Then
rzg3s_read_oen() and rzg3s_write_oen() can use macros to get the port
and pin numbers it needs.

Instead of passing the pin capabilities into oen_read() and oen_write(),
we can check that the pin supports OEN before calling these functions.

Also, merge rzg3s_oen_is_supported() into rzg3s_pin_to_oen_bit() to give
a single translation function which returns an error if the pin doesn't
support OEN. While we're here, remove an unnecessary branch and clarify
the variable naming. Lastly, check that we are not dealing with a
dedicated pin before calling RZG2L_PIN_ID_TO_{PORT,PIN}().

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag.
  * Skipped Geert's Reviewed-by tag as I've made a few changes here and
    want another review.
  * Check pin caps before calling oen_{read,write}() so we can drop the
    caps argument to those functions.
  * Simplify arguments to rzg3s_pin_to_oen_bit() and decode
    pin_data/port/pin inside this function.
  * Check for dedicated pin before calling RZG2L_PIN_ID_TO_{PORT,PIN}().
Changes v1->v2:
  * Merged patches 1 & 2 from the previous series, updated to be
    compatible with recent patches adding RZ/V2H support.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 95 +++++++++++--------------
 1 file changed, 42 insertions(+), 53 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a2a395fd34c1..737d8d0064c4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -289,8 +289,8 @@ struct rzg2l_pinctrl_data {
 #endif
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
-	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
-	int (*oen_write)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen);
+	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
+	int (*oen_write)(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen);
 	int (*hw_to_bias_param)(unsigned int val);
 	int (*bias_param_to_hw)(enum pin_config_param param);
 };
@@ -994,53 +994,48 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
-static bool rzg3s_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
-{
-	if (!(caps & PIN_CFG_OEN))
-		return false;
-
-	if (pin > max_pin)
-		return false;
-
-	return true;
-}
-
-static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
-{
-	if (pin)
-		pin *= 2;
-
-	if (offset / RZG2L_PINS_PER_PORT == max_port)
-		pin += 1;
-
-	return pin;
-}
-
-static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
 	u8 max_port = pctrl->data->hwcfg->oen_max_port;
 	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
-	u8 bit;
+	u8 port, pin, bit;
 
-	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
-		return 0;
+	if (*pin_data & RZG2L_SINGLE_PIN)
+		return -EINVAL;
 
-	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
+	port = RZG2L_PIN_ID_TO_PORT(_pin);
+	pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	if (pin > max_pin)
+		return -EINVAL;
+
+	bit = pin * 2;
+	if (port == max_port)
+		bit += 1;
+
+	return bit;
+}
+
+static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	int bit;
+
+	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
+	if (bit < 0)
+		return bit;
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
 
-static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
 {
-	u8 max_port = pctrl->data->hwcfg->oen_max_port;
-	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
 	unsigned long flags;
-	u8 val, bit;
+	int bit;
+	u8 val;
 
-	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
-		return -EINVAL;
-
-	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
+	if (bit < 0)
+		return bit;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + ETH_MODE);
@@ -1119,12 +1114,12 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
 	return -EINVAL;
 }
 
-static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset)
+static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
 						  "XSPI0_RESET0N", "XSPI0_CS0N",
 						  "XSPI0_CKN", "XSPI0_CKP" };
-	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[_pin];
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pin_names); i++) {
@@ -1136,19 +1131,16 @@ static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset)
 	return 0;
 }
 
-static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u8 bit;
 
-	if (!(caps & PIN_CFG_OEN))
-		return 0;
-
-	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
 
 	return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
 }
 
-static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
@@ -1156,10 +1148,7 @@ static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8
 	u8 val, bit;
 	u8 pwpr;
 
-	if (!(caps & PIN_CFG_OEN))
-		return -EINVAL;
-
-	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + PFC_OEN);
 	if (oen)
@@ -1215,9 +1204,9 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		if (!pctrl->data->oen_read)
+		if (!pctrl->data->oen_read || !(cfg & PIN_CFG_OEN))
 			return -EOPNOTSUPP;
-		arg = pctrl->data->oen_read(pctrl, cfg, _pin, bit);
+		arg = pctrl->data->oen_read(pctrl, _pin);
 		if (!arg)
 			return -EINVAL;
 		break;
@@ -1356,9 +1345,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = pinconf_to_config_argument(_configs[i]);
-			if (!pctrl->data->oen_write)
+			if (!pctrl->data->oen_write || !(cfg & PIN_CFG_OEN))
 				return -EOPNOTSUPP;
-			ret = pctrl->data->oen_write(pctrl, cfg, _pin, bit, !!arg);
+			ret = pctrl->data->oen_write(pctrl, _pin, !!arg);
 			if (ret)
 				return ret;
 			break;
-- 
2.39.2


