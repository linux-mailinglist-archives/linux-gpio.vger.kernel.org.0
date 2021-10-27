Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F62E43CB11
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 15:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242286AbhJ0Nrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 09:47:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52716 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242287AbhJ0Nrv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 09:47:51 -0400
X-IronPort-AV: E=Sophos;i="5.87,186,1631545200"; 
   d="scan'208";a="98620572"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Oct 2021 22:45:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4EF36400D0F4;
        Wed, 27 Oct 2021 22:45:22 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength and output-impedance-ohms
Date:   Wed, 27 Oct 2021 14:45:09 +0100
Message-Id: <20211027134509.5036-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support to get/set drive-strength and output-impedance-ohms
for the supported pins.

While at it also renamed the below macros to match the HW manual,
PIN_CFG_IOLH_SD0 -> PIN_CFG_IO_VMC_SD0
PIN_CFG_IOLH_SD1 -> PIN_CFG_IO_VMC_SD1
PIN_CFG_IOLH_QSPI -> PIN_CFG_IO_VMC_QSPI
PIN_CFG_IOLH_ETH0 -> PIN_CFG_IO_VMC_ETH0
PIN_CFG_IOLH_ETH1 -> PIN_CFG_IO_VMC_ETH1

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1
 * Renamed macros to match HW manual
 * Added PIN_CFG_IOLH_A/B macros to differentiate Group A/B
 * Added helper function to read/rmw pin config
 * Included RB tags
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 284 ++++++++++++++++++------
 1 file changed, 211 insertions(+), 73 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 20b2af889ca9..91e079de7b6c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -35,20 +35,21 @@
 #define MUX_FUNC(pinconf)	(((pinconf) & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)
 
 /* PIN capabilities */
-#define PIN_CFG_IOLH			BIT(0)
-#define PIN_CFG_SR			BIT(1)
-#define PIN_CFG_IEN			BIT(2)
-#define PIN_CFG_PUPD			BIT(3)
-#define PIN_CFG_IOLH_SD0		BIT(4)
-#define PIN_CFG_IOLH_SD1		BIT(5)
-#define PIN_CFG_IOLH_QSPI		BIT(6)
-#define PIN_CFG_IOLH_ETH0		BIT(7)
-#define PIN_CFG_IOLH_ETH1		BIT(8)
-#define PIN_CFG_FILONOFF		BIT(9)
-#define PIN_CFG_FILNUM			BIT(10)
-#define PIN_CFG_FILCLKSEL		BIT(11)
-
-#define RZG2L_MPXED_PIN_FUNCS		(PIN_CFG_IOLH | \
+#define PIN_CFG_IOLH_A			BIT(0)
+#define PIN_CFG_IOLH_B			BIT(1)
+#define PIN_CFG_SR			BIT(2)
+#define PIN_CFG_IEN			BIT(3)
+#define PIN_CFG_PUPD			BIT(4)
+#define PIN_CFG_IO_VMC_SD0		BIT(5)
+#define PIN_CFG_IO_VMC_SD1		BIT(6)
+#define PIN_CFG_IO_VMC_QSPI		BIT(7)
+#define PIN_CFG_IO_VMC_ETH0		BIT(8)
+#define PIN_CFG_IO_VMC_ETH1		BIT(9)
+#define PIN_CFG_FILONOFF		BIT(10)
+#define PIN_CFG_FILNUM			BIT(11)
+#define PIN_CFG_FILCLKSEL		BIT(12)
+
+#define RZG2L_MPXED_PIN_FUNCS		(PIN_CFG_IOLH_A | \
 					 PIN_CFG_SR | \
 					 PIN_CFG_PUPD | \
 					 PIN_CFG_FILONOFF | \
@@ -86,6 +87,7 @@
 #define PMC(n)			(0x0200 + 0x10 + (n))
 #define PFC(n)			(0x0400 + 0x40 + (n) * 4)
 #define PIN(n)			(0x0800 + 0x10 + (n))
+#define IOLH(n)			(0x1010 + (n) * 8 - 0x10)
 #define IEN(n)			(0x1800 + (n) * 8)
 #define PWPR			(0x3014)
 #define SD_CH(n)		(0x3000 + (n) * 4)
@@ -101,6 +103,7 @@
 #define PVDD_MASK		0x01
 #define PFC_MASK		0x07
 #define IEN_MASK		0x01
+#define IOLH_MASK		0x03
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -424,6 +427,56 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
+				   u32 cfg, u32 port, u8 bit)
+{
+	u8 pincount = RZG2L_GPIO_PORT_GET_PINCNT(cfg);
+	u32 port_index = RZG2L_GPIO_PORT_GET_INDEX(cfg);
+	u32 data;
+
+	if (bit >= pincount || port >= pctrl->data->n_port_pins)
+		return -EINVAL;
+
+	data = pctrl->data->port_pin_configs[port];
+	if (port_index != RZG2L_GPIO_PORT_GET_INDEX(data))
+		return -EINVAL;
+
+	return 0;
+}
+
+static u32 rzg2l_read_pin_config(void __iomem *addr,
+				 u8 bit, u32 mask)
+{
+	void __iomem *addr_adjust = addr;
+	u8 bit_adjust = bit;
+	u32 reg;
+
+	if (bit >= 4) {
+		bit_adjust -= 4;
+		addr_adjust += 4;
+	}
+
+	reg = readl(addr_adjust) & (mask << (bit_adjust * 8));
+	return (reg >> (bit_adjust * 8));
+}
+
+static void rzg2l_rmw_pin_config(void __iomem *addr,
+				 u8 bit, u32 mask, u32 val)
+{
+	void __iomem *addr_adjust = addr;
+	u8 bit_adjust = bit;
+	u32 reg;
+
+	if (bit >= 4) {
+		bit_adjust -= 4;
+		addr_adjust += 4;
+	}
+
+	reg = readl(addr_adjust) & ~(mask << (bit_adjust * 8));
+
+	writel(reg | val, addr_adjust);
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -446,6 +499,13 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	switch (param) {
@@ -468,11 +528,11 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_POWER_SOURCE: {
 		u32 pwr_reg = 0x0;
 
-		if (cfg & PIN_CFG_IOLH_SD0)
+		if (cfg & PIN_CFG_IO_VMC_SD0)
 			pwr_reg = SD_CH(0);
-		else if (cfg & PIN_CFG_IOLH_SD1)
+		else if (cfg & PIN_CFG_IO_VMC_SD1)
 			pwr_reg = SD_CH(1);
-		else if (cfg & PIN_CFG_IOLH_QSPI)
+		else if (cfg & PIN_CFG_IO_VMC_QSPI)
 			pwr_reg = QSPI;
 		else
 			return -EINVAL;
@@ -484,6 +544,34 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case PIN_CONFIG_DRIVE_STRENGTH: {
+		static const unsigned int mA[4] = { 2, 4, 8, 12 };
+
+		if (!(cfg & PIN_CFG_IOLH_A))
+			return -EINVAL;
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+		addr = pctrl->base + IOLH(port);
+		reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
+		arg = mA[reg];
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		break;
+	}
+
+	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
+		static const unsigned int oi[4] = { 100, 66, 50, 33 };
+
+		if (!(cfg & PIN_CFG_IOLH_B))
+			return -EINVAL;
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+		addr = pctrl->base + IOLH(port);
+		reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
+		arg = oi[reg];
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		break;
+	}
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -516,6 +604,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	for (i = 0; i < num_configs; i++) {
@@ -549,11 +644,11 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			if (mV != 1800 && mV != 3300)
 				return -EINVAL;
 
-			if (cfg & PIN_CFG_IOLH_SD0)
+			if (cfg & PIN_CFG_IO_VMC_SD0)
 				pwr_reg = SD_CH(0);
-			else if (cfg & PIN_CFG_IOLH_SD1)
+			else if (cfg & PIN_CFG_IO_VMC_SD1)
 				pwr_reg = SD_CH(1);
-			else if (cfg & PIN_CFG_IOLH_QSPI)
+			else if (cfg & PIN_CFG_IO_VMC_QSPI)
 				pwr_reg = QSPI;
 			else
 				return -EINVAL;
@@ -564,6 +659,49 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			spin_unlock_irqrestore(&pctrl->lock, flags);
 			break;
 		}
+
+		case PIN_CONFIG_DRIVE_STRENGTH: {
+			unsigned int arg = pinconf_to_config_argument(_configs[i]);
+			static const unsigned int mA[4] = { 2, 4, 8, 12 };
+
+			if (!(cfg & PIN_CFG_IOLH_A))
+				return -EINVAL;
+
+			for (i = 0; i < ARRAY_SIZE(mA); i++) {
+				if (arg == mA[i])
+					break;
+			}
+			if (i >= ARRAY_SIZE(mA))
+				return -EINVAL;
+
+			spin_lock_irqsave(&pctrl->lock, flags);
+			addr = pctrl->base + IOLH(port);
+			rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));
+			spin_unlock_irqrestore(&pctrl->lock, flags);
+			break;
+		}
+
+		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
+			unsigned int arg = pinconf_to_config_argument(_configs[i]);
+			static const unsigned int oi[4] = { 100, 66, 50, 33 };
+
+			if (!(cfg & PIN_CFG_IOLH_B))
+				return -EINVAL;
+
+			for (i = 0; i < ARRAY_SIZE(oi); i++) {
+				if (arg == oi[i])
+					break;
+			}
+			if (i >= ARRAY_SIZE(oi))
+				return -EINVAL;
+
+			spin_lock_irqsave(&pctrl->lock, flags);
+			addr = pctrl->base + IOLH(port);
+			rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));
+			spin_unlock_irqrestore(&pctrl->lock, flags);
+			break;
+		}
+
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -855,24 +993,24 @@ static const u32 rzg2l_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(3, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x23, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x25, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x26, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x27, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x28, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x29, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2b, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2c, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2e, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2f, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x31, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x32, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x33, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(2, 0x34, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
-	RZG2L_GPIO_PORT_PACK(3, 0x35, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH1)),
+	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x25, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x26, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x27, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x28, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x29, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2b, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2c, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2e, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2f, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x31, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x32, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x33, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x34, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(3, 0x35, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(2, 0x36, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(3, 0x37, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(3, 0x38, RZG2L_MPXED_PIN_FUNCS),
@@ -890,75 +1028,75 @@ static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
 	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
 	 (PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL)) },
 	{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
-	 (PIN_CFG_SR | PIN_CFG_IOLH | PIN_CFG_IEN)) },
+	 (PIN_CFG_SR | PIN_CFG_IOLH_A | PIN_CFG_IEN)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN)) },
+	 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
 	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
 	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x6, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x7, 7,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD1_CLK", RZG2L_SINGLE_PIN_PACK(0x8, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD1))},
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_CMD", RZG2L_SINGLE_PIN_PACK(0x8, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA0", RZG2L_SINGLE_PIN_PACK(0x9, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA1", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA2", RZG2L_SINGLE_PIN_PACK(0x9, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA3", RZG2L_SINGLE_PIN_PACK(0x9, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR  | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
-	{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
-	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH | PIN_CFG_SR)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH_A | PIN_CFG_SR)) },
 	{ "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
 	{ "RIIC0_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 1, PIN_CFG_IEN) },
 	{ "RIIC1_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 2, PIN_CFG_IEN) },
-- 
2.17.1

