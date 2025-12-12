Return-Path: <linux-gpio+bounces-29476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24ACB8266
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031423082788
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459A030F55F;
	Fri, 12 Dec 2025 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DVEEAQR1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A1D27702E;
	Fri, 12 Dec 2025 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525306; cv=none; b=nt0q38vXTUHSCFDwiS05XGH9g1Ood14ch+y/HEAHOzwEjFGwnZss8SdcFG0SitUXEVaDJz3WrhwyeLZNM2J7pYDofbOGzrbSmnXwMIDui0C1EAdGDwEkG+yZILX7Dl/8aHME1rjRfzChrwkHQkWX9a4aY73o21MAQgnk21K9448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525306; c=relaxed/simple;
	bh=i3zTcCzEU6Vzk86JnNO3jHITPGIesEvuD/kTcsFtm1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atuIJTqMYtpwSfA3V7zj79AC7lYJbn/SrXOufPS2MzrpFSQALpO+Nd2OvwcsoBsmfpvD7m5IMrYeNWryn6BryrIgu9OlP6LW2aEarzsFmejO0axfdPXoevYkKHmizI81McOWaGWrnxFpm6+4G/bFyVJwsXCO4SNawei+KEFI8UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DVEEAQR1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58D631A211B;
	Fri, 12 Dec 2025 07:41:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 234D7606DF;
	Fri, 12 Dec 2025 07:41:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51A3D103C8E03;
	Fri, 12 Dec 2025 08:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/t/Lqv4AoGZ5V51nn2T+1fBK6i6gggmvBiRF4umYo00=;
	b=DVEEAQR1oHaaVBR+IHsfJSALEfbcFTpE9FwMZfE3NqM0ndNM/wYoVfcqtwQtoyLzf7ycwM
	//mN87k26/qTTnZJ3GpVqkZ5Vwigp8wng2URY+a1R1suPhbqIZXyTuFFwdjoKxyzf4pOmq
	NPWsxwI7NxKaAU8DlMInLUm7DHRAs72jfDIAAM+x+JI8h8IrIQFpRCD46zaKPXYGt6ja9R
	V2R6LUUm+719+kjX97ar7DfuRnc5fmdzA/WD+U+0C8Q9IkDZgBX2cwf3w2ePEZqEmUAg/G
	J062vQaUgHpYZmdghCs69ytufcfDNKcJ5jzNSuh+9s3GISwqpfVQ3Ekp1OrDuQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:09 +0100
Subject: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add GPIO driver for the Aaeon SRG-IMX8PL embedded controller. This
driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
that can be configured as inputs or outputs.

The driver implements proper state management for GPO pins (which are
output-only) and full direction control for GPIO pins. During probe,
all pins are reset to a known state (GPOs low, GPIOs as inputs) to
prevent undefined behavior across system reboots, as the MCU does not
reset GPIO states on soft reboot.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 drivers/gpio/Kconfig          |  10 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aaeon-mcu.c | 248 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c74da29253e810b51540684b1186e8f274066b69..7e0f675b664fa25243fc2802edc3380572c94c41 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_AAEON_MCU
+	tristate "Aaeon MCU GPIO support"
+	depends on MFD_AAEON_MCU && OF_GPIO
+	select GPIO_GENERIC
+	help
+	  Select this option to enable GPIO support for the Aaeon SRG-IMX8PL
+	  onboard MCU. This driver provides access to GPIO pins and GPO
+	  (General Purpose Output) pins controlled by the microcontroller.
+	  The driver handles both input and output configuration.
+
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733e0b06c2581262aaa9cd629f66c7d..1ba6318bc558743fbe5910966c2c8fc3f792efe9 100644
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
index 0000000000000000000000000000000000000000..cebd17d1877147b987ea673b081334c8062f5fc0
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU GPIO driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define AAEON_MCU_CONFIG_GPIO_INPUT 0x69
+#define AAEON_MCU_CONFIG_GPIO_OUTPUT 0x6F
+#define AAEON_MCU_READ_GPIO 0x72
+#define AAEON_MCU_WRITE_GPIO 0x77
+
+#define AAEON_MCU_CONTROL_GPO 0x6C
+
+#define MAX_GPIOS 12
+#define MAX_GPOS 7
+
+struct aaeon_mcu_gpio {
+	struct gpio_chip gc;
+	struct aaeon_mcu_dev *mfd;
+	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
+	DECLARE_BITMAP(gpo_state, MAX_GPOS);
+};
+
+static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
+					    unsigned int offset)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONFIG_GPIO_INPUT;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS) {
+		dev_err(gc->parent, "GPIO offset (%d) must be an output GPO\n", offset);
+		return -EOPNOTSUPP;
+	}
+
+	ret = aaeon_mcu_gpio_config_input_cmd(data, offset);
+	if (ret < 0)
+		return ret;
+
+	set_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
+					     unsigned int offset,
+					     int value)
+{
+	u8 cmd[3], rsp;
+	int ret;
+
+	cmd[0] = AAEON_MCU_CONFIG_GPIO_OUTPUT;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+	if (ret < 0)
+		return ret;
+
+	cmd[0] = AAEON_MCU_WRITE_GPIO;
+	/* cmd[1] = offset - 7; */
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return 0;
+
+	ret = aaeon_mcu_gpio_config_output_cmd(data, offset, value);
+	if (ret < 0)
+		return ret;
+
+	clear_bit(offset, data->dir_in);
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
+	u8 cmd[3], rsp;
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return test_bit(offset, data->gpo_state);
+
+	cmd[0] = AAEON_MCU_READ_GPIO;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+	if (ret < 0)
+		return ret;
+
+	return rsp;
+}
+
+static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONTROL_GPO;
+	cmd[1] = offset + 1;
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_WRITE_GPIO;
+	cmd[1] = offset - 7;
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	if (offset < MAX_GPOS) {
+		if (aaeon_mcu_gpo_set_cmd(data, offset, value) == 0)
+			assign_bit(offset, data->gpo_state, value);
+	} else {
+		return aaeon_mcu_gpio_set_cmd(data, offset, value);
+	}
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
+		clear_bit(i, data->dir_in);
+	}
+
+	/* Reset all GPIOs */
+	for (i = MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
+		ret = aaeon_mcu_gpio_config_input_cmd(data, i);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
+		set_bit(i, data->dir_in);
+	}
+}
+
+static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
+{
+	struct aaeon_mcu_dev *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct aaeon_mcu_gpio *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->mfd = mfd;
+	data->gc = aaeon_mcu_chip;
+	data->gc.parent = &pdev->dev;
+
+	/*
+	 * Reset all GPIO states to a known configuration. The MCU does not
+	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
+	 * Without this reset, GPIOs would retain their previous state across
+	 * reboots, which could lead to unexpected behavior.
+	 */
+	aaeon_mcu_gpio_reset(data, &pdev->dev);
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_gpiochip_add_data(&pdev->dev, &data->gc,
+				      data);
+}
+
+static const struct of_device_id aaeon_mcu_gpio_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8pl-gpio" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, aaeon_mcu_gpio_of_match);
+
+static struct platform_driver aaeon_mcu_gpio_driver = {
+	.driver = {
+		.name = "aaeon-mcu-gpio",
+		.of_match_table = aaeon_mcu_gpio_of_match,
+	},
+	.probe = aaeon_mcu_gpio_probe,
+};
+
+module_platform_driver(aaeon_mcu_gpio_driver);
+
+MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
+MODULE_AUTHOR("Jérémie Dautherbes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.52.0


