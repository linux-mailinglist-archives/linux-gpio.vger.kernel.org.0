Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5230E36FA38
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhD3McK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhD3McH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:07 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE447C061346
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z0XG2400E4p6Y38010XGJK; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecH-PG; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00Bdv1-2W; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/12] pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences
Date:   Fri, 30 Apr 2021 14:31:04 +0200
Message-Id: <527b45ebfc664a80e41cb0136677db7260e11437.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change whitespace in the pin control drivers for R-Car H3 ES2.0+, R-Car
M3-W/M3-W+, and R-Car M3-N, to reduce the differences among these very
similar drivers.

These changes have no functional impact.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77951.c |  4 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  7 ++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 79 +++++++++++++-------------
 3 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index be4eee0708427988..84c0ea5d59c1ac31 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -241,7 +241,7 @@
 #define GPSR6_3		F_(SSI_SDATA1_A,	IP15_3_0)
 #define GPSR6_2		F_(SSI_SDATA0,		IP14_31_28)
 #define GPSR6_1		F_(SSI_WS01239,		IP14_27_24)
-#define GPSR6_0		F_(SSI_SCK01239,		IP14_23_20)
+#define GPSR6_0		F_(SSI_SCK01239,	IP14_23_20)
 
 /* GPSR7 */
 #define GPSR7_3		FM(GP7_03)
@@ -668,7 +668,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
 	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, MSIOF2_TXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
 	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
-	PINMUX_IPSR_PHYS(IP0_23_20,     SDA5,                   I2C_SEL_5_1),
+	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
 	PINMUX_IPSR_GPSR(IP0_27_24,	QPOLB),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index bbb1b436ded3123f..a4d74df3d20105e8 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -1549,7 +1549,7 @@ static const u16 pinmux_data[] = {
  * core will do the right thing and skip trying to mux the pin
  * while still applying configuration to it.
  */
-#define FM(x)   PINMUX_DATA(x##_MARK, 0),
+#define FM(x)	PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
 #undef FM
 };
@@ -4234,7 +4234,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(avb_link),
 		SH_PFC_PIN_GROUP(avb_magic),
 		SH_PFC_PIN_GROUP(avb_phy_int),
-		SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio), /* Deprecated */
+		SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio),	/* Deprecated */
 		SH_PFC_PIN_GROUP(avb_mdio),
 		SH_PFC_PIN_GROUP(avb_mii),
 		SH_PFC_PIN_GROUP(avb_avtp_pps),
@@ -5991,7 +5991,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc,
+				  unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index e69210cc61486edc..a7607a6798865868 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -666,14 +666,14 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP0_15_12,	TX4_A,			SEL_SCIF4_0),
 	PINMUX_IPSR_GPSR(IP0_19_16,	FSCLKST2_N_A),
 
-	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
-	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	MSIOF2_RXD_C,	I2C_SEL_5_0, SEL_MSIOF2_2),
-	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	CTS4_N_A,	I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, AVB_AVTP_MATCH_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, MSIOF2_RXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
+	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, CTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
 	PINMUX_IPSR_PHYS(IP0_19_16,	SCL5,			I2C_SEL_5_1),
 
-	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
-	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	MSIOF2_TXD_C,		I2C_SEL_5_0, SEL_MSIOF2_2),
-	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	RTS4_N_A,		I2C_SEL_5_0, SEL_SCIF4_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, MSIOF2_TXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
+	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
 	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
 
 	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
@@ -727,16 +727,16 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP1_19_16,	VI4_DATA6_B,		SEL_VIN4_1),
 	PINMUX_IPSR_MSEL(IP1_19_16,	IECLK_B,		SEL_IEBUS_1),
 
-	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
-	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
-	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	VI4_DATA7_B,	I2C_SEL_3_0,	SEL_VIN4_1),
-	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
-	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,		I2C_SEL_3_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, VI4_DATA7_B,		I2C_SEL_3_0,	SEL_VIN4_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,			I2C_SEL_3_1),
 
-	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
-	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
-	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
-	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,		I2C_SEL_3_1),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
+	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
+	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,			I2C_SEL_3_1),
 
 	PINMUX_IPSR_GPSR(IP1_31_28,	A0),
 	PINMUX_IPSR_GPSR(IP1_31_28,	LCDOUT16),
@@ -1171,13 +1171,13 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP11_15_12,	SDA2_B,			SEL_I2C2_1),
 
 	PINMUX_IPSR_MSEL(IP11_19_16,	SD1_CD,			I2C_SEL_0_0),
-	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	NFRB_N_A,	I2C_SEL_0_0, SEL_NDF_0),
-	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	SIM0_CLK_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS_MSEL(IP11_19_16, NFRB_N_A,		I2C_SEL_0_0,	SEL_NDF_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_19_16, SIM0_CLK_B,		I2C_SEL_0_0,	SEL_SIMCARD_1),
 	PINMUX_IPSR_PHYS(IP11_19_16,	SCL0,			I2C_SEL_0_1),
 
 	PINMUX_IPSR_MSEL(IP11_23_20,	SD1_WP,			I2C_SEL_0_0),
-	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	NFCE_N_A,	I2C_SEL_0_0, SEL_NDF_0),
-	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	SIM0_D_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
+	PINMUX_IPSR_PHYS_MSEL(IP11_23_20, NFCE_N_A,		I2C_SEL_0_0,	SEL_NDF_0),
+	PINMUX_IPSR_PHYS_MSEL(IP11_23_20, SIM0_D_B,		I2C_SEL_0_0,	SEL_SIMCARD_1),
 	PINMUX_IPSR_PHYS(IP11_23_20,	SDA0,			I2C_SEL_0_1),
 
 	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
@@ -1553,7 +1553,7 @@ static const u16 pinmux_data[] = {
  * core will do the right thing and skip trying to mux the pin
  * while still applying configuration to it.
  */
-#define FM(x)   PINMUX_DATA(x##_MARK, 0),
+#define FM(x)	PINMUX_DATA(x##_MARK, 0),
 	PINMUX_STATIC
 #undef FM
 };
@@ -4224,24 +4224,24 @@ static const unsigned int vin4_data18_a_pins[] = {
 	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
 	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
 	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
-	RCAR_GP_PIN(0, 4),  RCAR_GP_PIN(0, 5),
-	RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
 
 static const unsigned int vin4_data18_a_mux[] = {
 	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
 	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
 	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-	VI4_DATA10_MARK,  VI4_DATA11_MARK,
-	VI4_DATA12_MARK,  VI4_DATA13_MARK,
-	VI4_DATA14_MARK,  VI4_DATA15_MARK,
-	VI4_DATA18_MARK,  VI4_DATA19_MARK,
-	VI4_DATA20_MARK,  VI4_DATA21_MARK,
-	VI4_DATA22_MARK,  VI4_DATA23_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 
 static const union vin_data vin4_data_a_pins = {
@@ -4294,12 +4294,12 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
 	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
 	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-	VI4_DATA10_MARK,  VI4_DATA11_MARK,
-	VI4_DATA12_MARK,  VI4_DATA13_MARK,
-	VI4_DATA14_MARK,  VI4_DATA15_MARK,
-	VI4_DATA18_MARK,  VI4_DATA19_MARK,
-	VI4_DATA20_MARK,  VI4_DATA21_MARK,
-	VI4_DATA22_MARK,  VI4_DATA23_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 
 static const union vin_data vin4_data_b_pins = {
@@ -6248,7 +6248,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc,
+				   unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
-- 
2.25.1

