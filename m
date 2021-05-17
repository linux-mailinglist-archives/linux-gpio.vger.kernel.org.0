Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258D4383D63
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbhEQTaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbhEQTaF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:30:05 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62108C061760
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 12:28:48 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id AA0F21FFBFC;
        Mon, 17 May 2021 21:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ifWs/Wlm7tVHLpu2tgxONBVrNkwSFg9g2R3M0Tho0Rk=;
        b=tWL/yPzxu3FA5J6vEduvTu+kxGJ3etVSPJp3g2bUn5KW9sV9yNRovEzi9gxiHehH7E94qF
        2yshNmDZmH7cBJvZWlJFZ/bh/HL0h7NyyxX1nL8G5dVHUuZ/FOihrIi7IJJ36z07YDfueU
        aLp2wUP6QQXxYhlhryH+CP9TRst5Z7lIRuUkSlZYrjt81ZmssWREXlmkeT9P7jAvIlxtv9
        EZ1Mb3hXmmsGecptiiU9qbtLXh6JF04Z/InnW3jT5g8YWVlhyu9VjxgIL5Hzb48dk6M4tc
        1TkDXZIVewPm+C9e4QVG9yiLH0Ig11tk1P/G7/7ASn6coSmjtmPhm8NTTo/d4Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v2 6/7] pinctrl: Add RTL8231 pin control and GPIO support
Date:   Mon, 17 May 2021 21:28:08 +0200
Message-Id: <041077d195f1cc81bf6363388cb4adfb06cff4ef.1621279162.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver implements the GPIO and pin muxing features provided by the
RTL8231. The device should be instantiated as an MFD child, where the
parent device has already configured the regmap used for register
access.

Although described in the bindings, pin debouncing and drive strength
selection are currently not implemented. Debouncing is only available
for the six highest GPIOs, and must be emulated when other pins are used
for (button) inputs anyway.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/pinctrl/Kconfig           |  11 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c | 377 ++++++++++++++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..462df82c5133 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -221,6 +221,17 @@ config PINCTRL_ROCKCHIP
 	help
           This support pinctrl and gpio driver for Rockchip SoCs.
 
+config PINCTRL_RTL8231
+	tristate "Realtek RTL8231 GPIO expander's pin controller"
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	select GENERIC_PINCONF
+	select GPIO_REGMAP
+	select PINMUX
+	help
+	  Support for RTL8231 expander's GPIOs and pin controller.
+	  When built as a module, the module will be called rtl8231_pinctrl.
+
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 5ef5334a797f..239603efb317 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RTL8231)	+= pinctrl-rtl8231.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
diff --git a/drivers/pinctrl/pinctrl-rtl8231.c b/drivers/pinctrl/pinctrl-rtl8231.c
new file mode 100644
index 000000000000..44f08ba39f14
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rtl8231.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitfield.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/rtl8231.h>
+
+#define RTL8231_NUM_GPIOS	37
+
+struct rtl8231_function {
+	const char *name;
+	unsigned int ngroups;
+	const char **groups;
+};
+
+struct rtl8231_pin_ctrl {
+	struct pinctrl_desc pctl_desc;
+	unsigned int nfunctions;
+	struct rtl8231_function *functions;
+	struct regmap *map;
+};
+
+/*
+ * Pin controller functionality
+ */
+static const char * const rtl8231_pin_function_names[] = {
+	"gpio",
+	"led",
+	"pwm",
+};
+
+enum rtl8231_pin_function {
+	RTL8231_PIN_FUNCTION_GPIO = BIT(0),
+	RTL8231_PIN_FUNCTION_LED = BIT(1),
+	RTL8231_PIN_FUNCTION_PWM = BIT(2),
+};
+
+struct rtl8231_pin_desc {
+	unsigned int number;
+	const char *name;
+	enum rtl8231_pin_function functions;
+	u8 reg;
+	u8 offset;
+	u8 gpio_function_value;
+};
+
+#define RTL8231_PIN(_num, _func, _reg, _fld, _val)		\
+	{							\
+		.number = _num,					\
+		.name = "gpio" #_num,				\
+		.functions = RTL8231_PIN_FUNCTION_GPIO | _func,	\
+		.reg = _reg,					\
+		.offset = _fld,					\
+		.gpio_function_value = _val,			\
+	}
+#define RTL8231_GPIO_PIN(_num)					\
+	RTL8231_PIN(_num, 0, 0, 0, 0)
+#define RTL8231_LED_PIN(_num, _reg, _fld)			\
+	RTL8231_PIN(_num, RTL8231_PIN_FUNCTION_LED, _reg, _fld, RTL8231_PIN_MODE_GPIO)
+#define RTL8231_PWM_PIN(_num, _reg, _fld)			\
+	RTL8231_PIN(_num, RTL8231_PIN_FUNCTION_PWM, _reg, _fld, 0)
+
+/* Pins always support GPIO, and may support one alternate function */
+static const struct rtl8231_pin_desc rtl8231_pins[RTL8231_NUM_GPIOS] = {
+	RTL8231_LED_PIN(0, RTL8231_REG_PIN_MODE0, 0),
+	RTL8231_LED_PIN(1, RTL8231_REG_PIN_MODE0, 1),
+	RTL8231_LED_PIN(2, RTL8231_REG_PIN_MODE0, 2),
+	RTL8231_LED_PIN(3, RTL8231_REG_PIN_MODE0, 3),
+	RTL8231_LED_PIN(4, RTL8231_REG_PIN_MODE0, 4),
+	RTL8231_LED_PIN(5, RTL8231_REG_PIN_MODE0, 5),
+	RTL8231_LED_PIN(6, RTL8231_REG_PIN_MODE0, 6),
+	RTL8231_LED_PIN(7, RTL8231_REG_PIN_MODE0, 7),
+	RTL8231_LED_PIN(8, RTL8231_REG_PIN_MODE0, 8),
+	RTL8231_LED_PIN(9, RTL8231_REG_PIN_MODE0, 9),
+	RTL8231_LED_PIN(10, RTL8231_REG_PIN_MODE0, 10),
+	RTL8231_LED_PIN(11, RTL8231_REG_PIN_MODE0, 11),
+	RTL8231_LED_PIN(12, RTL8231_REG_PIN_MODE0, 12),
+	RTL8231_LED_PIN(13, RTL8231_REG_PIN_MODE0, 13),
+	RTL8231_LED_PIN(14, RTL8231_REG_PIN_MODE0, 14),
+	RTL8231_LED_PIN(15, RTL8231_REG_PIN_MODE0, 15),
+	RTL8231_LED_PIN(16, RTL8231_REG_PIN_MODE1, 0),
+	RTL8231_LED_PIN(17, RTL8231_REG_PIN_MODE1, 1),
+	RTL8231_LED_PIN(18, RTL8231_REG_PIN_MODE1, 2),
+	RTL8231_LED_PIN(19, RTL8231_REG_PIN_MODE1, 3),
+	RTL8231_LED_PIN(20, RTL8231_REG_PIN_MODE1, 4),
+	RTL8231_LED_PIN(21, RTL8231_REG_PIN_MODE1, 5),
+	RTL8231_LED_PIN(22, RTL8231_REG_PIN_MODE1, 6),
+	RTL8231_LED_PIN(23, RTL8231_REG_PIN_MODE1, 7),
+	RTL8231_LED_PIN(24, RTL8231_REG_PIN_MODE1, 8),
+	RTL8231_LED_PIN(25, RTL8231_REG_PIN_MODE1, 9),
+	RTL8231_LED_PIN(26, RTL8231_REG_PIN_MODE1, 10),
+	RTL8231_LED_PIN(27, RTL8231_REG_PIN_MODE1, 11),
+	RTL8231_LED_PIN(28, RTL8231_REG_PIN_MODE1, 12),
+	RTL8231_LED_PIN(29, RTL8231_REG_PIN_MODE1, 13),
+	RTL8231_LED_PIN(30, RTL8231_REG_PIN_MODE1, 14),
+	RTL8231_LED_PIN(31, RTL8231_REG_PIN_MODE1, 15),
+	RTL8231_LED_PIN(32, RTL8231_REG_PIN_HI_CFG, 0),
+	RTL8231_LED_PIN(33, RTL8231_REG_PIN_HI_CFG, 1),
+	RTL8231_LED_PIN(34, RTL8231_REG_PIN_HI_CFG, 2),
+	RTL8231_PWM_PIN(35, RTL8231_REG_FUNC1, 3),
+	RTL8231_GPIO_PIN(36),
+};
+
+static int rtl8231_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(rtl8231_pins);
+}
+
+static const char *rtl8231_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return rtl8231_pins[selector].name;
+}
+
+static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+	const unsigned int **pins, unsigned int *num_pins)
+{
+	if (selector < ARRAY_SIZE(rtl8231_pins)) {
+		*pins = &rtl8231_pins[selector].number;
+		*num_pins = 1;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct pinctrl_ops rtl8231_pinctrl_ops = {
+	.get_groups_count = rtl8231_get_groups_count,
+	.get_group_name = rtl8231_get_group_name,
+	.get_group_pins = rtl8231_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int rtl8231_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return ctrl->nfunctions;
+}
+
+static const char *rtl8231_get_function_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return ctrl->functions[selector].name;
+}
+
+static int rtl8231_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+	const char * const **groups, unsigned int *num_groups)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = ctrl->functions[selector].groups;
+	*num_groups = ctrl->functions[selector].ngroups;
+	return 0;
+}
+
+static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+	unsigned int group_selector)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct rtl8231_pin_desc *desc = &rtl8231_pins[group_selector];
+	unsigned int func_flag = BIT(func_selector);
+	unsigned int function_mask;
+	unsigned int gpio_function;
+	int err = 0;
+
+	if (!(desc->functions & func_flag))
+		return -EINVAL;
+
+	function_mask = BIT(desc->offset);
+	gpio_function = desc->gpio_function_value << desc->offset;
+
+	switch (func_flag) {
+	case RTL8231_PIN_FUNCTION_LED:
+	case RTL8231_PIN_FUNCTION_PWM:
+		err = regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
+		break;
+	case RTL8231_PIN_FUNCTION_GPIO:
+		err = regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return err;
+}
+
+static int rtl8231_gpio_request_enable(struct pinctrl_dev *pctldev,
+	struct pinctrl_gpio_range *range, unsigned int offset)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct rtl8231_pin_desc *desc = &rtl8231_pins[offset];
+	unsigned int function_mask;
+	unsigned int gpio_function;
+
+	function_mask = BIT(desc->offset);
+	gpio_function = desc->gpio_function_value << desc->offset;
+
+	return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
+}
+
+static const struct pinmux_ops rtl8231_pinmux_ops = {
+	.set_mux = rtl8231_set_mux,
+	.get_functions_count = rtl8231_get_functions_count,
+	.get_function_name = rtl8231_get_function_name,
+	.get_function_groups = rtl8231_get_function_groups,
+	.gpio_request_enable = rtl8231_gpio_request_enable,
+	.strict = true
+};
+
+
+static int rtl8231_pinctrl_init_functions(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct rtl8231_function *function;
+	const char **group_name;
+	unsigned int f_idx;
+	unsigned int pin;
+
+	ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
+	ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl->functions), GFP_KERNEL);
+	if (IS_ERR(ctrl->functions)) {
+		dev_err(dev, "failed to allocate pin function descriptors\n");
+		return PTR_ERR(ctrl->functions);
+	}
+
+	for (f_idx = 0; f_idx < ctrl->nfunctions; f_idx++) {
+		function = &ctrl->functions[f_idx];
+		function->name = rtl8231_pin_function_names[f_idx];
+
+		for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pins[pin].functions & BIT(f_idx))
+				function->ngroups++;
+
+		function->groups = devm_kcalloc(dev, function->ngroups,
+			sizeof(*function->groups), GFP_KERNEL);
+		if (IS_ERR(function->groups)) {
+			dev_err(dev, "failed to allocate pin function group names\n");
+			return PTR_ERR(function->groups);
+		}
+
+		group_name = function->groups;
+		for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pins[pin].functions & BIT(f_idx))
+				*group_name++ = rtl8231_pins[pin].name;
+	}
+
+	return 0;
+}
+
+static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct pinctrl_dev *pctl;
+	struct pinctrl_pin_desc *pins;
+	unsigned int pin;
+	int err = 0;
+
+	ctrl->pctl_desc.name = "rtl8231-pinctrl",
+	ctrl->pctl_desc.owner = THIS_MODULE,
+	ctrl->pctl_desc.pctlops = &rtl8231_pinctrl_ops,
+	ctrl->pctl_desc.pmxops = &rtl8231_pinmux_ops,
+
+	ctrl->pctl_desc.npins = ARRAY_SIZE(rtl8231_pins);
+	pins = devm_kcalloc(dev, ctrl->pctl_desc.npins, sizeof(*pins), GFP_KERNEL);
+	if (IS_ERR(pins)) {
+		dev_err(dev, "failed to allocate pin descriptors\n");
+		return PTR_ERR(pins);
+	}
+	ctrl->pctl_desc.pins = pins;
+
+	for (pin = 0; pin < ctrl->pctl_desc.npins; pin++) {
+		pins[pin].number = rtl8231_pins[pin].number;
+		pins[pin].name = rtl8231_pins[pin].name;
+	}
+
+	err = rtl8231_pinctrl_init_functions(dev, ctrl);
+	if (err)
+		return err;
+
+	err = devm_pinctrl_register_and_init(dev->parent, &ctrl->pctl_desc, ctrl, &pctl);
+	if (err) {
+		dev_err(dev, "failed to register pin controller\n");
+		return err;
+	}
+
+	err = pinctrl_enable(pctl);
+	if (err)
+		dev_err(dev, "failed to enable pin controller\n");
+
+	return err;
+}
+
+/*
+ * GPIO controller functionality
+ */
+static int rtl8231_gpio_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
+	unsigned int offset, unsigned int *reg, unsigned int *mask)
+{
+	unsigned int pin_mask = BIT(offset % RTL8231_BITS_VAL);
+
+	if (base == RTL8231_REG_GPIO_DATA0 || offset < 32) {
+		*reg = base + offset / RTL8231_BITS_VAL;
+		*mask = pin_mask;
+	} else if (base == RTL8231_REG_GPIO_DIR0) {
+		*reg = RTL8231_REG_PIN_HI_CFG;
+		*mask = FIELD_PREP(RTL8231_PIN_HI_CFG_DIR_MASK, pin_mask);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rtl8231_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtl8231_pin_ctrl *ctrl;
+	struct gpio_regmap_config gpio_cfg = {};
+	struct gpio_regmap *gr;
+	int err;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->map = dev_get_regmap(dev->parent, NULL);
+	if (IS_ERR_OR_NULL(ctrl->map)) {
+		dev_err(dev, "failed to retrieve regmap\n");
+		if (!ctrl->map)
+			return -ENODEV;
+		else
+			return PTR_ERR(ctrl->map);
+	}
+
+	err = rtl8231_pinctrl_init(dev, ctrl);
+	if (err)
+		return err;
+
+	gpio_cfg.regmap = ctrl->map;
+	gpio_cfg.parent = dev->parent;
+	gpio_cfg.ngpio = RTL8231_NUM_GPIOS;
+	gpio_cfg.ngpio_per_reg = RTL8231_BITS_VAL;
+
+	gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
+	gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
+	gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
+	gpio_cfg.no_set_on_input = true;
+
+	gpio_cfg.reg_mask_xlate = rtl8231_gpio_reg_mask_xlate;
+
+	gr = devm_gpio_regmap_register(dev, &gpio_cfg);
+	if (IS_ERR(gr)) {
+		dev_err(dev, "failed to register gpio controller\n");
+		return PTR_ERR(gr);
+	}
+
+	return 0;
+}
+
+static struct platform_driver rtl8231_pinctrl_driver = {
+	.driver = {
+		.name = "rtl8231-pinctrl",
+	},
+	.probe = rtl8231_pinctrl_probe,
+};
+module_platform_driver(rtl8231_pinctrl_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 pin control and GPIO support");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

