Return-Path: <linux-gpio+bounces-27392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C76BF70FC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6713F3AEF4D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0187233F8B6;
	Tue, 21 Oct 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="opoCB//Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AC33DECD
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056680; cv=none; b=uaGdxZ64xSmCRFQXb7Oibs3gMmzvs48IIvrNnnpidFpKYIoxwuvfH+RVqDuNeyoNwRfeqExcvj7jEFl1HcYz1eXNXzU7mMqIPY0C05QUjvVB85ifGWxTGzkeMasVZP5LUSgTVBbkhbfJK4/7dSZTFxT1kcnaX8xRmKQtD5ORIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056680; c=relaxed/simple;
	bh=jLI+h6KV8fw+tYZjvwuHlz+fCtyqcBrztCk7exxw5g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efjwKH9eqvuGujTwCjD3k48UY/sQSTBDNshM0yvQtm5XnXz/g3TqPXOtyzIFOh2mY7TUpaDPogJQle1SbGg3yw4T5tK2qC51c2C0O4k4Nmf7ftTQyexh1qEJEgYNyT3FntlxAqERXY7jpMAa9nVuukm0BYxrXknegO5IWoGIyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=opoCB//Y; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 3378968A1D0;
	Tue, 21 Oct 2025 16:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oX3xu74JavTeHeufry9oqW2UCGbaS+twS6lg3QCcc/c=;
	b=opoCB//YH8FLw6HFlk32scFSAjvzJUqZ0fwYpyOEJdmAGaMENIWm76saM8NU+ZxLhuAZm1
	STI6MJqoZT8r10UQem5DIcAks8EmHx0ilAmbpreJ5uxChPKCBm95PaoipGt6uCAQ9uML+l
	8HdqGlnnff8v4J9M/7e6YOiKSucmd8VNvG6Tw6vwaFgrR3dmGmZlkrXgH3sU7ar/QHgYzf
	tSoZKY3cAAuIiEgMkZTShfm5zG1InDs7Tft5VkfJo1aM2AigC0N2BOrMCC/3UZasel9BAV
	VedTfniMoxUCSMU8BQVDnnLL4KPArg+J7ERKvqWpwvzzSFjvyojbHNYKFGBHVw==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v6 5/8] mfd: Add RTL8231 core device
Date: Tue, 21 Oct 2025 16:24:00 +0200
Message-ID: <20251021142407.307753-6-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL8231 is implemented as an MDIO device, and provides a regmap
interface for register access by the core and child devices.

The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
Since kernel support for SMI is limited, and no real-world SMI
implementations have been encountered for this device, this is currently
unimplemented. The use of the regmap interface should make any future
support relatively straightforward.

After a soft reset, all pins are muxed to GPIO inputs before the pin
drivers are enabled. This is done to prevent accidental system resets,
when a pin is connected to the main SoC's reset line.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/mfd/Kconfig         |   9 ++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rtl8231.c       | 193 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rtl8231.h |  71 +++++++++++++
 4 files changed, 274 insertions(+)
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947b..e13e2df63fee 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1301,6 +1301,15 @@ config MFD_RDC321X
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
 config MFD_RT4831
 	tristate "Richtek RT4831 four channel WLED and Display Bias Voltage"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 865e9f12faff..ba973382a20f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -252,6 +252,7 @@ obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI6421_SPMI)	+= hi6421-spmi-pmic.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RTL8231)	+= rtl8231.o
 obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_RT5120)	+= rt5120.o
diff --git a/drivers/mfd/rtl8231.c b/drivers/mfd/rtl8231.c
new file mode 100644
index 000000000000..60d4a0feea5c
--- /dev/null
+++ b/drivers/mfd/rtl8231.c
@@ -0,0 +1,193 @@
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
+static bool rtl8231_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	/*
+	 * Registers with self-clearing bits, strapping pin values.
+	 * Don't mark the data registers as volatile, since we need
+	 * caching for the output values.
+	 */
+	case RTL8231_REG_FUNC0:
+	case RTL8231_REG_FUNC1:
+	case RTL8231_REG_PIN_HI_CFG:
+	case RTL8231_REG_LED_END:
+		return true;
+	default:
+		return false;
+	}
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
+static int rtl8231_soft_reset(struct regmap *map)
+{
+	const unsigned int all_pins_mask = GENMASK(RTL8231_BITS_VAL - 1, 0);
+	unsigned int val;
+	int err;
+
+	/* SOFT_RESET bit self-clears when done */
+	regmap_write_bits(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_SOFT_RESET, RTL8231_PIN_HI_CFG_SOFT_RESET);
+	err = regmap_read_poll_timeout(map, RTL8231_REG_PIN_HI_CFG, val,
+		!(val & RTL8231_PIN_HI_CFG_SOFT_RESET), 50, 1000);
+	if (err)
+		return err;
+
+	regcache_mark_dirty(map);
+
+	/*
+	 * Chip reset results in a pin configuration that is a mix of LED and GPIO outputs.
+	 * Select GPI functionality for all pins before enabling pin outputs.
+	 */
+	regmap_write(map, RTL8231_REG_PIN_MODE0, all_pins_mask);
+	regmap_write(map, RTL8231_REG_GPIO_DIR0, all_pins_mask);
+	regmap_write(map, RTL8231_REG_PIN_MODE1, all_pins_mask);
+	regmap_write(map, RTL8231_REG_GPIO_DIR1, all_pins_mask);
+	regmap_write(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_MODE_MASK | RTL8231_PIN_HI_CFG_DIR_MASK);
+
+	return 0;
+}
+
+static int rtl8231_init(struct device *dev, struct regmap *map)
+{
+	struct regmap_field *led_start;
+	unsigned int started;
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
+	led_start = dev_get_drvdata(dev);
+	err = regmap_field_read(led_start, &started);
+	if (err)
+		return err;
+
+	if (!started) {
+		err = rtl8231_soft_reset(map);
+		if (err)
+			return err;
+		/* LED_START enables power to output pins, and starts the LED engine */
+		err = regmap_field_force_write(led_start, 1);
+	}
+
+	return err;
+}
+
+static const struct regmap_config rtl8231_mdio_regmap_config = {
+	.val_bits = RTL8231_BITS_VAL,
+	.reg_bits = RTL8231_BITS_REG,
+	.volatile_reg = rtl8231_volatile_reg,
+	.max_register = RTL8231_REG_COUNT - 1,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	/* Cannot use REGCACHE_FLAT because it's not smart enough about cache invalidation  */
+	.cache_type = REGCACHE_MAPLE,
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
+	if (IS_ERR(mdiodev->reset_gpio))
+		return PTR_ERR(mdiodev->reset_gpio);
+
+	device_property_read_u32(dev, "reset-assert-delay", &mdiodev->reset_assert_delay);
+	device_property_read_u32(dev, "reset-deassert-delay", &mdiodev->reset_deassert_delay);
+
+	err = rtl8231_init(dev, map);
+	if (err)
+		return err;
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
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rtl8231.h b/include/linux/mfd/rtl8231.h
new file mode 100644
index 000000000000..003eda3797a3
--- /dev/null
+++ b/include/linux/mfd/rtl8231.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
+ * data can be read.
+ */
+#define RTL8231_REG_GPIO_DATA0		0x1c
+#define RTL8231_REG_GPIO_DATA1		0x1d
+#define RTL8231_REG_GPIO_DATA2		0x1e
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
2.51.0


