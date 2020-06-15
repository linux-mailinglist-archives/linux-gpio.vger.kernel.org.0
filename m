Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AAF1F98F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbgFONeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:34:31 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:21278 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgFONdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592227996; x=1623763996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gdjF/KRnXB6pjscz5MG/KIHpiIofdwH2tNUvwdNiNfU=;
  b=UPRsfOzeq1/fAfubicv3LpHSAVzHqrIFiasHD/+bmIHfBfI6sii0DX08
   q4uZPkZmeFgVpFY+j19wvaIcPcAE4ahceuf5ytftwFI63bxnh+qxPTy6g
   O2jlai2+Gx5RPtswcTEA516SSzvCF8iV1DMQS3DwjhqENFIPiHkKxXTPe
   2oxLLGfAtiFtqyTFgkO2ClUB3K1g2w0ZAScQnID/gbKTOEonqpCzV7Xd8
   tK4CYgwxXIwlVA53AFxgtSxriz0zhFgtxluDikSPvEU+buttzzimW38kc
   azpbFz2p/97CCrtZCzjyGpuFEWfD5Z2Mlh17j2Z38Iqnq1aRIN23aFz7B
   g==;
IronPort-SDR: lBsD8Lut+ThKjBigQy2FdbncKVt5NYG6ZSzFotOoQrn1JBI1ElYGIyL1uTrR54eL/VygVRMiC3
 9puJ64TzP60TrVdtCGRCNDUTUocoGfJZwWpGbNTwXIdgw4AYQZVaF29xZ4oXDvVu0oEBMvfevj
 NTFYqDoYYQ1IAGaQe+OTvjWqofv7yiqSdEAyso72kmHmsbTKZ7O7paisDWcgwknsEkEkvFvBss
 XsndN5PX0LgKW5En1P+lWMja6skpHk/DXSvlXmCaqH4Uny17eqWtOQWwagjqiQzNSTg7ZI/eHo
 uQc=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="78509738"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:14 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:33:11 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 05/10] pinctrl: ocelot: Add Sparx5 SoC support
Date:   Mon, 15 Jun 2020 15:32:37 +0200
Message-ID: <20200615133242.24911-6-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add support for Sparx5 pinctrl, using the ocelot drives as
basis. It adds pinconfig support as well, as supported by the
platform.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 430 ++++++++++++++++++++++++++++++-
 1 file changed, 429 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 95c225bc7572f..425a3d764f009 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -25,6 +25,23 @@
 #include "pinconf.h"
 #include "pinmux.h"
 
+#define ocelot_clrsetbits(addr, clear, set) \
+	writel((readl(addr) & ~(clear)) | (set), (addr))
+
+/* PINCONFIG bits (sparx5 only) */
+enum {
+	PINCONF_BIAS,
+	PINCONF_SCHMITT,
+	PINCONF_DRIVE_STRENGTH,
+};
+
+#define BIAS_PD_BIT BIT(4)
+#define BIAS_PU_BIT BIT(3)
+#define BIAS_BITS   (BIAS_PD_BIT|BIAS_PU_BIT)
+#define SCHMITT_BIT BIT(2)
+#define DRIVE_BITS  GENMASK(1, 0)
+
+/* GPIO standard registers */
 #define OCELOT_GPIO_OUT_SET	0x0
 #define OCELOT_GPIO_OUT_CLR	0x4
 #define OCELOT_GPIO_OUT		0x8
@@ -42,12 +59,17 @@
 enum {
 	FUNC_NONE,
 	FUNC_GPIO,
+	FUNC_IRQ0,
 	FUNC_IRQ0_IN,
 	FUNC_IRQ0_OUT,
+	FUNC_IRQ1,
 	FUNC_IRQ1_IN,
 	FUNC_IRQ1_OUT,
+	FUNC_EXT_IRQ,
 	FUNC_MIIM,
+	FUNC_PHY_LED,
 	FUNC_PCI_WAKE,
+	FUNC_MD,
 	FUNC_PTP0,
 	FUNC_PTP1,
 	FUNC_PTP2,
@@ -59,24 +81,36 @@ enum {
 	FUNC_SG1,
 	FUNC_SG2,
 	FUNC_SI,
+	FUNC_SI2,
 	FUNC_TACHO,
 	FUNC_TWI,
 	FUNC_TWI2,
+	FUNC_TWI3,
 	FUNC_TWI_SCL_M,
 	FUNC_UART,
 	FUNC_UART2,
+	FUNC_UART3,
+	FUNC_PLL_STAT,
+	FUNC_EMMC,
+	FUNC_REF_CLK,
+	FUNC_RCVRD_CLK,
 	FUNC_MAX
 };
 
 static const char *const ocelot_function_names[] = {
 	[FUNC_NONE]		= "none",
 	[FUNC_GPIO]		= "gpio",
+	[FUNC_IRQ0]		= "irq0",
 	[FUNC_IRQ0_IN]		= "irq0_in",
 	[FUNC_IRQ0_OUT]		= "irq0_out",
+	[FUNC_IRQ1]		= "irq1",
 	[FUNC_IRQ1_IN]		= "irq1_in",
 	[FUNC_IRQ1_OUT]		= "irq1_out",
+	[FUNC_EXT_IRQ]		= "ext_irq",
 	[FUNC_MIIM]		= "miim",
+	[FUNC_PHY_LED]		= "phy_led",
 	[FUNC_PCI_WAKE]		= "pci_wake",
+	[FUNC_MD]		= "md",
 	[FUNC_PTP0]		= "ptp0",
 	[FUNC_PTP1]		= "ptp1",
 	[FUNC_PTP2]		= "ptp2",
@@ -88,12 +122,19 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_SG1]		= "sg1",
 	[FUNC_SG2]		= "sg2",
 	[FUNC_SI]		= "si",
+	[FUNC_SI2]		= "si2",
 	[FUNC_TACHO]		= "tacho",
 	[FUNC_TWI]		= "twi",
 	[FUNC_TWI2]		= "twi2",
+	[FUNC_TWI3]		= "twi3",
 	[FUNC_TWI_SCL_M]	= "twi_scl_m",
 	[FUNC_UART]		= "uart",
 	[FUNC_UART2]		= "uart2",
+	[FUNC_UART3]		= "uart3",
+	[FUNC_PLL_STAT]		= "pll_stat",
+	[FUNC_EMMC]		= "emmc",
+	[FUNC_REF_CLK]		= "ref_clk",
+	[FUNC_RCVRD_CLK]	= "rcvrd_clk",
 };
 
 struct ocelot_pmx_func {
@@ -111,6 +152,7 @@ struct ocelot_pinctrl {
 	struct pinctrl_dev *pctl;
 	struct gpio_chip gpio_chip;
 	struct regmap *map;
+	void __iomem *pincfg;
 	struct pinctrl_desc *desc;
 	struct ocelot_pmx_func func[FUNC_MAX];
 	u8 stride;
@@ -324,6 +366,152 @@ static const struct pinctrl_pin_desc jaguar2_pins[] = {
 	JAGUAR2_PIN(63),
 };
 
+#define SPARX5_P(p, f0, f1, f2)					\
+static struct ocelot_pin_caps sparx5_pin_##p = {			\
+	.pin = p,							\
+	.functions = {							\
+		FUNC_GPIO, FUNC_##f0, FUNC_##f1, FUNC_##f2		\
+	},								\
+}
+
+SPARX5_P(0,  SG0,       PLL_STAT,  NONE);
+SPARX5_P(1,  SG0,       NONE,      NONE);
+SPARX5_P(2,  SG0,       NONE,      NONE);
+SPARX5_P(3,  SG0,       NONE,      NONE);
+SPARX5_P(4,  SG1,       NONE,      NONE);
+SPARX5_P(5,  SG1,       NONE,      NONE);
+SPARX5_P(6,  IRQ0_IN,   IRQ0_OUT,  SFP);
+SPARX5_P(7,  IRQ1_IN,   IRQ1_OUT,  SFP);
+SPARX5_P(8,  PTP0,      NONE,      SFP);
+SPARX5_P(9,  PTP1,      SFP,       TWI_SCL_M);
+SPARX5_P(10, UART,      NONE,      NONE);
+SPARX5_P(11, UART,      NONE,      NONE);
+SPARX5_P(12, SG1,       NONE,      NONE);
+SPARX5_P(13, SG1,       NONE,      NONE);
+SPARX5_P(14, TWI,       TWI_SCL_M, NONE);
+SPARX5_P(15, TWI,       NONE,      NONE);
+SPARX5_P(16, SI,        TWI_SCL_M, SFP);
+SPARX5_P(17, SI,        TWI_SCL_M, SFP);
+SPARX5_P(18, SI,        TWI_SCL_M, SFP);
+SPARX5_P(19, PCI_WAKE,  TWI_SCL_M, SFP);
+SPARX5_P(20, IRQ0_OUT,  TWI_SCL_M, SFP);
+SPARX5_P(21, IRQ1_OUT,  TACHO,     SFP);
+SPARX5_P(22, TACHO,     IRQ0_OUT,  TWI_SCL_M);
+SPARX5_P(23, PWM,       UART3,     TWI_SCL_M);
+SPARX5_P(24, PTP2,      UART3,     TWI_SCL_M);
+SPARX5_P(25, PTP3,      SI,        TWI_SCL_M);
+SPARX5_P(26, UART2,     SI,        TWI_SCL_M);
+SPARX5_P(27, UART2,     SI,        TWI_SCL_M);
+SPARX5_P(28, TWI2,      SI,        SFP);
+SPARX5_P(29, TWI2,      SI,        SFP);
+SPARX5_P(30, SG2,       SI,        PWM);
+SPARX5_P(31, SG2,       SI,        TWI_SCL_M);
+SPARX5_P(32, SG2,       SI,        TWI_SCL_M);
+SPARX5_P(33, SG2,       SI,        SFP);
+SPARX5_P(34, NONE,      TWI_SCL_M, EMMC);
+SPARX5_P(35, SFP,       TWI_SCL_M, EMMC);
+SPARX5_P(36, SFP,       TWI_SCL_M, EMMC);
+SPARX5_P(37, SFP,       NONE,      EMMC);
+SPARX5_P(38, NONE,      TWI_SCL_M, EMMC);
+SPARX5_P(39, SI2,       TWI_SCL_M, EMMC);
+SPARX5_P(40, SI2,       TWI_SCL_M, EMMC);
+SPARX5_P(41, SI2,       TWI_SCL_M, EMMC);
+SPARX5_P(42, SI2,       TWI_SCL_M, EMMC);
+SPARX5_P(43, SI2,       TWI_SCL_M, EMMC);
+SPARX5_P(44, SI,        SFP,       EMMC);
+SPARX5_P(45, SI,        SFP,       EMMC);
+SPARX5_P(46, NONE,      SFP,       EMMC);
+SPARX5_P(47, NONE,      SFP,       EMMC);
+SPARX5_P(48, TWI3,      SI,        SFP);
+SPARX5_P(49, TWI3,      NONE,      SFP);
+SPARX5_P(50, SFP,       NONE,      TWI_SCL_M);
+SPARX5_P(51, SFP,       SI,        TWI_SCL_M);
+SPARX5_P(52, SFP,       MIIM,      TWI_SCL_M);
+SPARX5_P(53, SFP,       MIIM,      TWI_SCL_M);
+SPARX5_P(54, SFP,       PTP2,      TWI_SCL_M);
+SPARX5_P(55, SFP,       PTP3,      PCI_WAKE);
+SPARX5_P(56, MIIM,      SFP,       TWI_SCL_M);
+SPARX5_P(57, MIIM,      SFP,       TWI_SCL_M);
+SPARX5_P(58, MIIM,      SFP,       TWI_SCL_M);
+SPARX5_P(59, MIIM,      SFP,       NONE);
+SPARX5_P(60, RECO_CLK,  NONE,      NONE);
+SPARX5_P(61, RECO_CLK,  NONE,      NONE);
+SPARX5_P(62, RECO_CLK,  PLL_STAT,  NONE);
+SPARX5_P(63, RECO_CLK,  NONE,      NONE);
+
+#define SPARX5_PIN(n) {					\
+	.number = n,						\
+	.name = "GPIO_"#n,					\
+	.drv_data = &sparx5_pin_##n				\
+}
+
+static const struct pinctrl_pin_desc sparx5_pins[] = {
+	SPARX5_PIN(0),
+	SPARX5_PIN(1),
+	SPARX5_PIN(2),
+	SPARX5_PIN(3),
+	SPARX5_PIN(4),
+	SPARX5_PIN(5),
+	SPARX5_PIN(6),
+	SPARX5_PIN(7),
+	SPARX5_PIN(8),
+	SPARX5_PIN(9),
+	SPARX5_PIN(10),
+	SPARX5_PIN(11),
+	SPARX5_PIN(12),
+	SPARX5_PIN(13),
+	SPARX5_PIN(14),
+	SPARX5_PIN(15),
+	SPARX5_PIN(16),
+	SPARX5_PIN(17),
+	SPARX5_PIN(18),
+	SPARX5_PIN(19),
+	SPARX5_PIN(20),
+	SPARX5_PIN(21),
+	SPARX5_PIN(22),
+	SPARX5_PIN(23),
+	SPARX5_PIN(24),
+	SPARX5_PIN(25),
+	SPARX5_PIN(26),
+	SPARX5_PIN(27),
+	SPARX5_PIN(28),
+	SPARX5_PIN(29),
+	SPARX5_PIN(30),
+	SPARX5_PIN(31),
+	SPARX5_PIN(32),
+	SPARX5_PIN(33),
+	SPARX5_PIN(34),
+	SPARX5_PIN(35),
+	SPARX5_PIN(36),
+	SPARX5_PIN(37),
+	SPARX5_PIN(38),
+	SPARX5_PIN(39),
+	SPARX5_PIN(40),
+	SPARX5_PIN(41),
+	SPARX5_PIN(42),
+	SPARX5_PIN(43),
+	SPARX5_PIN(44),
+	SPARX5_PIN(45),
+	SPARX5_PIN(46),
+	SPARX5_PIN(47),
+	SPARX5_PIN(48),
+	SPARX5_PIN(49),
+	SPARX5_PIN(50),
+	SPARX5_PIN(51),
+	SPARX5_PIN(52),
+	SPARX5_PIN(53),
+	SPARX5_PIN(54),
+	SPARX5_PIN(55),
+	SPARX5_PIN(56),
+	SPARX5_PIN(57),
+	SPARX5_PIN(58),
+	SPARX5_PIN(59),
+	SPARX5_PIN(60),
+	SPARX5_PIN(61),
+	SPARX5_PIN(62),
+	SPARX5_PIN(63),
+};
+
 static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
 {
 	return ARRAY_SIZE(ocelot_function_names);
@@ -382,6 +570,7 @@ static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	 * ALT[1]
 	 * This is racy because both registers can't be updated at the same time
 	 * but it doesn't matter much for now.
+	 * Note: ALT0/ALT1 are organized specially for 64 gpio targets
 	 */
 	regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
 			   BIT(p), f << p);
@@ -458,6 +647,219 @@ static int ocelot_pctl_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
+			       unsigned int pin,
+			       unsigned int reg,
+			       int *val)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (info->pincfg) {
+		u32 regcfg = readl(info->pincfg + (pin * sizeof(u32)));
+
+		ret = 0;
+		switch (reg) {
+		case PINCONF_BIAS:
+			*val = regcfg & BIAS_BITS;
+			break;
+
+		case PINCONF_SCHMITT:
+			*val = regcfg & SCHMITT_BIT;
+			break;
+
+		case PINCONF_DRIVE_STRENGTH:
+			*val = regcfg & DRIVE_BITS;
+			break;
+
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	}
+	return ret;
+}
+
+static int ocelot_hw_set_value(struct ocelot_pinctrl *info,
+			       unsigned int pin,
+			       unsigned int reg,
+			       int val)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (info->pincfg) {
+		void __iomem *regaddr = info->pincfg + (pin * sizeof(u32));
+
+		ret = 0;
+		switch (reg) {
+		case PINCONF_BIAS:
+			ocelot_clrsetbits(regaddr, BIAS_BITS, val);
+			break;
+
+		case PINCONF_SCHMITT:
+			ocelot_clrsetbits(regaddr, SCHMITT_BIT, val);
+			break;
+
+		case PINCONF_DRIVE_STRENGTH:
+			if (val <= 3)
+				ocelot_clrsetbits(regaddr, DRIVE_BITS, val);
+			else
+				ret = -EINVAL;
+			break;
+
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	}
+	return ret;
+}
+
+static int ocelot_pinconf_get(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *config)
+{
+	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	u32 param = pinconf_to_config_param(*config);
+	int val, err;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		err = ocelot_hw_get_value(info, pin, PINCONF_BIAS, &val);
+		if (err)
+			return err;
+		if (param == PIN_CONFIG_BIAS_DISABLE)
+			val = (val == 0 ? true : false);
+		else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
+			val = (val & BIAS_PD_BIT ? true : false);
+		else    /* PIN_CONFIG_BIAS_PULL_UP */
+			val = (val & BIAS_PU_BIT ? true : false);
+		break;
+
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		err = ocelot_hw_get_value(info, pin, PINCONF_SCHMITT, &val);
+		if (err)
+			return err;
+
+		val = (val & SCHMITT_BIT ? true : false);
+		break;
+
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		err = ocelot_hw_get_value(info, pin, PINCONF_DRIVE_STRENGTH,
+					  &val);
+		if (err)
+			return err;
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		err = regmap_read(info->map, REG(OCELOT_GPIO_OUT, info, pin),
+				  &val);
+		if (err)
+			return err;
+		val = !!(val & BIT(pin % 32));
+		break;
+
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		err = regmap_read(info->map, REG(OCELOT_GPIO_OE, info, pin),
+				  &val);
+		if (err)
+			return err;
+		val = val & BIT(pin % 32);
+		if (param == PIN_CONFIG_OUTPUT_ENABLE)
+			val = !!val;
+		else
+			val = !val;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, val);
+
+	return 0;
+}
+
+static int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			      unsigned long *configs, unsigned int num_configs)
+{
+	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	u32 param, arg, p;
+	int cfg, err = 0;
+
+	for (cfg = 0; cfg < num_configs; cfg++) {
+		param = pinconf_to_config_param(configs[cfg]);
+		arg = pinconf_to_config_argument(configs[cfg]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			arg = (param == PIN_CONFIG_BIAS_DISABLE) ? 0 :
+			(param == PIN_CONFIG_BIAS_PULL_UP) ? BIAS_PU_BIT :
+			BIAS_PD_BIT;
+
+			err = ocelot_hw_set_value(info, pin, PINCONF_BIAS, arg);
+			if (err)
+				goto err;
+
+			break;
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			arg = arg ? SCHMITT_BIT : 0;
+			err = ocelot_hw_set_value(info, pin, PINCONF_SCHMITT,
+						  arg);
+			if (err)
+				goto err;
+
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			err = ocelot_hw_set_value(info, pin,
+						  PINCONF_DRIVE_STRENGTH,
+						  arg);
+			if (err)
+				goto err;
+
+			break;
+
+		case PIN_CONFIG_OUTPUT_ENABLE:
+		case PIN_CONFIG_INPUT_ENABLE:
+		case PIN_CONFIG_OUTPUT:
+			p = pin % 32;
+			if (arg)
+				regmap_write(info->map,
+					     REG(OCELOT_GPIO_OUT_SET, info,
+						 pin),
+					     BIT(p));
+			else
+				regmap_write(info->map,
+					     REG(OCELOT_GPIO_OUT_CLR, info,
+						 pin),
+					     BIT(p));
+			regmap_update_bits(info->map,
+					   REG(OCELOT_GPIO_OE, info, pin),
+					   BIT(p),
+					   param == PIN_CONFIG_INPUT_ENABLE ?
+					   0 : BIT(p));
+			break;
+
+		default:
+			err = -EOPNOTSUPP;
+		}
+	}
+err:
+	return err;
+}
+
+static const struct pinconf_ops ocelot_confops = {
+	.is_generic = true,
+	.pin_config_get = ocelot_pinconf_get,
+	.pin_config_set = ocelot_pinconf_set,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
 static const struct pinctrl_ops ocelot_pctl_ops = {
 	.get_groups_count = ocelot_pctl_get_groups_count,
 	.get_group_name = ocelot_pctl_get_group_name,
@@ -484,6 +886,16 @@ static struct pinctrl_desc jaguar2_desc = {
 	.owner = THIS_MODULE,
 };
 
+static struct pinctrl_desc sparx5_desc = {
+	.name = "sparx5-pinctrl",
+	.pins = sparx5_pins,
+	.npins = ARRAY_SIZE(sparx5_pins),
+	.pctlops = &ocelot_pctl_ops,
+	.pmxops = &ocelot_pmx_ops,
+	.confops = &ocelot_confops,
+	.owner = THIS_MODULE,
+};
+
 static int ocelot_create_group_func_map(struct device *dev,
 					struct ocelot_pinctrl *info)
 {
@@ -511,7 +923,8 @@ static int ocelot_create_group_func_map(struct device *dev,
 		}
 
 		for (i = 0; i < npins; i++)
-			info->func[f].groups[i] = info->desc->pins[pins[i]].name;
+			info->func[f].groups[i] =
+				info->desc->pins[pins[i]].name;
 	}
 
 	kfree(pins);
@@ -744,6 +1157,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 static const struct of_device_id ocelot_pinctrl_of_match[] = {
 	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
 	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
+	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
 	{},
 };
 
@@ -752,6 +1166,7 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ocelot_pinctrl *info;
 	void __iomem *base;
+	struct resource *res;
 	int ret;
 	struct regmap_config regmap_config = {
 		.reg_bits = 32,
@@ -773,6 +1188,7 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	info->stride = 1 + (info->desc->npins - 1) / 32;
+
 	regmap_config.max_register = OCELOT_GPIO_SD_MAP * info->stride + 15 * 4;
 
 	info->map = devm_regmap_init_mmio(dev, base, &regmap_config);
@@ -783,6 +1199,16 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, info->map);
 	info->dev = dev;
 
+	/* Pinconf registers */
+	if (info->desc->confops) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(base))
+			dev_dbg(dev, "Failed to ioremap config registers (no extended pinconf)\n");
+		else
+			info->pincfg = base;
+	}
+
 	ret = ocelot_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
@@ -791,6 +1217,8 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_info(dev, "driver registered\n");
+
 	return 0;
 }
 
-- 
2.27.0

