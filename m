Return-Path: <linux-gpio+bounces-32186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBsIA9sun2lXZQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:18:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194C19B663
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 781CA30263DB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A943E9F88;
	Wed, 25 Feb 2026 17:16:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65C3ECBE6
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039777; cv=none; b=AjwKMGNHdm1/V4DAXKhf8kYzKtD9dxcIFxtM3auOcTpzaMd5F12mel98nMrmeER7DsUUknv7WkdTpOLo1Py928T5KJ6H3NFWW6bcxmKjcntBBxb7F5Kjf383rgoaheQVu+Npg2bdJ5QXZkL1UI4+kN9pprx1heCZW3zAO7I15Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039777; c=relaxed/simple;
	bh=4yalSH6BsmtbbKi0NAMSUSiOoaUpbZPTkkKFlmhTdEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdDxBf72vgRYFwoq3lcOR0iuWR+QyGpPRCw3HDedoyhubDr4gryJfe216xAg6oOwvFjQhxZhY+FU/MsBDHYr7zVY/7h9tWZLF354Q7zYChQjjkbn5Pz8fLUKdZTz5Cx3numzi6AxjdnLDrjSTySenDrDoeIlVHog4LPfmHKJ5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003CA-S9; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b7z-2T;
	Wed, 25 Feb 2026 18:15:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-00000008JE4-025N;
	Wed, 25 Feb 2026 18:15:47 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: David Jander <david@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v1 4/8] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Date: Wed, 25 Feb 2026 18:15:37 +0100
Message-ID: <20260225171545.1980385-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225171545.1980385-1-o.rempel@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
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
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32186-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:email,nxp.com:url,pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9194C19B663
X-Rspamd-Action: no action

From: David Jander <david@protonic.nl>

Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple
Switch Detection Interface (MSDI) devices.

This driver exposes the 22 mechanical switch detection inputs (14
Switch-to-Ground, 8 Programmable) as standard GPIOs.

Key features implemented:
- GPIO read/write: Translates physical switch states (open/closed)
  to logical GPIO levels based on the configured switch topology
  (Switch-to-Ground vs. Switch-to-Battery).
- Emulated Output: Allows setting pins "high" or "low" by manipulating
  the tri-state registers and hardware pull topologies.
- Interrupt routing: Proxies GPIO interrupt requests to the irq_domain
  managed by the parent MFD core driver.

Signed-off-by: David Jander <david@protonic.nl>
Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/pinctrl/Kconfig           |  14 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-mc33978.c | 709 ++++++++++++++++++++++++++++++
 3 files changed, 724 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f53..c315656c0fe5 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -388,6 +388,20 @@ config PINCTRL_MAX77620
 	  function in alternate mode. This driver also configure push-pull,
 	  open drain, FPS slots etc.
 
+config PINCTRL_MC33978
+	tristate "MC33978/MC34978 industrial input controller support"
+	depends on MFD_MC33978
+	select GPIOLIB
+	select GENERIC_PINCONF
+	help
+	  Say Y here to enable support for NXP MC33978/MC34978 Multiple
+	  Switch Detection Interface (MSDI) devices. This driver provides
+	  pinctrl and GPIO interfaces for the 22 mechanical switch inputs
+	  (14 Switch-to-Ground, 8 Programmable).
+
+	  It allows reading switch states, configuring hardware pull
+	  topologies, and handling interrupts for state changes.
+
 config PINCTRL_MCP23S08_I2C
 	tristate
 	select REGMAP_I2C
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..afb58fb5a197 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o
 obj-$(CONFIG_PINCTRL_LPC18XX)	+= pinctrl-lpc18xx.o
 obj-$(CONFIG_PINCTRL_MAX7360)	+= pinctrl-max7360.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
+obj-$(CONFIG_PINCTRL_MC33978)	+= pinctrl-mc33978.o
 obj-$(CONFIG_PINCTRL_MCP23S08_I2C)	+= pinctrl-mcp23s08_i2c.o
 obj-$(CONFIG_PINCTRL_MCP23S08_SPI)	+= pinctrl-mcp23s08_spi.o
 obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-mc33978.c
new file mode 100644
index 000000000000..e62bc0b7c6e3
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mc33978.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MC33978/MC33978 Multiple Switch Detection Interface - Pinctrl/GPIO Driver
+ *
+ * Driver Purpose:
+ * ===============
+ * Provides GPIO and pinctrl interfaces for the 22 switch detection inputs.
+ * Handles digital input reading, interrupt processing, and wetting current
+ * configuration. (Analog AMUX functionality will be handled by separate IIO driver)
+ *
+ * GPIO Number to Hardware Input Mapping:
+ * =======================================
+ * GPIO 0-13:  SG0-SG13 (Switch-to-Ground inputs)
+ * GPIO 14-21: SP0-SP7 (Programmable: Switch-to-Ground or Switch-to-Battery)
+ *
+ * This mapping is dictated by the READ_IN register bit layout where
+ * bits [21:14] = SP[7:0] and bits [13:0] = SG[13:0].
+ *
+ * Register Organization:
+ * ======================
+ * Most configuration registers are paired:
+ * - _SP register at offset N controls SP0-SP7
+ * - _SG register at offset N+2 controls SG0-SG13
+ * Helper macros MC33978_SPSG() and MC33978_PINSHIFT() handle this mapping.
+ *
+ * Wetting Current Configuration:
+ * ===============================
+ * - 8 selectable values: 2, 6, 8, 10, 12, 14, 16, 20 mA (3-bit encoding)
+ * - Stored in WET_SP (0x08), WET_SG0 (0x0a), WET_SG1 (0x0c)
+ * - Each input uses 3 bits, 8 inputs per register
+ * - Exposed via pinconf PIN_CONFIG_DRIVE_STRENGTH parameter (in mA)
+ *
+ * Interrupt Handling:
+ * ===================
+ * - Device asserts INT_B when any enabled input changes state
+ * - Driver must read READ_IN to get current state and clear INT_B
+ * - Previous state stored in mpc->state to compute edges
+ * - Per-input interrupt enable via IE_SP/IE_SG registers
+ * - IRQ handler and child IRQ operations run in threaded context (can sleep)
+ *
+ * Regcache Management:
+ * ====================
+ * - READ_IN is volatile (always re-read from hardware)
+ * - Configuration registers are cached by regmap
+ * - irq_bus_lock/unlock pattern batches multiple register writes into single
+ *   SPI transaction for efficiency when configuring multiple IRQs
+ *
+ * Copyright 2024 Protonic Holland
+ * Written by David Jander <david@protonic.nl>
+ * Based loosely on pinctrl-mcp23s08
+ *
+ * Datasheet:
+ * https://www.nxp.com/docs/en/data-sheet/MC33978.pdf
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#include <linux/mfd/mc33978.h>
+
+#define MC33978_NGPIO		22
+
+/*
+ * Input numbering is dictated by bit-order of the input register:
+ * Inputs 0-13 -> SG0-SG13
+ * Inputs 14-21 -> SP0-SP7
+ */
+#define MC33978_NUM_SG		14
+#define MC33978_IS_SP(pin)	((pin) >= MC33978_NUM_SG)
+#define MC33978_SP_MASK		GENMASK(MC33978_NGPIO - 1, MC33978_NUM_SG)
+#define MC33978_SG_MASK		GENMASK(MC33978_NUM_SG - 1, 0)
+#define MC33978_SG_SHIFT	0
+#define MC33978_SP_SHIFT	MC33978_NUM_SG
+
+/* Choose register offset for _SG/_SP registers. reg is always the _SP addr. */
+#define MC33978_SPSG(reg, pin)	(MC33978_IS_SP(pin) ? (reg) : (reg) + 2)
+
+/* Get the bit index into the corresponding register */
+#define MC33978_PINSHIFT(pin)	(MC33978_IS_SP(pin) ? (pin) - MC33978_NUM_SG : (pin))
+#define MC33978_PINMASK(pin)	BIT(MC33978_PINSHIFT(pin))
+
+/*
+ * The same thing for the wetting current registers, but those are 3 in total
+ * and each pin uses a 3-bit field, 8 pins per register, except for the last
+ * one.
+ */
+#define MC33978_WREG(reg, pin)	((reg) + (MC33978_IS_SP(pin) ? \
+			0 : 2 + 2 * ((pin) / 8)))
+#define MC33978_WSHIFT(pin)	(MC33978_IS_SP(pin) ? \
+		(3 * ((pin) - MC33978_NUM_SG)) : (3 * ((pin) % 8)))
+#define MC33978_WMASK(pin)	(7 << MC33978_WSHIFT(pin))
+
+#define MC33978_TRISTATE	0
+#define MC33978_PU		1
+#define MC33978_PD		2
+
+
+
+struct mc33978_pinctrl {
+	struct device *dev;
+	struct regmap *regmap;
+	int irq;
+
+	struct irq_domain *domain;
+
+	struct gpio_chip chip;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pinctrl_desc;
+
+	/* Interrupt state management */
+	struct mutex lock;		/* Protects state, irq_rise/fall */
+	unsigned int state;		/* Last read input state */
+	unsigned int irq_rise;		/* Rising edge config mask */
+	unsigned int irq_fall;		/* Falling edge config mask */
+};
+static const struct pinctrl_pin_desc mc33978_pins[] = {
+	PINCTRL_PIN(0, "sg0"),
+	PINCTRL_PIN(1, "sg1"),
+	PINCTRL_PIN(2, "sg2"),
+	PINCTRL_PIN(3, "sg3"),
+	PINCTRL_PIN(4, "sg4"),
+	PINCTRL_PIN(5, "sg5"),
+	PINCTRL_PIN(6, "sg6"),
+	PINCTRL_PIN(7, "sg7"),
+	PINCTRL_PIN(8, "sg8"),
+	PINCTRL_PIN(9, "sg9"),
+	PINCTRL_PIN(10, "sg10"),
+	PINCTRL_PIN(11, "sg11"),
+	PINCTRL_PIN(12, "sg12"),
+	PINCTRL_PIN(13, "sg13"),
+	PINCTRL_PIN(14, "sp0"),
+	PINCTRL_PIN(15, "sp1"),
+	PINCTRL_PIN(16, "sp2"),
+	PINCTRL_PIN(17, "sp3"),
+	PINCTRL_PIN(18, "sp4"),
+	PINCTRL_PIN(19, "sp5"),
+	PINCTRL_PIN(20, "sp6"),
+	PINCTRL_PIN(21, "sp7"),
+};
+
+static int mc33978_read(struct mc33978_pinctrl *mpc, u8 reg, u32 *val)
+{
+	int ret = regmap_read(mpc->regmap, reg, val);
+
+	if (ret)
+		dev_err_ratelimited(mpc->dev,
+				"Regmap read error %d at reg: %02x.\n",
+				ret, reg);
+	return ret;
+}
+
+static int mc33978_update_bits(struct mc33978_pinctrl *mpc, u8 reg, u32 mask, u32 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(mpc->regmap, reg, mask, val);
+	if (ret)
+		dev_err_ratelimited(mpc->dev,
+				"Regmap update bits error %d at reg: %02x.\n",
+				ret, reg);
+	return ret;
+}
+
+static int mc33978_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return 0;
+}
+
+static const char *mc33978_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+							unsigned int group)
+{
+	return NULL;
+}
+
+static int mc33978_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+						unsigned int group,
+						const unsigned int **pins,
+						unsigned int *num_pins)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct pinctrl_ops mc33978_pinctrl_ops = {
+	.get_groups_count = mc33978_pinctrl_get_groups_count,
+	.get_group_name = mc33978_pinctrl_get_group_name,
+	.get_group_pins = mc33978_pinctrl_get_group_pins,
+#ifdef CONFIG_OF
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinconf_generic_dt_free_map,
+#endif
+};
+
+static int mc33978_get_pull(struct mc33978_pinctrl *mpc, unsigned int pin, int *val)
+{
+	int ret;
+	unsigned int data;
+
+	ret = mc33978_read(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, pin), &data);
+	if (ret < 0)
+		return ret;
+
+	/* Is the pin tri-stated? */
+	if (data & MC33978_PINMASK(pin)) {
+		*val = MC33978_TRISTATE;
+		return 0;
+	}
+
+	/* Pins 0..13 only support pull-up */
+	if (!MC33978_IS_SP(pin)) {
+		*val = MC33978_PU;
+		return 0;
+	}
+
+	/* Check pin pull direction for pins 14..21 */
+	ret = mc33978_read(mpc, MC33978_REG_CONFIG, &data);
+	if (ret < 0)
+		return ret;
+	if (data & MC33978_PINMASK(pin))
+		*val = MC33978_PD;
+	else
+		*val = MC33978_PU;
+	return 0;
+}
+
+static int mc33978_set_pull(struct mc33978_pinctrl *mpc, unsigned int pin, int val)
+{
+	int ret;
+	unsigned int mask = MC33978_PINMASK(pin);
+
+	/* 1. Hardware-Schutz: SG-Pins haben physikalisch keine Pull-Downs */
+	if ((val == MC33978_PD) && !MC33978_IS_SP(pin))
+		return -EINVAL;
+
+	/* 2. Richtung konfigurieren (Ausschließlich für SP-Pins) */
+	if (MC33978_IS_SP(pin) && val != MC33978_TRISTATE) {
+		/* CONFIG (0x02): 0 = Switch-to-Ground (PU), 1 = Switch-to-Battery (PD) */
+		ret = mc33978_update_bits(mpc, MC33978_REG_CONFIG, mask,
+					  (val == MC33978_PD) ? mask : 0);
+		if (ret)
+			return ret;
+	}
+
+	/* 3. Pull-Widerstand aktivieren oder in Tri-State versetzen
+	 * TRI-Register: 0 = Pull aktiv, 1 = Tri-State (Hochohmig)
+	 */
+	ret = mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, pin),
+				  mask,
+				  (val == MC33978_TRISTATE) ? mask : 0);
+	return ret;
+}
+
+static int mc33978_get_ds(struct mc33978_pinctrl *mpc, unsigned int pin,
+		unsigned int *val)
+{
+	int ret;
+	unsigned int data;
+
+	ret = mc33978_read(mpc, MC33978_WREG(MC33978_REG_WET_SP, pin), &data);
+	if (ret)
+		return ret;
+
+	data &= MC33978_WMASK(pin);
+	data >>= MC33978_WSHIFT(pin);
+
+	/* DS levels: 2, 6, 8, 10, 12, 14, 16, 20mA */
+	if (!data)
+		*val = 2;
+	else if (data == 7)
+		*val = 20;
+	else
+		*val = (data + 2) * 2;
+
+	return 0;
+}
+
+static int mc33978_set_ds(struct mc33978_pinctrl *mpc, unsigned int pin,
+		unsigned int val)
+{
+	int ret;
+
+	/* DS levels: 2, 6, 8, 10, 12, 14, 16, 20mA */
+	if ((val < 2) || (val > 20) || (val == 4) || (val == 18) || (val & 1))
+		return -EOPNOTSUPP;
+
+	val >>= 1;
+	val--;
+	if (val)
+		val--;
+	if (val > 7)
+		val = 7;
+	ret = mc33978_update_bits(mpc, MC33978_WREG(MC33978_REG_WET_SP, pin),
+			MC33978_WMASK(pin),
+			val << MC33978_WSHIFT(pin));
+
+	return ret;
+}
+
+static int mc33978_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+		unsigned long *config)
+{
+	struct mc33978_pinctrl *mpc = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int data, status;
+	int ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ret = mc33978_get_pull(mpc, pin, &data);
+		if (ret)
+			return ret;
+		status = (data == MC33978_PU);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = mc33978_get_pull(mpc, pin, &data);
+		if (ret)
+			return ret;
+		status = (data == MC33978_PD);
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		ret = mc33978_get_pull(mpc, pin, &data);
+		if (ret)
+			return ret;
+		status = (data == MC33978_TRISTATE);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		ret = mc33978_get_ds(mpc, pin, &data);
+		if (ret)
+			return ret;
+		*config = pinconf_to_config_packed(param, data);
+		status = 1;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return status ? 0 : -EINVAL;
+}
+
+/*
+ * Hardware constraint regarding PIN_CONFIG_BIAS_PULL_UP/DOWN:
+ * The MC33978 utilizes active constant current sources (wetting currents)
+ * rather than passive pull-resistors. Since the equivalent ohmic resistance
+ * scales dynamically with the fluctuating board voltage (VBATP), computing
+ * a static ohm value is physically invalid.
+ * The driver intentionally ignores resistance arguments during configuration
+ * and continuously reports 0 ohms to the pinctrl framework.
+ */
+static int mc33978_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+		unsigned long *configs, unsigned int num_configs)
+{
+	struct mc33978_pinctrl *mpc = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	u32 arg;
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+			ret = mc33978_set_pull(mpc, pin, MC33978_PU);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!MC33978_IS_SP(pin)) {
+				dev_err(mpc->dev, "Pin %u is SG and does not support pull-down\n",
+					pin);
+				return -EINVAL;
+			}
+			ret = mc33978_set_pull(mpc, pin, MC33978_PD);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			arg /= 1000;
+			fallthrough;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			ret = mc33978_set_ds(mpc, pin, arg);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		if (ret) {
+			dev_err(mpc->dev, "Failed to set config param %04x for pin %u: %d\n",
+					param, pin, ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static const struct pinconf_ops mc33978_pinconf_ops = {
+	.pin_config_get = mc33978_pinconf_get,
+	.pin_config_set = mc33978_pinconf_set,
+	.is_generic = true,
+};
+
+static int mc33978_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+
+	/*
+	 * This chip only has inputs. We emulate outputs by setting a
+	 * wetting current and/or using the tri-state register to turn it on
+	 * and off. If a pin was an output and is now tri-stated, we should
+	 * disable the tri-state now to make the input work correctly.
+	 */
+	mutex_lock(&mpc->lock);
+	mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, offset),
+			MC33978_PINMASK(offset), 0);
+	mutex_unlock(&mpc->lock);
+
+	return 0;
+}
+
+static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	int status, ret;
+	bool is_switch_closed;
+	bool is_switch_to_ground = true; /* Default for all SG pins */
+
+	mutex_lock(&mpc->lock);
+
+	/* Read hardware switch status (open or closed) */
+	ret = mc33978_read(mpc, MC33978_REG_READ_IN, &status);
+	if (ret < 0) {
+		mutex_unlock(&mpc->lock);
+		return 0;
+	}
+	is_switch_closed = !!(status & BIT(offset));
+
+	/* Determine current topology for SP pins */
+	if (MC33978_IS_SP(offset)) {
+		int config_reg;
+
+		ret = mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
+		if (ret == 0) {
+			/* CONFIG: 0 = Switch-to-Ground (PU), 1 = Switch-to-Battery (PD) */
+			if (config_reg & MC33978_PINMASK(offset))
+				is_switch_to_ground = false;
+		}
+	}
+
+	mutex_unlock(&mpc->lock);
+
+	/* Translate hardware switch semantics to logical GPIO levels */
+	if (is_switch_to_ground) {
+		/* SG: Switch open -> High (1), Switch to GND -> Low (0) */
+		status = !is_switch_closed;
+	} else {
+		/* SB: Switch open -> Low (0), Switch to Vbat -> High (1) */
+		status = is_switch_closed;
+	}
+
+	return status;
+}
+
+static int mc33978_get_multiple(struct gpio_chip *chip,
+				unsigned long *mask, unsigned long *bits)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	unsigned int status;
+	unsigned int config_reg = 0;
+	unsigned int inv_mask;
+	int ret;
+
+	mutex_lock(&mpc->lock);
+
+	ret = mc33978_read(mpc, MC33978_REG_READ_IN, &status);
+	if (ret)
+		goto out_unlock;
+
+	/* Read CONFIG register only if the requested mask involves SP pins */
+	if (*mask & MC33978_SP_MASK) {
+		ret = mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
+		if (ret)
+			goto out_unlock;
+	}
+
+	/*
+	 * SG pins (0-13) are always Switch-to-Ground.
+	 * SP pins (14-21) are Switch-to-Ground if their CONFIG bit is 0.
+	 * Switch-to-Ground logic: HW bit 0 (open) -> Logical 1 (High)
+	 * HW bit 1 (closed) -> Logical 0 (Low)
+	 * We create a mask for all Switch-to-Ground pins and XOR the status.
+	 */
+	inv_mask = MC33978_SG_MASK | (~(config_reg << MC33978_NUM_SG) & MC33978_SP_MASK);
+
+	*bits = (status ^ inv_mask) & *mask;
+
+out_unlock:
+	mutex_unlock(&mpc->lock);
+
+	return ret;
+}
+
+static int mc33978_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	int pull;
+	int ret;
+
+	/*
+	 * We only have inputs with wetting current sources, that we mis-use
+	 * as open-drain/-source outputs.
+	 */
+	if (MC33978_IS_SP(offset)) {
+		pull = value ? MC33978_PU : MC33978_PD;
+		value = 1;
+	} else {
+		pull = MC33978_PU;
+	}
+
+	mutex_lock(&mpc->lock);
+
+	/*
+	 * Break-before-make sequencing to prevent hardware glitches (spikes).
+	 * Since SPI transfers take time, writing the pull and tri-state
+	 * registers in the wrong order causes a brief moment where current
+	 * flows to the pin before it is masked, causing a visible LED flash.
+	 */
+	if (value) {
+		/*
+		 * Turn ON: Configure the underlying current source (pull) first,
+		 * then route it to the pin by disabling tri-state.
+		 */
+		ret = mc33978_set_pull(mpc, offset, pull);
+		if (ret)
+			goto out_unlock;
+
+		ret = mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, offset),
+					  MC33978_PINMASK(offset), 0);
+	} else {
+		/*
+		 * Turn OFF: Isolate the pin first by enabling tri-state,
+		 * then safely disable the underlying current source.
+		 */
+		ret = mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, offset),
+					  MC33978_PINMASK(offset), MC33978_PINMASK(offset));
+	}
+
+out_unlock:
+	mutex_unlock(&mpc->lock);
+
+	return ret;
+}
+
+static int mc33978_set_multiple(struct gpio_chip *chip,
+				unsigned long *mask, unsigned long *bits)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	unsigned int sgmask = (*mask & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	unsigned int sgbits = (*bits & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	unsigned int spmask = (*mask & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+	unsigned int spbits = (*bits & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+
+	mutex_lock(&mpc->lock);
+	if (spmask)
+		mc33978_update_bits(mpc, MC33978_REG_TRI_SP, spmask, ~spbits);
+	if (sgmask)
+		mc33978_update_bits(mpc, MC33978_REG_TRI_SG, sgmask, ~sgbits);
+	mutex_unlock(&mpc->lock);
+
+	return 0;
+}
+
+static int mc33978_direction_output(struct gpio_chip *chip, unsigned int offset,
+		int value)
+{
+	return mc33978_set(chip, offset, value);
+}
+
+static int mc33978_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	int virq;
+
+	if (!mpc->domain)
+		return -ENXIO;
+
+	/* * Erzeugt das Mapping zur Laufzeit (oder gibt ein bestehendes zurück).
+	 * Ohne diesen Aufruf bleibt die lineare IRQ-Domain leer.
+	 */
+	virq = irq_create_mapping(mpc->domain, offset);
+	if (!virq) {
+		dev_err(mpc->dev, "Failed to map hwirq %u to virq\n", offset);
+		return -ENXIO;
+	}
+
+	return virq;
+}
+
+static void mc33978_init_gpio_chip(struct mc33978_pinctrl *mpc,
+				   struct device *dev)
+{
+	mpc->chip.label = dev_name(dev);
+	mpc->chip.direction_input = mc33978_direction_input;
+	mpc->chip.get = mc33978_get;
+	mpc->chip.get_multiple = mc33978_get_multiple;
+	mpc->chip.direction_output = mc33978_direction_output;
+	mpc->chip.set = mc33978_set;
+	mpc->chip.set_multiple = mc33978_set_multiple;
+	mpc->chip.set_config = gpiochip_generic_config;
+
+	mpc->chip.to_irq = mc33978_gpio_to_irq;
+
+	mpc->chip.base = -1;
+	mpc->chip.ngpio = MC33978_NGPIO;
+	mpc->chip.can_sleep = true;
+	mpc->chip.parent = dev;
+	mpc->chip.owner = THIS_MODULE;
+}
+
+static void mc33978_init_pinctrl_desc(struct mc33978_pinctrl *mpc,
+				      struct device *dev)
+{
+	mpc->pinctrl_desc.name = dev_name(dev);
+
+	mpc->pinctrl_desc.pctlops = &mc33978_pinctrl_ops;
+	mpc->pinctrl_desc.confops = &mc33978_pinconf_ops;
+	mpc->pinctrl_desc.pins = mc33978_pins;
+	mpc->pinctrl_desc.npins = MC33978_NGPIO;
+	mpc->pinctrl_desc.owner = THIS_MODULE;
+}
+
+static int mc33978_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mc33978_pinctrl *mpc;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "Missing device tree node\n");
+
+	mpc = devm_kzalloc(dev, sizeof(*mpc), GFP_KERNEL);
+	if (!mpc)
+		return -ENOMEM;
+
+	mpc->dev = dev;
+
+	/* Get regmap from parent MFD device */
+	mpc->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!mpc->regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+
+	/*
+	 * Get IRQ domain from parent's interrupt-controller.
+	 * The parent (MFD) node has interrupt-controller properties,
+	 * so we can get the domain from there.
+	 */
+	mpc->domain = irq_find_host(dev->parent->of_node);
+	if (!mpc->domain)
+		return dev_err_probe(dev, -ENODEV, "Failed to find parent IRQ domain\n");
+
+	mutex_init(&mpc->lock);
+
+	/* 3. GPIO Chip Setup */
+	mc33978_init_gpio_chip(mpc, dev);
+	mc33978_init_pinctrl_desc(mpc, dev);
+
+	mpc->pctldev = devm_pinctrl_register(dev, &mpc->pinctrl_desc, mpc);
+	if (IS_ERR(mpc->pctldev))
+		return dev_err_probe(dev, PTR_ERR(mpc->pctldev),
+				     "can't register pinctrl\n");
+
+	ret = devm_gpiochip_add_data(dev, &mpc->chip, mpc);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "can't add GPIO chip\n");
+
+	platform_set_drvdata(pdev, mpc);
+
+	return 0;
+}
+
+static const struct of_device_id mc33978_pinctrl_of_match[] = {
+	{ .compatible = "nxp,mc33978-pinctrl" },
+	{ .compatible = "nxp,mc34978-pinctrl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mc33978_pinctrl_of_match);
+
+static struct platform_driver mc33978_pinctrl_driver = {
+	.driver = {
+		.name = "mc33978-pinctrl",
+		.of_match_table = mc33978_pinctrl_of_match,
+	},
+	.probe = mc33978_pinctrl_probe,
+};
+module_platform_driver(mc33978_pinctrl_driver);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_DESCRIPTION("NXP MC33978/MC33978 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


