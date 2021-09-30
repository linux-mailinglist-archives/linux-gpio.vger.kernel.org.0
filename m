Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B7341D999
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350782AbhI3MTM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:19:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9189 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1350827AbhI3MTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 08:19:09 -0400
X-IronPort-AV: E=Sophos;i="5.85,336,1624287600"; 
   d="scan'208";a="95535904"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2021 21:17:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 06ACB437E78F;
        Thu, 30 Sep 2021 21:17:23 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength and output-impedance
Date:   Thu, 30 Sep 2021 13:16:30 +0100
Message-Id: <20210930121630.17449-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support to get/set drive-strength and output-impedance of the pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 181 +++++++++++++++++++-----
 1 file changed, 148 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 20b2af889ca9..d75b31ca33ab 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -47,6 +47,7 @@
 #define PIN_CFG_FILONOFF		BIT(9)
 #define PIN_CFG_FILNUM			BIT(10)
 #define PIN_CFG_FILCLKSEL		BIT(11)
+#define PIN_CFG_GROUP_B			BIT(12)
 
 #define RZG2L_MPXED_PIN_FUNCS		(PIN_CFG_IOLH | \
 					 PIN_CFG_SR | \
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
@@ -424,6 +427,23 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
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
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -432,6 +452,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
+	bool groupb_pin = false;
 	unsigned int arg = 0;
 	unsigned long flags;
 	void __iomem *addr;
@@ -446,6 +467,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+		groupb_pin = cfg & PIN_CFG_GROUP_B;
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	switch (param) {
@@ -484,6 +513,38 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case PIN_CONFIG_OUTPUT_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_STRENGTH: {
+		unsigned int mA[4] = { 2, 4, 8, 12 };
+		unsigned int oi[4] = { 100, 66, 50, 33 };
+
+		if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+			if (!(cfg & PIN_CFG_IOLH) || groupb_pin)
+				return -EINVAL;
+		} else {
+			if (!(cfg & PIN_CFG_IOLH) || !groupb_pin)
+				return -EINVAL;
+		}
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+
+		/* handle _L/_H for 32-bit register read/write */
+		addr = pctrl->base + IOLH(port);
+		if (bit >= 4) {
+			bit -= 4;
+			addr += 4;
+		}
+
+		reg = readl(addr) & (IOLH_MASK << (bit * 8));
+		reg = reg >> (bit * 8);
+		if (param == PIN_CONFIG_DRIVE_STRENGTH)
+			arg = mA[reg];
+		else
+			arg = oi[reg];
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		break;
+	}
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -502,6 +563,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
+	bool groupb_pin = false;
 	unsigned long flags;
 	void __iomem *addr;
 	u32 port = 0, reg;
@@ -516,6 +578,14 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+		groupb_pin = cfg & PIN_CFG_GROUP_B;
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	for (i = 0; i < num_configs; i++) {
@@ -564,6 +634,51 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			spin_unlock_irqrestore(&pctrl->lock, flags);
 			break;
 		}
+
+		case PIN_CONFIG_OUTPUT_IMPEDANCE:
+		case PIN_CONFIG_DRIVE_STRENGTH: {
+			unsigned int arg = pinconf_to_config_argument(_configs[i]);
+			unsigned int mA[4] = { 2, 4, 8, 12 };
+			unsigned int oi[4] = { 100, 66, 50, 33 };
+
+			if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+				if (!(cfg & PIN_CFG_IOLH) || groupb_pin)
+					return -EINVAL;
+
+				for (i = 0; i < ARRAY_SIZE(mA); i++) {
+					if (arg == mA[i])
+						break;
+				}
+
+				if (i >= ARRAY_SIZE(mA))
+					return -EINVAL;
+			} else {
+				if (!(cfg & PIN_CFG_IOLH) || !groupb_pin)
+					return -EINVAL;
+
+				for (i = 0; i < ARRAY_SIZE(oi); i++) {
+					if (arg == oi[i])
+						break;
+				}
+				if (i >= ARRAY_SIZE(oi))
+					return -EINVAL;
+			}
+
+			spin_lock_irqsave(&pctrl->lock, flags);
+
+			/* handle _L/_H for 32-bit register read/write */
+			addr = pctrl->base + IOLH(port);
+			if (bit >= 4) {
+				bit -= 4;
+				addr += 4;
+			}
+
+			reg = readl(addr) & ~(IOLH_MASK << (bit * 8));
+			writel(reg | (i << (bit * 8)), addr);
+			spin_unlock_irqrestore(&pctrl->lock, flags);
+			break;
+		}
+
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -893,70 +1008,70 @@ static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
 	 (PIN_CFG_SR | PIN_CFG_IOLH | PIN_CFG_IEN)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
 	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN)) },
-	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
-	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN) },
+	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN | PIN_CFG_GROUP_B) },
+	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN | PIN_CFG_GROUP_B) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x6, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x7, 7,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD0 | PIN_CFG_GROUP_B)) },
 	{ "SD1_CLK", RZG2L_SINGLE_PIN_PACK(0x8, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD1))},
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "SD1_CMD", RZG2L_SINGLE_PIN_PACK(0x8, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "SD1_DATA0", RZG2L_SINGLE_PIN_PACK(0x9, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "SD1_DATA1", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "SD1_DATA2", RZG2L_SINGLE_PIN_PACK(0x9, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "SD1_DATA3", RZG2L_SINGLE_PIN_PACK(0x9, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IOLH_SD1 | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR  | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR  | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
+	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IOLH_QSPI | PIN_CFG_GROUP_B)) },
 	{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IOLH_QSPI)) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH | PIN_CFG_SR)) },
 	{ "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
-- 
2.17.1

