Return-Path: <linux-gpio+bounces-34899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ75AD6P1mmEGQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:24:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B624A3BF788
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B85633071711
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 17:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E913D8905;
	Wed,  8 Apr 2026 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z8unAsqB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5763D75D5;
	Wed,  8 Apr 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668955; cv=none; b=pYfeoyRfHubMtXqAsc5/y3C1sw5YwUHsphtU2VIua8PuAJcJad3EJO8qGTOapVCmCf/aUNYdhrqWgBd+C8mxrAPrpeZjnSJRCexJrLr4XsUMrXhgxHe7NbTzXpajB/SiypKtW7aA2Q3YK7SKE8lrAoUvoR1+fzXC7UasANta8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668955; c=relaxed/simple;
	bh=65QwNvr+I5OOmsYxfpRudawMxhKeDbuvLhOvIVdlggg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9EaQgrPf2t0pb4yaF/3hjpHppZtYCDTX8uw6G552v+jNnm2G7p9lIfM+FQrWTrX/3YTMrTzu9sId9yGHdxIwJ2sg13cDZqgu13c5KgdKy2nz2UrMyo3mDv47AEcR1sMnFDyv3riSa+lDo5SdoVgz8dV3OvaGbM7BOFnkF6Qukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z8unAsqB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 05BB4C5AAA8;
	Wed,  8 Apr 2026 17:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE170603CE;
	Wed,  8 Apr 2026 17:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 195F51045019E;
	Wed,  8 Apr 2026 19:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZhH8c6x0PEbv9p0RAqu0ezmUYM5PZZV4d1Q1ar4FwE=;
	b=z8unAsqBhcFq5Vp4lQHlWVnZSxrWvHScIDOYqqp+A+dS3QgjjtDHAxKDjuEx0sxx6Ntw8m
	/9p7zjSpikeOg/vfYZYTPmaqnAxKLigX/Sqh4Cy+ieb4WQ7IJlDRyLsFZM0CjTR8cipVBd
	isItGziOohCzTwkhA8OjWcXijOoRqFa02KLen0vqjAdvH7maZMF66u4S0a4lFFsVfzOBB8
	dGgEGIuM6i2daXd89VBetMT61jlXZbVRuJ2zPu+P4oL/+wjZn3oeZ0pflLVK85kJDBrbrV
	+Dn/hhvE5dZl4tMmiG7Kv4LHFaOrEoW8aepF3HLtlgyhJThYLzrtH4vLKklGqg==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Wed, 08 Apr 2026 19:21:58 +0200
Subject: [PATCH v5 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
 MCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-dev-b4-aaeon-mcu-driver-v5-5-ad98bd481668@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6289;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=65QwNvr+I5OOmsYxfpRudawMxhKeDbuvLhOvIVdlggg=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBp1o7D023/jd70SBytcOY53H44Gff8aGs8jSBbo
 +a/5Eg1d1aJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCadaOwwAKCRCfwAsFcf4K
 7Rx/C/9qKnMPOpRaDoSlA09ZRN0giYZatPJUexrNcHxuK8cjBp7y11zuq3C4s6O8QrilmBKw/Aw
 9CYaXtm39Vdy2OWOKWAZA6TG3cA3/eiqsIdUo+OI93hbIW3LMyRMh9zlXKRoNkwfQFds4OAZe1C
 AU3TL8eKuUPdYFoJVd7lldprM14b2snHsFh6zZBpbj+49hwOViirfLN2Se57m/bDVdti3uZiRRh
 jb2wRfdz7ZxJlwCSIwSmsWN26FuFad417V+SI1+AbGTFd1oLdFiBruJg2qR4yh5sMsL3Kt7vbyq
 GdQeZEwjTVZOvWIQy7NmhtIejB5qDPLB4I8EwN39VU0Xe9bx3hzFMo5RVh3s5mX4yrKw5G6zKX4
 Y5Lg1DX7sFU8jKy+m+fPTNDAEzNJE9/ocw8rL1vSsokOiUFaHAPxnxuWdlwDEuIXFfywTMG9kGZ
 Q0fsKoWJlpZrlUt0qXONDKXTylsIx88zGYCLZQUGJ1KqNzkknFiG5qVJR0CT1Uh56i3Ds=
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
	TAGGED_FROM(0.00)[bounces-34899-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: B624A3BF788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
This driver provides system monitoring and recovery capabilities
through the MCU's watchdog timer.

The watchdog supports start, stop, and ping operations with a maximum
hardware heartbeat of 25 seconds and a default timeout of 240 seconds.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                      |   1 +
 drivers/watchdog/Kconfig         |  10 +++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c | 132 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2538f8c4bc14..7b92af42c9fd 100644
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
index d3b9df7d466b..f67a0b453316 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -420,6 +420,16 @@ config SL28CPLD_WATCHDOG
 
 # ARM Architecture
 
+config AAEON_MCU_WATCHDOG
+	tristate "Aaeon MCU Watchdog"
+	depends on MFD_AAEON_MCU
+	select WATCHDOG_CORE
+	help
+	  Select this option to enable watchdog timer support for the Aaeon
+	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
+	  watchdog functionality through the MCU, allowing system monitoring
+	  and automatic recovery from system hangs.
+
 config AIROHA_WATCHDOG
 	tristate "Airoha EN7581 Watchdog"
 	depends on ARCH_AIROHA || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ba52099b1253..2deec425d3ea 100644
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
index 000000000000..949b506d8194
--- /dev/null
+++ b/drivers/watchdog/aaeon_mcu_wdt.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU Watchdog driver
+ *
+ * Copyright (C) 2026 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+#define AAEON_MCU_PING_WDT	0x73
+
+#define AAEON_MCU_WDT_TIMEOUT         240
+#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
+
+struct aaeon_mcu_wdt {
+	struct watchdog_device wdt;
+	struct regmap *regmap;
+};
+
+static int aaeon_mcu_wdt_cmd(struct aaeon_mcu_wdt *data, u8 opcode, u8 arg)
+{
+	return regmap_write(data->regmap, AAEON_MCU_REG(opcode, arg), 0);
+}
+
+static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x01);
+}
+
+static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+	unsigned int rsp;
+	int ret;
+
+	ret = regmap_read(data->regmap,
+			  AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02),
+			  &rsp);
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
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x00);
+}
+
+static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_PING_WDT, 0x00);
+}
+
+static const struct watchdog_info aaeon_mcu_wdt_info = {
+	.identity	= "Aaeon MCU Watchdog",
+	.options	= WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE
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
+	data->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!data->regmap)
+		return -ENODEV;
+
+	wdt = &data->wdt;
+	wdt->parent = dev;
+	wdt->info = &aaeon_mcu_wdt_info;
+	wdt->ops = &aaeon_mcu_wdt_ops;
+	/*
+	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
+	 * cannot be changed. The watchdog core will handle automatic pinging
+	 * to support longer timeouts. The software timeout of 240 seconds is
+	 * chosen arbitrarily as a reasonable value and is not user-configurable.
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
2.53.0


