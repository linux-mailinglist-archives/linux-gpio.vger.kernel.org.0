Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8C34EF973
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 20:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244302AbiDASE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 14:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243382AbiDASE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 14:04:28 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C380238AF;
        Fri,  1 Apr 2022 11:02:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,228,1643641200"; 
   d="scan'208";a="116461059"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 03:02:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3C4CF40C92BC;
        Sat,  2 Apr 2022 03:02:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Add RZ/G2UL support
Date:   Fri,  1 Apr 2022 19:02:30 +0100
Message-Id: <20220401180230.19950-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/G2UL SoC has fewer pins compared to RZ/G2L and the port pin
definitions are different compared to RZ/G2L.

This patch adds a new compatible to take care of this differences
by adding r9a07g043_data with r9a07g043_gpio_configs and
rzg2l_dedicated_pins.common.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Moved QSPI_INT# pin from common to rzg2l_pins
 * Added Rb tag from Geert.
---
 drivers/pinctrl/renesas/Kconfig         |   5 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 200 ++++++++++++++----------
 2 files changed, 124 insertions(+), 81 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index c0c740e660b8..1fbf143712fc 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -37,6 +37,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A77990 if ARCH_R8A77990
 	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
 	select PINCTRL_PFC_R8A779A0 if ARCH_R8A779A0
+	select PINCTRL_RZG2L if ARCH_R9A07G043
 	select PINCTRL_RZG2L if ARCH_R9A07G044
 	select PINCTRL_RZG2L if ARCH_R9A07G054
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
@@ -179,14 +180,14 @@ config PINCTRL_RZA2
 	  This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
 
 config PINCTRL_RZG2L
-	bool "pin control support for RZ/{G2L,V2L}" if COMPILE_TEST
+	bool "pin control support for RZ/{G2L,G2UL,V2L}" if COMPILE_TEST
 	depends on OF
 	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
-	  This selects GPIO and pinctrl driver for Renesas RZ/{G2L,V2L}
+	  This selects GPIO and pinctrl driver for Renesas RZ/{G2L,G2UL,V2L}
 	  platforms.
 
 config PINCTRL_PFC_R8A77470
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cb805502fb0f..86a7096640ad 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -996,83 +996,112 @@ static const u32 rzg2l_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(5, 0x40, RZG2L_MPXED_PIN_FUNCS),
 };
 
-static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
-	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
-	 (PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL)) },
-	{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
-	 (PIN_CFG_SR | PIN_CFG_IOLH_A | PIN_CFG_IEN)) },
-	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
-	 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
-	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
-	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN) },
-	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x6, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x7, 7,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
-	{ "SD1_CLK", RZG2L_SINGLE_PIN_PACK(0x8, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD1)) },
-	{ "SD1_CMD", RZG2L_SINGLE_PIN_PACK(0x8, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
-	{ "SD1_DATA0", RZG2L_SINGLE_PIN_PACK(0x9, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
-	{ "SD1_DATA1", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
-	{ "SD1_DATA2", RZG2L_SINGLE_PIN_PACK(0x9, 2,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
-	{ "SD1_DATA3", RZG2L_SINGLE_PIN_PACK(0x9, 3,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
-	{ "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
-	 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
-	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH_A | PIN_CFG_SR)) },
-	{ "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
-	{ "RIIC0_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 1, PIN_CFG_IEN) },
-	{ "RIIC1_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 2, PIN_CFG_IEN) },
-	{ "RIIC1_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 3, PIN_CFG_IEN) },
+static const u32 r9a07g043_gpio_configs[] = {
+	RZG2L_GPIO_PORT_PACK(4, 0x10, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(4, 0x12, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(4, 0x13, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(6, 0x14, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(5, 0x15, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(5, 0x16, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(5, 0x17, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(5, 0x18, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(4, 0x19, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(5, 0x1a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(4, 0x1b, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(2, 0x1c, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(5, 0x1d, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(3, 0x1e, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(4, 0x1f, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(4, 0x21, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
+};
+
+static struct {
+	struct rzg2l_dedicated_configs common[35];
+	struct rzg2l_dedicated_configs rzg2l_pins[7];
+} rzg2l_dedicated_pins = {
+	.common = {
+		{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
+		 (PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL)) },
+		{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
+		 (PIN_CFG_SR | PIN_CFG_IOLH_A | PIN_CFG_IEN)) },
+		{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
+		 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
+		{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
+		{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN) },
+		{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x6, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x7, 7,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD0)) },
+		{ "SD1_CLK", RZG2L_SINGLE_PIN_PACK(0x8, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_SD1)) },
+		{ "SD1_CMD", RZG2L_SINGLE_PIN_PACK(0x8, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+		{ "SD1_DATA0", RZG2L_SINGLE_PIN_PACK(0x9, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+		{ "SD1_DATA1", RZG2L_SINGLE_PIN_PACK(0x9, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+		{ "SD1_DATA2", RZG2L_SINGLE_PIN_PACK(0x9, 2,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+		{ "SD1_DATA3", RZG2L_SINGLE_PIN_PACK(0x9, 3,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1)) },
+		{ "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH_A | PIN_CFG_SR)) },
+		{ "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
+		{ "RIIC0_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 1, PIN_CFG_IEN) },
+		{ "RIIC1_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 2, PIN_CFG_IEN) },
+		{ "RIIC1_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 3, PIN_CFG_IEN) },
+	},
+	.rzg2l_pins = {
+		{ "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
+		{ "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
+		 (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
+	}
 };
 
 static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
@@ -1250,15 +1279,28 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct rzg2l_pinctrl_data r9a07g043_data = {
+	.port_pins = rzg2l_gpio_names,
+	.port_pin_configs = r9a07g043_gpio_configs,
+	.dedicated_pins = rzg2l_dedicated_pins.common,
+	.n_port_pins = ARRAY_SIZE(r9a07g043_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common),
+};
+
 static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.port_pins = rzg2l_gpio_names,
 	.port_pin_configs = rzg2l_gpio_configs,
-	.dedicated_pins = rzg2l_dedicated_pins,
+	.dedicated_pins = rzg2l_dedicated_pins.common,
 	.n_port_pins = ARRAY_SIZE(rzg2l_gpio_names),
-	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins),
+	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common) +
+		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
+	{
+		.compatible = "renesas,r9a07g043-pinctrl",
+		.data = &r9a07g043_data,
+	},
 	{
 		.compatible = "renesas,r9a07g044-pinctrl",
 		.data = &r9a07g044_data,
-- 
2.17.1

