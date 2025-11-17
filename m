Return-Path: <linux-gpio+bounces-28614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46987C665C1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 22:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C62684EDCDF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 21:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1453B34D4E7;
	Mon, 17 Nov 2025 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="H8NOXvOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949EC313E30
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416320; cv=none; b=n21PXCGfWyUrc9yO/7teegtocoljn3lBc9tgwtlBefTuf2ExMcBmWLSVfjbix29Ey83demP+9lQKwoJJAluBJl+7HlxLEgQcb+mPSuVl8cX/j/a/Mzmq10cJmg/VV+/yRglutMZZtBU0amENpQCGqaA2YKY+eovjAlPxDHWDM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416320; c=relaxed/simple;
	bh=IxmwnFcIb5YYJKy3VZvyXh0YKNaCM3WPo4pxvRpyc0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e90/SC3EsxOodawIfxle6Sf0WPd0xr2LVms9AzFV5UySektLn+UxVS6Zo4LEahLgIQ27cUEbr+pYK/zZdMG9dqa99XzhcFEWfGEHGhwHg/k7AG+49DSf+MOh0ZLASNa5VD3msCDG23/Pqos9CWX1kT/RWwBBvgle7jwBWhnzQZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=H8NOXvOq; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 833CC6A0B60;
	Mon, 17 Nov 2025 22:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763416308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exqymdxjJ5FhF8jOfeTm35pWs+CO4VSFEXsm0Pbqp9g=;
	b=H8NOXvOqooFLr9+yibME4hnKrWQH5H6PbmUrd7bGJ7hCHjGxYtCQAt9PNGTf2nKcIKEFjH
	gr5E3hbA0DdKdmDw5mp+wx80woan4IbzBH7PnBrffR0vIsMjHfmNUkYq9vy3P5622Zwdo9
	u8VIzvoK9YoD+yV0EMzf+7hijM31oCWgIx6FQHrV2xuaXiegg7WKmgANgliZYQFOsE8glo
	hbyHVeuwDct+MoLBDxHyHEnpqVR11s+FbTHkRT7zQ+wTQFERihruAGebg9gY/p5emF5e1L
	7XaZklrWc3v7ETHXiIVD4KG2t0nAJB2f3tI7WpFCF7/p74MUb1RzsZC4vf0G8Q==
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
Subject: [PATCH v7 5/6] leds: Add support for RTL8231 LED scan matrix
Date: Mon, 17 Nov 2025 22:51:35 +0100
Message-ID: <20251117215138.4353-6-sander@svanheule.net>
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

Both single and bi-color scanning modes are supported. The driver will
verify that the addresses are valid for the current mode, before
registering the LEDs. LEDs can be turned on, off, or toggled at one of
six predefined rates from 40ms to 1280ms.

Implements a platform device for use as a child device with RTL8231 MFD,
and uses the parent regmap to access the required registers.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/leds/Kconfig        |  10 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-rtl8231.c | 285 ++++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 drivers/leds/leds-rtl8231.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 06e6291be11b..bb4429bcd7a2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -666,6 +666,16 @@ config LEDS_REGULATOR
 	help
 	  This option enables support for regulator driven LEDs.
 
+config LEDS_RTL8231
+	tristate "RTL8231 LED matrix support"
+	depends on LEDS_CLASS
+	depends on MFD_RTL8231
+	default MFD_RTL8231
+	help
+	  This option enables support for using the LED scanning matrix output
+	  of the RTL8231 GPIO and LED expander chip.
+	  When built as a module, this module will be named leds-rtl8231.
+
 config LEDS_BD2606MVV
 	tristate "LED driver for BD2606MVV"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 9a0333ec1a86..27c32204aebc 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_QNAP_MCU)		+= leds-qnap-mcu.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
+obj-$(CONFIG_LEDS_RTL8231)		+= leds-rtl8231.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_ST1202)		+= leds-st1202.o
 obj-$(CONFIG_LEDS_SUN50I_A100)		+= leds-sun50i-a100.o
diff --git a/drivers/leds/leds-rtl8231.c b/drivers/leds/leds-rtl8231.c
new file mode 100644
index 000000000000..8ff20cc7ea98
--- /dev/null
+++ b/drivers/leds/leds-rtl8231.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/rtl8231.h>
+
+/**
+ * struct led_toggle_rate - description of an LED blinking mode
+ * @interval_ms:	LED toggle rate in milliseconds
+ * @mode:		Register field value used to activate this mode
+ *
+ * For LED hardware accelerated blinking, with equal on and off delay.
+ * Both delays are given by @interval, so the interval at which the LED blinks
+ * (i.e. turn on and off once) is double this value.
+ */
+struct led_toggle_rate {
+	u16 interval_ms;
+	u8 mode;
+};
+
+/**
+ * struct led_modes - description of all LED modes
+ * @toggle_rates:	Array of led_toggle_rate values, sorted by ascending interval
+ * @num_toggle_rates:	Number of elements in @led_toggle_rate
+ * @off:		Register field value to turn LED off
+ * @on:			Register field value to turn LED on
+ */
+struct led_modes {
+	const struct led_toggle_rate *toggle_rates;
+	unsigned int num_toggle_rates;
+	u8 off;
+	u8 on;
+};
+
+struct rtl8231_led {
+	struct led_classdev led;
+	const struct led_modes *modes;
+	struct regmap_field *reg_field;
+};
+#define to_rtl8231_led(_cdev) container_of(_cdev, struct rtl8231_led, led)
+
+#define RTL8231_NUM_LEDS	3
+#define RTL8231_LED_PER_REG	5
+#define RTL8231_BITS_PER_LED	3
+
+static const unsigned int rtl8231_led_port_counts_single[RTL8231_NUM_LEDS] = {32, 32, 24};
+static const unsigned int rtl8231_led_port_counts_bicolor[RTL8231_NUM_LEDS] = {24, 24, 24};
+
+static const unsigned int rtl8231_led_base[RTL8231_NUM_LEDS] = {
+	RTL8231_REG_LED0_BASE,
+	RTL8231_REG_LED1_BASE,
+	RTL8231_REG_LED2_BASE,
+};
+
+#define RTL8231_DEFAULT_TOGGLE_INTERVAL_MS	500
+
+static const struct led_toggle_rate rtl8231_toggle_rates[] = {
+	{  40, 1},
+	{  80, 2},
+	{ 160, 3},
+	{ 320, 4},
+	{ 640, 5},
+	{1280, 6},
+};
+
+static const struct led_modes rtl8231_led_modes = {
+	.off = 0,
+	.on = 7,
+	.num_toggle_rates = ARRAY_SIZE(rtl8231_toggle_rates),
+	.toggle_rates = rtl8231_toggle_rates,
+};
+
+static void rtl8231_led_brightness_set(struct led_classdev *led_cdev,
+	enum led_brightness brightness)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+
+	if (brightness)
+		regmap_field_write(pled->reg_field, pled->modes->on);
+	else
+		regmap_field_write(pled->reg_field, pled->modes->off);
+}
+
+static enum led_brightness rtl8231_led_brightness_get(struct led_classdev *led_cdev)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+	u32 current_mode = pled->modes->off;
+
+	regmap_field_read(pled->reg_field, &current_mode);
+
+	if (current_mode == pled->modes->off)
+		return LED_OFF;
+	else
+		return LED_ON;
+}
+
+static unsigned int rtl8231_led_current_interval(struct rtl8231_led *pled)
+{
+	unsigned int mode;
+	unsigned int i;
+
+	if (regmap_field_read(pled->reg_field, &mode))
+		return 0;
+
+	for (i = 0; i < pled->modes->num_toggle_rates; i++)
+		if (mode == pled->modes->toggle_rates[i].mode)
+			return pled->modes->toggle_rates[i].interval_ms;
+
+	return 0;
+}
+
+static int rtl8231_led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
+	unsigned long *delay_off)
+{
+	struct rtl8231_led *pled = to_rtl8231_led(led_cdev);
+	const struct led_toggle_rate *rates = pled->modes->toggle_rates;
+	unsigned int num_rates = pled->modes->num_toggle_rates;
+	unsigned int interval_ms;
+	unsigned int i;
+	int err;
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		interval_ms = RTL8231_DEFAULT_TOGGLE_INTERVAL_MS;
+	} else {
+		/*
+		 * If the current mode is blinking, choose the delay that (likely) changed.
+		 * Otherwise, choose the interval that would have the same total delay.
+		 */
+		interval_ms = rtl8231_led_current_interval(pled);
+		if (interval_ms > 0 && interval_ms == *delay_off)
+			interval_ms = *delay_on;
+		else if (interval_ms > 0 && interval_ms == *delay_on)
+			interval_ms = *delay_off;
+		else
+			interval_ms = (*delay_on + *delay_off) / 2;
+	}
+
+	/* Find clamped toggle interval */
+	for (i = 0; i < (num_rates - 1); i++)
+		if (interval_ms > rates[i].interval_ms)
+			break;
+
+	interval_ms = rates[i].interval_ms;
+
+	err = regmap_field_write(pled->reg_field, rates[i].mode);
+	if (err)
+		return err;
+
+	*delay_on = interval_ms;
+	*delay_off = interval_ms;
+
+	return 0;
+}
+
+static int rtl8231_led_read_address(struct fwnode_handle *fwnode, unsigned int *addr_port,
+	unsigned int *addr_led)
+{
+	u32 addr[2];
+	int err;
+
+	err = fwnode_property_count_u32(fwnode, "reg");
+	if (err < 0)
+		return err;
+	if (err != ARRAY_SIZE(addr))
+		return -EINVAL;
+
+	err = fwnode_property_read_u32_array(fwnode, "reg", addr, ARRAY_SIZE(addr));
+	if (err)
+		return err;
+
+	*addr_port = addr[0];
+	*addr_led = addr[1];
+
+	return 0;
+}
+
+static struct regmap_field *rtl8231_led_get_field(struct device *dev, struct regmap *map,
+		unsigned int port_index, unsigned int led_index)
+{
+	unsigned int offset = port_index / RTL8231_LED_PER_REG;
+	unsigned int shift = (port_index % RTL8231_LED_PER_REG) * RTL8231_BITS_PER_LED;
+	const struct reg_field field = REG_FIELD(rtl8231_led_base[led_index] + offset, shift,
+			shift + RTL8231_BITS_PER_LED - 1);
+
+	return devm_regmap_field_alloc(dev, map, field);
+}
+
+static int rtl8231_led_probe_single(struct device *dev, struct regmap *map,
+	const unsigned int *port_counts, struct fwnode_handle *fwnode)
+{
+	struct led_init_data init_data = {};
+	struct rtl8231_led *pled;
+	unsigned int port_index;
+	unsigned int led_index;
+	int err;
+
+	pled = devm_kzalloc(dev, sizeof(*pled), GFP_KERNEL);
+	if (!pled)
+		return -ENOMEM;
+
+	err = rtl8231_led_read_address(fwnode, &port_index, &led_index);
+	if (err) {
+		dev_err(dev, "LED address invalid");
+		return err;
+	}
+
+	if (led_index >= RTL8231_NUM_LEDS || port_index >= port_counts[led_index]) {
+		dev_err(dev, "LED address (%d.%d) invalid", port_index, led_index);
+		return -EINVAL;
+	}
+
+	pled->reg_field = rtl8231_led_get_field(dev, map, port_index, led_index);
+	if (IS_ERR(pled->reg_field))
+		return PTR_ERR(pled->reg_field);
+
+	pled->modes = &rtl8231_led_modes;
+
+	pled->led.max_brightness = 1;
+	pled->led.brightness_get = rtl8231_led_brightness_get;
+	pled->led.brightness_set = rtl8231_led_brightness_set;
+	pled->led.blink_set = rtl8231_led_blink_set;
+
+	init_data.fwnode = fwnode;
+
+	return devm_led_classdev_register_ext(dev, &pled->led, &init_data);
+}
+
+static int rtl8231_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const unsigned int *port_counts;
+	struct fwnode_handle *child;
+	struct regmap *map;
+	int err;
+
+	map = dev_get_regmap(dev->parent, NULL);
+	if (!map)
+		return -ENODEV;
+
+	if (device_property_match_string(dev, "realtek,led-scan-mode", "single-color") >= 0) {
+		port_counts = rtl8231_led_port_counts_single;
+		regmap_update_bits(map, RTL8231_REG_FUNC0,
+			RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_SINGLE);
+	} else if (device_property_match_string(dev, "realtek,led-scan-mode", "bi-color") >= 0) {
+		port_counts = rtl8231_led_port_counts_bicolor;
+		regmap_update_bits(map, RTL8231_REG_FUNC0,
+			RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_BICOLOR);
+	} else {
+		dev_err(dev, "scan mode missing or invalid");
+		return -EINVAL;
+	}
+
+	fwnode_for_each_available_child_node(dev->fwnode, child) {
+		err = rtl8231_led_probe_single(dev, map, port_counts, child);
+		if (err)
+			dev_warn(dev, "failed to register LED %pfwP", child);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_rtl8231_led_match[] = {
+	{ .compatible = "realtek,rtl8231-leds" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_rtl8231_led_match);
+
+static struct platform_driver rtl8231_led_driver = {
+	.driver = {
+		.name = "rtl8231-leds",
+		.of_match_table = of_rtl8231_led_match,
+	},
+	.probe = rtl8231_led_probe,
+};
+module_platform_driver(rtl8231_led_driver);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Realtek RTL8231 LED support");
+MODULE_LICENSE("GPL");
-- 
2.51.1


