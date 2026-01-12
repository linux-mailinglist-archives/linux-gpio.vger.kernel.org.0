Return-Path: <linux-gpio+bounces-30425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C0D10C09
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 07:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 943A13026C02
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 06:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E065931A7F6;
	Mon, 12 Jan 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nVJ6a/Ji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830C3128BD;
	Mon, 12 Jan 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768200602; cv=none; b=cpZUP3j/QQYwgD4pSu5tu9yBWLf1DzXsRLGyEZu3HwJNZjHugTFTuq6Vw/90R1txHfzUcHYh8gp5lO2HAcExI1SPFfTzFiZGIPmy0DdKeVk7w9F8CUH+tabH1jpGHhIusVRtkluKtAuPBAc+AM5ys5j9/hNeXsVMqrCW+FPweJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768200602; c=relaxed/simple;
	bh=LoiaYZy2WSc50D4dW5Sqre/VeB7KE/k0vjBXzXIqmwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgH9dOh+onxzsTqLzPrDs5wQLbNVT7ZTkpySlENRA3lqmksbtEpXvNKKNXcEZLDn1HJB+0OMGUbGHYOkLtYDsuq97QCAkVvpllCHNp32JZ58BmFDnfouD8KFAivFbXCQEh7SLAVZehTmGq9OpmcBTAQ9nSzLs2T5eEC7SplnsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nVJ6a/Ji; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vW8AxNR6zxeHimRqVJ6SOPdsMiOPq94LUTRJ9LMhnWk=; b=nVJ6a/JiJZY+1nkH1Nv6QgjWOT
	8boJ98vkFOa8tLT+P8pBNC4sInSeudX1On6Y8DHYJtiiqLEr2CaIDkdhKg4wjsgmVIzVZIlY9PQbT
	6UZVKsRAewNqcNRxGx1cISwll/AiVeZCL2twAgZKQn+QqtMOzv/MvbsLG8KsFJNfe6wRg4U24YYPt
	qXk/O5bwo9y/uA8TBFXJqVJNRzyH/RHit7CMCLZu1LVv6gkD1WcQi4AZN8BOodnIOklSgUyXHQB3c
	etgdo85vK338z8G9p/Ut85im8aLn44FjgCdiiw5gtNY5MyeNyh9+xoHyILnMYjsUWOJcjlvCVRHTu
	+BVndfcg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBkN-00000004pyD-1eXq;
	Mon, 12 Jan 2026 06:49:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] gpio: remove the gpio-tn48m driver
Date: Sun, 11 Jan 2026 22:49:50 -0800
Message-ID: <20260112064950.3837737-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio-tn48m driver is useless without the simple-mfd parent, which is
not present in the kernel tree, so delete it and all references to it.
Also delete references to the (missing) mfd driver.

Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Based on v6.19-rc4.

Cc: Robert Marko <robert.marko@sartura.hr>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org

 .../devicetree/bindings/gpio/delta,tn48m-gpio.yaml |  39 --------
 .../devicetree/bindings/mfd/delta,tn48m-cpld.yaml  |  90 -------------------
 MAINTAINERS                                        |   9 --
 drivers/gpio/Kconfig                               |  12 ---
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/gpio-tn48m.c                          | 100 ---------------------
 6 files changed, 251 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
deleted file mode 100644
index e3e668a12091..000000000000
--- a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+++ /dev/null
@@ -1,39 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Delta Networks TN48M CPLD GPIO controller
-
-maintainers:
-  - Robert Marko <robert.marko@sartura.hr>
-
-description: |
-  This module is part of the Delta TN48M multi-function device. For more
-  details see ../mfd/delta,tn48m-cpld.yaml.
-
-  Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
-  It provides 12 pins in total, they are input-only or ouput-only type.
-
-properties:
-  compatible:
-    enum:
-      - delta,tn48m-gpo
-      - delta,tn48m-gpi
-
-  reg:
-    maxItems: 1
-
-  "#gpio-cells":
-    const: 2
-
-  gpio-controller: true
-
-required:
-  - compatible
-  - reg
-  - "#gpio-cells"
-  - gpio-controller
-
-additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
deleted file mode 100644
index d3b79140cce2..000000000000
--- a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
+++ /dev/null
@@ -1,90 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Delta Networks TN48M CPLD controller
-
-maintainers:
-  - Robert Marko <robert.marko@sartura.hr>
-
-description: |
-  Lattice CPLD onboard the TN48M switches is used for system
-  management.
-
-  It provides information about the hardware model, revision,
-  PSU status etc.
-
-  It is also being used as a GPIO expander and reset controller
-  for the switch MAC-s and other peripherals.
-
-properties:
-  compatible:
-    const: delta,tn48m-cpld
-
-  reg:
-    description:
-      I2C device address.
-    maxItems: 1
-
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
-required:
-  - compatible
-  - reg
-  - "#address-cells"
-  - "#size-cells"
-
-patternProperties:
-  "^gpio(@[0-9a-f]+)?$":
-    $ref: /schemas/gpio/delta,tn48m-gpio.yaml
-
-  "^reset-controller?$":
-    $ref: /schemas/reset/delta,tn48m-reset.yaml
-
-additionalProperties: false
-
-examples:
-  - |
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        cpld@41 {
-            compatible = "delta,tn48m-cpld";
-            reg = <0x41>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            gpio@31 {
-                compatible = "delta,tn48m-gpo";
-                reg = <0x31>;
-                gpio-controller;
-                #gpio-cells = <2>;
-            };
-
-            gpio@3a {
-                compatible = "delta,tn48m-gpi";
-                reg = <0x3a>;
-                gpio-controller;
-                #gpio-cells = <2>;
-            };
-
-            gpio@40 {
-                compatible = "delta,tn48m-gpi";
-                reg = <0x40>;
-                gpio-controller;
-                #gpio-cells = <2>;
-            };
-
-            reset-controller {
-              compatible = "delta,tn48m-reset";
-              #reset-cells = <1>;
-            };
-        };
-    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..7d3c0d2375c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7107,15 +7107,6 @@ S:	Maintained
 F:	Documentation/hwmon/dps920ab.rst
 F:	drivers/hwmon/pmbus/dps920ab.c
 
-DELTA NETWORKS TN48M CPLD DRIVERS
-M:	Robert Marko <robert.marko@sartura.hr>
-S:	Maintained
-F:	Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
-F:	Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
-F:	Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
-F:	drivers/gpio/gpio-tn48m.c
-F:	include/dt-bindings/reset/delta,tn48m-reset.h
-
 DELTA ST MEDIA DRIVER
 M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..d1d3f98b87f6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1619,18 +1619,6 @@ config GPIO_TIMBERDALE
 	help
 	Add support for the GPIO IP in the timberdale FPGA.
 
-config GPIO_TN48M_CPLD
-	tristate "Delta Networks TN48M switch CPLD GPIO driver"
-	depends on MFD_TN48M_CPLD || COMPILE_TEST
-	select GPIO_REGMAP
-	help
-	  This enables support for the GPIOs found on the Delta
-	  Networks TN48M switch Lattice CPLD. It provides 12 pins in total,
-	  they are input-only or output-only type.
-
-	  This driver can also be built as a module. If so, the
-	  module will be called gpio-tn48m.
-
 config GPIO_TPS65086
 	tristate "TI TPS65086 GPO"
 	depends on MFD_TPS65086
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733..c3ee30133c24 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -181,7 +181,6 @@ obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
 obj-$(CONFIG_GPIO_TIMBERDALE)		+= gpio-timberdale.o
-obj-$(CONFIG_GPIO_TN48M_CPLD)		+= gpio-tn48m.o
 obj-$(CONFIG_GPIO_TPIC2810)		+= gpio-tpic2810.o
 obj-$(CONFIG_GPIO_TPS65086)		+= gpio-tps65086.o
 obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
deleted file mode 100644
index cd4a80b22794..000000000000
--- a/drivers/gpio/gpio-tn48m.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Delta TN48M CPLD GPIO driver
- *
- * Copyright (C) 2021 Sartura Ltd.
- *
- * Author: Robert Marko <robert.marko@sartura.hr>
- */
-
-#include <linux/device.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/regmap.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-enum tn48m_gpio_type {
-	TN48M_GP0 = 1,
-	TN48M_GPI,
-};
-
-struct tn48m_gpio_config {
-	int ngpio;
-	int ngpio_per_reg;
-	enum tn48m_gpio_type type;
-};
-
-static const struct tn48m_gpio_config tn48m_gpo_config = {
-	.ngpio = 4,
-	.ngpio_per_reg = 4,
-	.type = TN48M_GP0,
-};
-
-static const struct tn48m_gpio_config tn48m_gpi_config = {
-	.ngpio = 4,
-	.ngpio_per_reg = 4,
-	.type = TN48M_GPI,
-};
-
-static int tn48m_gpio_probe(struct platform_device *pdev)
-{
-	const struct tn48m_gpio_config *gpio_config;
-	struct gpio_regmap_config config = {};
-	struct regmap *regmap;
-	u32 base;
-	int ret;
-
-	if (!pdev->dev.parent)
-		return -ENODEV;
-
-	gpio_config = device_get_match_data(&pdev->dev);
-	if (!gpio_config)
-		return -ENODEV;
-
-	ret = device_property_read_u32(&pdev->dev, "reg", &base);
-	if (ret)
-		return ret;
-
-	regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!regmap)
-		return -ENODEV;
-
-	config.regmap = regmap;
-	config.parent = &pdev->dev;
-	config.ngpio = gpio_config->ngpio;
-	config.ngpio_per_reg = gpio_config->ngpio_per_reg;
-	switch (gpio_config->type) {
-	case TN48M_GP0:
-		config.reg_set_base = base;
-		break;
-	case TN48M_GPI:
-		config.reg_dat_base = base;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
-}
-
-static const struct of_device_id tn48m_gpio_of_match[] = {
-	{ .compatible = "delta,tn48m-gpo", .data = &tn48m_gpo_config },
-	{ .compatible = "delta,tn48m-gpi", .data = &tn48m_gpi_config },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
-
-static struct platform_driver tn48m_gpio_driver = {
-	.driver = {
-		.name = "delta-tn48m-gpio",
-		.of_match_table = tn48m_gpio_of_match,
-	},
-	.probe = tn48m_gpio_probe,
-};
-module_platform_driver(tn48m_gpio_driver);
-
-MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
-MODULE_DESCRIPTION("Delta TN48M CPLD GPIO driver");
-MODULE_LICENSE("GPL");

