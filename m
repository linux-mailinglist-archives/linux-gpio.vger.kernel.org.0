Return-Path: <linux-gpio+bounces-30984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKnTFURGc2mHuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:58:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3073C91
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67C7F3028BB2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0043859DA;
	Fri, 23 Jan 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ydk61KpW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA037C10A;
	Fri, 23 Jan 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162103; cv=none; b=DJjxhzZYhdFMpWgamL9QAXEUNuTeWi4Lysh+AfxIV3BkN9ueNnkyXsid/Aoef5Bxi2jDem8xUtRvdJPntjS4xNXuyCX8FDYuLJBFAK1JRdh+LIA7BkQmgdJxIisr5rv42yfH0tBkpzhQSQXeeyYVLl0pw5WGmfeT5MlD0dgefSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162103; c=relaxed/simple;
	bh=2jQAU8PZ36wRhzQAA4HmvuTMuMEUrPlyUdqbYeQTm2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CwrEwTcbz0mWkgSmD5U/ucKkp9V+mzqPBFgcXTS0hTEwHaXdQmUIZGWXrckB/OzYidbvVT74VxIG4mSyJ12xZHU0RxGdj6yRwbE1vePKJEDb7XRE6NUiis5Z9p43Ktd7Ogy8ntr/5vaexQzExq4wpV6tq+Eu2wMo5/VHywiH87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ydk61KpW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07D50C21ABD;
	Fri, 23 Jan 2026 09:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC6516070A;
	Fri, 23 Jan 2026 09:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17948119A87A5;
	Fri, 23 Jan 2026 10:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5TAztR/SKkxFL9LrFN/vZ3+wYKAD6G2KcgcKxu7a/Y4=;
	b=ydk61KpWorIcazjx/CCWr81dtORy2Ga12nZ1s+WeuBgU0kKYIok4hpT76N4qFCn+NXdpxh
	r7P58cpcMCDl1QzvOa9yP722QfNME+SEQIF07HKi5NWF5FAA8czxkedir8OwbDVsDLCRWH
	Zq1xVqY7auaAV5Sfd59rGVkEUVewXpNzPGmDp76MoBaih1QnUICAWGp/HnyAOtEKxHajDw
	KAkdpRnzQ9cgd9XezVsfHmI4vBPdL9SYjdy3sWLvCHxeoAyhLiFwPbaBIcQ/9GRIuIwKT0
	g1qwFj0Xof4wHnzXkVWI2ydeiQFT//+XNYfC/26Dl3/T3gpAq+lR3IVu/zc/ig==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:32 +0100
Subject: [PATCH v2 3/5] mfd: aaeon: Add SRG-IMX8PL MCU driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7158;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=2jQAU8PZ36wRhzQAA4HmvuTMuMEUrPlyUdqbYeQTm2w=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjlsheaQ05e/WPXMkNvPJ9swDiN6f5FMzbw
 teXgN8cWXCJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7Z1iC/9h5RK4Fa44MB5aIDlVR8YnH8ITIfQoigJ50M0gN+VHZV2i7a6XX0zNKCsA7POE7wOm5Md
 7NT+Zlg2vxw1PUSw95ou10HMO0E45iw0mnILKbAGtIkVzupE21KrFKxf1zysIcipnbZE4Wk3usG
 cixlDqnjnMDynyRwGinSgocR0WD4FVSfJszdddvjmEotItvuEBEXhghAxNQexeA1TWv4seLtzNH
 rHgJorRnCKxalasVgwgkIRp+DUv23ECUN+2jxFwtgx1+4Ds3aVtbHUrUVmCfSmVXpXvkZ6LxGq2
 j4zMOrA3ywlGKz6N4EHF64JjYe1yaOBcbMwrTyb94xHO8cSo+FC+DpsT3VBh4qz2LSMU5eDeOVY
 3eu2w9eX/AwLDS/uN86P7pfH0R8L59UxfdypWKLFPpJaMXCKaIK7AnpMhGm10dzIWi0DhfvKZTX
 wYWKFlcVhelWCOTNdKbmBYGi957Af9FEC/kVLYuEhWGfj00+Pj/+ZzAa8pfuoGd5/o1zU=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30984-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39F3073C91
X-Rspamd-Action: no action

Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL
embedded controller. This driver provides the core I2C communication
interface and registers child devices (GPIO and watchdog controllers).

The MCU firmware version is queried during probe and logged for
diagnostic purposes. All I2C transactions are serialized using a mutex
to ensure proper communication with the microcontroller.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   2 +
 drivers/mfd/Kconfig           |   9 +++
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/aaeon-mcu.c       | 129 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/aaeon-mcu.h |  31 ++++++++++
 5 files changed, 173 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10f7d5b183795376b3fcdedc9c3835eecb9d0a3b..175c1e1b28b8151580ed340207d4a6fd59aa8853 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
+F:	drivers/mfd/aaeon-mcu.c
+F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..befcc36c12931b273e8e45fe968e9556514fb959 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1574,6 +1574,15 @@ config AB8500_CORE
 	  the irq_chip parts for handling the Mixed Signal chip events.
 	  This chip embeds various other multimedia functionalities as well.
 
+config MFD_AAEON_MCU
+	tristate "Aaeon SRG-IMX8PL MCU Driver"
+	depends on I2C
+	help
+	  Select this option to enable support for the Aaeon SRG-IMX8PL
+	  onboard microcontroller (MCU). This driver provides the core
+	  functionality to communicate with the MCU over I2C. The MCU
+	  provides GPIO and watchdog functionality.
+
 config MFD_DB8500_PRCMU
 	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
 	depends on UX500_SOC_DB8500
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28afae975ac61d282b3b85af5440119..0bc3a10c787c55730131224fc1053fe35657dd71 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
new file mode 100644
index 0000000000000000000000000000000000000000..b496fb6618ca49296c574531b778fcbb653a48f5
--- /dev/null
+++ b/drivers/mfd/aaeon-mcu.c
@@ -0,0 +1,129 @@
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
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/mfd/core.h>
+#include <linux/platform_device.h>
+
+#define AAEON_MCU_FW_VERSION	0x76
+
+static struct mfd_cell aaeon_mcu_devs[] = {
+	{
+		.name = "aaeon-mcu-wdt",
+	},
+	{
+		.name = "aaeon-mcu-gpio",
+	},
+};
+
+static int aaeon_mcu_read_version(struct device *dev, u8 index, u8 *version)
+{
+	u8 cmd[3] = { AAEON_MCU_FW_VERSION, index, 0x00 };
+
+	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), version, sizeof(*version));
+}
+
+static int aaeon_mcu_print_fw_version(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	u8 major, minor;
+	int ret;
+
+	ret = aaeon_mcu_read_version(dev, 0x00, &major);
+	if (ret)
+		return ret;
+
+	ret = aaeon_mcu_read_version(dev, 0x01, &minor);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "firmware version: v%d.%d\n", major, minor);
+
+	return 0;
+}
+
+int aaeon_mcu_i2c_xfer(struct device *dev,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct aaeon_mcu_dev *mcu = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&mcu->i2c_lock);
+
+	ret = i2c_master_send(client, cmd, cmd_len);
+	if (ret < 0)
+		goto unlock;
+
+	ret = i2c_master_recv(client, rsp, rsp_len);
+	if (ret < 0)
+		goto unlock;
+
+	if (ret != rsp_len) {
+		dev_err(dev,
+			"i2c recv count error (expected: %d, actual: %d)\n",
+			rsp_len, ret);
+		ret = -EIO;
+		goto unlock;
+	}
+
+	ret = 0;
+
+unlock:
+	mutex_unlock(&mcu->i2c_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
+
+static int aaeon_mcu_probe(struct i2c_client *client)
+{
+	struct aaeon_mcu_dev *mcu;
+	int ret;
+
+	mcu = devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, mcu);
+	mcu->dev = &client->dev;
+	mutex_init(&mcu->i2c_lock);
+
+	ret = aaeon_mcu_print_fw_version(client);
+	if (ret) {
+		dev_err(&client->dev, "unable to read firmware version\n");
+		return ret;
+	}
+
+	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_devs,
+				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
+}
+
+static const struct of_device_id aaeon_mcu_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8pl-mcu" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
+
+static struct i2c_driver aaeon_mcu_driver = {
+	.driver = {
+		.name = "aaeon_mcu",
+		.of_match_table = aaeon_mcu_of_match,
+	},
+	.probe = aaeon_mcu_probe,
+};
+
+module_i2c_driver(aaeon_mcu_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU Driver");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
new file mode 100644
index 0000000000000000000000000000000000000000..c9dc7a9adbc86c489f03a550e7776d3b1da4e7b2
--- /dev/null
+++ b/include/linux/mfd/aaeon-mcu.h
@@ -0,0 +1,31 @@
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
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
+ * @dev: Pointer to kernel device structure
+ * @i2c_lock: Mutex to serialize I2C bus access
+ */
+
+struct aaeon_mcu_dev {
+	struct device *dev;
+	struct mutex i2c_lock;
+};
+
+int aaeon_mcu_i2c_xfer(struct device *dev,
+		       const u8 *cmd, int cmd_len,
+		       u8 *rsp, int rsp_len);
+
+#endif /*  __LINUX_MFD_AAEON_MCU_H */

-- 
2.52.0


