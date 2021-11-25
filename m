Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAAF45D7D8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 11:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354402AbhKYKDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 05:03:09 -0500
Received: from mx.socionext.com ([202.248.49.38]:14420 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348015AbhKYKBJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 05:01:09 -0500
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 25 Nov 2021 18:57:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id F06C4205C83D;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 25 Nov 2021 18:57:56 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id A0246B62AC;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 8CB4910D20;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orito.takao@socionext.com,
        sugaya.taichi@socionext.com,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v3 1/2] pinctrl: milbeaut: Add Milbeaut M10V pinctrl
Date:   Thu, 25 Nov 2021 18:57:55 +0900
Message-Id: <1637834276-10466-2-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
References: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Add Milbeaut M10V pinctrl.
The M10V has the pins that can be used GPIOs or take multiple other
functions.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 drivers/pinctrl/Kconfig            |   8 +
 drivers/pinctrl/Makefile           |   1 +
 drivers/pinctrl/pinctrl-milbeaut.c | 406 +++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-milbeaut.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6a961d5..65f2038 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -223,6 +223,14 @@ config PINCTRL_OXNAS
 	select GPIOLIB_IRQCHIP
 	select MFD_SYSCON
 
+config PINCTRL_MILBEAUT
+	bool
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select OF_GPIO
+	select REGMAP_MMIO
+
 config PINCTRL_ROCKCHIP
 	tristate "Rockchip gpio and pinctrl driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 5e63de2..9016094 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PINCTRL_MCP23S08_I2C)	+= pinctrl-mcp23s08_i2c.o
 obj-$(CONFIG_PINCTRL_MCP23S08_SPI)	+= pinctrl-mcp23s08_spi.o
 obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
+obj-$(CONFIG_PINCTRL_MILBEAUT)	+= pinctrl-milbeaut.o
 obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
diff --git a/drivers/pinctrl/pinctrl-milbeaut.c b/drivers/pinctrl/pinctrl-milbeaut.c
new file mode 100644
index 0000000..474ef001
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-milbeaut.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Socionext Inc.
+ * Copyright (C) 2015 Linaro Ltd.
+ * Author: Jassi Brar <jaswinder.singh@linaro.org>
+ * Author: Taichi Sugaya <sugaya.taichi@socionext.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#include "pinctrl-utils.h"
+
+#define PDR		0xc
+#define DDR		0x10c
+#define EPCR		0x20c
+#define PUDER		0x30c
+#define PUDCR		0x40c
+
+#define M10V_BANKS	20
+#define PINS_PER_BANK	8
+#define M10V_TOTAL_PINS	(M10V_BANKS * PINS_PER_BANK)
+#define PINS_PER_REG	16
+
+struct m10v_pinctrl {
+	void __iomem		*base;
+	struct device		*dev;
+	struct gpio_chip	gc;
+	struct pinctrl_desc	pd;
+	char			pin_names[4 * M10V_TOTAL_PINS];
+	struct pinctrl_pin_desc	pins[M10V_TOTAL_PINS];
+	unsigned int		gpins[M10V_TOTAL_PINS][1]; /* 1 pin-per-group */
+	spinlock_t		lock;
+};
+
+struct milbeaut_function {
+	const char		*name;
+	const char * const	*groups;
+	unsigned int		ngroups;
+};
+
+enum mlb_reg_type {
+	E_MLB_GPIO_PDR,
+	E_MLB_GPIO_DDR,
+	E_MLB_GPIO_EPCR,
+	E_MLB_GPIO_PUDER,
+	E_MLB_GPIO_PUDCR,
+};
+
+static const unsigned long
+	m10v_gpio_reg_offset[] = {PDR, DDR, EPCR, PUDER, PUDCR};
+
+static const char m10v_bank_name[] = {'6', '7', '8', '9', 'A', 'B', 'C', 'D',
+				      'E', 'F', 'G', 'H', 'W', 'J', 'K', 'L',
+				      'M', 'N', 'Y', 'P'};
+static const char * const usio0_m10v_grps[] = {"PE2", "PE3", "PF0"};
+static const char * const usio1_m10v_grps[] = {"PE4", "PE5", "PF1"};
+static const char * const usio2_m10v_grps[] = {"PE0", "PE1"};
+static const char * const usio3_m10v_grps[] = {"PY0", "PY1", "PY2"};
+static const char * const usio4_m10v_grps[] = {"PP0", "PP1", "PP2"};
+static const char * const usio5_m10v_grps[] = {"PM0", "PM1", "PM3"};
+static const char * const usio6_m10v_grps[] = {"PN0", "PN1", "PN3"};
+static const char * const usio7_m10v_grps[] = {"PY3", "PY5", "PY6"};
+static const char *gpio_m10v_grps[M10V_TOTAL_PINS];
+
+static const struct milbeaut_function m10v_functions[] = {
+#define FUNC_M10V(fname)					\
+	{							\
+		.name = #fname,					\
+		.groups = fname##_m10v_grps,			\
+		.ngroups = ARRAY_SIZE(fname##_m10v_grps),	\
+	}
+	FUNC_M10V(gpio), /* GPIO always at index 0 */
+	FUNC_M10V(usio0),
+	FUNC_M10V(usio1),
+	FUNC_M10V(usio2),
+	FUNC_M10V(usio3),
+	FUNC_M10V(usio4),
+	FUNC_M10V(usio5),
+	FUNC_M10V(usio6),
+	FUNC_M10V(usio7),
+};
+
+static const struct milbeaut_function *milbeaut_functions;
+
+static void m10v_gpio_reg_write(struct m10v_pinctrl *pctl, int pin,
+			    int set, enum mlb_reg_type type)
+{
+	u32 reg, shift, val;
+	unsigned long flags;
+
+	reg = m10v_gpio_reg_offset[type] + pin / PINS_PER_REG * 4;
+	shift = pin % PINS_PER_REG;
+
+	switch (type) {
+	case E_MLB_GPIO_PDR:
+		val = BIT(shift + 16) | (set << shift);
+		writel_relaxed(val, pctl->base + reg);
+		break;
+	case E_MLB_GPIO_DDR:
+	case E_MLB_GPIO_EPCR:
+	case E_MLB_GPIO_PUDER:
+	case E_MLB_GPIO_PUDCR:
+		spin_lock_irqsave(&pctl->lock, flags);
+		val = readl_relaxed(pctl->base + reg);
+		if (set)
+			val |= BIT(shift);
+		else
+			val &= ~BIT(shift);
+		writel_relaxed(val, pctl->base + reg);
+		spin_unlock_irqrestore(&pctl->lock, flags);
+		break;
+	default:
+		break;
+	}
+}
+
+static int m10v_gpio_reg_read(struct m10v_pinctrl *pctl, int pin,
+			   enum mlb_reg_type type)
+{
+	u32 reg, shift, val;
+
+	reg = m10v_gpio_reg_offset[type] + pin / PINS_PER_REG * 4;
+	shift = pin % PINS_PER_REG;
+
+	val = readl_relaxed(pctl->base + reg);
+	return !!(val & BIT(shift));
+}
+
+static int m10v_pconf_group_set(struct pinctrl_dev *pctldev,
+				 unsigned int group,
+				 unsigned long *configs,
+				 unsigned int num_configs)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	u32 pin;
+	int i;
+
+	pin = pctl->gpins[group][0];
+	for (i = 0; i < num_configs; i++) {
+		switch (pinconf_to_config_param(configs[i])) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			/* select "Up" before "Pull" enabled */
+			m10v_gpio_reg_write(pctl, pin, 1, E_MLB_GPIO_PUDCR);
+			m10v_gpio_reg_write(pctl, pin, 1, E_MLB_GPIO_PUDER);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			/* select "Down" before "Pull" enabled */
+			m10v_gpio_reg_write(pctl, pin, 0, E_MLB_GPIO_PUDCR);
+			m10v_gpio_reg_write(pctl, pin, 1, E_MLB_GPIO_PUDER);
+			break;
+		case PIN_CONFIG_BIAS_DISABLE:
+			m10v_gpio_reg_write(pctl, pin, 0, E_MLB_GPIO_PUDER);
+			break;
+		default:
+			break;
+		}
+	}
+	return 0;
+}
+
+static const struct pinconf_ops m10v_pconf_ops = {
+	.pin_config_group_set	= m10v_pconf_group_set,
+};
+
+static int m10v_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return M10V_TOTAL_PINS;
+}
+
+static const char *m10v_pctrl_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int pin)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return &pctl->pin_names[4 * pin];
+}
+
+static int m10v_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int group,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctl->gpins[group];
+	*num_pins = 1;
+	return 0;
+}
+
+static const struct pinctrl_ops m10v_pctrl_ops = {
+	.get_groups_count	= m10v_pctrl_get_groups_count,
+	.get_group_name		= m10v_pctrl_get_group_name,
+	.get_group_pins		= m10v_pctrl_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int m10v_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(m10v_functions);
+}
+
+static const char *m10v_pmx_get_func_name(struct pinctrl_dev *pctldev,
+					   unsigned int function)
+{
+	return milbeaut_functions[function].name;
+}
+
+static int m10v_pmx_get_func_groups(struct pinctrl_dev *pctldev,
+				     unsigned int function,
+				     const char * const **groups,
+				     unsigned * const num_groups)
+{
+	*groups = milbeaut_functions[function].groups;
+	*num_groups = milbeaut_functions[function].ngroups;
+	return 0;
+}
+
+static void m10v_pin_to_function(struct m10v_pinctrl *pctl,
+				 unsigned int pin,
+				 bool en)
+{
+	/*
+	 * true:  pin to functional purpose
+	 * false: pin to gpio
+	 */
+	m10v_gpio_reg_write(pctl, pin, en, E_MLB_GPIO_EPCR);
+}
+
+static int m10v_pmx_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function,
+			     unsigned int group)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	u32 pin = pctl->gpins[group][0]; /* each group has exactly 1 pin */
+
+	m10v_pin_to_function(pctl, pin, !!function);
+	return 0;
+}
+
+static int
+m10v_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+			struct pinctrl_gpio_range *range,
+			unsigned int pin, bool input)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	m10v_gpio_reg_write(pctl, pin, !input, E_MLB_GPIO_DDR);
+	return 0;
+}
+
+static int
+m10v_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
+			    struct pinctrl_gpio_range *range,
+			    unsigned int pin)
+{
+	struct m10v_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	m10v_pin_to_function(pctl, pin, false);
+	return 0;
+}
+
+static const struct pinmux_ops m10v_pmx_ops = {
+	.get_functions_count	= m10v_pmx_get_funcs_cnt,
+	.get_function_name	= m10v_pmx_get_func_name,
+	.get_function_groups	= m10v_pmx_get_func_groups,
+	.set_mux		= m10v_pmx_set_mux,
+	.gpio_set_direction	= m10v_pmx_gpio_set_direction,
+	.gpio_request_enable	= m10v_pmx_gpio_request_enable,
+	.strict			= true,
+};
+
+static int m10v_gpio_get(struct gpio_chip *gc, unsigned int group)
+{
+	struct m10v_pinctrl *pctl = gpiochip_get_data(gc);
+	u32 pin = pctl->gpins[group][0];
+
+	return m10v_gpio_reg_read(pctl, pin, E_MLB_GPIO_PDR);
+}
+
+static void m10v_gpio_set(struct gpio_chip *gc, unsigned int group, int set)
+{
+	struct m10v_pinctrl *pctl = gpiochip_get_data(gc);
+	u32 pin = pctl->gpins[group][0];
+
+	m10v_gpio_reg_write(pctl, pin, set, E_MLB_GPIO_PDR);
+}
+
+static int m10v_gpio_direction_input(struct gpio_chip *gc,
+		unsigned int offset)
+{
+	return pinctrl_gpio_direction_input(gc->base + offset);
+}
+
+static int m10v_gpio_direction_output(struct gpio_chip *gc,
+		unsigned int offset, int value)
+{
+	int ret;
+
+	ret = pinctrl_gpio_direction_output(gc->base + offset);
+	if (!ret)
+		m10v_gpio_set(gc, offset, value);
+
+	return ret;
+}
+
+static const struct of_device_id m10v_pmatch[] = {
+	{ .compatible = "socionext,milbeaut-m10v-pinctrl" },
+	{},
+};
+
+static int m10v_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct pinctrl_dev *pctl_dev;
+	struct m10v_pinctrl *pctl;
+	struct pinctrl_desc *pd;
+	struct gpio_chip *gc;
+	struct resource *res;
+	int i, ret, tpins;
+
+	pctl = devm_kzalloc(&pdev->dev,	sizeof(*pctl),
+				GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+
+	pctl->dev = &pdev->dev;
+	milbeaut_functions = m10v_functions;
+	tpins = M10V_TOTAL_PINS;
+
+	pd = &pctl->pd;
+	gc = &pctl->gc;
+	spin_lock_init(&pctl->lock);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pinctrl");
+	pctl->base = devm_ioremap_resource(&pdev->dev, res);
+	if (!pctl->base)
+		return -EINVAL;
+
+	for (i = 0; i < tpins; i++) {
+		pctl->pins[i].number = i;
+		pctl->pins[i].name = &pctl->pin_names[4 * i];
+		snprintf(&pctl->pin_names[4 * i], 4, "P%c%d",
+			m10v_bank_name[i / PINS_PER_BANK], i % PINS_PER_BANK);
+		gpio_m10v_grps[i] = &pctl->pin_names[4 * i];
+		pctl->gpins[i][0] = i;
+	}
+	/* absent or incomplete entries allow all access */
+	pd->name = dev_name(&pdev->dev);
+	pd->pins = pctl->pins;
+	pd->npins = tpins;
+	pd->pctlops = &m10v_pctrl_ops;
+	pd->pmxops = &m10v_pmx_ops;
+	pd->confops = &m10v_pconf_ops;
+	pd->owner = THIS_MODULE;
+
+	pctl_dev = pinctrl_register(pd, &pdev->dev, pctl);
+	if (!pctl_dev) {
+		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
+		return -EINVAL;
+	}
+
+	gc->base = -1;
+	gc->ngpio = tpins;
+	gc->label = dev_name(&pdev->dev);
+	gc->owner = THIS_MODULE;
+	gc->of_node = np;
+	gc->direction_input = m10v_gpio_direction_input;
+	gc->direction_output = m10v_gpio_direction_output;
+	gc->get = m10v_gpio_get;
+	gc->set = m10v_gpio_set;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed register gpiochip\n");
+		return ret;
+	}
+
+	ret = gpiochip_add_pin_range(gc, dev_name(&pdev->dev),
+					0, 0, tpins);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add pin range\n");
+		gpiochip_remove(gc);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver m10v_pinctrl_driver = {
+	.probe	= m10v_pinctrl_probe,
+	.driver	= {
+		.name		= "m10v-pinctrl",
+		.of_match_table	= m10v_pmatch,
+	},
+};
+builtin_platform_driver(m10v_pinctrl_driver);
-- 
2.7.4

