Return-Path: <linux-gpio+bounces-39568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SSiuKvyyTGproQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:04:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41943718D9E
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:04:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ptS53q4j;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39568-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39568-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9988305BAB1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7797A30BB8A;
	Tue,  7 Jul 2026 08:02:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478E3081BE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 08:01:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411320; cv=none; b=D4r37WCKSQdJGD+6lXgfw6TlS3aXI9y9Wqcki/eKCOHoitNOkPHNbdo/Rcg9sXZ/mfbA1EfmnSktN3HeKEtAY6rmHFATU7tafFgn0YEmEDWpvMEKJdjLL+Cb1EgdmtsdYtZJB39Mgw+s3sGM2MsPFEXZnflNGhUS4fpFCaiMVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411320; c=relaxed/simple;
	bh=+l/K7GkecjCKx6nIA7HKJ2/vMEUVeEnxy+n3sA6Z+0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbteguFUOQ+1NcFIuSXcUVEAYYzGVALel25NrppH9i17VESRdd9SxUI6Cegc5s+RVGGcbFlzndeQ2hClFxcG/LBlaCuRsHIDIRRupR5J3Amw95Wcr3cUOvBpw0GDkDGpzqClwQZEW1Z9qkVKRigY72DFDONup7Efn5x2vqotVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ptS53q4j; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABA96C8F1E9;
	Tue,  7 Jul 2026 08:02:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A97601A3;
	Tue,  7 Jul 2026 08:01:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E31311BC0E3F;
	Tue,  7 Jul 2026 10:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783411316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fBEwTYcc52+NN3xYVbQslUHBc7dgcc+fOwxRbhxvpBw=;
	b=ptS53q4jNxK37xc+QeipSfpFPFVkrN2fAjF3JgOrc369/DNOPBhC1C2NZkxF8EM4gFrgDa
	0UNV1Z4RWUu6GXafgv9bD//Sn8ionuOtZTuLflc11d415YHeNpfE+3QvQXEaUjRPAGzSUv
	eaIdFVEwIjld8+z//7qJRjKdkllKQLh5dg5xMAjhKWYcC8mTbveJg8AM2VlZqkuJNAMOXG
	RXvPX8W7VuuSovfc3Jvn05wf1/ckEQZsu0bymz3R06xqPw52gg459g0j78U6a6FOF93bTy
	ibDpkLo7dCw8BZqaDw5Tasu7XHhyRBSYZp6bRYX/B4CD9J9h9expRDRIGvkzzw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 07 Jul 2026 10:01:30 +0200
Subject: [PATCH v7 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-dev-b4-aaeon-mcu-driver-v7-4-ca6c59abd672@bootlin.com>
References: <20260707-dev-b4-aaeon-mcu-driver-v7-0-ca6c59abd672@bootlin.com>
In-Reply-To: <20260707-dev-b4-aaeon-mcu-driver-v7-0-ca6c59abd672@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39568-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jeremie.dautheribes@bootlin.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-watchdog@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:miquel.raynal@bootlin.com,m:thomas.perrot@bootlin.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41943718D9E

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
 drivers/gpio/gpio-aaeon-mcu.c | 230 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 241 insertions(+)

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
index 000000000000..a9e048c865f5
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,230 @@
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
+	set_bit(offset, data->dir_in);
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
+			   AAEON_MCU_REG(AAEON_MCU_WRITE_GPIO, offset - 7),
+			   !!value);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_CONFIG_GPIO_OUTPUT, offset - 7),
+			    0);
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
+		assign_bit(offset, data->gpo_state, value);
+		return 0;
+	}
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
+	assign_bit(offset, data->gpo_state, value);
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
+MODULE_ALIAS("platform:aaeon-mcu-gpio");
+MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.55.0


