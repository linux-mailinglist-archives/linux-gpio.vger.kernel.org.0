Return-Path: <linux-gpio+bounces-10016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C562C977084
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 20:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3384CB21F7F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B541C2335;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/FMMgWZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9E1C1ABE;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165216; cv=none; b=mt1YmQSL4f7G0r/MfPSYhTdYPS3pPoDQWemygvx8lw0bo1ci3IV8rHGP9se1Eeg2lFbg3KIMaFwCw4GC8Fl1/msVvxs8BeCXPqunaEWqw5fFLHpdkpyoXW0miJAdUa4oFQOCvhIqO2+E9gwdfK+kmOZD/WRW/sO5VVU+QTGfivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165216; c=relaxed/simple;
	bh=8dglV35vXsS56WaqjDfOErmL3gBQcYZfYc41JKx0CZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ng84ccuIwIcEUykFXxiawdEOp6pJSV9zD143rs1gXC1e7JGj2rHhFxrPu2odwF9y3aULQUf/tHeCjO3XIjlTAqamdgMj8TjcjVvDURDf3FE3TsdE2Y2UzYGYquPZE1vABL3Qky2hRMXptc3VkOZ7YdbSMYvQr4FU3tz63IkoQTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/FMMgWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1D39C4DE09;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=8dglV35vXsS56WaqjDfOErmL3gBQcYZfYc41JKx0CZY=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=a/FMMgWZnAfOevYv8VZ5xuo6wb7rOnkmAgiyborp47SLyRN4TjrZjBkTTxa6QD2m/
	 X6W8xJP9qpHTqMZ1RQzNiPEzffOELQ7spZ0OhvjO6IsCLcBRUlRNqgOVU7rxGiRxii
	 Hv9vmdKcQmdpXz8c2lDkbHkzGMDki3MQG1yVmx2zuoAEAsH3b3Azs0Y/Pq9eF/j0nR
	 4GheDbvPtIqy1MNqikzfNaTkzHLqGNrCwYh29ePKWkmxWA/9DlSYrv4JjH0JJg4MoL
	 vRSqbdQzngPrm1hJukVPX5GhDWpsNfn5MlbRmcn9gpHn/La4JRluNKph2Xo1I+p7N8
	 CwBYp/U26rZ9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54AEEEE25E;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:58 +0100
Subject: [PATCH 13/21] pinctrl: Add drivers for ADI ADSP-SC5xx platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-13-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=29319;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=GfxjQyaWdYihVTbmYZ8dKtXQxxhTt6kZCTW4eIPAJo8=;
 b=zU6rjIlKSsjPtuH6NdYWdBwgPpnIdUtfa9gVkK3cZ7u4PLhzAukEglamykqFZw7ApY9Cfx3+2
 It5Yp2iMV2rAd9LiruUBX0WregtYH77bbVy5fdt8vbuKDYe0U/ufjg6
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC5xx pinctrler:
 - Support switching GPIO pin functions.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/pinctrl/Kconfig        |  12 +
 drivers/pinctrl/Makefile       |   1 +
 drivers/pinctrl/pinctrl-adsp.c | 919 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 932 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7e4f93a3bc7ac9bcafc92ddb795569d7cca6474d..ffc0946c5b416c29803e195016867aee8f09afe1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -31,6 +31,18 @@ config DEBUG_PINCTRL
 	help
 	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
 
+config PINCTRL_ADSP
+	bool "ADSP-SC5XX pinctrl driver"
+	depends on ARCH_SC59X_64
+	depends on OF
+	select PINMUX
+	select GPIOLIB
+	select GENERIC_PINCONF
+	help
+	  Say Y here to enable the ADSP-SC5XX pinctrl driver. This is required for
+	  correct peripheral functionality on the SoC.
+
+
 config PINCTRL_AMD
 	bool "AMD GPIO pin control"
 	depends on HAS_IOMEM
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index cc809669405ab6c6905fe0b2380f91b211a2d470..6b340bf0ee8c0267cbbdee3d14db605a340433c6 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
+obj-$(CONFIG_PINCTRL_ADSP)	+= pinctrl-adsp.o
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
 obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
 obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
diff --git a/drivers/pinctrl/pinctrl-adsp.c b/drivers/pinctrl/pinctrl-adsp.c
new file mode 100644
index 0000000000000000000000000000000000000000..ce86e579e5601203a446c09b5b5f7f60aba6d02a
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-adsp.c
@@ -0,0 +1,919 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices ADSP family pinctrl driver.
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <linux/of.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/soc/adi/adsp-gpio-port.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinctrl-utils.h"
+
+/* Convert from pinmux constants in device tree to actual settings */
+#define ADSP_PINMUX_PIN(p) ((p & 0xffffff00) >> 8)
+#define ADSP_PINMUX_FUNC(p) (p & 0xff)
+
+/* Details of the PORT_MUX register */
+#define ADSP_PORT_PORT_MUX_BITS 2
+#define ADSP_PORT_PORT_MUX_MASK GENMASK(1, 0)
+
+/* Number of pin alternate functions, see pin_functions array */
+#define ADSP_NUMBER_OF_PIN_FUNCTIONS ARRAY_SIZE(pin_functions)
+
+/* Information for drive strength registers */
+#define ADSP_PADS_DS_BITS				3
+#define ADSP_PADS_DS_PINS_PER_REG		8
+#define ADSP_PADS_DS_HIGH				2
+#define ADSP_PADS_DS_LOW				1
+
+/* Information for pull up/pull down enable registers */
+#define ADSP_PADS_PUD_PINS_PER_REG		16
+
+#define ADSP_PADS_REG_PCFG0				0x04
+#define ADSP_PADS_REG_PCFG1				0x08
+/* Convert from pin number (e.g. 0-143) to drive strength register offset */
+#define ADSP_PADS_PORTx_DS(p)			(0x0c + 0x04*(p/ADSP_PADS_DS_PINS_PER_REG))
+#define ADSP_PADS_NONPORTS_DS			0x50
+/* Convert from pin number to pull up enable register offset */
+#define ADSP_PADS_PORTx_PUE(p)			(0x98 + 0x04*(p/ADSP_PADS_PUD_PINS_PER_REG))
+/* Convert from pin number to pull down enable register offset */
+#define ADSP_PADS_PORTx_PDE(p)			(0xc4 + 0x04*(p/ADSP_PADS_PUD_PINS_PER_REG))
+
+/* Non GPIO PORT drive strength settings */
+#define ADSP_NONPORTS_DS_CKOUT			0
+#define ADSP_NONPORTS_DS_RESOUTB		1
+#define ADSP_NONPORTS_DS_FAULTB			2
+#define ADSP_NONPORTS_DS_LP1CK			3
+#define ADSP_NONPORTS_DS_LP0CK			4
+#define ADSP_NONPORTS_DS_OSPI			5
+
+/* DAI pad configuration offsets */
+#define ADSP_PADS_REG_DAI0_0_DS			0x78
+#define ADSP_PADS_REG_DAI0_1_DS			0x7c
+#define ADSP_PADS_REG_DAI1_0_DS			0x80
+#define ADSP_PADS_REG_DAI1_1_DS			0x84
+
+#define ADSP_PADS_REG_DAI0_PUE			0xbc
+#define ADSP_PADS_REG_DAI1_PUE			0xc0
+#define ADSP_PADS_REG_DAI0_PDE			0xfc
+#define ADSP_PADS_REG_DAI1_PDE			0x100
+
+/*
+ * Represents a function setting for pins, controls the mux modes essentially
+ */
+struct adsp_pin_function {
+	const char *name;
+	/* 0 for gpio, 1-4 for alt functions 0-3 */
+	uint8_t mode;
+};
+
+/*
+ * Available pin function settings in the pin mux for GPIO-associated pins
+ */
+static const struct adsp_pin_function pin_functions[] = {
+	{
+		.name = "gpio",
+		.mode = 0,
+	}, {
+		.name = "alt0",
+		.mode = 1,
+	}, {
+		.name = "alt1",
+		.mode = 2,
+	}, {
+		.name = "alt2",
+		.mode = 3,
+	}, {
+		.name = "alt3",
+		.mode = 4,
+	}
+};
+
+/*
+ * One pinctrl instance per chip, unifies the interface to the port mux and pad
+ * conf registers in the PORT instances
+ * @todo pads registers should be routed through system configuration abstraction
+ *       to remove the need for feature testing/listing "missing" registers here
+ */
+struct adsp_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pin_dev;
+	void __iomem *regs;
+	const char **group_names;
+	unsigned int *pins;
+	spinlock_t lock;
+	size_t num_ports;
+	uint32_t *pin_counts;
+	uint32_t total_pins;
+
+	/* Are the drive strength registers missing on this part? */
+	bool ds_missing;
+
+	/* Are the pull up/down enable registers missing on this part? */
+	bool pude_missing;
+};
+
+/*
+ * Custom pinconf properties
+ */
+#define ADSP_PIN_CONFIG_TRU_TOGGLE (PIN_CONFIG_END+1)
+
+static const struct pinconf_generic_params adsp_custom_bindings[] = {
+	/* Configure this pin as a toggle pin which flip each time a trigger event
+	 * is received by the pin controller from the TRU
+	 */
+	{"adi,tru-toggle", ADSP_PIN_CONFIG_TRU_TOGGLE, 0}
+};
+
+static const struct pin_config_item adsp_conf_items[] = {
+	PCONFDUMP(ADSP_PIN_CONFIG_TRU_TOGGLE, "tru-toggle", NULL, false),
+};
+
+/* does not need lock */
+static void adsp_set_pin_gpio(struct adsp_gpio_port *port, unsigned int offset, bool gpio)
+{
+	if (gpio)
+		__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_FER_CLEAR);
+	else
+		__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_FER_SET);
+}
+
+/*
+ * Configure a pin either for gpio or an alternate function
+ */
+static void adsp_portmux_setup(struct adsp_gpio_port *port, unsigned int offset,
+	const struct adsp_pin_function *func)
+{
+	if (func->mode == 0) {
+		adsp_set_pin_gpio(port, offset, true);
+	} else {
+		unsigned long flags;
+		u32 val;
+		u32 f = (func->mode - 1) & ADSP_PORT_PORT_MUX_MASK;
+
+		spin_lock_irqsave(&port->lock, flags);
+
+		val = __adsp_gpio_readl(port, ADSP_PORT_REG_PORT_MUX);
+		val &= ~(ADSP_PORT_PORT_MUX_MASK << (ADSP_PORT_PORT_MUX_BITS * offset));
+		val |= f << (ADSP_PORT_PORT_MUX_BITS * offset);
+		__adsp_gpio_writel(port, val, ADSP_PORT_REG_PORT_MUX);
+
+		spin_unlock_irqrestore(&port->lock, flags);
+
+		adsp_set_pin_gpio(port, offset, false);
+	}
+}
+
+/* pin control operations */
+static int adsp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return adsp_pinctrl->total_pins;
+}
+
+static const char *adsp_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+	unsigned int selector)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return adsp_pinctrl->group_names[selector];
+}
+
+static int adsp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+	const unsigned int **pins, unsigned int *num_pins)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	*pins = &adsp_pinctrl->pins[selector];
+	*num_pins = 1;
+	return 0;
+}
+
+static int adsp_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+	struct device_node *np, struct pinctrl_map **map, unsigned int *reserved_maps,
+	unsigned int *num_maps)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	//struct property *prop;
+	const char *group;
+	unsigned long *configs;
+	unsigned int num_configs, num_pins;
+	unsigned int reserve = 0;
+	//uint32_t pinmux;
+	//const __be32 *p;
+	u32 array[2];
+	int sz, i;
+	int ret;
+
+	num_pins = of_property_count_u32_elems(np, "pinmux");
+	if (num_pins <= 0) {
+		dev_err(adsp_pinctrl->dev, "Must have at least one `pinmux` entry in %pOFn.\n",
+			np);
+		return -EINVAL;
+	}
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
+	if (ret)
+		return ret;
+
+	/* One configuration for the whole group, potentially */
+	reserve = num_pins;
+	if (num_configs)
+		reserve = reserve * 2;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps, reserve);
+	if (ret)
+		goto exit;
+
+	sz = of_property_read_variable_u32_array(np, "pinmux", array, 2, 2);
+	sz = (sz == -EINVAL) ? 0 : sz; /* Missing property is OK */
+	if (sz < 0)
+		return dev_err_probe(adsp_pinctrl->dev, sz, "invalid pinmux\n");
+
+
+	for (i = 0; i < sz; i += 2) {
+		u32 pin = array[i];
+		u32 func = array[i + 1];
+
+		if (func >= ADSP_NUMBER_OF_PIN_FUNCTIONS) {
+			dev_err(adsp_pinctrl->dev,
+				"Function number %d is not available for pin %d in %pOFn.n\n",
+				func, pin, np);
+			goto exit;
+		}
+
+		group = adsp_pinctrl->group_names[pin];
+		ret = pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
+			group, pin_functions[func].name);
+		if (ret)
+			goto exit;
+
+		if (num_configs) {
+			ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps, num_maps,
+				group, configs, num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
+			if (ret)
+				goto exit;
+		}
+	}
+
+	ret = 0;
+exit:
+	kfree(configs);
+	return ret;
+}
+
+/**
+ * Handle device tree structures like:
+ *
+ * pinctrl_uart0_hwflow: uart0_hwflow_pins {
+ *   pins_rxtx_ {
+ *     pinmux = <1>, <2>;
+ *     some-padconf-flag;
+ *   };
+ *   pins_hwflow {
+ *     pinmux = <3>, <4>;
+ *     some-other-padconf-flag;
+ *   };
+ * };
+ *
+ * where &pinctrl_uart0_hwflow is passed as an entry in pinctrl-0 on uart driver and
+ * enables all sub-pins at once
+ */
+static int adsp_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+	struct device_node *np, struct pinctrl_map **map, unsigned int *num_maps)
+{
+	unsigned int reserved_maps;
+	struct device_node *child_np;
+	int ret;
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	for_each_child_of_node(np, child_np) {
+		ret = adsp_pinctrl_dt_subnode_to_map(pctldev, child_np, map,
+					&reserved_maps, num_maps);
+		if (ret < 0)
+			goto exit;
+	}
+	return 0;
+
+exit:
+	pinctrl_utils_free_map(pctldev, *map, *num_maps);
+	return ret;
+}
+
+static const struct pinctrl_ops adsp_pctlops = {
+	.get_groups_count = adsp_pinctrl_get_groups_count,
+	.get_group_name = adsp_pinctrl_get_group_name,
+	.get_group_pins = adsp_pinctrl_get_group_pins,
+	.dt_node_to_map = adsp_pinctrl_dt_node_to_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+/* pin mux operations */
+static int adsp_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ADSP_NUMBER_OF_PIN_FUNCTIONS;
+}
+
+static const char *adsp_pinmux_get_function_name(struct pinctrl_dev *pctldev,
+	unsigned int selector)
+{
+	return pin_functions[selector].name;
+}
+
+static int adsp_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
+	unsigned int selector, const char * const **groups, unsigned * const num_groups)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = adsp_pinctrl->group_names;
+	*num_groups = adsp_pinctrl->total_pins;
+	return 0;
+}
+
+/* Each group is exactly 1 pin and group id == pin id */
+static int adsp_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int func,
+	unsigned int group)
+{
+	struct adsp_gpio_port *port;
+	struct pinctrl_gpio_range *range;
+	u32 offset;
+
+	range = pinctrl_find_gpio_range_from_pin(pctldev, group);
+	if (!range || !range->gc)
+		return -EPROBE_DEFER;
+
+	offset = group - range->pin_base;
+
+	port = to_adsp_gpio_port(range->gc);
+	adsp_portmux_setup(port, offset, &pin_functions[func]);
+
+	return 0;
+}
+
+static int adsp_pinmux_request_gpio(struct pinctrl_dev *pctldev,
+	struct pinctrl_gpio_range *range, unsigned int pin)
+{
+	struct adsp_gpio_port *port = to_adsp_gpio_port(range->gc);
+	u32 offset = pin - range->pin_base;
+
+	adsp_set_pin_gpio(port, offset, true);
+	return 0;
+}
+
+static void adsp_pinmux_release_gpio(struct pinctrl_dev *pctldev,
+	struct pinctrl_gpio_range *range, unsigned int pin)
+{
+	struct adsp_gpio_port *port = to_adsp_gpio_port(range->gc);
+	u32 offset = pin - range->pin_base;
+
+	adsp_set_pin_gpio(port, offset, false);
+}
+
+static const struct pinmux_ops adsp_pmxops = {
+	.get_functions_count = adsp_pinmux_get_functions_count,
+	.get_function_name = adsp_pinmux_get_function_name,
+	.get_function_groups = adsp_pinmux_get_function_groups,
+	.set_mux = adsp_pinmux_set_mux,
+	.gpio_request_enable = adsp_pinmux_request_gpio,
+	.gpio_disable_free = adsp_pinmux_release_gpio,
+};
+
+/* pin configuration operations */
+static bool __adsp_pinconf_is_pue(struct adsp_pinctrl *p, unsigned int pin)
+{
+	u32 offset = ADSP_PADS_PORTx_PUE(pin);
+	u32 val, bit;
+
+	if (p->pude_missing)
+		return 0;
+
+	val = readl(p->regs + offset);
+	bit = BIT(pin & (ADSP_PADS_PUD_PINS_PER_REG-1));
+	return !!(val & bit);
+}
+
+static bool __adsp_pinconf_is_pde(struct adsp_pinctrl *p, unsigned int pin)
+{
+	u32 offset = ADSP_PADS_PORTx_PDE(pin);
+	u32 val, bit;
+
+	if (p->pude_missing)
+		return 0;
+
+	val = readl(p->regs + offset);
+	bit = BIT(pin & (ADSP_PADS_PUD_PINS_PER_REG-1));
+	return !!(val & bit);
+}
+
+static u32 __adsp_pinconf_get_ds(struct adsp_pinctrl *p, unsigned int pin)
+{
+	u32 offset = ADSP_PADS_PORTx_DS(pin);
+	u32 val, shift, mask;
+
+	if (p->ds_missing)
+		return 0;
+
+	val = readl(p->regs + offset);
+	shift = (pin & (ADSP_PADS_DS_PINS_PER_REG-1)) * ADSP_PADS_DS_BITS;
+	mask = GENMASK(ADSP_PADS_DS_BITS-1, 0) << shift;
+	val = val & mask;
+
+	if (val == ADSP_PADS_DS_HIGH)
+		return 1;
+	return 0;
+}
+
+/* seems we return -EINVAL for disabled static option, -ENOTSUPP for not supported,
+ * and otherwise the argument is included in config
+ */
+static int adsp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+	unsigned long *config)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct pinctrl_gpio_range *range;
+	struct adsp_gpio_port *port;
+	u32 offset, val;
+	u32 param = pinconf_to_config_param(*config);
+	u32 arg = 0;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (__adsp_pinconf_is_pue(adsp_pinctrl, pin) ||
+		    __adsp_pinconf_is_pde(adsp_pinctrl, pin))
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (!__adsp_pinconf_is_pde(adsp_pinctrl, pin))
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (!__adsp_pinconf_is_pue(adsp_pinctrl, pin))
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = __adsp_pinconf_get_ds(adsp_pinctrl, pin);
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
+		offset = pin - range->pin_base;
+		port = to_adsp_gpio_port(range->gc);
+
+		if (!(port->open_drain & BIT(offset)))
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
+		offset = pin - range->pin_base;
+		port = to_adsp_gpio_port(range->gc);
+
+		if (port->open_drain & BIT(offset))
+			return -EINVAL;
+		break;
+	case ADSP_PIN_CONFIG_TRU_TOGGLE:
+		range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
+		offset = pin - range->pin_base;
+		port = to_adsp_gpio_port(range->gc);
+
+		val = __adsp_gpio_readl(port, ADSP_PORT_REG_TRIG_TGL);
+		if (!(val & BIT(offset)))
+			return -EINVAL;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static void __adsp_pinconf_pue(struct adsp_pinctrl *p, unsigned int pin, bool state)
+{
+	u32 offset = ADSP_PADS_PORTx_PUE(pin);
+	u32 val, bit;
+
+	if (p->pude_missing) {
+		dev_warn(p->dev,
+			 "Pull Up Enable is not supported by this PADS HW (tried to set PUE for pin %d)\n",
+			 pin);
+		return;
+	}
+
+	val = readl(p->regs + offset);
+	bit = BIT(pin & (ADSP_PADS_PUD_PINS_PER_REG-1));
+
+	if (state)
+		writel(val | bit, p->regs + offset);
+	else
+		writel(val & ~bit, p->regs + offset);
+}
+
+static void __adsp_pinconf_pde(struct adsp_pinctrl *p, unsigned int pin, bool state)
+{
+	u32 offset = ADSP_PADS_PORTx_PDE(pin);
+	u32 val, bit;
+
+	if (p->pude_missing) {
+		dev_warn(p->dev,
+			 "Pull Down Enable is not supported by this PADS HW (tried to set PDE for pin %d)\n",
+			 pin);
+		return;
+	}
+
+	val = readl(p->regs + offset);
+	bit = BIT(pin & (ADSP_PADS_PUD_PINS_PER_REG-1));
+
+	if (state)
+		writel(val | bit, p->regs + offset);
+	else
+		writel(val & ~bit, p->regs + offset);
+}
+
+static void __adsp_pinconf_ds(struct adsp_pinctrl *p, unsigned int pin, bool high)
+{
+	u32 offset = ADSP_PADS_PORTx_DS(pin);
+	u32 val, shift, mask;
+
+	if (p->ds_missing) {
+		dev_warn(p->dev,
+			"Drive strength is not supported by this PADS HW (tried to set drive strength for pin %d)\n",
+			pin);
+		return;
+	}
+
+	val = readl(p->regs + offset);
+	shift = (pin & (ADSP_PADS_DS_PINS_PER_REG-1)) * ADSP_PADS_DS_BITS;
+	mask = GENMASK(ADSP_PADS_DS_BITS-1, 0) << shift;
+	val = val & ~mask;
+
+	if (high)
+		writel(val | (ADSP_PADS_DS_HIGH << shift), p->regs + offset);
+	else
+		writel(val | (ADSP_PADS_DS_LOW << shift), p->regs + offset);
+}
+
+static int adsp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+	unsigned long *config, unsigned int num_configs)
+{
+	struct adsp_pinctrl *adsp_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct pinctrl_gpio_range *range;
+	struct adsp_gpio_port *port;
+	u32 param, arg, val;
+	u32 offset;
+	int cfg;
+	int ret = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&adsp_pinctrl->lock, flags);
+
+	for (cfg = 0; cfg < num_configs; ++cfg) {
+		param = pinconf_to_config_param(config[cfg]);
+		arg = pinconf_to_config_argument(config[cfg]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			__adsp_pinconf_pue(adsp_pinctrl, pin, false);
+			__adsp_pinconf_pde(adsp_pinctrl, pin, false);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			__adsp_pinconf_pde(adsp_pinctrl, pin, !!arg);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			__adsp_pinconf_pue(adsp_pinctrl, pin, !!arg);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			/* This only supports high/low-speed drive strength (see HRM)
+			 * so assume any positive value means we would like high-speed strength
+			 */
+			__adsp_pinconf_ds(adsp_pinctrl, pin, !!arg);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
+			offset = pin - range->pin_base;
+			port = to_adsp_gpio_port(range->gc);
+
+			spin_lock(&port->lock);
+			val = __adsp_gpio_readw(port, ADSP_PORT_REG_DATA);
+			val &= BIT(offset);
+
+			if (val) {
+				/* open drain with value of 1 => configure as input */
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_CLEAR);
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);
+			} else {
+				/* open drain with value of 0 => configure as output, drive 0 */
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_CLEAR);
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DATA_CLEAR);
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_SET);
+			}
+
+			port->open_drain |= BIT(offset);
+			spin_unlock(&port->lock);
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
+			offset = pin - range->pin_base;
+			port = to_adsp_gpio_port(range->gc);
+
+			spin_lock(&port->lock);
+
+			/*
+			 * by default make the pin an input when exiting open drain mode;
+			 * user can correct later with GPIO in/out configuration
+			 */
+			if (port->open_drain & BIT(offset)) {
+				port->open_drain &= ~BIT(offset);
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_CLEAR);
+				__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);
+			}
+
+			spin_unlock(&port->lock);
+			break;
+		case ADSP_PIN_CONFIG_TRU_TOGGLE:
+			range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
+			offset = pin - range->pin_base;
+			port = to_adsp_gpio_port(range->gc);
+
+			spin_lock(&port->lock);
+			val = __adsp_gpio_readl(port, ADSP_PORT_REG_TRIG_TGL);
+			val |= BIT(offset);
+			__adsp_gpio_writel(port, val, ADSP_PORT_REG_TRIG_TGL);
+			spin_unlock(&port->lock);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			goto end;
+		}
+	}
+
+end:
+	spin_unlock_irqrestore(&adsp_pinctrl->lock, flags);
+	return ret;
+}
+
+/* Config for all pins must match or we have an error regarding group structure */
+static int adsp_pinconf_group_get(struct pinctrl_dev *pctldev, unsigned int group,
+	unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins, i;
+	unsigned long first;
+	int ret;
+
+	ret = adsp_pinctrl_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; ++i) {
+		ret = adsp_pinconf_get(pctldev, pins[i], config);
+		if (ret)
+			return ret;
+
+		if (i == 0)
+			first = *config;
+
+		if (first != *config)
+			return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int adsp_pinconf_group_set(struct pinctrl_dev *pctldev, unsigned int group,
+	unsigned long *configs, unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins, i;
+	int ret;
+
+	ret = adsp_pinctrl_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; ++i) {
+		ret = adsp_pinconf_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops adsp_confops = {
+	.is_generic = true,
+	.pin_config_get = adsp_pinconf_get,
+	.pin_config_set = adsp_pinconf_set,
+	.pin_config_group_get = adsp_pinconf_group_get,
+	.pin_config_group_set = adsp_pinconf_group_set,
+#ifdef CONFIG_DEBUG_FS
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+#endif
+};
+
+/*
+ * We want to make one group per pin so that we can refer to the pins by group
+ * later on when mux assignments are made
+ */
+static int adsp_pinctrl_init_groups(struct adsp_pinctrl *adsp_pinctrl,
+	struct pinctrl_desc *desc)
+{
+	struct device *dev = adsp_pinctrl->dev;
+	struct pinctrl_pin_desc *all_pins;
+	size_t port, pin;
+	unsigned int i, pin_total;
+	int num_ports;
+	int ret;
+
+	num_ports = of_property_count_u32_elems(dev->of_node, "adi,port-sizes");
+
+	if (num_ports < 0)
+		return num_ports;
+
+	if (num_ports == 0) {
+		dev_err(dev, "pinctrl missing `adi,port-sizes` port size definition\n");
+		return -ENOENT;
+	}
+
+	adsp_pinctrl->num_ports = num_ports;
+
+	adsp_pinctrl->pin_counts = devm_kcalloc(dev, sizeof(*adsp_pinctrl->pin_counts),
+		num_ports, GFP_KERNEL);
+	if (!adsp_pinctrl->pin_counts)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(dev->of_node, "adi,port-sizes",
+		adsp_pinctrl->pin_counts, num_ports);
+	if (ret)
+		return ret;
+
+	pin_total = 0;
+
+	for (i = 0; i < num_ports; ++i)
+		pin_total += adsp_pinctrl->pin_counts[i];
+
+	adsp_pinctrl->total_pins = pin_total;
+
+	all_pins = devm_kcalloc(dev, sizeof(*all_pins), adsp_pinctrl->total_pins,
+		GFP_KERNEL);
+
+	adsp_pinctrl->pins = devm_kcalloc(dev, sizeof(adsp_pinctrl->pins),
+		adsp_pinctrl->total_pins, GFP_KERNEL);
+	if (!adsp_pinctrl->pins)
+		return -ENOMEM;
+
+	adsp_pinctrl->group_names = devm_kcalloc(dev, sizeof(*adsp_pinctrl->group_names),
+		adsp_pinctrl->total_pins, GFP_KERNEL);
+	if (!adsp_pinctrl->group_names)
+		return -ENOMEM;
+
+	i = 0;
+	for (port = 0; port < adsp_pinctrl->num_ports; ++port) {
+		for (pin = 0; pin < adsp_pinctrl->pin_counts[port]; ++pin) {
+			adsp_pinctrl->group_names[i] = devm_kasprintf(dev, GFP_KERNEL,
+				"p%c%zu", (char) ('A' + port), pin);
+			adsp_pinctrl->pins[i] = i;
+
+			all_pins[i].name = adsp_pinctrl->group_names[i];
+			all_pins[i].number = i;
+			i += 1;
+		}
+	}
+
+	desc->pins = all_pins;
+	desc->npins = adsp_pinctrl->total_pins;
+
+	return 0;
+}
+
+static void adsp_set_nongpio_ds(struct adsp_pinctrl *p, int type, bool high)
+{
+	u32 val = readl(p->regs + ADSP_PADS_NONPORTS_DS);
+	u32 shift = ADSP_PADS_DS_BITS * type;
+	u32 mask = GENMASK(ADSP_PADS_DS_BITS-1, 0) << shift;
+
+	val = val & ~mask;
+
+	if (high)
+		writel(val | (ADSP_PADS_DS_HIGH << shift), p->regs + ADSP_PADS_NONPORTS_DS);
+	else
+		writel(val | (ADSP_PADS_DS_LOW << shift), p->regs + ADSP_PADS_NONPORTS_DS);
+}
+
+static int adsp_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct adsp_pinctrl *adsp_pinctrl;
+	struct pinctrl_desc *pnctrl_desc;
+	struct resource *res;
+	u32 val;
+	int ret;
+
+	adsp_pinctrl = devm_kzalloc(dev, sizeof(*adsp_pinctrl), GFP_KERNEL);
+	if (!adsp_pinctrl)
+		return -ENOMEM;
+
+	adsp_pinctrl->dev = dev;
+	pnctrl_desc = devm_kzalloc(dev, sizeof(*pnctrl_desc), GFP_KERNEL);
+	if (!pnctrl_desc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	adsp_pinctrl->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(adsp_pinctrl->regs))
+		return PTR_ERR(adsp_pinctrl->regs);
+
+	/* Different features are available in different hw revisions; no way to read this
+	 * from an ID register so the missing features need to be specified in dts
+	 */
+	adsp_pinctrl->ds_missing = of_property_read_bool(np, "adi,no-drive-strength");
+	adsp_pinctrl->pude_missing = of_property_read_bool(np, "adi,no-pull-up-down");
+
+	/* Only if requested, adjust non-port drive strengths */
+	ret = of_property_read_u32(np, "adi,clkout-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_CKOUT, !!val);
+
+	ret = of_property_read_u32(np, "adi,resoutb-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_RESOUTB, !!val);
+
+	ret = of_property_read_u32(np, "adi,faultb-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_FAULTB, !!val);
+
+	ret = of_property_read_u32(np, "adi,lp1ck-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_LP1CK, !!val);
+
+	ret = of_property_read_u32(np, "adi,lp0ck-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_LP0CK, !!val);
+
+	ret = of_property_read_u32(np, "adi,ospi-drive-strength", &val);
+	if (!ret)
+		adsp_set_nongpio_ds(adsp_pinctrl, ADSP_NONPORTS_DS_OSPI, !!val);
+
+	pnctrl_desc->name = dev_name(dev);
+	pnctrl_desc->pctlops = &adsp_pctlops;
+	pnctrl_desc->confops = &adsp_confops;
+	pnctrl_desc->pmxops = &adsp_pmxops;
+	pnctrl_desc->owner = THIS_MODULE;
+	pnctrl_desc->num_custom_params = ARRAY_SIZE(adsp_custom_bindings);
+	pnctrl_desc->custom_params = adsp_custom_bindings;
+	pnctrl_desc->custom_conf_items = adsp_conf_items;
+
+	spin_lock_init(&adsp_pinctrl->lock);
+	ret = adsp_pinctrl_init_groups(adsp_pinctrl, pnctrl_desc);
+	if (ret)
+		return ret;
+
+	ret = devm_pinctrl_register_and_init(dev, pnctrl_desc, adsp_pinctrl,
+		&adsp_pinctrl->pin_dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, adsp_pinctrl);
+	ret = pinctrl_enable(adsp_pinctrl->pin_dev);
+	return ret;
+}
+
+static const struct of_device_id adsp_pinctrl_of_match[] = {
+	{ .compatible = "adi,adsp-pinctrl", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adsp_pinctrl_of_match);
+
+static struct platform_driver adsp_pinctrl_driver = {
+	.driver = {
+		.name = "adsp-pinctrl",
+		.of_match_table = adsp_pinctrl_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = adsp_pinctrl_probe,
+};
+
+static int __init adsp_pinctrl_init(void)
+{
+	return platform_driver_register(&adsp_pinctrl_driver);
+}
+
+/*
+ * We want the pinctrl driver to be available at arch init time not at the
+ * later device init time
+ */
+arch_initcall(adsp_pinctrl_init);
+
+MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
+MODULE_DESCRIPTION("Analog Devices Pinctrl driver");
+MODULE_LICENSE("GPL v2");
\ No newline at end of file

-- 
2.25.1



