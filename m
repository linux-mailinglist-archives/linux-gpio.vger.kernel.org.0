Return-Path: <linux-gpio+bounces-33376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG6jMIEZtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:04:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE828479A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF0A320E425
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCF4322C78;
	Fri, 13 Mar 2026 14:02:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6BB3264CA
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410561; cv=none; b=aEcReyjqfJ5NwpScs5J4GRxK5YXCn8b4ZTKEHRUuTLP41JAG2/g52CqZY3QTAcRwWL96uJMTvYMrhxrQuSBL+I9TUV+WVNbYKxQeXqZ4QgMEc6r8kNKKtjz0HxSqEwMPfvh0uVyJ9O1QIDos3GgPtPQwUtTfA5/UnWWUONPpCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410561; c=relaxed/simple;
	bh=CeS4wdaaiNaQWZjEUnnXF4AIgR9+Dlca/S49VoNDuZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nz7qiL7vG0+QBX7U6IujvpAUBz1a8pDZ5sRK+5ybfHS/dGhlEEvN8Fe82SCk6eCH4RM4okt1FMPCHZYNigMDT7JoLcuTftEZABqBlqD85FCERslvibiTJc8p4AVMRh2RS8pHZhokxSeCtL/yCJz7GT2jj6Hpld0TGzJPSPaAYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w135r-0007Jq-Ah; Fri, 13 Mar 2026 15:02:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w135r-0005cw-04;
	Fri, 13 Mar 2026 15:02:23 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w135q-000000055i6-3xJd;
	Fri, 13 Mar 2026 15:02:22 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v4 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Date: Fri, 13 Mar 2026 15:02:17 +0100
Message-ID: <20260313140218.1213393-7-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313140218.1213393-1-o.rempel@pengutronix.de>
References: <20260313140218.1213393-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33376-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 58BE828479A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
embedded in the NXP MC33978/MC34978 Multiple Switch Detection
Interface (MSDI) devices.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v4:
- no changes
changes v3:
- no changes
changes v2:
- Add missing <linux/err.h> include.
- Add platform_device_id table
---
 drivers/mux/Kconfig       |  14 +++++
 drivers/mux/Makefile      |   2 +
 drivers/mux/mc33978-mux.c | 119 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/mux/mc33978-mux.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..7532da7e087e 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -45,6 +45,20 @@ config MUX_GPIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-gpio.
 
+config MUX_MC33978
+	tristate "NXP MC33978/MC34978 Analog Multiplexer"
+	depends on MFD_MC33978
+	help
+	  MC33978/MC34978 24-to-1 analog multiplexer (AMUX) driver.
+
+	  This driver provides mux-control for the analog multiplexer,
+	  which can route switch voltages, temperature, and battery voltage
+	  to an external ADC. Typically used with IIO ADC drivers to measure
+	  analog values from the 22 switch inputs plus temperature and VBATP.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called mc33978-mux.
+
 config MUX_MMIO
 	tristate "MMIO/Regmap register bitfield-controlled Multiplexer"
 	depends on OF
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..339c44b4d4f4 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -7,10 +7,12 @@ mux-core-objs			:= core.o
 mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
+mux-mc33978-objs		:= mc33978-mux.o
 mux-mmio-objs			:= mmio.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
+obj-$(CONFIG_MUX_MC33978)	+= mux-mc33978.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
diff --git a/drivers/mux/mc33978-mux.c b/drivers/mux/mc33978-mux.c
new file mode 100644
index 000000000000..de79073e15aa
--- /dev/null
+++ b/drivers/mux/mc33978-mux.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+/*
+ * MC33978/MC34978 Analog Multiplexer (AMUX) Driver
+ *
+ * This driver provides mux-control for the 24-to-1 analog multiplexer.
+ * The AMUX routes one of the following signals to the external AMUX pin:
+ * - Channels 0-13: SG0-SG13 switch voltages
+ * - Channels 14-21: SP0-SP7 switch voltages
+ * - Channel 22: Internal temperature diode
+ * - Channel 23: Battery voltage (VBATP)
+ *
+ * Consumer drivers (typically IIO ADC drivers) use the mux-control
+ * subsystem to select which signal to measure.
+ *
+ * Architecture:
+ * The MC33978 does not have an internal ADC. Instead, it routes analog
+ * signals to an external AMUX pin that must be connected to an external
+ * ADC (such as the SoC's internal ADC). The IIO subsystem is responsible
+ * for coordinating the mux selection and ADC sampling.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/mc33978.h>
+
+/* AMUX_CTRL register field definitions */
+#define MC33978_AMUX_CTRL_MASK	GENMASK(5, 0)	/* 6-bit channel select */
+
+struct mc33978_mux_priv {
+	struct device *dev;
+	struct regmap *map;
+};
+
+static int mc33978_mux_set(struct mux_control *mux, int state)
+{
+	struct mc33978_mux_priv *priv = mux_chip_priv(mux->chip);
+	int ret;
+
+	if (state < 0 || state >= MC33978_NUM_AMUX_CH)
+		return -EINVAL;
+
+	ret = regmap_update_bits(priv->map, MC33978_REG_AMUX_CTRL,
+				 MC33978_AMUX_CTRL_MASK, state);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set AMUX channel %d: %d\n",
+			state, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct mux_control_ops mc33978_mux_ops = {
+	.set = mc33978_mux_set,
+};
+
+static int mc33978_mux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mc33978_mux_priv *priv;
+	struct mux_chip *mux_chip;
+	struct mux_control *mux;
+	int ret;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return dev_err_probe(dev, PTR_ERR(mux_chip), "Failed to allocate mux chip\n");
+
+	/* Borrow the parent's DT node so consumers can find this mux chip */
+	device_set_node(&mux_chip->dev, dev_fwnode(dev->parent));
+
+	priv = mux_chip_priv(mux_chip);
+	priv->dev = dev;
+
+	priv->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv->map)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+
+	mux_chip->ops = &mc33978_mux_ops;
+
+	mux = &mux_chip->mux[0];
+	mux->states = MC33978_NUM_AMUX_CH;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	platform_set_drvdata(pdev, mux_chip);
+
+	return 0;
+}
+
+static const struct platform_device_id mc33978_mux_id[] = {
+	{ "mc33978-mux", },
+	{ "mc34978-mux", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, mc33978_mux_id);
+
+static struct platform_driver mc33978_mux_driver = {
+	.driver = {
+		.name = "mc33978-mux",
+	},
+	.probe = mc33978_mux_probe,
+	.id_table = mc33978_mux_id,
+};
+module_platform_driver(mc33978_mux_driver);
+
+MODULE_AUTHOR("Oleksij Rempel <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 Analog Multiplexer Driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


