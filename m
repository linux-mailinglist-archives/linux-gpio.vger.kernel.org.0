Return-Path: <linux-gpio+bounces-10217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F697B059
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C30F1C23805
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B3C1741C6;
	Tue, 17 Sep 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Hn1zvGNT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6254171099;
	Tue, 17 Sep 2024 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577227; cv=none; b=TmvGYo0da5beermkBHwW0jNGq5Tl2tMh3/iG4McdBm3xJ+DnEIxPQTb+fO8iEkq1C3jbxVt40MKi2lMtXmRwrpsDT6qaOVBgS/oXWH8tyHJ1u6181xSTopGpMKYn0Mxb/C0M8Oip1n1grfiIM4/ClZWKlkv5D/9NFRCjQkhI1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577227; c=relaxed/simple;
	bh=ndUITw1wW2yukOeX8K0RSOyTa4t8Kbg+SukQnCQTYok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qMZDWM1YvOWzeZz7fDkVcIDIYvdYYTK/7zUnWzv54bWQVcVUHhTIcaRVV7y2YBiIb+qv7lqpUJmxg3QbbxBUZNB9kABAxHGfNtx0tcfXYCzc4dpZPPCs6AySIcGnYmo5JZ3lu4EJiZ4aj4ujv6ok9uE0beGed6gTC5svLxjDuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Hn1zvGNT; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726577225; x=1758113225;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ndUITw1wW2yukOeX8K0RSOyTa4t8Kbg+SukQnCQTYok=;
  b=Hn1zvGNTXc+iZ0mP4Rm0WRh2xkgCW2Ri1f5O+G5r+D4i9CiklylOA/PR
   5NGcVgMtaEoG3Fngpll4dxjSZTE6PrRF+uLbEFd8qvC7AY51gJzk7GjP+
   SJpGuqN7mQ7iSU7zxn5rpGH8UFC+bkp+tz/nl596pfvBksfoWQMgIpzKE
   NTqqubxvL4CGVM52DjHlirnEnA8Zb95vxn7E0gIu665AbW/RMOxJLilQr
   7GjdS1HF3nOblBPQ95EotRwB/JSjhE3zL1oQbdDiYRn4nz+4g018t1hX/
   nrDMkUe97VJftthbTngP5hEv1Gk8e0XNL8uhxB9JGzgl0AmHVqkYvovmF
   Q==;
X-CSE-ConnectionGUID: oChexh71QPaX/eaL3DGN+A==
X-CSE-MsgGUID: wGQv0XbbROWoYqN9GvSUWw==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="32510850"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 05:47:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 05:45:59 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Sep 2024 05:45:57 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 17 Sep 2024 14:45:41 +0200
Subject: [PATCH v2 2/2] pinctrl: ocelot: add support for lan969x SoC
 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240917-lan969x-pinctrl-v2-2-ea02cbc56831@microchip.com>
References: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
In-Reply-To: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev

This adds support for lan969x SoC pinctrl, reusing the existing ocelot
driver. There are 66 General Purpose I/O pins that are individually
configurable to multiple interfaces.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 203 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index be9b8c010167..13209adac6e6 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -57,6 +57,8 @@ enum {
 	FUNC_CAN1,
 	FUNC_CLKMON,
 	FUNC_NONE,
+	FUNC_FAN,
+	FUNC_FC,
 	FUNC_FC0_a,
 	FUNC_FC0_b,
 	FUNC_FC0_c,
@@ -71,6 +73,7 @@ enum {
 	FUNC_FC4_a,
 	FUNC_FC4_b,
 	FUNC_FC4_c,
+	FUNC_FC_SHRD,
 	FUNC_FC_SHRD0,
 	FUNC_FC_SHRD1,
 	FUNC_FC_SHRD2,
@@ -92,6 +95,7 @@ enum {
 	FUNC_FC_SHRD18,
 	FUNC_FC_SHRD19,
 	FUNC_FC_SHRD20,
+	FUNC_FUSA,
 	FUNC_GPIO,
 	FUNC_IB_TRG_a,
 	FUNC_IB_TRG_b,
@@ -108,6 +112,8 @@ enum {
 	FUNC_IRQ1,
 	FUNC_IRQ1_IN,
 	FUNC_IRQ1_OUT,
+	FUNC_IRQ3,
+	FUNC_IRQ4,
 	FUNC_EXT_IRQ,
 	FUNC_MIIM,
 	FUNC_MIIM_a,
@@ -115,12 +121,14 @@ enum {
 	FUNC_MIIM_c,
 	FUNC_MIIM_Sa,
 	FUNC_MIIM_Sb,
+	FUNC_MIIM_IRQ,
 	FUNC_OB_TRG,
 	FUNC_OB_TRG_a,
 	FUNC_OB_TRG_b,
 	FUNC_PHY_LED,
 	FUNC_PCI_WAKE,
 	FUNC_MD,
+	FUNC_PCIE_PERST,
 	FUNC_PTP0,
 	FUNC_PTP1,
 	FUNC_PTP2,
@@ -152,6 +160,7 @@ enum {
 	FUNC_SGPIO_b,
 	FUNC_SI,
 	FUNC_SI2,
+	FUNC_SYNCE,
 	FUNC_TACHO,
 	FUNC_TACHO_a,
 	FUNC_TACHO_b,
@@ -170,6 +179,10 @@ enum {
 	FUNC_USB_S_a,
 	FUNC_USB_S_b,
 	FUNC_USB_S_c,
+	FUNC_USB_POWER,
+	FUNC_USB2PHY_RST,
+	FUNC_USB_OVER_DETECT,
+	FUNC_USB_ULPI,
 	FUNC_PLL_STAT,
 	FUNC_EMMC,
 	FUNC_EMMC_SD,
@@ -184,6 +197,8 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_CAN1]		= "can1",
 	[FUNC_CLKMON]		= "clkmon",
 	[FUNC_NONE]		= "none",
+	[FUNC_FAN]		= "fan",
+	[FUNC_FC]		= "fc",
 	[FUNC_FC0_a]		= "fc0_a",
 	[FUNC_FC0_b]		= "fc0_b",
 	[FUNC_FC0_c]		= "fc0_c",
@@ -198,6 +213,7 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_FC4_a]		= "fc4_a",
 	[FUNC_FC4_b]		= "fc4_b",
 	[FUNC_FC4_c]		= "fc4_c",
+	[FUNC_FC_SHRD]		= "fc_shrd",
 	[FUNC_FC_SHRD0]		= "fc_shrd0",
 	[FUNC_FC_SHRD1]		= "fc_shrd1",
 	[FUNC_FC_SHRD2]		= "fc_shrd2",
@@ -219,6 +235,7 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_FC_SHRD18]	= "fc_shrd18",
 	[FUNC_FC_SHRD19]	= "fc_shrd19",
 	[FUNC_FC_SHRD20]	= "fc_shrd20",
+	[FUNC_FUSA]		= "fusa",
 	[FUNC_GPIO]		= "gpio",
 	[FUNC_IB_TRG_a]		= "ib_trig_a",
 	[FUNC_IB_TRG_b]		= "ib_trig_b",
@@ -235,6 +252,8 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_IRQ1]		= "irq1",
 	[FUNC_IRQ1_IN]		= "irq1_in",
 	[FUNC_IRQ1_OUT]		= "irq1_out",
+	[FUNC_IRQ3]		= "irq3",
+	[FUNC_IRQ4]		= "irq4",
 	[FUNC_EXT_IRQ]		= "ext_irq",
 	[FUNC_MIIM]		= "miim",
 	[FUNC_MIIM_a]		= "miim_a",
@@ -242,8 +261,10 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_MIIM_c]		= "miim_c",
 	[FUNC_MIIM_Sa]		= "miim_slave_a",
 	[FUNC_MIIM_Sb]		= "miim_slave_b",
+	[FUNC_MIIM_IRQ]		= "miim_irq",
 	[FUNC_PHY_LED]		= "phy_led",
 	[FUNC_PCI_WAKE]		= "pci_wake",
+	[FUNC_PCIE_PERST]	= "pcie_perst",
 	[FUNC_MD]		= "md",
 	[FUNC_OB_TRG]		= "ob_trig",
 	[FUNC_OB_TRG_a]		= "ob_trig_a",
@@ -279,6 +300,7 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_SGPIO_b]		= "sgpio_b",
 	[FUNC_SI]		= "si",
 	[FUNC_SI2]		= "si2",
+	[FUNC_SYNCE]		= "synce",
 	[FUNC_TACHO]		= "tacho",
 	[FUNC_TACHO_a]		= "tacho_a",
 	[FUNC_TACHO_b]		= "tacho_b",
@@ -294,6 +316,10 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_USB_S_a]		= "usb_slave_a",
 	[FUNC_USB_S_b]		= "usb_slave_b",
 	[FUNC_USB_S_c]		= "usb_slave_c",
+	[FUNC_USB_POWER]	= "usb_power",
+	[FUNC_USB2PHY_RST]	= "usb2phy_rst",
+	[FUNC_USB_OVER_DETECT]	= "usb_over_detect",
+	[FUNC_USB_ULPI]		= "usb_ulpi",
 	[FUNC_UART]		= "uart",
 	[FUNC_UART2]		= "uart2",
 	[FUNC_UART3]		= "uart3",
@@ -1136,6 +1162,165 @@ static const struct pinctrl_pin_desc lan966x_pins[] = {
 	LAN966X_PIN(77),
 };
 
+#define LAN969X_P(p, f0, f1, f2, f3, f4, f5, f6, f7)           \
+static struct ocelot_pin_caps lan969x_pin_##p = {              \
+	.pin = p,                                              \
+	.functions = {                                         \
+		FUNC_##f0, FUNC_##f1, FUNC_##f2,               \
+		FUNC_##f3                                      \
+	},                                                     \
+	.a_functions = {                                       \
+		FUNC_##f4, FUNC_##f5, FUNC_##f6,               \
+		FUNC_##f7                                      \
+	},                                                     \
+}
+
+/* Pinmuxing table taken from data sheet */
+/*        Pin   FUNC0      FUNC1   FUNC2         FUNC3                  FUNC4     FUNC5      FUNC6        FUNC7 */
+LAN969X_P(0,    GPIO,      IRQ0,   FC_SHRD,      PCIE_PERST,            NONE,     NONE,      NONE,        R);
+LAN969X_P(1,    GPIO,      IRQ1,   FC_SHRD,       USB_POWER,            NONE,     NONE,      NONE,        R);
+LAN969X_P(2,    GPIO,        FC,      NONE,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(3,    GPIO,        FC,      NONE,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(4,    GPIO,        FC,      NONE,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(5,    GPIO,   SGPIO_a,      NONE,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(6,    GPIO,   SGPIO_a,      NONE,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(7,    GPIO,   SGPIO_a,      NONE,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(8,    GPIO,   SGPIO_a,      NONE,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(9,    GPIO,      MIIM,   MIIM_Sa,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(10,   GPIO,      MIIM,   MIIM_Sa,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(11,   GPIO,  MIIM_IRQ,   MIIM_Sa,          CLKMON,            NONE,     NONE,      NONE,        R);
+LAN969X_P(12,   GPIO,      IRQ3,   FC_SHRD,     USB2PHY_RST,            NONE,     NONE,      NONE,        R);
+LAN969X_P(13,   GPIO,      IRQ4,   FC_SHRD, USB_OVER_DETECT,            NONE,     NONE,      NONE,        R);
+LAN969X_P(14,   GPIO,   EMMC_SD,     QSPI1,              FC,            NONE,     NONE,      NONE,        R);
+LAN969X_P(15,   GPIO,   EMMC_SD,     QSPI1,              FC,            NONE,     NONE,      NONE,        R);
+LAN969X_P(16,   GPIO,   EMMC_SD,     QSPI1,              FC,            NONE,     NONE,      NONE,        R);
+LAN969X_P(17,   GPIO,   EMMC_SD,     QSPI1,       PTPSYNC_0,       USB_POWER,     NONE,      NONE,        R);
+LAN969X_P(18,   GPIO,   EMMC_SD,     QSPI1,       PTPSYNC_1,     USB2PHY_RST,     NONE,      NONE,        R);
+LAN969X_P(19,   GPIO,   EMMC_SD,     QSPI1,       PTPSYNC_2, USB_OVER_DETECT,     NONE,      NONE,        R);
+LAN969X_P(20,   GPIO,   EMMC_SD,      NONE,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(21,   GPIO,   EMMC_SD,      NONE,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(22,   GPIO,   EMMC_SD,      NONE,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(23,   GPIO,   EMMC_SD,      NONE,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(24,   GPIO,   EMMC_SD,      NONE,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(25,   GPIO,       FAN,      FUSA,          CAN0_a,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(26,   GPIO,       FAN,      FUSA,          CAN0_a,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(27,   GPIO,     SYNCE,        FC,            MIIM,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(28,   GPIO,     SYNCE,        FC,            MIIM,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(29,   GPIO,     SYNCE,        FC,        MIIM_IRQ,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(30,   GPIO, PTPSYNC_0,  USB_ULPI,         FC_SHRD,           QSPI1,     NONE,      NONE,        R);
+LAN969X_P(31,   GPIO, PTPSYNC_1,  USB_ULPI,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(32,   GPIO, PTPSYNC_2,  USB_ULPI,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(33,   GPIO,        SD,  USB_ULPI,         FC_SHRD,            NONE,     NONE,      NONE,        R);
+LAN969X_P(34,   GPIO,        SD,  USB_ULPI,            CAN1,         FC_SHRD,     NONE,      NONE,        R);
+LAN969X_P(35,   GPIO,        SD,  USB_ULPI,            CAN1,         FC_SHRD,     NONE,      NONE,        R);
+LAN969X_P(36,   GPIO,        SD,  USB_ULPI,      PCIE_PERST,         FC_SHRD,     NONE,      NONE,        R);
+LAN969X_P(37,   GPIO,        SD,  USB_ULPI,          CAN0_b,            NONE,     NONE,      NONE,        R);
+LAN969X_P(38,   GPIO,        SD,  USB_ULPI,          CAN0_b,            NONE,     NONE,      NONE,        R);
+LAN969X_P(39,   GPIO,        SD,  USB_ULPI,            MIIM,            NONE,     NONE,      NONE,        R);
+LAN969X_P(40,   GPIO,        SD,  USB_ULPI,            MIIM,            NONE,     NONE,      NONE,        R);
+LAN969X_P(41,   GPIO,        SD,  USB_ULPI,        MIIM_IRQ,            NONE,     NONE,      NONE,        R);
+LAN969X_P(42,   GPIO, PTPSYNC_3,      CAN1,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(43,   GPIO, PTPSYNC_4,      CAN1,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(44,   GPIO, PTPSYNC_5,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(45,   GPIO, PTPSYNC_6,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(46,   GPIO, PTPSYNC_7,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(47,   GPIO,      NONE,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(48,   GPIO,      NONE,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(49,   GPIO,      NONE,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(50,   GPIO,      NONE,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(51,   GPIO,      NONE,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(52,   GPIO,       FAN,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(53,   GPIO,       FAN,    SFP_SD,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(54,   GPIO,     SYNCE,        FC,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(55,   GPIO,     SYNCE,        FC,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(56,   GPIO,     SYNCE,        FC,            NONE,            NONE,     NONE,      NONE,        R);
+LAN969X_P(57,   GPIO,    SFP_SD,   FC_SHRD,             TWI,       PTPSYNC_3,     NONE,      NONE,        R);
+LAN969X_P(58,   GPIO,    SFP_SD,   FC_SHRD,             TWI,       PTPSYNC_4,     NONE,      NONE,        R);
+LAN969X_P(59,   GPIO,    SFP_SD,   FC_SHRD,             TWI,       PTPSYNC_5,     NONE,      NONE,        R);
+LAN969X_P(60,   GPIO,    SFP_SD,   FC_SHRD,             TWI,       PTPSYNC_6,     NONE,      NONE,        R);
+LAN969X_P(61,   GPIO,      MIIM,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+LAN969X_P(62,   GPIO,      MIIM,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+LAN969X_P(63,   GPIO,  MIIM_IRQ,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+LAN969X_P(64,   GPIO,        FC,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+LAN969X_P(65,   GPIO,        FC,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+LAN969X_P(66,   GPIO,        FC,   FC_SHRD,             TWI,            NONE,     NONE,      NONE,        R);
+
+#define LAN969X_PIN(n) {                                       \
+	.number = n,                                           \
+	.name = "GPIO_"#n,                                     \
+	.drv_data = &lan969x_pin_##n                           \
+}
+
+static const struct pinctrl_pin_desc lan969x_pins[] = {
+	LAN969X_PIN(0),
+	LAN969X_PIN(1),
+	LAN969X_PIN(2),
+	LAN969X_PIN(3),
+	LAN969X_PIN(4),
+	LAN969X_PIN(5),
+	LAN969X_PIN(6),
+	LAN969X_PIN(7),
+	LAN969X_PIN(8),
+	LAN969X_PIN(9),
+	LAN969X_PIN(10),
+	LAN969X_PIN(11),
+	LAN969X_PIN(12),
+	LAN969X_PIN(13),
+	LAN969X_PIN(14),
+	LAN969X_PIN(15),
+	LAN969X_PIN(16),
+	LAN969X_PIN(17),
+	LAN969X_PIN(18),
+	LAN969X_PIN(19),
+	LAN969X_PIN(20),
+	LAN969X_PIN(21),
+	LAN969X_PIN(22),
+	LAN969X_PIN(23),
+	LAN969X_PIN(24),
+	LAN969X_PIN(25),
+	LAN969X_PIN(26),
+	LAN969X_PIN(27),
+	LAN969X_PIN(28),
+	LAN969X_PIN(29),
+	LAN969X_PIN(30),
+	LAN969X_PIN(31),
+	LAN969X_PIN(32),
+	LAN969X_PIN(33),
+	LAN969X_PIN(34),
+	LAN969X_PIN(35),
+	LAN969X_PIN(36),
+	LAN969X_PIN(37),
+	LAN969X_PIN(38),
+	LAN969X_PIN(39),
+	LAN969X_PIN(40),
+	LAN969X_PIN(41),
+	LAN969X_PIN(42),
+	LAN969X_PIN(43),
+	LAN969X_PIN(44),
+	LAN969X_PIN(45),
+	LAN969X_PIN(46),
+	LAN969X_PIN(47),
+	LAN969X_PIN(48),
+	LAN969X_PIN(49),
+	LAN969X_PIN(50),
+	LAN969X_PIN(51),
+	LAN969X_PIN(52),
+	LAN969X_PIN(53),
+	LAN969X_PIN(54),
+	LAN969X_PIN(55),
+	LAN969X_PIN(56),
+	LAN969X_PIN(57),
+	LAN969X_PIN(58),
+	LAN969X_PIN(59),
+	LAN969X_PIN(60),
+	LAN969X_PIN(61),
+	LAN969X_PIN(62),
+	LAN969X_PIN(63),
+	LAN969X_PIN(64),
+	LAN969X_PIN(65),
+	LAN969X_PIN(66),
+};
+
 static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
 {
 	return ARRAY_SIZE(ocelot_function_names);
@@ -1682,6 +1867,23 @@ static struct ocelot_match_data lan966x_desc = {
 	},
 };
 
+static struct ocelot_match_data lan969x_desc = {
+	.desc = {
+		.name = "lan969x-pinctrl",
+		.pins = lan969x_pins,
+		.npins = ARRAY_SIZE(lan969x_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &lan966x_pmx_ops,
+		.confops = &ocelot_confops,
+		.owner = THIS_MODULE,
+	},
+	.pincfg_data = {
+		.pd_bit = BIT(3),
+		.pu_bit = BIT(2),
+		.drive_bits = GENMASK(1, 0),
+	},
+};
+
 static int ocelot_create_group_func_map(struct device *dev,
 					struct ocelot_pinctrl *info)
 {
@@ -2014,6 +2216,7 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
 	{ .compatible = "mscc,servalt-pinctrl", .data = &servalt_desc },
 	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
 	{ .compatible = "microchip,lan966x-pinctrl", .data = &lan966x_desc },
+	{ .compatible = "microchip,lan9691-pinctrl", .data = &lan969x_desc },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ocelot_pinctrl_of_match);

-- 
2.34.1


