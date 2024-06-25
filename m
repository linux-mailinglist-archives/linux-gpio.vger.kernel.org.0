Return-Path: <linux-gpio+bounces-7685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7D91722D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AB2B1F26CC5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56CE17D88E;
	Tue, 25 Jun 2024 20:03:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C71117D37B;
	Tue, 25 Jun 2024 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345829; cv=none; b=DlgrYx3X8gfD/jVP9Oo6Xf+xrQSwZJ/F627sczk1X4ThRIN/SjVNlHNZilMdGwe7M1JPbvugvuguTUkyUEtt/jBqcZ3N13v45gj5EQHWIaOIBkDWrV46SED010DvuiGbx/j6g/Zul6xZ9hzDZc2y+zN8Wgzq1sJImjYRo5GbdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345829; c=relaxed/simple;
	bh=2qcuXwTcNTNWG4Ocum2vc+5BhuHX0y7V7er6hSHKHf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lq2++ZUYifBtG24srM67D1bwOhb6sgEmXvL7/CmCUw8O3yGZmWIBodrkfRBe4snPSd9Sbplv46VChOQt1kEcfq9PDDQypnezgoja9EN+HwZbqZfcJCYY7i76y/RL2Arv1fFbThGLFwh5zdUWnay536//df3DSrnMhN0dvqICOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="213220620"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2024 05:03:45 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8516740078B4;
	Wed, 26 Jun 2024 05:03:41 +0900 (JST)
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
Subject: [PATCH v3 3/9] pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
Date: Tue, 25 Jun 2024 21:03:10 +0100
Message-Id: <20240625200316.4282-4-paul.barker.ct@bp.renesas.com>
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

On the RZ/G2L SoC family, the direction of the Ethernet TXC/TX_CLK
signal is selectable to support an Ethernet PHY operating in either MII
or RGMII mode. By default, the signal is configured as an input and MII
mode is supported. The ETH_MODE register can be modified to configure
this signal as an output to support RGMII mode.

As this signal is by default an input, and can optionally be switched to
an output, it maps neatly onto an `output-enable` property in the device
tree.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag & Geert's Reviewed-by tag.
  * Simplify arguments to rzg2l_pin_to_oen_bit() and decode pin/caps
    inside this function. No check is needed for dedicated pins as no
    dedicated pins support OEN in the RZ/G2L family.
Changes v1->v2:
  * Use oen_read and oen_write function pointers to be compatible with
    recent patches adding RZ/V2H support.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 68 +++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 737d8d0064c4..b7d1cfb023b2 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -994,6 +994,61 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
+static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
+	u64 caps = FIELD_GET(PIN_CFG_MASK, *pin_data);
+	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
+	u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
+
+	if (pin > max_pin)
+		return -EINVAL;
+
+	/*
+	 * We can determine which Ethernet interface we're dealing with from
+	 * the caps.
+	 */
+	if (caps & PIN_CFG_IO_VMC_ETH0)
+		return 0;
+	if (caps & PIN_CFG_IO_VMC_ETH1)
+		return 1;
+
+	return -EINVAL;
+}
+
+static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	int bit;
+
+	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (bit < 0)
+		return 0;
+
+	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
+}
+
+static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
+{
+	unsigned long flags;
+	int bit;
+	u8 val;
+
+	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (bit < 0)
+		return bit;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	val = readb(pctrl->base + ETH_MODE);
+	if (oen)
+		val &= ~BIT(bit);
+	else
+		val |= BIT(bit);
+	writeb(val, pctrl->base + ETH_MODE);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
 static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
@@ -1772,7 +1827,7 @@ static const u64 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(3, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x23, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(2, 0x25, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x26, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x27, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
@@ -1781,7 +1836,7 @@ static const u64 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x2a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2b, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2c, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(2, 0x2e, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2f, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(2, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
@@ -1805,13 +1860,13 @@ static const u64 r9a07g044_gpio_configs[] = {
 
 static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x10, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(4, 0x12, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(4, 0x13, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(6, 0x14, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(5, 0x15, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(5, 0x16, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(5, 0x17, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(5, 0x17, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(5, 0x18, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(4, 0x19, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(5, 0x1a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
@@ -3004,6 +3059,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 		[RZG2L_IOLH_IDX_3V3] = 2000, 4000, 8000, 12000,
 	},
 	.iolh_groupb_oi = { 100, 66, 50, 33, },
+	.oen_max_pin = 0,
 };
 
 static const struct rzg2l_hwcfg rzg3s_hwcfg = {
@@ -3058,6 +3114,8 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3073,6 +3131,8 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
-- 
2.39.2


