Return-Path: <linux-gpio+bounces-39811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GG+oORzHUGrl4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:19:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D073999C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39811-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39811-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 662FE3055421
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BF64071C1;
	Fri, 10 Jul 2026 10:14:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324B3DB96F;
	Fri, 10 Jul 2026 10:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678453; cv=none; b=UVmirCrhwtojLMmcGNGXhYxP6RCoKQ5/xrh3pDKUh13ZSIav1Qp+8Tb5odIml8xKxwt5K1CjhFoq+1JPuwATQchWU29sZHpzNpgDbudH6ZF4sHV3X2DFl07PfKM9OXXAZ8KrnkGJERkH9DcguHgd3uXOULvusasHlXi4CJC0tYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678453; c=relaxed/simple;
	bh=OVXsziGT2t0ObdUtAd2yeQ3uv+I6GcHQohS+tonYNkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKX7ptz58+3dhaNBFNcCBm7MIdTdJiinQvM2aJupOiR7HbUbMM43ylMwMcDdSSDkafcc+G7i4CV08e50GGndrYdshT1+c0j3clT1YJ+CnpDB6oN0fpl+VAN903nk4FUna4Qv2Kx7FCGUdniM94VNSeAgMzihC3c1D5DavHn9pPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3C66620201C;
	Fri, 10 Jul 2026 12:14:00 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wi8F6-00142D-0G;
	Fri, 10 Jul 2026 12:14:00 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wi8F5-0000000AwDz-41F3;
	Fri, 10 Jul 2026 12:13:59 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Date: Fri, 10 Jul 2026 12:13:55 +0200
Message-ID: <20260710101358.2606941-7-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710101358.2606941-1-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39811-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:o.rempel@pengutronix.de,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pengutronix.de:from_mime,pengutronix.de:email,pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D7D073999C

Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
embedded in the NXP MC33978/MC34978 Multiple Switch Detection
Interface (MSDI) devices.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v14:
- no changes
changes v13:
- no changes
changes v12:
- Convert platform_device_id to named initializers (`.name =`)
  https://lore.kernel.org/all/cover.1778582187.git.u.kleine-koenig@baylibre.com
changes v11:
- no changes
changes v10:
- no changes
changes v9:
- rename mc33978-mux to mux-mc33978 in the Kconfig help
- fail if fwnode is NULL
changes v8:
- no changes
changes v7:
- Simplify the return path and local variable assignment in
  mc33978_mux_set().
- Change idle_state to a signed integer to properly handle negative MUX
  subsystem constants.
- Default to MUX_IDLE_AS_IS when the "idle-state" device tree property
  is missing.
- Explicitly reject MUX_IDLE_DISCONNECT since the hardware does not
  support disconnecting the multiplexer.
changes v6:
- parse optional idle-state property
- validate idle-state against available AMUX channels
- lower-case probe error messages
changes v5:
- no changes
changes v4:
- no changes
changes v3:
- no changes
changes v2:
- Add missing <linux/err.h> include.
- Add platform_device_id table
---
 drivers/mux/Kconfig       |  14 ++++
 drivers/mux/Makefile      |   2 +
 drivers/mux/mc33978-mux.c | 141 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/mux/mc33978-mux.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..51510a74e632 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -56,6 +56,20 @@ config MUX_GPIO
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
+	  be called mux-mc33978.
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
index 000000000000..9034d7c3778d
--- /dev/null
+++ b/drivers/mux/mc33978-mux.c
@@ -0,0 +1,141 @@
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
+	struct mux_chip *mux_chip = mux->chip;
+	struct mc33978_mux_priv *priv = mux_chip_priv(mux_chip);
+	int ret;
+
+	if (state < 0 || state >= MC33978_NUM_AMUX_CH)
+		return -EINVAL;
+
+	ret = regmap_update_bits(priv->map, MC33978_REG_AMUX_CTRL,
+				 MC33978_AMUX_CTRL_MASK, state);
+	if (ret)
+		dev_err(priv->dev, "failed to set AMUX channel %d: %d\n",
+			state, ret);
+
+	return ret;
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
+	struct fwnode_handle *fwnode;
+	struct mux_chip *mux_chip;
+	struct mux_control *mux;
+	s32 idle_state;
+	int ret;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return dev_err_probe(dev, PTR_ERR(mux_chip), "failed to allocate mux chip\n");
+
+	fwnode = dev_fwnode(dev->parent);
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV, "missing parent firmware node\n");
+
+	/* Borrow the parent's firmware node so consumers can find this mux chip */
+	device_set_node(&mux_chip->dev, fwnode);
+
+	priv = mux_chip_priv(mux_chip);
+	priv->dev = dev;
+
+	priv->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv->map)
+		return dev_err_probe(dev, -ENODEV, "failed to get parent regmap\n");
+
+	mux_chip->ops = &mc33978_mux_ops;
+
+	mux = &mux_chip->mux[0];
+	mux->states = MC33978_NUM_AMUX_CH;
+
+	ret = device_property_read_u32(&mux_chip->dev, "idle-state",
+				       (u32 *)&idle_state);
+	if (ret < 0 && ret != -EINVAL) {
+		return dev_err_probe(dev, ret, "failed to parse idle-state\n");
+	} else if (ret == -EINVAL) {
+		mux->idle_state = MUX_IDLE_AS_IS;
+	} else {
+		if (idle_state == MUX_IDLE_DISCONNECT)
+			return dev_err_probe(dev, -EINVAL,
+					     "idle-disconnect not supported by hardware\n");
+		if (idle_state != MUX_IDLE_AS_IS &&
+		    (idle_state < 0 || idle_state >= MC33978_NUM_AMUX_CH))
+			return dev_err_probe(dev, -EINVAL, "invalid idle-state %d\n",
+					     idle_state);
+		mux->idle_state = idle_state;
+	}
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register mux chip\n");
+
+	platform_set_drvdata(pdev, mux_chip);
+
+	return 0;
+}
+
+static const struct platform_device_id mc33978_mux_id[] = {
+	{ .name = "mc33978-mux" },
+	{ .name = "mc34978-mux" },
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


