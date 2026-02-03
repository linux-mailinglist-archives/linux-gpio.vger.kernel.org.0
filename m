Return-Path: <linux-gpio+bounces-31399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLzKuMhgmmQPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:27:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FBDBEFC
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 083CE30600E2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243003D1CBC;
	Tue,  3 Feb 2026 16:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VpqwVuGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4051F3D3008;
	Tue,  3 Feb 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135706; cv=none; b=ZU/iDT4EDmK6uBU31h4MPHnXwjwxFjWFdyR833NQppvk8OCsSBOzfFv7xTr5/KERVoPhVe4TWhyBo+G5h+gttxklc0kIA9HOMuUUW5demjC8fAaRFNYQxG4aEyPuD/nFKYjX5MdlUo1p9EF6iV2LlmzH6irSuGsfDImjlopE2aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135706; c=relaxed/simple;
	bh=SiMnw2mChknIx0Hna8OHcYpG2LGU/o0PpwHa60XJYT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5FO5gGle5n1Xmqi31qpZeerFnuYdSEajy9pLulQP4fOTQNp9rHQhsOBBmS2VvhSYMUzEDr8O8TrW+0PcCojgDBe/qOiJeHIH92RXxvtZ2X3tf19Q6HuEvGyjHZdImOXklYDszBto8KdEAYZ9FVLFVnahn3wSV+MgnP11ce8ySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VpqwVuGe; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B7334E423E3;
	Tue,  3 Feb 2026 16:21:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D419060728;
	Tue,  3 Feb 2026 16:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D07F4119A8888;
	Tue,  3 Feb 2026 17:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WCe1DmpMY2XHQhfczcrFGFPZwKa1zKaSm9hWlH/fzJA=;
	b=VpqwVuGeJcy6OZFf4wp5kXUbMpxDX7cQ7TO3Oib4LIu+JhzqeDkaLb4nFyeh5fS5/FVAS3
	J0ayu2/Fsiq5DMNHruh13Dhnc/ABo9uNRrcfqKQCTQbAuczHdCmvmoImoacVeWkRvCxxDf
	RvqYquW7pWVyX7Khl5il9MHSa4/MlmbQYnqc0mim9O9wiQihLTn5EpwDxFkfjcdq4jHvaL
	SxRsRaYR1ANKVr+pb5z8Z16ox9M7xzG6LlUih13e98cs8Oysj/ini8YuvhLv0sQOWX9o26
	VNn7adpNIxhZAIf5sg0ZMzXOrLQoMQv25xbGTVgVKSjoU2Mvt8MGLw3LB95XfA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 03 Feb 2026 17:21:13 +0100
Subject: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9440;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=SiMnw2mChknIx0Hna8OHcYpG2LGU/o0PpwHa60XJYT0=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCH/5XtJP0EKoKRysRBGKAEea2liL1+hKlf2
 6joq7Oq/0mJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghwAKCRCfwAsFcf4K
 7QPNC/9N8wwm7rcHepiXHoPNRRx3FDU/epkqdgKBt+KdkMw7FqfOnSY4BZf4TjsAL123yJJls51
 Pl0/3PKGNO4hEVnewdcRnlFmW/ziEBoS9ej5yxQ8dHVBMhj4N9HWDJS/A/vTct314Lc0RDLzvvv
 tRUeNS9GJwHcbUBDaFtpVCx/sk/vo6PGyOX3Gc3010f8yzv5Kuvq7c/R9hxufyopEStVPWJNY2F
 vSZUwOTelKP+ri+g81OVoK3vZT84E7QJ9lFHcx9mHNn7Ms9SM/Uh8gxkrTo7XrzKYKYDTqPKOVT
 xli1RxfGSNEWfeiXeXUXf5NAuIMiLzrEIs9DIb5xxAG59oSDC+mHFiSkDjrzeWfF8hHL3oGg9iW
 OguppXbSQt5jXLrHJUi7elpsLNiclE/P6rg1nROswjFQMvVE34GZD6skOE0gFSlELLP+2XwNyoy
 +akNTEvWfyL9F44bbZCeuCjIbCtWBvdAwbDVhwMJdpQHEwbuVzAJ+uQ3/TF1R7yM8ICw0=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31399-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E0FBDBEFC
X-Rspamd-Action: no action

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
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   1 +
 drivers/gpio/Kconfig          |  10 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aaeon-mcu.c | 237 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f91b6a1826d04bef8a0f88221f6c8e8a3652cd77..2538f8c4bc1482b139e18243a68f0a21b9be3704 100644
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
index c74da29253e810b51540684b1186e8f274066b69..5500feb5e22772c0f73aac3adc81e93759c29417 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_AAEON_MCU
+	tristate "Aaeon MCU GPIO support"
+	depends on MFD_AAEON_MCU || COMPILE_TEST
+	select GPIO_GENERIC
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
index 0000000000000000000000000000000000000000..6bbcb073c331b2c004f1b5af835cc03f8ed79575
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU GPIO driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/mod_devicetable.h>
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
+	struct device *dev;
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
+	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
+	__set_bit(offset, data->dir_in);
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
+	ret = aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
+	if (ret < 0)
+		return ret;
+
+	cmd[0] = AAEON_MCU_WRITE_GPIO;
+	/* cmd[1] = offset - 7; */
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
+	ret = aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
+	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
+	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	if (offset >= MAX_GPOS)
+		return aaeon_mcu_gpio_set_cmd(data, offset, value);
+
+	if (aaeon_mcu_gpo_set_cmd(data, offset, value) == 0)
+		__assign_bit(offset, data->gpo_state, value);
+
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
+	data->dev = pdev->dev.parent;
+	data->gc = aaeon_mcu_chip;
+	data->gc.parent = data->dev;
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
2.52.0


