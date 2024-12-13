Return-Path: <linux-gpio+bounces-13879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35C9F1400
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 041FF16928B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F431E572F;
	Fri, 13 Dec 2024 17:39:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCAD17B505;
	Fri, 13 Dec 2024 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111574; cv=none; b=dfNf5z3ng+J56zSIErKPVFg1PecjMlQmc3kZ92/m9xWiIesbTxzZ7GQH5bMj3FZ6LC0lT8AyZYtuy6prJcU7qIuWEu2SDU0gNz0vzXuyLELUaZ24Da20Lf+FvjsVSCoXde6dJzyMvILz3TOSP/89XeZNYdKaoVbtxb9VV2+qzKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111574; c=relaxed/simple;
	bh=CjCmZBmNLqXF9l6SabDGRULfRVIhHaPzM7BYTEJqFrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aN9IhZ2elgPaIHJWWaP/8vyDowbxcir/J0Ps1CsW5x5W8E7cJ2F9CSNPnZVPgH5qDIu21v5VwqssYIimpROqXQcOZr9frczIDLcx/1ioH+AddYuaU9RG4QXlR/lQmTUGI+9a+N+QmD+cqZIbMM5f4zTDv+8sIfRA8DKNmOpdqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ReSZc+GBSACs14fK6m0NUA==
X-CSE-MsgGUID: LKRl6F/WQ1Gv23jPvqFgqg==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231774199"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D6F8A4004BB9;
	Sat, 14 Dec 2024 02:39:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
Date: Fri, 13 Dec 2024 17:38:50 +0000
Message-ID: <20241213173901.599226-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl driver support for RZ/G3E SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced RZG3E_* macro with generic PORT_* macro.
 * Added ports based on hardware indices.
 * Replaced macros WDTUDF_CA->WDTUDFCA and WDTUDF_CM->WDTUDFCM.
 * Replaced macro QSD0_*->SD0*.
v1->v2:
 * No change.
---
 drivers/pinctrl/renesas/Kconfig         |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 172 ++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 7f3f41c7fe54..3c18d908b21e 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -41,6 +41,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A779H0 if ARCH_R8A779H0
 	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_RZV2M if ARCH_R9A09G011
+	select PINCTRL_RZG2L if ARCH_R9A09G047
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 67d776feb42d..5870ddbe78f9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -381,6 +381,44 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static const u64 r9a09g047_variable_pin_cfg[] = {
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 1, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PA, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 1, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PD, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 3, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 5, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PG, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 3, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PH, 5, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PJ, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PJ, 1, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PJ, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PJ, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PJ, 4, RZV2H_MPXED_PIN_FUNCS),
+};
+
 static const u64 r9a09g057_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PB, 0, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(PORT_PB, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
@@ -1962,6 +2000,73 @@ static const u64 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(6, 0x2a, RZG3S_MPXED_PIN_FUNCS(A)),			/* P18 */
 };
 
+static const char * const rzg3e_gpio_names[] = {
+	"P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
+	"P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
+	"P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
+	"P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
+	"P40", "P41", "P42", "P43", "P44", "P45", "P46", "P47",
+	"P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
+	"P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
+	"P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
+	"P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
+	"P90", "P91", "P92", "P93", "P94", "P95", "P96", "P97",
+	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
+	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
+	"PC0", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7",
+	"PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+	"PE0", "PE1", "PE2", "PE3", "PE4", "PE5", "PE6", "PE7",
+	"PF0", "PF1", "PF2", "PF3", "PF4", "PF5", "PF6", "PF7",
+	"PG0", "PG1", "PG2", "PG3", "PG4", "PG5", "PG6", "PG7",
+	"PH0", "PH1", "PH2", "PH3", "PH4", "PH5", "PH6", "PH7",
+	"PI0", "PI1", "PI2", "PI3", "PI4", "PI5", "PI6", "PI7",
+	"PJ0", "PJ1", "PJ2", "PJ3", "PJ4", "PJ5", "PJ6", "PJ7",
+	"PK0", "PK1", "PK2", "PK3", "PK4", "PK5", "PK6", "PK7",
+	"PL0", "PL1", "PL2", "PL3", "PL4", "PL5", "PL6", "PL7",
+	"PM0", "PM1", "PM2", "PM3", "PM4", "PM5", "PM6", "PM7",
+	"PN0", "PN1", "PN2", "PN3", "PN4", "PN5", "PN6", "PN7",
+	"PO0", "PO1", "PO2", "PO3", "PO4", "PO5", "PO6", "PO7",
+	"PP0", "PP1", "PP2", "PP3", "PP4", "PP5", "PP6", "PP7",
+	"PQ0", "PQ1", "PQ2", "PQ3", "PQ4", "PQ5", "PQ6", "PQ7",
+	"PR0", "PR1", "PR2", "PR3", "PR4", "PR5", "PR6", "PR7",
+	"PS0", "PS1", "PS2", "PS3", "PS4", "PS5", "PS6", "PS7",
+};
+
+static const u64 r9a09g047_gpio_configs[] = {
+	RZG2L_GPIO_PORT_PACK(8, 0x20, RZV2H_MPXED_PIN_FUNCS),	/* P0 */
+	RZG2L_GPIO_PORT_PACK(8, 0x21, RZV2H_MPXED_PIN_FUNCS |
+				      PIN_CFG_ELC),		/* P1 */
+	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_COMMON_PIN_FUNCS(RZV2H) |
+				      PIN_CFG_NOD),		/* P2 */
+	RZG2L_GPIO_PORT_PACK(8, 0x23, RZV2H_MPXED_PIN_FUNCS),	/* P3 */
+	RZG2L_GPIO_PORT_PACK(6, 0x24, RZV2H_MPXED_PIN_FUNCS),	/* P4 */
+	RZG2L_GPIO_PORT_PACK(7, 0x25, RZV2H_MPXED_PIN_FUNCS),	/* P5 */
+	RZG2L_GPIO_PORT_PACK(7, 0x26, RZV2H_MPXED_PIN_FUNCS),	/* P6 */
+	RZG2L_GPIO_PORT_PACK(8, 0x27, RZV2H_MPXED_PIN_FUNCS |
+				      PIN_CFG_ELC),		/* P7 */
+	RZG2L_GPIO_PORT_PACK(6, 0x28, RZV2H_MPXED_PIN_FUNCS),	/* P8 */
+	RZG2L_GPIO_PORT_PACK(0, 0x29, RZV2H_MPXED_PIN_FUNCS),	/* P9 */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),			/* PA */
+	RZG2L_GPIO_PORT_PACK(8, 0x2b, RZV2H_MPXED_PIN_FUNCS),	/* PB */
+	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZV2H_MPXED_PIN_FUNCS),	/* PC */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),			/* PD */
+	RZG2L_GPIO_PORT_PACK(8, 0x2e, RZV2H_MPXED_PIN_FUNCS),	/* PE */
+	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZV2H_MPXED_PIN_FUNCS),	/* PF */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),			/* PG */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),			/* PH */
+	RZG2L_GPIO_PORT_PACK(0, 0x32, RZV2H_MPXED_PIN_FUNCS),	/* PI */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),			/* PJ */
+	RZG2L_GPIO_PORT_PACK(4, 0x34, RZV2H_MPXED_PIN_FUNCS),	/* PK */
+	RZG2L_GPIO_PORT_PACK(8, 0x35, RZV2H_MPXED_PIN_FUNCS),	/* PL */
+	RZG2L_GPIO_PORT_PACK(8, 0x36, RZV2H_MPXED_PIN_FUNCS),	/* PM */
+	RZG2L_GPIO_PORT_PACK(0, 0x37, RZV2H_MPXED_PIN_FUNCS),	/* PN */
+	RZG2L_GPIO_PORT_PACK(0, 0x38, RZV2H_MPXED_PIN_FUNCS),	/* PO */
+	RZG2L_GPIO_PORT_PACK(0, 0x39, RZV2H_MPXED_PIN_FUNCS),	/* PP */
+	RZG2L_GPIO_PORT_PACK(0, 0x3a, RZV2H_MPXED_PIN_FUNCS),	/* PQ */
+	RZG2L_GPIO_PORT_PACK(0, 0x3b, RZV2H_MPXED_PIN_FUNCS),	/* PR */
+	RZG2L_GPIO_PORT_PACK(4, 0x3c, RZV2H_MPXED_PIN_FUNCS),	/* PS */
+};
+
 static const char * const rzv2h_gpio_names[] = {
 	"P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
 	"P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
@@ -2252,6 +2357,43 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
 	{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
 };
 
+static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
+	{ "WDTUDFCA", RZG2L_SINGLE_PIN_PACK(0x5, 0,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD | PIN_CFG_NOD)) },
+	{ "WDTUDFCM", RZG2L_SINGLE_PIN_PACK(0x5, 1,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD | PIN_CFG_NOD)) },
+	{ "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD)) },
+	{ "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD)) },
+	{ "SD0CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0RSTN", RZG2L_SINGLE_PIN_PACK(0x9, 2,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0PWEN", RZG2L_SINGLE_PIN_PACK(0x9, 3,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0IOVS", RZG2L_SINGLE_PIN_PACK(0x9, 4,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0DAT0", RZG2L_SINGLE_PIN_PACK(0xa, 0,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT1", RZG2L_SINGLE_PIN_PACK(0xa, 1,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT2", RZG2L_SINGLE_PIN_PACK(0xa, 2,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT3", RZG2L_SINGLE_PIN_PACK(0xa, 3,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT4", RZG2L_SINGLE_PIN_PACK(0xa, 4,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT5", RZG2L_SINGLE_PIN_PACK(0xa, 5,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT6", RZG2L_SINGLE_PIN_PACK(0xa, 6,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT7", RZG2L_SINGLE_PIN_PACK(0xa, 7,
+	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -2762,6 +2904,9 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	BUILD_BUG_ON(ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg2l_gpio_names));
 
+	BUILD_BUG_ON(ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT >
+		     ARRAY_SIZE(rzg3e_gpio_names));
+
 	BUILD_BUG_ON(ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzv2h_gpio_names));
 
@@ -3160,6 +3305,29 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a09g047_data = {
+	.port_pins = rzg3e_gpio_names,
+	.port_pin_configs = r9a09g047_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g047_gpio_configs),
+	.dedicated_pins = rzg3e_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzg3e_dedicated_pins),
+	.hwcfg = &rzv2h_hwcfg,
+	.variable_pin_cfg = r9a09g047_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g047_variable_pin_cfg),
+	.num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),
+	.custom_params = renesas_rzv2h_custom_bindings,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = renesas_rzv2h_conf_items,
+#endif
+	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzv2h_pmc_writeb,
+	.oen_read = &rzv2h_oen_read,
+	.oen_write = &rzv2h_oen_write,
+	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
+	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
+};
+
 static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.port_pins = rzv2h_gpio_names,
 	.port_pin_configs = r9a09g057_gpio_configs,
@@ -3196,6 +3364,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a08g045-pinctrl",
 		.data = &r9a08g045_data,
 	},
+	{
+		.compatible = "renesas,r9a09g047-pinctrl",
+		.data = &r9a09g047_data,
+	},
 	{
 		.compatible = "renesas,r9a09g057-pinctrl",
 		.data = &r9a09g057_data,
-- 
2.43.0


