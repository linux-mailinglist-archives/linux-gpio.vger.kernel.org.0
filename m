Return-Path: <linux-gpio+bounces-30740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45BD3AE87
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6334B30E6060
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382D33876CB;
	Mon, 19 Jan 2026 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BLdnRI9b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702D387349;
	Mon, 19 Jan 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835209; cv=none; b=sV1QrBa3O2KlpzJvME73Pf550ChQLkSt2jFZh9VmLr/vKMU+35zICZ228iR1QUKD+L3tEeHQ/jN09Etb5pWPVd3Zj+AtqBf89+7OcbGRd74Vj9z9YErKaVNpenrSZ1ev+giNBZeepWCYJV7NFpxQfDtA2qdyfaTwAvZpxOyRNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835209; c=relaxed/simple;
	bh=wrLKGQjBBhAXSelBJMMAtxkdeQAIFEgzIAnqDzlPudw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sx2HGR2FpFlnv/lRQnc3tS99Z7dZf0N1LTaUq2LHbecDeuZrblRn0WMVgIOmBogTuxBtj3aoPoX+ZzO1uhVVFlCdzlZhAYaBfJVnMb9XpUXqxfbooqF9XeiMD9VcPU3ACi8MDoZfOWzISWfgzjdb6TtmrWZPE1QVOxqxm46T0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BLdnRI9b; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768835207; x=1800371207;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wrLKGQjBBhAXSelBJMMAtxkdeQAIFEgzIAnqDzlPudw=;
  b=BLdnRI9b6ztH9k3nHvSc+sy6POyLA/5qVg609U4K6oQzJfsHS1KutePt
   0SV0C+Fxfw//SKmKrjnC8NPG9QQX4NY+E3OzvKBZIppMYiDXAvhp4HxMw
   AGB0AavPjly/ZL3YnopV/0rgJAOiul4fViVP1+tD4rj7+ixhZMrq2cj3E
   Vkks2lP+yUmGO9ur0zmnd3Rgr0TI1LBg2MubOqO9SaPCNJOth/JjfPYTs
   c9JMmJ8fmfMroZ9e6vbmogUB7sj+Nz9K7fztIcQ5wd7lP3Eyt0STnx046
   65WIg6Ji4K1SPUHE81YsPydc1Q9ohnhIDDIpukKdeDG81GOJPs5zwbtDW
   g==;
X-CSE-ConnectionGUID: 1bDZ6aHwSTKUGtJlZF+cag==
X-CSE-MsgGUID: dmC6dY4aQQ2a4uzXPG2oGA==
X-IronPort-AV: E=Sophos;i="6.21,238,1763449200"; 
   d="scan'208";a="51363226"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2026 08:06:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 19 Jan 2026 08:06:35 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 19 Jan 2026 08:06:32 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 19 Jan 2026 16:06:11 +0100
Subject: [PATCH 3/3] pinctrl: ocelot: Extend support for lan9645xf family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-3-1228155ed0ee@microchip.com>
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Bartosz Golaszewski <brgl@kernel.org>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Extend pinctrl-ocelot driver to support the lan9645xf chip family.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 177 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 4db0439ca8c4..6ea9544ddd06 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -97,6 +97,8 @@ enum {
 	FUNC_FC_SHRD20,
 	FUNC_FUSA,
 	FUNC_GPIO,
+	FUNC_I2C,
+	FUNC_I2C_Sa,
 	FUNC_IB_TRG_a,
 	FUNC_IB_TRG_b,
 	FUNC_IB_TRG_c,
@@ -112,9 +114,11 @@ enum {
 	FUNC_IRQ1,
 	FUNC_IRQ1_IN,
 	FUNC_IRQ1_OUT,
+	FUNC_IRQ2,
 	FUNC_IRQ3,
 	FUNC_IRQ4,
 	FUNC_EXT_IRQ,
+	FUNC_MACLED,
 	FUNC_MIIM,
 	FUNC_MIIM_a,
 	FUNC_MIIM_b,
@@ -126,6 +130,7 @@ enum {
 	FUNC_OB_TRG_a,
 	FUNC_OB_TRG_b,
 	FUNC_PHY_LED,
+	FUNC_PHY_DBG,
 	FUNC_PCI_WAKE,
 	FUNC_MD,
 	FUNC_PCIE_PERST,
@@ -156,10 +161,12 @@ enum {
 	FUNC_SG0,
 	FUNC_SG1,
 	FUNC_SG2,
+	FUNC_SPI,
 	FUNC_SGPIO_a,
 	FUNC_SGPIO_b,
 	FUNC_SI,
 	FUNC_SI2,
+	FUNC_SI_Sa,
 	FUNC_SYNCE,
 	FUNC_TACHO,
 	FUNC_TACHO_a,
@@ -188,6 +195,7 @@ enum {
 	FUNC_EMMC_SD,
 	FUNC_REF_CLK,
 	FUNC_RCVRD_CLK,
+	FUNC_RGMII,
 	FUNC_MAX
 };
 
@@ -237,6 +245,8 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_FC_SHRD20]	= "fc_shrd20",
 	[FUNC_FUSA]		= "fusa",
 	[FUNC_GPIO]		= "gpio",
+	[FUNC_I2C]		= "i2c",
+	[FUNC_I2C_Sa]		= "i2c_slave_a",
 	[FUNC_IB_TRG_a]		= "ib_trig_a",
 	[FUNC_IB_TRG_b]		= "ib_trig_b",
 	[FUNC_IB_TRG_c]		= "ib_trig_c",
@@ -252,9 +262,11 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_IRQ1]		= "irq1",
 	[FUNC_IRQ1_IN]		= "irq1_in",
 	[FUNC_IRQ1_OUT]		= "irq1_out",
+	[FUNC_IRQ2]		= "irq2",
 	[FUNC_IRQ3]		= "irq3",
 	[FUNC_IRQ4]		= "irq4",
 	[FUNC_EXT_IRQ]		= "ext_irq",
+	[FUNC_MACLED]		= "mac_led",
 	[FUNC_MIIM]		= "miim",
 	[FUNC_MIIM_a]		= "miim_a",
 	[FUNC_MIIM_b]		= "miim_b",
@@ -263,6 +275,7 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_MIIM_Sb]		= "miim_slave_b",
 	[FUNC_MIIM_IRQ]		= "miim_irq",
 	[FUNC_PHY_LED]		= "phy_led",
+	[FUNC_PHY_DBG]		= "phy_dbg",
 	[FUNC_PCI_WAKE]		= "pci_wake",
 	[FUNC_PCIE_PERST]	= "pcie_perst",
 	[FUNC_MD]		= "md",
@@ -300,6 +313,8 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_SGPIO_b]		= "sgpio_b",
 	[FUNC_SI]		= "si",
 	[FUNC_SI2]		= "si2",
+	[FUNC_SI_Sa]		= "si_slave_a",
+	[FUNC_SPI]		= "spi",
 	[FUNC_SYNCE]		= "synce",
 	[FUNC_TACHO]		= "tacho",
 	[FUNC_TACHO_a]		= "tacho_a",
@@ -328,6 +343,7 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_EMMC_SD]		= "emmc_sd",
 	[FUNC_REF_CLK]		= "ref_clk",
 	[FUNC_RCVRD_CLK]	= "rcvrd_clk",
+	[FUNC_RGMII]		= "rgmii",
 };
 
 struct ocelot_pmx_func {
@@ -1323,6 +1339,132 @@ static const struct pinctrl_pin_desc lan969x_pins[] = {
 	LAN969X_PIN(66),
 };
 
+#define LAN9645X_P(p, f0, f1, f2, f3, f4, f5, f6, f7)            \
+static struct ocelot_pin_caps lan9645x_pin_##p = {               \
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
+/*      Pin    FUNC0     FUNC1         FUNC2       FUNC3       FUNC4     FUNC5     FUNC6    FUNC7 */
+LAN9645X_P(0,     GPIO,      SPI,        SI_Sa,     I2C_Sa,    MIIM_Sa,     UART,     MIIM,    PHY_DBG);
+LAN9645X_P(1,     GPIO,      SPI,        SI_Sa,     I2C_Sa,    MIIM_Sa,     UART,     MIIM,    PHY_DBG);
+LAN9645X_P(2,     GPIO,      SPI,        SI_Sa,        I2C,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(3,     GPIO,      SPI,        SI_Sa,        I2C,    MIIM_Sa,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(4,     GPIO,    RGMII,    TWI_SCL_M,        I2C,       NONE,     NONE,    SI_Sa,    PHY_DBG);
+LAN9645X_P(5,     GPIO,    RGMII,    TWI_SCL_M,        I2C,       NONE,     NONE,    SI_Sa,    PHY_DBG);
+LAN9645X_P(6,     GPIO,    RGMII,    TWI_SCL_M,       NONE,       NONE,     NONE,    SI_Sa,    PHY_DBG);
+LAN9645X_P(7,     GPIO,    RGMII,    TWI_SCL_M,        SFP,    SGPIO_a,     MIIM,    SI_Sa,    PHY_DBG);
+LAN9645X_P(8,     GPIO,    RGMII,    TWI_SCL_M,        SFP,    SGPIO_a,     MIIM,     NONE,    PHY_DBG);
+LAN9645X_P(9,     GPIO,    RGMII,    TWI_SCL_M,   RECO_CLK,    SGPIO_a,     IRQ1,     UART,    PHY_DBG);
+LAN9645X_P(10,    GPIO,    RGMII,    TWI_SCL_M,   RECO_CLK,    SGPIO_a,     IRQ2,     UART,    PHY_DBG);
+LAN9645X_P(11,    GPIO,    RGMII,    TWI_SCL_M,       MIIM,       NONE,     IRQ3,     NONE,    PHY_DBG);
+LAN9645X_P(12,    GPIO,    RGMII,    TWI_SCL_M,       MIIM,       PTP0,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(13,    GPIO,    RGMII,    TWI_SCL_M,     CLKMON,       PTP1,   MACLED,     NONE,    PHY_DBG);
+LAN9645X_P(14,    GPIO,    RGMII,    TWI_SCL_M,     CLKMON,       PTP2,   MACLED,     NONE,    PHY_DBG);
+LAN9645X_P(15,    GPIO,    RGMII,    TWI_SCL_M,     CLKMON,       PTP3,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(16,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(17,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(18,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(19,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(20,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(21,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(22,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(23,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(24,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(25,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(26,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(27,    GPIO,    RGMII,         NONE,       NONE,       NONE,     NONE,     NONE,    PHY_DBG);
+LAN9645X_P(28,    GPIO, RECO_CLK,         MIIM,       NONE,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(29,    GPIO, RECO_CLK,         MIIM,       NONE,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(30,    GPIO,     PTP0,          I2C,       UART,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(31,    GPIO,     PTP1,    TWI_SCL_M,       UART,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(32,    GPIO,     PTP2,    TWI_SCL_M,       NONE,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(33,    GPIO,     PTP3,         IRQ0,       NONE,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(34,    GPIO, RECO_CLK,      PHY_LED,    PHY_LED,       NONE,     NONE,     NONE,          R);
+LAN9645X_P(35,    GPIO, RECO_CLK,      PHY_LED,    PHY_LED,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(36,    GPIO,     PTP0,      PHY_LED,    PHY_LED,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(37,    GPIO,     PTP1,      PHY_LED,    PHY_LED,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(38,    GPIO,     NONE,      PHY_LED,    PHY_LED,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(39,    GPIO,     UART,      PHY_LED,       NONE,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(40,    GPIO,      SPI,      PHY_LED,    SGPIO_a,       NONE,   MACLED,     NONE,          R);
+LAN9645X_P(41,    GPIO,      SPI,      PHY_LED,    SGPIO_a,       IRQ1,   MACLED,     NONE,          R);
+LAN9645X_P(42,    GPIO,      SPI,      PHY_LED,    SGPIO_a,       IRQ2,   MACLED,      SFP,          R);
+LAN9645X_P(43,    GPIO,      SPI,      PHY_LED,    SGPIO_a,       IRQ3,   MACLED,      SFP,          R);
+LAN9645X_P(44,    GPIO,     MIIM,          I2C,      NONE,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(45,    GPIO,     MIIM,          I2C,      NONE,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(46,    GPIO,     NONE,      PHY_LED,      NONE,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(47,    GPIO,     NONE,      PHY_LED,      NONE,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(48,    GPIO,  MIIM_Sa,      PHY_LED,      NONE,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(49,    GPIO,  MIIM_Sa,      PHY_LED,    I2C_Sa,        NONE,     NONE,     NONE,          R);
+LAN9645X_P(50,    GPIO,  MIIM_Sa,      PHY_LED,    I2C_Sa,        NONE,     NONE,     NONE,          R);
+
+#define LAN9645X_PIN(n) {                                       \
+	.number = n,                                           \
+	.name = "GPIO_"#n,                                     \
+	.drv_data = &lan9645x_pin_##n                           \
+}
+
+static const struct pinctrl_pin_desc lan9645x_pins[] = {
+	LAN9645X_PIN(0),
+	LAN9645X_PIN(1),
+	LAN9645X_PIN(2),
+	LAN9645X_PIN(3),
+	LAN9645X_PIN(4),
+	LAN9645X_PIN(5),
+	LAN9645X_PIN(6),
+	LAN9645X_PIN(7),
+	LAN9645X_PIN(8),
+	LAN9645X_PIN(9),
+	LAN9645X_PIN(10),
+	LAN9645X_PIN(11),
+	LAN9645X_PIN(12),
+	LAN9645X_PIN(13),
+	LAN9645X_PIN(14),
+	LAN9645X_PIN(15),
+	LAN9645X_PIN(16),
+	LAN9645X_PIN(17),
+	LAN9645X_PIN(18),
+	LAN9645X_PIN(19),
+	LAN9645X_PIN(20),
+	LAN9645X_PIN(21),
+	LAN9645X_PIN(22),
+	LAN9645X_PIN(23),
+	LAN9645X_PIN(24),
+	LAN9645X_PIN(25),
+	LAN9645X_PIN(26),
+	LAN9645X_PIN(27),
+	LAN9645X_PIN(28),
+	LAN9645X_PIN(29),
+	LAN9645X_PIN(30),
+	LAN9645X_PIN(31),
+	LAN9645X_PIN(32),
+	LAN9645X_PIN(33),
+	LAN9645X_PIN(34),
+	LAN9645X_PIN(35),
+	LAN9645X_PIN(36),
+	LAN9645X_PIN(37),
+	LAN9645X_PIN(38),
+	LAN9645X_PIN(39),
+	LAN9645X_PIN(40),
+	LAN9645X_PIN(41),
+	LAN9645X_PIN(42),
+	LAN9645X_PIN(43),
+	LAN9645X_PIN(44),
+	LAN9645X_PIN(45),
+	LAN9645X_PIN(46),
+	LAN9645X_PIN(47),
+	LAN9645X_PIN(48),
+	LAN9645X_PIN(49),
+	LAN9645X_PIN(50),
+};
+
 static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
 {
 	return ARRAY_SIZE(ocelot_function_names);
@@ -1471,6 +1613,13 @@ static int lan966x_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int lan9645x_gpio_request_enable(struct pinctrl_dev *pctldev,
+					struct pinctrl_gpio_range *range,
+					unsigned int offset)
+{
+	return 0;
+}
+
 static const struct pinmux_ops ocelot_pmx_ops = {
 	.get_functions_count = ocelot_get_functions_count,
 	.get_function_name = ocelot_get_function_name,
@@ -1489,6 +1638,15 @@ static const struct pinmux_ops lan966x_pmx_ops = {
 	.gpio_request_enable = lan966x_gpio_request_enable,
 };
 
+static const struct pinmux_ops lan9645x_pmx_ops = {
+	.get_functions_count = ocelot_get_functions_count,
+	.get_function_name = ocelot_get_function_name,
+	.get_function_groups = ocelot_get_function_groups,
+	.set_mux = lan966x_pinmux_set_mux,
+	.gpio_set_direction = ocelot_gpio_set_direction,
+	.gpio_request_enable = lan9645x_gpio_request_enable,
+};
+
 static int ocelot_pctl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
@@ -1886,6 +2044,24 @@ static const struct ocelot_match_data lan969x_desc = {
 	},
 };
 
+static struct ocelot_match_data lan9645xf_desc = {
+	.desc = {
+		.name = "lan9645xf-pinctrl",
+		.pins = lan9645x_pins,
+		.npins = ARRAY_SIZE(lan9645x_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &lan9645x_pmx_ops,
+		.confops = &ocelot_confops,
+		.owner = THIS_MODULE,
+	},
+	.pincfg_data = {
+		.pd_bit = BIT(3),
+		.pu_bit = BIT(2),
+		.drive_bits = GENMASK(1, 0),
+	},
+	.n_alt_modes = 7,
+};
+
 static int ocelot_create_group_func_map(struct device *dev,
 					struct ocelot_pinctrl *info)
 {
@@ -2220,6 +2396,7 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
 	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
 	{ .compatible = "microchip,lan966x-pinctrl", .data = &lan966x_desc },
 	{ .compatible = "microchip,lan9691-pinctrl", .data = &lan969x_desc },
+	{ .compatible = "microchip,lan96455f-pinctrl", .data = &lan9645xf_desc },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ocelot_pinctrl_of_match);

-- 
2.34.1


