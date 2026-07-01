Return-Path: <linux-gpio+bounces-39322-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ISyM3MORWo06AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39322-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:56:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F86EDA8B
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=wD2z95S5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39322-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39322-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C36C734BD173
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E4D481252;
	Wed,  1 Jul 2026 12:43:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB33481647
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 12:43:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909820; cv=none; b=UbErwesQxx5V7q+7eNL8aaIYgNcRpYtmf/QYwmdSSPs3Jc9B1CYUVvNskbXgNeQ0v+qKPuf4alZqX6Wk+1wj42/O1l0WL40CHpV9lZEz8J3L5BFKBMroLkXHh09ByfZcnxlZ883nEPUPZdB6jR8sIU5B3mziHNYvSGQd/qDHym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909820; c=relaxed/simple;
	bh=pn6zxE+1WTiIFDxKh0I4LdacUkL70hhw0eyXPcK4PLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRFwjrn007aiCsRx56W/6RJ1DHBO0qDCDpnZ1jTyAcr7LPL8EeAlDmeDTL9hPZlHFtJdVRRQqaeSPI41/1ZEwWP/PfYvr0WGT70w0Lic8/DTtaYjU/DTRmf8UASZda4lp70Udf9Zap26w1vcq3xZTrO1fcYawZm6hiub5cwdSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wD2z95S5; arc=none smtp.client-ip=95.215.58.177
Date: Wed, 1 Jul 2026 15:43:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909817; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=esSpBPhemXLnxs/Q2OuNPPMcw6p09Lrxem7J48IXO1E=;
	b=wD2z95S5xOjRehAaNAfz/DkRjgURwm4Zeb98hYHXLNLOkOlRhZv1LL++86VNNZXiXDqTUo
	xT17vMCFSaSq3YcYEVFIBqvTD7KJW639PuCnxvLE+P9vEMDXFCvWTtO0MRp+l2jp5Cp3iF
	PggnuLGFee/oo6a7fRa0/tye1ly8l6w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
Message-ID: <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uokM9BT9+b3KyMQa"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:from_mime,vger.kernel.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-39322-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 269F86EDA8B


--uokM9BT9+b3KyMQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
(One Time Programmable memory) is written at device manufacturing.
Support the GPI/GPO use-case via GPIO framework.

The default OTP for these pins is to not use any of them as GPI or GPO.
(The GPIO1 defaults as an ADC input regardless the naming). Hence the
driver assumes none of these pins is a GPI/GPO unless explicitly pointed
as GPI or GPO via device tree.

Furthermore, pin's direction can't be changed after OTP configuration is
done. Also the default drive type for a GPO (CMOS / Open Drain) is set
by the OTP configuration. The BD73800 has a set of undocumented test
registers which should allow changing the drive type. Access to the test
register area or the test registers aren't documented and so this driver
does not support configuring the drive type even though it might be
doable.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/gpio/Kconfig        |  11 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-bd73800.c | 234 ++++++++++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/gpio/gpio-bd73800.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..09d87c3b756f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1363,6 +1363,17 @@ config GPIO_BD72720
 	  be configured to GPO on the ROHM PMIC. The pin configuration is done
 	  on OTP at manufacturing.
=20
+config GPIO_BD73800
+	tristate "ROHM BD73800 GPIO support"
+	depends on MFD_ROHM_BD71828
+	help
+	  Support for GPIOs on ROHM BD73800 PMIC. There can be up to 4
+	  GPI or GPO pins available on the PMIC in total. The purpose of
+	  the pins is decided at the device manufacturing by OTP
+	  configuration and can't be reconfigured later. Enable this
+	  if your PMIC has pins set as GPIs or GPOs and if you wish to
+	  control the pins via the GPIO framework.
+
 config GPIO_BD9571MWV
 	tristate "ROHM BD9571 GPIO support"
 	depends on MFD_BD9571MWV
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4d0e900402fc..3041c06aa933 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+=3D gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD71815)		+=3D gpio-bd71815.o
 obj-$(CONFIG_GPIO_BD71828)		+=3D gpio-bd71828.o
 obj-$(CONFIG_GPIO_BD72720)		+=3D gpio-bd72720.o
+obj-$(CONFIG_GPIO_BD73800)		+=3D gpio-bd73800.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+=3D gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BLZP1600)		+=3D gpio-blzp1600.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+=3D gpio-brcmstb.o
diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
new file mode 100644
index 000000000000..3fe4b7f167b8
--- /dev/null
+++ b/drivers/gpio/gpio-bd73800.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support to GPIOs on ROHM BD73800
+ * Copyright 2024 ROHM Semiconductors.
+ * Author: Matti Vaittinen <mazziesaccount@gmail.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/rohm-bd73800.h>
+
+#define BD73800_GPIO_MAX_PINS 4
+/*
+ * The BD73800 has several "one time programmable" (OTP) configurations wh=
ich
+ * can be set at manufacturing phase. Some of these options allow using
+ * individual pins as GPI or GPO (not both at the same time). The OTP
+ * configuration can't be read at run-time, so drivers rely on device-tree=
 to
+ * advertise the OTP programmed in manufacturing.
+ *
+ * The pins which can be used as GPIO are:
+ * GPIO1, CLKOUT (GPIO2), FAULT_B, EXTEN_OUT.
+ *
+ * The OTP options 2 and 3 state for all the pins:
+ *  - OTP2: GPI (also IRQ source)
+ *  - OTP3: GPO (NOTE: This is actually 2 different OTP options. Either a
+ *    register controllable output or a power-sequence controlled output.
+ *    The "gpo" referred here means only the register controllable output.
+ *    The datasheet refers to this as: "<pin> output is controlled by
+ *    GPIO<N>_OUT or power on/off sequencer to control external VRs. ON/OFF
+ *    sequence timing is configurable."
+ *
+ * The data-sheet further says that the GPI/GPO is not a default OTP
+ * configuration for any of the pins. Hence the GPIO driver defaults to a =
pin
+ * not being a GPI or GPO, but requires the pin to be explicitly marked as=
 a
+ * GPI or GPO in the device-tree.
+ *
+ * DT properties:
+ * "rohm,pin-gpio1", "rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exte=
n"
+ * can be set to one of the values "gpi" or "gpo" to enable them to be use=
d as
+ * GPIO.
+ */
+
+enum bd73800_gpio_state {
+	BD73800_PIN_UNKNOWN,
+	BD73800_PIN_GPI,
+	BD73800_PIN_GPO,
+};
+
+struct bd73800_gpio_pin_cfg {
+	enum bd73800_gpio_state state;
+	int mask; /* GPIO_OUT and INT_SRC have same bit offsets for GPIO */
+};
+
+struct bd73800_gpio {
+	/* chip.parent points the MFD which provides DT node and regmap */
+	struct gpio_chip chip;
+	struct bd73800_gpio_pin_cfg pin[BD73800_GPIO_MAX_PINS];
+	int num_pins;
+	/* dev points to the platform device for devm and prints */
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+static int bd73800_gpio_get_pins(struct bd73800_gpio *g)
+{
+	static const char * const properties[] =3D {"rohm,pin-gpio1",
+		"rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"};
+	const char *val;
+	int i, ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(properties); i++) {
+		ret =3D fwnode_property_read_string(dev_fwnode(g->dev->parent),
+						  properties[i], &val);
+
+		if (ret) {
+			if (ret =3D=3D -EINVAL)
+				continue;
+
+			return dev_err_probe(g->dev, ret,
+					"pin %d (%s), bad configuration\n", i,
+					properties[i]);
+		}
+
+		if (strcmp(val, "gpi") =3D=3D 0) {
+			g->pin[g->num_pins].state =3D BD73800_PIN_GPI;
+			g->pin[g->num_pins].mask =3D BIT(i);
+			g->num_pins++;
+		} else if (strcmp(val, "gpo") =3D=3D 0) {
+			g->pin[g->num_pins].state =3D BD73800_PIN_GPO;
+			g->pin[g->num_pins].mask =3D BIT(i);
+			g->num_pins++;
+		}
+	}
+
+	return 0;
+}
+
+static int bd73800gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct bd73800_gpio *bdgpio =3D gpiochip_get_data(chip);
+	struct bd73800_gpio_pin_cfg *pin =3D &bdgpio->pin[offset];
+	int ret, val;
+
+	/* Only pins configured as GPI via OTP can have their status read */
+	if (pin->state !=3D BD73800_PIN_GPI) {
+		dev_dbg(bdgpio->dev, "pin %d (%x) not input. State %d\n",
+			offset, pin->mask, pin->state);
+		return -EINVAL;
+	}
+
+	ret =3D regmap_read(bdgpio->regmap, BD73800_REG_INT_5_SRC, &val);
+	if (ret)
+		return ret;
+
+	return val & pin->mask;
+}
+
+static int bd73800gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
+{
+	struct bd73800_gpio *bdgpio =3D gpiochip_get_data(chip);
+	struct bd73800_gpio_pin_cfg *pin =3D &bdgpio->pin[offset];
+
+	if (pin->state !=3D BD73800_PIN_GPO) {
+		dev_dbg(bdgpio->dev, "pin %d (%d) not output. State %d\n",
+			offset, pin->mask, pin->state);
+
+		return -EINVAL;
+	}
+
+	if (value)
+		return regmap_set_bits(bdgpio->regmap, BD73800_REG_GPO_OUT,
+				       pin->mask);
+
+	return regmap_clear_bits(bdgpio->regmap, BD73800_REG_GPO_OUT, pin->mask);
+}
+
+static int bd73800gpio_direction_get(struct gpio_chip *chip,
+				    unsigned int offset)
+{
+	struct bd73800_gpio *bdgpio =3D gpiochip_get_data(chip);
+
+	if (bdgpio->pin[offset].state =3D=3D BD73800_PIN_GPO)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+/*
+ * Template for GPIO chip. The BD73800 GPO supports both CMOS and open dra=
in
+ * configurations. The default however depends on the OTP. The runtime con=
fig
+ * can be done via undocumented test registers - but at the moment there i=
s no
+ * support for this.
+ *
+ * NOTE: When the BD73800 GPIO pins are used as IRQ source, the users are
+ * expected to request them directly from the regmap_irq IRQ-chip (impleme=
nted
+ * in the MFD driver). This way we don't need to populate another IRQ-chip
+ * here.
+ */
+static const struct gpio_chip bd73800gpio_chip =3D {
+	.label			=3D "bd73800",
+	.owner			=3D THIS_MODULE,
+	.get			=3D bd73800gpio_get,
+	.get_direction		=3D bd73800gpio_direction_get,
+	.set			=3D bd73800gpo_set,
+	.can_sleep		=3D true,
+};
+
+static int gpo_bd73800_probe(struct platform_device *pdev)
+{
+	struct bd73800_gpio *g;
+	struct device *parent, *dev;
+	int ret;
+
+	/*
+	 * Bind devm lifetime to this platform device =3D> use dev for devm.
+	 * also the prints should originate from this device.
+	 */
+	dev =3D &pdev->dev;
+	/* The device-tree and regmap come from MFD =3D> use parent for that */
+	parent =3D dev->parent;
+
+	g =3D devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
+	if (!g)
+		return -ENOMEM;
+
+	g->chip =3D bd73800gpio_chip;
+	g->chip.base =3D -1;
+	g->chip.parent =3D parent;
+	g->regmap =3D dev_get_regmap(parent, NULL);
+	g->dev =3D dev;
+
+	ret =3D bd73800_gpio_get_pins(g);
+	if (ret)
+		return ret;
+
+	if (!g->num_pins) {
+		/*
+		 * The BD73800 may or may not have pins allocated for GPIO
+		 * depending on the OTP used at manufacturing. Free the memory
+		 * and go out if there is no pins as then we have nothing to do
+		 */
+		dev_dbg(dev, "no GPIO pins\n");
+		devm_kfree(dev, g);
+		return 0;
+	}
+	g->chip.ngpio =3D g->num_pins;
+
+	return devm_gpiochip_add_data(dev, &g->chip, g);
+}
+
+static const struct platform_device_id bd73800_gpio_id[] =3D {
+	{ "bd73800-gpio" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
+
+static struct platform_driver gpo_bd73800_driver =3D {
+	.driver =3D {
+		.name =3D "bd73800-gpio",
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe =3D gpo_bd73800_probe,
+	.id_table =3D bd73800_gpio_id,
+};
+module_platform_driver(gpo_bd73800_driver);
+
+MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
+MODULE_DESCRIPTION("GPIO interface for BD73800");
+MODULE_LICENSE("GPL");
--=20
2.54.0


--uokM9BT9+b3KyMQa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFC20ACgkQeFA3/03a
ocW1Ngf/Yk0OtsGCFeTf599j2YARt4yJqPbniANCLnLbvDwGYqB28R9hfxNU7/Tp
QkYFO+raWpPLL0sadBleGeAwS0O5q2GrrVn4HU31/k3ff30DaGkBoiIXC8SBJh3R
G+0dtIHtf1unnvt4UZvpu98etHvd1Boz3iCNtekcUyxraIioFco/v7boHO9IfhBS
UXqtxoTVOSDl4Kt/EiBHL1mzQF6Q9/me1nQd3eQzx7KvJ8lYnwAkGYY88pd87hBJ
BQkjro4gYmCbSTpvVEpKLoPB8VMOqNaK6g2ybU0DOJHSz3O2yzbz80zIc2leudmI
8aHhZ4u2KdWZi4ims0dncKDa8sQ51A==
=DkN/
-----END PGP SIGNATURE-----

--uokM9BT9+b3KyMQa--

