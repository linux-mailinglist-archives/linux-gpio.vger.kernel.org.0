Return-Path: <linux-gpio+bounces-34103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCGwCpPmwmm/nAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:31:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D331B8AE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44CB030D66F5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6131230EF7F;
	Tue, 24 Mar 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ninpLKDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DA2C0F84;
	Tue, 24 Mar 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380297; cv=none; b=pZWE/DkwZ/QmT468Ec0A1qdF5Wqg1Ze1Vni43TjxN5Sq/jPNrUOIcoAf3v0buFvgTU3q1KtQI8+zWpbhNDq86sNRxikMec/PsLt1OXDNTrvheQld3VCrlsaHcBca8408i6X8g6C+kECtXSh6M0iDFq2/XDrqd8u9Bu5YHJgCg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380297; c=relaxed/simple;
	bh=d+BkQJpdUUbVfiWpGXEH+iAN3nggRjJsqUblHTPBDXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEhSFmZFpeW9KeFHfFQPjqE63UaBnYiO7sQIlPxHqUl5KdkPG/0rAVuWRwTvoRd/ikWw7GkgETpRrVC5dYKM7IZI0KVo98MrjtNjFe1Qi3blHbSJgCTc4Be5aqbGWS9tdAmnJVDD+d/HbTgQlV3n8Sc/2vYec+0frgfUpDeUWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ninpLKDa; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F857C5809C;
	Tue, 24 Mar 2026 19:25:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F06B0601A0;
	Tue, 24 Mar 2026 19:24:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A50CC1045081D;
	Tue, 24 Mar 2026 20:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UGL1FngKXWCgRtQ6FWCBPJEK7tWFqJr3/YLfN6h8aC8=;
	b=ninpLKDaCQwZrqbu9aEhtg8IHrPbrK0GfIfkzp9MC0qBIvAVyhr/H5vKeRcp/GhMFBTNtQ
	r0DN+W6sn49U2TUwy7JRMQZ2W8aOhCiAYkqeXMEXNYdEv6XvpkyxvQaJmj4XTREXkfdlul
	V/XON+22A0M5rlzWRLpNClFeU0b/VMxRBxaPr/eQQ4a44K3Dfi5BmPsLFcB1/5Gq+9jQn1
	8XFnEngw+NLTg3gY8nMj5xN0MwaDb3xWVuUdVwqb8d5pCbMU/Sb3TjQ8xGvxPx1jvvWALt
	ZC/LHtJo59URMY3Jlj/m6jQTFUnsc2CauLV91a86hHpYsWsi2lCyvacazdqXNQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:29 +0100
Subject: [PATCH v4 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8495;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=d+BkQJpdUUbVfiWpGXEH+iAN3nggRjJsqUblHTPBDXI=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT29nCclVo5UcagNOTSFbhpzSvAHxpmSAOXI
 dmrLjIZLmqJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7fnWC/0Wblk1hquJN3CTe5tAQOz9fowxysDxw/rU7ZG01TUlpCQZNCQBH0Ln9Dju07ca7bimzpL
 sEYEpsfBsUU2dbSn6FBjWvXDCdX/TIfxKdLE82t9ufFvO14sPo80aLaiyiNPRpzE6DzjtnOowOP
 1vt85pj0xKx/D6OCb2sE8A4ln6pye4oYgA0St21GXSze73Q4fMQZdpTSk/fKapTlQytxmYQwSf0
 2fx5WKYgooi39/o7cIhAFhcsaBvmLBG7uzzud93Z2PTIm9+HdKgVqvPrS+XtODKsEoAYJw8+Eb1
 OL/E0+K4iMgZXQX1V3Pd8k076ywF0zlHAEAjDAElEXRArpmeINiGNK8mCbmAi4LRcJxZAS2fLt2
 19BVlfRAG6B4Fklef22FHi0q2xftGpB/u1Fs7+XA+eTmHdy1VsBEljeUwFlm1mpGxHtkQEJYxMQ
 d5F+IrTiqGgIpocnTtBKnLA0JkcV9YzodV5YyijDcFU8HpVJw0kRHtTLRYYBEu7Bgo+vc=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34103-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: D45D331B8AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
embedded controller. This driver provides the core I2C communication
interface and registers child devices (GPIO and watchdog controllers).

The driver implements a custom regmap bus over I2C to match the MCU's
fixed 3-byte command format [opcode, arg, value]. Register addresses
are encoded as 16-bit values (opcode << 8 | arg) using the
AAEON_MCU_REG() macro defined in the shared header. The regmap
instance is shared with child drivers via dev_get_regmap(). Concurrent
I2C accesses from child drivers are serialized by regmap's built-in
locking.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   2 +
 drivers/mfd/Kconfig           |  10 +++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/aaeon-mcu.c       | 155 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/aaeon-mcu.h |  20 ++++++
 5 files changed, 188 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221f6c8e8a3652cd77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+F:	drivers/mfd/aaeon-mcu.c
+F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe7b1c91b72253c05 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1574,6 +1574,16 @@ config AB8500_CORE
 	  the irq_chip parts for handling the Mixed Signal chip events.
 	  This chip embeds various other multimedia functionalities as well.
 
+config MFD_AAEON_MCU
+	tristate "Aaeon SRG-IMX8P MCU Driver"
+	depends on I2C || COMPILE_TEST
+	select MFD_CORE
+	help
+	  Select this option to enable support for the Aaeon SRG-IMX8P
+	  onboard microcontroller (MCU). This driver provides the core
+	  functionality to communicate with the MCU over I2C. The MCU
+	  provides GPIO and watchdog functionality.
+
 config MFD_DB8500_PRCMU
 	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
 	depends on UX500_SOC_DB8500
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28afae975ac61d282b3b85af5440119..34db5b033584368b7a269b1eef12528a74baf8f5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
+obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
new file mode 100644
index 0000000000000000000000000000000000000000..5a969890d201c027eb25c324b4d4d89b1f8c563e
--- /dev/null
+++ b/drivers/mfd/aaeon-mcu.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static const struct mfd_cell aaeon_mcu_devs[] = {
+	{
+		.name = "aaeon-mcu-wdt",
+	},
+	{
+		.name = "aaeon-mcu-gpio",
+	},
+};
+
+/*
+ * Custom regmap bus for the Aaeon MCU I2C protocol.
+ *
+ * The MCU uses a fixed 3-byte command format [opcode, arg, value] followed
+ * by a 1-byte response.  It requires a STOP condition between the command
+ * write and the response read, so two separate i2c_transfer() calls are
+ * issued.  The regmap lock serialises concurrent accesses from the GPIO
+ * and watchdog child drivers.
+ *
+ * Register addresses are encoded as a 16-bit big-endian value where the
+ * high byte is the opcode and the low byte is the argument, matching the
+ * wire layout produced by regmap for reg_bits=16.
+ */
+
+static int aaeon_mcu_regmap_write(void *context, const void *data, size_t count)
+{
+	struct i2c_client *client = context;
+	/* data = [opcode, arg, value] as formatted by regmap */
+	struct i2c_msg write_msg = {
+		.addr  = client->addr,
+		.flags = 0,
+		.buf   = (u8 *)data,
+		.len   = count,
+	};
+	u8 rsp;
+	/* The MCU always sends a response byte after each command; discard it. */
+	struct i2c_msg rsp_msg = {
+		.addr  = client->addr,
+		.flags = I2C_M_RD,
+		.buf   = &rsp,
+		.len   = 1,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &write_msg, 1);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	ret = i2c_transfer(client->adapter, &rsp_msg, 1);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static int aaeon_mcu_regmap_read(void *context, const void *reg_buf,
+				 size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct i2c_client *client = context;
+	/*
+	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
+	 * Append a trailing 0x00 to form the full 3-byte MCU command.
+	 */
+	u8 cmd[3] = { ((u8 *)reg_buf)[0], ((u8 *)reg_buf)[1], 0x00 };
+	struct i2c_msg write_msg = {
+		.addr  = client->addr,
+		.flags = 0,
+		.buf   = cmd,
+		.len   = sizeof(cmd),
+	};
+	struct i2c_msg read_msg = {
+		.addr  = client->addr,
+		.flags = I2C_M_RD,
+		.buf   = val_buf,
+		.len   = val_size,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &write_msg, 1);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	ret = i2c_transfer(client->adapter, &read_msg, 1);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static const struct regmap_bus aaeon_mcu_regmap_bus = {
+	.write = aaeon_mcu_regmap_write,
+	.read  = aaeon_mcu_regmap_read,
+};
+
+static const struct regmap_config aaeon_mcu_regmap_config = {
+	.reg_bits          = 16,
+	.val_bits          = 8,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type        = REGCACHE_NONE,
+};
+
+static int aaeon_mcu_probe(struct i2c_client *client)
+{
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
+				  client, &aaeon_mcu_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id aaeon_mcu_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8p-mcu" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
+
+static struct i2c_driver aaeon_mcu_driver = {
+	.driver = {
+		.name = "aaeon_mcu",
+		.of_match_table = aaeon_mcu_of_match,
+	},
+	.probe = aaeon_mcu_probe,
+};
+module_i2c_driver(aaeon_mcu_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU Driver");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
new file mode 100644
index 0000000000000000000000000000000000000000..861003f6dfd20424c3785008bd2cf89aaa1715b9
--- /dev/null
+++ b/include/linux/mfd/aaeon-mcu.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Aaeon MCU driver definitions
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#ifndef __LINUX_MFD_AAEON_MCU_H
+#define __LINUX_MFD_AAEON_MCU_H
+
+/*
+ * MCU register address: the high byte is the command opcode, the low
+ * byte is the argument.  This matches the 3-byte wire format
+ * [opcode, arg, value] used by the MCU I2C protocol.
+ */
+#define AAEON_MCU_REG(op, arg)	(((op) << 8) | (arg))
+
+#endif /* __LINUX_MFD_AAEON_MCU_H */

-- 
2.53.0


