Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1202525C22C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 16:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgICOGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 10:06:13 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:40572 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgICOFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 10:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1599141945; x=1630677945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V/GV9NcvIwyNnF6xF03DY4/TTPi2v83u3L2hNVX/+uM=;
  b=pzBHcgM6VnbyC5wbTp+V5qmN20YOfcUEUscuOLNaFolgCKS2bFBam3mi
   yC60b0qzkySRAFomFdaLMflkx0tKV4OGZVf298RU1amjVMomN4bRazbe9
   RVpDExc36b1HD4OzfsswhjVDbT8M1IFPpSDlmrtTVhni4i7Y1+zGNUSc5
   Q02GKT5wesTP+WXuhSVY4DuFezKUdAtStrSnlJdnrNwec9J0W1zCsjaKN
   tIrx6Wul4Hurmefd3Q2LAE36hcBCxMgKnCi5U+7sFgeQJ6u8OBwYhWlhL
   AqEy+o+LZWYUrdSmXjFyK1Uc9Dch4jvW1ejBsv5uG5wSiD+PBf5cj4we9
   w==;
IronPort-SDR: 4C97+Pdt9jt7ohJ+WNe7SIF7/7d/VTvWuTMlBSh0vEoX4U6gbGOm+JxZOKf1tg4hy5NX4hAeM6
 hgBifvs+VF0bLtjHWzhy45vKeCK201nxxE1ioxSA/+JJBj3ea0ulqhSscS2zNfbmdULJAJW7ky
 qQcKPzac05P16+QEuAiiVW6nw9QPwAso2+hNVyKJb0sKto0BwUzC2q3oEjr4hbN9u7/qjESzLr
 7iO6Xz1JX4JOsdf0sBdm6jx18lElunbQfCje7S3NUDnb5Nqk5/F4cVc/zymTs2ATB+66YTa0xR
 Z3k=
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="90391145"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Sep 2020 06:35:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Sep 2020 06:35:08 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 3 Sep 2020 06:35:04 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/3] pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
Date:   Thu, 3 Sep 2020 15:35:27 +0200
Message-ID: <20200903133528.8595-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903133528.8595-1-lars.povlsen@microchip.com>
References: <20200903133528.8595-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
(SGPIO) device used in various SoC's.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                          |   1 +
 drivers/pinctrl/Kconfig              |  17 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-mchp-sgpio.c | 642 +++++++++++++++++++++++++++
 4 files changed, 661 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mchp-sgpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc70e3ab428b..f147af7f3e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2137,6 +2137,7 @@ M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm64/boot/dts/microchip/
+F:	drivers/pinctrl/pinctrl-mchp-sgpio.c
 N:	sparx5
 
 ARM/MIOA701 MACHINE SUPPORT
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..e109a1f9e296 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -404,6 +404,23 @@ config PINCTRL_OCELOT
 	select OF_GPIO
 	select REGMAP_MMIO
 
+config PINCTRL_MCHP_SGPIO
+	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
+	depends on OF
+	depends on HAS_IOMEM
+	select GPIOLIB
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select OF_GPIO
+	help
+	  Support for the VCoreIII SoC serial GPIO device. By using a
+	  serial interface, the SIO controller significantly extends
+	  the number of available GPIOs with a minimum number of
+	  additional pins on the device. The primary purpose of the
+	  SIO controller is to connect control signals from SFP
+	  modules and to act as an LED controller.
+
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1731b2154df9..626e685bf9ca 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_MCHP_SGPIO) += pinctrl-mchp-sgpio.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 
 obj-y				+= actions/
diff --git a/drivers/pinctrl/pinctrl-mchp-sgpio.c b/drivers/pinctrl/pinctrl-mchp-sgpio.c
new file mode 100644
index 000000000000..336ca9995088
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mchp-sgpio.c
@@ -0,0 +1,642 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Microsemi/Microchip SoCs serial gpio driver
+ *
+ * Author: <lars.povlsen@microchip.com>
+ *
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/clk.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/gpio/mchp-sgpio.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+
+#define MCHP_SGPIOS_PER_BANK	32
+#define MCHP_SGPIO_BANK_DEPTH	4
+
+#define PIN_NAM_SZ	(sizeof("SGPIO_D_pXXbY")+1)
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
+struct mchp_sgpio_props {
+	const char *label;
+	u8 regoff[MAXREG];
+	u32 auto_repeat;
+	u32 port_width;
+	u32 clk_freq;
+	u32 bit_source;
+};
+
+#define __shf(x)		(__builtin_ffsll(x) - 1)
+#define __BF_PREP(bf, x)	(bf & ((x) << __shf(bf)))
+#define __BF_GET(bf, x)		(((x & bf) >> __shf(bf)))
+
+#define MCHP_M_CFG_SIO_AUTO_REPEAT(p)	 ((p)->props->auto_repeat)
+#define MCHP_F_CFG_SIO_PORT_WIDTH(p, x)	 __BF_PREP((p)->props->port_width, x)
+#define MCHP_M_CFG_SIO_PORT_WIDTH(p)	 ((p)->props->port_width)
+#define MCHP_F_CLOCK_SIO_CLK_FREQ(p, x)	 __BF_PREP((p)->props->clk_freq, x)
+#define MCHP_M_CLOCK_SIO_CLK_FREQ(p)	 ((p)->props->clk_freq)
+#define MCHP_F_PORT_CFG_BIT_SOURCE(p, x) __BF_PREP((p)->props->bit_source, x)
+#define MCHP_X_PORT_CFG_BIT_SOURCE(p, x) __BF_GET((p)->props->bit_source, x)
+
+const struct mchp_sgpio_props props_luton = {
+	.label = "luton-sgpio",
+	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
+	.auto_repeat = BIT(5),
+	.port_width  = GENMASK(3, 2),
+	.clk_freq    = GENMASK(11, 0),
+	.bit_source  = GENMASK(11, 0),
+};
+
+const struct mchp_sgpio_props props_ocelot = {
+	.label = "ocelot-sgpio",
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.auto_repeat = BIT(10),
+	.port_width  = GENMASK(8, 7),
+	.clk_freq    = GENMASK(19, 8),
+	.bit_source  = GENMASK(23, 12),
+};
+
+const struct mchp_sgpio_props props_sparx5 = {
+	.label = "sparx5-sgpio",
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.auto_repeat = BIT(6),
+	.port_width  = GENMASK(4, 3),
+	.clk_freq    = GENMASK(19, 8),
+	.bit_source  = GENMASK(23, 12),
+};
+
+static const char * const functions[] = { "gpio" };
+
+struct mchp_sgpio_priv {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	struct gpio_chip gpio;
+	u32 ngpios;
+	u32 bitcount;
+	u32 ports;
+	u32 clock;
+	u32 __iomem *regs;
+	struct pinctrl_desc *desc;
+	const struct mchp_sgpio_props *props;
+};
+
+struct mchp_sgpio_port_addr {
+	u8 port;
+	u8 bit;
+	bool input;
+};
+
+static inline bool sgpio_is_input(struct mchp_sgpio_priv *priv, int pin)
+{
+	/* First half is default input, then output */
+	return pin < (priv->ngpios / 2);
+}
+
+static inline void sgpio_pin_to_addr(struct mchp_sgpio_priv *priv, int pin,
+	struct mchp_sgpio_port_addr *addr)
+{
+	addr->bit = pin % priv->bitcount;
+	addr->port = (pin / priv->bitcount) % MCHP_SGPIOS_PER_BANK;
+	addr->input = sgpio_is_input(priv, pin);
+}
+
+static inline u32 sgpio_readl(struct mchp_sgpio_priv *priv, u32 rno, u32 off)
+{
+	u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
+
+	return readl(reg);
+}
+
+static inline void sgpio_writel(struct mchp_sgpio_priv *priv,
+				u32 val, u32 rno, u32 off)
+{
+	u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
+
+	writel(val, reg);
+}
+
+static inline void sgpio_clrsetbits(struct mchp_sgpio_priv *priv,
+				    u32 rno, u32 off, u32 clear, u32 set)
+{
+	u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
+	u32 val = readl(reg);
+
+	val &= ~clear;
+	val |= set;
+
+	writel(val, reg);
+}
+
+static void sgpio_output_set(struct mchp_sgpio_priv *priv,
+			     struct mchp_sgpio_port_addr *addr,
+			     int value)
+{
+	u32 mask = 3 << (3 * addr->bit);
+
+	value = (value & 3) << (3 * addr->bit);
+	sgpio_clrsetbits(priv, REG_PORT_CONFIG, addr->port,
+			 MCHP_F_PORT_CFG_BIT_SOURCE(priv, mask),
+			 MCHP_F_PORT_CFG_BIT_SOURCE(priv, value));
+}
+
+static int sgpio_output_get(struct mchp_sgpio_priv *priv,
+			    struct mchp_sgpio_port_addr *addr)
+{
+	u32 portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
+	int ret;
+
+	ret = MCHP_X_PORT_CFG_BIT_SOURCE(priv, portval);
+	ret = !!(ret & (3 << (3 * addr->bit)));
+
+	return ret;
+}
+
+static int sgpio_input_get(struct mchp_sgpio_priv *priv,
+			   struct mchp_sgpio_port_addr *addr)
+{
+	int ret;
+
+	ret = !!(sgpio_readl(priv, REG_INPUT_DATA, addr->bit) &
+		 BIT(addr->port));
+
+	return ret;
+}
+
+static int sgpio_pinconf_get(struct pinctrl_dev *pctldev,
+			     unsigned int pin, unsigned long *config)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	struct mchp_sgpio_port_addr addr;
+	u32 param = pinconf_to_config_param(*config);
+	int val;
+
+	sgpio_pin_to_addr(priv, pin, &addr);
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_ENABLE:
+		val = addr.input;
+		break;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		val = !addr.input;
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		if (addr.input)
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
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	struct mchp_sgpio_port_addr addr;
+	u32 param, arg;
+	int cfg, err = 0;
+
+	sgpio_pin_to_addr(priv, pin, &addr);
+
+	for (cfg = 0; cfg < num_configs; cfg++) {
+		param = pinconf_to_config_param(configs[cfg]);
+		arg = pinconf_to_config_argument(configs[cfg]);
+
+		switch (param) {
+		case PIN_CONFIG_OUTPUT:
+			if (addr.input)
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
+				      unsigned int function,
+				      const char *const **groups,
+				      unsigned *const num_groups)
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
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	if (input != sgpio_is_input(priv, pin)) {
+		dev_err(priv->dev, "Pin %d direction as %s is not possible\n",
+			pin, input ? "input" : "output");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
+				     struct pinctrl_gpio_range *range,
+				     unsigned int offset)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	struct mchp_sgpio_port_addr addr;
+
+	sgpio_pin_to_addr(priv, offset, &addr);
+
+	if ((priv->ports & BIT(addr.port)) == 0) {
+		dev_warn(priv->dev, "%s: Request port %d for pin %d is not activated\n",
+			 __func__, addr.port, offset);
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
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->desc->npins;
+}
+
+static const char *sgpio_pctl_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int group)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->desc->pins[group].name;
+}
+
+static int sgpio_pctl_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int group,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &priv->desc->pins[group].number;
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
+static struct pinctrl_desc sgpio_desc = {
+	.name = "sgpio-pinctrl",
+	.pctlops = &sgpio_pctl_ops,
+	.pmxops = &sgpio_pmx_ops,
+	.confops = &sgpio_confops,
+	.owner = THIS_MODULE,
+};
+
+static int mchp_sgpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+
+	/* Fixed-position function */
+	return sgpio_is_input(priv, gpio) ? 0 : -EINVAL;
+}
+
+static int mchp_sgpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio, int value)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+	struct mchp_sgpio_port_addr addr;
+
+	sgpio_pin_to_addr(priv, gpio, &addr);
+
+	/* Fixed-position function */
+	if (addr.input)
+		return -EINVAL;
+
+	sgpio_output_set(priv, &addr, value);
+
+	return 0;
+}
+
+static int mchp_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+
+	return sgpio_is_input(priv, gpio); /* 0=out, 1=in */
+}
+
+static void mchp_sgpio_set_value(struct gpio_chip *gc,
+				unsigned int gpio, int value)
+{
+	mchp_sgpio_direction_output(gc, gpio, value);
+}
+
+static int mchp_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+	struct mchp_sgpio_port_addr addr;
+	int ret;
+
+	sgpio_pin_to_addr(priv, gpio, &addr);
+
+	if (sgpio_is_input(priv, gpio))
+		ret = sgpio_input_get(priv, &addr);
+	else
+		ret = sgpio_output_get(priv, &addr);
+
+	return ret;
+}
+
+static int mchp_sgpio_get_ports(struct mchp_sgpio_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args pinspec;
+	int count, i, ret;
+	u32 range_params[64];
+
+	/* Calculate bitcount */
+	for (count = 0, i = 0;; i++) {
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						       i, &pinspec);
+		if (ret)
+			break;
+		count += pinspec.args[2];
+	}
+
+	if (count == 0 ||
+	    count % MCHP_SGPIOS_PER_BANK ||
+	    count > (MCHP_SGPIO_BANK_DEPTH * MCHP_SGPIOS_PER_BANK * 2)) {
+		dev_err(dev, "Invalid gpio count %d\n", count);
+		return -EINVAL;
+	}
+	priv->ngpios = count;
+	priv->bitcount = count / MCHP_SGPIOS_PER_BANK / 2;
+
+	/* Calculate port mask */
+	ret = of_property_read_variable_u32_array(np,
+						  "microchip,sgpio-port-ranges",
+						  range_params,
+						  2,
+						  ARRAY_SIZE(range_params));
+	if (ret < 0 || ret % 2) {
+		dev_err(dev, "%s port range\n",
+			ret == -EINVAL ? "Missing" : "Invalid");
+		return ret;
+	}
+	for (i = 0; i < ret; i += 2) {
+		int start, end;
+
+		start = range_params[i];
+		end = range_params[i + 1];
+		if (start > end || end >= MCHP_SGPIOS_PER_BANK) {
+			dev_err(dev, "Ill-formed port-range [%d:%d]\n",
+				start, end);
+		}
+		priv->ports |= GENMASK(end, start);
+	}
+
+	dev_dbg(dev, "probe: gpios = %d, ports = 0x%08x, bit-count = %d\n",
+		priv->ngpios, priv->ports, priv->bitcount);
+
+	return 0;
+}
+
+static int mchp_sgpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+	int pin, base;
+
+	if (gpiospec->args[0] > MCHP_SGPIOS_PER_BANK ||
+	    gpiospec->args[1] > priv->bitcount)
+		return -EINVAL;
+	base = priv->bitcount * gpiospec->args[0];
+	pin = base + gpiospec->args[1];
+	/* Add to 2nd half of output range if output */
+	if (gpiospec->args[2] == PIN_OUTPUT)
+		pin += (priv->ngpios / 2);
+
+	if (pin > gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[3];
+
+	return pin;
+}
+
+static int mchp_sgpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mchp_sgpio_priv *priv;
+	int div_clock = 0, ret, port;
+	u32 val;
+	struct resource *regs;
+	struct clk *clk;
+	struct pinctrl_pin_desc *pins;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+
+	/* Get clock */
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		return PTR_ERR(clk);
+	}
+	div_clock = clk_get_rate(clk);
+	if (device_property_read_u32(dev, "microchip,sgpio-frequency",
+				     &priv->clock))
+		priv->clock = 12500000;
+	if (priv->clock <= 0 || priv->clock > div_clock) {
+		dev_err(dev, "Invalid frequency %d\n", priv->clock);
+		return -EINVAL;
+	}
+
+	/* Get register map */
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, regs);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+	priv->props = of_device_get_match_data(dev);
+
+	/* Get rest of device properties */
+	ret = mchp_sgpio_get_ports(priv);
+	if (ret)
+		return ret;
+
+	pins = devm_kzalloc(dev, sizeof(*pins)*priv->ngpios, GFP_KERNEL);
+	if (pins) {
+		int i;
+		char *p, *names;
+
+		names = devm_kzalloc(dev, PIN_NAM_SZ*priv->ngpios, GFP_KERNEL);
+
+		if (!names)
+			return -ENOMEM;
+
+		sgpio_desc.npins = priv->ngpios;
+		sgpio_desc.pins = pins;
+
+		for (p = names, i = 0; i < priv->ngpios; i++, p += PIN_NAM_SZ) {
+			struct mchp_sgpio_port_addr addr;
+
+			sgpio_pin_to_addr(priv, i, &addr);
+			snprintf(p, PIN_NAM_SZ, "SGPIO_%c_p%db%d",
+				 addr.input ? 'I' : 'O',
+				 addr.port, addr.bit);
+			pins[i].number = i;
+			pins[i].name = p;
+		}
+	} else
+		return -ENOMEM;
+
+	priv->desc = &sgpio_desc;
+	priv->pctl = devm_pinctrl_register(&pdev->dev, priv->desc, priv);
+	if (IS_ERR(priv->pctl)) {
+		dev_err(&pdev->dev, "Failed to register pinctrl\n");
+		return PTR_ERR(priv->pctl);
+	}
+
+	priv->gpio.label		= priv->props->label;
+	priv->gpio.parent		= dev;
+	priv->gpio.of_node		= dev->of_node;
+	priv->gpio.owner		= THIS_MODULE;
+	priv->gpio.get_direction	= mchp_sgpio_get_direction;
+	priv->gpio.direction_input	= mchp_sgpio_direction_input;
+	priv->gpio.direction_output	= mchp_sgpio_direction_output;
+	priv->gpio.get			= mchp_sgpio_get_value,
+	priv->gpio.set			= mchp_sgpio_set_value;
+	priv->gpio.request		= gpiochip_generic_request;
+	priv->gpio.free			= gpiochip_generic_free;
+	priv->gpio.of_xlate		= mchp_sgpio_of_xlate;
+	priv->gpio.of_gpio_n_cells      = 4;
+	priv->gpio.base			= -1;
+	priv->gpio.ngpio		= priv->ngpios;
+
+	sgpio_clrsetbits(priv, REG_SIO_CONFIG, 0,
+			 MCHP_M_CFG_SIO_PORT_WIDTH(priv),
+			 MCHP_F_CFG_SIO_PORT_WIDTH(priv, priv->bitcount - 1) |
+			 MCHP_M_CFG_SIO_AUTO_REPEAT(priv));
+	val = max(2, div_clock / priv->clock);
+	sgpio_clrsetbits(priv, REG_SIO_CLOCK, 0,
+			 MCHP_M_CLOCK_SIO_CLK_FREQ(priv),
+			 MCHP_F_CLOCK_SIO_CLK_FREQ(priv, val));
+
+	for (port = 0; port < MCHP_SGPIOS_PER_BANK; port++)
+		sgpio_writel(priv, 0, REG_PORT_CONFIG, port);
+	sgpio_writel(priv, priv->ports, REG_PORT_ENABLE, 0);
+
+	ret = devm_gpiochip_add_data(dev, &priv->gpio, priv);
+	if (ret == 0)
+		dev_info(dev, "Registered %d GPIOs\n", priv->ngpios);
+	else
+		dev_err(dev, "Failed to register: ret %d\n", ret);
+	return ret;
+}
+
+static const struct of_device_id mchp_sgpio_gpio_of_match[] = {
+	{
+		.compatible = "microchip,sparx5-sgpio",
+		.data = &props_sparx5,
+	}, {
+		.compatible = "mscc,luton-sgpio",
+		.data = &props_luton,
+	}, {
+		.compatible = "mscc,ocelot-sgpio",
+		.data = &props_ocelot,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver mchp_sgpio_pinctrl_driver = {
+	.driver = {
+		.name = "pinctrl-mchp-sgpio",
+		.of_match_table = mchp_sgpio_gpio_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = mchp_sgpio_probe,
+};
+builtin_platform_driver(mchp_sgpio_pinctrl_driver);
-- 
2.27.0

