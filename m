Return-Path: <linux-gpio+bounces-34898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N2xIjGP1mmEGQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:24:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E93BF754
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B74FE306D1FF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 17:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7634A3D88F6;
	Wed,  8 Apr 2026 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E66nM9my"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F73D88E1;
	Wed,  8 Apr 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668954; cv=none; b=Y3s7lqlbYYjr/gC1ob1+1u2/VJ4LsRedNOhmipRr3oqslMxkzSuPWMI88kijTQsMiGNrnG0dsU9X03sbQmTbhPpRTXX0RJh7NxcYxJOQddxK/OP+xqp4Rc+JLuxSaaqnyTFiqndvi+3aF7vb+WWObJ52vAktu9WIZUsNVhA9AMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668954; c=relaxed/simple;
	bh=v9xa34NsM/733dZZsF2EFxXDKrVTDCSNlIjmbFFkKS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pODMWUA53cBEeGAU068JjaDAt9aXhFuuT7WeqcBuasPo/e2BmY61uP2mj01Z8kv9PwkUS4iWyC9dcccRzEDl+ocF3kH+14SZheN0dsLmKn+ylP6/jzCXcxaVljNQUsAsFU8OqtEl8J1ZN7dmsjWYImERGcrxYRQo+DfTHW9+eLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E66nM9my; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 47E504E42971;
	Wed,  8 Apr 2026 17:22:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C8F2603CE;
	Wed,  8 Apr 2026 17:22:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48C9D1045017E;
	Wed,  8 Apr 2026 19:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uGaHyLmHBgoLoCNYKyPIGDrV5F1S4zCIqJmASlnBZ3A=;
	b=E66nM9myFRwMfkr0OM0M9oQJpaBhsTX5ozHVjqqf4ks+dpLVvMFwfXiublDGikuVlwG6uA
	VZUfqBR3wO+PV1Xkp1reGxr4H3qje8p7D2b/QhEu9VsbpR3L+QRUHnYI23YKuTZHB3spPQ
	L1C/0rDu0LuMqSPSNyyZVnxB946hsdMkra1KC0llYM5WUjaAGIam2mwSJomYWsAijnw0t9
	xZiqmLo6UdQ+V4cd0cfzsCAAh9/1Zsd0f/roAyBG6tKWTGQmG4tS2/kbmccWqJob9tuEx1
	nMjPuxr40nkhY9kmxIKcrLCjUi6pv7q8ryNs2dgrw+9ekipdna0KJ/ShsE1hgA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Wed, 08 Apr 2026 19:21:57 +0200
Subject: [PATCH v5 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-dev-b4-aaeon-mcu-driver-v5-4-ad98bd481668@bootlin.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
In-Reply-To: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9293;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=v9xa34NsM/733dZZsF2EFxXDKrVTDCSNlIjmbFFkKS4=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBp1o7DXswAZEWgkNODBVIH4qsAc1QkgxUO5Q5iN
 +k/7iWtP/OJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCadaOwwAKCRCfwAsFcf4K
 7WfmC/wKcHMFCKPQ5kL5r7vwM0pN9xQ3Fvuk5oY6CP2SJpPTh9F4YRC5lc/C31PT2zHtfIXHjFs
 efeHEsxOFDu5vKRo6RgE0TtdpBiNBsW1ODJ2wTipdM2kM5J/1yjmh0FzWkjPwXqqmMgoviCNceC
 C5VPvzzfNNsbv0bTyJf5cxe1a01kjeUtDSZqjVN+sF5yHLHPDDTW99tK5Z6b9YyHFA1Yoldvm2y
 +LEJa2beTrBJVbl1ci0QZcfQ7b/Q1pOVSxtgr8u7xBKLlxpiffTLFsEiXydXgQX7G5/QkxlFGdv
 XAmmPmks6d8U+7/hKLmCtHoQR7LtqoT26EpALsC/q2pPLabd3i5njh+Xvpp4odGuBZGd2g+g9cb
 184wNgOxKwkN7z7uU2FZ9pa6CjMMkPW4aPcZZoTRgpDwVl3WUyppqnVaNfI1iZ+SnMYStfo/gD/
 0YRI2eiMFtx3lTDrHf3i269NJHjfpIlhqSXmeCj63E0xcG3GrsPFcZhvGG20+bkC7dGzc=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34898-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 029E93BF754
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
that can be configured as inputs or outputs.

The driver implements proper state management for GPO pins (which are
output-only) and full direction control for GPIO pins. During probe,
all pins are reset to a known state (GPOs low, GPIOs as inputs) to
prevent undefined behavior across system reboots, as the MCU does not
reset GPIO states on soft reboot.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   1 +
 drivers/gpio/Kconfig          |   9 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aaeon-mcu.c | 229 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 240 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f91b6a1826d0..2538f8c4bc14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -191,6 +191,7 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+F:	drivers/gpio/gpio-aaeon-mcu.c
 F:	drivers/mfd/aaeon-mcu.c
 F:	include/linux/mfd/aaeon-mcu.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c74da29253e8..4b37b5a15958 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,15 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_AAEON_MCU
+	tristate "Aaeon MCU GPIO support"
+	depends on MFD_AAEON_MCU
+	help
+	  Select this option to enable GPIO support for the Aaeon SRG-IMX8P
+	  onboard MCU. This driver provides access to GPIO pins and GPO
+	  (General Purpose Output) pins controlled by the microcontroller.
+	  The driver handles both input and output configuration.
+
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733..1ba6318bc558 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AAEON_MCU)		+= gpio-aaeon-mcu.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-aaeon-mcu.c b/drivers/gpio/gpio-aaeon-mcu.c
new file mode 100644
index 000000000000..a37d3dc83795
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU GPIO driver
+ *
+ * Copyright (C) 2026 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define AAEON_MCU_CONFIG_GPIO_INPUT	0x69
+#define AAEON_MCU_CONFIG_GPIO_OUTPUT	0x6F
+#define AAEON_MCU_READ_GPIO		0x72
+#define AAEON_MCU_WRITE_GPIO		0x77
+
+#define AAEON_MCU_CONTROL_GPO		0x6C
+
+#define MAX_GPIOS	12
+#define MAX_GPOS	7
+
+struct aaeon_mcu_gpio {
+	struct gpio_chip gc;
+	struct regmap *regmap;
+	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
+	DECLARE_BITMAP(gpo_state, MAX_GPOS);
+};
+
+static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
+					   unsigned int offset)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_CONFIG_GPIO_INPUT, offset - 7),
+			    0);
+}
+
+static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_CONTROL_GPO, offset + 1),
+			    !!value);
+}
+
+static int aaeon_mcu_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS) {
+		dev_err(gc->parent,
+			"offset %d is a GPO (output-only) pin, cannot be configured as input\n",
+			offset);
+		return -EOPNOTSUPP;
+	}
+
+	ret = aaeon_mcu_gpio_config_input_cmd(data, offset);
+	if (ret < 0)
+		return ret;
+
+	__set_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
+					    unsigned int offset,
+					    int value)
+{
+	int ret;
+
+	ret = regmap_write(data->regmap,
+			   AAEON_MCU_REG(AAEON_MCU_CONFIG_GPIO_OUTPUT, offset - 7),
+			   0);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_WRITE_GPIO, offset - 7),
+			    !!value);
+}
+
+static int aaeon_mcu_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS) {
+		ret = aaeon_mcu_gpo_set_cmd(data, offset, value);
+		if (ret)
+			return ret;
+		__assign_bit(offset, data->gpo_state, value);
+		return 0;
+	}
+
+	ret = aaeon_mcu_gpio_config_output_cmd(data, offset, value);
+	if (ret < 0)
+		return ret;
+
+	__clear_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	return test_bit(offset, data->dir_in) ?
+		GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int aaeon_mcu_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	unsigned int rsp;
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return test_bit(offset, data->gpo_state);
+
+	ret = regmap_read(data->regmap,
+			  AAEON_MCU_REG(AAEON_MCU_READ_GPIO, offset - 7),
+			  &rsp);
+	if (ret < 0)
+		return ret;
+
+	return rsp;
+}
+
+static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_WRITE_GPIO, offset - 7),
+			    !!value);
+}
+
+static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset >= MAX_GPOS)
+		return aaeon_mcu_gpio_set_cmd(data, offset, value);
+
+	ret = aaeon_mcu_gpo_set_cmd(data, offset, value);
+	if (ret)
+		return ret;
+	__assign_bit(offset, data->gpo_state, value);
+	return 0;
+}
+
+static const struct gpio_chip aaeon_mcu_chip = {
+	.label			= "gpio-aaeon-mcu",
+	.owner			= THIS_MODULE,
+	.get_direction		= aaeon_mcu_gpio_get_direction,
+	.direction_input	= aaeon_mcu_gpio_direction_input,
+	.direction_output	= aaeon_mcu_gpio_direction_output,
+	.get			= aaeon_mcu_gpio_get,
+	.set			= aaeon_mcu_gpio_set,
+	.base			= -1,
+	.ngpio			= MAX_GPOS + MAX_GPIOS,
+	.can_sleep		= true,
+};
+
+static void aaeon_mcu_gpio_reset(struct aaeon_mcu_gpio *data, struct device *dev)
+{
+	unsigned int i;
+	int ret;
+
+	/* Reset all GPOs */
+	for (i = 0; i < MAX_GPOS; i++) {
+		ret = aaeon_mcu_gpo_set_cmd(data, i, 0);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPO %u state: %d\n", i, ret);
+		__clear_bit(i, data->dir_in);
+	}
+
+	/* Reset all GPIOs */
+	for (i = MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
+		ret = aaeon_mcu_gpio_config_input_cmd(data, i);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
+		__set_bit(i, data->dir_in);
+	}
+}
+
+static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
+{
+	struct aaeon_mcu_gpio *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!data->regmap)
+		return -ENODEV;
+
+	data->gc = aaeon_mcu_chip;
+	data->gc.parent = pdev->dev.parent;
+
+	/*
+	 * Reset all GPIO states to a known configuration. The MCU does not
+	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
+	 * Without this reset, GPIOs would retain their previous state across
+	 * reboots, which could lead to unexpected behavior.
+	 */
+	aaeon_mcu_gpio_reset(data, &pdev->dev);
+
+	return devm_gpiochip_add_data(&pdev->dev, &data->gc, data);
+}
+
+static struct platform_driver aaeon_mcu_gpio_driver = {
+	.driver = {
+		.name = "aaeon-mcu-gpio",
+	},
+	.probe = aaeon_mcu_gpio_probe,
+};
+module_platform_driver(aaeon_mcu_gpio_driver);
+
+MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.53.0


