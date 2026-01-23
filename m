Return-Path: <linux-gpio+bounces-30988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJw5B15Hc2mHuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:03:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0BB73DB4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C4D8308C816
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B6938887A;
	Fri, 23 Jan 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WkdePuTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D337AA95;
	Fri, 23 Jan 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162119; cv=none; b=qKIDEQHPDFYxgoHwtHOW5XAdGKcWUXixNXZ+Bo8mpnkKsGcRv3xez5k8HYaIoE+6KgZB3oin9FZiI/yNgEp/sKrCCKyjVHZ2cdBWWDNxMRnPJ+4dCFPk8TTpcMQzlI42wGD+ubv1bUbao4RzqB1bE1AZUsRfNfJ6W8saB5xdauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162119; c=relaxed/simple;
	bh=9gen2o3Mf1ofcL8PeP3W13nzaTJLPOD8lNgOmfF5pKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVduVVYMwiNd3REiqPGykmmMk9s/KVgq12EKdL9UibmeVqv6SPGfuzJdr1tVhWnJNaz4ra+A5ZBowIZuLYWgHv+2/tFU4Nwu3+nkDc49E+BarGrUNy5IzAoar4gKGnRnrOLdTQbXBwgXCkt4bm2C6ENFHmpuqCacvE1FRE+9Csc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WkdePuTQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A18CC4E42219;
	Fri, 23 Jan 2026 09:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 776C66070A;
	Fri, 23 Jan 2026 09:55:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7F2D119A87AA;
	Fri, 23 Jan 2026 10:54:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3P9Z/MlQ9eHNxkkoBbhw62O7wkyC3TSbpmPEbIT1/6Y=;
	b=WkdePuTQaMXgGA6w4/o9P+lzXyYD7Ooxu5csXmMm0RrS/JU8qsA/lW0VDNgAZEfECljXpC
	0wDHKlkkyXsYsXOlT7wpMDncHFUuSvB1Dbm8JmBeK+MzueNG9p41fv61p1oX/CTJ2aGOA5
	xkclIxeI4vz7sH9lsQBWHAJm1cpAED1HLw4qjBY+We84u5G0U+dpBVSdx4m6CXBDWjYrMy
	MFmpwKBfCHT2OSp++2TfnGxvW29tT8zH7riK3e/zrgCGh+G162RhuEtEzUXgfF9tSSsFvs
	bMXY4vTuUnG01/ihlFKxfCLM55wdZw9OKw9vEQqQvF2q9Enp2lTN5oXlv26VKQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:34 +0100
Subject: [PATCH v2 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8PL
 MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-5-9f4c00bfb5cb@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6057;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=9gen2o3Mf1ofcL8PeP3W13nzaTJLPOD8lNgOmfF5pKk=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjCnolrcgZBx+MyoNbC5ykndiwIhREZSrhv
 O34cW1DXOKJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7Xt/DACpvfqouTjGTqE2wtWT8OcMjIwNq+L4tI9BGl05Bx4O3zZwTlIpq3J8clXpN3OKeTwz5E+
 H8hPEj1kAun1kZj5iwzZeRM8kRgvPCVNolTzlTsQ543ywyiWorxRyZ1LFXrb8fZrU6pQUqbNDJ/
 +vKjgyYVVDiEGnrYJ6bkCvYPBAjkHnMSHZy91e9qe19IUJTGORBHxjpMleUL3JNnIqWNK+5Sx0/
 s9RyVLoFO0XDjqy6CZCWz1bOaC7kLtMhKuXEUGdDybemDSREYgD63WNLQ8iBk/6MOuSKWF2eDCV
 TiTzxOHhQHpfX0Pyh1+QThdV0IK9RqhAmxbYeKlmiBmK0WH5DKBRG9HQMWl3AQNOPPR/GlQ/DuM
 5pSSBuRbt5sEBu2yNADw1MvF2G29dVUZiIJuW8tK1jaUdf8noxX70i9tXFY5RF/gY3m30Qt9ecb
 ltqBmVhb4FZAse8NKrZ8TfTIPjTek9qbBd/CEm/jBc5tOg1RrSqiTGES+Q/N6ObuizbZ4=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-30988-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: CE0BB73DB4
X-Rspamd-Action: no action

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
 MAINTAINERS                      |   1 +
 drivers/watchdog/Kconfig         |  10 ++++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c | 110 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 28dd964cdf69bdcaec3eb82d6df851a2bad47415..66cc4a5dcbe0977e6baee6d3b5e6023dcc06847b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -193,6 +193,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
 F:	drivers/gpio/gpio-aaeon-mcu.c
 F:	drivers/mfd/aaeon-mcu.c
+F:	drivers/watchdog/aaeon_mcu_wdt.c
 F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
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
index 0000000000000000000000000000000000000000..99be3ce327f44063fce6ba77a7d4efcba34361df
--- /dev/null
+++ b/drivers/watchdog/aaeon_mcu_wdt.c
@@ -0,0 +1,110 @@
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
+	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
+	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
+
+	watchdog_set_drvdata(wdt, data);
+	platform_set_drvdata(pdev, data);
+
+	ret = aaeon_mcu_wdt_start(wdt);
+	if (ret)
+		return ret;
+
+	set_bit(WDOG_HW_RUNNING, &wdt->status);
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


