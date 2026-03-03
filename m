Return-Path: <linux-gpio+bounces-32419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l8xnELjmpmkRZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:48:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC61F0AF8
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F03F3176DF8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DC4426ECC;
	Tue,  3 Mar 2026 13:40:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBDE37DEB1
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545216; cv=none; b=V+1uNWGks2Kl1Xzq2eW/i+h3WCqTnAn8aAzyVrwxLTbae49aFCyENAZFfpYSj2zqcOyr4oIa80cbeoBlZ72HphifKcjCiwtkx8LlsaJYiBB7FY5jMIuMHs8QK7Svd3PgnfL/H5CeSYp4WhKQcu5siSCoZgEOsUxhO2cDT+MNsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545216; c=relaxed/simple;
	bh=8JM0gHYMYzYr4M7Cicd5puD0zlJYGgrU3gx5sAt5WIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVAKL9nBfDzzASapquyC8zE3tOXRf+slJEvj23YCez152JAaZrA3bkhU13FRLthCGBEMmj4d+5KiqGBl+hmVqwVp3suD+vBmsdRtqmveb4bNqqjPlF1jNPnV6bHPhdsVHZFlilnFOvEs/9ZuIebj25L/wSMU2AZe64UXpRG4ops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyX-0000VN-E2; Tue, 03 Mar 2026 14:39:49 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyV-003YXH-2J;
	Tue, 03 Mar 2026 14:39:49 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyW-00000004ie8-470R;
	Tue, 03 Mar 2026 14:39:48 +0100
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
Subject: [PATCH v2 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Date: Tue,  3 Mar 2026 14:39:44 +0100
Message-ID: <20260303133947.1123575-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303133947.1123575-1-o.rempel@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
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
X-Rspamd-Queue-Id: 8FDC61F0AF8
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32419-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:url,checkpatch.pl:url,pengutronix.de:mid,pengutronix.de:email]
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
changes v2:
- Translate all remaining German comments to English.
- Remove unnecessary #ifdef CONFIG_OF wrappers around dt_node_to_map.
- Add detailed comments to mc33978_get() and mc33978_get_multiple() explaining
  the hardware comparator logic (1 = closed, 0 = open) and justifying the
  bitwise inversion required to report actual physical voltage levels.
- Add comments to the .set() and .set_config() callbacks explaining why
  gpiolib's standard open-drain emulation (switching to input mode) fails on
  this hardware due to active wetting currents, and why tri-state isolation is
  mandatory.
- Add a comment to mc33978_gpio_to_irq() explaining why it must act as a
  proxy to the parent MFD's irq_domain (shared physical INT_B line with hwmon).
- Drop dummy pin group callbacks (get_groups_count, etc.). This relies on a
  preparatory patch in this series making these callbacks optional in the core.
- Fix debugfs 'pinconf-pins' read errors by correctly returning -ENOTSUPP
  instead of -EOPNOTSUPP for unsupported generic configurations.
- Fix empty 'gpio-ranges' and missing debugfs labels by explicitly calling
  gpiochip_add_pin_range() during probe.
- Eliminate "magic" bitwise math in the wetting current configuration by
  introducing a static lookup array (mc33978_wet_mA).
- Resolve checkpatch.pl strict warnings regarding macro argument reuse by
  converting MC33978_SPSG, MC33978_PINSHIFT, MC33978_WREG, and MC33978_WSHIFT
  to static inline functions.
- Remove artifacts from previous interrupt handling implementations.
- Address minor formatting and whitespace nits.
---
 drivers/pinctrl/Kconfig           |  14 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-mc33978.c | 733 ++++++++++++++++++++++++++++++
 3 files changed, 748 insertions(+)
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
index 000000000000..69128b9012bd
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mc33978.c
@@ -0,0 +1,733 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 David Jander <david@protonic.nl>, Protonic Holland
+ * Copyright (C) 2026 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ *
+ * MC33978/MC34978 Multiple Switch Detection Interface - Pinctrl/GPIO Driver
+ *
+ * Provides GPIO and pinctrl interfaces for the 22 switch detection inputs.
+ * Handles digital input reading and wetting current configuration. Analog AMUX
+ * functionality is handled by a separate mux driver.
+ *
+ * GPIO Mapping:
+ * - GPIO 0-13:  SG0-SG13 (Switch-to-Ground inputs)
+ * - GPIO 14-21: SP0-SP7 (Programmable: Switch-to-Ground or Switch-to-Battery)
+ * This is dictated by the READ_IN register where bits [21:14] = SP[7:0]
+ * and bits [13:0] = SG[13:0].
+ *
+ * Register Organization:
+ * Configuration registers are generally paired. The _SP register at offset N
+ * controls SP0-SP7, and the _SG register at offset N+2 controls SG0-SG13.
+ *
+ * Wetting Currents vs. Pull Resistors:
+ * The hardware physically lacks traditional passive pull-up or pull-down
+ * resistors. Instead, it uses active, controllable current regulators
+ * (wetting currents) to detect switch states and clean mechanical contacts.
+ * - Because these are active current sources, specifying an ohmic value for
+ * pull-up/down biases is physically invalid. The driver ignores ohm arguments.
+ * - 8 selectable current values: 2, 6, 8, 10, 12, 14, 16, 20 mA.
+ * - Exposed via the pinconf PIN_CONFIG_DRIVE_STRENGTH parameter (in mA).
+ *
+ * Emulated Outputs:
+ * The hardware lacks traditional push-pull output drivers; it is strictly an
+ * input device. "Outputs" are simulated by toggling the wetting currents and
+ * physically isolating the pins via hardware tri-state registers. Consequently,
+ * consumers MUST flag outputs with GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE in
+ * the Device Tree.
+ *
+ * Input Detection Mechanics:
+ * This input mechanism relies on the active current regulators rather than
+ * passive hard resistors. For a Switch-to-Ground (SG) pin, the chip sources
+ * a constant current. When the switch is open, the pin voltage floats up to
+ * the battery voltage. When the switch closes, it creates a path to ground;
+ * because the current is strictly regulated, the pin voltage drops sharply
+ * below the internal 4.0V comparator threshold.
+ * * The hardware evaluates this and reports an abstract "contact status"
+ * (1 = closed, 0 = open). For SG pins, a closed switch (~0V) reports as '1'.
+ * To align with gpiolib expectations where ~0V equals a physical logical '0',
+ * this driver explicitly inverts the hardware status for all SG-configured
+ * pins before reporting them.
+ *
+ * Interrupts:
+ * The physical INT_B line and threaded IRQ domain are managed centrally by
+ * the parent MFD core. This driver simply proxies .to_irq() to the parent.
+ *
+ * Written by David Jander <david@protonic.nl>
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
+#define MC33978_SP_MASK		GENMASK(MC33978_NGPIO - 1, MC33978_NUM_SG)
+#define MC33978_SG_MASK		GENMASK(MC33978_NUM_SG - 1, 0)
+#define MC33978_SG_SHIFT	0
+#define MC33978_SP_SHIFT	MC33978_NUM_SG
+
+#define MC33978_TRISTATE	0
+#define MC33978_PU		1
+#define MC33978_PD		2
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
+	/*
+	 * Protects multi-register hardware sequences in .set() and atomic
+	 * READ_IN + CONFIG reads in .get()
+	 */
+	struct mutex lock;
+};
+
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
+static inline bool mc33978_is_sp(unsigned int pin)
+{
+	return pin >= MC33978_NUM_SG;
+}
+
+/* Choose register offset for _SG/_SP registers. reg is always the _SP addr. */
+static inline u8 mc33978_spsg(u8 reg, unsigned int pin)
+{
+	return mc33978_is_sp(pin) ? reg : reg + 2;
+}
+
+/* Get the bit index into the corresponding register */
+static inline unsigned int mc33978_pinshift(unsigned int pin)
+{
+	return mc33978_is_sp(pin) ? pin - MC33978_NUM_SG : pin;
+}
+
+#define MC33978_PINMASK(pin)	BIT(mc33978_pinshift(pin))
+
+/*
+ * Wetting current registers: 3 in total, each pin uses a 3-bit field,
+ * 8 pins per register, except for the last one.
+ */
+static inline u8 mc33978_wreg(u8 reg, unsigned int pin)
+{
+	return reg + (mc33978_is_sp(pin) ? 0 : 2 + 2 * (pin / 8));
+}
+
+static inline unsigned int mc33978_wshift(unsigned int pin)
+{
+	return mc33978_is_sp(pin) ? 3 * (pin - MC33978_NUM_SG) : 3 * (pin % 8);
+}
+
+#define MC33978_WMASK(pin)	(7 << mc33978_wshift(pin))
+
+static int mc33978_read(struct mc33978_pinctrl *mpc, u8 reg, u32 *val)
+{
+	int ret;
+
+	ret = regmap_read(mpc->regmap, reg, val);
+	if (ret)
+		dev_err_ratelimited(mpc->dev, "Regmap read error %d at reg: %02x.\n",
+				    ret, reg);
+	return ret;
+}
+
+static int mc33978_update_bits(struct mc33978_pinctrl *mpc, u8 reg, u32 mask, u32 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(mpc->regmap, reg, mask, val);
+	if (ret)
+		dev_err_ratelimited(mpc->dev, "Regmap update bits error %d at reg: %02x.\n",
+				    ret, reg);
+	return ret;
+}
+
+static const struct pinctrl_ops mc33978_pinctrl_ops = {
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int mc33978_get_pull(struct mc33978_pinctrl *mpc, unsigned int pin, int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = mc33978_read(mpc, mc33978_spsg(MC33978_REG_TRI_SP, pin), &data);
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
+	if (!mc33978_is_sp(pin)) {
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
+	unsigned int mask = MC33978_PINMASK(pin);
+	int ret;
+
+	/* SG pins physically lack pull-downs current sources */
+	if (val == MC33978_PD && !mc33978_is_sp(pin))
+		return -EINVAL;
+
+	/* Configure direction (Exclusively for SP pins) */
+	if (mc33978_is_sp(pin) && val != MC33978_TRISTATE) {
+		ret = mc33978_update_bits(mpc, MC33978_REG_CONFIG, mask,
+					  (val == MC33978_PD) ? mask : 0);
+		if (ret)
+			return ret;
+	}
+
+	/* Enable current source or set to tri-state  */
+	ret = mc33978_update_bits(mpc, mc33978_spsg(MC33978_REG_TRI_SP, pin),
+				  mask,
+				  (val == MC33978_TRISTATE) ? mask : 0);
+	return ret;
+}
+
+static const unsigned int mc33978_wet_mA[] = { 2, 6, 8, 10, 12, 14, 16, 20 };
+
+static int mc33978_set_ds(struct mc33978_pinctrl *mpc, unsigned int pin,
+			  unsigned int val)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mc33978_wet_mA); i++) {
+		if (val == mc33978_wet_mA[i]) {
+			return mc33978_update_bits(mpc,
+					mc33978_wreg(MC33978_REG_WET_SP, pin),
+					MC33978_WMASK(pin),
+					i << mc33978_wshift(pin));
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int mc33978_get_ds(struct mc33978_pinctrl *mpc, unsigned int pin,
+			  unsigned int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = mc33978_read(mpc, mc33978_wreg(MC33978_REG_WET_SP, pin), &data);
+	if (ret)
+		return ret;
+
+	data &= MC33978_WMASK(pin);
+	data >>= mc33978_wshift(pin);
+
+	if (data >= ARRAY_SIZE(mc33978_wet_mA))
+		return -EINVAL;
+
+	*val = mc33978_wet_mA[data];
+
+	return 0;
+}
+
+static int mc33978_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			       unsigned long *config)
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
+		/*
+		 * Ignore checkpatch warning: the pinctrl core specifically
+		 * expects -ENOTSUPP to silently skip unsupported generic
+		 * parameters. Using -EOPNOTSUPP causes debugfs read failures.
+		 */
+		return -ENOTSUPP;
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
+			       unsigned long *configs, unsigned int num_configs)
+{
+	struct mc33978_pinctrl *mpc = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	int ret = 0;
+	u32 arg;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		/*
+		 * The hardware physically lacks push-pull output drivers.
+		 * By explicitly handling OPEN_DRAIN and OPEN_SOURCE here, we
+		 * signal to gpiolib that we support these modes "natively".
+		 * This crucially prevents gpiolib from falling back to its
+		 * software emulation (which sets the pin to input mode to
+		 * achieve High-Z). On the MC33978, input mode is NOT High-Z;
+		 * it actively drives the line with a wetting current!
+		 */
+		switch (param) {
+		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+			ret = mc33978_set_pull(mpc, pin, MC33978_PU);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!mc33978_is_sp(pin)) {
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
+			/*
+			 * Required by the pinctrl core to safely fall back or
+			 * skip unsupported configs. Do not use -EOPNOTSUPP.
+			 */
+			return -ENOTSUPP;
+		}
+
+		if (ret) {
+			dev_err(mpc->dev, "Failed to set config param %04x for pin %u: %d\n",
+				param, pin, ret);
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
+	mc33978_update_bits(mpc, mc33978_spsg(MC33978_REG_TRI_SP, offset),
+			    MC33978_PINMASK(offset), 0);
+	mutex_unlock(&mpc->lock);
+
+	return 0;
+}
+
+static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	bool is_switch_to_ground = true;
+	bool is_switch_closed;
+	int status, ret;
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
+	if (mc33978_is_sp(offset)) {
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
+	/*
+	 * The hardware evaluates pin voltage against a threshold (default 4.0V)
+	 * and reports an abstract contact status (1 = closed, 0 = open):
+	 *
+	 * SG (Switch-to-Ground) topology (pull-up current source):
+	 * - Voltage > Threshold: Switch Open   (HW reports 0) -> Physical High
+	 * - Voltage < Threshold: Switch Closed (HW reports 1) -> Physical Low
+	 *
+	 * SB (Switch-to-Battery) topology (pull-down current source):
+	 * - Voltage > Threshold: Switch Closed (HW reports 1) -> Physical High
+	 * - Voltage < Threshold: Switch Open   (HW reports 0) -> Physical Low
+	 *
+	 * We translate this contact status back into physical voltage levels.
+	 * This translation is necessary because the hardware's contact status
+	 * (e.g., reporting 1 when an SG pin is grounded) contradicts the
+	 * typical GPIO expectation where ~0V corresponds to a logical 0.
+	 */
+	if (is_switch_to_ground)
+		status = !is_switch_closed;
+	else
+		status = is_switch_closed;
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
+	 * Create an inversion mask for all pins currently operating in
+	 * Switch-to-Ground (SG) topology. As explained in mc33978_get(),
+	 * SG pins must have their hardware status bits inverted to
+	 * correctly report their physical voltage levels.
+	 */
+	inv_mask = MC33978_SG_MASK |
+		   (~(config_reg << MC33978_NUM_SG) & MC33978_SP_MASK);
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
+	 * We emulate open-drain/-source outputs by routing or isolating the
+	 * active wetting current sources.
+	 * To drive the line, we apply the current source.
+	 * To turn the line OFF (achieve High-Impedance), we MUST use the
+	 * hardware TRI_SP / TRI_SG tri-state registers to physically isolate
+	 * it.
+	 */
+	if (mc33978_is_sp(offset)) {
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
+		ret = mc33978_update_bits(mpc, mc33978_spsg(MC33978_REG_TRI_SP,
+							    offset),
+					  MC33978_PINMASK(offset), 0);
+	} else {
+		/*
+		 * Turn OFF: Isolate the pin first by enabling tri-state,
+		 * then safely disable the underlying current source.
+		 */
+		ret = mc33978_update_bits(mpc, mc33978_spsg(MC33978_REG_TRI_SP,
+							    offset),
+					  MC33978_PINMASK(offset),
+					  MC33978_PINMASK(offset));
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
+	unsigned int sgmask = (*mask & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	unsigned int sgbits = (*bits & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	unsigned int spmask = (*mask & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+	unsigned int spbits = (*bits & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
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
+				    int value)
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
+	/*
+	 * The hardware shares a single physical INT_B line for both GPIO pin
+	 * changes and internal hardware faults (hwmon). Therefore, the IRQ
+	 * domain and threaded handler are centrally managed by the MFD core.
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
+	mpc->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!mpc->regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+
+	mpc->domain = irq_find_host(dev->parent->of_node);
+	if (!mpc->domain)
+		return dev_err_probe(dev, -ENODEV, "Failed to find parent IRQ domain\n");
+
+	mutex_init(&mpc->lock);
+
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
+	ret = gpiochip_add_pin_range(&mpc->chip, dev_name(dev), 0, 0,
+				     MC33978_NGPIO);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add pin range\n");
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


