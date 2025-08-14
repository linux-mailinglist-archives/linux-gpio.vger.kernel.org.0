Return-Path: <linux-gpio+bounces-24386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70210B2636E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879EC1CC5255
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C423019D5;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTuyRrM2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A52FD1A9;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168734; cv=none; b=EJo4SxHuRBUl+/I3tGKeaLUX966x2EnRfK3uYE83VTrwBOP2dOEgzgo+q7FAtjQLaitLM5/PglLqWBVtHuvOA7xq7RYYyoQLMn/QjD9ZbqToOpTckAoC8Jnah1JlSufK747djSAZv5bbrof+FkUofEm5AwUTNyphMOzE2HE92/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168734; c=relaxed/simple;
	bh=cCEgYLnJf+5grhqhoUEvF8DCQ1F3ij1AI1rFPHd0Smw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJZ/Msndjjga2YfGq6A2w6oEaC/Qjl0ZCFmTe7HEQVkPi7Fh0IHY8g20K3W8M/3N+5i+SZGmN4MLYHCynjxxmjUz2Fnjji9LTz5H1oSfpsgDyntT3/QpTDZ4rDNS5bpuMUjhb5j5uPjUyaki3w3mxmvnbco/U0hJwghpkoqs6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTuyRrM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1723C4CEEF;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755168733;
	bh=cCEgYLnJf+5grhqhoUEvF8DCQ1F3ij1AI1rFPHd0Smw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YTuyRrM2AJbmp+987JBvu/I4lRFyBopz/rHTXPOcqz+j/02nE2Y4XGH/VKick5eV1
	 tyylKzd36Deg0waMzw5JbF2DgG+zTjtuwFclZDC/5ckAcUOjnkpZwsOrOv4QlCIr/U
	 WWXTt6xj/Wy+ldcve3b/CxwKFyMuAtOY1ARq5ImPpDnPSMIOaDD5GpEwEyoLg56TqG
	 Jia9ARGGM9RgzkWwigT7CSy0du2SRyzURsfqk/gXJYh4ODiP5kaEBTVK35ugLwyq6N
	 1/wC8PahfGLWuw3irOMKUqopE4RpL3Bw6X9K32xYICDF4glNIE1Ww3NOufB54g64mz
	 Nw+H2UWRuwzMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AC8CA0EE6;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 14 Aug 2025 11:52:24 +0100
Subject: [PATCH 2/6] mfd: ltc4283: Add support for the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-ltc4283-support-v1-2-88b2cef773f2@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755168752; l=7869;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=YJEiTHe9kb+DC8FT96u8vbrt9euhbvLgsuaavOLJvd0=;
 b=tNjM9wTGeiBzHFn7funqVFxJYEEVNZPoI1tUkvZkprAg+plh0sz0LBZQlK5MJ7vjcFs3+I0VC
 6AbVLXGzHEbCL4PQXQ2qz3GfaV3ev+GdoXiqRvVB3MhlrL17E4cglFh
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The LTC4283 is a negative voltage hot swap controller that drives an
external N-channel MOSFET to allow a board to be safely inserted and
removed from a live backplane.

Main usage is as an Hardware Monitoring device. However, it has up to 8
pins that can be configured and used as GPIOs and hence, the device can
also be a GPIO controller (and so being added as MFD device).

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  11 ++++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/ltc4283.c       | 140 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/ltc4283.h |  33 +++++++++++
 5 files changed, 187 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 413bb77d5eebe2b51aa9c3af86e7cfd5ab142044..b5f4f1c41c64b738d57c1fb5552a60b4c6b9985c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14506,6 +14506,8 @@ L:	linux-hwmon@vger.kernel.org
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
+F:	drivers/mfd/ltc4283.c
+F:	include/linux/mfd/ltc4283.h
 
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1e7848dcea05bd77c729a71d48e2c..ec3e02d40fd17a0bba29e3157723055feedebd11 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -900,6 +900,17 @@ config MFD_MAX14577
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_LTC4283
+	tristate "LTC4283 Hot Swap Controller"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  This enables support for the LTC4283 Negative Voltage Hot Swap
+	  Controller. This driver provides common support for accessing the
+	  device; additional drivers must be enabled in order to use the
+	  functionality of the device.
+
 config MFD_MAX77541
 	tristate "Analog Devices MAX77541/77540 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f7bdedd5a66d16bf8ccee0da1236a441e6f085b0..4a3bcd30ab7e12aed4bc5e48294500c77cb61aa7 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
+obj-$(CONFIG_MFD_LTC4283)	+= ltc4283.o
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
diff --git a/drivers/mfd/ltc4283.c b/drivers/mfd/ltc4283.c
new file mode 100644
index 0000000000000000000000000000000000000000..a45c01278f884630984790c922c057c4f2db9c82
--- /dev/null
+++ b/drivers/mfd/ltc4283.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+#include <linux/property.h>
+
+#include <linux/mfd/ltc4283.h>
+
+static const struct mfd_cell ltc4283_cells[] = {
+	MFD_CELL_OF("ltc4283-hwmon", NULL, NULL, 0, 0, "adi,ltc4283-hwmon"),
+	MFD_CELL_OF("ltc4283-gpio", NULL, NULL, 0, 0, "adi,ltc4283-gpio"),
+};
+
+static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00 ... 0x03:
+		return false;
+	case 0x3c:
+		return false;
+	case 0x86 ... 0x8f:
+		return false;
+	case 0x91 ... 0xa1:
+		return false;
+	case 0xa3:
+		return false;
+	case 0xac:
+		return false;
+	case 0xf1 ... 0xff:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config ltc4283_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+	.writeable_reg = ltc4283_writable_reg,
+};
+
+static int ltc4283_get_gpio_pins(struct i2c_client *client, u32 *n_cells)
+{
+	struct device *dev = &client->dev;
+	u32 pins[LTC4283_GPIO_MAX], pin;
+	unsigned long *gpio_mask;
+	int n_pins, ret;
+
+	/*
+	 * The device has up to 8 pins that can be configured either as GPIOS or
+	 * for monitoring purposes. Both gpio and hwmon devices need to have
+	 * this information in order to do proper validations and
+	 * configurations. Hence, this property needs to be in the top level
+	 * device.
+	 */
+	n_pins = device_property_count_u32(dev, "adi,gpio-pins");
+	if (n_pins < 0)
+		return 0;
+	if (n_pins >= LTC4283_GPIO_MAX)
+		return dev_err_probe(dev, -EINVAL, "Too many GPIO pins specified (%d), max is %d\n",
+				     n_pins, LTC4283_GPIO_MAX);
+
+	ret = device_property_read_u32_array(dev, "adi,gpio-pins", pins, n_pins);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read GPIO pins\n");
+
+	gpio_mask = devm_bitmap_zalloc(dev, LTC4283_GPIO_MAX, GFP_KERNEL);
+	if (!gpio_mask)
+		return -ENOMEM;
+
+	for (pin = 0; pin < n_pins; pin++) {
+		if (pins[pin] >= LTC4283_GPIO_MAX)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid GPIO pin specified (%u), max is %d\n",
+					     pins[pin], LTC4283_GPIO_MAX);
+
+		__set_bit(pins[pin], gpio_mask);
+	}
+
+	/* Add the GPIO cell */
+	*n_cells += 1;
+	i2c_set_clientdata(client, gpio_mask);
+
+	return 0;
+}
+
+static int ltc4283_probe(struct i2c_client *client)
+{
+	u32 n_cells = ARRAY_SIZE(ltc4283_cells) - 1;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = devm_regmap_init_i2c(client, &ltc4283_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = ltc4283_get_gpio_pins(client, &n_cells);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				    ltc4283_cells, n_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id ltc4283_of_match[] = {
+	{ .compatible = "adi,ltc4283" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc4283_of_match);
+
+static const struct i2c_device_id ltc4283_i2c_id[] = {
+	{ "ltc4283" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
+
+static struct i2c_driver ltc4283_driver = {
+	.driver = {
+		.name = "ltc4283",
+		.of_match_table = ltc4283_of_match,
+	},
+	.probe = ltc4283_probe,
+	.id_table = ltc4283_i2c_id,
+};
+module_i2c_driver(ltc4283_driver);
+
+MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("LTC4283 MFD I2C driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/ltc4283.h b/include/linux/mfd/ltc4283.h
new file mode 100644
index 0000000000000000000000000000000000000000..153594009c07b296ce5743e5e817e96464d81cb3
--- /dev/null
+++ b/include/linux/mfd/ltc4283.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+
+#ifndef __MFD_LTC4283_H_
+#define __MFD_LTC4283_H_
+
+#include <linux/bitops.h>
+#include <linux/bits.h>
+
+/*
+ * We can have up to 8 gpios. 4 PGIOs and 4 ADIOs. PGIOs start at index 4 in the
+ * gpios mask.
+ */
+#define LTC4283_PGIOX_START_NR	4
+
+#define LTC4283_PGIO_CONFIG		0x10
+#define   LTC4283_PGIO_CFG_MASK(pin) \
+	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_PGIOX_START_NR) * 2))
+#define LTC4283_PGIO_CONFIG_2		0x11
+#define   LTC4283_ADC_MASK		GENMASK(2, 0)
+#define   LTC4283_PGIO_OUT_MASK(pin)	BIT(4 + (pin))
+
+#define LTC4283_GPIO_MAX	8
+
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
+#endif

-- 
2.50.1



