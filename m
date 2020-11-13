Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B282F2B1DBE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 15:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKMOwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 09:52:30 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:16692 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 09:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605279149; x=1636815149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4p7dU7XPu+hrhUlSP5lP/XjTKfj5EhG/CqglUFF+c7o=;
  b=gXOhjLqsAR5rwiSytUnnn+OGuDP/laR4K7EAtpA5ctj498BZYJuR1mmK
   6o1ku6V5e5CBmK5FKNxBrwsgkmuC647CDPaJs3Ca40qbP/3GdirxfKdag
   RH4UgCfRy/0jjRNw0wwSv5DV02y8x8dgQlC63hd0DQNvYF2sYD77ZPJyE
   gMqklgaH2I9DfJE3d+ORF1GVwWbR4G36jA6yQkrVTdpSt4uLCy4uf27X4
   mX+NDC+P3Y/9ATUebKEi2tGZl+rBZRSM35GE5ghJaFFCoak85muVIihj2
   4jIj0apgQM0hjeGoa1adEd+b+krZvXHaD2BQXKSE63YpPr7DEgXWn2MDm
   Q==;
IronPort-SDR: SdhlaMttImZl3RIl3TP8ZR6poIzw0XhFZOuc7eLTp2jL3KY2RoDq7TRZHsjKjGXRcOqjPqDyaY
 kARk2E0Ulo22NsDb5TUBMM4Ks32Dd5sk9c2Xlvxi4JFSITGG4MXiGR2xu6mp/X2sN7F7FByJkV
 QQ9D1UKjLVUoaAfH6OMQEbb/3WmHobBS3k4CurL1qYGXzTVtQC+kYTCcJnPRQDtQNAHsBUGJrq
 oasIxaAXszTntCGztU3gAr27rpsVqHCjuPnWCDQl6Pc+C4/dGPzf7qemZWCFfRIDLSdof/8kq3
 vLQ=
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="98333218"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2020 07:52:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 07:52:28 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 13 Nov 2020 07:52:26 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v10 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
Date:   Fri, 13 Nov 2020 15:51:50 +0100
Message-ID: <20201113145151.68900-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113145151.68900-1-lars.povlsen@microchip.com>
References: <20201113145151.68900-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
(SGPIO) device used in various SoC's.

The driver is added as a pinctrl driver, albeit only having just GPIO
support currently. The hardware supports other functions that will be
added following.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                               |   1 +
 drivers/pinctrl/Kconfig                   |  16 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 709 ++++++++++++++++++++++
 4 files changed, 727 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..75a00dfa824a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2117,6 +2117,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://github.com/microchip-ung/linux-upstream.git
 F:	arch/arm64/boot/dts/microchip/
+F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
 N:	sparx5
 
 ARM/MIOA701 MACHINE SUPPORT
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 815095326e2d..9b8ed7516355 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -374,6 +374,22 @@ config PINCTRL_OCELOT
 	select OF_GPIO
 	select REGMAP_MMIO
 
+config PINCTRL_MICROCHIP_SGPIO
+	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
+	depends on HAS_IOMEM
+	select GPIOLIB
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	help
+	  Support for the serial GPIO interface used on Microsemi and
+	  Microchip SoC's. By using a serial interface, the SIO
+	  controller significantly extends the number of available
+	  GPIOs with a minimum number of additional pins on the
+	  device. The primary purpose of the SIO controller is to
+	  connect control signals from SFP modules and to act as an
+	  LED controller.
+
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f53933b2ff02..c9fcfafc45c7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 
 obj-y				+= actions/
diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
new file mode 100644
index 000000000000..d6c31cc7678e
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Microsemi/Microchip SoCs serial gpio driver
+ *
+ * Author: Lars Povlsen <lars.povlsen@microchip.com>
+ *
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "core.h"
+#include "pinconf.h"
+
+#define SGPIO_BITS_PER_WORD	32
+#define SGPIO_MAX_BITS		4
+#define SGPIO_SRC_BITS		3 /* 3 bit wide field per pin */
+
+enum {
+	REG_INPUT_DATA,
+	REG_PORT_CONFIG,
+	REG_PORT_ENABLE,
+	REG_SIO_CONFIG,
+	REG_SIO_CLOCK,
+	MAXREG
+};
+
+enum {
+	SGPIO_ARCH_LUTON,
+	SGPIO_ARCH_OCELOT,
+	SGPIO_ARCH_SPARX5,
+};
+
+struct sgpio_properties {
+	int arch;
+	u8 regoff[MAXREG];
+};
+
+#define SGPIO_LUTON_AUTO_REPEAT  BIT(5)
+#define SGPIO_LUTON_PORT_WIDTH   GENMASK(3, 2)
+#define SGPIO_LUTON_CLK_FREQ     GENMASK(11, 0)
+#define SGPIO_LUTON_BIT_SOURCE   GENMASK(11, 0)
+
+#define SGPIO_OCELOT_AUTO_REPEAT BIT(10)
+#define SGPIO_OCELOT_PORT_WIDTH  GENMASK(8, 7)
+#define SGPIO_OCELOT_CLK_FREQ    GENMASK(19, 8)
+#define SGPIO_OCELOT_BIT_SOURCE  GENMASK(23, 12)
+
+#define SGPIO_SPARX5_AUTO_REPEAT BIT(6)
+#define SGPIO_SPARX5_PORT_WIDTH  GENMASK(4, 3)
+#define SGPIO_SPARX5_CLK_FREQ    GENMASK(19, 8)
+#define SGPIO_SPARX5_BIT_SOURCE  GENMASK(23, 12)
+
+const struct sgpio_properties properties_luton = {
+	.arch   = SGPIO_ARCH_LUTON,
+	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
+};
+
+const struct sgpio_properties properties_ocelot = {
+	.arch   = SGPIO_ARCH_OCELOT,
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+};
+
+const struct sgpio_properties properties_sparx5 = {
+	.arch   = SGPIO_ARCH_SPARX5,
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+};
+
+static const char * const functions[] = { "gpio" };
+
+struct sgpio_bank {
+	struct sgpio_priv *priv;
+	bool is_input;
+	struct gpio_chip gpio;
+	struct pinctrl_desc pctl_desc;
+};
+
+struct sgpio_priv {
+	struct device *dev;
+	struct sgpio_bank in;
+	struct sgpio_bank out;
+	u32 bitcount;
+	u32 ports;
+	u32 clock;
+	u32 __iomem *regs;
+	const struct sgpio_properties *properties;
+};
+
+struct sgpio_port_addr {
+	u8 port;
+	u8 bit;
+};
+
+static inline void sgpio_pin_to_addr(struct sgpio_priv *priv, int pin,
+				     struct sgpio_port_addr *addr)
+{
+	addr->port = pin / priv->bitcount;
+	addr->bit = pin % priv->bitcount;
+}
+
+static inline u32 sgpio_readl(struct sgpio_priv *priv, u32 rno, u32 off)
+{
+	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
+
+	return readl(reg);
+}
+
+static inline void sgpio_writel(struct sgpio_priv *priv,
+				u32 val, u32 rno, u32 off)
+{
+	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
+
+	writel(val, reg);
+}
+
+static inline void sgpio_clrsetbits(struct sgpio_priv *priv,
+				    u32 rno, u32 off, u32 clear, u32 set)
+{
+	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
+	u32 val = readl(reg);
+
+	val &= ~clear;
+	val |= set;
+
+	writel(val, reg);
+}
+
+static inline void sgpio_configure_bitstream(struct sgpio_priv *priv)
+{
+	int width = priv->bitcount - 1;
+	u32 clr, set;
+
+	switch (priv->properties->arch) {
+	case SGPIO_ARCH_LUTON:
+		clr = SGPIO_LUTON_PORT_WIDTH;
+		set = SGPIO_LUTON_AUTO_REPEAT |
+			FIELD_PREP(SGPIO_LUTON_PORT_WIDTH, width);
+		break;
+	case SGPIO_ARCH_OCELOT:
+		clr = SGPIO_OCELOT_PORT_WIDTH;
+		set = SGPIO_OCELOT_AUTO_REPEAT |
+			FIELD_PREP(SGPIO_OCELOT_PORT_WIDTH, width);
+		break;
+	case SGPIO_ARCH_SPARX5:
+		clr = SGPIO_SPARX5_PORT_WIDTH;
+		set = SGPIO_SPARX5_AUTO_REPEAT |
+			FIELD_PREP(SGPIO_SPARX5_PORT_WIDTH, width);
+		break;
+	default:
+		return;
+	}
+	sgpio_clrsetbits(priv, REG_SIO_CONFIG, 0, clr, set);
+}
+
+static inline void sgpio_configure_clock(struct sgpio_priv *priv, u32 clkfrq)
+{
+	u32 clr, set;
+
+	switch (priv->properties->arch) {
+	case SGPIO_ARCH_LUTON:
+		clr = SGPIO_LUTON_CLK_FREQ;
+		set = FIELD_PREP(SGPIO_LUTON_CLK_FREQ, clkfrq);
+		break;
+	case SGPIO_ARCH_OCELOT:
+		clr = SGPIO_OCELOT_CLK_FREQ;
+		set = FIELD_PREP(SGPIO_OCELOT_CLK_FREQ, clkfrq);
+		break;
+	case SGPIO_ARCH_SPARX5:
+		clr = SGPIO_SPARX5_CLK_FREQ;
+		set = FIELD_PREP(SGPIO_SPARX5_CLK_FREQ, clkfrq);
+		break;
+	default:
+		return;
+	}
+	sgpio_clrsetbits(priv, REG_SIO_CLOCK, 0, clr, set);
+}
+
+static void sgpio_output_set(struct sgpio_priv *priv,
+			     struct sgpio_port_addr *addr,
+			     int value)
+{
+	unsigned int bit = SGPIO_SRC_BITS * addr->bit;
+	u32 clr, set;
+
+	switch (priv->properties->arch) {
+	case SGPIO_ARCH_LUTON:
+		clr = FIELD_PREP(SGPIO_LUTON_BIT_SOURCE, BIT(bit));
+		set = FIELD_PREP(SGPIO_LUTON_BIT_SOURCE, value << bit);
+		break;
+	case SGPIO_ARCH_OCELOT:
+		clr = FIELD_PREP(SGPIO_OCELOT_BIT_SOURCE, BIT(bit));
+		set = FIELD_PREP(SGPIO_OCELOT_BIT_SOURCE, value << bit);
+		break;
+	case SGPIO_ARCH_SPARX5:
+		clr = FIELD_PREP(SGPIO_SPARX5_BIT_SOURCE, BIT(bit));
+		set = FIELD_PREP(SGPIO_SPARX5_BIT_SOURCE, value << bit);
+		break;
+	default:
+		return;
+	}
+	sgpio_clrsetbits(priv, REG_PORT_CONFIG, addr->port, clr, set);
+}
+
+static int sgpio_output_get(struct sgpio_priv *priv,
+			    struct sgpio_port_addr *addr)
+{
+	u32 val, portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
+	unsigned int bit = SGPIO_SRC_BITS * addr->bit;
+
+	switch (priv->properties->arch) {
+	case SGPIO_ARCH_LUTON:
+		val = FIELD_GET(SGPIO_LUTON_BIT_SOURCE, portval);
+		break;
+	case SGPIO_ARCH_OCELOT:
+		val = FIELD_GET(SGPIO_OCELOT_BIT_SOURCE, portval);
+		break;
+	case SGPIO_ARCH_SPARX5:
+		val = FIELD_GET(SGPIO_SPARX5_BIT_SOURCE, portval);
+		break;
+	default:
+		val = 0;
+		break;
+	}
+	return !!(val & BIT(bit));
+}
+
+static int sgpio_input_get(struct sgpio_priv *priv,
+			   struct sgpio_port_addr *addr)
+{
+	return !!(sgpio_readl(priv, REG_INPUT_DATA, addr->bit) & BIT(addr->port));
+}
+
+static int sgpio_pinconf_get(struct pinctrl_dev *pctldev,
+			     unsigned int pin, unsigned long *config)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+	u32 param = pinconf_to_config_param(*config);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+	int val;
+
+	sgpio_pin_to_addr(priv, pin, &addr);
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_ENABLE:
+		val = bank->is_input;
+		break;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		val = !bank->is_input;
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		if (bank->is_input)
+			return -EINVAL;
+		val = sgpio_output_get(priv, &addr);
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, val);
+
+	return 0;
+}
+
+static int sgpio_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *configs, unsigned int num_configs)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+	int cfg, err = 0;
+	u32 param, arg;
+
+	sgpio_pin_to_addr(priv, pin, &addr);
+
+	for (cfg = 0; cfg < num_configs; cfg++) {
+		param = pinconf_to_config_param(configs[cfg]);
+		arg = pinconf_to_config_argument(configs[cfg]);
+
+		switch (param) {
+		case PIN_CONFIG_OUTPUT:
+			if (bank->is_input)
+				return -EINVAL;
+			sgpio_output_set(priv, &addr, arg);
+			break;
+
+		default:
+			err = -ENOTSUPP;
+		}
+	}
+
+	return err;
+}
+
+static const struct pinconf_ops sgpio_confops = {
+	.is_generic = true,
+	.pin_config_get = sgpio_pinconf_get,
+	.pin_config_set = sgpio_pinconf_set,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
+static int sgpio_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return 1;
+}
+
+static const char *sgpio_get_function_name(struct pinctrl_dev *pctldev,
+					   unsigned int function)
+{
+	return functions[0];
+}
+
+static int sgpio_get_function_groups(struct pinctrl_dev *pctldev,
+				     unsigned int function,
+				     const char *const **groups,
+				     unsigned *const num_groups)
+{
+	*groups  = functions;
+	*num_groups = ARRAY_SIZE(functions);
+
+	return 0;
+}
+
+static int sgpio_pinmux_set_mux(struct pinctrl_dev *pctldev,
+				unsigned int selector, unsigned int group)
+{
+	return 0;
+}
+
+static int sgpio_gpio_set_direction(struct pinctrl_dev *pctldev,
+				    struct pinctrl_gpio_range *range,
+				    unsigned int pin, bool input)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+
+	return (input == bank->is_input) ? 0 : -EINVAL;
+}
+
+static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
+				     struct pinctrl_gpio_range *range,
+				     unsigned int offset)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+
+	sgpio_pin_to_addr(priv, offset, &addr);
+
+	if ((priv->ports & BIT(addr.port)) == 0) {
+		dev_warn(priv->dev, "Request port %d.%d: Port is not enabled\n",
+			 addr.port, addr.bit);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops sgpio_pmx_ops = {
+	.get_functions_count = sgpio_get_functions_count,
+	.get_function_name = sgpio_get_function_name,
+	.get_function_groups = sgpio_get_function_groups,
+	.set_mux = sgpio_pinmux_set_mux,
+	.gpio_set_direction = sgpio_gpio_set_direction,
+	.gpio_request_enable = sgpio_gpio_request_enable,
+};
+
+static int sgpio_pctl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+
+	return bank->pctl_desc.npins;
+}
+
+static const char *sgpio_pctl_get_group_name(struct pinctrl_dev *pctldev,
+					     unsigned int group)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+
+	return bank->pctl_desc.pins[group].name;
+}
+
+static int sgpio_pctl_get_group_pins(struct pinctrl_dev *pctldev,
+				     unsigned int group,
+				     const unsigned int **pins,
+				     unsigned int *num_pins)
+{
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &bank->pctl_desc.pins[group].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops sgpio_pctl_ops = {
+	.get_groups_count = sgpio_pctl_get_groups_count,
+	.get_group_name = sgpio_pctl_get_group_name,
+	.get_group_pins = sgpio_pctl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int microchip_sgpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct sgpio_bank *bank = gpiochip_get_data(gc);
+
+	/* Fixed-position function */
+	return bank->is_input ? 0 : -EINVAL;
+}
+
+static int microchip_sgpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio, int value)
+{
+	struct sgpio_bank *bank = gpiochip_get_data(gc);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+
+	/* Fixed-position function */
+	if (bank->is_input)
+		return -EINVAL;
+
+	sgpio_pin_to_addr(priv, gpio, &addr);
+
+	sgpio_output_set(priv, &addr, value);
+
+	return 0;
+}
+
+static int microchip_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct sgpio_bank *bank = gpiochip_get_data(gc);
+
+	return bank->is_input ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static void microchip_sgpio_set_value(struct gpio_chip *gc,
+				unsigned int gpio, int value)
+{
+	microchip_sgpio_direction_output(gc, gpio, value);
+}
+
+static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct sgpio_bank *bank = gpiochip_get_data(gc);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+
+	sgpio_pin_to_addr(priv, gpio, &addr);
+
+	return bank->is_input ? sgpio_input_get(priv, &addr) : sgpio_output_get(priv, &addr);
+}
+
+static int microchip_sgpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	struct sgpio_bank *bank = gpiochip_get_data(gc);
+	struct sgpio_priv *priv = bank->priv;
+	int pin;
+
+	/*
+	 * Note that the SGIO pin is defined by *2* numbers, a port
+	 * number between 0 and 31, and a bit index, 0 to 3.
+	 */
+	if (gpiospec->args[0] > SGPIO_BITS_PER_WORD ||
+	    gpiospec->args[1] > priv->bitcount)
+		return -EINVAL;
+
+	pin = gpiospec->args[1] + gpiospec->args[0] * priv->bitcount;
+
+	if (pin > gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[2];
+
+	return pin;
+}
+
+static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
+{
+	const char *range_property_name = "microchip,sgpio-port-ranges";
+	struct device *dev = priv->dev;
+	u32 range_params[64];
+	int i, nranges, ret;
+
+	/* Calculate port mask */
+	nranges = device_property_count_u32(dev, range_property_name);
+	if (nranges < 2 || nranges % 2 || nranges > ARRAY_SIZE(range_params)) {
+		dev_err(dev, "%s port range: '%s' property\n",
+			nranges == -EINVAL ? "Missing" : "Invalid",
+			range_property_name);
+		return -EINVAL;
+	}
+
+	ret = device_property_read_u32_array(dev, range_property_name,
+					     range_params, nranges);
+	if (ret) {
+		dev_err(dev, "failed to parse '%s' property: %d\n",
+			range_property_name, ret);
+		return ret;
+	}
+	for (i = 0; i < nranges; i += 2) {
+		int start, end;
+
+		start = range_params[i];
+		end = range_params[i + 1];
+		if (start > end || end >= SGPIO_BITS_PER_WORD) {
+			dev_err(dev, "Ill-formed port-range [%d:%d]\n",
+				start, end);
+		}
+		priv->ports |= GENMASK(end, start);
+	}
+
+	return 0;
+}
+
+static int microchip_sgpio_register_bank(struct device *dev,
+					 struct sgpio_priv *priv,
+					 struct fwnode_handle *fwnode,
+					 int bankno)
+{
+	struct pinctrl_pin_desc *pins;
+	struct pinctrl_desc *pctl_desc;
+	struct pinctrl_dev *pctldev;
+	struct sgpio_bank *bank;
+	struct gpio_chip *gc;
+	u32 ngpios;
+	int i, ret;
+
+	/* Get overall bank struct */
+	bank = (bankno == 0) ? &priv->in : &priv->out;
+	bank->priv = priv;
+
+	if (fwnode_property_read_u32(fwnode, "ngpios", &ngpios)) {
+		dev_info(dev, "failed to get number of gpios for bank%d\n",
+			 bankno);
+		ngpios = 64;
+	}
+
+	priv->bitcount = ngpios / SGPIO_BITS_PER_WORD;
+	if (priv->bitcount > SGPIO_MAX_BITS) {
+		dev_err(dev, "Bit width exceeds maximum (%d)\n",
+			SGPIO_MAX_BITS);
+		return -EINVAL;
+	}
+
+	pctl_desc = &bank->pctl_desc;
+	pctl_desc->name = devm_kasprintf(dev, GFP_KERNEL, "%s-%sput",
+					 dev_name(dev),
+					 bank->is_input ? "in" : "out");
+	pctl_desc->pctlops = &sgpio_pctl_ops;
+	pctl_desc->pmxops = &sgpio_pmx_ops;
+	pctl_desc->confops = &sgpio_confops;
+	pctl_desc->owner = THIS_MODULE;
+
+	pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	pctl_desc->npins = ngpios;
+	pctl_desc->pins = pins;
+
+	for (i = 0; i < ngpios; i++) {
+		struct sgpio_port_addr addr;
+
+		sgpio_pin_to_addr(priv, i, &addr);
+
+		pins[i].number = i;
+		pins[i].name = devm_kasprintf(dev, GFP_KERNEL,
+					      "SGPIO_%c_p%db%d",
+					      bank->is_input ? 'I' : 'O',
+					      addr.port, addr.bit);
+		if (!pins[i].name)
+			return -ENOMEM;
+	}
+
+	pctldev = devm_pinctrl_register(dev, pctl_desc, bank);
+	if (IS_ERR(pctldev))
+		return dev_err_probe(dev, PTR_ERR(pctldev), "Failed to register pinctrl\n");
+
+	gc			= &bank->gpio;
+	gc->label		= pctl_desc->name;
+	gc->parent		= dev;
+	gc->of_node		= to_of_node(fwnode);
+	gc->owner		= THIS_MODULE;
+	gc->get_direction	= microchip_sgpio_get_direction;
+	gc->direction_input	= microchip_sgpio_direction_input;
+	gc->direction_output	= microchip_sgpio_direction_output;
+	gc->get			= microchip_sgpio_get_value;
+	gc->set			= microchip_sgpio_set_value;
+	gc->request		= gpiochip_generic_request;
+	gc->free		= gpiochip_generic_free;
+	gc->of_xlate		= microchip_sgpio_of_xlate;
+	gc->of_gpio_n_cells     = 3;
+	gc->base		= -1;
+	gc->ngpio		= ngpios;
+
+	ret = devm_gpiochip_add_data(dev, gc, bank);
+	if (ret)
+		dev_err(dev, "Failed to register: ret %d\n", ret);
+
+	return ret;
+}
+
+static int microchip_sgpio_probe(struct platform_device *pdev)
+{
+	int div_clock = 0, ret, port, i, nbanks;
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *fwnode;
+	struct sgpio_priv *priv;
+	struct clk *clk;
+	u32 val;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	div_clock = clk_get_rate(clk);
+	if (device_property_read_u32(dev, "bus-frequency", &priv->clock))
+		priv->clock = 12500000;
+	if (priv->clock == 0 || priv->clock > (div_clock / 2)) {
+		dev_err(dev, "Invalid frequency %d\n", priv->clock);
+		return -EINVAL;
+	}
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+	priv->properties = device_get_match_data(dev);
+	priv->in.is_input = true;
+
+	/* Get rest of device properties */
+	ret = microchip_sgpio_get_ports(priv);
+	if (ret)
+		return ret;
+
+	nbanks = device_get_child_node_count(dev);
+	if (nbanks != 2) {
+		dev_err(dev, "Must have 2 banks (have %d)\n", nbanks);
+		return -EINVAL;
+	}
+
+	i = 0;
+	device_for_each_child_node(dev, fwnode) {
+		ret = microchip_sgpio_register_bank(dev, priv, fwnode, i++);
+		if (ret)
+			return ret;
+	}
+
+	if (priv->in.gpio.ngpio != priv->out.gpio.ngpio) {
+		dev_err(dev, "Banks must have same GPIO count\n");
+		return -ERANGE;
+	}
+
+	sgpio_configure_bitstream(priv);
+
+	val = max(2U, div_clock / priv->clock);
+	sgpio_configure_clock(priv, val);
+
+	for (port = 0; port < SGPIO_BITS_PER_WORD; port++)
+		sgpio_writel(priv, 0, REG_PORT_CONFIG, port);
+	sgpio_writel(priv, priv->ports, REG_PORT_ENABLE, 0);
+
+	return 0;
+}
+
+static const struct of_device_id microchip_sgpio_gpio_of_match[] = {
+	{
+		.compatible = "microchip,sparx5-sgpio",
+		.data = &properties_sparx5,
+	}, {
+		.compatible = "mscc,luton-sgpio",
+		.data = &properties_luton,
+	}, {
+		.compatible = "mscc,ocelot-sgpio",
+		.data = &properties_ocelot,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver microchip_sgpio_pinctrl_driver = {
+	.driver = {
+		.name = "pinctrl-microchip-sgpio",
+		.of_match_table = microchip_sgpio_gpio_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = microchip_sgpio_probe,
+};
+builtin_platform_driver(microchip_sgpio_pinctrl_driver);
-- 
2.25.1

