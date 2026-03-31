Return-Path: <linux-gpio+bounces-34498-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGlCAxYJzGn+NQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34498-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 19:49:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C636F59A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 19:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB03D30B650D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 17:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B799636AB47;
	Tue, 31 Mar 2026 17:16:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8C36829D
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977411; cv=none; b=OP8usoe7rMer6wUvtJBJV41MnAOtH8URDhp5PSYRZyJkiydlgy1/DoWrPWzWqEqA16c9d/fOzY6qtfN3P3sul+qgQxXEzVUMeS18I/O/pZatqWRUiD1xQ53k8RvfbcNzMCN9hctQBJ59fcZiyvS3DMaUASmXQ+vdb6IJ5MkI1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977411; c=relaxed/simple;
	bh=MkHTFOqhBSnAvHCBOJV/berRdoLaFabztIg97GygCug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sb/wz1bDJj2ZbgBJk18YyqfMzWUfdBAb5WCvboIFdwTB5LLS471B8l+vLqdEYSfB0eAj8hkBc2OJIr50/pqHsLuCa0D5y4Mpr4XfrkQHccMWUiCTfFLMM4p2giFHfNLxpvGcgnloCB7MvANbPPwtg5pqKoTcUucUjSQSQMC5q4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w7chK-0004mG-Dv; Tue, 31 Mar 2026 19:16:14 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w7chJ-0034jN-1i;
	Tue, 31 Mar 2026 19:16:13 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w7chJ-00000000QYv-1uZD;
	Tue, 31 Mar 2026 19:16:13 +0200
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
Subject: [PATCH v9 2/6] mfd: add NXP MC33978/MC34978 core driver
Date: Tue, 31 Mar 2026 19:16:08 +0200
Message-ID: <20260331171612.102018-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331171612.102018-1-o.rempel@pengutronix.de>
References: <20260331171612.102018-1-o.rempel@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34498-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:email,pengutronix.de:email,pengutronix.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 997C636F59A
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

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
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
 drivers/mfd/Kconfig         |   15 +
 drivers/mfd/Makefile        |    2 +
 drivers/mfd/mc33978.c       | 1061 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/mc33978.h |   92 +++
 4 files changed, 1170 insertions(+)
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..6dc9554822c9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2566,6 +2566,21 @@ config MFD_UPBOARD_FPGA
 	  To compile this driver as a module, choose M here: the module will be
 	  called upboard-fpga.
 
+config MFD_MC33978
+	tristate "NXP MC33978/MC34978 industrial input controller core"
+	depends on OF
+	depends on SPI
+	select IRQ_DOMAIN_HIERARCHY
+	select MFD_CORE
+	select REGMAP
+	help
+	  Support for the NXP MC33978/MC34978 industrial input controllers
+	  using the SPI interface.
+
+	  This driver provides common support for accessing the device.
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
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
index 000000000000..c017d295503f
--- /dev/null
+++ b/drivers/mfd/mc33978.c
@@ -0,0 +1,1061 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 David Jander <david@protonic.nl>, Protonic Holland
+ * Copyright (C) 2026 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ *
+ * MC33978/MC34978 Multiple Switch Detection Interface - MFD Core Driver
+ *
+ * Driver Architecture:
+ * This is the core MFD driver handling the physical SPI interface, power
+ * management, and central interrupt routing. It instantiates the following
+ * child devices:
+ * - pinctrl: For GPIO read/write and wetting current configuration.
+ * - hwmon:   For hardware fault monitoring (tLIM, over/under-voltage).
+ * - mux:     For the 24-to-1 analog multiplexer (AMUX).
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
+ * Interrupt Quirks & Limitations:
+ * - Clear-on-Read: The physical INT_B line is directly tied to the INT_flg
+ * bit. The hardware deasserts INT_B immediately upon *any* SPI transfer
+ * that returns INT_flg. Harvesting this bit from all SPI traffic is the
+ * ONLY way to know this device triggered an interrupt (crucial for shared
+ * IRQ lines).
+ * - Stateless Pin Edge Detection: The hardware lacks per-pin interrupt status
+ * registers. To determine which pin triggered an event, the driver must
+ * read the current pin states and XOR them against a previously cached state.
+ * - Missed Short Pulses: Because pin interrupts are state-derived rather than
+ * hardware-latched, very short physical pulses (shorter than the SPI read
+ * latency) will be missed entirely if the pin reverts to its original state
+ * before the READ_IN register is sampled by the IRQ thread.
+ * - Edge-Only Pin Interrupts: The hardware only asserts INT_B on a state
+ * change. It cannot continuously assert an interrupt while a pin is held at a
+ * specific logic level. Consequently, the driver strictly emulates edge
+ * interrupts (RISING/FALLING) and explicitly rejects LEVEL interrupt
+ * configurations to prevent consumer misalignment.
+ */
+
+#include <linux/array_size.h>
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cache.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/devm-helpers.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/string.h>
+
+#include <linux/mfd/mc33978.h>
+
+#define MC33978_DRV_NAME		"mc33978"
+
+/* Device identification signature returned by CHECK register */
+#define MC33978_CHECK_SIGNATURE		0x123456
+
+/*
+ * Pipelined two-frame SPI transfer:
+ * [REQ]  - Transmits command/write-data, receives dummy/previous response
+ * [PIPE] - Transmits dummy CHECK, receives actual response to current command
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
+/* High Payload Byte Masks (FRAME_DATA_HI / PAYLOAD_HI). */
+#define MC33978_HI_BYTE_STAT_FAULT     BIT(7) /* Maps to frame bit [23] */
+#define MC33978_HI_BYTE_STAT_INT       BIT(6) /* Maps to frame bit [22] */
+
+#define MC33978_HI_BYTE_STATUS_MASK    (MC33978_HI_BYTE_STAT_FAULT | \
+					MC33978_HI_BYTE_STAT_INT)
+
+/* Maps to frame bits [21:16] */
+#define MC33978_HI_BYTE_DATA_MASK	GENMASK(5, 0)
+
+#define MC33978_CACHE_SG_PIN_MASK	GENMASK(13, 0)
+#define MC33978_CACHE_SP_PIN_MASK	GENMASK(21, 14)
+
+#define MC33978_SG_PIN_MASK		GENMASK(13, 0)
+#define MC33978_SP_PIN_MASK		GENMASK(7, 0)
+
+struct mc33978_data {
+	const struct mfd_cell *cells;
+	int num_cells;
+};
+
+struct mc33978_mfd_priv {
+	/* Immutable after initialization (no lock needed) */
+	struct spi_device *spi;
+	struct regmap *map;
+	struct regulator *vddq;
+	struct regulator *vbatp;
+	struct irq_domain *domain;
+
+	/* Pre-built SPI messages (immutable after init) */
+	struct spi_message msg_read;
+	struct spi_message msg_write;
+	struct spi_transfer xfer_read[MC33978_FRAME_COUNT];
+	struct spi_transfer xfer_write;
+
+	/* Protected by event_lock */
+	struct mutex event_lock;
+	u32 cached_pin_state;		/* Previous pin state for edge detection */
+
+	/* Protected by irq_lock */
+	struct mutex irq_lock;
+	u32 cached_pin_mask;		/* IRQ mask for 22 pins */
+	u32 irq_rise;			/* Rising edge IRQ enable mask */
+	u32 irq_fall;			/* Falling edge IRQ enable mask */
+
+	/* Protected by teardown_lock */
+	spinlock_t teardown_lock;
+	bool tearing_down;		/* Prevents work scheduling during teardown */
+
+	/* Atomic operations (no lock needed) */
+	atomic_t harvested_flags;	/* Status bits from SPI responses */
+
+	/*
+	 * Cross-context lockless access (READ_ONCE/WRITE_ONCE).
+	 * Accessed from regmap callbacks (unpredictable context) and event work.
+	 * Cannot use lock in regmap callback. Benign race acceptable.
+	 */
+	bool bus_fault_active;		/* Latest physical fault state on bus */
+	bool cached_fault_active;	/* Cached fault state from previous event */
+
+	/*
+	 * Work scheduling protected by teardown_lock.
+	 * Work execution serialized by workqueue subsystem.
+	 */
+	struct work_struct event_work;
+
+	/*
+	 * DMA buffers protected by SPI subsystem + regmap serialization.
+	 * Modified before spi_sync(), read after it returns.
+	 * Must be at end for ____cacheline_aligned.
+	 */
+	u8 tx_frame[MC33978_FRAME_COUNT][MC33978_FRAME_LEN] ____cacheline_aligned;
+	u8 rx_frame[MC33978_FRAME_COUNT][MC33978_FRAME_LEN] ____cacheline_aligned;
+};
+
+static void mc33978_irq_mask(struct irq_data *data)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (hwirq < MC33978_NUM_PINS)
+		mc->cached_pin_mask &= ~BIT(hwirq);
+}
+
+static void mc33978_irq_unmask(struct irq_data *data)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (hwirq < MC33978_NUM_PINS)
+		mc->cached_pin_mask |= BIT(hwirq);
+}
+
+static void mc33978_irq_bus_lock(struct irq_data *data)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&mc->irq_lock);
+}
+
+/**
+ * mc33978_irq_bus_sync_unlock() - Sync cached IRQ mask to hardware and unlock
+ * @data: IRQ data
+ *
+ * Writes the cached interrupt mask to the hardware IE_SG and IE_SP registers,
+ * then releases the IRQ lock. This is where the actual hardware update occurs
+ * after mask/unmask operations.
+ */
+static void mc33978_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+	u32 sg_mask, sp_mask, cached_mask;
+	int ret;
+
+	cached_mask = mc->cached_pin_mask;
+
+	/*
+	 * Split the cached 22-bit pin mask into hardware register format:
+	 * - SG pins: bits [13:0] (14 pins, mask 0x3FFF)
+	 * - SP pins: bits [21:14] (8 pins, mask 0xFF)
+	 */
+	sg_mask = FIELD_GET(MC33978_CACHE_SG_PIN_MASK, cached_mask);
+	sp_mask = FIELD_GET(MC33978_CACHE_SP_PIN_MASK, cached_mask);
+
+	ret = regmap_update_bits(mc->map, MC33978_REG_IE_SG,
+				 MC33978_SG_PIN_MASK, sg_mask);
+	if (ret)
+		goto unlock;
+
+	ret = regmap_update_bits(mc->map, MC33978_REG_IE_SP,
+				 MC33978_SP_PIN_MASK, sp_mask);
+unlock:
+	if (ret)
+		dev_err(&mc->spi->dev, "failed to sync IRQ mask to hardware: %d\n",
+			ret);
+
+	mutex_unlock(&mc->irq_lock);
+}
+
+static int mc33978_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u32 mask = BIT(hwirq);
+
+	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+		return -EINVAL;
+
+	/*
+	 * No locking needed here - irq_bus_lock/irq_bus_sync_unlock
+	 * already provide serialization via mc->irq_lock mutex.
+	 */
+
+	if (type & IRQ_TYPE_EDGE_RISING)
+		mc->irq_rise |= mask;
+	else
+		mc->irq_rise &= ~mask;
+
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		mc->irq_fall |= mask;
+	else
+		mc->irq_fall &= ~mask;
+
+	return 0;
+}
+
+static int mc33978_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct mc33978_mfd_priv *mc = irq_data_get_irq_chip_data(data);
+
+	return irq_set_irq_wake(mc->spi->irq, on);
+}
+
+static struct irq_chip mc33978_irq_chip = {
+	.name			= MC33978_DRV_NAME,
+	.irq_mask		= mc33978_irq_mask,
+	.irq_unmask		= mc33978_irq_unmask,
+	.irq_bus_lock		= mc33978_irq_bus_lock,
+	.irq_bus_sync_unlock	= mc33978_irq_bus_sync_unlock,
+	.irq_set_type		= mc33978_irq_set_type,
+	.irq_set_wake		= mc33978_irq_set_wake,
+};
+
+static int mc33978_irq_map(struct irq_domain *d, unsigned int virq,
+			   irq_hw_number_t hw)
+{
+	struct mc33978_mfd_priv *mc = d->host_data;
+
+	irq_set_chip_data(virq, mc);
+	irq_set_chip_and_handler(virq, &mc33978_irq_chip, handle_simple_irq);
+
+	irq_set_nested_thread(virq, 1);
+	irq_clear_status_flags(virq, IRQ_NOREQUEST | IRQ_NOPROBE);
+
+	return 0;
+}
+
+static int mc33978_irq_domain_alloc(struct irq_domain *domain,
+				    unsigned int virq,
+				    unsigned int nr_irqs, void *arg)
+{
+	struct mc33978_mfd_priv *mc = domain->host_data;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int i;
+
+	if (fwspec->param_count < 1)
+		return -EINVAL;
+
+	hwirq = fwspec->param[0];
+
+	if (hwirq >= MC33978_HWIRQ_FAULT + 1 ||
+	    nr_irqs > MC33978_HWIRQ_FAULT + 1 - hwirq)
+		return -EINVAL;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, hwirq + i,
+				    &mc33978_irq_chip, mc,
+				    handle_simple_irq, NULL, NULL);
+		irq_set_nested_thread(virq + i, 1);
+		irq_clear_status_flags(virq + i, IRQ_NOREQUEST | IRQ_NOPROBE);
+	}
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
+static const struct irq_domain_ops mc33978_irq_domain_ops = {
+	.map	= mc33978_irq_map,
+	.alloc	= mc33978_irq_domain_alloc,
+	.free	= mc33978_irq_domain_free,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+static void mc33978_irq_domain_remove(void *data)
+{
+	struct irq_domain *domain = data;
+
+	irq_domain_remove(domain);
+}
+
+static bool mc33978_handle_pin_changes(struct mc33978_mfd_priv *mc,
+				       unsigned int pin_state)
+{
+	unsigned long fired_pins = 0;
+	u32 changed_pins;
+	u32 rise, fall, pin_mask;
+	int i;
+
+	changed_pins = pin_state ^ mc->cached_pin_state;
+	if (!changed_pins)
+		return false;
+
+	mc->cached_pin_state = pin_state;
+
+	scoped_guard(mutex, &mc->irq_lock) {
+		pin_mask = mc->cached_pin_mask;
+		rise = mc->irq_rise;
+		fall = mc->irq_fall;
+	}
+
+	changed_pins &= pin_mask;
+
+	if (!changed_pins)
+		return false;
+
+	fired_pins |= (changed_pins & pin_state) & rise;
+	fired_pins |= (changed_pins & ~pin_state) & fall;
+
+	for_each_set_bit(i, &fired_pins, MC33978_NUM_PINS) {
+		int virq = irq_find_mapping(mc->domain, i);
+
+		if (virq)
+			handle_nested_irq(virq);
+	}
+
+	return true;
+}
+
+static bool mc33978_handle_fault_condition(struct mc33978_mfd_priv *mc,
+					   u8 hw_flags)
+{
+	bool fault_active, cached_fault, transient, changed;
+	bool handled = false;
+	u32 rise, fall;
+	int virq;
+
+	/* Read the absolute latest physical state seen on the bus */
+	fault_active = READ_ONCE(mc->bus_fault_active);
+
+	/* Read the cached fault state from the previous event loop */
+	cached_fault = READ_ONCE(mc->cached_fault_active);
+
+	/* Check if the fault state has changed since the last event loop */
+	changed = fault_active ^ cached_fault;
+	if (changed)
+		WRITE_ONCE(mc->cached_fault_active, fault_active);
+
+	/*
+	 * A transient fault is a pulse that was caught by the clear-on-read
+	 * status flags, but is no longer physically active on the bus.
+	 */
+	transient = !changed && !fault_active &&
+		    (hw_flags & MC33978_HI_BYTE_STAT_FAULT);
+
+	if (!changed && !transient)
+		return false;
+
+	scoped_guard(mutex, &mc->irq_lock) {
+		rise = mc->irq_rise;
+		fall = mc->irq_fall;
+	}
+
+	virq = irq_find_mapping(mc->domain, MC33978_HWIRQ_FAULT);
+	if (!virq)
+		return false;
+
+	if (transient) {
+		/* Transient pulse: trigger both edges if enabled */
+		if (rise & BIT(MC33978_HWIRQ_FAULT)) {
+			handle_nested_irq(virq);
+			handled = true;
+		}
+		if (fall & BIT(MC33978_HWIRQ_FAULT)) {
+			handle_nested_irq(virq);
+			handled = true;
+		}
+	} else if ((fault_active && (rise & BIT(MC33978_HWIRQ_FAULT))) ||
+		    (!fault_active && (fall & BIT(MC33978_HWIRQ_FAULT)))) {
+		/* Normal edge */
+		handle_nested_irq(virq);
+		handled = true;
+	}
+
+	return handled;
+}
+
+static bool mc33978_process_single_event(struct mc33978_mfd_priv *mc)
+{
+	unsigned int pin_state;
+	bool handled = false;
+	u8 hw_flags;
+	int ret;
+
+	/*
+	 * Grab harvested_flags BEFORE reading the hardware. If the read itself
+	 * or a concurrent SPI transfer harvests new flags, they will remain set
+	 * in harvested_flags and correctly trigger another pass of the event
+	 * loop.
+	 *
+	 * Note on Performance: This architecture intentionally forces a second
+	 * (redundant) SPI read of READ_IN during almost every interrupt event.
+	 * While SPI framework overhead (CS toggling, DMA setup, context
+	 * switches) makes this 4-byte transfer relatively costly, it is
+	 * mathematically necessary to guarantee no edge events are permanently
+	 * lost when a concurrent regmap access races with the IRQ thread, due
+	 * to the hardware's clear-on-read global INT_flg design.
+	 */
+	hw_flags = atomic_xchg(&mc->harvested_flags, 0);
+
+	ret = regmap_read(mc->map, MC33978_REG_READ_IN, &pin_state);
+	if (ret)
+		return false;
+
+	if (mc33978_handle_pin_changes(mc, pin_state))
+		handled = true;
+
+	if (mc33978_handle_fault_condition(mc, hw_flags))
+		handled = true;
+
+	if (hw_flags & MC33978_HI_BYTE_STAT_INT)
+		handled = true;
+
+	return handled;
+}
+
+static bool mc33978_handle_events(struct mc33978_mfd_priv *mc)
+{
+	bool handled = false;
+
+	guard(mutex)(&mc->event_lock);
+
+	do {
+		if (mc33978_process_single_event(mc))
+			handled = true;
+	} while (atomic_read(&mc->harvested_flags) != 0);
+
+	return handled;
+}
+
+static irqreturn_t mc33978_irq_thread(int irq, void *data)
+{
+	return mc33978_handle_events(data) ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static void mc33978_teardown(void *data)
+{
+	struct mc33978_mfd_priv *mc = data;
+
+	/*
+	 * During the devres LIFO teardown window, the workqueue is canceled
+	 * before the regmap is destroyed. A concurrent debugfs regmap read
+	 * can trigger mc33978_harvest_status() and wrongly reschedule the
+	 * workqueue after it was already canceled.
+	 *
+	 * Flag the teardown state under a lock so the harvester atomically
+	 * checks and ignores status bits before scheduling new work.
+	 */
+	scoped_guard(spinlock_irqsave, &mc->teardown_lock) {
+		mc->tearing_down = true;
+	}
+
+	cancel_work_sync(&mc->event_work);
+}
+
+static int mc33978_irq_init(struct mc33978_mfd_priv *mc,
+			    struct fwnode_handle *fwnode)
+{
+	struct device *dev = &mc->spi->dev;
+	int ret;
+
+	mutex_init(&mc->irq_lock);
+
+	/*
+	 * Create IRQ domain with 23 interrupts:
+	 * - hwirq 0-21: Pin change interrupts (22 pins)
+	 * - hwirq 22: Fault interrupt (for hwmon driver)
+	 */
+	mc->domain = irq_domain_create_linear(fwnode, MC33978_NUM_PINS + 1,
+					      &mc33978_irq_domain_ops, mc);
+	if (!mc->domain)
+		return dev_err_probe(dev, -ENOMEM, "failed to create IRQ domain\n");
+
+	/*
+	 * Use DOMAIN_BUS_NEXUS to distinguish this intermediate demux domain
+	 * from child domains sharing the same fwnode. Matches the pattern used
+	 * by other MFD drivers (e.g., crystalcove).
+	 */
+	irq_domain_update_bus_token(mc->domain, DOMAIN_BUS_NEXUS);
+
+	mc->domain->flags |= IRQ_DOMAIN_FLAG_HIERARCHY;
+
+	ret = devm_add_action_or_reset(dev, mc33978_irq_domain_remove,
+				       mc->domain);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void mc33978_event_work(struct work_struct *work)
+{
+	struct mc33978_mfd_priv *mc =
+		container_of(work, struct mc33978_mfd_priv, event_work);
+
+	mc33978_handle_events(mc);
+}
+
+/**
+ * mc33978_harvest_status() - Collect status flags from SPI responses
+ * @mc: Device private data
+ * @status: Status bits (FAULT_STAT and INT_flg) from MISO frame
+ *
+ * Accumulates status flags harvested from SPI responses and schedules
+ * event processing if not already in progress. Called by the SPI
+ * read/write functions when status bits are detected in responses.
+ */
+static void mc33978_harvest_status(struct mc33978_mfd_priv *mc, int status)
+{
+	bool fault_active;
+
+	fault_active = !!(status & MC33978_HI_BYTE_STAT_FAULT);
+
+	/* Track the absolute latest physical state seen on the bus */
+	WRITE_ONCE(mc->bus_fault_active, fault_active);
+
+	/*
+	 * If the bus state changed from what the IRQ thread last evaluated,
+	 * wake it up.
+	 */
+	if (fault_active != READ_ONCE(mc->cached_fault_active))
+		atomic_or(MC33978_HI_BYTE_STAT_FAULT, &mc->harvested_flags);
+
+	if (status & MC33978_HI_BYTE_STAT_INT)
+		atomic_or(MC33978_HI_BYTE_STAT_INT, &mc->harvested_flags);
+
+	/* Ensure harvested_flags is visible before checking teardown state */
+	smp_mb__after_atomic();
+
+	scoped_guard(spinlock_irqsave, &mc->teardown_lock) {
+		if (!mc->tearing_down && atomic_read(&mc->harvested_flags))
+			schedule_work(&mc->event_work);
+	}
+}
+
+/**
+ * mc33978_prepare_messages() - Initialize the persistent SPI messages
+ * @mc: Device private data
+ *
+ * Hardware pipelining constraints:
+ * - Write (1 Frame): The device executes write commands immediately upon
+ * CS de-assertion. No fetch frame is required.
+ * - Read (2 Frames): The MISO response logically lags by one frame.
+ * Frame 1 transmits the read request and toggles CS to latch it.
+ * Frame 2 transmits a dummy CHECK command to fetch the actual payload.
+ */
+static void mc33978_prepare_messages(struct mc33978_mfd_priv *mc)
+{
+	/* --- Prepare Write Message (1 Frame) --- */
+	spi_message_init(&mc->msg_write);
+
+	mc->xfer_write.tx_buf = mc->tx_frame[MC33978_FRAME_REQ];
+	mc->xfer_write.rx_buf = mc->rx_frame[MC33978_FRAME_REQ];
+	mc->xfer_write.len = MC33978_FRAME_LEN;
+
+	spi_message_add_tail(&mc->xfer_write, &mc->msg_write);
+
+	/* --- Prepare Read Message (2 Frames) --- */
+	spi_message_init(&mc->msg_read);
+
+	/* Frame 1: Request */
+	mc->xfer_read[MC33978_FRAME_REQ].tx_buf =
+		mc->tx_frame[MC33978_FRAME_REQ];
+	mc->xfer_read[MC33978_FRAME_REQ].rx_buf =
+		mc->rx_frame[MC33978_FRAME_REQ];
+	mc->xfer_read[MC33978_FRAME_REQ].len = MC33978_FRAME_LEN;
+	mc->xfer_read[MC33978_FRAME_REQ].cs_change = 1; /* Latch command */
+
+	/* Frame 2: Fetch (Dummy CHECK) */
+	mc->xfer_read[MC33978_FRAME_PIPE].tx_buf =
+		mc->tx_frame[MC33978_FRAME_PIPE];
+	mc->xfer_read[MC33978_FRAME_PIPE].rx_buf =
+		mc->rx_frame[MC33978_FRAME_PIPE];
+	mc->xfer_read[MC33978_FRAME_PIPE].len = MC33978_FRAME_LEN;
+
+	/* Preload the dummy CHECK command statically */
+	mc->tx_frame[MC33978_FRAME_PIPE][MC33978_FRAME_CMD] = MC33978_REG_CHECK;
+
+	spi_message_add_tail(&mc->xfer_read[MC33978_FRAME_REQ], &mc->msg_read);
+	spi_message_add_tail(&mc->xfer_read[MC33978_FRAME_PIPE], &mc->msg_read);
+}
+
+/**
+ * mc33978_rx_decode() - Decode MISO response frame and extract status
+ * @rx_frame: Received SPI frame buffer (4 bytes)
+ * @val_buf: Output buffer for regmap (exactly 3 bytes, optional)
+ *
+ * Translates the 4-byte SPI response into a 3-byte regmap payload.
+ * Harvests the volatile INTflg and FAULT_STAT bits from the MSB.
+ *
+ * Note: MC33978_REG_CHECK, MC33978_REG_WET_SP, and MC33978_REG_WET_SG0 do not
+ * contain fault status or interrupt flags.
+ *
+ * Return: Status bits if present, negative error code otherwise.
+ */
+static int mc33978_rx_decode(const u8 *rx_frame, u8 *val_buf)
+{
+	u8 cmd = rx_frame[MC33978_FRAME_CMD] & ~MC33978_CMD_BYTE_WRITE;
+	bool has_status;
+	u8 status = 0;
+
+	switch (cmd) {
+	case MC33978_REG_CHECK:
+	case MC33978_REG_WET_SP:
+	case MC33978_REG_WET_SG0:
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
+	struct mc33978_mfd_priv *mc = ctx;
+	int status;
+	int ret;
+
+	if (count != MC33978_FRAME_LEN)
+		return -EINVAL;
+
+	memcpy(mc->tx_frame[MC33978_FRAME_REQ], data, MC33978_FRAME_LEN);
+
+	ret = spi_sync(mc->spi, &mc->msg_write);
+	if (ret)
+		return ret;
+
+	status = mc33978_rx_decode(mc->rx_frame[MC33978_FRAME_REQ], NULL);
+	if (status >= 0)
+		mc33978_harvest_status(mc, status);
+
+	return 0;
+}
+
+static int mc33978_spi_read(void *ctx, const void *reg_buf, size_t reg_size,
+			    void *val_buf, size_t val_size)
+{
+	struct mc33978_mfd_priv *mc = ctx;
+	int status_req, status_pipe;
+	int ret;
+
+	if (reg_size != 1 || val_size != MC33978_PAYLOAD_LEN)
+		return -EINVAL;
+
+	memset(&mc->tx_frame[MC33978_FRAME_REQ][MC33978_FRAME_DATA_HI], 0,
+	       MC33978_PAYLOAD_LEN);
+	mc->tx_frame[MC33978_FRAME_REQ][MC33978_FRAME_CMD] =
+		((const u8 *)reg_buf)[0];
+
+	ret = spi_sync(mc->spi, &mc->msg_read);
+	if (ret)
+		return ret;
+
+	status_req = mc33978_rx_decode(mc->rx_frame[MC33978_FRAME_REQ], NULL);
+	status_pipe = mc33978_rx_decode(mc->rx_frame[MC33978_FRAME_PIPE],
+					val_buf);
+
+	if (status_req >= 0)
+		mc33978_harvest_status(mc, status_req);
+	if (status_pipe >= 0)
+		mc33978_harvest_status(mc, status_pipe);
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
+	regmap_reg_range(MC33978_REG_READ_IN, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_volatile_table = {
+	.yes_ranges = mc33978_volatile_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_volatile_range),
+};
+
+static const struct regmap_range mc33978_precious_range[] = {
+	regmap_reg_range(MC33978_REG_READ_IN, MC33978_REG_RESET),
+};
+
+static const struct regmap_access_table mc33978_precious_table = {
+	.yes_ranges = mc33978_precious_range,
+	.n_yes_ranges = ARRAY_SIZE(mc33978_precious_range),
+};
+
+/*
+ * NOTE: Need to fake REG_IRQ and REG_RESET as readable, so that regcache
+ * will NOT write to them on a cache sync. Sounds counterintuitive, but marking
+ * a reg as "precious" or "volatile" is the only way to avoid this, and that
+ * works only with readable regs.
+ */
+static const struct regmap_range mc33978_readable_range[] = {
+	regmap_reg_range(MC33978_REG_CHECK, MC33978_REG_WET_SG1),
+	regmap_reg_range(MC33978_REG_CWET_SP, MC33978_REG_WDEB_SG),
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
+	.name = MC33978_DRV_NAME,
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
+static int mc33978_power_on(struct mc33978_mfd_priv *mc)
+{
+	struct device *dev = &mc->spi->dev;
+	int ret;
+
+	ret = regulator_enable(mc->vddq);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VDDQ supply\n");
+
+	ret = regulator_enable(mc->vbatp);
+	if (ret) {
+		regulator_disable(mc->vddq);
+		return dev_err_probe(dev, ret, "failed to enable VBATP supply\n");
+	}
+
+	return 0;
+}
+
+static void mc33978_power_off(void *data)
+{
+	struct mc33978_mfd_priv *mc = data;
+
+	regulator_disable(mc->vbatp);
+	regulator_disable(mc->vddq);
+}
+
+/**
+ * mc33978_check_device() - Verify SPI communication with device
+ * @mc: Device context
+ *
+ * Reads the CHECK register which should return a fixed signature (0x123456).
+ * This verifies that SPI communication is working correctly.
+ *
+ * Note: MC33978_REG_CHECK does not contain fault status or interrupt flags.
+ * See mc33978_rx_decode() for details.
+ *
+ * Return: 0 on success, -ENODEV if signature doesn't match
+ */
+static int mc33978_check_device(struct mc33978_mfd_priv *mc)
+{
+	struct device *dev = &mc->spi->dev;
+	unsigned int check;
+	int ret;
+
+	ret = regmap_read(mc->map, MC33978_REG_CHECK, &check);
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
+static const struct resource mc33978_hwmon_resources[] = {
+	DEFINE_RES_IRQ(MC33978_HWIRQ_FAULT),
+};
+
+static const struct mfd_cell mc33978_cells[] = {
+	{ .name = "mc33978-pinctrl" },
+	{
+		.name = "mc33978-hwmon",
+		.resources = mc33978_hwmon_resources,
+		.num_resources = ARRAY_SIZE(mc33978_hwmon_resources),
+	},
+	{ .name = "mc33978-mux" },
+};
+
+static const struct mfd_cell mc34978_cells[] = {
+	{ .name = "mc34978-pinctrl" },
+	{
+		.name = "mc34978-hwmon",
+		.resources = mc33978_hwmon_resources,
+		.num_resources = ARRAY_SIZE(mc33978_hwmon_resources),
+	},
+	{ .name = "mc34978-mux" },
+};
+
+static const struct mc33978_data mc33978_match_data = {
+	.cells = mc33978_cells,
+	.num_cells = ARRAY_SIZE(mc33978_cells),
+};
+
+static const struct mc33978_data mc34978_match_data = {
+	.cells = mc34978_cells,
+	.num_cells = ARRAY_SIZE(mc34978_cells),
+};
+
+static int mc33978_probe(struct spi_device *spi)
+{
+	const struct mc33978_data *match_data;
+	struct device *dev = &spi->dev;
+	struct fwnode_handle *fwnode;
+	struct mc33978_mfd_priv *mc;
+	int ret;
+
+	fwnode = dev_fwnode(dev);
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV, "missing firmware node\n");
+
+	match_data = spi_get_device_match_data(spi);
+	if (!match_data)
+		return dev_err_probe(dev, -ENODEV, "no device match data found\n");
+
+	mc = devm_kzalloc(dev, sizeof(*mc), GFP_KERNEL);
+	if (!mc)
+		return -ENOMEM;
+
+	mc->spi = spi;
+	spi_set_drvdata(spi, mc);
+
+	mc->vddq = devm_regulator_get(dev, "vddq");
+	if (IS_ERR(mc->vddq))
+		return dev_err_probe(dev, PTR_ERR(mc->vddq),
+				     "failed to get VDDQ regulator\n");
+
+	mc->vbatp = devm_regulator_get(dev, "vbatp");
+	if (IS_ERR(mc->vbatp))
+		return dev_err_probe(dev, PTR_ERR(mc->vbatp),
+				     "failed to get VBATP regulator\n");
+
+	ret = mc33978_power_on(mc);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, mc33978_power_off, mc);
+	if (ret)
+		return ret;
+
+	mutex_init(&mc->event_lock);
+	spin_lock_init(&mc->teardown_lock);
+
+	INIT_WORK(&mc->event_work, mc33978_event_work);
+
+	atomic_set(&mc->harvested_flags, 0);
+
+	mc33978_prepare_messages(mc);
+
+	ret = mc33978_irq_init(mc, fwnode);
+	if (ret)
+		return ret;
+
+	mc->map = devm_regmap_init(dev, &mc33978_regmap_bus, mc,
+				   &mc33978_regmap_config);
+	if (IS_ERR(mc->map))
+		return dev_err_probe(dev, PTR_ERR(mc->map), "can't init regmap\n");
+
+	/*
+	 * Ensure event_work is canceled before regmap and irq_domain teardown,
+	 * since the worker dereferences both mc->map and mc->domain.
+	 */
+	ret = devm_add_action_or_reset(dev, mc33978_teardown, mc);
+	if (ret)
+		return ret;
+
+	ret = mc33978_check_device(mc);
+	if (ret)
+		return dev_err_probe(dev, ret, "can't use SPI bus\n");
+
+	/* Disable interrupts to prevent storms during priming */
+	ret = regmap_write(mc->map, MC33978_REG_IE_SP, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(mc->map, MC33978_REG_IE_SG, 0);
+	if (ret)
+		return ret;
+
+	/* Prime the cached pin state under lock to prevent spurious events */
+	scoped_guard(mutex, &mc->event_lock) {
+		ret = regmap_read(mc->map, MC33978_REG_READ_IN,
+				  &mc->cached_pin_state);
+	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read initial pin state\n");
+
+	if (mc->spi->irq <= 0)
+		return dev_err_probe(dev, -EINVAL, "no valid IRQ provided for INT_B pin\n");
+
+	/*
+	 * Deliberately not using IRQF_SHARED.
+	 *
+	 * MC33978 clear-on-read interrupt status can make shared wiring with
+	 * another MC33978/MC34978 functionally possible, but this handler runs
+	 * threaded with IRQF_ONESHOT and may hold the line masked for a long
+	 * time on slow SPI. The added latency/jitter makes shared operation
+	 * impractical.
+	 */
+	ret = devm_request_threaded_irq(dev, mc->spi->irq,
+					NULL,
+					mc33978_irq_thread,
+					IRQF_ONESHOT,
+					dev_name(dev), mc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   match_data->cells, match_data->num_cells,
+				   NULL, 0, mc->domain);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add MFD child devices\n");
+
+	return 0;
+}
+
+static const struct of_device_id mc33978_of_match[] = {
+	{ .compatible = "nxp,mc33978", .data = &mc33978_match_data },
+	{ .compatible = "nxp,mc34978", .data = &mc34978_match_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mc33978_of_match);
+
+static const struct spi_device_id mc33978_spi_id[] = {
+	{ "mc33978", (kernel_ulong_t)&mc33978_match_data },
+	{ "mc34978", (kernel_ulong_t)&mc34978_match_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, mc33978_spi_id);
+
+static struct spi_driver mc33978_driver = {
+	.driver = {
+		.name = MC33978_DRV_NAME,
+		.of_match_table = mc33978_of_match,
+	},
+	.probe = mc33978_probe,
+	.id_table = mc33978_spi_id,
+};
+module_spi_driver(mc33978_driver);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 MFD core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/mc33978.h b/include/linux/mfd/mc33978.h
new file mode 100644
index 000000000000..e8dec678e5a4
--- /dev/null
+++ b/include/linux/mfd/mc33978.h
@@ -0,0 +1,92 @@
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
+#define MC33978_REG_CHECK	0x00	/* SPI communication check */
+#define MC33978_REG_CONFIG	0x02	/* Device configuration */
+#define MC33978_REG_TRI_SP	0x04	/* Tri-state enable SP */
+#define MC33978_REG_TRI_SG	0x06	/* Tri-state enable SG */
+#define MC33978_REG_WET_SP	0x08	/* Wetting current level SP */
+#define MC33978_REG_WET_SG0	0x0a	/* Wetting current level SG0 (SG7-SG0) */
+#define MC33978_REG_WET_SG1	0x0c	/* Wetting current level SG1 (SG13-SG8) */
+#define MC33978_REG_CWET_SP	0x16	/* Continuous wetting current SP */
+#define MC33978_REG_CWET_SG	0x18	/* Continuous wetting current SG */
+#define MC33978_REG_IE_SP	0x1a	/* Interrupt enable SP */
+#define MC33978_REG_IE_SG	0x1c	/* Interrupt enable SG */
+#define MC33978_REG_LPM_CONFIG	0x1e	/* Low-power mode configuration */
+#define MC33978_REG_WAKE_SP	0x20	/* Wake-up enable SP */
+#define MC33978_REG_WAKE_SG	0x22	/* Wake-up enable SG */
+#define MC33978_REG_COMP_SP	0x24	/* Comparator only mode SP */
+#define MC33978_REG_COMP_SG	0x26	/* Comparator only mode SG */
+#define MC33978_REG_LPM_VT_SP	0x28	/* LPM voltage threshold SP */
+#define MC33978_REG_LPM_VT_SG	0x2a	/* LPM voltage threshold SG */
+#define MC33978_REG_IP_SP	0x2c	/* Polling current SP */
+#define MC33978_REG_IP_SG	0x2e	/* Polling current SG */
+#define MC33978_REG_SPOLL_SP	0x30	/* Slow polling SP */
+#define MC33978_REG_SPOLL_SG	0x32	/* Slow polling SG */
+#define MC33978_REG_WDEB_SP	0x34	/* Wake-up debounce SP */
+#define MC33978_REG_WDEB_SG	0x36	/* Wake-up debounce SG */
+#define MC33978_REG_ENTER_LPM	0x38	/* Enter low-power mode (write-only) */
+#define MC33978_REG_AMUX_CTRL	0x3a	/* AMUX control */
+#define MC33978_REG_READ_IN	0x3e	/* Read switch status (READ_SW in datasheet) */
+#define MC33978_REG_FAULT	0x42	/* Fault status register */
+#define MC33978_REG_IRQ		0x46	/* Interrupt request (write-only) */
+#define MC33978_REG_RESET	0x48	/* Reset (write-only) */
+
+/*
+ * FAULT Register (0x42) bit definitions
+ * Reading this register clears most fault flags except persistent conditions
+ */
+#define MC33978_FAULT_SPI_ERROR	BIT(10)	/* SPI communication error */
+#define MC33978_FAULT_HASH	BIT(9)	/* SPI register hash mismatch */
+#define MC33978_FAULT_UV	BIT(7)	/* VBATP undervoltage */
+#define MC33978_FAULT_OV	BIT(6)	/* VBATP overvoltage */
+#define MC33978_FAULT_TEMP_WARN	BIT(5)	/* Temperature warning threshold */
+#define MC33978_FAULT_OT	BIT(4)	/* Over-temperature */
+#define MC33978_FAULT_INTB_WAKE	BIT(3)	/* Woken by INT_B pin */
+#define MC33978_FAULT_WAKEB_WAKE BIT(2)	/* Woken by WAKE_B pin */
+#define MC33978_FAULT_SPI_WAKE	BIT(1)	/* Woken by SPI message */
+#define MC33978_FAULT_POR	BIT(0)	/* Power-on reset occurred */
+
+/* Critical faults that need immediate attention */
+#define MC33978_FAULT_CRITICAL	(MC33978_FAULT_UV | \
+				 MC33978_FAULT_OV | \
+				 MC33978_FAULT_OT)
+
+/* Bits relevant as hwmon alarms; excludes wake/reset/SPI status bits */
+#define MC33978_FAULT_ALARM_MASK	(MC33978_FAULT_UV | \
+					 MC33978_FAULT_OV | \
+					 MC33978_FAULT_TEMP_WARN | \
+					 MC33978_FAULT_OT)
+
+#define MC33978_NUM_PINS	22
+
+/*
+ * Virtual IRQ number for fault handling.
+ * Using hwirq 22 (beyond the 22 pin IRQs 0-21).
+ */
+#define MC33978_HWIRQ_FAULT	22
+
+/*
+ * AMUX channel definitions
+ * The AMUX can route one of 24 signals to the external AMUX pin
+ */
+#define MC33978_AMUX_CH_SG0	0	/* Switch-to-Ground inputs 0-13 */
+#define MC33978_AMUX_CH_SG13	13
+#define MC33978_AMUX_CH_SP0	14	/* Programmable switch inputs 0-7 */
+#define MC33978_AMUX_CH_SP7	21
+#define MC33978_AMUX_CH_TEMP	22	/* Internal temperature diode */
+#define MC33978_AMUX_CH_VBATP	23	/* Battery voltage sense */
+#define MC33978_NUM_AMUX_CH	24	/* Total number of AMUX channels */
+
+#endif /* _LINUX_MFD_MC33978_H */
-- 
2.47.3


