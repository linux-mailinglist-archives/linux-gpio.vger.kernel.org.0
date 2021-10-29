Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A02543FC91
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 14:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhJ2Mr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 08:47:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18679 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231785AbhJ2Mr0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 08:47:26 -0400
X-IronPort-AV: E=Sophos;i="5.87,192,1631545200"; 
   d="scan'208";a="98635628"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Oct 2021 21:44:56 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 397EF438CAF0;
        Fri, 29 Oct 2021 21:44:54 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength and output-impedance-ohms
Date:   Fri, 29 Oct 2021 13:44:37 +0100
Message-Id: <20211029124437.20721-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/G2L supports two groups of pins Group-A and Group-B. For Group-A
pins drive-strength can be configured and for Group-B output-impedance
can be configured.

This patch splits PIN_CFG_IOLH macro to PIN_CFG_IOLH_A/B and adds
support to get/set drive-strength and output-impedance-ohms for the
supported pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 159 ++++++++++++++++--------
 1 file changed, 110 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 348fc8dd74e6..f02d76c4966b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -35,20 +35,21 @@
 #define MUX_FUNC(pinconf)	(((pinconf) & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)
 
 /* PIN capabilities */
-#define PIN_CFG_IOLH			BIT(0)
-#define PIN_CFG_SR			BIT(1)
-#define PIN_CFG_IEN			BIT(2)
-#define PIN_CFG_PUPD			BIT(3)
-#define PIN_CFG_IO_VMC_SD0		BIT(4)
-#define PIN_CFG_IO_VMC_SD1		BIT(5)
-#define PIN_CFG_IO_VMC_QSPI		BIT(6)
-#define PIN_CFG_IO_VMC_ETH0		BIT(7)
-#define PIN_CFG_IO_VMC_ETH1		BIT(8)
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
@@ -103,6 +105,7 @@
 #define PVDD_MASK		0x01
 #define PFC_MASK		0x07
 #define IEN_MASK		0x01
+#define IOLH_MASK		0x03
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -139,6 +142,9 @@ struct rzg2l_pinctrl {
 	spinlock_t			lock;
 };
 
+static const unsigned int iolh_groupa_mA[] = { 2, 4, 8, 12 };
+static const unsigned int iolh_groupb_oi[] = { 100, 66, 50, 33 };
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 port, u8 pin, u8 func)
 {
@@ -501,7 +507,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	unsigned int arg = 0;
 	unsigned long flags;
 	void __iomem *addr;
-	u32 port = 0;
+	u32 port = 0, reg;
 	u32 cfg = 0;
 	u8 bit = 0;
 
@@ -549,6 +555,24 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case PIN_CONFIG_DRIVE_STRENGTH: {
+		if (!(cfg & PIN_CFG_IOLH_A))
+			return -EINVAL;
+
+		reg = rzg2l_read_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK);
+		arg = iolh_groupa_mA[reg];
+		break;
+	}
+
+	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
+		if (!(cfg & PIN_CFG_IOLH_B))
+			return -EINVAL;
+
+		reg = rzg2l_read_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK);
+		arg = iolh_groupb_oi[reg];
+		break;
+	}
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -627,6 +651,43 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			spin_unlock_irqrestore(&pctrl->lock, flags);
 			break;
 		}
+
+		case PIN_CONFIG_DRIVE_STRENGTH: {
+			unsigned int arg = pinconf_to_config_argument(_configs[i]);
+			unsigned int index;
+
+			if (!(cfg & PIN_CFG_IOLH_A))
+				return -EINVAL;
+
+			for (index = 0; index < ARRAY_SIZE(iolh_groupa_mA); index++) {
+				if (arg == iolh_groupa_mA[index])
+					break;
+			}
+			if (index >= ARRAY_SIZE(iolh_groupa_mA))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK, index);
+			break;
+		}
+
+		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
+			unsigned int arg = pinconf_to_config_argument(_configs[i]);
+			unsigned int index;
+
+			if (!(cfg & PIN_CFG_IOLH_B))
+				return -EINVAL;
+
+			for (index = 0; index < ARRAY_SIZE(iolh_groupb_oi); index++) {
+				if (arg == iolh_groupb_oi[index])
+					break;
+			}
+			if (index >= ARRAY_SIZE(iolh_groupb_oi))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK, index);
+			break;
+		}
+
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -953,75 +1014,75 @@ static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
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
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x7, 7,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD1_CLK", RZG2L_SINGLE_PIN_PACK(0x8, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_SD1))},
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_CMD", RZG2L_SINGLE_PIN_PACK(0x8, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA0", RZG2L_SINGLE_PIN_PACK(0x9, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA1", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA2", RZG2L_SINGLE_PIN_PACK(0x9, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "SD1_DATA3", RZG2L_SINGLE_PIN_PACK(0x9, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
 	{ "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
-	 (PIN_CFG_IOLH | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
-	 (PIN_CFG_IOLH | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
 	{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH | PIN_CFG_SR)) },
+	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH_A | PIN_CFG_SR)) },
 	{ "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
 	{ "RIIC0_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 1, PIN_CFG_IEN) },
 	{ "RIIC1_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 2, PIN_CFG_IEN) },
-- 
2.17.1

