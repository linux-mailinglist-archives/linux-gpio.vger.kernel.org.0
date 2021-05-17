Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C699C383D5F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbhEQTaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhEQTaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:30:03 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4B5C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 12:28:46 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 48E401FFBFB;
        Mon, 17 May 2021 21:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cTllc3GYTrus8/+ZPMfh20BwLB5lkAdW8J1AqLjryaI=;
        b=CSaQKiUN5miQ4L8nskoKl+6JSMVeAUtxFrc5tRPF+thnt3mTPmyBDfPUVOwYjfg6jjDhYm
        Uen1oXSpvgKjhg8H+8lxFpSPFsCZMcPbByn7ly7ltJLplwhAfHiIgVMdu5BvJkbX/zKnEu
        T5klUV4xSxQxqRd02RAABdDeb4VUmqnEysHtzayTHJneaj4lSkvV2g4OTOjQ2mN0C6kyvm
        0t1wL/xTwcOEGBQMc1t8G6CtluCDjNK7o49IAJu+kswo6pvg+if6i1S5WHZcTFKRZUSJV+
        VXvqOtUtY4Qgu74hdwYQfxEF7ma8c4pGpHU4q+12ylX/3bTGi9WAN8xeyzMY4A==
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
        Sander Vanheule <sander@svanheule.net>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 5/7] mfd: Add RTL8231 core device
Date:   Mon, 17 May 2021 21:28:07 +0200
Message-Id: <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
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

[missing MDIO_BUS dependency, provided via REGMAP_MDIO]
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/mfd/Kconfig         |   9 +++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/rtl8231.c       | 153 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rtl8231.h |  57 ++++++++++++++
 4 files changed, 220 insertions(+)
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..bdeeaba88116 100644
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
+	  When built as a module, this module will be named rtl8231_expander.
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
index 000000000000..204d6c4f64b2
--- /dev/null
+++ b/drivers/mfd/rtl8231.c
@@ -0,0 +1,153 @@
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
+static const struct reg_field RTL8231_FIELD_LED_START = REG_FIELD(RTL8231_REG_FUNC0, 1, 1);
+
+static const struct mfd_cell rtl8231_cells[] = {
+	{
+		.name = "rtl8231-pinctrl",
+		.of_compatible = "realtek,rtl8231-pinctrl",
+	},
+	{
+		.name = "rtl8231-leds",
+		.of_compatible = "realtek,rtl8231-leds",
+	},
+};
+
+static int rtl8231_init(struct device *dev, struct regmap *map)
+{
+	unsigned int ready_code;
+	unsigned int v;
+	int err = 0;
+
+	err = regmap_read(map, RTL8231_REG_FUNC1, &v);
+	ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, v);
+
+	if (err) {
+		dev_err(dev, "failed to read READY_CODE\n");
+		return err;
+	} else if (ready_code != RTL8231_FUNC1_READY_CODE_VALUE) {
+		dev_err(dev, "RTL8231 not present or ready 0x%x != 0x%x\n",
+			ready_code, RTL8231_FUNC1_READY_CODE_VALUE);
+		return -ENODEV;
+	}
+
+	/* SOFT_RESET bit self-clears when done */
+	regmap_update_bits(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_SOFT_RESET, RTL8231_PIN_HI_CFG_SOFT_RESET);
+	usleep_range(1000, 10000);
+
+	/*
+	 * Chip reset results in a pin configuration that is a mix of LED and GPIO outputs.
+	 * Select GPI functionality for all pins before enabling pin outputs.
+	 */
+	regmap_write(map, RTL8231_REG_PIN_MODE0, 0xffff);
+	regmap_write(map, RTL8231_REG_GPIO_DIR0, 0xffff);
+	regmap_write(map, RTL8231_REG_PIN_MODE1, 0xffff);
+	regmap_write(map, RTL8231_REG_GPIO_DIR1, 0xffff);
+	regmap_write(map, RTL8231_REG_PIN_HI_CFG,
+		RTL8231_PIN_HI_CFG_MODE_MASK | RTL8231_PIN_HI_CFG_DIR_MASK);
+
+	return err;
+}
+
+static const struct regmap_config rtl8231_mdio_regmap_config = {
+	.val_bits = RTL8231_BITS_VAL,
+	.reg_bits = 5,
+	.max_register = RTL8231_REG_COUNT - 1,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
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
+
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
+	mdiodev->reset_gpio = gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	device_property_read_u32(dev, "reset-assert-delay", &mdiodev->reset_assert_delay);
+	device_property_read_u32(dev, "reset-deassert-delay", &mdiodev->reset_deassert_delay);
+
+	err = rtl8231_init(dev, map);
+	if (err)
+		return err;
+
+	/* LED_START enables power to output pins, and starts the LED engine */
+	regmap_field_write(led_start, 1);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
+		ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
+}
+
+#ifdef CONFIG_PM
+static int rtl8231_suspend(struct device *dev)
+{
+	struct regmap_field *led_start = dev_get_drvdata(dev);
+
+	return regmap_field_write(led_start, 0);
+}
+
+static int rtl8231_resume(struct device *dev)
+{
+	struct regmap_field *led_start = dev_get_drvdata(dev);
+
+	return regmap_field_write(led_start, 1);
+}
+
+static const struct dev_pm_ops rtl8231_pm_ops = {
+	.suspend = rtl8231_suspend,
+	.resume = rtl8231_resume,
+};
+#define RTL8231_PM_OPS (&rtl8231_pm_ops)
+#else
+#define RTL8231_PM_OPS NULL
+#endif /* CONFIG_PM */
+
+static const struct of_device_id rtl8231_of_match[] = {
+	{ .compatible = "realtek,rtl8231" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rtl8231_of_match);
+
+static struct mdio_driver rtl8231_mdio_driver = {
+	.mdiodrv.driver = {
+		.name = "rtl8231-expander",
+		.of_match_table	= rtl8231_of_match,
+		.pm = RTL8231_PM_OPS,
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
index 000000000000..7f1df92a9d36
--- /dev/null
+++ b/include/linux/mfd/rtl8231.h
@@ -0,0 +1,57 @@
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
+#define RTL8231_BITS_VAL		16
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
+/* GPIO data registers */
+#define RTL8231_REG_GPIO_DATA0		0x1c
+#define RTL8231_REG_GPIO_DATA1		0x1d
+#define RTL8231_REG_GPIO_DATA2		0x1e
+
+/* LED control base registers */
+#define RTL8231_REG_LED0_BASE		0x09
+#define RTL8231_REG_LED1_BASE		0x10
+#define RTL8231_REG_LED2_BASE		0x17
+
+#define RTL8231_REG_COUNT		0x1f
+
+#endif /* __LINUX_MFD_RTL8231_H */
-- 
2.31.1

