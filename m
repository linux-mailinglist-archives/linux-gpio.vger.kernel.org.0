Return-Path: <linux-gpio+bounces-28612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B375C66591
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 22:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0438329A2A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 21:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ADE34CFBD;
	Mon, 17 Nov 2025 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="jX1rtcE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188B3254A6
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416319; cv=none; b=lAplGWEt05FtJmWrAZEJpu026jchka2xTJDk0b1M25RzeaF6G++EoVn2qGV8SWNcmZgLJwsb7XqUB3SFR5wWVObUt2gN//mhGI17V+FJ5FdISvfJKb5K4NSBoaG92TIxDUehW/O3nuNyx/WmZKpTKK54LlhqY5MepLh8I2Gh80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416319; c=relaxed/simple;
	bh=Et9nl2dHU6hmBc/Mh2s+n8fZtK8RmNlW8srdvzorQkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYReioefmS+29NVXemFKXCKxsAe4bl6Ue1zTmDTCSkOBcR6uBcz4pC1Y3RBU4KjA5x075e+EBcUGngL419MJDysp8pDaWf70woWjD4XBGrZEyd+73uirWHmJU6I8LZt6GfGU9/QBcUZnd05eRrOXVqoCwsjwJL7ngewpYAFVJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=jX1rtcE0; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 0D56E6A0B5F;
	Mon, 17 Nov 2025 22:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763416308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fyn0/11zV+5OWce88QU56rP2zzMRIZ30C428AtCGl0=;
	b=jX1rtcE0zxAbluH+jtg8IF4W7akUWVMOt3wbiGNidBmcO41GWRiLd3QPGr5n679uaFPGXV
	l/zAT2KbxqwI9sLzfVkEhNnQgmHWh7FJF3zKLU8153jUqARaki530luZJ4D2zPQbp6C6bI
	TtYBEDfUGkRqUTZFAQ6d+t+SeBjKZ4KjdOJip1Zle6HXbYZOM4+C4O16zw/A/GyB8TWhtO
	+OLabOnwmLZo2G4KCFaSEDCbNV6IvWySfOoUoAp21v4iDapkFmSCTbANp7SpHHbFS7yO3m
	w1OZPrOiw1cX8SFgYAvIR4W3JlkMjxwN+6RC3XgVHyOae5Sx6/eJEa8B6r0tOQ==
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
Date: Mon, 17 Nov 2025 22:51:34 +0100
Message-ID: <20251117215138.4353-5-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117215138.4353-1-sander@svanheule.net>
References: <20251117215138.4353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver implements the GPIO and pin muxing features provided by the
RTL8231. The device should be instantiated as an MFD child, where the
parent device has already configured the regmap used for register
access.

Debouncing is only available for the six highest GPIOs, and must be
emulated when other pins are used for (button) inputs. Although
described in the bindings, drive strength selection is currently not
implemented.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v6:
- Use uintptr_t storage for enum rtl8231_pin_function
- Simplify safe direction configuration
- Add GPIOLIB dependency
- Add Linus's review tag
---
 drivers/pinctrl/Kconfig           |  12 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c | 533 ++++++++++++++++++++++++++++++
 3 files changed, 546 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4f8507ebbdac..107c59f8aa7d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -520,6 +520,18 @@ config PINCTRL_ROCKCHIP
 	help
           This support pinctrl and GPIO driver for Rockchip SoCs.
 
+config PINCTRL_RTL8231
+	tristate "Realtek RTL8231 GPIO expander's pin controller"
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	select GENERIC_PINCONF
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIO_REGMAP
+	help
+	  Support for RTL8231 expander's GPIOs and pin controller.
+	  When built as a module, the module will be called pinctrl-rtl8231.
+
 config PINCTRL_SCMI
 	tristate "Pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e0cfb9b7c99b..ded51723d452 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
+obj-$(CONFIG_PINCTRL_RTL8231)	+= pinctrl-rtl8231.o
 obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
diff --git a/drivers/pinctrl/pinctrl-rtl8231.c b/drivers/pinctrl/pinctrl-rtl8231.c
new file mode 100644
index 000000000000..a06cbdbb2018
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rtl8231.c
@@ -0,0 +1,533 @@
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
+	struct regmap *map;
+};
+
+/*
+ * Pin controller functionality
+ */
+enum rtl8231_pin_function : uintptr_t {
+	RTL8231_PIN_FUNCTION_GPIO = BIT(0),
+	RTL8231_PIN_FUNCTION_LED = BIT(1),
+	RTL8231_PIN_FUNCTION_PWM = BIT(2),
+};
+
+struct rtl8231_function_info {
+	enum rtl8231_pin_function flag;
+	const char *name;
+};
+
+#define RTL8231_FUNCTION(_name, _flag)	\
+((struct rtl8231_function_info) {	\
+		.flag = (_flag),	\
+		.name = (_name),	\
+	})
+
+static const struct rtl8231_function_info rtl8231_pin_functions[] = {
+	RTL8231_FUNCTION("gpio", RTL8231_PIN_FUNCTION_GPIO),
+	RTL8231_FUNCTION("led", RTL8231_PIN_FUNCTION_LED),
+	RTL8231_FUNCTION("pwm", RTL8231_PIN_FUNCTION_PWM),
+};
+
+struct rtl8231_pin_desc {
+	enum rtl8231_pin_function functions:8;
+	u8 reg;
+	u8 offset;
+	u8 gpio_function_value;
+};
+
+#define RTL8231_PIN_DESC(_num, _func, _reg, _fld, _val)			\
+	[(_num)] = ((struct rtl8231_pin_desc) {				\
+		.functions = RTL8231_PIN_FUNCTION_GPIO | (_func),	\
+		.reg = (_reg),						\
+		.offset = (_fld),					\
+		.gpio_function_value = (_val),				\
+	})
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
+static const struct rtl8231_pin_desc rtl8231_pin_data[RTL8231_NUM_GPIOS] = {
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
+static const unsigned int PWM_PIN = 35;
+
+#define RTL8231_PIN(_num)					\
+	((struct pinctrl_pin_desc) {				\
+		.number = (_num),				\
+		.name = "gpio" #_num,				\
+		.drv_data = (void *) &rtl8231_pin_data[(_num)]	\
+	})
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
+	enum rtl8231_pin_function func_flag = (uintptr_t) func->data;
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
+	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
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
+	.function_is_gpio = pinmux_generic_function_is_gpio,
+	.set_mux = rtl8231_set_mux,
+	.gpio_request_enable = rtl8231_gpio_request_enable,
+	.strict = true,
+};
+
+static int rtl8231_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+	unsigned long *config)
+{
+	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
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
+	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
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
+static int rtl8231_pinctrl_init_functions(struct pinctrl_dev *pctl,
+	const struct pinctrl_desc *pctl_desc)
+{
+	enum rtl8231_pin_function flag;
+	struct pinfunction func;
+	const char **groups;
+	unsigned int f_idx;
+	const char *name;
+	unsigned int pin;
+	int num_groups;
+	int err;
+
+	for (f_idx = 0; f_idx < ARRAY_SIZE(rtl8231_pin_functions); f_idx++) {
+		name = rtl8231_pin_functions[f_idx].name;
+		flag = rtl8231_pin_functions[f_idx].flag;
+
+		for (pin = 0, num_groups = 0; pin < pctl_desc->npins; pin++)
+			if (rtl8231_pin_data[pin].functions & flag)
+				num_groups++;
+
+		groups = devm_kcalloc(pctl->dev, num_groups, sizeof(*groups), GFP_KERNEL);
+		if (!groups)
+			return -ENOMEM;
+
+		for (pin = 0, num_groups = 0; pin < pctl_desc->npins; pin++)
+			if (rtl8231_pin_data[pin].functions & flag)
+				groups[num_groups++] = rtl8231_pins[pin].name;
+
+		func = PINCTRL_PINFUNCTION(name, groups, num_groups);
+		if (flag == RTL8231_PIN_FUNCTION_GPIO)
+			func.flags |= PINFUNCTION_FLAG_GPIO;
+
+		err = pinmux_generic_add_pinfunction(pctl, &func, (void *) flag);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+struct pin_field_info {
+	const struct reg_field gpio_dir;
+	const struct reg_field mode;
+};
+
+static const struct pin_field_info pin_fields[] = {
+	{
+		.gpio_dir = REG_FIELD(RTL8231_REG_GPIO_DIR0, 0, 15),
+		.mode = REG_FIELD(RTL8231_REG_PIN_MODE0, 0, 15),
+	},
+	{
+		.gpio_dir = REG_FIELD(RTL8231_REG_GPIO_DIR1, 0, 15),
+		.mode = REG_FIELD(RTL8231_REG_PIN_MODE1, 0, 15),
+	},
+	{
+		.gpio_dir = REG_FIELD(RTL8231_REG_PIN_HI_CFG, 5, 9),
+		.mode = REG_FIELD(RTL8231_REG_PIN_HI_CFG, 0, 4),
+	},
+};
+
+static int rtl8231_configure_safe(struct device *dev, struct regmap *map)
+{
+	struct regmap_field *field_mode;
+	struct regmap_field *field_dir;
+	unsigned int is_input;
+	unsigned int is_gpio;
+	int err;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(pin_fields); i++) {
+		field_dir = devm_regmap_field_alloc(dev, map, pin_fields[i].gpio_dir);
+		if (IS_ERR(field_dir))
+			return PTR_ERR(field_dir);
+
+		field_mode = devm_regmap_field_alloc(dev, map, pin_fields[i].mode);
+		if (IS_ERR(field_mode))
+			return PTR_ERR(field_mode);
+
+		err = regmap_field_read(field_dir, &is_input);
+		if (err)
+			return err;
+
+		err = regmap_field_read(field_mode, &is_gpio);
+		if (err)
+			return err;
+
+		/* Enable field for PWM (on GPIO35) is in another register */
+		if (pin_fields[i].mode.reg == RTL8231_REG_PIN_HI_CFG) {
+			err = regmap_test_bits(map, rtl8231_pin_data[PWM_PIN].reg,
+					BIT(rtl8231_pin_data[PWM_PIN].offset));
+			if (err < 0)
+				return err;
+
+			if (err)
+				is_gpio &= ~BIT(PWM_PIN % RTL8231_BITS_VAL);
+		}
+
+		/*
+		 * Set every pin that is not muxed as a GPIO to gpio-in. That
+		 * way the pin will be high impedance when it is muxed to GPIO,
+		 * preventing unwanted glitches.
+		 * The pin muxes are left as-is, so there are no signal changes.
+		 */
+		regmap_field_write(field_dir, is_input | ~is_gpio);
+
+		devm_regmap_field_free(dev, field_dir);
+		devm_regmap_field_free(dev, field_mode);
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_desc rtl8231_pctl_desc = {
+	.name = "rtl8231-pinctrl",
+	.owner = THIS_MODULE,
+	.confops = &rtl8231_pinconf_ops,
+	.pctlops = &rtl8231_pinctrl_ops,
+	.pmxops = &rtl8231_pinmux_ops,
+	.npins = ARRAY_SIZE(rtl8231_pins),
+	.pins = rtl8231_pins,
+};
+
+static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
+{
+	struct pinctrl_dev *pctldev;
+	int err;
+
+	err = devm_pinctrl_register_and_init(dev->parent, &rtl8231_pctl_desc, ctrl, &pctldev);
+	if (err) {
+		dev_err(dev, "failed to register pin controller\n");
+		return err;
+	}
+
+	err = rtl8231_pinctrl_init_functions(pctldev, &rtl8231_pctl_desc);
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
+	err = rtl8231_configure_safe(dev, ctrl->map);
+	if (err)
+		return err;
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
+MODULE_LICENSE("GPL");
-- 
2.51.1


