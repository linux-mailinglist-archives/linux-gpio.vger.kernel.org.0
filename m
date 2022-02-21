Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6934BE4F5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379495AbiBUPpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379502AbiBUPo5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:57 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA49223BED
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by michel.telenet-ops.be with bizsmtp
        id xrjr2600K3YJRAw06rjrUJ; Mon, 21 Feb 2022 16:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TTp-1S; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006Ehi-CB; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
Date:   Mon, 21 Feb 2022 16:43:38 +0100
Message-Id: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645457792.git.geert+renesas@glider.be>
References: <cover.1645457792.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial Pin Function Controller (PFC) support for the Renesas R-Car
S4-8 (R8A779F0) SoC, including bias, drive strength and voltage control.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix whitespace in Makefile,
  - Remove GPIO and No-GPIO pins, pin function definitions, and
    registers that can only be accessed from the Control Domain.

This depends on "[PATCH 01/10] pinctrl: renesas: Remove unused pfc
parameter from .pin_to_pocctrl()"[1].

Changes compared to the BSP:
  - Remove GPIO and No-GPIO pins, pin function definitions, and
    registers that can only be accessed from the Control Domain,
  - Sort PINCTRL_PFC_R8A779F0 config entry,
  - Replace "R-Car S4" and "S4" by "R-Car S4-8",
  - All non-GP pins with pull-up capabilities support both pull-up/down,
  - Remove nonexistent "PRESETOUT#" pin,
  - Handle functions that can appear on multiple pins:
      - R-Switch2:
	  - Add B-suffixes to some TSNx on GP_3_x,
	  - Add TSNx_A on GP_0_x and GP_1_x.
  - Rename the MOD_SEL1_* definitions, to match the bitfield order in
    IPxSRy_* definitions and in MOD_SEL* definitions in other drivers,
  - Replace "PINMUX_IPSR_PHYS_NOFN(y, z)" by "PINMUX_IPSR_NOFN(GP1_x, y,
    z)", as I2C requires GPSR1[x] to be configured for peripheral mode,
  - Add comments to sentinels,
  - Remove unused pfc parameter from .pin_to_pocctrl(),
  - Rename pinmux_ops to r8a779f0_pfc_ops,
  - Drop adding PINMUX_IPSR_PHYS_NOFN(),
  - Whitespace fixes.

[1] https://lore.kernel.org/r/822133086f32618c7fc920123c6a96f5d4ea7ad6.1640270559.git.geert+renesas@glider.be/
---
 drivers/pinctrl/renesas/Kconfig        |    5 +
 drivers/pinctrl/renesas/Makefile       |    1 +
 drivers/pinctrl/renesas/core.c         |    6 +
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 1024 ++++++++++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h       |    1 +
 5 files changed, 1037 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779f0.c

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index c0c740e660b84110..6b38720c56e34c21 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -37,6 +37,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A77990 if ARCH_R8A77990
 	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
 	select PINCTRL_PFC_R8A779A0 if ARCH_R8A779A0
+	select PINCTRL_PFC_R8A779F0 if ARCH_R8A779F0
 	select PINCTRL_RZG2L if ARCH_R9A07G044
 	select PINCTRL_RZG2L if ARCH_R9A07G054
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
@@ -133,6 +134,10 @@ config PINCTRL_PFC_R8A77961
 	bool "pin control support for R-Car M3-W+" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
+config PINCTRL_PFC_R8A779F0
+	bool "pin control support for R-Car S4-8" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
 config PINCTRL_PFC_R8A7792
 	bool "pin control support for R-Car V2H" if COMPILE_TEST
 	select PINCTRL_SH_PFC
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 7d9238a9ef57c5d8..5d936c154a6f4438 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A77980)	+= pfc-r8a77980.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77990)	+= pfc-r8a77990.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77995)	+= pfc-r8a77995.o
 obj-$(CONFIG_PINCTRL_PFC_R8A779A0)	+= pfc-r8a779a0.o
+obj-$(CONFIG_PINCTRL_PFC_R8A779F0)	+= pfc-r8a779f0.o
 obj-$(CONFIG_PINCTRL_PFC_SH7203)	+= pfc-sh7203.o
 obj-$(CONFIG_PINCTRL_PFC_SH7264)	+= pfc-sh7264.o
 obj-$(CONFIG_PINCTRL_PFC_SH7269)	+= pfc-sh7269.o
diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index c252eb5c9755035f..62b4c3145ba7c052 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -636,6 +636,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a779a0_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R8A779F0
+	{
+		.compatible = "renesas,pfc-r8a779f0",
+		.data = &r8a779f0_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_SH73A0
 	{
 		.compatible = "renesas,pfc-sh73a0",
diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
new file mode 100644
index 0000000000000000..2f3fbb794eb635c1
--- /dev/null
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -0,0 +1,1024 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R8A779F0 processor support - PFC hardware block.
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * This file is based on the drivers/pinctrl/renesas/pfc-r8a779a0.c
+ */
+
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "sh_pfc.h"
+
+#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
+#define CPU_ALL_GP(fn, sfx)	\
+	PORT_GP_CFG_21(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_25(1, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS),	\
+	PORT_GP_CFG_19(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
+
+#define CPU_ALL_NOGP(fn)								\
+	PIN_NOGP_CFG(PRESETOUT0_N, "PRESETOUT0#", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
+/*
+ * F_() : just information
+ * FM() : macro for FN_xxx / xxx_MARK
+ */
+
+/* GPSR0 */
+#define GPSR0_20	F_(IRQ3,	IP2SR0_19_16)
+#define GPSR0_19	F_(IRQ2,	IP2SR0_15_12)
+#define GPSR0_18	F_(IRQ1,	IP2SR0_11_8)
+#define GPSR0_17	F_(IRQ0,	IP2SR0_7_4)
+#define GPSR0_16	F_(MSIOF0_SS2,	IP2SR0_3_0)
+#define GPSR0_15	F_(MSIOF0_SS1,	IP1SR0_31_28)
+#define GPSR0_14	F_(MSIOF0_SCK,	IP1SR0_27_24)
+#define GPSR0_13	F_(MSIOF0_TXD,	IP1SR0_23_20)
+#define GPSR0_12	F_(MSIOF0_RXD,	IP1SR0_19_16)
+#define GPSR0_11	F_(MSIOF0_SYNC,	IP1SR0_15_12)
+#define GPSR0_10	F_(CTS0_N,	IP1SR0_11_8)
+#define GPSR0_9		F_(RTS0_N,	IP1SR0_7_4)
+#define GPSR0_8		F_(SCK0,	IP1SR0_3_0)
+#define GPSR0_7		F_(TX0,		IP0SR0_31_28)
+#define GPSR0_6		F_(RX0,		IP0SR0_27_24)
+#define GPSR0_5		F_(HRTS0_N,	IP0SR0_23_20)
+#define GPSR0_4		F_(HCTS0_N,	IP0SR0_19_16)
+#define GPSR0_3		F_(HTX0,	IP0SR0_15_12)
+#define GPSR0_2		F_(HRX0,	IP0SR0_11_8)
+#define GPSR0_1		F_(HSCK0,	IP0SR0_7_4)
+#define GPSR0_0		F_(SCIF_CLK,	IP0SR0_3_0)
+
+/* GPSR1 */
+#define GPSR1_24	FM(SD_WP)
+#define GPSR1_23	FM(SD_CD)
+#define GPSR1_22	FM(MMC_SD_CMD)
+#define GPSR1_21	FM(MMC_D7)
+#define GPSR1_20	FM(MMC_DS)
+#define GPSR1_19	FM(MMC_D6)
+#define GPSR1_18	FM(MMC_D4)
+#define GPSR1_17	FM(MMC_D5)
+#define GPSR1_16	FM(MMC_SD_D3)
+#define GPSR1_15	FM(MMC_SD_D2)
+#define GPSR1_14	FM(MMC_SD_D1)
+#define GPSR1_13	FM(MMC_SD_D0)
+#define GPSR1_12	FM(MMC_SD_CLK)
+#define GPSR1_11	FM(GP1_11)
+#define GPSR1_10	FM(GP1_10)
+#define GPSR1_9		FM(GP1_09)
+#define GPSR1_8		FM(GP1_08)
+#define GPSR1_7		F_(GP1_07,	IP0SR1_31_28)
+#define GPSR1_6		F_(GP1_06,	IP0SR1_27_24)
+#define GPSR1_5		F_(GP1_05,	IP0SR1_23_20)
+#define GPSR1_4		F_(GP1_04,	IP0SR1_19_16)
+#define GPSR1_3		F_(GP1_03,	IP0SR1_15_12)
+#define GPSR1_2		F_(GP1_02,	IP0SR1_11_8)
+#define GPSR1_1		F_(GP1_01,	IP0SR1_7_4)
+#define GPSR1_0		F_(GP1_00,	IP0SR1_3_0)
+
+/* GPSR2 */
+#define GPSR2_16	FM(PCIE1_CLKREQ_N)
+#define GPSR2_15	FM(PCIE0_CLKREQ_N)
+#define GPSR2_14	FM(QSPI0_IO3)
+#define GPSR2_13	FM(QSPI0_SSL)
+#define GPSR2_12	FM(QSPI0_MISO_IO1)
+#define GPSR2_11	FM(QSPI0_IO2)
+#define GPSR2_10	FM(QSPI0_SPCLK)
+#define GPSR2_9		FM(QSPI0_MOSI_IO0)
+#define GPSR2_8		FM(QSPI1_SPCLK)
+#define GPSR2_7		FM(QSPI1_MOSI_IO0)
+#define GPSR2_6		FM(QSPI1_IO2)
+#define GPSR2_5		FM(QSPI1_MISO_IO1)
+#define GPSR2_4		FM(QSPI1_IO3)
+#define GPSR2_3		FM(QSPI1_SSL)
+#define GPSR2_2		FM(RPC_RESET_N)
+#define GPSR2_1		FM(RPC_WP_N)
+#define GPSR2_0		FM(RPC_INT_N)
+
+/* GPSR3 */
+#define GPSR3_18	FM(TSN0_AVTP_CAPTURE_B)
+#define GPSR3_17	FM(TSN0_AVTP_MATCH_B)
+#define GPSR3_16	FM(TSN0_AVTP_PPS)
+#define GPSR3_15	FM(TSN1_AVTP_CAPTURE_B)
+#define GPSR3_14	FM(TSN1_AVTP_MATCH_B)
+#define GPSR3_13	FM(TSN1_AVTP_PPS)
+#define GPSR3_12	FM(TSN0_MAGIC_B)
+#define GPSR3_11	FM(TSN1_PHY_INT_B)
+#define GPSR3_10	FM(TSN0_PHY_INT_B)
+#define GPSR3_9		FM(TSN2_PHY_INT_B)
+#define GPSR3_8		FM(TSN0_LINK_B)
+#define GPSR3_7		FM(TSN2_LINK_B)
+#define GPSR3_6		FM(TSN1_LINK_B)
+#define GPSR3_5		FM(TSN1_MDC_B)
+#define GPSR3_4		FM(TSN0_MDC_B)
+#define GPSR3_3		FM(TSN2_MDC_B)
+#define GPSR3_2		FM(TSN0_MDIO_B)
+#define GPSR3_1		FM(TSN2_MDIO_B)
+#define GPSR3_0		FM(TSN1_MDIO_B)
+
+/* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */		/* 5 */			/* 6 */			/* 7 - F */
+#define IP0SR0_3_0	FM(SCIF_CLK)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_7_4	FM(HSCK0)		FM(SCK3)		FM(MSIOF3_SCK)		F_(0, 0)		F_(0, 0)	FM(TSN0_AVTP_CAPTURE_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_11_8	FM(HRX0)		FM(RX3)			FM(MSIOF3_RXD)		F_(0, 0)		F_(0, 0)	FM(TSN0_AVTP_MATCH_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_15_12	FM(HTX0)		FM(TX3)			FM(MSIOF3_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_19_16	FM(HCTS0_N)		FM(CTS3_N)		FM(MSIOF3_SS1)		F_(0, 0)		F_(0, 0)	FM(TSN0_MDC_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_23_20	FM(HRTS0_N)		FM(RTS3_N)		FM(MSIOF3_SS2)		F_(0, 0)		F_(0, 0)	FM(TSN0_MDIO_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_27_24	FM(RX0)			FM(HRX1)		F_(0, 0)		FM(MSIOF1_RXD)		F_(0, 0)	FM(TSN1_AVTP_MATCH_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_31_28	FM(TX0)			FM(HTX1)		F_(0, 0)		FM(MSIOF1_TXD)		F_(0, 0)	FM(TSN1_AVTP_CAPTURE_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+/* IP1SR0 */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */		/* 5 */			/* 6 */			/* 7 - F */
+#define IP1SR0_3_0	FM(SCK0)		FM(HSCK1)		F_(0, 0)		FM(MSIOF1_SCK)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_7_4	FM(RTS0_N)		FM(HRTS1_N)		FM(MSIOF3_SYNC)		F_(0, 0)		F_(0, 0)	FM(TSN1_MDIO_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_11_8	FM(CTS0_N)		FM(HCTS1_N)		F_(0, 0)		FM(MSIOF1_SYNC)		F_(0, 0)	FM(TSN1_MDC_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_15_12	FM(MSIOF0_SYNC)		FM(HCTS3_N)		FM(CTS1_N)		FM(IRQ4)		F_(0, 0)	FM(TSN0_LINK_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_19_16	FM(MSIOF0_RXD)		FM(HRX3)		FM(RX1)			F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_23_20	FM(MSIOF0_TXD)		FM(HTX3)		FM(TX1)			F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_27_24	FM(MSIOF0_SCK)		FM(HSCK3)		FM(SCK1)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_31_28	FM(MSIOF0_SS1)		FM(HRTS3_N)		FM(RTS1_N)		FM(IRQ5)		F_(0, 0)	FM(TSN1_LINK_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+/* IP2SR0 */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */		/* 5 */			/* 6 */			/* 7 - F */
+#define IP2SR0_3_0	FM(MSIOF0_SS2)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	FM(TSN2_LINK_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_7_4	FM(IRQ0)		F_(0, 0)		F_(0, 0)		FM(MSIOF1_SS1)		F_(0, 0)	FM(TSN0_MAGIC_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_11_8	FM(IRQ1)		F_(0, 0)		F_(0, 0)		FM(MSIOF1_SS2)		F_(0, 0)	FM(TSN0_PHY_INT_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_15_12	FM(IRQ2)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	FM(TSN1_PHY_INT_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_19_16	FM(IRQ3)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	FM(TSN2_PHY_INT_A)	F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR0_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+
+/* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */		/* 5 */			/* 6 */			/* 7 - F */
+#define IP0SR1_3_0	FM(GP1_00)		FM(TCLK1)		FM(HSCK2)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(GP1_01)		FM(TCLK4)		FM(HRX2)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(GP1_02)		F_(0, 0)		FM(HTX2)		FM(MSIOF2_SS1)		F_(0, 0)	FM(TSN2_MDC_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(GP1_03)		FM(TCLK2)		FM(HCTS2_N)		FM(MSIOF2_SS2)		FM(CTS4_N)	FM(TSN2_MDIO_A)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(GP1_04)		FM(TCLK3)		FM(HRTS2_N)		FM(MSIOF2_SYNC)		FM(RTS4_N)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_23_20	FM(GP1_05)		FM(MSIOF2_SCK)		FM(SCK4)		F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_27_24	FM(GP1_06)		FM(MSIOF2_RXD)		FM(RX4)			F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_31_28	FM(GP1_07)		FM(MSIOF2_TXD)		FM(TX4)			F_(0, 0)		F_(0, 0)	F_(0, 0)		F_(0, 0)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+
+#define PINMUX_GPSR	\
+		GPSR1_24					\
+		GPSR1_23					\
+		GPSR1_22					\
+		GPSR1_21					\
+GPSR0_20	GPSR1_20					\
+GPSR0_19	GPSR1_19					\
+GPSR0_18	GPSR1_18			GPSR3_18	\
+GPSR0_17	GPSR1_17			GPSR3_17	\
+GPSR0_16	GPSR1_16	GPSR2_16	GPSR3_16	\
+GPSR0_15	GPSR1_15	GPSR2_15	GPSR3_15	\
+GPSR0_14	GPSR1_14	GPSR2_14	GPSR3_14	\
+GPSR0_13	GPSR1_13	GPSR2_13	GPSR3_13	\
+GPSR0_12	GPSR1_12	GPSR2_12	GPSR3_12	\
+GPSR0_11	GPSR1_11	GPSR2_11	GPSR3_11	\
+GPSR0_10	GPSR1_10	GPSR2_10	GPSR3_10	\
+GPSR0_9		GPSR1_9		GPSR2_9		GPSR3_9		\
+GPSR0_8		GPSR1_8		GPSR2_8		GPSR3_8		\
+GPSR0_7		GPSR1_7		GPSR2_7		GPSR3_7		\
+GPSR0_6		GPSR1_6		GPSR2_6		GPSR3_6		\
+GPSR0_5		GPSR1_5		GPSR2_5		GPSR3_5		\
+GPSR0_4		GPSR1_4		GPSR2_4		GPSR3_4		\
+GPSR0_3		GPSR1_3		GPSR2_3		GPSR3_3		\
+GPSR0_2		GPSR1_2		GPSR2_2		GPSR3_2		\
+GPSR0_1		GPSR1_1		GPSR2_1		GPSR3_1		\
+GPSR0_0		GPSR1_0		GPSR2_0		GPSR3_0
+
+#define PINMUX_IPSR	\
+\
+FM(IP0SR0_3_0)		IP0SR0_3_0	FM(IP1SR0_3_0)		IP1SR0_3_0	FM(IP2SR0_3_0)		IP2SR0_3_0	\
+FM(IP0SR0_7_4)		IP0SR0_7_4	FM(IP1SR0_7_4)		IP1SR0_7_4	FM(IP2SR0_7_4)		IP2SR0_7_4	\
+FM(IP0SR0_11_8)		IP0SR0_11_8	FM(IP1SR0_11_8)		IP1SR0_11_8	FM(IP2SR0_11_8)		IP2SR0_11_8	\
+FM(IP0SR0_15_12)	IP0SR0_15_12	FM(IP1SR0_15_12)	IP1SR0_15_12	FM(IP2SR0_15_12)	IP2SR0_15_12	\
+FM(IP0SR0_19_16)	IP0SR0_19_16	FM(IP1SR0_19_16)	IP1SR0_19_16	FM(IP2SR0_19_16)	IP2SR0_19_16	\
+FM(IP0SR0_23_20)	IP0SR0_23_20	FM(IP1SR0_23_20)	IP1SR0_23_20	FM(IP2SR0_23_20)	IP2SR0_23_20	\
+FM(IP0SR0_27_24)	IP0SR0_27_24	FM(IP1SR0_27_24)	IP1SR0_27_24	FM(IP2SR0_27_24)	IP2SR0_27_24	\
+FM(IP0SR0_31_28)	IP0SR0_31_28	FM(IP1SR0_31_28)	IP1SR0_31_28	FM(IP2SR0_31_28)	IP2SR0_31_28	\
+\
+FM(IP0SR1_3_0)		IP0SR1_3_0	\
+FM(IP0SR1_7_4)		IP0SR1_7_4	\
+FM(IP0SR1_11_8)		IP0SR1_11_8	\
+FM(IP0SR1_15_12)	IP0SR1_15_12	\
+FM(IP0SR1_19_16)	IP0SR1_19_16	\
+FM(IP0SR1_23_20)	IP0SR1_23_20	\
+FM(IP0SR1_27_24)	IP0SR1_27_24	\
+FM(IP0SR1_31_28)	IP0SR1_31_28
+
+/* MOD_SEL1 */			/* 0 */		/* 1 */		/* 2 */		/* 3 */
+#define MOD_SEL1_11_10		FM(SEL_I2C5_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C5_3)
+#define MOD_SEL1_9_8		FM(SEL_I2C4_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C4_3)
+#define MOD_SEL1_7_6		FM(SEL_I2C3_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C3_3)
+#define MOD_SEL1_5_4		FM(SEL_I2C2_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C2_3)
+#define MOD_SEL1_3_2		FM(SEL_I2C1_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C1_3)
+#define MOD_SEL1_1_0		FM(SEL_I2C0_0)	F_(0, 0)	F_(0, 0)	FM(SEL_I2C0_3)
+
+#define PINMUX_MOD_SELS \
+\
+MOD_SEL1_11_10 \
+MOD_SEL1_9_8 \
+MOD_SEL1_7_6 \
+MOD_SEL1_5_4 \
+MOD_SEL1_3_2 \
+MOD_SEL1_1_0
+
+#define PINMUX_PHYS \
+	FM(SCL0) FM(SDA0) FM(SCL1) FM(SDA1) FM(SCL2) FM(SDA2) FM(SCL3) FM(SDA3) \
+	FM(SCL4) FM(SDA4) FM(SCL5) FM(SDA5)
+
+enum {
+	PINMUX_RESERVED = 0,
+
+	PINMUX_DATA_BEGIN,
+	GP_ALL(DATA),
+	PINMUX_DATA_END,
+
+#define F_(x, y)
+#define FM(x)   FN_##x,
+	PINMUX_FUNCTION_BEGIN,
+	GP_ALL(FN),
+	PINMUX_GPSR
+	PINMUX_IPSR
+	PINMUX_MOD_SELS
+	PINMUX_FUNCTION_END,
+#undef F_
+#undef FM
+
+#define F_(x, y)
+#define FM(x)	x##_MARK,
+	PINMUX_MARK_BEGIN,
+	PINMUX_GPSR
+	PINMUX_IPSR
+	PINMUX_MOD_SELS
+	PINMUX_PHYS
+	PINMUX_MARK_END,
+#undef F_
+#undef FM
+};
+
+static const u16 pinmux_data[] = {
+	PINMUX_DATA_GP_ALL(),
+
+	PINMUX_SINGLE(SD_WP),
+	PINMUX_SINGLE(SD_CD),
+	PINMUX_SINGLE(MMC_SD_CMD),
+	PINMUX_SINGLE(MMC_D7),
+	PINMUX_SINGLE(MMC_DS),
+	PINMUX_SINGLE(MMC_D6),
+	PINMUX_SINGLE(MMC_D4),
+	PINMUX_SINGLE(MMC_D5),
+	PINMUX_SINGLE(MMC_SD_D3),
+	PINMUX_SINGLE(MMC_SD_D2),
+	PINMUX_SINGLE(MMC_SD_D1),
+	PINMUX_SINGLE(MMC_SD_D0),
+	PINMUX_SINGLE(MMC_SD_CLK),
+	PINMUX_SINGLE(PCIE1_CLKREQ_N),
+	PINMUX_SINGLE(PCIE0_CLKREQ_N),
+	PINMUX_SINGLE(QSPI0_IO3),
+	PINMUX_SINGLE(QSPI0_SSL),
+	PINMUX_SINGLE(QSPI0_MISO_IO1),
+	PINMUX_SINGLE(QSPI0_IO2),
+	PINMUX_SINGLE(QSPI0_SPCLK),
+	PINMUX_SINGLE(QSPI0_MOSI_IO0),
+	PINMUX_SINGLE(QSPI1_SPCLK),
+	PINMUX_SINGLE(QSPI1_MOSI_IO0),
+	PINMUX_SINGLE(QSPI1_IO2),
+	PINMUX_SINGLE(QSPI1_MISO_IO1),
+	PINMUX_SINGLE(QSPI1_IO3),
+	PINMUX_SINGLE(QSPI1_SSL),
+	PINMUX_SINGLE(RPC_RESET_N),
+	PINMUX_SINGLE(RPC_WP_N),
+	PINMUX_SINGLE(RPC_INT_N),
+
+	PINMUX_SINGLE(TSN0_AVTP_CAPTURE_B),
+	PINMUX_SINGLE(TSN0_AVTP_MATCH_B),
+	PINMUX_SINGLE(TSN0_AVTP_PPS),
+	PINMUX_SINGLE(TSN1_AVTP_CAPTURE_B),
+	PINMUX_SINGLE(TSN1_AVTP_MATCH_B),
+	PINMUX_SINGLE(TSN1_AVTP_PPS),
+	PINMUX_SINGLE(TSN0_MAGIC_B),
+	PINMUX_SINGLE(TSN1_PHY_INT_B),
+	PINMUX_SINGLE(TSN0_PHY_INT_B),
+	PINMUX_SINGLE(TSN2_PHY_INT_B),
+	PINMUX_SINGLE(TSN0_LINK_B),
+	PINMUX_SINGLE(TSN2_LINK_B),
+	PINMUX_SINGLE(TSN1_LINK_B),
+	PINMUX_SINGLE(TSN1_MDC_B),
+	PINMUX_SINGLE(TSN0_MDC_B),
+	PINMUX_SINGLE(TSN2_MDC_B),
+	PINMUX_SINGLE(TSN0_MDIO_B),
+	PINMUX_SINGLE(TSN2_MDIO_B),
+	PINMUX_SINGLE(TSN1_MDIO_B),
+
+	/* IP0SR0 */
+	PINMUX_IPSR_GPSR(IP0SR0_3_0,	SCIF_CLK),
+
+	PINMUX_IPSR_GPSR(IP0SR0_7_4,	HSCK0),
+	PINMUX_IPSR_GPSR(IP0SR0_7_4,	SCK3),
+	PINMUX_IPSR_GPSR(IP0SR0_7_4,	MSIOF3_SCK),
+	PINMUX_IPSR_GPSR(IP0SR0_7_4,	TSN0_AVTP_CAPTURE_A),
+
+	PINMUX_IPSR_GPSR(IP0SR0_11_8,	HRX0),
+	PINMUX_IPSR_GPSR(IP0SR0_11_8,	RX3),
+	PINMUX_IPSR_GPSR(IP0SR0_11_8,	MSIOF3_RXD),
+	PINMUX_IPSR_GPSR(IP0SR0_11_8,	TSN0_AVTP_MATCH_A),
+
+	PINMUX_IPSR_GPSR(IP0SR0_15_12,	HTX0),
+	PINMUX_IPSR_GPSR(IP0SR0_15_12,	TX3),
+	PINMUX_IPSR_GPSR(IP0SR0_15_12,	MSIOF3_TXD),
+
+	PINMUX_IPSR_GPSR(IP0SR0_19_16,	HCTS0_N),
+	PINMUX_IPSR_GPSR(IP0SR0_19_16,	CTS3_N),
+	PINMUX_IPSR_GPSR(IP0SR0_19_16,	MSIOF3_SS1),
+	PINMUX_IPSR_GPSR(IP0SR0_19_16,	TSN0_MDC_A),
+
+	PINMUX_IPSR_GPSR(IP0SR0_23_20,	HRTS0_N),
+	PINMUX_IPSR_GPSR(IP0SR0_23_20,	RTS3_N),
+	PINMUX_IPSR_GPSR(IP0SR0_23_20,	MSIOF3_SS2),
+	PINMUX_IPSR_GPSR(IP0SR0_23_20,	TSN0_MDIO_A),
+
+	PINMUX_IPSR_GPSR(IP0SR0_27_24,	RX0),
+	PINMUX_IPSR_GPSR(IP0SR0_27_24,	HRX1),
+	PINMUX_IPSR_GPSR(IP0SR0_27_24,	MSIOF1_RXD),
+	PINMUX_IPSR_GPSR(IP0SR0_27_24,	TSN1_AVTP_MATCH_A),
+
+	PINMUX_IPSR_GPSR(IP0SR0_31_28,	TX0),
+	PINMUX_IPSR_GPSR(IP0SR0_31_28,	HTX1),
+	PINMUX_IPSR_GPSR(IP0SR0_31_28,	MSIOF1_TXD),
+	PINMUX_IPSR_GPSR(IP0SR0_31_28,	TSN1_AVTP_CAPTURE_A),
+
+	/* IP1SR0 */
+	PINMUX_IPSR_GPSR(IP1SR0_3_0,	SCK0),
+	PINMUX_IPSR_GPSR(IP1SR0_3_0,	HSCK1),
+	PINMUX_IPSR_GPSR(IP1SR0_3_0,	MSIOF1_SCK),
+
+	PINMUX_IPSR_GPSR(IP1SR0_7_4,	RTS0_N),
+	PINMUX_IPSR_GPSR(IP1SR0_7_4,	HRTS1_N),
+	PINMUX_IPSR_GPSR(IP1SR0_7_4,	MSIOF3_SYNC),
+	PINMUX_IPSR_GPSR(IP1SR0_7_4,	TSN1_MDIO_A),
+
+	PINMUX_IPSR_GPSR(IP1SR0_11_8,	CTS0_N),
+	PINMUX_IPSR_GPSR(IP1SR0_11_8,	HCTS1_N),
+	PINMUX_IPSR_GPSR(IP1SR0_11_8,	MSIOF1_SYNC),
+	PINMUX_IPSR_GPSR(IP1SR0_11_8,	TSN1_MDC_A),
+
+	PINMUX_IPSR_GPSR(IP1SR0_15_12,	MSIOF0_SYNC),
+	PINMUX_IPSR_GPSR(IP1SR0_15_12,	HCTS3_N),
+	PINMUX_IPSR_GPSR(IP1SR0_15_12,	CTS1_N),
+	PINMUX_IPSR_GPSR(IP1SR0_15_12,	IRQ4),
+	PINMUX_IPSR_GPSR(IP1SR0_15_12,	TSN0_LINK_A),
+
+	PINMUX_IPSR_GPSR(IP1SR0_19_16,	MSIOF0_RXD),
+	PINMUX_IPSR_GPSR(IP1SR0_19_16,	HRX3),
+	PINMUX_IPSR_GPSR(IP1SR0_19_16,	RX1),
+
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	MSIOF0_TXD),
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	HTX3),
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	TX1),
+
+	PINMUX_IPSR_GPSR(IP1SR0_27_24,	MSIOF0_SCK),
+	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HSCK3),
+	PINMUX_IPSR_GPSR(IP1SR0_27_24,	SCK1),
+
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	MSIOF0_SS1),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	HRTS3_N),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	RTS1_N),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	IRQ5),
+	PINMUX_IPSR_GPSR(IP1SR0_31_28,	TSN1_LINK_A),
+
+	/* IP2SR0 */
+	PINMUX_IPSR_GPSR(IP2SR0_3_0,	MSIOF0_SS2),
+	PINMUX_IPSR_GPSR(IP2SR0_3_0,	TSN2_LINK_A),
+
+	PINMUX_IPSR_GPSR(IP2SR0_7_4,	IRQ0),
+	PINMUX_IPSR_GPSR(IP2SR0_7_4,	MSIOF1_SS1),
+	PINMUX_IPSR_GPSR(IP2SR0_7_4,	TSN0_MAGIC_A),
+
+	PINMUX_IPSR_GPSR(IP2SR0_11_8,	IRQ1),
+	PINMUX_IPSR_GPSR(IP2SR0_11_8,	MSIOF1_SS2),
+	PINMUX_IPSR_GPSR(IP2SR0_11_8,	TSN0_PHY_INT_A),
+
+	PINMUX_IPSR_GPSR(IP2SR0_15_12,	IRQ2),
+	PINMUX_IPSR_GPSR(IP2SR0_15_12,	TSN1_PHY_INT_A),
+
+	PINMUX_IPSR_GPSR(IP2SR0_19_16,	IRQ3),
+	PINMUX_IPSR_GPSR(IP2SR0_19_16,	TSN2_PHY_INT_A),
+
+	/* IP0SR1 */
+	/* GP1_00 = SCL0 */
+	PINMUX_IPSR_MSEL(IP0SR1_3_0,	GP1_00,		SEL_I2C0_0),
+	PINMUX_IPSR_MSEL(IP0SR1_3_0,	TCLK1,		SEL_I2C0_0),
+	PINMUX_IPSR_MSEL(IP0SR1_3_0,	HSCK2,		SEL_I2C0_0),
+	PINMUX_IPSR_PHYS(IP0SR1_3_0,	SCL0,		SEL_I2C0_3),
+
+	/* GP1_01 = SDA0 */
+	PINMUX_IPSR_MSEL(IP0SR1_7_4,	GP1_01,		SEL_I2C0_0),
+	PINMUX_IPSR_MSEL(IP0SR1_7_4,	TCLK4,		SEL_I2C0_0),
+	PINMUX_IPSR_MSEL(IP0SR1_7_4,	HRX2,		SEL_I2C0_0),
+	PINMUX_IPSR_PHYS(IP0SR1_7_4,	SDA0,		SEL_I2C0_3),
+
+	/* GP1_02 = SCL1 */
+	PINMUX_IPSR_MSEL(IP0SR1_11_8,	GP1_02,		SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_11_8,	HTX2,		SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_11_8,	MSIOF2_SS1,	SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_11_8,	TSN2_MDC_A,	SEL_I2C1_0),
+	PINMUX_IPSR_PHYS(IP0SR1_11_8,	SCL1,		SEL_I2C1_3),
+
+	/* GP1_03 = SDA1 */
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	GP1_03,		SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	TCLK2,		SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	HCTS2_N,	SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	MSIOF2_SS2,	SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	CTS4_N,		SEL_I2C1_0),
+	PINMUX_IPSR_MSEL(IP0SR1_15_12,	TSN2_MDIO_A,	SEL_I2C1_0),
+	PINMUX_IPSR_PHYS(IP0SR1_15_12,	SDA1,		SEL_I2C1_3),
+
+	/* GP1_04 = SCL2 */
+	PINMUX_IPSR_MSEL(IP0SR1_19_16,	GP1_04,		SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_19_16,	TCLK3,		SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_19_16,	HRTS2_N,	SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_19_16,	MSIOF2_SYNC,	SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_19_16,	RTS4_N,		SEL_I2C2_0),
+	PINMUX_IPSR_PHYS(IP0SR1_19_16,	SCL2,		SEL_I2C2_3),
+
+	/* GP1_05 = SDA2 */
+	PINMUX_IPSR_MSEL(IP0SR1_23_20,	GP1_05,		SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_23_20,	MSIOF2_SCK,	SEL_I2C2_0),
+	PINMUX_IPSR_MSEL(IP0SR1_23_20,	SCK4,		SEL_I2C2_0),
+	PINMUX_IPSR_PHYS(IP0SR1_23_20,	SDA2,		SEL_I2C2_3),
+
+	/* GP1_06 = SCL3 */
+	PINMUX_IPSR_MSEL(IP0SR1_27_24,	GP1_06,		SEL_I2C3_0),
+	PINMUX_IPSR_MSEL(IP0SR1_27_24,	MSIOF2_RXD,	SEL_I2C3_0),
+	PINMUX_IPSR_MSEL(IP0SR1_27_24,	RX4,		SEL_I2C3_0),
+	PINMUX_IPSR_PHYS(IP0SR1_27_24,	SCL3,		SEL_I2C3_3),
+
+	/* GP1_07 = SDA3 */
+	PINMUX_IPSR_MSEL(IP0SR1_31_28,	GP1_07,		SEL_I2C3_0),
+	PINMUX_IPSR_MSEL(IP0SR1_31_28,	MSIOF2_TXD,	SEL_I2C3_0),
+	PINMUX_IPSR_MSEL(IP0SR1_31_28,	TX4,		SEL_I2C3_0),
+	PINMUX_IPSR_PHYS(IP0SR1_31_28,	SDA3,		SEL_I2C3_3),
+
+	/* GP1_08 = SCL4 */
+	PINMUX_IPSR_NOGM(0,		GP1_08,		SEL_I2C4_0),
+	PINMUX_IPSR_NOFN(GP1_08,	SCL4,		SEL_I2C4_3),
+
+	/* GP1_09 = SDA4 */
+	PINMUX_IPSR_NOGM(0,		GP1_09,		SEL_I2C4_0),
+	PINMUX_IPSR_NOFN(GP1_09,	SDA4,		SEL_I2C4_3),
+
+	/* GP1_10 = SCL5 */
+	PINMUX_IPSR_NOGM(0,		GP1_10,		SEL_I2C5_0),
+	PINMUX_IPSR_NOFN(GP1_10,	SCL5,		SEL_I2C5_3),
+
+	/* GP1_11 = SDA5 */
+	PINMUX_IPSR_NOGM(0,		GP1_11,		SEL_I2C5_0),
+	PINMUX_IPSR_NOFN(GP1_11,	SDA5,		SEL_I2C5_3),
+};
+
+/*
+ * Pins not associated with a GPIO port.
+ */
+enum {
+	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
+
+static const struct sh_pfc_pin pinmux_pins[] = {
+	PINMUX_GPIO_GP_ALL(),
+};
+
+static const struct sh_pfc_pin_group pinmux_groups[] = {
+};
+
+static const struct sh_pfc_function pinmux_functions[] = {
+};
+
+static const struct pinmux_cfg_reg pinmux_config_regs[] = {
+#define F_(x, y)	FN_##y
+#define FM(x)		FN_##x
+	{ PINMUX_CFG_REG("GPSR0", 0xe6050040, 32, 1, GROUP(
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		GP_0_20_FN,	GPSR0_20,
+		GP_0_19_FN,	GPSR0_19,
+		GP_0_18_FN,	GPSR0_18,
+		GP_0_17_FN,	GPSR0_17,
+		GP_0_16_FN,	GPSR0_16,
+		GP_0_15_FN,	GPSR0_15,
+		GP_0_14_FN,	GPSR0_14,
+		GP_0_13_FN,	GPSR0_13,
+		GP_0_12_FN,	GPSR0_12,
+		GP_0_11_FN,	GPSR0_11,
+		GP_0_10_FN,	GPSR0_10,
+		GP_0_9_FN,	GPSR0_9,
+		GP_0_8_FN,	GPSR0_8,
+		GP_0_7_FN,	GPSR0_7,
+		GP_0_6_FN,	GPSR0_6,
+		GP_0_5_FN,	GPSR0_5,
+		GP_0_4_FN,	GPSR0_4,
+		GP_0_3_FN,	GPSR0_3,
+		GP_0_2_FN,	GPSR0_2,
+		GP_0_1_FN,	GPSR0_1,
+		GP_0_0_FN,	GPSR0_0, ))
+	},
+	{ PINMUX_CFG_REG("GPSR1", 0xe6050840, 32, 1, GROUP(
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		GP_1_24_FN,	GPSR1_24,
+		GP_1_23_FN,	GPSR1_23,
+		GP_1_22_FN,	GPSR1_22,
+		GP_1_21_FN,	GPSR1_21,
+		GP_1_20_FN,	GPSR1_20,
+		GP_1_19_FN,	GPSR1_19,
+		GP_1_18_FN,	GPSR1_18,
+		GP_1_17_FN,	GPSR1_17,
+		GP_1_16_FN,	GPSR1_16,
+		GP_1_15_FN,	GPSR1_15,
+		GP_1_14_FN,	GPSR1_14,
+		GP_1_13_FN,	GPSR1_13,
+		GP_1_12_FN,	GPSR1_12,
+		GP_1_11_FN,	GPSR1_11,
+		GP_1_10_FN,	GPSR1_10,
+		GP_1_9_FN,	GPSR1_9,
+		GP_1_8_FN,	GPSR1_8,
+		GP_1_7_FN,	GPSR1_7,
+		GP_1_6_FN,	GPSR1_6,
+		GP_1_5_FN,	GPSR1_5,
+		GP_1_4_FN,	GPSR1_4,
+		GP_1_3_FN,	GPSR1_3,
+		GP_1_2_FN,	GPSR1_2,
+		GP_1_1_FN,	GPSR1_1,
+		GP_1_0_FN,	GPSR1_0, ))
+	},
+	{ PINMUX_CFG_REG("GPSR2", 0xe6051040, 32, 1, GROUP(
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		GP_2_16_FN,	GPSR2_16,
+		GP_2_15_FN,	GPSR2_15,
+		GP_2_14_FN,	GPSR2_14,
+		GP_2_13_FN,	GPSR2_13,
+		GP_2_12_FN,	GPSR2_12,
+		GP_2_11_FN,	GPSR2_11,
+		GP_2_10_FN,	GPSR2_10,
+		GP_2_9_FN,	GPSR2_9,
+		GP_2_8_FN,	GPSR2_8,
+		GP_2_7_FN,	GPSR2_7,
+		GP_2_6_FN,	GPSR2_6,
+		GP_2_5_FN,	GPSR2_5,
+		GP_2_4_FN,	GPSR2_4,
+		GP_2_3_FN,	GPSR2_3,
+		GP_2_2_FN,	GPSR2_2,
+		GP_2_1_FN,	GPSR2_1,
+		GP_2_0_FN,	GPSR2_0, ))
+	},
+	{ PINMUX_CFG_REG("GPSR3", 0xe6051840, 32, 1, GROUP(
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		0, 0,
+		GP_3_18_FN,	GPSR3_18,
+		GP_3_17_FN,	GPSR3_17,
+		GP_3_16_FN,	GPSR3_16,
+		GP_3_15_FN,	GPSR3_15,
+		GP_3_14_FN,	GPSR3_14,
+		GP_3_13_FN,	GPSR3_13,
+		GP_3_12_FN,	GPSR3_12,
+		GP_3_11_FN,	GPSR3_11,
+		GP_3_10_FN,	GPSR3_10,
+		GP_3_9_FN,	GPSR3_9,
+		GP_3_8_FN,	GPSR3_8,
+		GP_3_7_FN,	GPSR3_7,
+		GP_3_6_FN,	GPSR3_6,
+		GP_3_5_FN,	GPSR3_5,
+		GP_3_4_FN,	GPSR3_4,
+		GP_3_3_FN,	GPSR3_3,
+		GP_3_2_FN,	GPSR3_2,
+		GP_3_1_FN,	GPSR3_1,
+		GP_3_0_FN,	GPSR3_0, ))
+	},
+#undef F_
+#undef FM
+
+#define F_(x, y)	x,
+#define FM(x)		FN_##x,
+	{ PINMUX_CFG_REG("IP0SR0", 0xe6050060, 32, 4, GROUP(
+		IP0SR0_31_28
+		IP0SR0_27_24
+		IP0SR0_23_20
+		IP0SR0_19_16
+		IP0SR0_15_12
+		IP0SR0_11_8
+		IP0SR0_7_4
+		IP0SR0_3_0))
+	},
+	{ PINMUX_CFG_REG("IP1SR0", 0xe6050064, 32, 4, GROUP(
+		IP1SR0_31_28
+		IP1SR0_27_24
+		IP1SR0_23_20
+		IP1SR0_19_16
+		IP1SR0_15_12
+		IP1SR0_11_8
+		IP1SR0_7_4
+		IP1SR0_3_0))
+	},
+	{ PINMUX_CFG_REG("IP2SR0", 0xe6050068, 32, 4, GROUP(
+		IP2SR0_31_28
+		IP2SR0_27_24
+		IP2SR0_23_20
+		IP2SR0_19_16
+		IP2SR0_15_12
+		IP2SR0_11_8
+		IP2SR0_7_4
+		IP2SR0_3_0))
+	},
+	{ PINMUX_CFG_REG("IP0SR1", 0xe6050860, 32, 4, GROUP(
+		IP0SR1_31_28
+		IP0SR1_27_24
+		IP0SR1_23_20
+		IP0SR1_19_16
+		IP0SR1_15_12
+		IP0SR1_11_8
+		IP0SR1_7_4
+		IP0SR1_3_0))
+	},
+#undef F_
+#undef FM
+
+#define F_(x, y)	x,
+#define FM(x)		FN_##x,
+	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6050900, 32,
+			     GROUP(4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED 31, 30, 29, 28 */
+		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED 27, 26, 25, 24 */
+		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED 23, 22, 21, 20 */
+		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED 19, 18, 17, 16 */
+		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED 15, 14, 13, 12 */
+		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		MOD_SEL1_11_10
+		MOD_SEL1_9_8
+		MOD_SEL1_7_6
+		MOD_SEL1_5_4
+		MOD_SEL1_3_2
+		MOD_SEL1_1_0))
+	},
+	{ /* sentinel */ },
+};
+
+static const struct pinmux_drive_reg pinmux_drive_regs[] = {
+	{ PINMUX_DRIVE_REG("DRV0CTRL0", 0xe6050080) {
+		{ RCAR_GP_PIN(0,  7), 28, 3 },	/* TX0 */
+		{ RCAR_GP_PIN(0,  6), 24, 3 },	/* RX0 */
+		{ RCAR_GP_PIN(0,  5), 20, 3 },	/* HRTS0_N */
+		{ RCAR_GP_PIN(0,  4), 16, 3 },	/* HCTS0_N */
+		{ RCAR_GP_PIN(0,  3), 12, 3 },	/* HTX0 */
+		{ RCAR_GP_PIN(0,  2),  8, 3 },	/* HRX0 */
+		{ RCAR_GP_PIN(0,  1),  4, 3 },	/* HSCK0 */
+		{ RCAR_GP_PIN(0,  0),  0, 3 },	/* SCIF_CLK */
+	} },
+	{ PINMUX_DRIVE_REG("DRV1CTRL0", 0xe6050084) {
+		{ RCAR_GP_PIN(0, 15), 28, 3 },	/* MSIOF0_SS1 */
+		{ RCAR_GP_PIN(0, 14), 24, 3 },	/* MSIOF0_SCK */
+		{ RCAR_GP_PIN(0, 13), 20, 3 },	/* MSIOF0_TXD */
+		{ RCAR_GP_PIN(0, 12), 16, 3 },	/* MSIOF0_RXD */
+		{ RCAR_GP_PIN(0, 11), 12, 3 },	/* MSIOF0_SYNC */
+		{ RCAR_GP_PIN(0, 10),  8, 3 },	/* CTS0_N */
+		{ RCAR_GP_PIN(0,  9),  4, 3 },	/* RTS0_N */
+		{ RCAR_GP_PIN(0,  8),  0, 3 },	/* SCK0 */
+	} },
+	{ PINMUX_DRIVE_REG("DRV2CTRL0", 0xe6050088) {
+		{ RCAR_GP_PIN(0, 20), 16, 3 },	/* IRQ3 */
+		{ RCAR_GP_PIN(0, 19), 12, 3 },	/* IRQ2 */
+		{ RCAR_GP_PIN(0, 18),  8, 3 },	/* IRQ1 */
+		{ RCAR_GP_PIN(0, 17),  4, 3 },	/* IRQ0 */
+		{ RCAR_GP_PIN(0, 16),  0, 3 },	/* MSIOF0_SS2 */
+	} },
+	{ PINMUX_DRIVE_REG("DRV0CTRL1", 0xe6050880) {
+		{ RCAR_GP_PIN(1,  7), 28, 3 },	/* GP1_07 */
+		{ RCAR_GP_PIN(1,  6), 24, 3 },	/* GP1_06 */
+		{ RCAR_GP_PIN(1,  5), 20, 3 },	/* GP1_05 */
+		{ RCAR_GP_PIN(1,  4), 16, 3 },	/* GP1_04 */
+		{ RCAR_GP_PIN(1,  3), 12, 3 },	/* GP1_03 */
+		{ RCAR_GP_PIN(1,  2),  8, 3 },	/* GP1_02 */
+		{ RCAR_GP_PIN(1,  1),  4, 3 },	/* GP1_01 */
+		{ RCAR_GP_PIN(1,  0),  0, 3 },	/* GP1_00 */
+	} },
+	{ PINMUX_DRIVE_REG("DRV1CTRL1", 0xe6050884) {
+		{ RCAR_GP_PIN(1, 15), 28, 3 },	/* MMC_SD_D2 */
+		{ RCAR_GP_PIN(1, 14), 24, 3 },	/* MMC_SD_D1 */
+		{ RCAR_GP_PIN(1, 13), 20, 3 },	/* MMC_SD_D0 */
+		{ RCAR_GP_PIN(1, 12), 16, 3 },	/* MMC_SD_CLK */
+		{ RCAR_GP_PIN(1, 11), 12, 3 },	/* GP1_11 */
+		{ RCAR_GP_PIN(1, 10),  8, 3 },	/* GP1_10 */
+		{ RCAR_GP_PIN(1,  9),  4, 3 },	/* GP1_09 */
+		{ RCAR_GP_PIN(1,  8),  0, 3 },	/* GP1_08 */
+	} },
+	{ PINMUX_DRIVE_REG("DRV2CTRL1", 0xe6050888) {
+		{ RCAR_GP_PIN(1, 23), 28, 3 },	/* SD_CD */
+		{ RCAR_GP_PIN(1, 22), 24, 3 },	/* MMC_SD_CMD */
+		{ RCAR_GP_PIN(1, 21), 20, 3 },	/* MMC_D7 */
+		{ RCAR_GP_PIN(1, 20), 16, 3 },	/* MMC_DS */
+		{ RCAR_GP_PIN(1, 19), 12, 3 },	/* MMC_D6 */
+		{ RCAR_GP_PIN(1, 18),  8, 3 },	/* MMC_D4 */
+		{ RCAR_GP_PIN(1, 17),  4, 3 },	/* MMC_D5 */
+		{ RCAR_GP_PIN(1, 16),  0, 3 },	/* MMC_SD_D3 */
+	} },
+	{ PINMUX_DRIVE_REG("DRV3CTRL1", 0xe605088c) {
+		{ RCAR_GP_PIN(1, 24),  0, 3 },	/* SD_WP */
+	} },
+	{ PINMUX_DRIVE_REG("DRV0CTRL2", 0xe6051080) {
+		{ RCAR_GP_PIN(2,  7), 28, 2 },	/* QSPI1_MOSI_IO0 */
+		{ RCAR_GP_PIN(2,  6), 24, 2 },	/* QSPI1_IO2 */
+		{ RCAR_GP_PIN(2,  5), 20, 2 },	/* QSPI1_MISO_IO1 */
+		{ RCAR_GP_PIN(2,  4), 16, 2 },	/* QSPI1_IO3 */
+		{ RCAR_GP_PIN(2,  3), 12, 2 },	/* QSPI1_SSL */
+		{ RCAR_GP_PIN(2,  2),  8, 2 },	/* RPC_RESET_N */
+		{ RCAR_GP_PIN(2,  1),  4, 2 },	/* RPC_WP_N */
+		{ RCAR_GP_PIN(2,  0),  0, 2 },	/* RPC_INT_N */
+	} },
+	{ PINMUX_DRIVE_REG("DRV1CTRL2", 0xe6051084) {
+		{ RCAR_GP_PIN(2, 15), 28, 3 },	/* PCIE0_CLKREQ_N */
+		{ RCAR_GP_PIN(2, 14), 24, 2 },	/* QSPI0_IO3 */
+		{ RCAR_GP_PIN(2, 13), 20, 2 },	/* QSPI0_SSL */
+		{ RCAR_GP_PIN(2, 12), 16, 2 },	/* QSPI0_MISO_IO1 */
+		{ RCAR_GP_PIN(2, 11), 12, 2 },	/* QSPI0_IO2 */
+		{ RCAR_GP_PIN(2, 10),  8, 2 },	/* QSPI0_SPCLK */
+		{ RCAR_GP_PIN(2,  9),  4, 2 },	/* QSPI0_MOSI_IO0 */
+		{ RCAR_GP_PIN(2,  8),  0, 2 },	/* QSPI1_SPCLK */
+	} },
+	{ PINMUX_DRIVE_REG("DRV2CTRL2", 0xe6051088) {
+		{ RCAR_GP_PIN(2, 16),  0, 3 },	/* PCIE1_CLKREQ_N */
+	} },
+	{ PINMUX_DRIVE_REG("DRV0CTRL3", 0xe6051880) {
+		{ RCAR_GP_PIN(3,  7), 28, 3 },	/* TSN2_LINK_B */
+		{ RCAR_GP_PIN(3,  6), 24, 3 },	/* TSN1_LINK_B */
+		{ RCAR_GP_PIN(3,  5), 20, 3 },	/* TSN1_MDC_B */
+		{ RCAR_GP_PIN(3,  4), 16, 3 },	/* TSN0_MDC_B */
+		{ RCAR_GP_PIN(3,  3), 12, 3 },	/* TSN2_MDC_B */
+		{ RCAR_GP_PIN(3,  2),  8, 3 },	/* TSN0_MDIO_B */
+		{ RCAR_GP_PIN(3,  1),  4, 3 },	/* TSN2_MDIO_B */
+		{ RCAR_GP_PIN(3,  0),  0, 3 },	/* TSN1_MDIO_B */
+	} },
+	{ PINMUX_DRIVE_REG("DRV1CTRL3", 0xe6051884) {
+		{ RCAR_GP_PIN(3, 15), 28, 3 },	/* TSN1_AVTP_CAPTURE_B */
+		{ RCAR_GP_PIN(3, 14), 24, 3 },	/* TSN1_AVTP_MATCH_B */
+		{ RCAR_GP_PIN(3, 13), 20, 3 },	/* TSN1_AVTP_PPS */
+		{ RCAR_GP_PIN(3, 12), 16, 3 },	/* TSN0_MAGIC_B */
+		{ RCAR_GP_PIN(3, 11), 12, 3 },	/* TSN1_PHY_INT_B */
+		{ RCAR_GP_PIN(3, 10),  8, 3 },	/* TSN0_PHY_INT_B */
+		{ RCAR_GP_PIN(3,  9),  4, 3 },	/* TSN2_PHY_INT_B */
+		{ RCAR_GP_PIN(3,  8),  0, 3 },	/* TSN0_LINK_B */
+	} },
+	{ PINMUX_DRIVE_REG("DRV2CTRL3", 0xe6051888) {
+		{ RCAR_GP_PIN(3, 18),  8, 3 },	/* TSN0_AVTP_CAPTURE_B */
+		{ RCAR_GP_PIN(3, 17),  4, 3 },	/* TSN0_AVTP_MATCH_B */
+		{ RCAR_GP_PIN(3, 16),  0, 3 },	/* TSN0_AVTP_PPS */
+	} },
+	{ /* sentinel */ },
+};
+
+enum ioctrl_regs {
+	POC0,
+	POC1,
+	POC2,
+	POC3,
+	TD0SEL1,
+};
+
+static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
+	[POC0] = { 0xe60500a0, },
+	[POC1] = { 0xe60508a0, },
+	[POC2] = { 0xe60510a0, },
+	[POC3] = { 0xe60518a0, },
+	[TD0SEL1] = { 0xe6058120, },
+	{ /* sentinel */ },
+};
+
+static int r8a779f0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
+{
+	int bit = pin & 0x1f;
+
+	*pocctrl = pinmux_ioctrl_regs[POC0].reg;
+	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 20))
+		return bit;
+
+	*pocctrl = pinmux_ioctrl_regs[POC1].reg;
+	if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 24))
+		return bit;
+
+	*pocctrl = pinmux_ioctrl_regs[POC3].reg;
+	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 18))
+		return bit;
+
+	return -EINVAL;
+}
+
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUEN0", 0xe60500c0, "PUD0", 0xe60500e0) {
+		[ 0] = RCAR_GP_PIN(0,  0),	/* SCIF_CLK */
+		[ 1] = RCAR_GP_PIN(0,  1),	/* HSCK0 */
+		[ 2] = RCAR_GP_PIN(0,  2),	/* HRX0 */
+		[ 3] = RCAR_GP_PIN(0,  3),	/* HTX0 */
+		[ 4] = RCAR_GP_PIN(0,  4),	/* HCTS0_N */
+		[ 5] = RCAR_GP_PIN(0,  5),	/* HRTS0_N */
+		[ 6] = RCAR_GP_PIN(0,  6),	/* RX0 */
+		[ 7] = RCAR_GP_PIN(0,  7),	/* TX0 */
+		[ 8] = RCAR_GP_PIN(0,  8),	/* SCK0 */
+		[ 9] = RCAR_GP_PIN(0,  9),	/* RTS0_N */
+		[10] = RCAR_GP_PIN(0, 10),	/* CTS0_N */
+		[11] = RCAR_GP_PIN(0, 11),	/* MSIOF0_SYNC */
+		[12] = RCAR_GP_PIN(0, 12),	/* MSIOF0_RXD */
+		[13] = RCAR_GP_PIN(0, 13),	/* MSIOF0_TXD */
+		[14] = RCAR_GP_PIN(0, 14),	/* MSIOF0_SCK */
+		[15] = RCAR_GP_PIN(0, 15),	/* MSIOF0_SS1 */
+		[16] = RCAR_GP_PIN(0, 16),	/* MSIOF0_SS2 */
+		[17] = RCAR_GP_PIN(0, 17),	/* IRQ0 */
+		[18] = RCAR_GP_PIN(0, 18),	/* IRQ1 */
+		[19] = RCAR_GP_PIN(0, 19),	/* IRQ2 */
+		[20] = RCAR_GP_PIN(0, 20),	/* IRQ3 */
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUEN1", 0xe60508c0, "PUD1", 0xe60508e0) {
+		[ 0] = RCAR_GP_PIN(1,  0),	/* GP1_00 */
+		[ 1] = RCAR_GP_PIN(1,  1),	/* GP1_01 */
+		[ 2] = RCAR_GP_PIN(1,  2),	/* GP1_02 */
+		[ 3] = RCAR_GP_PIN(1,  3),	/* GP1_03 */
+		[ 4] = RCAR_GP_PIN(1,  4),	/* GP1_04 */
+		[ 5] = RCAR_GP_PIN(1,  5),	/* GP1_05 */
+		[ 6] = RCAR_GP_PIN(1,  6),	/* GP1_06 */
+		[ 7] = RCAR_GP_PIN(1,  7),	/* GP1_07 */
+		[ 8] = RCAR_GP_PIN(1,  8),	/* GP1_08 */
+		[ 9] = RCAR_GP_PIN(1,  9),	/* GP1_09 */
+		[10] = RCAR_GP_PIN(1, 10),	/* GP1_10 */
+		[11] = RCAR_GP_PIN(1, 11),	/* GP1_11 */
+		[12] = RCAR_GP_PIN(1, 12),	/* MMC_SD_CLK */
+		[13] = RCAR_GP_PIN(1, 13),	/* MMC_SD_D0 */
+		[14] = RCAR_GP_PIN(1, 14),	/* MMC_SD_D1 */
+		[15] = RCAR_GP_PIN(1, 15),	/* MMC_SD_D2 */
+		[16] = RCAR_GP_PIN(1, 16),	/* MMC_SD_D3 */
+		[17] = RCAR_GP_PIN(1, 17),	/* MMC_D5 */
+		[18] = RCAR_GP_PIN(1, 18),	/* MMC_D4 */
+		[19] = RCAR_GP_PIN(1, 19),	/* MMC_D6 */
+		[20] = RCAR_GP_PIN(1, 20),	/* MMC_DS */
+		[21] = RCAR_GP_PIN(1, 21),	/* MMC_D7 */
+		[22] = RCAR_GP_PIN(1, 22),	/* MMC_SD_CMD */
+		[23] = RCAR_GP_PIN(1, 23),	/* SD_CD */
+		[24] = RCAR_GP_PIN(1, 24),	/* SD_WP */
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUEN2", 0xe60510c0, "PUD2", 0xe60510e0) {
+		[ 0] = RCAR_GP_PIN(2,  0),	/* RPC_INT_N */
+		[ 1] = RCAR_GP_PIN(2,  1),	/* RPC_WP_N */
+		[ 2] = RCAR_GP_PIN(2,  2),	/* RPC_RESET_N */
+		[ 3] = RCAR_GP_PIN(2,  3),	/* QSPI1_SSL */
+		[ 4] = RCAR_GP_PIN(2,  4),	/* QSPI1_IO3 */
+		[ 5] = RCAR_GP_PIN(2,  5),	/* QSPI1_MISO_IO1 */
+		[ 6] = RCAR_GP_PIN(2,  6),	/* QSPI1_IO2 */
+		[ 7] = RCAR_GP_PIN(2,  7),	/* QSPI1_MOSI_IO0 */
+		[ 8] = RCAR_GP_PIN(2,  8),	/* QSPI1_SPCLK */
+		[ 9] = RCAR_GP_PIN(2,  9),	/* QSPI0_MOSI_IO0 */
+		[10] = RCAR_GP_PIN(2, 10),	/* QSPI0_SPCLK */
+		[11] = RCAR_GP_PIN(2, 11),	/* QSPI0_IO2 */
+		[12] = RCAR_GP_PIN(2, 12),	/* QSPI0_MISO_IO1 */
+		[13] = RCAR_GP_PIN(2, 13),	/* QSPI0_SSL */
+		[14] = RCAR_GP_PIN(2, 14),	/* QSPI0_IO3 */
+		[15] = RCAR_GP_PIN(2, 15),	/* PCIE0_CLKREQ_N */
+		[16] = RCAR_GP_PIN(2, 16),	/* PCIE1_CLKREQ_N */
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUEN3", 0xe60518c0, "PUD3", 0xe60518e0) {
+		[ 0] = RCAR_GP_PIN(3,  0),	/* TSN1_MDIO_B */
+		[ 1] = RCAR_GP_PIN(3,  1),	/* TSN2_MDIO_B */
+		[ 2] = RCAR_GP_PIN(3,  2),	/* TSN0_MDIO_B */
+		[ 3] = RCAR_GP_PIN(3,  3),	/* TSN2_MDC_B */
+		[ 4] = RCAR_GP_PIN(3,  4),	/* TSN0_MDC_B */
+		[ 5] = RCAR_GP_PIN(3,  5),	/* TSN1_MDC_B */
+		[ 6] = RCAR_GP_PIN(3,  6),	/* TSN1_LINK_B */
+		[ 7] = RCAR_GP_PIN(3,  7),	/* TSN2_LINK_B */
+		[ 8] = RCAR_GP_PIN(3,  8),	/* TSN0_LINK_B */
+		[ 9] = RCAR_GP_PIN(3,  9),	/* TSN2_PHY_INT_B */
+		[10] = RCAR_GP_PIN(3, 10),	/* TSN0_PHY_INT_B */
+		[11] = RCAR_GP_PIN(3, 11),	/* TSN1_PHY_INT_B */
+		[12] = RCAR_GP_PIN(3, 12),	/* TSN0_MAGIC_B */
+		[13] = RCAR_GP_PIN(3, 13),	/* TSN1_AVTP_PPS */
+		[14] = RCAR_GP_PIN(3, 14),	/* TSN1_AVTP_MATCH_B */
+		[15] = RCAR_GP_PIN(3, 15),	/* TSN1_AVTP_CAPTURE_B */
+		[16] = RCAR_GP_PIN(3, 16),	/* TSN0_AVTP_PPS */
+		[17] = RCAR_GP_PIN(3, 17),	/* TSN0_AVTP_MATCH_B */
+		[18] = RCAR_GP_PIN(3, 18),	/* TSN0_AVTP_CAPTURE_B */
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ /* sentinel */ },
+};
+
+static const struct sh_pfc_soc_operations r8a779f0_pfc_ops = {
+	.pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
+};
+
+const struct sh_pfc_soc_info r8a779f0_pinmux_info = {
+	.name = "r8a779f0_pfc",
+	.ops = &r8a779f0_pfc_ops,
+	.unlock_reg = 0x1ff,	/* PMMRn mask */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups,
+	.nr_groups = ARRAY_SIZE(pinmux_groups),
+	.functions = pinmux_functions,
+	.nr_functions = ARRAY_SIZE(pinmux_functions),
+
+	.cfg_regs = pinmux_config_regs,
+	.drive_regs = pinmux_drive_regs,
+	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 2932c8d4e993509f..6b5836ea47de224c 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -324,6 +324,7 @@ extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77990_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77995_pinmux_info;
 extern const struct sh_pfc_soc_info r8a779a0_pinmux_info;
+extern const struct sh_pfc_soc_info r8a779f0_pinmux_info;
 extern const struct sh_pfc_soc_info sh7203_pinmux_info;
 extern const struct sh_pfc_soc_info sh7264_pinmux_info;
 extern const struct sh_pfc_soc_info sh7269_pinmux_info;
-- 
2.25.1

