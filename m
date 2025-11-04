Return-Path: <linux-gpio+bounces-28013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4CEC30875
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878713BB060
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AAC2D6E57;
	Tue,  4 Nov 2025 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QX55q6g4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA2229B764;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252318; cv=none; b=jt1JwaNe3g9Oa+Tho2QSpgA4fkgCbPBMWCKp/Wzj8IuzKMwRlyJXkFJxgKB89nYDsh4GktYbFzQkNedL2Fv1H0vjqZGacqZfc48GlbGc8Z78rxIz/TCqQcg8I+ABK9TbHOFoDNVeq11gepAgEVZ2b65+ZSAy1R7rJ5R1C6/kNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252318; c=relaxed/simple;
	bh=/sgfffdSRRmcW5toVNMLUyf/7aYFE2dmpzfbz+UI0ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBe1MSbTymcCifqrOT6eNnC1OU2uJmuhGATKSA1YOyqrPY4nUHXwEim19jE9FeVU0WhrYDRQhdlPhq7i2n7XUP9iElW+44JlqVXP9ZxZDqm3JGa6jzXBHVvlxsAbJQSfqxBhzHXIhFmLejse+rYsXoDKdikr9V417VBDPR5CAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QX55q6g4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18353C19421;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252318;
	bh=/sgfffdSRRmcW5toVNMLUyf/7aYFE2dmpzfbz+UI0ms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QX55q6g4YEzgbsFs5ryXogQuECv2QLRFxn2377rcSCHi4lUJAAb1nxepbbNApB/iK
	 O4FDjhvNcA04Q/4hTVOpvN0cZWe/xSCF0c3/W4ivNRdWmKLxcd9uxUlB7wA8YhmRgu
	 cQTrbaLy1rQEzNa8K3pRdaXojiLlcMS1QQYWuL43tXVf6sO8IZNKNEXqn3wR/EqEQo
	 vBwsfG+LYquTkXBRYb4GaiAC+e64nX51ppaItrEq7FlhoY4k8+SFXy29nk9cTUfyNc
	 ANgMwVL8c4/K+RCbKgrhocuV168mZpbAtFLtvkQf5Kivc+F3OzozJ8Qx5xzXUloZFf
	 jsvC+eUVY4ubg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C89DCCFA04;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 04 Nov 2025 10:32:30 +0000
Subject: [PATCH v3 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
In-Reply-To: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762252353; l=8593;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=mbLCBTQfDPEA2unaLfoqPc6YrZTZIYDvsKRnPzay1N4=;
 b=0WnPB2F00Yr4o1olDM4+FjIWaXWkO1BVz5j6TnxiQOmer5cphh0Q0BYcpCNqmMZ+pncMvp1S/
 oRPY2gkBz1CDkf+m7t2M1rx6te4oo/vfVoGY/eH2tImpye90MRIAZTl
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
 MAINTAINERS                 |   2 +
 drivers/gpio/Kconfig        |  15 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-ltc4283.c | 217 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 235 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d02fdf0a0593..76a659408c8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14757,9 +14757,11 @@ F:	drivers/hwmon/ltc4282.c
 
 LTC4283 HARDWARE MONITOR AND GPIO DRIVER
 M:	Nuno Sá <nuno.sa@analog.com>
+L:	linux-gpio@vger.kernel.org
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
+F:	drivers/gpio/gpio-ltc4283.c
 F:	drivers/hwmon/ltc4283.c
 
 LTC4286 HARDWARE MONITOR DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05..58610f77a75e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1741,6 +1741,21 @@ config GPIO_WM8994
 
 endmenu
 
+menu "AUXBUS GPIO expanders"
+	depends on AUXILIARY_BUS
+
+config GPIO_LTC4283
+	tristate "Analog Devices LTC4283 GPIO support"
+	depends on SENSORS_LTC4283
+	help
+	  If you say yes here you want the GPIO function available in Analog
+	  Devices LTC4283 Negative Voltage Hot Swap Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called gpio-ltc4283.
+
+endmenu
+
 menu "PCI GPIO expanders"
 	depends on PCI
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ec296fa14bfd..b6550944ed78 100644
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
index 000000000000..885af67146a8
--- /dev/null
+++ b/drivers/gpio/gpio-ltc4283.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices LTC4283 GPIO driver
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+
+#define LTC4283_PINS_MAX			8
+#define LTC4283_PGIOX_START_NR			4
+#define LTC4283_INPUT_STATUS			0x02
+#define LTC4283_PGIO_CONFIG			0x10
+#define   LTC4283_PGIO_CFG_MASK(pin) \
+	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_PGIOX_START_NR) * 2))
+#define LTC4283_PGIO_CONFIG_2			0x11
+
+#define LTC42823_ADIO_CONFIG			0x12
+/* starts at bit 4 */
+#define   LTC4283_ADIOX_CONFIG_MASK(pin)	BIT((pin) + 4)
+#define LTC4283_PGIO_DIR_IN			3
+#define LTC4283_PGIO_DIR_OUT			2
+
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
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
+		unsigned int val = LTC4283_PGIO_DIR_OUT;
+
+		if (input)
+			val = LTC4283_PGIO_DIR_IN;
+
+		val = field_prep(LTC4283_PGIO_CFG_MASK(off), val);
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
+	unsigned long *mask = dev_get_platdata(gc->parent);
+
+	bitmap_copy(valid_mask, mask, ngpios);
+	return 0;
+}
+
+static int ltc4283_gpio_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct ltc4283_gpio *st;
+	struct gpio_chip *gc;
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
+	gc->ngpio = LTC4283_PINS_MAX;
+	gc->label = adev->name;
+	gc->owner = THIS_MODULE;
+
+	return devm_gpiochip_add_data(dev, &st->gpio_chip, st);
+}
+
+static const struct auxiliary_device_id ltc4283_aux_id_table[] = {
+	{ "ltc4283.gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ltc4283_aux_id_table);
+
+static struct auxiliary_driver ltc4283_gpio_driver = {
+	.probe = ltc4283_gpio_probe,
+	.id_table = ltc4283_aux_id_table,
+};
+module_auxiliary_driver(ltc4283_gpio_driver);
+
+MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("GPIO LTC4283 Driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0



