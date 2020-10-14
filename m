Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AC828DE4D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 12:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgJNKHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 06:07:37 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:16554 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbgJNKH0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 06:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602670044; x=1634206044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=etE4/x2KZ3jyqQ6+gSAB7tsoxKoi3Q36Uk9cbtnjqmw=;
  b=Zif0IjzlSij3di2t938pl3ORGfUBxXiTP/YunkDzqIGZcei+o212SeC9
   rmfRG4B8pJamQszC9JkeGuBB7XHSG+J202Z6swjvII2WW/jBvFoOrPhIx
   AOcXHbTBmQBG51G3un8slyaRrn6wOHOd2Kp0Apoi0jpQrktufk0DdScYg
   iSt0zM+rKnFfXFW8mRX637hmWgR2cC+4lC28dkB/BNzKVpapfpoz5b97k
   TknrsPr42/YLqH6lzFW2ImB85CcWJerv7E8u5a6sESm81OUydlcVYNzbN
   oAYFIPaPP4eiAF7ISmd5Mud9MMzysvYYfWTTNv2ET1OgrAH1y/8dHiINY
   g==;
IronPort-SDR: vuQWoPvo//vrhzj14wYZEJpzs5hXIQmJPuWvY2F37hWj/Sp/6w66i2dBi1g/l/lxSQtsG0Fu8y
 15EZ3Szo7ZQYbOFB22krmaIkbsRsvJOkdnJxFZzws1DKv/r/LDJlOLcG/WeyeNyRVIwTMczSGg
 aGB2IKpYJ5CHF66FOMs+hBzF31GTfhvnHN7cIBg4tYfZmkyxu0VzNFx5ezEKyijSyktd1XBKIL
 W5T85IPAGCnzP9aEIcxlHXN1o4Fh/+gJhARPK4Uxc5geagLYzZV/fcYySVKe8ph7ZTiDidSQUt
 L4M=
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="95285485"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2020 03:07:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 14 Oct 2020 03:07:24 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 14 Oct 2020 03:07:22 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v6 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
Date:   Wed, 14 Oct 2020 12:07:06 +0200
Message-ID: <20201014100707.2728637-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201014100707.2728637-1-lars.povlsen@microchip.com>
References: <20201014100707.2728637-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
(SGPIO) device used in various SoC's.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                               |   1 +
 drivers/pinctrl/Kconfig                   |  18 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 667 ++++++++++++++++++++++
 4 files changed, 687 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc70e3ab428b..a8cc028b84d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2137,6 +2137,7 @@ M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm64/boot/dts/microchip/
+F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
 N:	sparx5
 
 ARM/MIOA701 MACHINE SUPPORT
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..1b3527d4c3c8 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -404,6 +404,24 @@ config PINCTRL_OCELOT
 	select OF_GPIO
 	select REGMAP_MMIO
 
+config PINCTRL_MICROCHIP_SGPIO
+	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
+	depends on OF
+	depends on HAS_IOMEM
+	select GPIOLIB
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select OF_GPIO
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
index 1731b2154df9..347b0e015960 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 
 obj-y				+= actions/
diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
new file mode 100644
index 000000000000..64d2905d60b7
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -0,0 +1,667 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+
+#define SGPIO_BITS_PER_WORD	32
+#define SGPIO_MAX_BITS		4
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
+struct sgpio_properties {
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
+#define SGPIO_M_CFG_SIO_AUTO_REPEAT(p)	  ((p)->properties->auto_repeat)
+#define SGPIO_F_CFG_SIO_PORT_WIDTH(p, x)  __BF_PREP((p)->properties->port_width, x)
+#define SGPIO_M_CFG_SIO_PORT_WIDTH(p)	  ((p)->properties->port_width)
+#define SGPIO_F_CLOCK_SIO_CLK_FREQ(p, x)  __BF_PREP((p)->properties->clk_freq, x)
+#define SGPIO_M_CLOCK_SIO_CLK_FREQ(p)     ((p)->properties->clk_freq)
+#define SGPIO_F_PORT_CFG_BIT_SOURCE(p, x) __BF_PREP((p)->properties->bit_source, x)
+#define SGPIO_X_PORT_CFG_BIT_SOURCE(p, x) __BF_GET((p)->properties->bit_source, x)
+
+const struct sgpio_properties properties_luton = {
+	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
+	.auto_repeat = BIT(5),
+	.port_width  = GENMASK(3, 2),
+	.clk_freq    = GENMASK(11, 0),
+	.bit_source  = GENMASK(11, 0),
+};
+
+const struct sgpio_properties properties_ocelot = {
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.auto_repeat = BIT(10),
+	.port_width  = GENMASK(8, 7),
+	.clk_freq    = GENMASK(19, 8),
+	.bit_source  = GENMASK(23, 12),
+};
+
+const struct sgpio_properties properties_sparx5 = {
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.auto_repeat = BIT(6),
+	.port_width  = GENMASK(4, 3),
+	.clk_freq    = GENMASK(19, 8),
+	.bit_source  = GENMASK(23, 12),
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
+static void sgpio_output_set(struct sgpio_priv *priv,
+			     struct sgpio_port_addr *addr,
+			     int value)
+{
+	unsigned int bit = 3 * addr->bit;
+
+	sgpio_clrsetbits(priv, REG_PORT_CONFIG, addr->port,
+			 SGPIO_F_PORT_CFG_BIT_SOURCE(priv, BIT(bit)),
+			 SGPIO_F_PORT_CFG_BIT_SOURCE(priv, value << bit));
+}
+
+static int sgpio_output_get(struct sgpio_priv *priv,
+			    struct sgpio_port_addr *addr)
+{
+	u32 portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
+	unsigned int bit = 3 * addr->bit;
+
+	return !!(SGPIO_X_PORT_CFG_BIT_SOURCE(priv, portval) & BIT(bit));
+}
+
+static int sgpio_input_get(struct sgpio_priv *priv,
+			   struct sgpio_port_addr *addr)
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
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
+	u32 param = pinconf_to_config_param(*config);
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
+		return -EOPNOTSUPP;
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
+			if (bank->is_input)
+				return -EINVAL;
+			sgpio_output_set(priv, &addr, arg);
+			break;
+
+		default:
+			err = -EOPNOTSUPP;
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
+	if (input != bank->is_input) {
+		dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
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
+	struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
+	struct sgpio_priv *priv = bank->priv;
+	struct sgpio_port_addr addr;
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
+	int ret;
+
+	sgpio_pin_to_addr(priv, gpio, &addr);
+
+	if (bank->is_input)
+		ret = sgpio_input_get(priv, &addr);
+	else
+		ret = sgpio_output_get(priv, &addr);
+
+	return ret;
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
+	/* Note that the SGIO pin is defined by *2* numbers, a port
+	 * number between 0 and 31, and a bit index, 0 to 3.
+	 */
+	if (gpiospec->args[0] > SGPIO_BITS_PER_WORD ||
+	    gpiospec->args[1] > priv->bitcount)
+		return -EINVAL;
+
+	pin = gpiospec->args[1] + (gpiospec->args[0] * priv->bitcount);
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
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	int i, ret;
+	u32 range_params[64];
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
+	struct sgpio_bank *bank;
+	struct pinctrl_pin_desc *pins;
+	struct pinctrl_desc *pctl_desc;
+	struct pinctrl_dev *pctldev;
+	struct gpio_chip *gc;
+	bool is_input = (bankno == 0);
+	int ret;
+	u32 ngpios;
+
+	/* Get overall bank struct */
+	bank = is_input ? &priv->in : &priv->out;
+	bank->is_input = is_input;
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
+					 is_input ? "in" : "out");
+	pctl_desc->pctlops = &sgpio_pctl_ops;
+	pctl_desc->pmxops = &sgpio_pmx_ops;
+	pctl_desc->confops = &sgpio_confops;
+	pctl_desc->owner = THIS_MODULE;
+
+	pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
+	if (pins) {
+		int i;
+		char *p, *names;
+
+		names = devm_kzalloc(dev, PIN_NAM_SZ*ngpios, GFP_KERNEL);
+
+		if (!names)
+			return -ENOMEM;
+
+		pctl_desc->npins = ngpios;
+		pctl_desc->pins = pins;
+
+		for (p = names, i = 0; i < ngpios; i++, p += PIN_NAM_SZ) {
+			struct sgpio_port_addr addr;
+
+			sgpio_pin_to_addr(priv, i, &addr);
+			snprintf(p, PIN_NAM_SZ, "SGPIO_%c_p%db%d",
+				 is_input ? 'I' : 'O',
+				 addr.port, addr.bit);
+			pins[i].number = i;
+			pins[i].name = p;
+		}
+	} else
+		return -ENOMEM;
+
+	pctldev = devm_pinctrl_register(dev, pctl_desc, bank);
+	if (IS_ERR(pctldev)) {
+		dev_err(dev, "Failed to register pinctrl\n");
+		return PTR_ERR(pctldev);
+	}
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
+	if (ret == 0)
+		dev_info(dev, "Registered %d GPIOs\n", ngpios);
+	else
+		dev_err(dev, "Failed to register: ret %d\n", ret);
+
+	return ret;
+}
+
+static int microchip_sgpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *fwnode;
+	struct sgpio_priv *priv;
+	int div_clock = 0, ret, port;
+	u32 val;
+	struct resource *regs;
+	struct clk *clk;
+	int i, nbanks;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	/* Get clock */
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		return PTR_ERR(clk);
+	}
+	div_clock = clk_get_rate(clk);
+	if (device_property_read_u32(dev, "bus-frequency", &priv->clock))
+		priv->clock = 12500000;
+	if (priv->clock <= 0 || priv->clock > (div_clock / 2)) {
+		dev_err(dev, "Invalid frequency %d\n", priv->clock);
+		return -EINVAL;
+	}
+
+	/* Get register map */
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, regs);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+	priv->properties = of_device_get_match_data(dev);
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
+		return -EINVAL;
+	}
+
+	sgpio_clrsetbits(priv, REG_SIO_CONFIG, 0,
+			 SGPIO_M_CFG_SIO_PORT_WIDTH(priv),
+			 SGPIO_F_CFG_SIO_PORT_WIDTH(priv, priv->bitcount - 1) |
+			 SGPIO_M_CFG_SIO_AUTO_REPEAT(priv));
+	val = max(2U, div_clock / priv->clock);
+	sgpio_clrsetbits(priv, REG_SIO_CLOCK, 0,
+			 SGPIO_M_CLOCK_SIO_CLK_FREQ(priv),
+			 SGPIO_F_CLOCK_SIO_CLK_FREQ(priv, val));
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

