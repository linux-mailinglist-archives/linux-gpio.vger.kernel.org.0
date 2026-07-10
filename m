Return-Path: <linux-gpio+bounces-39809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WUf1AfPGUGrX4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:18:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3B739966
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39809-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39809-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51694304B69E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117AE406806;
	Fri, 10 Jul 2026 10:14:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCE3A59B3;
	Fri, 10 Jul 2026 10:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678452; cv=none; b=cj4nvPIlqSPUykVQTB/OEn0j1liXlHb8dFsS3Pg3WcXHpocc6cYS4kRqfn5ykAr9DpPSpN59PeonZb+6EiwqjlXIA/gBjYisqks4I9gX25gVL/DUbVKebNNiSpYJPMB6RgvMWsqtFnAfCdbqo/NlTCB5gBPepZGLzV3T43SecOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678452; c=relaxed/simple;
	bh=5dbQK/suPJ8ZmFPk4oGbRCuFX1L0Gq/LpJt+3tsZ8Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaIBG81nQ1CiifVFIQTxhNC+4u87anV+gTwTv3u7+q/+CgkUT1QfDyjBVuK+2mG9S6Gv73fnRG6Ul6VEqbuC1IoBe0jIz+m2jF66OhNjcObld/c5j65/3P4zFe6QuzAYjx28PAcNyRiPQ4DidypqOc304AvD32H3d/ZcAcTsj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 271D8202018;
	Fri, 10 Jul 2026 12:14:00 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wi8F5-001427-3A;
	Fri, 10 Jul 2026 12:13:59 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wi8F5-0000000AwDU-3hzw;
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
Subject: [PATCH v15 3/6] mfd: mc33978: Add NXP MC33978/MC34978 MSDI support
Date: Fri, 10 Jul 2026 12:13:52 +0200
Message-ID: <20260710101358.2606941-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710101358.2606941-1-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_FROM(0.00)[bounces-39809-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:o.rempel@pengutronix.de,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pengutronix.de:from_mime,pengutronix.de:email,pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonic.nl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BA3B739966

Add the Multi-Function Device (MFD) driver for the NXP MC33978 and
MC34978 Multiple Switch Detection Interfaces (MSDI).

This driver binds to the SPI device, sequences the VDDQ (logic) and VBATP
(battery) regulators, delegates bus, regmap and irq_domain setup to
mc33978_core_init() from the core module added in the previous patch, and
instantiates the child devices (pinctrl, hwmon, mux) from match data.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
This patch depends on the preceding "platform: misc: add NXP MC33978/MC34978
core driver" patch, which provides mc33978_core_init() and the register
definitions in include/linux/mfd/mc33978.h. Without it this driver neither
builds nor links.

The child devices registered here (pinctrl, hwmon, mux) are added by the
follow-up patches in this series, so the devices stay unbound until those
are applied.

changes v15:
- Split from the core driver patch, as requested by Lee Jones. This patch
  now carries only the SPI binding, regulator power sequencing and child
  device registration.
- Follow the drivers/mfd/ subject convention: "mfd: <driver>: <Description>".
- Drop the "mfd" infix from the probe function, match tables and spi_driver
  names: mc33978_mfd_probe() -> mc33978_probe(), mc33978_mfd_of_match ->
  mc33978_of_match, mc33978_mfd_spi_id -> mc33978_spi_id and
  mc33978_mfd_driver -> mc33978_driver.
---
 drivers/mfd/Kconfig   |  16 ++++
 drivers/mfd/Makefile  |   2 +
 drivers/mfd/mc33978.c | 195 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 drivers/mfd/mc33978.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..f5eb315d705b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2559,6 +2559,22 @@ config MFD_UPBOARD_FPGA
 	  To compile this driver as a module, choose M here: the module will be
 	  called upboard-fpga.
 
+config MFD_MC33978
+	tristate "NXP MC33978/MC34978 MFD driver"
+	depends on OF && SPI
+	select MFD_CORE
+	select MC33978_CORE
+	help
+	  MFD driver for NXP MC33978/MC34978 industrial input controllers.
+
+	  The MC33978/MC34978 devices provide 22 switch detection inputs,
+	  analog multiplexing (AMUX), and comprehensive hardware fault
+	  detection. This driver provides IRQ domain, event processing,
+	  and interfaces for child devices (pinctrl, hwmon, mux).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mc33978.
+
 config MFD_MAX7360
 	tristate "Maxim MAX7360 I2C IO Expander"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..690838edbe77 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -122,6 +122,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_MC33978)	+= mc33978.o
+
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
new file mode 100644
index 000000000000..541a391152ef
--- /dev/null
+++ b/drivers/mfd/mc33978.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 David Jander <david@protonic.nl>, Protonic Holland
+ * Copyright (C) 2026 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ *
+ * MC33978/MC34978 MFD Driver - Device binding and power sequencing only.
+ * Core logic (regmap/IRQ/events) lives in separate mc33978-core module to
+ * isolate complex SPI protocol from simple MFD device registration.
+ */
+
+#include <linux/delay.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/mc33978.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+/*
+ * MC33978 vs MC34978: Identical register map and pin configuration; only
+ * temperature range differs (MC33978: -40°C to +125°C, MC34978: -40°C to
+ * +105°C). Both variants share IRQ layout and resources. Device type
+ * preserved for potential errata handling and hwmon-specific attributes.
+ */
+enum mc33978_device_type {
+	MC33978 = 1,  /* Must be non-zero: used as match_data pointer value */
+	MC34978 = 2,
+};
+
+static const struct resource mc33978_hwmon_resources[] = {
+	DEFINE_RES_IRQ(MC33978_HWIRQ_FAULT),
+};
+
+static const struct mfd_cell mc33978_cells[] = {
+	MFD_CELL_NAME("mc33978-pinctrl"),
+	MFD_CELL_RES("mc33978-hwmon", mc33978_hwmon_resources),
+	MFD_CELL_NAME("mc33978-mux"),
+};
+
+static const struct mfd_cell mc34978_cells[] = {
+	MFD_CELL_NAME("mc34978-pinctrl"),
+	MFD_CELL_RES("mc34978-hwmon", mc33978_hwmon_resources),
+	MFD_CELL_NAME("mc34978-mux"),
+};
+
+struct mc33978_ddata {
+	struct irq_domain *domain;
+};
+
+static int mc33978_probe(struct spi_device *spi)
+{
+	unsigned long type;
+	const struct mfd_cell *cells;
+	struct device *dev = &spi->dev;
+	struct mc33978_ddata *ddata;
+	int num_cells;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, ddata);
+
+	/* Power up chip: VDDQ first per datasheet sequencing requirements */
+	ret = devm_regulator_get_enable(dev, "vddq");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VDDQ supply\n");
+
+	ret = devm_regulator_get_enable(dev, "vbatp");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VBATP supply\n");
+
+	/*
+	 * Wait for power-on reset to complete. Datasheet specifies t_ACTIVE
+	 * (time from power-up to device operational) as max 450µs.
+	 */
+	fsleep(450);
+
+	/*
+	 * Core module creates regmap/IRQ domain/event handling. Separated
+	 * because custom SPI protocol needs complex regmap_bus implementation.
+	 *
+	 * API contract: mc33978_core_init() initializes domain_out to NULL on
+	 * entry. On success (return 0), domain_out is guaranteed to point to a
+	 * valid IRQ domain. On error, domain_out remains NULL. This allows
+	 * safe dereference of ddata->domain below without NULL check after
+	 * verifying ret == 0.
+	 */
+	ret = mc33978_core_init(dev, spi, &ddata->domain);
+	if (ret)
+		return ret;
+
+	/*
+	 * Validate IRQ domain size before passing to child devices.
+	 * hwirq_max is exclusive (represents size), we need MC33978_NUM_IRQS
+	 * entries (0..22, total 23).
+	 */
+	if (ddata->domain->hwirq_max < MC33978_NUM_IRQS)
+		return dev_err_probe(dev, -EINVAL,
+				     "IRQ domain has insufficient hwirqs (need %d)\n",
+				     MC33978_NUM_IRQS);
+
+	/*
+	 * Device type stored as pointer value in OF/SPI ID tables.
+	 * Explicit zero-check: spi_get_device_match_data() won't return NULL
+	 * since probe matched, but .data could be NULL if table misconfigured.
+	 */
+	type = (unsigned long)spi_get_device_match_data(spi);
+	if (!type)
+		return dev_err_probe(dev, -EINVAL, "missing device match data\n");
+
+	switch (type) {
+	case MC33978:
+		cells = mc33978_cells;
+		num_cells = ARRAY_SIZE(mc33978_cells);
+		break;
+	case MC34978:
+		cells = mc34978_cells;
+		num_cells = ARRAY_SIZE(mc34978_cells);
+		break;
+	default:
+		return dev_err_probe(dev, -ENODEV, "unknown device type\n");
+	}
+
+	/*
+	 * Child devices inherit IRQ domain for platform_get_irq(). devm cleanup
+	 * order is critical (LIFO - Last In, First Out):
+	 *
+	 * Teardown sequence:
+	 * 1. THIS: devm_mfd_add_devices() cleanup
+	 *    - Child devices removed, child devm_request_irq() freed
+	 * 2. Core: devm_request_threaded_irq() cleanup in mc33978_core_init()
+	 *    - Parent IRQ handler freed, no new events triggered
+	 * 3. Core: devm_add_action(mc33978_teardown) cleanup
+	 *    - event_work canceled via cancel_work_sync()
+	 * 4. Core: devm_regmap_init() cleanup
+	 *    - Regmap destroyed (safe: work stopped, IRQ freed)
+	 * 5. Core: devm_add_action(mc33978_irq_domain_remove) in mc33978_irq_init()
+	 *    - IRQ domain removed (safe: children gone, work stopped)
+	 *
+	 * Step 3 is critical: event_work accesses both regmap and IRQ domain.
+	 * cancel_work_sync() in mc33978_teardown() ensures the worker completes
+	 * before steps 4-5 destroy the resources it uses.
+	 *
+	 * Core module manually calls irq_dispose_mapping() for all hwirqs before
+	 * irq_domain_remove() because free_irq() doesn't dispose mappings, and
+	 * irq_domain_remove() expects an empty radix tree.
+	 */
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   cells, num_cells,
+				   NULL, 0, ddata->domain);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add MFD child devices\n");
+
+	return 0;
+}
+
+static const struct of_device_id mc33978_of_match[] = {
+	{ .compatible = "nxp,mc33978", .data = (void *)MC33978 },
+	{ .compatible = "nxp,mc34978", .data = (void *)MC34978 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mc33978_of_match);
+
+static const struct spi_device_id mc33978_spi_id[] = {
+	{ .name = "mc33978", .driver_data = MC33978 },
+	{ .name = "mc34978", .driver_data = MC34978 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, mc33978_spi_id);
+
+static struct spi_driver mc33978_driver = {
+	.driver = {
+		.name = "mc33978",
+		.of_match_table = mc33978_of_match,
+		/*
+		 * Suppress bind/unbind via sysfs. The pinctrl child driver has
+		 * suppress_bind_attrs=true due to a pinctrl subsystem bug, which
+		 * means this MFD parent cannot be unbound either (device links
+		 * require all children to unbind first).
+		 */
+		.suppress_bind_attrs = true,
+	},
+	.probe = mc33978_probe,
+	.id_table = mc33978_spi_id,
+};
+module_spi_driver(mc33978_driver);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 MFD driver");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: mc33978-core");
-- 
2.47.3


