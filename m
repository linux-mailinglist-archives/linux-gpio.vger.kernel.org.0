Return-Path: <linux-gpio+bounces-29477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6931CB826C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCA50308944F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BD930F7F1;
	Fri, 12 Dec 2025 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qzX9Dgpx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9128FFF6;
	Fri, 12 Dec 2025 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525310; cv=none; b=XgqTNRbFtIfWzozjykUa/N13Y3GXh8NdNg/e0XPlIsapLptBga7lpiIpJ3Q1TtS/A5AGvYtWr1ZX+6XXRozPFObttjdfu7MUNEkxR15b5ZXRDeYHDTPpHCt/iQojwZTAQunX1rzyL/IVViBxlNgene9xRYvWiAcdXcm0YChr69c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525310; c=relaxed/simple;
	bh=1FO0vDmfLJqQKiHmGAgOSN9nU4jTazUFB/kRKdWuYYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ya1OERI2aC3wai+VyX+6uQtNXrV4QUdRVO80W+gFLZ2N2Q8/Sm3PUdxh3Nt/qBOqfb/YNeG9bCpRTk+GJ/hGOqiMwFV8zvpfps9H1dAkdgRUA0urDv+6ZyEFJIOZuWQL+VRWHoyY413pQFiWQ/w07q6/PQM87D9lKVaHwGDQkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qzX9Dgpx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7F3F0C1935D;
	Fri, 12 Dec 2025 07:41:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93B6D606DF;
	Fri, 12 Dec 2025 07:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CECE7103C8E00;
	Fri, 12 Dec 2025 08:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+9Em5K0Ir5txl5u3tp5x5rRGq90NhxyTh074LTwA5hs=;
	b=qzX9Dgpx22AICPdAxi7xRAGfWx3RGKwfQRw9DxzdCqwVzm7sM1EmOHBCvR/kMVPuYLIFLL
	Ad7cbIPeV3sDJ0HCxrFvs3ksnTqu3SDSVw/sVWNodTkKvj6gVwxT4zpBYDZlngyVkbxBL7
	oBrI5nCI8+hChxa6UjfNDQQuuWMifmQdGWlTz1XhbY9ML0j0RV1/RM2RANCXaDi+05z1Ul
	nZaL43wsDFEqYvJ4/ToZ2S3Jd0oiSxrVpIUCK55QAKRqu3diCrHD298TDqxF894BmIR629
	A9bEu3pghkoPewK48qpRuwPeSwRkuZyYFDK+JnwGhZzXH5bOsFzeAghTZ+6eEA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:10 +0100
Subject: [PATCH 7/8] watchdog: aaeon: Add watchdog driver for SRG-IMX8PL
 MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12@bootlin.com>
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

Add watchdog driver for the Aaeon SRG-IMX8PL embedded controller.
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
 drivers/watchdog/Kconfig         |  10 +++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c | 140 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d3b9df7d466b0b7215ee87b3040811d44ee53d2a..1bd4a7bee303e5e2508f540dc2c16e9e19ed18b0 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -168,6 +168,16 @@ config SOFT_WATCHDOG_PRETIMEOUT
 	  watchdog. Be aware that governors might affect the watchdog because it
 	  is purely software, e.g. the panic governor will stall it!
 
+config AAEON_MCU_WATCHDOG
+	tristate "Aaeon MCU Watchdog"
+	depends on MFD_AAEON_MCU
+	select WATCHDOG_CORE
+	help
+	  Select this option to enable watchdog timer support for the Aaeon
+	  SRG-IMX8PL onboard microcontroller (MCU). This driver provides
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
index 0000000000000000000000000000000000000000..8413ea3bce99585d989cf13e4494e8daff2d9e4c
--- /dev/null
+++ b/drivers/watchdog/aaeon_mcu_wdt.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU Watchdog driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define AAEON_MCU_CONTROL_WDT 0x63
+#define AAEON_MCU_PING_WDT 0x73
+
+#define AAEON_MCU_WDT_TIMEOUT         240
+#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
+
+struct aaeon_mcu_wdt {
+	struct watchdog_device wdt;
+	struct aaeon_mcu_dev *mfd;
+};
+
+static int aaeon_mcu_wdt_start_cmd(struct aaeon_mcu_wdt *data)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONTROL_WDT;
+	cmd[1] = 0x01;
+	cmd[2] = 0x00;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_start_cmd(data);
+}
+
+static int aaeon_mcu_wdt_stop_cmd(struct aaeon_mcu_wdt *data)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONTROL_WDT;
+	cmd[1] = 0x00;
+	cmd[2] = 0x00;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_stop_cmd(data);
+}
+
+static int aaeon_mcu_wdt_ping_cmd(struct aaeon_mcu_wdt *data)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_PING_WDT;
+	cmd[1] = 0x00;
+	cmd[2] = 0x00;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_ping_cmd(data);
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
+	struct aaeon_mcu_dev *mcu = dev_get_drvdata(dev->parent);
+	struct watchdog_device *wdt;
+	struct aaeon_mcu_wdt *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->mfd = mcu;
+
+	wdt = &data->wdt;
+	wdt->parent = dev;
+
+	wdt->info = &aaeon_mcu_wdt_info;
+	wdt->ops = &aaeon_mcu_wdt_ops;
+	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
+	watchdog_init_timeout(wdt, AAEON_MCU_WDT_TIMEOUT, dev);
+
+	watchdog_set_drvdata(wdt, data);
+	platform_set_drvdata(pdev, data);
+	set_bit(WDOG_HW_RUNNING, &wdt->status);
+
+	return devm_watchdog_register_device(dev, wdt);
+}
+
+static const struct of_device_id aaeon_mcu_wdt_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8pl-wdt" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, aaeon_mcu_wdt_of_match);
+
+static struct platform_driver aaeon_mcu_wdt_driver = {
+	.driver		= {
+		.name	= "aaeon-mcu-wdt",
+		.of_match_table = aaeon_mcu_wdt_of_match,
+	},
+	.probe		= aaeon_mcu_wdt_probe,
+};
+
+module_platform_driver(aaeon_mcu_wdt_driver);
+
+MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
+MODULE_AUTHOR("Jérémie Dautheribes");
+MODULE_LICENSE("GPL");

-- 
2.52.0


