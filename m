Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF183A50E0
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhFLVPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:49 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:48196 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbhFLVPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:41 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2D8C920C9D2;
        Sat, 12 Jun 2021 23:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nd86q1kDb1mXeIWbOZhAww5aGMl2Xo7d2OZBQSkQ0is=;
        b=kvXNDnU1ErJs8n+hJ1cjugtFpqwA27WCPKEsbHWhB7BntTykKvAVvhDgRCuqujhZ8AHAaI
        TtQ1Zc7jYd6YaUla1D3IcEOfS+Q9tmlS3MIWOwgDB4RzB31NxzljL/laDuPhJqn8f7dsE4
        +30LrGtZM+cQkovIh3Jv51iMIEfpQOaHoEBlsM07W9IM9OSvR61OsH+y2F58HJS9bMalEA
        ChJxtngOxBNvNE2+Xty407Ymjm8AumKHW6BxLRQ9UtIVu+osnfxeu+CWPYae/nAq/pOQtL
        Un0Mt3cSzkwMtIft9tivio6Hj30QRtBVWj5/StPUkg/aMpnFzLeD8jOGzruNaw==
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
Subject: [PATCH v5 6/8] pinctrl: Add RTL8231 pin control and GPIO support
Date:   Sat, 12 Jun 2021 23:12:36 +0200
Message-Id: <d546cda53108276c5fe17e147d9111deb4d9de9f.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623532208.git.sander@svanheule.net>
References: <cover.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver implements the GPIO and pin muxing features provided by the
RTL8231. The device should be instantiated as an MFD child, where the
parent device has already configured the regmap used for register
access.

Debouncing is only available for the six highest GPIOs, and must be
emulated when other pins are used for (button) inputs. Although
described in the bindings, drive strength selection is currently not
implemented.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
v5:
- Add Andy's and Linus' review tags
- Use uintptr_t for integer stored in void* field
  Reported by: kernel test robot <lkp@intel.com>
- Replace virtual registers by GPIO_REGMAP_QUIRK_ALIASED_DATA

v4:
- Switch to pinmux_generic for pin functions
- Add pin debounce pinconf
- Virtual addresses and caching
- Use PRT_ERR_OR_ZERO in pinctrl/gpio probe
- Drop direction-first quirk for gpio-regmap

v3:
- Use static pin description for pin controller
- Fix gpio consumer resource leak

v2:
- Use gpio-regmap with direction-before-value output
---
 drivers/pinctrl/Kconfig           |  11 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c | 438 ++++++++++++++++++++++++++++++
 3 files changed, 450 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..a02c1befbee4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -221,6 +221,17 @@ config PINCTRL_ROCKCHIP
 	help
           This support pinctrl and gpio driver for Rockchip SoCs.
 
+config PINCTRL_RTL8231
+	tristate "Realtek RTL8231 GPIO expander's pin controller"
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	select GPIO_REGMAP
+	select GENERIC_PINCONF
+	select GENERIC_PINMUX_FUNCTIONS
+	help
+	  Support for RTL8231 expander's GPIOs and pin controller.
+	  When built as a module, the module will be called pinctrl-rtl8231.
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
index 000000000000..d3b52022f224
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rtl8231.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitfield.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "core.h"
+#include "pinmux.h"
+#include <linux/mfd/rtl8231.h>
+
+#define RTL8231_NUM_GPIOS		37
+#define RTL8231_DEBOUNCE_USEC		100000
+#define RTL8231_DEBOUNCE_MIN_OFFSET	31
+
+struct rtl8231_pin_ctrl {
+	struct pinctrl_desc pctl_desc;
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
+	const enum rtl8231_pin_function functions;
+	const u8 reg;
+	const u8 offset;
+	const u8 gpio_function_value;
+};
+
+#define RTL8231_PIN_DESC(_num, _func, _reg, _fld, _val)		\
+	[_num] = {						\
+		.functions = RTL8231_PIN_FUNCTION_GPIO | _func,	\
+		.reg = _reg,					\
+		.offset = _fld,					\
+		.gpio_function_value = _val,			\
+	}
+#define RTL8231_GPIO_PIN_DESC(_num, _reg, _fld)			\
+	RTL8231_PIN_DESC(_num, 0, _reg, _fld, RTL8231_PIN_MODE_GPIO)
+#define RTL8231_LED_PIN_DESC(_num, _reg, _fld)			\
+	RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_LED, _reg, _fld, RTL8231_PIN_MODE_GPIO)
+#define RTL8231_PWM_PIN_DESC(_num, _reg, _fld)			\
+	RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_PWM, _reg, _fld, 0)
+
+/*
+ * All pins have a GPIO/LED mux bit, but the bits for pins 35/36 are read-only. Use this bit
+ * for the GPIO-only pin instead of a placeholder, so the rest of the logic can stay generic.
+ */
+static struct rtl8231_pin_desc rtl8231_pin_data[RTL8231_NUM_GPIOS] = {
+	RTL8231_LED_PIN_DESC(0, RTL8231_REG_PIN_MODE0, 0),
+	RTL8231_LED_PIN_DESC(1, RTL8231_REG_PIN_MODE0, 1),
+	RTL8231_LED_PIN_DESC(2, RTL8231_REG_PIN_MODE0, 2),
+	RTL8231_LED_PIN_DESC(3, RTL8231_REG_PIN_MODE0, 3),
+	RTL8231_LED_PIN_DESC(4, RTL8231_REG_PIN_MODE0, 4),
+	RTL8231_LED_PIN_DESC(5, RTL8231_REG_PIN_MODE0, 5),
+	RTL8231_LED_PIN_DESC(6, RTL8231_REG_PIN_MODE0, 6),
+	RTL8231_LED_PIN_DESC(7, RTL8231_REG_PIN_MODE0, 7),
+	RTL8231_LED_PIN_DESC(8, RTL8231_REG_PIN_MODE0, 8),
+	RTL8231_LED_PIN_DESC(9, RTL8231_REG_PIN_MODE0, 9),
+	RTL8231_LED_PIN_DESC(10, RTL8231_REG_PIN_MODE0, 10),
+	RTL8231_LED_PIN_DESC(11, RTL8231_REG_PIN_MODE0, 11),
+	RTL8231_LED_PIN_DESC(12, RTL8231_REG_PIN_MODE0, 12),
+	RTL8231_LED_PIN_DESC(13, RTL8231_REG_PIN_MODE0, 13),
+	RTL8231_LED_PIN_DESC(14, RTL8231_REG_PIN_MODE0, 14),
+	RTL8231_LED_PIN_DESC(15, RTL8231_REG_PIN_MODE0, 15),
+	RTL8231_LED_PIN_DESC(16, RTL8231_REG_PIN_MODE1, 0),
+	RTL8231_LED_PIN_DESC(17, RTL8231_REG_PIN_MODE1, 1),
+	RTL8231_LED_PIN_DESC(18, RTL8231_REG_PIN_MODE1, 2),
+	RTL8231_LED_PIN_DESC(19, RTL8231_REG_PIN_MODE1, 3),
+	RTL8231_LED_PIN_DESC(20, RTL8231_REG_PIN_MODE1, 4),
+	RTL8231_LED_PIN_DESC(21, RTL8231_REG_PIN_MODE1, 5),
+	RTL8231_LED_PIN_DESC(22, RTL8231_REG_PIN_MODE1, 6),
+	RTL8231_LED_PIN_DESC(23, RTL8231_REG_PIN_MODE1, 7),
+	RTL8231_LED_PIN_DESC(24, RTL8231_REG_PIN_MODE1, 8),
+	RTL8231_LED_PIN_DESC(25, RTL8231_REG_PIN_MODE1, 9),
+	RTL8231_LED_PIN_DESC(26, RTL8231_REG_PIN_MODE1, 10),
+	RTL8231_LED_PIN_DESC(27, RTL8231_REG_PIN_MODE1, 11),
+	RTL8231_LED_PIN_DESC(28, RTL8231_REG_PIN_MODE1, 12),
+	RTL8231_LED_PIN_DESC(29, RTL8231_REG_PIN_MODE1, 13),
+	RTL8231_LED_PIN_DESC(30, RTL8231_REG_PIN_MODE1, 14),
+	RTL8231_LED_PIN_DESC(31, RTL8231_REG_PIN_MODE1, 15),
+	RTL8231_LED_PIN_DESC(32, RTL8231_REG_PIN_HI_CFG, 0),
+	RTL8231_LED_PIN_DESC(33, RTL8231_REG_PIN_HI_CFG, 1),
+	RTL8231_LED_PIN_DESC(34, RTL8231_REG_PIN_HI_CFG, 2),
+	RTL8231_PWM_PIN_DESC(35, RTL8231_REG_FUNC1, 3),
+	RTL8231_GPIO_PIN_DESC(36, RTL8231_REG_PIN_HI_CFG, 4),
+};
+
+#define RTL8231_PIN(_num)				\
+	{						\
+		.number = _num,				\
+		.name = "gpio" #_num,			\
+		.drv_data = &rtl8231_pin_data[_num]	\
+	}
+
+static const struct pinctrl_pin_desc rtl8231_pins[RTL8231_NUM_GPIOS] = {
+	RTL8231_PIN(0),
+	RTL8231_PIN(1),
+	RTL8231_PIN(2),
+	RTL8231_PIN(3),
+	RTL8231_PIN(4),
+	RTL8231_PIN(5),
+	RTL8231_PIN(6),
+	RTL8231_PIN(7),
+	RTL8231_PIN(8),
+	RTL8231_PIN(9),
+	RTL8231_PIN(10),
+	RTL8231_PIN(11),
+	RTL8231_PIN(12),
+	RTL8231_PIN(13),
+	RTL8231_PIN(14),
+	RTL8231_PIN(15),
+	RTL8231_PIN(16),
+	RTL8231_PIN(17),
+	RTL8231_PIN(18),
+	RTL8231_PIN(19),
+	RTL8231_PIN(20),
+	RTL8231_PIN(21),
+	RTL8231_PIN(22),
+	RTL8231_PIN(23),
+	RTL8231_PIN(24),
+	RTL8231_PIN(25),
+	RTL8231_PIN(26),
+	RTL8231_PIN(27),
+	RTL8231_PIN(28),
+	RTL8231_PIN(29),
+	RTL8231_PIN(30),
+	RTL8231_PIN(31),
+	RTL8231_PIN(32),
+	RTL8231_PIN(33),
+	RTL8231_PIN(34),
+	RTL8231_PIN(35),
+	RTL8231_PIN(36),
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
+	if (selector >= ARRAY_SIZE(rtl8231_pins))
+		return -EINVAL;
+
+	*pins = &rtl8231_pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
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
+static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+	unsigned int group_selector)
+{
+	const struct function_desc *func = pinmux_generic_get_function(pctldev, func_selector);
+	const struct rtl8231_pin_desc *desc = rtl8231_pins[group_selector].drv_data;
+	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int func_flag = (uintptr_t) func->data;
+	unsigned int function_mask;
+	unsigned int gpio_function;
+
+	if (!(desc->functions & func_flag))
+		return -EINVAL;
+
+	function_mask = BIT(desc->offset);
+	gpio_function = desc->gpio_function_value << desc->offset;
+
+	if (func_flag == RTL8231_PIN_FUNCTION_GPIO)
+		return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
+	else
+		return regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
+}
+
+static int rtl8231_gpio_request_enable(struct pinctrl_dev *pctldev,
+	struct pinctrl_gpio_range *range, unsigned int offset)
+{
+	const struct rtl8231_pin_desc *desc = rtl8231_pins[offset].drv_data;
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
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
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = rtl8231_set_mux,
+	.gpio_request_enable = rtl8231_gpio_request_enable,
+	.strict = true,
+};
+
+static int rtl8231_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+	unsigned long *config)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(*config);
+	unsigned int arg;
+	int err;
+	int v;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		if (offset < RTL8231_DEBOUNCE_MIN_OFFSET)
+			return -EINVAL;
+
+		err = regmap_read(ctrl->map, RTL8231_REG_FUNC1, &v);
+		if (err)
+			return err;
+
+		v = FIELD_GET(RTL8231_FUNC1_DEBOUNCE_MASK, v);
+		if (v & BIT(offset - RTL8231_DEBOUNCE_MIN_OFFSET))
+			arg = RTL8231_DEBOUNCE_USEC;
+		else
+			arg = 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int rtl8231_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+	unsigned long *configs, unsigned int num_configs)
+{
+	struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param, arg;
+	unsigned int pin_mask;
+	int err;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_INPUT_DEBOUNCE:
+			if (offset < RTL8231_DEBOUNCE_MIN_OFFSET)
+				return -EINVAL;
+
+			pin_mask = FIELD_PREP(RTL8231_FUNC1_DEBOUNCE_MASK,
+				BIT(offset - RTL8231_DEBOUNCE_MIN_OFFSET));
+
+			switch (arg) {
+			case 0:
+				err = regmap_update_bits(ctrl->map, RTL8231_REG_FUNC1,
+					pin_mask, 0);
+				break;
+			case RTL8231_DEBOUNCE_USEC:
+				err = regmap_update_bits(ctrl->map, RTL8231_REG_FUNC1,
+					pin_mask, pin_mask);
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	return err;
+}
+
+static const struct pinconf_ops rtl8231_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = rtl8231_pin_config_get,
+	.pin_config_set = rtl8231_pin_config_set,
+};
+
+static int rtl8231_pinctrl_init_functions(struct pinctrl_dev *pctl, struct rtl8231_pin_ctrl *ctrl)
+{
+	const char *function_name;
+	const char **groups;
+	unsigned int f_idx;
+	unsigned int pin;
+	int num_groups;
+	int err;
+
+	for (f_idx = 0; f_idx < ARRAY_SIZE(rtl8231_pin_function_names); f_idx++) {
+		function_name = rtl8231_pin_function_names[f_idx];
+
+		for (pin = 0, num_groups = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pin_data[pin].functions & BIT(f_idx))
+				num_groups++;
+
+		groups = devm_kcalloc(pctl->dev, num_groups, sizeof(*groups), GFP_KERNEL);
+		if (!groups)
+			return -ENOMEM;
+
+		for (pin = 0, num_groups = 0; pin < ctrl->pctl_desc.npins; pin++)
+			if (rtl8231_pin_data[pin].functions & BIT(f_idx))
+				groups[num_groups++] = rtl8231_pins[pin].name;
+
+		err = pinmux_generic_add_function(pctl, function_name, groups, num_groups,
+			(void *) BIT(f_idx));
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct pinctrl_dev *pctldev;
+	int err;
+
+	ctrl->pctl_desc.name = "rtl8231-pinctrl";
+	ctrl->pctl_desc.owner = THIS_MODULE;
+	ctrl->pctl_desc.confops = &rtl8231_pinconf_ops;
+	ctrl->pctl_desc.pctlops = &rtl8231_pinctrl_ops;
+	ctrl->pctl_desc.pmxops = &rtl8231_pinmux_ops;
+	ctrl->pctl_desc.npins = ARRAY_SIZE(rtl8231_pins);
+	ctrl->pctl_desc.pins = rtl8231_pins;
+
+	err = devm_pinctrl_register_and_init(dev->parent, &ctrl->pctl_desc, ctrl, &pctldev);
+	if (err) {
+		dev_err(dev, "failed to register pin controller\n");
+		return err;
+	}
+
+	err = rtl8231_pinctrl_init_functions(pctldev, ctrl);
+	if (err)
+		return err;
+
+	err = pinctrl_enable(pctldev);
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
+	int err;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->map = dev_get_regmap(dev->parent, NULL);
+	if (!ctrl->map)
+		return -ENODEV;
+
+	err = rtl8231_pinctrl_init(dev, ctrl);
+	if (err)
+		return err;
+
+	gpio_cfg.regmap = ctrl->map;
+	gpio_cfg.parent = dev->parent;
+	gpio_cfg.ngpio = RTL8231_NUM_GPIOS;
+	gpio_cfg.ngpio_per_reg = RTL8231_BITS_VAL;
+	gpio_cfg.quirks = GPIO_REGMAP_QUIRK_ALIASED_DATA;
+
+	gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
+	gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
+	gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
+
+	gpio_cfg.reg_mask_xlate = rtl8231_gpio_reg_mask_xlate;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_cfg));
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

