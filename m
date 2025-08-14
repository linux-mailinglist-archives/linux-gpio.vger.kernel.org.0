Return-Path: <linux-gpio+bounces-24389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0CAB26386
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3BF166275
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEF6302760;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNC14W8A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4282FD7CE;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168734; cv=none; b=Ogg5BZvdVxilQ3whOtcuCTbZPjX6MmmNJF4Ln/qI4ZOYWBRXAyKjHsJaciMGq/qVLgHKFeQdt/5NpHMciJYNE0T14RYqe0VF/2PV8TUir84MnJh5mGZtbm53kVluZzfy9bxtAMkH6wYNk4XWfzFbaA64sXWWPt+ckkUuwPS5ZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168734; c=relaxed/simple;
	bh=VjTUeKO5DzaMDYjeEYA5iF9+wACGlLhG3F60oh75hSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYUe2u+/WaFi7Z75pRLkoLNYWloswjojJahCtvy42IaKwHn75ltFKyw89ZHjcyrYTxUioC8tzZYWsoR5fO+n3EP704xnhklKdggFlyoCmJQ1bqWWJQz13izrxTH6BZvB9SfQhoYnVKmEIe6JgmqhgsyKxPFL7ARFkZ2Su9lBZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNC14W8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7AFEC116C6;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755168734;
	bh=VjTUeKO5DzaMDYjeEYA5iF9+wACGlLhG3F60oh75hSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KNC14W8A5+6rwWWaCK9IhSljuFwveZUwinNedHP00BVcepgDPA4wXkp25ondA5jva
	 SV53cOvY+B/7vguHcR2O8c7Jau9CvTUI/zp0avRrZVZYT2e5S8KMzdKHYZA/zaSFoA
	 v1RRNaOLF3yn5TZIERTNURzaM8iEGzleR46TF9iq6Lmr/yC82vXMIs5gcOgqrwyCdz
	 lHweWuY+FXUr3sTdHefKaWbq11ynPfpWPm2hjIQDHhoI23xVLLGLTrqdPHulo6Br47
	 WYDj6w8UAY6cMk+APct9yHVJr+Hv/2zC5jhzpwh+2xWgMhLsrBoJcBhBHZOzyYMHMl
	 vnGZZ/bgbk6xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBCECA0EDC;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 14 Aug 2025 11:52:28 +0100
Subject: [PATCH 6/6] gpio: gpio-ltc4283: Add support for the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755168753; l=9063;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=086cCq1l2Tj2mWktUEYQQ1Yx2N11Tx954i757Fp6GS8=;
 b=Df5+LPzwO2GllKw5IVHwHmIpshDRP7srrKtkaqLHYV1ft7YNDZPrlSvKEbke84e1zjoZSC5b0
 6t0oRmMZgtUCrFQnOxeoKq6LZdpMz+gqwyUXt0HM1dMTCJAI/vWAGZa
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The LTC4283 device has up to 8 pins that can be configured as GPIOs.

Note that PGIO pins are not set as GPIOs by default so if they are
configured to be used as GPIOs we need to make sure to initialize them
to a sane default. They are set as inputs by default.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  10 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-ltc4283.c | 233 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e492e75833564bd9065fe2422e86479553ea59dd..ae45c190920930ebe8890610bd7f92bd628ad025 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14508,6 +14508,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml
 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
 F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
+F:	drivers/gpio/gpio-ltc4283.c
 F:	drivers/hwmon/ltc4283-hwmon.c
 F:	drivers/mfd/ltc4283.c
 F:	include/linux/mfd/ltc4283.h
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6e15f19f2f498aa5adea03e6cd3bf..fe1cd8c1a2f7f012ece0f207552fd1f15df26b1d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -461,6 +461,16 @@ config GPIO_LPC32XX
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
 
+config GPIO_LTC4283
+	tristate "Analog Devices LTC4283 GPIO support"
+	depends on MFD_LTC4283
+	help
+	  If you say yes here you want the GPIO function available in Analog
+	  Devices LTC4283 Negative Voltage Hot Swap Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called gpio-ltc4283.
+
 config GPIO_MB86S7X
 	tristate "GPIO support for Fujitsu MB86S7x Platforms"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e69cd9c5745f8643541b85953db1c..513f2b5c82ccff3a1da855d45abb5ad6abf5a14e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
 obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
+obj-$(CONFIG_GPIO_LTC4283)		+= gpio-ltc4283.o
 obj-$(CONFIG_GPIO_MACSMC)		+= gpio-macsmc.o
 obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
 obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
new file mode 100644
index 0000000000000000000000000000000000000000..c2c454c3b6e4ab0fe315dafc7eb66c45c3ceae67
--- /dev/null
+++ b/drivers/gpio/gpio-ltc4283.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices LTC4283 GPIO driver
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+#include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/ltc4283.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define LTC4283_INPUT_STATUS			0x02
+#define LTC4283_PGIO_CONFIG_2			0x11
+
+#define LTC42823_ADIO_CONFIG			0x12
+/* starts at bit 4 */
+#define   LTC4283_ADIOX_CONFIG_MASK(pin)	BIT((pin) + 4)
+#define LTC4283_PGIO_DIR_IN			3
+
+struct ltc4283_gpio {
+	struct gpio_chip gpio_chip;
+	struct regmap *regmap;
+};
+
+static int ltc4283_pgio_get_direction(const struct ltc4283_gpio *st, unsigned int off)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, LTC4283_PGIO_CONFIG, &val);
+	if (ret)
+		return ret;
+
+	val = field_get(LTC4283_PGIO_CFG_MASK(off), val);
+	if (val == LTC4283_PGIO_DIR_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int ltc4283_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
+{
+	struct ltc4283_gpio *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	if (off >= LTC4283_PGIOX_START_NR)
+		return ltc4283_pgio_get_direction(st, off);
+
+	ret = regmap_read(st->regmap, LTC42823_ADIO_CONFIG, &val);
+	if (ret)
+		return ret;
+
+	if (val & LTC4283_ADIOX_CONFIG_MASK(off))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int ltc4283_gpio_direction_set(const struct ltc4283_gpio *st,
+				      unsigned int off, bool input)
+{
+	if (off >= LTC4283_PGIOX_START_NR) {
+		unsigned int val;
+
+		val = field_prep(LTC4283_PGIO_CFG_MASK(off), input ? 3 : 2);
+		return regmap_update_bits(st->regmap, LTC4283_PGIO_CONFIG,
+					  LTC4283_PGIO_CFG_MASK(off), val);
+	}
+
+	return regmap_update_bits(st->regmap, LTC42823_ADIO_CONFIG,
+				  LTC4283_ADIOX_CONFIG_MASK(off),
+				  field_prep(LTC4283_ADIOX_CONFIG_MASK(off), input));
+}
+
+static int __ltc4283_gpio_set_value(const struct ltc4283_gpio *st,
+				    unsigned int off, int val)
+{
+	u32 reg = off < LTC4283_PGIOX_START_NR ? LTC42823_ADIO_CONFIG : LTC4283_PGIO_CONFIG_2;
+
+	return regmap_update_bits(st->regmap, reg, BIT(off),
+				  field_prep(BIT(off), !!val));
+}
+
+static int ltc4283_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
+{
+	struct ltc4283_gpio *st = gpiochip_get_data(gc);
+
+	return ltc4283_gpio_direction_set(st, off, true);
+}
+
+static int ltc4283_gpio_direction_output(struct gpio_chip *gc, unsigned int off, int val)
+{
+	struct ltc4283_gpio *st = gpiochip_get_data(gc);
+	int ret;
+
+	ret = ltc4283_gpio_direction_set(st, off, false);
+	if (ret)
+		return ret;
+
+	return __ltc4283_gpio_set_value(st, off, val);
+}
+
+static int ltc4283_gpio_get_value(struct gpio_chip *gc, unsigned int off)
+{
+	struct ltc4283_gpio *st = gpiochip_get_data(gc);
+	unsigned int val, reg;
+	int ret, dir;
+
+	dir = ltc4283_gpio_get_direction(gc, off);
+	if (dir < 0)
+		return dir;
+
+	if (dir == GPIO_LINE_DIRECTION_IN) {
+		ret = regmap_read(st->regmap, LTC4283_INPUT_STATUS, &val);
+		if (ret)
+			return ret;
+
+		/* ADIO1 is at bit 3. */
+		if (off < LTC4283_PGIOX_START_NR)
+			return !!(val & BIT(3 - off));
+
+		/* PGIO1 is at bit 7. */
+		return !!(val & BIT(7 - (off - LTC4283_PGIOX_START_NR)));
+	}
+
+	if (off < LTC4283_PGIOX_START_NR)
+		reg = LTC42823_ADIO_CONFIG;
+	else
+		reg = LTC4283_PGIO_CONFIG_2;
+
+	ret = regmap_read(st->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(off));
+}
+
+static int ltc4283_gpio_set_value(struct gpio_chip *gc, unsigned int off, int val)
+{
+	struct ltc4283_gpio *st = gpiochip_get_data(gc);
+
+	return __ltc4283_gpio_set_value(st, off, val);
+}
+
+static int ltc4283_init_valid_mask(struct gpio_chip *gc, unsigned long *valid_mask,
+				   unsigned int ngpios)
+{
+	unsigned long *mask = dev_get_drvdata(gc->parent->parent);
+
+	bitmap_copy(valid_mask, mask, ngpios);
+	return 0;
+}
+
+static int ltc4283_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	/* Get mask from top level device. */
+	unsigned long *mask = dev_get_drvdata(dev->parent);
+	struct ltc4283_gpio *st;
+	struct gpio_chip *gc;
+	unsigned int gpio;
+	int ret;
+
+	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	st->regmap = dev_get_regmap(dev->parent, NULL);
+
+	gc = &st->gpio_chip;
+	gc->parent = dev;
+	gc->get_direction = ltc4283_gpio_get_direction;
+	gc->direction_input = ltc4283_gpio_direction_input;
+	gc->direction_output = ltc4283_gpio_direction_output;
+	gc->get = ltc4283_gpio_get_value;
+	gc->set = ltc4283_gpio_set_value;
+	gc->init_valid_mask = ltc4283_init_valid_mask;
+	gc->can_sleep = true;
+
+	gc->base = -1;
+	gc->ngpio = LTC4283_GPIO_MAX;
+	gc->label = pdev->name;
+	gc->owner = THIS_MODULE;
+
+	for_each_set_bit(gpio, mask, LTC4283_GPIO_MAX) {
+		if (gpio < LTC4283_PGIOX_START_NR)
+			continue;
+
+		/*
+		 * PGIO pins can have some other state other than input
+		 * or output, so we need to make sure to set one of those.
+		 * Default to input.
+		 */
+		ret = ltc4283_gpio_direction_set(st, gpio, true);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to set direction for PGIO %u\n", gpio);
+	}
+
+	return devm_gpiochip_add_data(dev, &st->gpio_chip, st);
+}
+
+static const struct platform_device_id ltc4283_gpio_id_table[] = {
+	{ "ltc4283-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, ltc4283_gpio_id_table);
+
+static const struct of_device_id ltc4283_of_id_table[] = {
+	{ "adi,ltc4283-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc4283_of_id_table);
+
+static struct platform_driver ltc4283_gpio_driver = {
+	.driver	= {
+		.name = "ltc4283-gpio",
+		.of_match_table = ltc4283_of_id_table,
+	},
+	.probe = ltc4283_gpio_probe,
+	.id_table = ltc4283_gpio_id_table,
+};
+module_platform_driver(ltc4283_gpio_driver);
+
+MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("GPIO LTC4283 Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.1



