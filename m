Return-Path: <linux-gpio+bounces-34613-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFHtNOyrzml+pQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34613-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:48:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844538CBF0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D553092AE9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 17:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA693EE1F6;
	Thu,  2 Apr 2026 17:44:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5593EFD1B
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151865; cv=none; b=Ag8uNGBFzSy1m7IxpxW5J/We3rkRbZt3SSyKx5FJk638Fd7or25oIZuBUh9Ah4SwZcHkySvNnqcwrCKen9tgpsCQHZWFuRdKKfKTz5ew5J5UI6TqQTk+r+sRE27nrpgBvNnWCo4vJTyJHIOoMdKqste/Jn91yCT8bHfli8np6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151865; c=relaxed/simple;
	bh=LYo/uEwIPvYd+KsBKtRhdyNm9l11tE04Y3LyGx3YDBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZscOO6ZmIgYvg5EqQEW4DwVaGn+TlnaJhzR2qTVuiV+9ztvA4wP7ahoPdBSFbEAcYqy/Jmv1KbkqtYaZlofrVgIgFr078s/uqcuVAJZABNrSQZfpTyAENwB1DZFGwyeUKxkIqKSLc/4+HMFN6BOy6CW1w3MPUV1jd5Ivj4R3IYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M59-000538-3w; Thu, 02 Apr 2026 19:43:51 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-003PUs-14;
	Thu, 02 Apr 2026 19:43:50 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-0000000DVpe-15Ll;
	Thu, 02 Apr 2026 19:43:50 +0200
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
Subject: [PATCH v11 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Date: Thu,  2 Apr 2026 19:43:47 +0200
Message-ID: <20260402174349.3220518-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402174349.3220518-1-o.rempel@pengutronix.de>
References: <20260402174349.3220518-1-o.rempel@pengutronix.de>
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
	TAGGED_FROM(0.00)[bounces-34613-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid,protonic.nl:email,checkpatch.pl:url,nxp.com:url]
X-Rspamd-Queue-Id: 5844538CBF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
  managed by the parent MFD core driver via a hierarchical irq_chip.

Signed-off-by: David Jander <david@protonic.nl>
Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Assisted-by: Gemini:gemini-3.1-pro Sashiko
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
changes v11:
- no changes
changes v10:
- Replace state macros with enum mc33978_bias_state and enum
  mc33978_drive_mode for better type safety.
- Add cached_drive array to isolate output drive topology from the input
  bias configuration (cached_bias).
- Decouple set_pull and set_drive functions to fix state leakage when
  switching between input and output modes.
- Add explicit comments explaining how hardware wetting currents are
  used to emulate standard pinctrl drive/pull modes.
- Initialize both bias and drive state caches directly from hardware
  registers during driver probe.
changes v9:
- Resolve probe fwnode directly from parent (`dev_fwnode(dev->parent)`) and
  fail early with `-ENODEV` if the parent firmware node is missing.
- Set child device node from this validated parent fwnode.
- Replace mutex_init() with devm_mutex_init()
- Add gpiochip_disable_irq/enable_irq calls in mask/unmask callbacks
  for proper gpiolib IRQ state tracking with IRQCHIP_IMMUTABLE
- Set DOMAIN_BUS_WIRED token for GPIO IRQ domain to distinguish from
  parent MFD domain sharing same fwnode
- Add explanatory comment about fwnode sharing and bus token isolation
  to prevent domain shadowing concerns
- select GPIOLIB_IRQCHIP and IRQ_DOMAIN_HIERARCHY
changes v8:
- Fix comment documentation to state the driver implements a hierarchical
  irq_chip instead of proxying .to_irq().
- Add missing <linux/irqdomain.h> include.
- Add .irq_set_wake = irq_chip_set_wake_parent to the gpio_irq_chip to
  properly proxy wake-up configuration to the parent domain.
- Replace irq_find_host() with irq_find_matching_fwnode() during probe
  to support parent domain lookup on non-OF platforms.
changes v7:
- Refactor I/O state reading and tri-state updates for SG/SB topologies
- Fix open-drain and open-source pinconf emulation
- Make direction_input a no-op to prevent overriding pinctrl bias
- Add defensive wrappers for IRQ proxying to prevent NULL pointer panics
- Add missing mutex guards to pinconf and get operations
- Convert generic internal variables to u32 and add lockdep assertions
changes v6:
- no changes
changes v5:
- no changes
changes v4:
- add Reviewed-by: Linus Walleij ...
- Replace the of_device_id match table with a platform_device_id table
- Add device_set_node(dev, dev_fwnode(dev->parent)) during probe
- Remove the check for a missing dev->of_node
changes v3:
- replace manual mutex_lock()/mutex_unlock() paths with guard(mutex)
- Unify error checking style by replacing if (ret < 0) with if (ret)
- Migrate from a custom .to_irq callback to a hierarchical gpio_irq_chip
- Implement .irq_bus_lock and .irq_bus_sync_unlock proxies to properly
  cascade SPI bus lock operations to the parent MFD domain
- Set girq->handler to handle_simple_irq
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
 drivers/pinctrl/Kconfig           |   16 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-mc33978.c | 1008 +++++++++++++++++++++++++++++
 3 files changed, 1025 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f53..64f9c5b1aacb 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -388,6 +388,22 @@ config PINCTRL_MAX77620
 	  function in alternate mode. This driver also configure push-pull,
 	  open drain, FPS slots etc.
 
+config PINCTRL_MC33978
+	tristate "MC33978/MC34978 industrial input controller support"
+	depends on MFD_MC33978
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
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
index 000000000000..9a002feebc48
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mc33978.c
@@ -0,0 +1,1008 @@
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
+ * consumers should flag outputs with GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE in
+ * the Device Tree to match the emulated output model.
+ *
+ * Input Detection Mechanics:
+ * This input mechanism relies on the active current regulators rather than
+ * passive hard resistors. For a Switch-to-Ground (SG) pin, the chip sources
+ * a constant current. When the switch is open, the pin voltage floats up to
+ * the battery voltage. When the switch closes, it creates a path to ground;
+ * because the current is strictly regulated, the pin voltage drops sharply
+ * below the internal 4.0V comparator threshold.
+ * The hardware evaluates this and reports an abstract "contact status"
+ * (1 = closed, 0 = open). For SG pins, a closed switch (~0V) reports as '1'.
+ * To align with gpiolib expectations where ~0V equals a physical logical '0',
+ * this driver explicitly inverts the hardware status for all SG-configured
+ * pins before reporting them.
+ *
+ * Interrupts:
+ * The physical INT_B line and threaded IRQ domain are managed centrally by
+ * the parent MFD core. This driver implements a hierarchical irq_chip
+ * to proxy masking/unmasking and configuration to the parent domain.
+ *
+ * Written by David Jander <david@protonic.nl>
+ *
+ * Datasheet:
+ * https://www.nxp.com/docs/en/data-sheet/MC33978.pdf
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
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
+enum mc33978_bias_state {
+	MC33978_TRISTATE = 0,
+	MC33978_PU,
+	MC33978_PD,
+};
+
+enum mc33978_drive_mode {
+	MC33978_OPEN_SOURCE = 0,
+	MC33978_OPEN_DRAIN,
+};
+
+struct mc33978_pinctrl {
+	struct device *dev;
+	struct regmap *regmap;
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
+
+	enum mc33978_bias_state cached_bias[MC33978_NGPIO];
+	enum mc33978_drive_mode cached_drive[MC33978_NGPIO];
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
+static int mc33978_update_bits(struct mc33978_pinctrl *mpc, u8 reg, u32 mask,
+			       u32 val)
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
+/*
+ * Output Drive Emulation:
+ * The MC33978 is an input device and physically lacks output drivers.
+ * We emulate output drive modes by mapping them to the hardware's wetting
+ * current topologies:
+ * - Open-Source : Maps to Switch-to-Ground (Pull-Up) topology.
+ * - Open-Drain  : Maps to Switch-to-Battery (Pull-Down) topology.
+ *
+ * SG pins (0-13) are physically hardwired to Open-Source.
+ * SP pins (14-21) are configurable via the CONFIG register.
+ */
+static int mc33978_get_drive(struct mc33978_pinctrl *mpc, unsigned int pin,
+			     enum mc33978_drive_mode *mode)
+{
+	u32 data;
+	int ret;
+
+	lockdep_assert_held(&mpc->lock);
+
+	if (!mc33978_is_sp(pin)) {
+		*mode = MC33978_OPEN_SOURCE;
+		return 0;
+	}
+
+	ret = mc33978_read(mpc, MC33978_REG_CONFIG, &data);
+	if (ret)
+		return ret;
+
+	if (data & MC33978_PINMASK(pin))
+		*mode = MC33978_OPEN_DRAIN;
+	else
+		*mode = MC33978_OPEN_SOURCE;
+
+	return 0;
+}
+
+static int mc33978_set_drive(struct mc33978_pinctrl *mpc, unsigned int pin,
+			     enum mc33978_drive_mode mode)
+{
+	u32 mask = MC33978_PINMASK(pin);
+	int ret;
+
+	lockdep_assert_held(&mpc->lock);
+
+	if (!mc33978_is_sp(pin)) {
+		if (mode != MC33978_OPEN_SOURCE)
+			return -EINVAL;
+
+		mpc->cached_drive[pin] = MC33978_OPEN_SOURCE;
+		return 0;
+	}
+
+	ret = mc33978_update_bits(mpc, MC33978_REG_CONFIG, mask,
+				  (mode == MC33978_OPEN_DRAIN) ? mask : 0);
+	if (!ret)
+		mpc->cached_drive[pin] = mode;
+
+	return ret;
+}
+
+/*
+ * Input Bias (Pull) Configuration:
+ * The MC33978 physically lacks passive pull-up/down resistors. Instead,
+ * input bias is achieved using active wetting current sources. We map the
+ * standard pinctrl bias terms to these hardware topologies:
+ * - Pull-Up   : Maps to Switch-to-Ground (SG) topology.
+ * - Pull-Down : Maps to Switch-to-Battery (SB) topology.
+ * - Tri-state : Disables the wetting current (High-Z).
+ *
+ * SG pins (0-13) physically only support Pull-Up.
+ * SP pins (14-21) are configurable via the CONFIG register.
+ * The TRI_SP/TRI_SG registers connect or disconnect these currents.
+ */
+static int mc33978_get_pull(struct mc33978_pinctrl *mpc, unsigned int pin,
+			    enum mc33978_bias_state *val)
+{
+	u32 data;
+	int ret;
+
+	lockdep_assert_held(&mpc->lock);
+
+	ret = mc33978_read(mpc, mc33978_spsg(MC33978_REG_TRI_SP, pin), &data);
+	if (ret)
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
+	if (ret)
+		return ret;
+
+	if (data & MC33978_PINMASK(pin))
+		*val = MC33978_PD;
+	else
+		*val = MC33978_PU;
+
+	return 0;
+}
+
+static int mc33978_set_pull(struct mc33978_pinctrl *mpc, unsigned int pin,
+			    enum mc33978_bias_state val)
+{
+	u32 mask = MC33978_PINMASK(pin);
+	int ret;
+
+	lockdep_assert_held(&mpc->lock);
+
+	/* SG pins physically lack pull-down current sources */
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
+				   mask,
+				   (val == MC33978_TRISTATE) ? mask : 0);
+	if (!ret)
+		mpc->cached_bias[pin] = val;
+
+	return ret;
+}
+
+static const unsigned int mc33978_wet_mA[] = { 2, 6, 8, 10, 12, 14, 16, 20 };
+
+static int mc33978_set_ds(struct mc33978_pinctrl *mpc, unsigned int pin,
+			  u32 val)
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
+			  u32 *val)
+{
+	u32 data;
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
+	enum mc33978_bias_state bias;
+	enum mc33978_drive_mode drive;
+	u32 arg, data;
+	int ret;
+
+	guard(mutex)(&mpc->lock);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ret = mc33978_get_pull(mpc, pin, &bias);
+		if (ret)
+			return ret;
+		if (bias != MC33978_PU)
+			return -EINVAL;
+		arg = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = mc33978_get_pull(mpc, pin, &bias);
+		if (ret)
+			return ret;
+		if (bias != MC33978_PD)
+			return -EINVAL;
+		arg = 0;
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		ret = mc33978_get_drive(mpc, pin, &drive);
+		if (ret)
+			return ret;
+		if (drive != MC33978_OPEN_DRAIN)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		ret = mc33978_get_drive(mpc, pin, &drive);
+		if (ret)
+			return ret;
+		if (drive != MC33978_OPEN_SOURCE)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		ret = mc33978_get_pull(mpc, pin, &bias);
+		if (ret)
+			return ret;
+		if (bias != MC33978_TRISTATE)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		ret = mc33978_get_ds(mpc, pin, &data);
+		if (ret)
+			return ret;
+		arg = data;
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
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
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
+	guard(mutex)(&mpc->lock);
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		/*
+		 * The hardware physically lacks push-pull output drivers.
+		 * By explicitly handling OPEN_DRAIN and OPEN_SOURCE here, we
+		 * signal to gpiolib that we support these modes natively.
+		 *
+		 * This prevents gpiolib from falling back to its software
+		 * emulation, which attempts to achieve High-Z by switching the
+		 * pin to input mode. Because this driver's .direction_input()
+		 * explicitly restores the cached bias, gpiolib's emulation
+		 * would inadvertently turn the wetting current back on instead
+		 * of achieving a High-Z state.
+		 */
+		switch (param) {
+		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+			ret = mc33978_set_drive(mpc, pin, MC33978_OPEN_SOURCE);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			ret = mc33978_set_pull(mpc, pin, MC33978_PU);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			ret = mc33978_set_drive(mpc, pin, MC33978_OPEN_DRAIN);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			ret = mc33978_set_pull(mpc, pin, MC33978_PD);
+			break;
+		/*
+		 * The MC33978 uses active wetting currents rather than passive
+		 * pull-resistors. Disabling the bias (pull-up/down) is
+		 * physically equivalent to putting the pin into a
+		 * high-impedance state. Both actions are achieved by isolating
+		 * the pin via the hardware tri-state registers.
+		 */
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			ret = mc33978_set_pull(mpc, pin, MC33978_TRISTATE);
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
+	return 0;
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
+	guard(mutex)(&mpc->lock);
+
+	/*
+	 * The MC33978 lacks physical output drivers; we emulate outputs by
+	 * toggling the hardware tri-state registers to connect or disconnect
+	 * the wetting currents.
+	 *
+	 * A valid input on this chip can be either actively wetted (PU/PD)
+	 * or High-Z (tri-stated). Because our output emulation directly
+	 * hijacks the tri-state register, switching back to input mode requires
+	 * us to explicitly restore the original wetting current topology from
+	 * the cache.
+	 */
+	return mc33978_set_pull(mpc, offset, mpc->cached_bias[offset]);
+}
+
+/*
+ * The hardware evaluates pin voltage against a threshold (default 4.0V)
+ * and reports an abstract contact status (1 = closed, 0 = open):
+ *
+ * SG (Switch-to-Ground) topology (pull-up current source):
+ * - Voltage > Threshold: Switch Open   (HW reports 0) -> Physical High
+ * - Voltage < Threshold: Switch Closed (HW reports 1) -> Physical Low
+ *
+ * SB (Switch-to-Battery) topology (pull-down current source):
+ * - Voltage > Threshold: Switch Closed (HW reports 1) -> Physical High
+ * - Voltage < Threshold: Switch Open   (HW reports 0) -> Physical Low
+ *
+ * We translate this contact status back into physical voltage levels by
+ * inverting the hardware status for all pins operating in SG topology.
+ */
+static int mc33978_read_in_state(struct mc33978_pinctrl *mpc,
+				 unsigned long mask, unsigned long *state)
+{
+	u32 status, inv_mask;
+	u32 config_reg = 0;
+	int ret;
+
+	ret = mc33978_read(mpc, MC33978_REG_READ_IN, &status);
+	if (ret)
+		return ret;
+
+	/* Read CONFIG register only if the requested mask involves SP pins */
+	if (mask & MC33978_SP_MASK) {
+		ret = mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Create an inversion mask for all pins currently operating in
+	 * Switch-to-Ground (SG) topology. SG pins always have pull-ups.
+	 * For SP pins, CONFIG bit value 0 = Switch-to-Ground (PU),
+	 * CONFIG bit value 1 = Switch-to-Battery (PD).
+	 */
+	inv_mask = MC33978_SG_MASK |
+		   (~(config_reg << MC33978_NUM_SG) & MC33978_SP_MASK);
+
+	*state = (status ^ inv_mask) & mask;
+
+	return 0;
+}
+
+static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	unsigned long state;
+	int ret;
+
+	guard(mutex)(&mpc->lock);
+
+	ret = mc33978_read_in_state(mpc, BIT(offset), &state);
+	if (ret)
+		return ret;
+
+	return !!(state & BIT(offset));
+}
+
+static int mc33978_get_multiple(struct gpio_chip *chip,
+				unsigned long *mask, unsigned long *bits)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	unsigned long state;
+	int ret;
+
+	guard(mutex)(&mpc->lock);
+
+	ret = mc33978_read_in_state(mpc, *mask, &state);
+	if (ret)
+		return ret;
+
+	*bits = (*bits & ~*mask) | state;
+
+	return 0;
+}
+
+/*
+ * Emulate output states by routing or isolating active wetting currents.
+ * To turn the line ON, we disable the hardware tri-state (write 0).
+ * To turn the line OFF (High-Z), we enable tri-state (write 1).
+ *
+ * For Open-Source (Pull-Up): value=1 turns it ON, value=0 is High-Z.
+ * For Open-Drain (Pull-Down): value=0 turns it ON, value=1 is High-Z.
+ * We dynamically read the CONFIG register to determine the topology
+ * and invert the bits accordingly for Open-Drain pins.
+ *
+ * Note: The hardware physically lacks push-pull drivers. Toggling outputs
+ * via tri-state isolation may cause transient spikes.
+ */
+static int mc33978_update_tri_state(struct mc33978_pinctrl *mpc, u32 mask,
+				    u32 bits)
+{
+	u32 sgmask = (mask & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	u32 sgbits = (bits & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
+	u32 spmask = (mask & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+	u32 spbits = (bits & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
+	u32 config_reg = 0;
+	int ret = 0;
+
+	if (spmask) {
+		/* Read topology: 1 = PD (Open-Drain), 0 = PU (Open-Source) */
+		ret = mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
+		if (ret)
+			return ret;
+
+		/*
+		 * Invert bits for Open-Drain (PD) pins.
+		 * The Open-Drain API contract expects value=1 to be High-Z.
+		 */
+		spbits ^= (config_reg & spmask);
+
+		ret = mc33978_update_bits(mpc, MC33978_REG_TRI_SP, spmask,
+					  ~spbits);
+		if (ret)
+			return ret;
+	}
+
+	/* SG pins are always Pull-Up (Open-Source), no inversion needed */
+	if (sgmask)
+		ret = mc33978_update_bits(mpc, MC33978_REG_TRI_SG, sgmask,
+					  ~sgbits);
+
+	return ret;
+}
+
+static int mc33978_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	u32 mask = BIT(offset);
+	u32 bits = value ? mask : 0;
+
+	guard(mutex)(&mpc->lock);
+
+	return mc33978_update_tri_state(mpc, mask, bits);
+}
+
+static int mc33978_set_multiple(struct gpio_chip *chip,
+				unsigned long *mask, unsigned long *bits)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+
+	guard(mutex)(&mpc->lock);
+
+	return mc33978_update_tri_state(mpc, *mask, *bits);
+}
+
+static int mc33978_direction_output(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
+	u32 mask = BIT(offset);
+	u32 bits = value ? mask : 0;
+	int ret;
+
+	guard(mutex)(&mpc->lock);
+
+	ret = mc33978_set_drive(mpc, offset, mpc->cached_drive[offset]);
+	if (ret)
+		return ret;
+
+	return mc33978_update_tri_state(mpc, mask, bits);
+}
+
+static int mc33978_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					      unsigned int child,
+					      unsigned int child_type,
+					      unsigned int *parent,
+					      unsigned int *parent_type)
+{
+	*parent_type = child_type;
+	*parent = child;
+
+	return 0;
+}
+
+/*
+ * Defensive wrappers for hierarchical IRQ proxying.
+ *
+ * gpiolib's hierarchical allocation exposes a lifecycle gap: the child
+ * descriptor is registered before irq_domain_alloc_irqs_parent() fully
+ * instantiates the parent chip.
+ *
+ * During consumer probe (e.g., gpiod_to_irq()), irq_create_fwspec_mapping()
+ * allocates the hierarchy. As part of this, irq_domain_set_info() initializes
+ * the top-level irq_desc and calls __irq_set_handler(). If the irq_desc
+ * requires locking, __irq_get_desc_lock() will invoke the child's
+ * .irq_bus_lock before the parent allocation is complete.
+ *
+ * Upstream generic helpers (e.g., irq_chip_mask_parent) blindly dereference
+ * data->parent_data->chip, causing an immediate NULL pointer panic during
+ * this gap. These wrappers check for a valid parent chip to safely drop
+ * premature locking or masking events while the legacy subsystem hierarchy
+ * is still assembling itself.
+ */
+static void mc33978_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct irq_data *parent = data->parent_data;
+
+	if (parent && parent->chip && parent->chip->irq_mask)
+		parent->chip->irq_mask(parent);
+	gpiochip_disable_irq(gc, data->hwirq);
+}
+
+static void mc33978_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct irq_data *parent = data->parent_data;
+
+	gpiochip_enable_irq(gc, data->hwirq);
+	if (parent && parent->chip && parent->chip->irq_unmask)
+		parent->chip->irq_unmask(parent);
+}
+
+static int mc33978_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_data *parent = data->parent_data;
+
+	if (parent && parent->chip && parent->chip->irq_set_type)
+		return parent->chip->irq_set_type(parent, type);
+
+	return -EINVAL;
+}
+
+static void mc33978_gpio_irq_bus_lock(struct irq_data *data)
+{
+	struct irq_data *parent = data->parent_data;
+
+	if (parent && parent->chip && parent->chip->irq_bus_lock)
+		parent->chip->irq_bus_lock(parent);
+}
+
+static void mc33978_gpio_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct irq_data *parent = data->parent_data;
+
+	if (parent && parent->chip && parent->chip->irq_bus_sync_unlock)
+		parent->chip->irq_bus_sync_unlock(parent);
+}
+
+static const struct irq_chip mc33978_gpio_irqchip = {
+	.name = "mc33978-gpio",
+	.irq_mask = mc33978_gpio_irq_mask,
+	.irq_unmask = mc33978_gpio_irq_unmask,
+	.irq_set_type = mc33978_gpio_irq_set_type,
+	.irq_bus_lock = mc33978_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = mc33978_gpio_irq_bus_sync_unlock,
+	.irq_set_wake = irq_chip_set_wake_parent,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void mc33978_init_gpio_chip(struct mc33978_pinctrl *mpc,
+				   struct device *dev)
+{
+	struct gpio_irq_chip *girq;
+
+	mpc->chip.label = dev_name(dev);
+	mpc->chip.direction_input = mc33978_direction_input;
+	mpc->chip.get = mc33978_get;
+	mpc->chip.get_multiple = mc33978_get_multiple;
+	mpc->chip.direction_output = mc33978_direction_output;
+	mpc->chip.set = mc33978_set;
+	mpc->chip.set_multiple = mc33978_set_multiple;
+	mpc->chip.set_config = gpiochip_generic_config;
+
+	mpc->chip.base = -1;
+	mpc->chip.ngpio = MC33978_NGPIO;
+	mpc->chip.can_sleep = true;
+	mpc->chip.parent = dev;
+	mpc->chip.owner = THIS_MODULE;
+
+	girq = &mpc->chip.irq;
+	gpio_irq_chip_set_chip(girq, &mc33978_gpio_irqchip);
+	/*
+	 * Share parent's DT fwnode. This does NOT cause IRQ domain shadowing
+	 * because the parent MFD domain uses DOMAIN_BUS_NEXUS while this GPIO
+	 * domain will use DOMAIN_BUS_WIRED (set after gpiochip registration).
+	 * Domain lookups match on both fwnode AND bus_token, ensuring proper
+	 * domain isolation. See crystalcove GPIO driver for similar pattern.
+	 */
+	girq->fwnode = dev_fwnode(dev);
+	girq->parent_domain = mpc->domain;
+	girq->child_to_parent_hwirq = mc33978_gpio_child_to_parent_hwirq;
+	girq->handler = handle_simple_irq;
+	girq->default_type = IRQ_TYPE_NONE;
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
+static int mc33978_init_cached_bias(struct mc33978_pinctrl *mpc)
+{
+	int i;
+
+	guard(mutex)(&mpc->lock);
+
+	for (i = 0; i < MC33978_NGPIO; i++) {
+		enum mc33978_bias_state val;
+		int ret;
+
+		ret = mc33978_get_pull(mpc, i, &val);
+		if (ret)
+			return ret;
+
+		mpc->cached_bias[i] = val;
+	}
+
+	return 0;
+}
+
+static int mc33978_init_cached_drive(struct mc33978_pinctrl *mpc)
+{
+	int i;
+
+	guard(mutex)(&mpc->lock);
+
+	for (i = 0; i < MC33978_NGPIO; i++) {
+		enum mc33978_drive_mode mode;
+		int ret;
+
+		ret = mc33978_get_drive(mpc, i, &mode);
+		if (ret)
+			return ret;
+
+		mpc->cached_drive[i] = mode;
+	}
+
+	return 0;
+}
+
+static int mc33978_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *fwnode;
+	struct mc33978_pinctrl *mpc;
+	int ret;
+
+	fwnode = dev_fwnode(dev->parent);
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV,
+				     "Missing parent firmware node\n");
+
+	device_set_node(dev, fwnode);
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
+	/* Find parent MFD IRQ domain (uses DOMAIN_BUS_NEXUS token) */
+	mpc->domain = irq_find_matching_fwnode(fwnode, DOMAIN_BUS_NEXUS);
+	if (!mpc->domain)
+		return dev_err_probe(dev, -ENODEV, "Failed to find parent IRQ domain\n");
+
+	ret = devm_mutex_init(dev, &mpc->lock);
+	if (ret)
+		return ret;
+
+	ret = mc33978_init_cached_bias(mpc);
+	if (ret)
+		return ret;
+
+	ret = mc33978_init_cached_drive(mpc);
+	if (ret)
+		return ret;
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
+	if (ret)
+		return dev_err_probe(dev, ret, "can't add GPIO chip\n");
+
+	/*
+	 * Distinguish GPIO IRQ domain from parent MFD domain sharing the same
+	 * fwnode. Matches the pattern used by other GPIO drivers (e.g.,
+	 * crystalcove). DOMAIN_BUS_WIRED indicates this domain represents
+	 * actual GPIO pin interrupts (wired lines).
+	 */
+	irq_domain_update_bus_token(mpc->chip.irq.domain, DOMAIN_BUS_WIRED);
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
+static const struct platform_device_id mc33978_pinctrl_id[] = {
+	{ "mc33978-pinctrl", },
+	{ "mc34978-pinctrl", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, mc33978_pinctrl_id);
+
+static struct platform_driver mc33978_pinctrl_driver = {
+	.driver = {
+		.name = "mc33978-pinctrl",
+	},
+	.probe = mc33978_pinctrl_probe,
+	.id_table = mc33978_pinctrl_id,
+};
+module_platform_driver(mc33978_pinctrl_driver);
+
+MODULE_AUTHOR("David Jander <david@protonic.nl>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


