Return-Path: <linux-gpio+bounces-37313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG30D9XgD2pERAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 06:51:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3E5AECB7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 06:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFC40304D735
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 04:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECC3360722;
	Fri, 22 May 2026 04:49:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAC35DA7F
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 04:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779425374; cv=none; b=X6KJ9uHqv3xTDkpAgdqJswWNjwExj6JeM1dgVpD3KY9Mo/Q2hObvH5hGXT3myzlHAd4UyR+h9XWRn+J4AeapJdvlSMSEZ1hZhJh/QhP1sDLuVD0D9o6Q/C+qv8g1d+Zw384PmAkwAwMyEFaxoZHNwUmp4fYnrKlfvljM4niXOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779425374; c=relaxed/simple;
	bh=Npzu2cMcNgOVgVP4CdF6gyo6mCLXWStE5kcIyK0LDO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4AZKiB9DAyRWA6xLYDc9ffeK3c1DpIOKRESKK2bSzk/ZJkESo5A0ohycFGFWRKR8hxkAdY5vycjM2nJmPbofvUkHJQQcKloGAk8FSNJ6pm8tCGf5tJPmvPdsAS7g9JAuQqqmIaKvsr9b0oRK2biZFE1q0phg7Xd2wgEMp2AWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHof-0007eq-AQ; Fri, 22 May 2026 06:48:57 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHod-001DGi-2Z;
	Fri, 22 May 2026 06:48:56 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHoe-00000007RAQ-1AkP;
	Fri, 22 May 2026 06:48:56 +0200
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
Subject: [PATCH v14 2/6] mfd: add NXP MC33978/MC34978 core driver
Date: Fri, 22 May 2026 06:48:51 +0200
Message-ID: <20260522044855.1772639-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522044855.1772639-1-o.rempel@pengutronix.de>
References: <20260522044855.1772639-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-37313-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,protonic.nl:email]
X-Rspamd-Queue-Id: 91B3E5AECB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add core Multi-Function Device (MFD) driver for the NXP MC33978 and
MC34978 Multiple Switch Detection Interfaces (MSDI).

The MC33978/MC34978 devices provide 22 switch detection inputs, analog
multiplexing (AMUX), and comprehensive hardware fault detection.

This core driver handles:
- SPI communications via a custom regmap bus to support the device's
  pipelined two-frame MISO response requirement.
- Power sequencing for the VDDQ (logic) and VBATP (battery) regulators.
- Interrupt demultiplexing, utilizing an irq_domain to provide 22 virtual
  IRQs for switch state changes and 1 virtual IRQ for hardware faults.
- Inline status harvesting from the SPI MSB to detect and trigger events
  without requiring dedicated status register polling.

Child devices (pinctrl, hwmon, mux) are instantiated by the core driver
from match data.

Note: The device currently lacks suspend/resume power management callbacks.
If the system enters a sleep state cutting power to VDDQ/VBATP, the device
will wake up in POR state with hardware interrupt masks reset. Power
management support is intentionally deferred for now.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v14:
- Fix IRQ domain bounds check: hwirq_max is exclusive, not inclusive
- Add explicit CS inactive delay (1µs) for pipelined SPI frames
- Clear harvested_flags before enabling work scheduling
- Remove irq_set_wake callback: causes lock ordering violations with parent
  IRQ
- Add SPI command echo validation to detect bus faults
- Add time-bounded event processing (10ms bursts) to prevent soft lockups on
  high-frequency signals
- Fix fault IRQ masking: sync cached_fault_active even when IRQ disabled to
  prevent infinite harvesting
- Optimize harvesting lock scope: move atomic ops outside spinlock where safe
- Fix comment: MC34978 temperature range is -40°C to +105°C (not +150°C)
- Add power-on reset delay (450µs) after VBATP enable per datasheet
  t_ACTIVE spec
- Change platform/Makefile: unconditionally compile misc/
  (obj-y instead of CONFIG_MC33978_CORE guard)
- fix pin/irq convertion from ligical to physical state
changes v13:
- Move cached_pin_state protection from event_lock to irq_state_lock
- Gate FAULT_STAT harvesting: only collect when !cached_fault_active
- Change dummy SPI command from REG_CHECK to REG_READ_IN
changes v12:
- Split monolithic MFD driver into two modules per maintainer feedback:
  * drivers/mfd/mc33978.c: Thin wrapper for SPI binding, power sequencing,
    and child device registration
  * drivers/platform/misc/mc33978-core.c: Complex core functionality
    including custom regmap bus, IRQ domain, and event handling
- Add mc33978_core_init() API exported by core module for MFD initialization
- Introduce CONFIG_MC33978_CORE in drivers/platform/misc/Kconfig
- Update CONFIG_MFD_MC33978 to select CONFIG_MC33978_CORE
- Add MODULE_SOFTDEP("pre: mc33978-core") to ensure correct module load order
- Rename struct mc33978_mfd_priv to context-specific names:
  * mc33978_ddata in MFD driver
  * mc33978_core_data in core module
- Rename local variables from 'mc' to 'ddata'/'cdata' for clarity
- Replace MC33978_DRV_NAME macro with string literal "mc33978"
- Convert kerneldoc (/** */) on static functions to regular comments (/* */)
- Adopt 100-character line limit throughout
- Fix misleading cacheline alignment comment ("must be at end" -> "prevent
  DMA corruption from adjacent fields")
- Document IRQ locking strategy explicitly (irq_lock mutex for regmap/SPI,
  irq_state_lock raw spinlock for atomic state access)
- Reformat header file comments from inline style to preceding style for
  improved readability
- Enhance interrupt behavior documentation with detailed datasheet references
  explaining INT_flg clear timing and FAULT_STAT latching behavior
- add .suppress_bind_attrs = true
changes v11:
- Introduce synthetic wakeup bit to prevent hardware bit overloading and
  avoid phantom transient faults.
- Add smp_mb__before_atomic() to ensure memory visibility before
  updating harvested_flags.
- Update event processing to mask synthetic bits before evaluating
  hardware fault conditions.
- Introduce fault_lock spinlock to protect fault state members.
- Replace manual memory barriers and READ_ONCE/WRITE_ONCE with
  spinlock-protected access.
- Introduce irq_state_lock raw spinlock to protect IRQ state fields.
- Replace irq_lock mutex with raw spinlock in IRQ callbacks and event
  handling paths.
- Include MC33978_REG_ENTER_LPM in volatile and precious ranges.
- Mark MC33978_REG_ENTER_LPM as readable to avoid regcache sync writes.
changes v10:
- Refactor IRQ setup into a common helper to unify the .map and .alloc
  code paths.
- Enable hierarchical IRQ support to allow integration with the
  pinctrl/GPIO child domain.
- Simplify event handling by removing redundant boolean return values
  from internal handlers.
- Fix IRQ cleanup by disposing of all active mappings before removing
  the IRQ domain.
- Standardize IRQ constants using MC33978_NUM_IRQS for consistent domain
  sizing and bounds checks.
changes v9:
- Fix null irq_domain dereference from debugfs race by initializing IRQ domain
  early before regmap initialization.
- Refactor mc33978_handle_fault_condition() to improve readability by keeping
  variable declarations at the top and adding inline comments.
- Fix spurious transient fault events caused by redundant STAT_FAULT flags
  during event loop.
- Fix spurious interrupt loops by explicitly returning -ENODATA in
  mc33978_rx_decode() for registers without status bits.
- Validate hwirq bounds in mc33978_irq_domain_alloc() to prevent corruption
  of irq_rise/irq_fall bitmasks by malformed device tree inputs.
- set DOMAIN_BUS_NEXUS
- Protect work on teardown
- remove IRQF_SHARED
changes v8:
- Fix TOCTOU race condition in SPI event harvesting loop by grabbing
  harvested_flags before hardware reads.
- Fix broken hierarchical IRQ allocation by replacing
  irq_domain_set_hwirq_and_chip() with irq_domain_set_info() and passing
  the handle_simple_irq flow handler.
- Fix out-of-bounds stack read and endianness bug in for_each_set_bit() by
  typing fired_pins as unsigned long instead of casting u32.
- Prevent DMA cacheline corruption by explicitly aligning rx_frame with
  ____cacheline_aligned to separate it from tx_frame.
- Prevent spurious IRQs by verifying irq_find_mapping() returns non-zero
  before calling handle_nested_irq().
- Prevent missed transient hardware faults by explicitly evaluating
  hw_flags in mc33978_handle_fault_condition().
- Fix missing memory barrier in mc33978_harvest_status() with
  smp_mb__after_atomic() to ensure harvested_flags visibility.
- Fix devres use-after-free teardown race by using INIT_WORK and a custom
  cancel action after the IRQ domain is destroyed, instead of
  devm_work_autocancel.
- Prevent spurious pin interrupts on boot by priming cached_pin_state via
  a regmap_read() during probe before enabling IRQs.
- Implement .irq_set_wake callback to support system wake from
  hardware faults and switch state changes.
changes v7:
- Fix event handling race condition with smp_mb()
- Replace INIT_WORK() with devm_work_autocancel()
changes v6:
- Remove the hardcoded bypass in irq_set_type to allow child drivers to
  configure the FAULT line for edge-triggering.
- Implement software edge-detection for FAULT interrupt.
- Add MC33978_FAULT_ALARM_MASK to the shared header for child devices
- Use READ_ONCE() and WRITE_ONCE() for lockless shared state variables
  (cached_pin_mask, irq_rise, irq_fall, bus_fault_active,
  cached_fault_active) accessed across the SPI harvesting context and
  the event worker.
- Add an if (hwirq < MC33978_NUM_PINS) guard in irq_mask() and
  irq_unmask() to prevent the FAULT hwirq (22) from altering the
  physical pin mask registers.
- Lowercase the error strings in dev_err_probe()
- Add inline comments explaining the irq_map fallback behavior
changes v5:
- no changes
changes v4:
- Removed .of_compatible strings from the mfd_cell arrays
changes v3:
- Select IRQ_DOMAIN_HIERARCHY in Kconfig
- Add .alloc and .free callbacks to irq_domain_ops to support hierarchical
  IRQ domains
- Set IRQ_DOMAIN_FLAG_HIERARCHY flag on the core MFD irq_domain
- replace manual lock/unlock with guard()
changes v2:
- Rewrite the driver header comment
- Explicitly reject IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW in
  mc33978_irq_set_type() to correctly reflect the hardware's edge-only
  interrupt capabilities.
- Pass the hardware fault IRQ to the hwmon child driver via mfd_cell
  resources, rather than requiring the child to parse the parent's irq_domain.
- Ensure the Kconfig strictly depends on OF and SPI
---
 drivers/mfd/Kconfig                  |   16 +
 drivers/mfd/Makefile                 |    2 +
 drivers/mfd/mc33978.c                |  195 ++++
 drivers/platform/Kconfig             |    2 +
 drivers/platform/Makefile            |    1 +
 drivers/platform/misc/Kconfig        |   10 +
 drivers/platform/misc/Makefile       |    6 +
 drivers/platform/misc/mc33978-core.c | 1284 ++++++++++++++++++++++++++
 include/linux/mfd/mc33978.h          |  196 ++++
 9 files changed, 1712 insertions(+)
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/platform/misc/Kconfig
 create mode 100644 drivers/platform/misc/Makefile
 create mode 100644 drivers/platform/misc/mc33978-core.c
 create mode 100644 include/linux/mfd/mc33978.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..06bad2a2e1ae 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2566,6 +2566,22 @@ config MFD_UPBOARD_FPGA
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
index e75e8045c28a..dcd99315f683 100644
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
index 000000000000..3661704a9197
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
+static int mc33978_mfd_probe(struct spi_device *spi)
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
+static const struct of_device_id mc33978_mfd_of_match[] = {
+	{ .compatible = "nxp,mc33978", .data = (void *)MC33978 },
+	{ .compatible = "nxp,mc34978", .data = (void *)MC34978 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mc33978_mfd_of_match);
+
+static const struct spi_device_id mc33978_mfd_spi_id[] = {
+	{ .name = "mc33978", .driver_data = MC33978 },
+	{ .name = "mc34978", .driver_data = MC34978 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, mc33978_mfd_spi_id);
+
+static struct spi_driver mc33978_mfd_driver = {
+	.driver = {
+		.name = "mc33978",
+		.of_match_table = mc33978_mfd_of_match,
+		/*
+		 * Suppress bind/unbind via sysfs. The pinctrl child driver has
+		 * suppress_bind_attrs=true due to a pinctrl subsystem bug, which
+		 * means this MFD parent cannot be unbound either (device links
+		 * require all children to unbind first).
+		 */
+		.suppress_bind_attrs = true,
+	},
+	.probe = mc33978_mfd_probe,
+	.id_table = mc33978_mfd_spi_id,
+};
+module_spi_driver(mc33978_mfd_driver);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 MFD driver");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: mc33978-core");
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..45e66de36678 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -11,6 +11,8 @@ source "drivers/platform/cznic/Kconfig"
 
 source "drivers/platform/mellanox/Kconfig"
 
+source "drivers/platform/misc/Kconfig"
+
 source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..c247a6826a2d 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_X86)		+= x86/
 obj-$(CONFIG_LOONGARCH)		+= loongarch/
 obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
+obj-y				+= misc/
 obj-$(CONFIG_MIPS)		+= mips/
 obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
diff --git a/drivers/platform/misc/Kconfig b/drivers/platform/misc/Kconfig
new file mode 100644
index 000000000000..e5730bfd31e8
--- /dev/null
+++ b/drivers/platform/misc/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Platform miscellaneous drivers configuration
+#
+
+config MC33978_CORE
+	tristate
+	depends on SPI
+	select IRQ_DOMAIN_HIERARCHY
+	select REGMAP
diff --git a/drivers/platform/misc/Makefile b/drivers/platform/misc/Makefile
new file mode 100644
index 000000000000..4aa1351a46ad
--- /dev/null
+++ b/drivers/platform/misc/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for miscellaneous platform-specific drivers
+#
+
+obj-$(CONFIG_MC33978_CORE)	+= mc33978-core.o
diff --git a/drivers/platform/misc/mc33978-core.c b/drivers/platform/misc/mc33978-core.c
new file mode 100644
index 000000000000..c90826cac362
--- /dev/null
+++ b/drivers/platform/misc/mc33978-core.c
@@ -0,0 +1,1284 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 David Jander <david@protonic.nl>, Protonic Holland
+ * Copyright (C) 2026 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ *
+ * MC33978/MC34978 - Core functionality module
+ *
+ * This module implements the complex functionality:
+ * - Custom regmap bus (pipelined SPI protocol)
+ * - IRQ chip + IRQ domain (23 virtual IRQs)
+ * - Event processing (pin changes + fault detection)
+ * - Status harvesting from SPI responses
+ *
+ * The MFD driver (mc33978.c) calls mc33978_core_init() to initialize
+ * this functionality, keeping the MFD driver simple for review.
+ *
+ * Custom SPI Regmap & Event Harvesting:
+ * The device uses a non-standard pipelined SPI protocol where the MISO
+ * response logically lags the MOSI command by one frame. Furthermore, the
+ * hardware embeds volatile global status bits (INT_flg, FAULT_STAT) into the
+ * high byte of almost every SPI response (with specific exceptions handled by
+ * the decoder). This core implements a custom regmap_bus to handle the
+ * 2-frame dummy fetches and transparently "harvests" these status bits in
+ * the background to schedule event processing.
+ *
+ * Interrupt Quirks & Limitations (MC33978 Rev. 10, §9.10.27):
+ * - Clear-on-Read INT_flg: The INT_B pin is cleared 1.0ms after CS_B falling
+ * edge. Any SPI message that returns INT_flg will clear this flag. The
+ * INT_flg bit is set on any interrupt event (pin change, fault). Harvesting
+ * INT_flg from all SPI traffic is the ONLY way to know this device triggered
+ * an interrupt (crucial for shared IRQ lines where another driver's regmap
+ * access would silently clear the flag).
+ * - FAULT_STAT Latching (§9.10.27): FAULT_STAT is a sticky summary bit that
+ * latches HIGH when any fault occurs and remains HIGH in all subsequent SPI
+ * responses until the Fault register (0x42) is read. Reading Fault register
+ * clears the latch; hardware immediately re-latches if fault condition still
+ * present. INT_flg clears on any SPI read regardless of persistence. This
+ * allows transient detection: FAULT_STAT can appear in one SPI frame (latched
+ * evidence) but be absent in the next (condition cleared before register read),
+ * proving a transient fault occurred.
+ * - Stateless Pin Edge Detection: Hardware lacks per-pin interrupt status
+ * registers. READ_IN register (§9.10.27) returns instantaneous switch state
+ * (Logic[1]=closed, Logic[0]=open). The driver XORs current state against
+ * cached state to derive which pins changed.
+ * - Missed Short Pulses: Pin interrupts are state-sampled, not edge-latched.
+ * Physical pulses shorter than SPI read latency (~1-2ms) will be missed if
+ * the pin reverts before READ_IN sampling. Inherent hardware limitation.
+ * - Edge-Only Pin Interrupts: Hardware asserts INT_B only on state changes,
+ * never continuously for sustained levels. Driver emulates edge interrupts
+ * (RISING/FALLING) and rejects LEVEL configurations to match hardware.
+ */
+
+#include <linux/array_size.h>
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cache.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+#include <linux/string.h>
+
+#include <linux/mfd/mc33978.h>
+
+/* Device identification signature returned by CHECK register */
+#define MC33978_CHECK_SIGNATURE		0x123456
+
+/*
+ * Pipelined two-frame SPI transfer:
+ * [REQ]  - Transmits command/write-data, receives dummy/previous response
+ * [PIPE] - Transmits dummy READ_IN, receives actual response to current command
+ */
+enum mc33978_frame_index {
+	MC33978_FRAME_REQ = 0,
+	MC33978_FRAME_PIPE,
+	MC33978_FRAME_COUNT
+};
+
+/* SPI frame byte offsets (transmitted MSB first) */
+enum mc33978_frame_offset {
+	MC33978_FRAME_CMD = 0,
+	MC33978_FRAME_DATA_HI,
+	MC33978_FRAME_DATA_MID,
+	MC33978_FRAME_DATA_LO
+};
+
+#define MC33978_FRAME_LEN		4
+
+/* Regmap internal value buffer offsets */
+enum mc33978_payload_offset {
+	MC33978_PAYLOAD_HI = 0,
+	MC33978_PAYLOAD_MID,
+	MC33978_PAYLOAD_LO
+};
+
+#define MC33978_PAYLOAD_LEN		3
+
+/*
+ * SPI Command Byte (FRAME_CMD).
+ * Maps to frame bit [24] in the datasheet.
+ */
+#define MC33978_CMD_BYTE_WRITE		BIT(0)
+
+/*
+ * Sentinel for skipping command echo validation. Uses 0xFF (invalid register
+ * address - all valid registers are even).
+ */
+#define MC33978_CMD_INVALID		0xFF
+
+/* High Payload Byte Masks (FRAME_DATA_HI / PAYLOAD_HI). */
+/* Maps to frame bit [23] */
+#define MC33978_HI_BYTE_STAT_FAULT     BIT(7)
+/* Maps to frame bit [22] */
+#define MC33978_HI_BYTE_STAT_INT       BIT(6)
+
+#define MC33978_HI_BYTE_STATUS_MASK    (MC33978_HI_BYTE_STAT_FAULT | \
+					MC33978_HI_BYTE_STAT_INT)
+
+/* Synthetic wakeup bit for harvested flags */
+#define MC33978_HARVEST_WAKE_BIT	BIT(8)
+
+/* Maps to frame bits [21:16] */
+#define MC33978_HI_BYTE_DATA_MASK	GENMASK(5, 0)
+
+struct mc33978_core_data {
+	struct spi_device *spi;
+	struct regmap *map;
+	struct irq_domain *domain;
+
+	/* Pre-built SPI messages (immutable after init) */
+	struct spi_message msg_read;
+	struct spi_message msg_write;
+	struct spi_transfer xfer_read[MC33978_FRAME_COUNT];
+	struct spi_transfer xfer_write;
+
+	/* Serializes event processing loop (prevents concurrent handle_events) */
+	struct mutex event_lock;
+
+	/*
+	 * IRQ subsystem locking:
+	 * - irq_lock: Mutex for sleeping operations (regmap/SPI access)
+	 * - irq_state_lock: Raw spinlock for atomic state access
+	 *
+	 * Protected by irq_state_lock:
+	 */
+	struct mutex irq_lock;
+	raw_spinlock_t irq_state_lock;
+	/* Previous pin state for edge detection (protected by irq_state_lock) */
+	u32 cached_pin_state;
+	/* IRQ mask for 23 IRQs: bits 0-21 for pins, bit 22 for fault */
+	u32 cached_pin_mask;
+	/* Rising edge IRQ enable mask (23 IRQs) */
+	u32 irq_rise;
+	/* Falling edge IRQ enable mask (23 IRQs) */
+	u32 irq_fall;
+	/* Pins that were unmasked since last sync */
+	u32 unmasked_since_sync;
+
+	/* Protected by state_lock */
+	spinlock_t state_lock;
+	/* Prevents work scheduling during teardown */
+	bool tearing_down;
+	/* Prevents work scheduling before IRQ handler ready */
+	bool irq_ready;
+	/* Latest physical fault state on bus */
+	bool bus_fault_active;
+	/* Cached fault state from previous event */
+	bool cached_fault_active;
+
+	/* Atomic operations (no lock needed) */
+	/* Status bits from SPI responses */
+	atomic_t harvested_flags;
+
+	/*
+	 * Work scheduling protected by state_lock.
+	 * Work execution serialized by workqueue subsystem.
+	 */
+	struct work_struct event_work;
+
+	/*
+	 * DMA-safe buffers for SPI transfers. Must be kept at end of struct.
+	 * devm_kzalloc() returns memory aligned to ARCH_DMA_MINALIGN, and
+	 * __aligned(ARCH_DMA_MINALIGN) prevents false sharing with preceding fields
+	 * as well as false sharing between independent SPI transfers.
+	 */
+	u8 tx_req[MC33978_FRAME_LEN] __aligned(ARCH_DMA_MINALIGN);
+	u8 rx_dummy[MC33978_FRAME_LEN] __aligned(ARCH_DMA_MINALIGN);
+	u8 tx_pipe[MC33978_FRAME_LEN] __aligned(ARCH_DMA_MINALIGN);
+	u8 rx_resp[MC33978_FRAME_LEN] __aligned(ARCH_DMA_MINALIGN);
+};
+
+static void mc33978_irq_mask(struct irq_data *data)
+{
+	struct mc33978_core_data *cdata = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (hwirq < MC33978_NUM_IRQS) {
+		scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+			cdata->cached_pin_mask &= ~BIT(hwirq);
+			cdata->unmasked_since_sync &= ~BIT(hwirq);
+		}
+	}
+}
+
+static void mc33978_irq_unmask(struct irq_data *data)
+{
+	struct mc33978_core_data *cdata = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (hwirq < MC33978_NUM_IRQS) {
+		scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+			if (!(cdata->cached_pin_mask & BIT(hwirq))) {
+				/*
+				 * Don't add to cached_pin_mask yet to avoid race:
+				 * If event worker runs before bus_sync_unlock(),
+				 * it would see pin in mask but stale cached_pin_state,
+				 * causing spurious interrupt. Let bus_sync_unlock()
+				 * atomically update both mask and state.
+				 */
+				cdata->unmasked_since_sync |= BIT(hwirq);
+			}
+		}
+	}
+}
+
+static void mc33978_irq_bus_lock(struct irq_data *data)
+{
+	struct mc33978_core_data *cdata = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&cdata->irq_lock);
+}
+
+/* Sync cached IRQ mask to hardware IE_SG/IE_SP registers, then unlock */
+static void mc33978_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct mc33978_core_data *cdata = irq_data_get_irq_chip_data(data);
+	u32 sg_mask, sp_mask, cached_mask, unmasked;
+	int ret;
+
+	scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+		cached_mask = cdata->cached_pin_mask;
+		unmasked = cdata->unmasked_since_sync;
+		cdata->unmasked_since_sync = 0;
+	}
+
+	if (unmasked) {
+		u32 val;
+
+		ret = regmap_read(cdata->map, MC33978_REG_READ_IN, &val);
+		if (!ret) {
+			scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+				/*
+				 * Atomically update BOTH cached_pin_state and cached_pin_mask
+				 * to prevent race: if event worker runs after this point, it
+				 * will see consistent state (both mask and baseline updated).
+				 */
+				cdata->cached_pin_state = (cdata->cached_pin_state & ~unmasked) |
+							  (val & unmasked);
+				cdata->cached_pin_mask |= unmasked;
+			}
+		} else {
+			dev_err(&cdata->spi->dev, "failed to read pin state for sync: %d\n", ret);
+			scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+				cdata->cached_pin_mask |= unmasked;
+			}
+		}
+		cached_mask |= unmasked;
+	}
+
+	/*
+	 * Split the cached 22-bit pin mask into hardware register format:
+	 * - SG pins: bits [13:0] (14 pins, mask 0x3FFF)
+	 * - SP pins: bits [21:14] (8 pins, mask 0xFF)
+	 */
+	sg_mask = FIELD_GET(MC33978_SG_PIN_MASK, cached_mask);
+	sp_mask = FIELD_GET(MC33978_SP_PIN_MASK, cached_mask);
+
+	ret = regmap_update_bits(cdata->map, MC33978_REG_IE_SG,
+				 MC33978_IE_SG_MASK, sg_mask);
+	if (ret)
+		dev_err(&cdata->spi->dev, "failed to sync SG IRQ mask: %d\n", ret);
+
+	ret = regmap_update_bits(cdata->map, MC33978_REG_IE_SP,
+				 MC33978_IE_SP_MASK, sp_mask);
+	if (ret)
+		dev_err(&cdata->spi->dev, "failed to sync SP IRQ mask: %d\n", ret);
+
+	mutex_unlock(&cdata->irq_lock);
+}
+
+static int mc33978_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct mc33978_core_data *cdata = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u32 mask;
+
+	if (hwirq >= MC33978_NUM_IRQS)
+		return -EINVAL;
+
+	/*
+	 * Safe to use BIT(hwirq) with u32: we support 23 IRQs (0-22),
+	 * validated by check above. Using u32 for consistency with
+	 * irq_rise/irq_fall/cached_pin_mask fields.
+	 */
+	mask = BIT(hwirq);
+
+	if (type == IRQ_TYPE_NONE)
+		return -EINVAL;
+
+	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+		if (type & IRQ_TYPE_EDGE_RISING)
+			cdata->irq_rise |= mask;
+		else
+			cdata->irq_rise &= ~mask;
+
+		if (type & IRQ_TYPE_EDGE_FALLING)
+			cdata->irq_fall |= mask;
+		else
+			cdata->irq_fall &= ~mask;
+	}
+
+	return 0;
+}
+
+/*
+ * Wake support not implemented: calling irq_set_irq_wake() on the parent SPI
+ * IRQ from this callback causes lock ordering violations (genirq holds
+ * desc->lock while the parent's buslock may sleep). Configure wake on the SPI
+ * controller's interrupt line instead.
+ */
+
+static struct irq_chip mc33978_irq_chip = {
+	.name			= "mc33978",
+	.irq_mask		= mc33978_irq_mask,
+	.irq_unmask		= mc33978_irq_unmask,
+	.irq_bus_lock		= mc33978_irq_bus_lock,
+	.irq_bus_sync_unlock	= mc33978_irq_bus_sync_unlock,
+	.irq_set_type		= mc33978_irq_set_type,
+};
+
+static void mc33978_irq_setup(struct irq_domain *domain, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	struct mc33978_core_data *cdata = domain->host_data;
+
+	irq_domain_set_info(domain, virq, hwirq, &mc33978_irq_chip, cdata,
+			    handle_simple_irq, NULL, NULL);
+	irq_set_nested_thread(virq, 1);
+	irq_clear_status_flags(virq, IRQ_NOREQUEST | IRQ_NOPROBE);
+}
+
+static int mc33978_irq_map(struct irq_domain *d, unsigned int virq,
+			   irq_hw_number_t hw)
+{
+	mc33978_irq_setup(d, virq, hw);
+	return 0;
+}
+
+static int mc33978_irq_domain_alloc(struct irq_domain *domain,
+				    unsigned int virq,
+				    unsigned int nr_irqs, void *arg)
+{
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int i;
+
+	/*
+	 * MFD child devices (e.g. hwmon) are mapped via mfd_add_devices() ->
+	 * irq_create_mapping(), which strictly uses the .map callback
+	 * (mc33978_irq_map) and bypasses .alloc completely.
+	 * This .alloc callback is exclusively invoked by the hierarchical GPIO
+	 * irqchip in the pinctrl driver, which guarantees a valid fwspec in arg.
+	 */
+	if (!fwspec || fwspec->param_count < 1)
+		return -EINVAL;
+
+	hwirq = fwspec->param[0];
+
+	if (hwirq >= MC33978_NUM_IRQS ||
+	    nr_irqs > MC33978_NUM_IRQS - hwirq)
+		return -EINVAL;
+
+	for (i = 0; i < nr_irqs; i++)
+		mc33978_irq_setup(domain, virq + i, hwirq + i);
+
+	return 0;
+}
+
+static void mc33978_irq_domain_free(struct irq_domain *domain,
+				    unsigned int virq,
+				    unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_reset_irq_data(irq_domain_get_irq_data(domain,
+								  virq + i));
+}
+
+/*
+ * Dual-mode IRQ domain: supports both direct MFD child (hwmon via .map)
+ * and hierarchical child (pinctrl GPIO IRQ chip via .alloc). The .xlate
+ * translates DT 2-cell format (hwirq 0-22, type flags).
+ * IRQ_DOMAIN_FLAG_HIERARCHY enables the pinctrl hierarchical chain.
+ */
+static const struct irq_domain_ops mc33978_irq_domain_ops = {
+	.map	= mc33978_irq_map,
+	.alloc	= mc33978_irq_domain_alloc,
+	.free	= mc33978_irq_domain_free,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+static void mc33978_irq_domain_remove(void *data)
+{
+	struct mc33978_core_data *cdata = data;
+	struct irq_domain *domain = cdata->domain;
+	int hwirq;
+
+	/*
+	 * Must manually dispose mappings before irq_domain_remove().
+	 * Child platform_get_irq() creates mappings via irq_create_of_mapping().
+	 * devm_request_irq() only calls free_irq(), not irq_dispose_mapping().
+	 * irq_domain_remove() expects empty radix tree (has WARN_ON check).
+	 */
+	for (hwirq = 0; hwirq < MC33978_NUM_IRQS; hwirq++) {
+		unsigned int virq;
+
+		virq = irq_find_mapping(domain, hwirq);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(domain);
+}
+
+static u32 mc33978_compute_pin_events(u32 old_state, u32 new_state, u32 config_reg,
+				      u32 mask, u32 rise, u32 fall)
+{
+	u32 changed = (old_state ^ new_state) & mask;
+	u32 fired = 0;
+	u32 physical_new;
+
+	if (!changed)
+		return 0;
+
+	physical_new = mc33978_raw_to_physical_state(new_state, config_reg);
+
+	fired |= (changed & physical_new) & rise;
+	fired |= (changed & ~physical_new) & fall;
+
+	return fired;
+}
+
+static unsigned long mc33978_handle_pin_changes(struct mc33978_core_data *cdata,
+					       unsigned int pin_state,
+					       unsigned int config_reg)
+{
+	unsigned long fired_pins = 0;
+
+	scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+		fired_pins = mc33978_compute_pin_events(cdata->cached_pin_state,
+							pin_state,
+							config_reg,
+							cdata->cached_pin_mask,
+							cdata->irq_rise,
+							cdata->irq_fall);
+		cdata->cached_pin_state = pin_state;
+	}
+
+	return fired_pins;
+}
+
+/*
+ * Computes whether the fault interrupt should fire based on hardware state,
+ * transient evidence, and user IRQ configuration.
+ * Updates the cached fault state when a state change is detected.
+ */
+static bool mc33978_compute_fault_event(bool bus_active, bool *cached_active,
+					unsigned int hw_flags, u32 rise, u32 fall)
+{
+	bool changed = bus_active ^ *cached_active;
+	bool transient;
+
+	/*
+	 * Transient fault detection (§9.10.27): FAULT_STAT latches on fault
+	 * occurrence and persists until Fault register (0x42) read clears it.
+	 * Hwmon driver reads Fault register, which triggers regmap SPI read with
+	 * pipelined frames: REQ frame (old response, FAULT_STAT=1 latched) and
+	 * PIPE frame (Fault register response clears latch). If fault condition
+	 * cleared between latch and read, FAULT_STAT won't re-latch (datasheet:
+	 * "immediately set again if condition still present").
+	 *
+	 * Transient detection: hw_flags contains harvested FAULT_STAT bit
+	 * (latched evidence from REQ frame), but bus_active=0 and
+	 * cached_active=0 (PIPE frame showed cleared, condition gone).
+	 * This proves brief fault (VBATP voltage glitch, threshold oscillation)
+	 * occurred and cleared before Fault register read. Edge-triggered
+	 * consumers need this event notification.
+	 *
+	 * WAKE_BIT exclusion: WAKE_BIT is synthetic (bus_active changes),
+	 * not hardware evidence. Including it causes phantom transients when
+	 * normal faults deassert (WAKE_BIT present but no actual transient).
+	 */
+	transient = !changed && !bus_active && !(*cached_active) &&
+		    (hw_flags & MC33978_HI_BYTE_STAT_FAULT);
+
+	if (changed)
+		*cached_active = bus_active;
+
+	if (!changed && !transient)
+		return false;
+
+	if (transient) {
+		/*
+		 * Transient pulse: both edges occurred. Dispatch once if
+		 * any edge is enabled. Dispatching both edges separately
+		 * would incorrectly report two interrupts for one event.
+		 */
+		return (rise | fall) & BIT(MC33978_HWIRQ_FAULT);
+	}
+
+	/* Normal edge */
+	if ((bus_active && (rise & BIT(MC33978_HWIRQ_FAULT))) ||
+	    (!bus_active && (fall & BIT(MC33978_HWIRQ_FAULT))))
+		return true;
+
+	return false;
+}
+
+/*
+ * Fault Signaling Variants (hwirq 22, consumed by hwmon driver):
+ *
+ * The driver distinguishes three fault event types based on timing and
+ * hardware FAULT_STAT latch behavior:
+ *
+ * 1. Sustained Fault Edges (normal operation):
+ *    - Fault persists through detection cycle
+ *    - Rising edge: fault_active=1, cached_fault=0 -> dispatch if rise enabled
+ *    - Falling edge: fault_active=0, cached_fault=1 -> dispatch if fall enabled
+ *    - Example: Overtemperature condition that lasts seconds
+ *
+ * 2. Transient Fault (brief pulse <1ms):
+ *    - Fault occurs and clears before Fault register (0x42) read
+ *    - Detection: hw_flags contains FAULT_STAT bit (latched evidence from
+ *      pipelined SPI REQ frame), but both fault_active=0 and cached_fault=0
+ *      (PIPE frame showed condition cleared)
+ *    - Dispatch: Single IRQ if ANY edge enabled (represents both edges)
+ *    - Example: VBATP voltage glitch during inductive load switching, or fault
+ *      clears coincidentally between SPI frames (threshold boundary oscillation)
+ *    - Rationale: Without preserving FAULT_STAT bit, these events are invisible
+ *
+ * 3. No Event (filtered):
+ *    - Fault state unchanged (fault_active == cached_fault) AND no transient
+ *      evidence in hw_flags
+ *    - Common during polling: hardware still overtemp, state already reflected
+ *    - No IRQ dispatch (prevents duplicate notifications)
+ *
+ * State Tracking:
+ * - bus_fault_active: Live FAULT_STAT from most recent SPI response
+ * - cached_fault_active: Last fault state dispatched to consumer
+ * - hw_flags: Accumulated FAULT_STAT bits from pipelined SPI (transient evidence)
+ *
+ * Edge Configuration:
+ * - Consumers use irq_set_irq_type(virq, IRQ_TYPE_EDGE_RISING/FALLING/BOTH)
+ * - Level types rejected (hardware limitation: edge-only assertion)
+ * - Masking via disable_irq() prevents dispatch but harvesting continues
+ */
+static bool mc33978_handle_fault_condition(struct mc33978_core_data *cdata,
+					   unsigned int hw_flags)
+{
+	bool bus_fault_active, fire_irq;
+	u32 rise, fall, mask;
+
+	scoped_guard(raw_spinlock_irqsave, &cdata->irq_state_lock) {
+		rise = cdata->irq_rise;
+		fall = cdata->irq_fall;
+		mask = cdata->cached_pin_mask;
+	}
+
+	scoped_guard(spinlock_irqsave, &cdata->state_lock) {
+		bus_fault_active = cdata->bus_fault_active;
+
+		/*
+		 * Always sync cached_fault_active with bus state,
+		 * even when IRQ is masked. This prevents infinite harvesting
+		 * loop when fault occurs while IRQ is disabled.
+		 */
+		if (!(mask & BIT(MC33978_HWIRQ_FAULT))) {
+			cdata->cached_fault_active = bus_fault_active;
+			return false;
+		}
+
+		fire_irq = mc33978_compute_fault_event(bus_fault_active,
+						       &cdata->cached_fault_active,
+						       hw_flags, rise, fall);
+	}
+
+	return fire_irq;
+}
+
+static void mc33978_process_single_event(struct mc33978_core_data *cdata)
+{
+	unsigned int harvested;
+	unsigned int pin_state;
+	unsigned long fired_pins = 0;
+	bool fire_fault = false;
+	int ret;
+	int i, virq;
+
+	/*
+	 * Grab harvested_flags BEFORE hardware read. Flags harvested during
+	 * the read trigger another loop pass. This intentionally forces a
+	 * redundant SPI read on most interrupts, but is necessary to prevent
+	 * lost events when concurrent regmap access races with IRQ thread
+	 * (hardware has clear-on-read INT_flg).
+	 */
+	harvested = atomic_xchg(&cdata->harvested_flags, 0);
+
+	scoped_guard(mutex, &cdata->irq_lock) {
+		unsigned int config_reg = 0;
+
+		ret = regmap_read(cdata->map, MC33978_REG_READ_IN, &pin_state);
+		if (ret) {
+			dev_err_ratelimited(&cdata->spi->dev, "failed to read pin state: %d\n",
+					    ret);
+		} else {
+			if (cdata->cached_pin_mask & MC33978_SP_PIN_MASK) {
+				ret = regmap_read(cdata->map, MC33978_REG_CONFIG, &config_reg);
+				if (ret)
+					dev_err_ratelimited(&cdata->spi->dev, "failed to read config reg: %d\n", ret);
+			}
+			fired_pins = mc33978_handle_pin_changes(cdata, pin_state, config_reg);
+		}
+	}
+
+	fire_fault = mc33978_handle_fault_condition(cdata, harvested);
+
+	/* Dispatch virtual IRQs for any fired events */
+	for_each_set_bit(i, &fired_pins, MC33978_NUM_PINS) {
+		virq = irq_find_mapping(cdata->domain, i);
+		if (virq)
+			handle_nested_irq(virq);
+	}
+
+	if (fire_fault) {
+		virq = irq_find_mapping(cdata->domain, MC33978_HWIRQ_FAULT);
+		if (virq)
+			handle_nested_irq(virq);
+	}
+}
+
+static void mc33978_handle_events(struct mc33978_core_data *cdata)
+{
+	unsigned long burst_end;
+
+	guard(mutex)(&cdata->event_lock);
+
+	/*
+	 * Process events in time-bounded bursts to prevent CPU monopolization
+	 * on high-frequency signals. Allow 10ms of processing per invocation,
+	 * then reschedule if more events remain. This supports kHz square wave
+	 * measurement while preventing infinite loops during module removal.
+	 *
+	 * 10ms @ 1ms SPI latency = ~10 events/burst, adequate for responsiveness
+	 * while preventing soft lockups. Remaining events trigger rescheduling.
+	 */
+	burst_end = jiffies + msecs_to_jiffies(10);
+
+	do {
+		mc33978_process_single_event(cdata);
+
+		/* Check teardown flag: allows module removal to complete */
+		scoped_guard(spinlock_irqsave, &cdata->state_lock) {
+			if (cdata->tearing_down)
+				return;
+		}
+
+		/* Yield CPU if time slice exhausted and reschedule remaining work */
+		if (time_after(jiffies, burst_end) &&
+		    atomic_read(&cdata->harvested_flags)) {
+			schedule_work(&cdata->event_work);
+			return;
+		}
+	} while (atomic_read(&cdata->harvested_flags) != 0);
+}
+
+static irqreturn_t mc33978_irq_thread(int irq, void *data)
+{
+	mc33978_handle_events(data);
+
+	return IRQ_HANDLED;
+}
+
+static void mc33978_teardown(void *data)
+{
+	struct mc33978_core_data *cdata = data;
+
+	/*
+	 * Set teardown flag before cancel_work_sync(). Prevents debugfs
+	 * regmap reads from rescheduling work after cancellation during
+	 * the devres LIFO teardown window.
+	 */
+	scoped_guard(spinlock_irqsave, &cdata->state_lock) {
+		cdata->tearing_down = true;
+	}
+
+	cancel_work_sync(&cdata->event_work);
+}
+
+static int mc33978_irq_init(struct mc33978_core_data *cdata,
+			    struct fwnode_handle *fwnode)
+{
+	struct device *dev = &cdata->spi->dev;
+	int ret;
+
+	mutex_init(&cdata->irq_lock);
+
+	/*
+	 * Create IRQ domain with 23 interrupts:
+	 * - hwirq 0-21: Pin change interrupts (22 pins)
+	 * - hwirq 22: Fault interrupt (for hwmon driver)
+	 */
+	cdata->domain = irq_domain_create_linear(fwnode, MC33978_NUM_IRQS,
+						 &mc33978_irq_domain_ops, cdata);
+	if (!cdata->domain)
+		return dev_err_probe(dev, -ENOMEM, "failed to create IRQ domain\n");
+
+	/*
+	 * Use DOMAIN_BUS_NEXUS to distinguish this intermediate demux domain
+	 * from child domains sharing the same fwnode. Matches the pattern used
+	 * by other MFD drivers (e.g., crystalcove).
+	 */
+	irq_domain_update_bus_token(cdata->domain, DOMAIN_BUS_NEXUS);
+
+	/*
+	 * Enable hierarchical IRQ domain support for pinctrl's GPIO IRQ chip.
+	 * See mc33978_irq_domain_ops for detailed architecture explanation.
+	 */
+	cdata->domain->flags |= IRQ_DOMAIN_FLAG_HIERARCHY;
+
+	ret = devm_add_action_or_reset(dev, mc33978_irq_domain_remove, cdata);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void mc33978_event_work(struct work_struct *work)
+{
+	struct mc33978_core_data *cdata =
+		container_of(work, struct mc33978_core_data, event_work);
+
+	mc33978_handle_events(cdata);
+}
+
+/*
+ * Status Harvesting: Opportunistic Event Detection
+ *
+ * The hardware embeds volatile status bits (FAULT_STAT, INT_flg) in the high
+ * byte of almost every SPI response. These bits are harvested from all regmap
+ * operations (reads, writes, any register) to detect events regardless of
+ * which code path triggered the SPI transaction.
+ *
+ * Rationale for Harvesting All Traffic:
+ *
+ * The INT_flg bit is clear-on-read: any SPI transaction clears it, even if
+ * unrelated to interrupt handling. On shared IRQ lines, another driver's
+ * regmap access could clear INT_flg before this driver's IRQ thread runs,
+ * making it impossible to determine if this device triggered the interrupt.
+ * Harvesting INT_flg from all traffic ensures we see it before it's cleared.
+ *
+ * Current Usage:
+ *
+ * The driver does NOT use IRQF_SHARED (see mc33978_core_init comment), so
+ * shared IRQ protection is currently defensive/future-proofing. The harvesting
+ * architecture supports shared IRQs if the design changes.
+ *
+ * The Fault register (0x42) is marked volatile+precious in regmap config,
+ * which excludes it from regmap debugfs dumps, so unintended side effects
+ * from debug inspection cannot occur. Harvesting still applies to intentional
+ * Fault register reads from the hwmon driver.
+ *
+ * Harvesting Call Sites:
+ * - mc33978_spi_write(): Single frame (1 harvest from response)
+ * - mc33978_spi_read(): Pipelined (2 harvests: REQ frame + PIPE frame)
+ */
+static void mc33978_harvest_status(struct mc33978_core_data *cdata, int status)
+{
+	bool fault_active;
+	bool should_schedule;
+
+	fault_active = !!(status & MC33978_HI_BYTE_STAT_FAULT);
+
+	guard(spinlock_irqsave)(&cdata->state_lock);
+
+	cdata->bus_fault_active = fault_active;
+
+	/*
+	 * If the bus state changed from what the IRQ thread last
+	 * evaluated, wake it up using a synthetic software bit to avoid
+	 * overloading the hardware STAT_FAULT bit and causing phantom
+	 * transient faults.
+	 */
+	if (fault_active != cdata->cached_fault_active)
+		atomic_or(MC33978_HARVEST_WAKE_BIT,
+			  &cdata->harvested_flags);
+
+	if (status & MC33978_HI_BYTE_STAT_INT)
+		atomic_or(MC33978_HI_BYTE_STAT_INT, &cdata->harvested_flags);
+
+	/*
+	 * Preserve FAULT_STAT bit for transient detection: FAULT_STAT is sticky
+	 * (latched until Fault register read). When hwmon reads Fault register,
+	 * pipelined SPI produces two harvest calls: first with FAULT_STAT=1
+	 * (latched evidence), second with FAULT_STAT=0 (if condition cleared).
+	 * Transient detection needs the harvested FAULT_STAT bit as proof the
+	 * fault occurred, even if condition cleared before work runs.
+	 *
+	 * To prevent infinite soft lockups on sustained faults, we ONLY harvest
+	 * FAULT_STAT if the fault is not yet known to be active by the worker
+	 * (cached_fault_active == false). If cached_fault_active is true, we
+	 * already dispatched the edge and don't need evidence for transients.
+	 */
+	if ((status & MC33978_HI_BYTE_STAT_FAULT) && !cdata->cached_fault_active)
+		atomic_or(MC33978_HI_BYTE_STAT_FAULT, &cdata->harvested_flags);
+
+	should_schedule = cdata->irq_ready && !cdata->tearing_down &&
+			  atomic_read(&cdata->harvested_flags);
+
+	/*
+	 * Schedule work inside lock: prevent TOCTOU race where teardown frees cdata
+	 * after tearing_down check but before schedule_work() executes.
+	 */
+	if (should_schedule)
+		schedule_work(&cdata->event_work);
+}
+
+/*
+ * Initialize persistent SPI messages.
+ * Write: 1 frame. Read: 2 frames (MISO lags by 1 frame, needs dummy fetch).
+ */
+static void mc33978_prepare_messages(struct mc33978_core_data *cdata)
+{
+	/* --- Prepare Write Message (1 Frame) --- */
+	spi_message_init(&cdata->msg_write);
+
+	cdata->xfer_write.tx_buf = cdata->tx_req;
+	cdata->xfer_write.rx_buf = cdata->rx_dummy;
+	cdata->xfer_write.len = MC33978_FRAME_LEN;
+
+	spi_message_add_tail(&cdata->xfer_write, &cdata->msg_write);
+
+	/* --- Prepare Read Message (2 Frames) --- */
+	spi_message_init(&cdata->msg_read);
+
+	/* Frame 1: Request */
+	cdata->xfer_read[MC33978_FRAME_REQ].tx_buf =
+		cdata->tx_req;
+	cdata->xfer_read[MC33978_FRAME_REQ].rx_buf =
+		cdata->rx_dummy;
+	cdata->xfer_read[MC33978_FRAME_REQ].len = MC33978_FRAME_LEN;
+	/*
+	 * Latch command with explicit CS inactive delay. Per datasheet timing
+	 * specification, minimum CS inactive time (t_CSH) is 500ns. Use 1us.
+	 */
+	cdata->xfer_read[MC33978_FRAME_REQ].cs_change = 1;
+	cdata->xfer_read[MC33978_FRAME_REQ].cs_change_delay.value = 1;
+	cdata->xfer_read[MC33978_FRAME_REQ].cs_change_delay.unit = SPI_DELAY_UNIT_USECS;
+
+	/* Frame 2: Fetch (Dummy READ_IN) */
+	cdata->xfer_read[MC33978_FRAME_PIPE].tx_buf =
+		cdata->tx_pipe;
+	cdata->xfer_read[MC33978_FRAME_PIPE].rx_buf =
+		cdata->rx_resp;
+	cdata->xfer_read[MC33978_FRAME_PIPE].len = MC33978_FRAME_LEN;
+
+	/* Preload the dummy READ_IN command statically */
+	cdata->tx_pipe[MC33978_FRAME_CMD] = MC33978_REG_READ_IN;
+
+	spi_message_add_tail(&cdata->xfer_read[MC33978_FRAME_REQ], &cdata->msg_read);
+	spi_message_add_tail(&cdata->xfer_read[MC33978_FRAME_PIPE], &cdata->msg_read);
+}
+
+/**
+ * mc33978_rx_decode() - Decode and validate SPI response frame
+ * @rx_frame: Received SPI frame (4 bytes)
+ * @val_buf: Output buffer for register value (3 bytes), or NULL if not needed
+ * @expected_cmd: Command byte to validate, or MC33978_CMD_INVALID to skip
+ *
+ * Decodes 4-byte SPI frame to 3-byte regmap payload and extracts status bits.
+ * Validates echoed command to detect SPI bus faults (stuck MISO, disconnected
+ * chip). Validation skipped when expected_cmd == MC33978_CMD_INVALID (relaxed
+ * strategy - see mc33978_spi_write/read for rationale).
+ *
+ * Semi-global status flags (§9.10.27): FAULT_STAT and INT_flg bits are
+ * returned in most responses, except REG_CHECK and REG_WET_* registers.
+ *
+ * Return: Status bits (MC33978_HI_BYTE_STATUS_MASK) if present,
+ *         -ENODATA if register has no status bits,
+ *         -EIO if command echo validation failed
+ */
+static int mc33978_rx_decode(const u8 *rx_frame, u8 *val_buf, u8 expected_cmd)
+{
+	u8 cmd = rx_frame[MC33978_FRAME_CMD] & ~MC33978_CMD_BYTE_WRITE;
+	bool has_status;
+	u8 status = 0;
+
+	/* Validate echoed command if caller provided expected value */
+	if (expected_cmd != MC33978_CMD_INVALID) {
+		u8 expected = expected_cmd & ~MC33978_CMD_BYTE_WRITE;
+
+		if (cmd != expected)
+			return -EIO;
+	}
+
+	switch (cmd) {
+	case MC33978_REG_CHECK:
+	case MC33978_REG_WET_SP:
+	case MC33978_REG_WET_SG0:
+	case MC33978_REG_WET_SG1:
+		has_status = false;
+		break;
+	default:
+		has_status = true;
+		break;
+	}
+
+	if (has_status)
+		status = rx_frame[MC33978_FRAME_DATA_HI] &
+						MC33978_HI_BYTE_STATUS_MASK;
+
+	if (val_buf) {
+		memcpy(val_buf, &rx_frame[MC33978_FRAME_DATA_HI],
+		       MC33978_PAYLOAD_LEN);
+
+		if (has_status)
+			val_buf[MC33978_PAYLOAD_HI] &= MC33978_HI_BYTE_DATA_MASK;
+	}
+
+	return has_status ? status : -ENODATA;
+}
+
+static int mc33978_spi_write(void *ctx, const void *data, size_t count)
+{
+	struct mc33978_core_data *cdata = ctx;
+	int status;
+	int ret;
+
+	if (count != MC33978_FRAME_LEN)
+		return -EINVAL;
+
+	memcpy(cdata->tx_req, data, MC33978_FRAME_LEN);
+
+	ret = spi_sync(cdata->spi, &cdata->msg_write);
+	if (ret)
+		return ret;
+
+	/*
+	 * Relaxed validation: Skip echo check (would need prev cmd tracking).
+	 * Pipelining means RX contains previous transaction's response.
+	 * Tradeoff: simplicity/performance vs full validation. Hardware failures
+	 * still caught via read PIPE validation and CHECK register at init.
+	 */
+	status = mc33978_rx_decode(cdata->rx_dummy, NULL,
+				   MC33978_CMD_INVALID);
+
+	if (status >= 0)
+		mc33978_harvest_status(cdata, status);
+
+	return 0;
+}
+
+static int mc33978_spi_read(void *ctx, const void *reg_buf, size_t reg_size,
+			    void *val_buf, size_t val_size)
+{
+	struct mc33978_core_data *cdata = ctx;
+	int status_req, status_pipe;
+	u8 reg;
+	int ret;
+
+	if (reg_size != 1 || val_size != MC33978_PAYLOAD_LEN)
+		return -EINVAL;
+
+	memset(&cdata->tx_req[MC33978_FRAME_DATA_HI], 0,
+	       MC33978_PAYLOAD_LEN);
+	reg = ((const u8 *)reg_buf)[0];
+	cdata->tx_req[MC33978_FRAME_CMD] = reg;
+
+	ret = spi_sync(cdata->spi, &cdata->msg_read);
+	if (ret)
+		return ret;
+
+	/*
+	 * REQ frame validation: Skip echo check because pipelining means this
+	 * frame contains the PREVIOUS transaction's response, not the current
+	 * register being read. Only PIPE frame can be validated (see below).
+	 */
+	status_req = mc33978_rx_decode(cdata->rx_dummy, NULL,
+				       MC33978_CMD_INVALID);
+
+	/*
+	 * PIPE frame validation: Contains response to REQ frame command.
+	 * We transmit dummy READ_IN in PIPE, but receive echoed 'reg' from REQ.
+	 */
+	status_pipe = mc33978_rx_decode(cdata->rx_resp,
+					val_buf, reg);
+	if (status_pipe == -EIO) {
+		dev_err_ratelimited(&cdata->spi->dev, "PIPE frame cmd echo mismatch\n");
+		return -EIO;
+	}
+
+	if (status_req >= 0)
+		mc33978_harvest_status(cdata, status_req);
+	if (status_pipe >= 0)
+		mc33978_harvest_status(cdata, status_pipe);
+
+	return 0;
+}
+
+static const struct regmap_bus mc33978_regmap_bus = {
+	.read = mc33978_spi_read,
+	.write = mc33978_spi_write,
+};
+
+static const struct regmap_range mc33978_volatile_range[] = {
+	regmap_reg_range(MC33978_REG_ENTER_LPM, MC33978_REG_ENTER_LPM),
+	regmap_reg_range(MC33978_REG_READ_IN, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_volatile_table = {
+	.yes_ranges = mc33978_volatile_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_volatile_range),
+};
+
+static const struct regmap_range mc33978_precious_range[] = {
+	regmap_reg_range(MC33978_REG_ENTER_LPM, MC33978_REG_ENTER_LPM),
+	regmap_reg_range(MC33978_REG_READ_IN, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_precious_table = {
+	.yes_ranges = mc33978_precious_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_precious_range),
+};
+
+/*
+ * NOTE: Need to fake REG_ENTER_LPM, REG_IRQ and REG_RESET as readable, so
+ * regcache will NOT write them on a cache sync. Sounds counterintuitive, but
+ * marking a reg as "precious" or "volatile" is the only way to avoid this,
+ * and that works only with readable regs.
+ */
+static const struct regmap_range mc33978_readable_range[] = {
+	regmap_reg_range(MC33978_REG_CHECK, MC33978_REG_WET_SG1),
+	regmap_reg_range(MC33978_REG_CWET_SP, MC33978_REG_ENTER_LPM),
+	regmap_reg_range(MC33978_REG_AMUX_CTRL, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_readable_table = {
+	.yes_ranges = mc33978_readable_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_readable_range),
+};
+
+static const struct regmap_range mc33978_writable_range[] = {
+	regmap_reg_range(MC33978_REG_CONFIG, MC33978_REG_WET_SG1),
+	regmap_reg_range(MC33978_REG_CWET_SP, MC33978_REG_AMUX_CTRL),
+	regmap_reg_range(MC33978_REG_IRQ, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_writable_table = {
+	.yes_ranges = mc33978_writable_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_writable_range),
+};
+
+static const struct regmap_config mc33978_regmap_config = {
+	.name = "mc33978",
+	.reg_bits = 8,
+	.val_bits = 24,
+	.reg_stride = 2,
+	.write_flag_mask = MC33978_CMD_BYTE_WRITE,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.use_single_read = true,
+	.use_single_write = true,
+	.volatile_table = &mc33978_volatile_table,
+	.precious_table = &mc33978_precious_table,
+	.rd_table = &mc33978_readable_table,
+	.wr_table = &mc33978_writable_table,
+	.cache_type = REGCACHE_MAPLE,
+	.max_register = MC33978_REG_RESET,
+};
+
+/* Verify SPI communication via CHECK register signature (0x123456) */
+static int mc33978_check_device(struct mc33978_core_data *cdata)
+{
+	struct device *dev = &cdata->spi->dev;
+	unsigned int check;
+	int ret;
+
+	ret = regmap_read(cdata->map, MC33978_REG_CHECK, &check);
+	if (ret)
+		return ret;
+
+	if (check != MC33978_CHECK_SIGNATURE)
+		return dev_err_probe(dev, -ENODEV,
+				     "SPI check failed. Expected: 0x%06x, got: 0x%06x\n",
+				     MC33978_CHECK_SIGNATURE, check);
+
+	return 0;
+}
+
+/**
+ * mc33978_core_init() - Initialize core functionality
+ * @dev: Parent device (for devm allocation)
+ * @spi: SPI device (already powered)
+ * @domain_out: Returns created IRQ domain
+ *
+ * Called by MFD driver to initialize regmap, IRQ domain, and event handling.
+ * All resources are devm-managed and tied to @dev lifecycle.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int mc33978_core_init(struct device *dev, struct spi_device *spi,
+		      struct irq_domain **domain_out)
+{
+	struct fwnode_handle *fwnode;
+	struct mc33978_core_data *cdata;
+	int ret;
+
+	/* Initialize output parameter to NULL for error paths */
+	*domain_out = NULL;
+
+	fwnode = dev_fwnode(dev);
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV, "missing firmware node\n");
+
+	cdata = devm_kzalloc(dev, sizeof(*cdata), GFP_KERNEL);
+	if (!cdata)
+		return -ENOMEM;
+
+	cdata->spi = spi;
+
+	mutex_init(&cdata->event_lock);
+	mutex_init(&cdata->irq_lock);
+	spin_lock_init(&cdata->state_lock);
+	raw_spin_lock_init(&cdata->irq_state_lock);
+
+	INIT_WORK(&cdata->event_work, mc33978_event_work);
+
+	mc33978_prepare_messages(cdata);
+
+	ret = mc33978_irq_init(cdata, fwnode);
+	if (ret)
+		return ret;
+
+	cdata->map = devm_regmap_init(dev, &mc33978_regmap_bus, cdata,
+				      &mc33978_regmap_config);
+	if (IS_ERR(cdata->map))
+		return dev_err_probe(dev, PTR_ERR(cdata->map),
+				     "failed to initialize regmap\n");
+
+	/*
+	 * Register teardown action to cancel event_work before resource cleanup.
+	 * Critical devm LIFO ordering (registered AFTER regmap/IRQ init above):
+	 *
+	 * Teardown sequence:
+	 * 1. MFD: devm_mfd_add_devices() cleanup
+	 *    - Child devices removed, child IRQ handlers freed
+	 * 2. THIS MODULE: devm_request_threaded_irq() cleanup (below)
+	 *    - Parent IRQ handler freed, stops new event triggers
+	 * 3. THIS ACTION: mc33978_teardown() via devm_add_action
+	 *    - Calls cancel_work_sync(&cdata->event_work)
+	 * 4. THIS MODULE: devm_regmap_init() cleanup (above)
+	 *    - Regmap destroyed
+	 * 5. THIS MODULE: devm_add_action(mc33978_irq_domain_remove) in
+	 *    mc33978_irq_init()
+	 *    - IRQ domain removed
+	 *
+	 * event_work (via mc33978_handle_events) accesses both cdata->map and
+	 * cdata->domain. Registering this action AFTER their creation but BEFORE
+	 * devm_request_threaded_irq() ensures LIFO cleanup: work is canceled in
+	 * step 3, guaranteeing no worker is running when resources are destroyed
+	 * in steps 4-5.
+	 *
+	 * Additionally, mc33978_teardown() sets tearing_down flag to prevent
+	 * debugfs regmap operations from rescheduling work after cancellation.
+	 */
+	ret = devm_add_action_or_reset(dev, mc33978_teardown, cdata);
+	if (ret)
+		return ret;
+
+	ret = mc33978_check_device(cdata);
+	if (ret)
+		return ret;
+
+	/*
+	 * POR state (§9.10.27): After power-on reset, both FAULT_STAT and
+	 * INT_flg are set high. These will be harvested during initialization
+	 * but discarded (no child IRQ handlers registered yet). Disable
+	 * interrupts before priming to prevent storms during state setup.
+	 */
+	ret = regmap_write(cdata->map, MC33978_REG_IE_SP, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(cdata->map, MC33978_REG_IE_SG, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Prime the cached pin state under lock to prevent spurious events.
+	 * Work scheduling is disabled (irq_ready=false) to prevent the work
+	 * feedback loop that would occur during init: regmap_read() harvests
+	 * status -> schedules work -> work does regmap_read() -> schedules more
+	 * work -> infinite loop on single-core systems where work monopolizes
+	 * CPU before init can complete.
+	 */
+	scoped_guard(mutex, &cdata->event_lock) {
+		ret = regmap_read(cdata->map, MC33978_REG_READ_IN,
+				  &cdata->cached_pin_state);
+	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read initial pin state\n");
+
+	/*
+	 * Clear stale flags harvested during initialization. Regmap operations
+	 * above (IE_* writes, READ_IN read) harvested POR status flags while
+	 * irq_ready was false, preventing work scheduling.
+	 *
+	 * Note: Userspace debugfs reads of regmap registers between
+	 * devm_regmap_init() and this point will also harvest flags, but
+	 * irq_ready=false prevents work scheduling. This is safe and the minor
+	 * CPU load from debugfs access during probe can be ignored.
+	 *
+	 * These flags would be automatically discarded by mask checks (all IRQs
+	 * masked until child drivers probe), but clearing them explicitly avoids
+	 * unnecessary work scheduling and processing overhead.
+	 */
+	atomic_set(&cdata->harvested_flags, 0);
+
+	if (spi->irq <= 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "no valid IRQ provided for INT_B pin\n");
+
+	/*
+	 * Not using IRQF_SHARED: threaded handler with IRQF_ONESHOT may hold
+	 * line masked too long on slow SPI, making shared operation impractical.
+	 */
+	ret = devm_request_threaded_irq(dev, spi->irq,
+					NULL,
+					mc33978_irq_thread,
+					IRQF_ONESHOT,
+					dev_name(dev), cdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+
+	/*
+	 * Enable work scheduling now that IRQ handler is registered.
+	 * This prevents the work feedback loop during initialization while
+	 * allowing proper event processing after setup completes.
+	 */
+	scoped_guard(spinlock_irqsave, &cdata->state_lock)
+		cdata->irq_ready = true;
+
+	/* Return IRQ domain for MFD to use */
+	*domain_out = cdata->domain;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mc33978_core_init);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 Core Module");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/mc33978.h b/include/linux/mfd/mc33978.h
new file mode 100644
index 000000000000..0a314ad29edf
--- /dev/null
+++ b/include/linux/mfd/mc33978.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 David Jander <david@protonic.nl>, Protonic Holland
+ * Copyright (C) 2026 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ *
+ * MC34978/MC33978 Multiple Switch Detection Interface - Shared Definitions
+ */
+
+#ifndef _LINUX_MFD_MC33978_H
+#define _LINUX_MFD_MC33978_H
+
+#include <linux/bits.h>
+
+/* Register Map - All addresses are base command bytes (R/W bit = 0) */
+/* SPI communication check */
+#define MC33978_REG_CHECK		0x00
+/* Device configuration */
+#define MC33978_REG_CONFIG		0x02
+/* Tri-state enable SP */
+#define MC33978_REG_TRI_SP		0x04
+/* Tri-state enable SG */
+#define MC33978_REG_TRI_SG		0x06
+/* Wetting current level SP */
+#define MC33978_REG_WET_SP		0x08
+/* Wetting current level SG0 (SG7-SG0) */
+#define MC33978_REG_WET_SG0		0x0a
+/* Wetting current level SG1 (SG13-SG8) */
+#define MC33978_REG_WET_SG1		0x0c
+/* Continuous wetting current SP */
+#define MC33978_REG_CWET_SP		0x16
+/* Continuous wetting current SG */
+#define MC33978_REG_CWET_SG		0x18
+/* Interrupt enable SP */
+#define MC33978_REG_IE_SP		0x1a
+/* Interrupt enable SG */
+#define MC33978_REG_IE_SG		0x1c
+/* Low-power mode configuration */
+#define MC33978_REG_LPM_CONFIG		0x1e
+/* Wake-up enable SP */
+#define MC33978_REG_WAKE_SP		0x20
+/* Wake-up enable SG */
+#define MC33978_REG_WAKE_SG		0x22
+/* Comparator only mode SP */
+#define MC33978_REG_COMP_SP		0x24
+/* Comparator only mode SG */
+#define MC33978_REG_COMP_SG		0x26
+/* LPM voltage threshold SP */
+#define MC33978_REG_LPM_VT_SP		0x28
+/* LPM voltage threshold SG */
+#define MC33978_REG_LPM_VT_SG		0x2a
+/* Polling current SP */
+#define MC33978_REG_IP_SP		0x2c
+/* Polling current SG */
+#define MC33978_REG_IP_SG		0x2e
+/* Slow polling SP */
+#define MC33978_REG_SPOLL_SP		0x30
+/* Slow polling SG */
+#define MC33978_REG_SPOLL_SG		0x32
+/* Wake-up debounce SP */
+#define MC33978_REG_WDEB_SP		0x34
+/* Wake-up debounce SG */
+#define MC33978_REG_WDEB_SG		0x36
+/* Enter low-power mode (write-only) */
+#define MC33978_REG_ENTER_LPM		0x38
+/* AMUX control */
+#define MC33978_REG_AMUX_CTRL		0x3a
+/* Read switch status (READ_SW in datasheet) */
+#define MC33978_REG_READ_IN		0x3e
+/* Fault status register */
+#define MC33978_REG_FAULT		0x42
+/* Interrupt request (write-only) */
+#define MC33978_REG_IRQ			0x46
+/* Reset (write-only) */
+#define MC33978_REG_RESET		0x48
+
+/*
+ * FAULT Register (0x42) bit definitions
+ * Reading this register clears most fault flags except persistent conditions
+ */
+/* SPI communication error */
+#define MC33978_FAULT_SPI_ERROR		BIT(10)
+/* SPI register hash mismatch */
+#define MC33978_FAULT_HASH		BIT(9)
+/* VBATP undervoltage */
+#define MC33978_FAULT_UV		BIT(7)
+/* VBATP overvoltage */
+#define MC33978_FAULT_OV		BIT(6)
+/* Temperature warning threshold */
+#define MC33978_FAULT_TEMP_WARN		BIT(5)
+/* Over-temperature */
+#define MC33978_FAULT_OT		BIT(4)
+/* Woken by INT_B pin */
+#define MC33978_FAULT_INTB_WAKE		BIT(3)
+/* Woken by WAKE_B pin */
+#define MC33978_FAULT_WAKEB_WAKE	BIT(2)
+/* Woken by SPI message */
+#define MC33978_FAULT_SPI_WAKE		BIT(1)
+/* Power-on reset occurred */
+#define MC33978_FAULT_POR		BIT(0)
+
+/* Critical faults that need immediate attention */
+#define MC33978_FAULT_CRITICAL		(MC33978_FAULT_UV | \
+					 MC33978_FAULT_OV | \
+					 MC33978_FAULT_OT)
+
+/* Bits relevant as hwmon alarms; excludes wake/reset/SPI status bits */
+#define MC33978_FAULT_ALARM_MASK	(MC33978_FAULT_UV | \
+					 MC33978_FAULT_OV | \
+					 MC33978_FAULT_TEMP_WARN | \
+					 MC33978_FAULT_OT)
+
+#define MC33978_NUM_PINS		22
+#define MC33978_NUM_SG_PINS		14
+#define MC33978_NUM_SP_PINS		8
+
+/*
+ * Bit positions and shifts for pin groups in 22-bit representation.
+ * SG (Switch-to-Ground) pins are in the lower bits, SP (Programmable) in upper.
+ */
+#define MC33978_SG_SHIFT		0
+#define MC33978_SP_SHIFT		MC33978_NUM_SG_PINS
+
+/*
+ * Logical pin position masks (22-bit representation):
+ * - SG pins occupy bits [13:0] (14 pins)
+ * - SP pins occupy bits [21:14] (8 pins)
+ * Use these for manipulating cached state, checking pin types, etc.
+ */
+#define MC33978_SG_PIN_MASK		GENMASK(MC33978_NUM_SG_PINS - 1, 0)
+#define MC33978_SP_PIN_MASK		GENMASK(MC33978_NUM_PINS - 1, MC33978_NUM_SG_PINS)
+
+/*
+ * Hardware interrupt enable register bit masks:
+ * - IE_SG register: 14-bit field [13:0] for SG0-SG13
+ * - IE_SP register: 8-bit field [7:0] for SP0-SP7
+ * Use these when writing to IE_SG/IE_SP registers with regmap_update_bits().
+ * Note: IE_SG mask is identical to SG_PIN_MASK, but IE_SP differs from SP_PIN_MASK.
+ */
+#define MC33978_IE_SG_MASK		GENMASK(MC33978_NUM_SG_PINS - 1, 0)
+#define MC33978_IE_SP_MASK		GENMASK(MC33978_NUM_SP_PINS - 1, 0)
+
+static inline u32 mc33978_raw_to_physical_state(u32 raw_state, u32 config_reg)
+{
+	u32 inv_mask = MC33978_SG_PIN_MASK |
+		       (~(config_reg << MC33978_NUM_SG_PINS) & MC33978_SP_PIN_MASK);
+
+	return raw_state ^ inv_mask;
+}
+
+/*
+ * Virtual IRQ number for fault handling.
+ * Using hwirq 22 (beyond the 22 pin IRQs 0-21).
+ */
+#define MC33978_HWIRQ_FAULT		22
+
+/* Total number of hwirqs exposed by the MFD IRQ domain */
+#define MC33978_NUM_IRQS		(MC33978_HWIRQ_FAULT + 1)
+
+/*
+ * AMUX channel definitions
+ * The AMUX can route one of 24 signals to the external AMUX pin
+ */
+/* Switch-to-Ground inputs 0-13 */
+#define MC33978_AMUX_CH_SG0		0
+#define MC33978_AMUX_CH_SG13		13
+/* Programmable switch inputs 0-7 */
+#define MC33978_AMUX_CH_SP0		14
+#define MC33978_AMUX_CH_SP7		21
+/* Internal temperature diode */
+#define MC33978_AMUX_CH_TEMP		22
+/* Battery voltage sense */
+#define MC33978_AMUX_CH_VBATP		23
+/* Total number of AMUX channels */
+#define MC33978_NUM_AMUX_CH		24
+
+/* Forward declarations */
+struct device;
+struct spi_device;
+struct irq_domain;
+
+/*
+ * Core initialization function (implemented in mc33978-core module)
+ *
+ * This initializes the regmap, IRQ domain, and event handling for the device.
+ * The mc33978-core module must be loaded before the mc33978 MFD driver.
+ *
+ * @dev: Device pointer
+ * @spi: SPI device pointer
+ * @domain_out: Returns the IRQ domain for child device registration
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int mc33978_core_init(struct device *dev, struct spi_device *spi,
+		      struct irq_domain **domain_out);
+
+#endif /* _LINUX_MFD_MC33978_H */
-- 
2.47.3


