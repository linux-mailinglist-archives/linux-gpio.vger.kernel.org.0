Return-Path: <linux-gpio+bounces-31400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM6yFt8igmnPPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:31:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E1DBFCE
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADDF230E2AC9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9F93D3322;
	Tue,  3 Feb 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hWE/18HK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23B3D330C;
	Tue,  3 Feb 2026 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135710; cv=none; b=WAdZd6/zjw6kwkxE9QCsI/w+xirXUAWanxD0NplQUzubAgZx23+Ny+NTSOE6VcXk3DLY81Yd3nVpdLoC2sWUqAoWRSR6qfkOvDrhyqYz+Ah3RZJW5EfUM2V/43d5Pk5NYvu7lQHimCTAbZhNeWB3w6t5FxHyUgJ05E6U7+/NCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135710; c=relaxed/simple;
	bh=ciUXskn8R5Lt6f2W1d0o1EPgKNRay/wwlX1/saFLydw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/bQEHZLDlI4pjxcUaLjn5wdmaiqC6r82t6iOOl3Ak6tkrENIgc1nfpqqy/sDehGW1ZlZg9x3QJUA2q1hCf3VNRNTGUDHexzvFM4RrsBMwY/CMVobzRU1fBq/MNg01+/SY5o58+vjUh0/PIopmV22o95/sJe05aDUFoLvZTGDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hWE/18HK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82866C24385;
	Tue,  3 Feb 2026 16:21:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4390160728;
	Tue,  3 Feb 2026 16:21:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DF4A119A88F8;
	Tue,  3 Feb 2026 17:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gG4+3elvRPgFun9olntvBtcAKyiBPrgRGWbDn5PwYUk=;
	b=hWE/18HK32EXiAxGNUZN1QLOMNQbELMO7HfZzjH6R4k/Qkq1K8+E6T44hrW4wGlMN6n//B
	Uc6hYKo+Xsj5/fSQbVFJ7DH22TF71Gc5SOmEn0zL+wDhy8/PYxsyXoKchF+UKPN0lAYmDo
	BtNSYAMQ9+0EcmdG6gWe/gcrcsQIIiM2GHWGcGwCndb+lyCxMflEADf8PizyHgrTjnqVet
	nJgZIalQYl5yDRxmPkEetXS6FgxAH6f902iSWkI/wz3rI8A9LEK5jiMeKsUMcim798k9dr
	kl4SSKoRp+QL3a/M11Gp0u0ub/9Mc/tkLRskkB3aABdI7GtM7XfFVaNhy1mczQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 03 Feb 2026 17:21:14 +0100
Subject: [PATCH v3 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
 MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-5-0a19432076ac@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6831;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=ciUXskn8R5Lt6f2W1d0o1EPgKNRay/wwlX1/saFLydw=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCHvD1AXxjRnqgAt6a87ClpUKqMt5CMlkcZF
 YQeD6pWal6JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghwAKCRCfwAsFcf4K
 7dRyC/0akOqDxszsPA3jXLLNIaGm3NJK8g0sTE4ntYC7mBAdbOh8QrzkXhpe+lZlHo+Gwuj6ZUW
 oVbv3+1yfacUMoGDbIdgTN5r39xhS2zS8OgE4GwhBqRYZEf4YEvtlIU12mEVV2k5j1zcL8nU0yW
 Tgg6b6+9DbtCJGB855wrZD0NRcUoXWgF8wByK8DP3N9G0D8Rlm6FFzpmYg40mtlSocgd9e0X87g
 MmfEqogUJk3w7j0pfXnGDLq830VtEOVlt0VelAkb5XAkhKTgUNpCvSuyw5aTXa2AV3rIfyahw/s
 Xi+Jw0aEjyFMmuKL8HTcjUtjTjzp73o2oQrHoUKod03848ZSXt49853Wy4Ex6Q/qsO8jplpv97f
 peh9XBVY+MF31pIfFNtCcX6HRD52DOqAadrh6vcsEGqLmHjeEBNXBpOksdg4Cu2/VaYJ0NZrCqx
 KFY3VyWMrEO3Afd/ehEL4t8j5sFurF+0lP8fV1dogG2OdBe/cg1M+yD19yKyHPLdAsWB8=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31400-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1B4E1DBFCE
X-Rspamd-Action: no action

Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
This driver provides system monitoring and recovery capabilities
through the MCU's watchdog timer.

The watchdog supports start, stop, and ping operations with a maximum
hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
The driver assumes the watchdog is already running at probe time, as
the MCU typically enables it by default.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                      |   1 +
 drivers/watchdog/Kconfig         |  10 +++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c | 136 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2538f8c4bc1482b139e18243a68f0a21b9be3704..7b92af42c9fdc17a69a4e7a2fe50f9e199c8b144 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -193,6 +193,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
 F:	drivers/gpio/gpio-aaeon-mcu.c
 F:	drivers/mfd/aaeon-mcu.c
+F:	drivers/watchdog/aaeon_mcu_wdt.c
 F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d3b9df7d466b0b7215ee87b3040811d44ee53d2a..0835df4c902f059c0d61a6e8d884742dd7d2f741 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -168,6 +168,16 @@ config SOFT_WATCHDOG_PRETIMEOUT
 	  watchdog. Be aware that governors might affect the watchdog because it
 	  is purely software, e.g. the panic governor will stall it!
 
+config AAEON_MCU_WATCHDOG
+	tristate "Aaeon MCU Watchdog"
+	depends on MFD_AAEON_MCU || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Select this option to enable watchdog timer support for the Aaeon
+	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
+	  watchdog functionality through the MCU, allowing system monitoring
+	  and automatic recovery from system hangs.
+
 config BD957XMUF_WATCHDOG
 	tristate "ROHM BD9576MUF and BD9573MUF PMIC Watchdog"
 	depends on MFD_ROHM_BD957XMUF
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ba52099b125398a32f80dad23317e223cc4af028..2deec425d3eafb6b208e061fda9f216f4baa8ecc 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
 # ALPHA Architecture
 
 # ARM Architecture
+obj-$(CONFIG_AAEON_MCU_WATCHDOG) += aaeon_mcu_wdt.o
 obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
 obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
 obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
diff --git a/drivers/watchdog/aaeon_mcu_wdt.c b/drivers/watchdog/aaeon_mcu_wdt.c
new file mode 100644
index 0000000000000000000000000000000000000000..416f3035c3226c3889682102d1d2453a9365b5ba
--- /dev/null
+++ b/drivers/watchdog/aaeon_mcu_wdt.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU Watchdog driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define AAEON_MCU_CONTROL_WDT	0x63
+#define AAEON_MCU_PING_WDT	0x73
+
+#define AAEON_MCU_WDT_TIMEOUT         240
+#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
+
+struct aaeon_mcu_wdt {
+	struct watchdog_device wdt;
+	struct device *dev;
+};
+
+static int aaeon_mcu_wdt_cmd(struct device *dev, u8 opcode, u8 arg)
+{
+	u8 cmd[3] = { opcode, arg, 0x00 };
+	u8 rsp;
+
+	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), &rsp, sizeof(rsp));
+}
+
+static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x01);
+}
+
+static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+	u8 cmd[3], rsp;
+	int ret;
+
+	cmd[0] = AAEON_MCU_CONTROL_WDT;
+	cmd[1] = 0x02;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(data->dev, cmd, sizeof(cmd), &rsp, sizeof(rsp));
+	if (ret)
+		return ret;
+
+	*enabled = rsp == 0x01;
+	return 0;
+}
+
+static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x00);
+}
+
+static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_PING_WDT, 0x00);
+}
+
+static const struct watchdog_info aaeon_mcu_wdt_info = {
+	.identity	= "Aaeon MCU Watchdog",
+	.options	= WDIOF_KEEPALIVEPING
+};
+
+static const struct watchdog_ops aaeon_mcu_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= aaeon_mcu_wdt_start,
+	.stop		= aaeon_mcu_wdt_stop,
+	.ping		= aaeon_mcu_wdt_ping,
+};
+
+static int aaeon_mcu_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *wdt;
+	struct aaeon_mcu_wdt *data;
+	bool enabled;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev->parent;
+
+	wdt = &data->wdt;
+	wdt->parent = dev;
+	wdt->info = &aaeon_mcu_wdt_info;
+	wdt->ops = &aaeon_mcu_wdt_ops;
+	/*
+	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
+	 * cannot be changed. The watchdog core will handle automatic pinging
+	 * to support longer timeouts. The default timeout of 240 seconds is
+	 * chosen arbitrarily as a reasonable value; users can adjust it via
+	 * the standard watchdog interface if needed.
+	 */
+	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
+	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
+
+	watchdog_set_drvdata(wdt, data);
+
+	ret = aaeon_mcu_wdt_status(wdt, &enabled);
+	if (ret)
+		return ret;
+
+	if (enabled)
+		set_bit(WDOG_HW_RUNNING, &wdt->status);
+
+	return devm_watchdog_register_device(dev, wdt);
+}
+
+static struct platform_driver aaeon_mcu_wdt_driver = {
+	.driver		= {
+		.name	= "aaeon-mcu-wdt",
+	},
+	.probe		= aaeon_mcu_wdt_probe,
+};
+
+module_platform_driver(aaeon_mcu_wdt_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.52.0


