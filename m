Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3EA1D1731
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388812AbgEMOLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:11:48 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:63716 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388793AbgEMOLs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589379107; x=1620915107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uSj6IEj06/F8qCJNjgPqJnrVD5PVPbd1aDsuvTeIJI=;
  b=2dXvAQ4ra7sbDzQ7joN9EfngKljyaQEfjbaYWP5a5axgUTs8Y1qa83ab
   mHEyy+FtREYzwE1QLH/uwM/X03GYqe0fgLy3pGZh9SszDbUvO0sGJGQgW
   XeLJvQq/QICpoM3mO6+HKisPtDLC+DkaEw6OaDt/1BSFIrZ02SNVHCYX0
   cZIMIoWL9YytL3+ThvPGIAfFN3FSIO+2XdX7uAOqcs/bnfMopHJY2XXqy
   +jKHyfZtuWXKRNri1xbgZmuZ/sI2lAOapclH5eFbY+OBfvT0pEgUramOy
   +nJ/159vAouRRnyY0omrZgCqfOggpR6EA9SP+bBbRgkJI7x1f/ZBwjOsH
   Q==;
IronPort-SDR: 7VqJgfXkqDGAQsb6Zvb9ArQqUPxffd1ahxF06tklllz0TtoZngMxUIbU1pCQWtz0ChJwQCKTJ/
 o6irXbpes8UwjY9mJ5MtcmeDIworq8L4lPi101VTHa4N6670JNZg8DIZ50XvAt9/oYyggRBCb3
 UCT/A0WtV0qwde86hpht09oycAcG+Wvaat/OqZelFMVEL792dT0u9MFzmmZpqo0cMDdMeLJk7E
 fj4IHYCmaQ3VicfBztZFTk7WfOJmvUe4ajaaLN+x7hyxB/Ljg31thRusl/Npix0kDuLvMoUeCA
 /h4=
X-IronPort-AV: E=Sophos;i="5.73,388,1583218800"; 
   d="scan'208";a="75776764"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 07:11:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 07:11:46 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 07:11:44 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/3] pinctrl: mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
Date:   Wed, 13 May 2020 16:11:33 +0200
Message-ID: <20200513141134.25819-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513141134.25819-1-lars.povlsen@microchip.com>
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
(SGPIO) device used in various SoC's.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                          |   1 +
 drivers/pinctrl/Kconfig              |  17 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-mchp-sgpio.c | 569 +++++++++++++++++++++++++++
 4 files changed, 588 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mchp-sgpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cdb63ca04670d..e5a7c41cdb6cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11237,6 +11237,7 @@ F:	Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
 F:	arch/mips/boot/dts/mscc/
 F:	arch/mips/configs/generic/board-ocelot.config
 F:	arch/mips/generic/board-ocelot.c
+F:	drivers/pinctrl/pinctrl-mchp-sgpio.c

 MICROSEMI SMART ARRAY SMARTPQI DRIVER (smartpqi)
 M:	Don Brace <don.brace@microsemi.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 834c59950d1cf..2b0e9021fd7e0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -396,6 +396,23 @@ config PINCTRL_OCELOT
 	select OF_GPIO
 	select REGMAP_MMIO

+config PINCTRL_MSCC_SGPIO
+	bool "Pinctrl driver for Microsemi Serial GPIO"
+	depends on OF
+	depends on HAS_IOMEM
+	select GPIOLIB
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select OF_GPIO
+	help
+          Support for the VCoreIII SoC serial GPIO device. By using a
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
index 0b36a1cfca8a1..1146ecc373edf 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_MSCC_SGPIO) += pinctrl-mchp-sgpio.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o

 obj-y				+= actions/
diff --git a/drivers/pinctrl/pinctrl-mchp-sgpio.c b/drivers/pinctrl/pinctrl-mchp-sgpio.c
new file mode 100644
index 0000000000000..e609f11137f48
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mchp-sgpio.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Microsemi SoCs serial gpio driver
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
+#define PIN_NAME_LEN	(sizeof("SGPIO_pXXbY")+1)
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
+struct mchp_sgpio_bf {
+	u8 beg;
+	u8 end;
+};
+
+struct mchp_sgpio_props {
+	const char *label;
+	u8 regoff[MAXREG];
+	struct mchp_sgpio_bf auto_repeat;
+	struct mchp_sgpio_bf port_width;
+	struct mchp_sgpio_bf clk_freq;
+	struct mchp_sgpio_bf bit_source;
+};
+
+#define __M(bf)		GENMASK((bf).end, (bf).beg)
+#define __F(bf, x)	(__M(bf) & ((x) << (bf).beg))
+#define __X(bf, x)	(((x) >> (bf).beg) & GENMASK(((bf).end - (bf).beg), 0))
+
+#define MSCC_M_CFG_SIO_AUTO_REPEAT(p)		BIT(p->props->auto_repeat.beg)
+#define MSCC_F_CFG_SIO_PORT_WIDTH(p, x)		__F(p->props->port_width, x)
+#define MSCC_M_CFG_SIO_PORT_WIDTH(p)		__M(p->props->port_width)
+#define MSCC_F_CLOCK_SIO_CLK_FREQ(p, x)		__F(p->props->clk_freq, x)
+#define MSCC_M_CLOCK_SIO_CLK_FREQ(p)		__M(p->props->clk_freq)
+#define MSCC_F_PORT_CFG_BIT_SOURCE(p, x)	__F(p->props->bit_source, x)
+#define MSCC_X_PORT_CFG_BIT_SOURCE(p, x)	__X(p->props->bit_source, x)
+
+const struct mchp_sgpio_props props_luton = {
+	.label = "luton-sgpio",
+	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
+	.auto_repeat = { 5, 5 },
+	.port_width  = { 2, 3 },
+	.clk_freq    = { 0, 11 },
+	.bit_source  = { 0, 11 },
+};
+
+const struct mchp_sgpio_props props_ocelot = {
+	.label = "ocelot-sgpio",
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.auto_repeat = { 10, 10 },
+	.port_width  = {  7, 8  },
+	.clk_freq    = {  8, 19 },
+	.bit_source  = { 12, 23 },
+};
+
+static const char * const functions[] = { "gpio" };
+
+struct mchp_sgpio_priv {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	struct gpio_chip gpio;
+	u32 bitcount;
+	u32 ports;
+	u32 clock;
+	u32 mode[MSCC_SGPIOS_PER_BANK];
+	u32 __iomem *regs;
+	struct pinctrl_desc *desc;
+	const struct mchp_sgpio_props *props;
+};
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
+static void sgpio_clrsetbits(struct mchp_sgpio_priv *priv,
+			     u32 rno, u32 off, u32 clear, u32 set)
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
+			     int pin, int value)
+{
+	u32 port = pin % MSCC_SGPIOS_PER_BANK;
+	u32 bit = pin / MSCC_SGPIOS_PER_BANK;
+	u32 mask = 3 << (3 * bit);
+
+	dev_dbg(priv->dev, "%s: port %d, bit %d, value %d\n",
+		__func__, port, bit, value);
+
+	value = (value & 3) << (3 * bit);
+	sgpio_clrsetbits(priv, REG_PORT_CONFIG, port,
+			 MSCC_F_PORT_CFG_BIT_SOURCE(priv, mask),
+			 MSCC_F_PORT_CFG_BIT_SOURCE(priv, value));
+}
+
+static int sgpio_output_get(struct mchp_sgpio_priv *priv, int pin)
+{
+	u32 port = pin % MSCC_SGPIOS_PER_BANK;
+	u32 bit = pin / MSCC_SGPIOS_PER_BANK;
+	u32 portval = sgpio_readl(priv, REG_PORT_CONFIG, port);
+	int ret;
+
+	ret = MSCC_X_PORT_CFG_BIT_SOURCE(priv, portval);
+	ret = !!(ret & (3 << (3 * bit)));
+
+	dev_dbg(priv->dev, "%s: port %d, bit %d, value %d\n",
+		__func__, port, bit, ret);
+
+	return ret;
+}
+
+static int sgpio_input_get(struct mchp_sgpio_priv *priv, int pin)
+{
+	u32 port = pin % MSCC_SGPIOS_PER_BANK;
+	u32 bit = pin / MSCC_SGPIOS_PER_BANK;
+	int ret;
+
+	ret = !!(sgpio_readl(priv, REG_INPUT_DATA, bit) & BIT(port));
+
+	dev_dbg(priv->dev, "%s: port %d, bit %d, value %d\n",
+		__func__, port, bit, ret);
+
+	return ret;
+}
+
+static int sgpio_pinconf_get(struct pinctrl_dev *pctldev,
+			     unsigned int pin, unsigned long *config)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	u32 param = pinconf_to_config_param(*config);
+	int val;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_ENABLE:
+		val = false;
+		break;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		val = true;
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		val = sgpio_output_get(priv, pin);
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
+int sgpio_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			unsigned long *configs, unsigned int num_configs)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	u32 param, arg;
+	int cfg, err = 0;
+
+	for (cfg = 0; cfg < num_configs; cfg++) {
+		param = pinconf_to_config_param(configs[cfg]);
+		arg = pinconf_to_config_argument(configs[cfg]);
+
+		switch (param) {
+		case PIN_CONFIG_OUTPUT:
+			sgpio_output_set(priv, pin, arg);
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
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	dev_dbg(priv->dev, "%s\n", __func__);
+	return 1;
+}
+
+static const char *sgpio_get_function_name(struct pinctrl_dev *pctldev,
+					   unsigned int function)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	dev_dbg(priv->dev, "%s\n", __func__);
+
+	return functions[0];
+}
+
+static int sgpio_get_function_groups(struct pinctrl_dev *pctldev,
+				      unsigned int function,
+				      const char *const **groups,
+				      unsigned *const num_groups)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	dev_dbg(priv->dev, "%s\n", __func__);
+
+	*groups  = functions;
+	*num_groups = ARRAY_SIZE(functions);
+
+	return 0;
+}
+
+static int sgpio_pinmux_set_mux(struct pinctrl_dev *pctldev,
+				unsigned int selector, unsigned int group)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	dev_dbg(priv->dev, "%s: sel %d grp %d\n", __func__, selector, group);
+
+	return 0;
+}
+
+static int sgpio_gpio_set_direction(struct pinctrl_dev *pctldev,
+				    struct pinctrl_gpio_range *range,
+				    unsigned int pin, bool input)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	dev_dbg(priv->dev, "%s: pin %d input %d\n", __func__, pin, input);
+
+	return 0;
+}
+
+static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
+				     struct pinctrl_gpio_range *range,
+				     unsigned int offset)
+{
+	struct mchp_sgpio_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	if ((priv->ports & BIT(offset)) == 0) {
+		dev_warn(priv->dev, "%s: Request port pin %d is not activated\n",
+			 __func__, offset);
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
+	u32 port = gpio % MSCC_SGPIOS_PER_BANK;
+	u32 bit = gpio / MSCC_SGPIOS_PER_BANK;
+
+	/* Set mode => input mode */
+	priv->mode[port] |= BIT(bit);
+
+	return 0;
+}
+
+static int mchp_sgpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio, int value)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+	u32 port = gpio % MSCC_SGPIOS_PER_BANK;
+	u32 bit = gpio / MSCC_SGPIOS_PER_BANK;
+
+	sgpio_output_set(priv, gpio, value);
+
+	/* Clear mode => output mode */
+	priv->mode[port] &= ~BIT(bit);
+
+	return 0;
+}
+
+static int mchp_sgpio_get_function(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
+	u32 port = gpio % MSCC_SGPIOS_PER_BANK;
+	u32 bit = gpio / MSCC_SGPIOS_PER_BANK;
+	u32 val = priv->mode[port] & BIT(bit);
+
+	return !!val;		/* 0=out, 1=in */
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
+	const struct pinctrl_pin_desc *pin = &priv->desc->pins[gpio];
+	int ret;
+
+	if (mchp_sgpio_get_function(gc, gpio))
+		ret = sgpio_input_get(priv, gpio);
+	else
+		ret = sgpio_output_get(priv, gpio);
+
+	dev_dbg(priv->dev, "get: gpio %d (%s), value %d\n",
+		gpio, pin->name, ret);
+
+	return ret;
+}
+
+static int mchp_sgpio_get_count(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args pinspec;
+	int count, index, ret;
+
+	for (count = 0, index = 0;; index++) {
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						       index, &pinspec);
+		if (ret)
+			break;
+
+		dev_dbg(dev, "%s: Add %d gpios\n", __func__, pinspec.args[2]);
+		count += pinspec.args[2];
+	}
+	dev_dbg(dev, "%s: Have %d gpios\n", __func__, count);
+	return count;
+}
+
+static int mchp_sgpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mchp_sgpio_priv *priv;
+	int div_clock = 0, ret, port;
+	u32 val, ngpios;
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
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		return PTR_ERR(clk);
+	}
+	div_clock = clk_get_rate(clk);
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, regs);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+	priv->props = of_device_get_match_data(dev);
+	if (device_property_read_u32(dev, "microchip,sgpio-ports",
+				     &priv->ports))
+		priv->ports = 0xFFFFFFFF;
+	if (device_property_read_u32(dev, "microchip,sgpio-frequency",
+				     &priv->clock))
+		priv->clock = 12500000;
+	if (priv->clock <= 0 || priv->clock > div_clock) {
+		dev_err(dev, "Invalid frequency %d\n", priv->clock);
+		return -EINVAL;
+	}
+	ngpios = mchp_sgpio_get_count(dev);
+	if (ngpios < 1 ||
+	    ngpios > (MSCC_SGPIO_BANK_DEPTH * MSCC_SGPIOS_PER_BANK)) {
+		dev_err(dev, "Invalid gpio count %d\n", ngpios);
+		return -EINVAL;
+	}
+
+	pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
+	if (pins) {
+		int i;
+		char *p, *names;
+
+		names = devm_kzalloc(dev, PIN_NAME_LEN*ngpios, GFP_KERNEL);
+
+		if (!names)
+			return -ENOMEM;
+
+		sgpio_desc.npins = ngpios;
+		sgpio_desc.pins = pins;
+
+		for (p = names, i = 0; i < ngpios; i++, p += PIN_NAME_LEN) {
+			snprintf(p, PIN_NAME_LEN, "SGPIO_p%db%d",
+				 i % MSCC_SGPIOS_PER_BANK,
+				 i / MSCC_SGPIOS_PER_BANK);
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
+	priv->gpio.get_direction	= mchp_sgpio_get_function;
+	priv->gpio.direction_input	= mchp_sgpio_direction_input;
+	priv->gpio.direction_output	= mchp_sgpio_direction_output;
+	priv->gpio.get			= mchp_sgpio_get_value,
+	priv->gpio.set			= mchp_sgpio_set_value;
+	priv->gpio.request		= gpiochip_generic_request;
+	priv->gpio.free			= gpiochip_generic_free;
+	priv->gpio.base			= -1;
+	priv->gpio.ngpio		= ngpios;
+
+	priv->bitcount = DIV_ROUND_UP(ngpios, MSCC_SGPIOS_PER_BANK);
+	dev_dbg(dev, "probe: gpios = %d, bit-count = %d\n",
+		ngpios, priv->bitcount);
+
+	sgpio_clrsetbits(priv, REG_SIO_CONFIG, 0,
+			 MSCC_M_CFG_SIO_PORT_WIDTH(priv),
+			 MSCC_F_CFG_SIO_PORT_WIDTH(priv, priv->bitcount - 1) |
+			 MSCC_M_CFG_SIO_AUTO_REPEAT(priv));
+	val = div_clock / priv->clock;
+	dev_dbg(dev, "probe: div-clock = %d KHz, freq = %d KHz, div = %d\n",
+		div_clock / 1000, priv->clock / 1000, val);
+	sgpio_clrsetbits(priv, REG_SIO_CLOCK, 0,
+			 MSCC_M_CLOCK_SIO_CLK_FREQ(priv),
+			 MSCC_F_CLOCK_SIO_CLK_FREQ(priv, val));
+
+	for (port = 0; port < MSCC_SGPIOS_PER_BANK; port++)
+		sgpio_writel(priv, 0, REG_PORT_CONFIG, port);
+	sgpio_writel(priv, priv->ports, REG_PORT_ENABLE, 0);
+
+	ret = devm_gpiochip_add_data(dev, &priv->gpio, priv);
+	if (ret == 0)
+		dev_info(dev, "Registered %d GPIOs\n", ngpios);
+	else
+		dev_err(dev, "Failed to register: ret %d\n", ret);
+	return ret;
+}
+
+static const struct of_device_id mchp_sgpio_gpio_of_match[] = {
+	{
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
2.26.2
