Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F187C399E52
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFCKDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:03:11 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:33340 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhFCKDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:03:10 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E1C03208045;
        Thu,  3 Jun 2021 12:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622714485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:references;
        bh=FIcAu8n4YFiB347SqydtQPlkO258dhL2m23IncNvWcs=;
        b=m3OmlYnP3Iw6e67iLH3N7z7lVddk1/3+Osm36vA7U1uG66FGQ4tOHcQYsJwIQ/AtpruPti
        ij3Dr6859ydrB2Sefuc30nD8LrDKDXStvJHRlzp31JSIB4qSWwNYFGZyNM+VAfh+7YT2tO
        AgKkgDAJa0Ek9ETnEVHA0xTj1Faf8mdNEXg+gNPUFC7FSGfHUPHhTLZhsJWQvDFYZHlYvG
        7C1lFD2AuAHbn+7Z7AbGcpYnwKCJ81G5d+MnIliOA8cQDh45s3OgWtrKWZ/QtsAHXvIIHe
        STuKcTyVzf9NHRL/xWkr5H44UMosucR56eRe5FnelnfoMUykdUusr3Jg1NyX5Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v4 3/5] mfd: Add RTL8231 core device
Date:   Thu,  3 Jun 2021 12:00:42 +0200
Message-Id: <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622713678.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1622713678.git.sander@svanheule.net>
MIME-Version: 1.0
References:     <cover.1622713678.git.sander@svanheule.net>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The RTL8231 is implemented as an MDIO device, and provides a regmap
interface for register access by the core and child devices.

The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
Since kernel support for SMI is limited, and no real-world SMI
implementations have been encountered for this device, this is currently
unimplemented. The use of the regmap interface should make any future
support relatively straightforward.

After reset, all pins are muxed to GPIO inputs before the pin drivers
are enabled. This is done to prevent accidental system resets, when a
pin is connected to the parent SoC's reset line.

To provide different read and write semantics for the GPIO data
registers, a secondary virtual register range is used to enable separate
cacheing properties of pin input and output values.

Signed-off-by: Sander Vanheule <sander@svanheule.net>

---
v4:
- Define more bit masks
- Force writes to critical bit fields (reset, output enable)
- Add virtual addresses and cacheing

v3:
- Replace CONFIG_PM-ifdef'ery

v2:
- A missing MDIO_BUS dependency, as was reported by kernel test robot
  <lkp@intel.com>, is provided via REGMAP_MDIO.
  Link: https://lore.kernel.org/lkml/202105122003.JzBO0lrM-lkp@intel.com/
  Link: https://lore.kernel.org/lkml/202105122140.ZFyj5hQy-lkp@intel.com/
---
 drivers/mfd/Kconfig         |   9 ++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rtl8231.c       | 240 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rtl8231.h |  78 ++++++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..68f28a335b8c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1076,6 +1076,15 @@ config MFD_RDC321X
 	  southbridge which provides access to GPIOs and Watchdog using the
 	  southbridge PCI device configuration space.
 
+config MFD_RTL8231
+	tristate "Realtek RTL8231 GPIO and LED expander"
+	select MFD_CORE
+	select REGMAP_MDIO
+	help
+	  Support for the Realtek RTL8231 GPIO and LED expander.
+	  Provides up to 37 GPIOs, 88 LEDs, and one PWM output.
+	  When built as a module, this module will be named rtl8231.
+
 config MFD_RT5033
 	tristate "Richtek RT5033 Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8a5f76..4b27c2486ccc 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -234,6 +234,7 @@ obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
 obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RTL8231)	+= rtl8231.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
diff --git a/drivers/mfd/rtl8231.c b/drivers/mfd/rtl8231.c
new file mode 100644
index 000000000000..85ecdab49c3c
--- /dev/null
+++ b/drivers/mfd/rtl8231.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/core.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/rtl8231.h>
+
+#define RTL8231_ALL_PINS_MASK	GENMASK(RTL8231_BITS_VAL - 1, 0)
+#define RTL8231_REAL_REG(reg)	(reg & GENMASK(4, 0))
+
+/* Only specify non-volatile registers that non-zero or write-only */
+static const struct reg_default rtl8231_reg_defaults[] = {
+	{ .reg = RTL8231_REG_PIN_MODE1,       .def = 0xf840 },
+	{ .reg = RTL8231_VREG_GPIO_DATA_OUT0, .def = 0x0000 },
+	{ .reg = RTL8231_VREG_GPIO_DATA_OUT1, .def = 0x0000 },
+	{ .reg = RTL8231_VREG_GPIO_DATA_OUT2, .def = 0x0000 },
+};
+
+static const struct regmap_range rtl8231_readable_ranges[] = {
+	regmap_reg_range(RTL8231_REG_FUNC0, RTL8231_REG_LED_END),
+	regmap_reg_range(RTL8231_REG_GPIO_DATA_IN0, RTL8231_REG_GPIO_DATA_IN2),
+};
+
+static const struct regmap_range rtl8231_non_readable_ranges[] = {
+	regmap_reg_range(0x1f, 0x1f),
+	regmap_reg_range(RTL8231_VREG(RTL8231_REG_FUNC0), RTL8231_VREG(RTL8231_REG_LED_END)),
+	regmap_reg_range(RTL8231_VREG_GPIO_DATA_OUT0, RTL8231_VREG_GPIO_DATA_OUT2),
+};
+
+static const struct regmap_range rtl8231_writeable_ranges[] = {
+	regmap_reg_range(RTL8231_REG_FUNC0, RTL8231_REG_LED_END),
+	regmap_reg_range(RTL8231_VREG_GPIO_DATA_OUT0, RTL8231_VREG_GPIO_DATA_OUT2),
+};
+
+static const struct regmap_range rtl8231_non_writeable_ranges[] = {
+	regmap_reg_range(0x1f, 0x1f),
+	regmap_reg_range(RTL8231_VREG(RTL8231_REG_FUNC0), RTL8231_VREG(RTL8231_REG_LED_END)),
+	regmap_reg_range(RTL8231_REG_GPIO_DATA_IN0, RTL8231_REG_GPIO_DATA_IN2),
+};
+
+static const struct regmap_access_table rtl8231_readable_table = {
+	.yes_ranges = rtl8231_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rtl8231_readable_ranges),
+	.no_ranges = rtl8231_non_readable_ranges,
+	.n_no_ranges = ARRAY_SIZE(rtl8231_non_readable_ranges),
+};
+
+static const struct regmap_access_table rtl8231_writeable_table = {
+	.yes_ranges = rtl8231_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rtl8231_writeable_ranges),
+	.no_ranges = rtl8231_non_writeable_ranges,
+	.n_no_ranges = ARRAY_SIZE(rtl8231_non_writeable_ranges),
+};
+
+static bool rtl8231_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	/* Registers with self-clearing bits, strapping pin values and inputs */
+	case RTL8231_REG_FUNC0:
+	case RTL8231_REG_FUNC1:
+	case RTL8231_REG_PIN_HI_CFG:
+	case RTL8231_REG_LED_END:
+	case RTL8231_REG_GPIO_DATA_IN0:
+	case RTL8231_REG_GPIO_DATA_IN1:
+	case RTL8231_REG_GPIO_DATA_IN2:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int rtl8231_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct mdio_device *mdio_dev = context;
+	int ret;
+
+	ret = mdiobus_read(mdio_dev->bus, mdio_dev->addr, RTL8231_REAL_REG(reg));
+
+	if (ret < 0)
+		return ret;
+
+	*val = ret & 0xffff;
+
+	return 0;
+}
+
+static int rtl8231_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct mdio_device *mdio_dev = context;
+
+	return mdiobus_write(mdio_dev->bus, mdio_dev->addr, RTL8231_REAL_REG(reg), val);
+}
+
+static const struct reg_field RTL8231_FIELD_LED_START = REG_FIELD(RTL8231_REG_FUNC0, 1, 1);
+
+static const struct mfd_cell rtl8231_cells[] = {
+	{
+		.name = "rtl8231-pinctrl",
+	},
+	{
+		.name = "rtl8231-leds",
+		.of_compatible = "realtek,rtl8231-leds",
+	},
+};
+
+static int rtl8231_init(struct device *dev, struct regmap *map)
+{
+	unsigned int val;
+	int err;
+
+	err = regmap_read(map, RTL8231_REG_FUNC1, &val);
+	if (err) {
+		dev_err(dev, "failed to read READY_CODE\n");
+		return err;
+	}
+
+	val = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, val);
+	if (val != RTL8231_FUNC1_READY_CODE_VALUE) {
+		dev_err(dev, "RTL8231 not present or ready 0x%x != 0x%x\n",
+			val, RTL8231_FUNC1_READY_CODE_VALUE);
+		return -ENODEV;
+	}
+
+	/* SOFT_RESET bit self-clears when done */
+	regmap_write_bits(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_SOFT_RESET, RTL8231_PIN_HI_CFG_SOFT_RESET);
+	err = regmap_read_poll_timeout(map, RTL8231_REG_PIN_HI_CFG, val,
+		!(val & RTL8231_PIN_HI_CFG_SOFT_RESET), 50, 1000);
+	if (err)
+		return err;
+
+	/*
+	 * Chip reset results in a pin configuration that is a mix of LED and GPIO outputs.
+	 * Select GPI functionality for all pins before enabling pin outputs.
+	 */
+	regmap_write(map, RTL8231_REG_PIN_MODE0, RTL8231_ALL_PINS_MASK);
+	regmap_write(map, RTL8231_REG_GPIO_DIR0, RTL8231_ALL_PINS_MASK);
+	regmap_write(map, RTL8231_REG_PIN_MODE1, RTL8231_ALL_PINS_MASK);
+	regmap_write(map, RTL8231_REG_GPIO_DIR1, RTL8231_ALL_PINS_MASK);
+	regmap_write(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_MODE_MASK | RTL8231_PIN_HI_CFG_DIR_MASK);
+
+	return 0;
+}
+
+static const struct regmap_config rtl8231_mdio_regmap_config = {
+	.val_bits = RTL8231_BITS_VAL,
+	.reg_bits = RTL8231_BITS_REG,
+	.volatile_reg = rtl8231_volatile_reg,
+	.rd_table = &rtl8231_readable_table,
+	.wr_table = &rtl8231_writeable_table,
+	.max_register = RTL8231_VREG(RTL8231_REG_COUNT - 1),
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.reg_read = rtl8231_reg_read,
+	.reg_write = rtl8231_reg_write,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = rtl8231_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rtl8231_reg_defaults),
+};
+
+static int rtl8231_mdio_probe(struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+	struct regmap_field *led_start;
+	struct regmap *map;
+	int err;
+
+	map = devm_regmap_init_mdio(mdiodev, &rtl8231_mdio_regmap_config);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to init regmap\n");
+		return PTR_ERR(map);
+	}
+
+	led_start = devm_regmap_field_alloc(dev, map, RTL8231_FIELD_LED_START);
+	if (IS_ERR(led_start))
+		return PTR_ERR(led_start);
+
+	dev_set_drvdata(dev, led_start);
+
+	mdiodev->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	device_property_read_u32(dev, "reset-assert-delay", &mdiodev->reset_assert_delay);
+	device_property_read_u32(dev, "reset-deassert-delay", &mdiodev->reset_deassert_delay);
+
+	err = rtl8231_init(dev, map);
+	if (err)
+		return err;
+
+	/* LED_START enables power to output pins, and starts the LED engine */
+	regmap_field_force_write(led_start, 1);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
+		ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
+}
+
+__maybe_unused static int rtl8231_suspend(struct device *dev)
+{
+	struct regmap_field *led_start = dev_get_drvdata(dev);
+
+	return regmap_field_force_write(led_start, 0);
+}
+
+__maybe_unused static int rtl8231_resume(struct device *dev)
+{
+	struct regmap_field *led_start = dev_get_drvdata(dev);
+
+	return regmap_field_force_write(led_start, 1);
+}
+
+static SIMPLE_DEV_PM_OPS(rtl8231_pm_ops, rtl8231_suspend, rtl8231_resume);
+
+static const struct of_device_id rtl8231_of_match[] = {
+	{ .compatible = "realtek,rtl8231" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rtl8231_of_match);
+
+static struct mdio_driver rtl8231_mdio_driver = {
+	.mdiodrv.driver = {
+		.name = "rtl8231-expander",
+		.of_match_table	= rtl8231_of_match,
+		.pm = pm_ptr(&rtl8231_pm_ops),
+	},
+	.probe = rtl8231_mdio_probe,
+};
+mdio_module_driver(rtl8231_mdio_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 GPIO and LED expander");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/rtl8231.h b/include/linux/mfd/rtl8231.h
new file mode 100644
index 000000000000..4ce0eab815f4
--- /dev/null
+++ b/include/linux/mfd/rtl8231.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Register definitions the RTL8231 GPIO and LED expander chip
+ */
+
+#ifndef __LINUX_MFD_RTL8231_H
+#define __LINUX_MFD_RTL8231_H
+
+#include <linux/bits.h>
+
+/*
+ * Registers addresses are 5 bit, values are 16 bit
+ * Also define a duplicated range of virtual addresses, to enable
+ * different read/write behaviour on the GPIO data registers
+ */
+#define RTL8231_BITS_VAL		16
+#define RTL8231_BITS_REG		5
+#define RTL8231_VREG(reg)		((reg) | BIT(RTL8231_BITS_REG))
+
+/* Chip control */
+#define RTL8231_REG_FUNC0		0x00
+#define RTL8231_FUNC0_SCAN_MODE		BIT(0)
+#define RTL8231_FUNC0_SCAN_SINGLE	0
+#define RTL8231_FUNC0_SCAN_BICOLOR	BIT(0)
+
+#define RTL8231_REG_FUNC1		0x01
+#define RTL8231_FUNC1_READY_CODE_VALUE	0x37
+#define RTL8231_FUNC1_READY_CODE_MASK	GENMASK(9, 4)
+#define RTL8231_FUNC1_DEBOUNCE_MASK	GENMASK(15, 10)
+
+/* Pin control */
+#define RTL8231_REG_PIN_MODE0		0x02
+#define RTL8231_REG_PIN_MODE1		0x03
+
+#define RTL8231_PIN_MODE_LED		0
+#define RTL8231_PIN_MODE_GPIO		1
+
+/* Pin high config: pin and GPIO control for pins 32-26 */
+#define RTL8231_REG_PIN_HI_CFG		0x04
+#define RTL8231_PIN_HI_CFG_MODE_MASK	GENMASK(4, 0)
+#define RTL8231_PIN_HI_CFG_DIR_MASK	GENMASK(9, 5)
+#define RTL8231_PIN_HI_CFG_INV_MASK	GENMASK(14, 10)
+#define RTL8231_PIN_HI_CFG_SOFT_RESET	BIT(15)
+
+/* GPIO control registers */
+#define RTL8231_REG_GPIO_DIR0		0x05
+#define RTL8231_REG_GPIO_DIR1		0x06
+#define RTL8231_REG_GPIO_INVERT0	0x07
+#define RTL8231_REG_GPIO_INVERT1	0x08
+
+#define RTL8231_GPIO_DIR_IN		1
+#define RTL8231_GPIO_DIR_OUT		0
+
+/*
+ * GPIO data registers
+ * Only the output data can be written to these registers, and only the input
+ * data can be read. Use a second, virtual register range to ensure proper
+ * read-modify-write behaviour of the output values.
+ */
+#define RTL8231_REG_GPIO_DATA_IN0	0x1c
+#define RTL8231_REG_GPIO_DATA_IN1	0x1d
+#define RTL8231_REG_GPIO_DATA_IN2	0x1e
+
+#define RTL8231_VREG_GPIO_DATA_OUT0	RTL8231_VREG(0x1c)
+#define RTL8231_VREG_GPIO_DATA_OUT1	RTL8231_VREG(0x1d)
+#define RTL8231_VREG_GPIO_DATA_OUT2	RTL8231_VREG(0x1e)
+
+#define RTL8231_PIN_HI_DATA_MASK	GENMASK(4, 0)
+
+/* LED control base registers */
+#define RTL8231_REG_LED0_BASE		0x09
+#define RTL8231_REG_LED1_BASE		0x10
+#define RTL8231_REG_LED2_BASE		0x17
+#define RTL8231_REG_LED_END		0x1b
+
+#define RTL8231_REG_COUNT		0x1f
+
+#endif /* __LINUX_MFD_RTL8231_H */
-- 
2.31.1

