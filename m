Return-Path: <linux-gpio+bounces-7353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7219903A3F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504AA281097
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A34517C9F5;
	Tue, 11 Jun 2024 11:33:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC71617C7DB;
	Tue, 11 Jun 2024 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105581; cv=none; b=tYnMQV4IyGMguuwLRjQW6zCzWwDcWP3eHDiwFhnHpeRiZMy3ZLgZ4QsAbY1RLIpKAsXgX7jkakUmykP9/u0HwgLLN7lzjT0og7MLSJLEG68Vg02wUaDPWjyQBb7um4z7CQ6GLRYGrakr+6UnmJAiAcLSRJxI1g6hzL4zXFHZL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105581; c=relaxed/simple;
	bh=evBDAJSKCEtjfj0SrHps7BnWFCYo9u1IGqSZA5sCbmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IlmeYDK7YzcRfBjcfDnQR/wgRbr2aZym9OBBHg//lFxWKLLGWv9og+sSX1iVrrfi1qMt0g9WPTK/9DAS2bwAIZKkPRQEcM4DsSFauMls44QW3xaQ8wda4FBpIeleKdcb8b/xCN0zy9t5+e40zfdEwPCHIa4AuulOC4f5nlkctq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="207491408"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 20:32:58 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A1924007201;
	Tue, 11 Jun 2024 20:32:54 +0900 (JST)
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
Subject: [PATCH v2 2/9] pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions
Date: Tue, 11 Jun 2024 12:31:56 +0100
Message-Id: <20240611113204.3004-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
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
read_oen() and write_oen() functions. This doesn't make sense, the first
of these isn't actually an offset and the second is not needed for
RZ/V2H but leads to confusion with the bit variable used within these
functions.

To tidy this up, instead pass the _pin variable directly to the
read_oen() and write_oen() functions with consistent naming. Then
rzg3s_read_oen() and rzg3s_write_oen() can use macros to get the port
and pin numbers it needs.

Also, merge rzg3s_oen_is_supported() into rzg3s_pin_to_oen_bit() to give
a single translation function which returns an error if the pin doesn't
support OEN. While we're here, remove an unnecessary branch and clarify
the variable naming.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Changes v1->v2:
  * Merged patches 1 & 2 from the previous series, updated to be
    compatible with recent patches adding RZ/V2H support.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 74 +++++++++++--------------
 1 file changed, 32 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 901175f6d05c..b28be5be668d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -289,8 +289,8 @@ struct rzg2l_pinctrl_data {
 #endif
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
-	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
-	int (*oen_write)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen);
+	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin);
+	int (*oen_write)(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin, u8 oen);
 	int (*hw_to_bias_param)(unsigned int val);
 	int (*bias_param_to_hw)(enum pin_config_param param);
 };
@@ -994,53 +994,43 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
-static bool rzg3s_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
+static int rzg3s_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 caps, u32 port, u8 pin)
 {
-	if (!(caps & PIN_CFG_OEN))
-		return false;
+	u8 bit = pin * 2;
 
-	if (pin > max_pin)
-		return false;
+	if (!(caps & PIN_CFG_OEN) || pin > hwcfg->oen_max_pin)
+		return -EINVAL;
 
-	return true;
+	if (port == hwcfg->oen_max_port)
+		bit += 1;
+
+	return bit;
 }
 
-static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
+static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin)
 {
-	if (pin)
-		pin *= 2;
+	u32 port = RZG2L_PIN_ID_TO_PORT(_pin);
+	u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	int bit;
 
-	if (offset / RZG2L_PINS_PER_PORT == max_port)
-		pin += 1;
-
-	return pin;
-}
-
-static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
-{
-	u8 max_port = pctrl->data->hwcfg->oen_max_port;
-	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
-	u8 bit;
-
-	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
+	bit = rzg3s_pin_to_oen_bit(pctrl->data->hwcfg, caps, port, pin);
+	if (bit < 0)
 		return 0;
 
-	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
-
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
 
-static int rzg3s_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzg3s_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin, u8 oen)
 {
-	u8 max_port = pctrl->data->hwcfg->oen_max_port;
-	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
+	u32 port = RZG2L_PIN_ID_TO_PORT(_pin);
+	u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
 	unsigned long flags;
-	u8 val, bit;
+	int bit;
+	u8 val;
 
-	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
-		return -EINVAL;
-
-	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg3s_pin_to_oen_bit(pctrl->data->hwcfg, caps, port, pin);
+	if (bit < 0)
+		return bit;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + ETH_MODE);
@@ -1119,12 +1109,12 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
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
@@ -1136,19 +1126,19 @@ static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset)
 	return 0;
 }
 
-static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin)
 {
 	u8 bit;
 
 	if (!(caps & PIN_CFG_OEN))
 		return 0;
 
-	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
 
 	return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
 }
 
-static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, unsigned int _pin, u8 oen)
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
@@ -1159,7 +1149,7 @@ static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8
 	if (!(caps & PIN_CFG_OEN))
 		return -EINVAL;
 
-	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+	bit = rzv2h_pin_to_oen_bit(pctrl, _pin);
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + PFC_OEN);
 	if (oen)
@@ -1217,7 +1207,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		if (!pctrl->data->oen_read)
 			return -EOPNOTSUPP;
-		arg = pctrl->data->oen_read(pctrl, cfg, _pin, bit);
+		arg = pctrl->data->oen_read(pctrl, cfg, _pin);
 		if (!arg)
 			return -EINVAL;
 		break;
@@ -1358,7 +1348,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			arg = pinconf_to_config_argument(_configs[i]);
 			if (!pctrl->data->oen_write)
 				return -EOPNOTSUPP;
-			ret = pctrl->data->oen_write(pctrl, cfg, _pin, bit, !!arg);
+			ret = pctrl->data->oen_write(pctrl, cfg, _pin, !!arg);
 			if (ret)
 				return ret;
 			break;
-- 
2.39.2


