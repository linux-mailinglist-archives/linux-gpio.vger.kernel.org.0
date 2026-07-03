Return-Path: <linux-gpio+bounces-39402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ZrwHGC2R2qmdwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:17:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFA702C1D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:17:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CXYJqqPM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39402-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39402-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 822BE300EC81
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C53D5237;
	Fri,  3 Jul 2026 13:11:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB8184540
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 13:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084301; cv=none; b=W/Tu0QXR9BKjmTeoRQXAth0Am5fn0/Ip+biNqGhB2323mker7gNuSPp1TslK6Qx7+o8C4H3KptZmcxu0P/EcxA7P1v2KKux5ahxxyugfdExRLc2qrh3t0D+lyPCIPt1OHdUAvNNOge6vW11PNZwxBTPRWjirvYIZosw/4zcdwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084301; c=relaxed/simple;
	bh=xmey9e5/cxKXXSFCAnisuOsIuzPYDL8Ngb0teO9TvrE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5dpJOUvR4p0SmOZO1yuolXkh9OAeL+iKIaqBhMjrsLRQ2KTdP7gS/RXfJF0qCHm9OtmzXEbOQ9iEySTyFawS/jGm1SLw3Gx7wEbnYtIvK39tcE+RAdvqXMCFpNWE36VWvAMOagmJ2HU35hVPRAFP3RqpJ96ZIJySe8VXHV2bNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXYJqqPM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D721F01563
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084298;
	bh=UvmjYOgLC9fhdWPNTKBTToWNXYqkMPHeHSDluBZYtFA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CXYJqqPMTQ23OUbZme/20yc8xpMUwjDh1Ydx2nq1GniC5Me2s17ZItYYF7c6OL5pM
	 i6fTQCwlhjMXJ8uzZA/fiQglPNBeXH0rDXUkoz6rFxFy5NnhTQsaDZvhC8op3GYH3S
	 agZUx3PEK2eOuRrfSpAsADgVQ17ycnRjQcpH8l5oXwqTX1+j8RugQzPblQmgDTfCsI
	 n+esjGYTFonksFCwLA7BKW4rCYlXxJL9agBtNje6vo+4puWuhj7tVYSYcxz1OYoM80
	 tltMm/dRHMmX3smAREWZnhsOjAP1erg0KdyZSqEfDeUn3l2PwzQpj2WXiqtDc/Ao5N
	 j0OX4ZJsaCVjQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so6134171fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 06:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpPQNxhfDZUtUfShnLHXSzwwVh6UIBg6Cv92+hmbm2eEOK+WD7lVtqQRuKLx4r5o2yzhg5RCMtzP2NJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+nIAOGevC/UIWtDydJBbYxoVaHRxfC6jip/Akrw3Iq7g2rZ2
	nPZPFyI42h6sawo+Udlg/l9N+6eqmNqtYjhjjLCntdeWoum1QKqUka1d6o9m6wqLOISgd1UwUeo
	ihbC3+pWmhXEzKUciCYAsR/CNQePU3S2py2Wfz7ZeEA==
X-Received: by 2002:a2e:beaa:0:b0:39b:156c:d097 with SMTP id
 38308e7fff4ca-39b34028295mr24511591fa.13.1783084297476; Fri, 03 Jul 2026
 06:11:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:11:35 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:11:35 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com> <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
Date: Fri, 3 Jul 2026 08:11:35 -0500
X-Gmail-Original-Message-ID: <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
X-Gm-Features: AVVi8CcUKnlhnq7EE36etK1w5TMl6FhgpT_im_vC2GAXFa9q-dLwI3b9jghl0D4
Message-ID: <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39402-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org,fi.rohmeurope.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7BFA702C1D

On Wed, 1 Jul 2026 14:43:25 +0200, Matti Vaittinen
<matti.vaittinen@linux.dev> said:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
> (One Time Programmable memory) is written at device manufacturing.
> Support the GPI/GPO use-case via GPIO framework.
>
> The default OTP for these pins is to not use any of them as GPI or GPO.
> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
> as GPI or GPO via device tree.
>
> Furthermore, pin's direction can't be changed after OTP configuration is
> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
> by the OTP configuration. The BD73800 has a set of undocumented test
> registers which should allow changing the drive type. Access to the test
> register area or the test registers aren't documented and so this driver
> does not support configuring the drive type even though it might be
> doable.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>  drivers/gpio/Kconfig        |  11 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-bd73800.c | 234 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 246 insertions(+)
>  create mode 100644 drivers/gpio/gpio-bd73800.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 28cf6d2e83c2..09d87c3b756f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1363,6 +1363,17 @@ config GPIO_BD72720
>  	  be configured to GPO on the ROHM PMIC. The pin configuration is done
>  	  on OTP at manufacturing.
>
> +config GPIO_BD73800
> +	tristate "ROHM BD73800 GPIO support"
> +	depends on MFD_ROHM_BD71828
> +	help
> +	  Support for GPIOs on ROHM BD73800 PMIC. There can be up to 4
> +	  GPI or GPO pins available on the PMIC in total. The purpose of
> +	  the pins is decided at the device manufacturing by OTP
> +	  configuration and can't be reconfigured later. Enable this
> +	  if your PMIC has pins set as GPIs or GPOs and if you wish to
> +	  control the pins via the GPIO framework.
> +
>  config GPIO_BD9571MWV
>  	tristate "ROHM BD9571 GPIO support"
>  	depends on MFD_BD9571MWV
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 4d0e900402fc..3041c06aa933 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
>  obj-$(CONFIG_GPIO_BD71815)		+= gpio-bd71815.o
>  obj-$(CONFIG_GPIO_BD71828)		+= gpio-bd71828.o
>  obj-$(CONFIG_GPIO_BD72720)		+= gpio-bd72720.o
> +obj-$(CONFIG_GPIO_BD73800)		+= gpio-bd73800.o
>  obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BLZP1600)		+= gpio-blzp1600.o
>  obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
> diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
> new file mode 100644
> index 000000000000..3fe4b7f167b8
> --- /dev/null
> +++ b/drivers/gpio/gpio-bd73800.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Support to GPIOs on ROHM BD73800
> + * Copyright 2024 ROHM Semiconductors.
> + * Author: Matti Vaittinen <mazziesaccount@gmail.com>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/rohm-bd73800.h>
> +
> +#define BD73800_GPIO_MAX_PINS 4
> +/*
> + * The BD73800 has several "one time programmable" (OTP) configurations which
> + * can be set at manufacturing phase. Some of these options allow using
> + * individual pins as GPI or GPO (not both at the same time). The OTP
> + * configuration can't be read at run-time, so drivers rely on device-tree to
> + * advertise the OTP programmed in manufacturing.
> + *
> + * The pins which can be used as GPIO are:
> + * GPIO1, CLKOUT (GPIO2), FAULT_B, EXTEN_OUT.
> + *
> + * The OTP options 2 and 3 state for all the pins:
> + *  - OTP2: GPI (also IRQ source)
> + *  - OTP3: GPO (NOTE: This is actually 2 different OTP options. Either a
> + *    register controllable output or a power-sequence controlled output.
> + *    The "gpo" referred here means only the register controllable output.
> + *    The datasheet refers to this as: "<pin> output is controlled by
> + *    GPIO<N>_OUT or power on/off sequencer to control external VRs. ON/OFF
> + *    sequence timing is configurable."
> + *
> + * The data-sheet further says that the GPI/GPO is not a default OTP
> + * configuration for any of the pins. Hence the GPIO driver defaults to a pin
> + * not being a GPI or GPO, but requires the pin to be explicitly marked as a
> + * GPI or GPO in the device-tree.
> + *
> + * DT properties:
> + * "rohm,pin-gpio1", "rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"
> + * can be set to one of the values "gpi" or "gpo" to enable them to be used as
> + * GPIO.
> + */
> +
> +enum bd73800_gpio_state {
> +	BD73800_PIN_UNKNOWN,
> +	BD73800_PIN_GPI,
> +	BD73800_PIN_GPO,
> +};
> +
> +struct bd73800_gpio_pin_cfg {
> +	enum bd73800_gpio_state state;
> +	int mask; /* GPIO_OUT and INT_SRC have same bit offsets for GPIO */
> +};
> +
> +struct bd73800_gpio {
> +	/* chip.parent points the MFD which provides DT node and regmap */
> +	struct gpio_chip chip;
> +	struct bd73800_gpio_pin_cfg pin[BD73800_GPIO_MAX_PINS];
> +	int num_pins;
> +	/* dev points to the platform device for devm and prints */
> +	struct device *dev;
> +	struct regmap *regmap;
> +};
> +
> +static int bd73800_gpio_get_pins(struct bd73800_gpio *g)
> +{
> +	static const char * const properties[] = {"rohm,pin-gpio1",
> +		"rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"};
> +	const char *val;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(properties); i++) {
> +		ret = fwnode_property_read_string(dev_fwnode(g->dev->parent),

It would be cleaner with device_property_read_string(g->dev->parent, ...)

> +						  properties[i], &val);
> +
> +		if (ret) {
> +			if (ret == -EINVAL)
> +				continue;
> +
> +			return dev_err_probe(g->dev, ret,
> +					"pin %d (%s), bad configuration\n", i,
> +					properties[i]);
> +		}
> +
> +		if (strcmp(val, "gpi") == 0) {
> +			g->pin[g->num_pins].state = BD73800_PIN_GPI;
> +			g->pin[g->num_pins].mask = BIT(i);
> +			g->num_pins++;
> +		} else if (strcmp(val, "gpo") == 0) {
> +			g->pin[g->num_pins].state = BD73800_PIN_GPO;
> +			g->pin[g->num_pins].mask = BIT(i);
> +			g->num_pins++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int bd73800gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct bd73800_gpio *bdgpio = gpiochip_get_data(chip);
> +	struct bd73800_gpio_pin_cfg *pin = &bdgpio->pin[offset];
> +	int ret, val;
> +
> +	/* Only pins configured as GPI via OTP can have their status read */
> +	if (pin->state != BD73800_PIN_GPI) {
> +		dev_dbg(bdgpio->dev, "pin %d (%x) not input. State %d\n",
> +			offset, pin->mask, pin->state);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_read(bdgpio->regmap, BD73800_REG_INT_5_SRC, &val);
> +	if (ret)
> +		return ret;
> +
> +	return val & pin->mask;
> +}
> +
> +static int bd73800gpo_set(struct gpio_chip *chip, unsigned int offset,
> +			  int value)
> +{
> +	struct bd73800_gpio *bdgpio = gpiochip_get_data(chip);
> +	struct bd73800_gpio_pin_cfg *pin = &bdgpio->pin[offset];
> +
> +	if (pin->state != BD73800_PIN_GPO) {
> +		dev_dbg(bdgpio->dev, "pin %d (%d) not output. State %d\n",
> +			offset, pin->mask, pin->state);
> +
> +		return -EINVAL;
> +	}
> +
> +	if (value)
> +		return regmap_set_bits(bdgpio->regmap, BD73800_REG_GPO_OUT,
> +				       pin->mask);
> +
> +	return regmap_clear_bits(bdgpio->regmap, BD73800_REG_GPO_OUT, pin->mask);
> +}
> +
> +static int bd73800gpio_direction_get(struct gpio_chip *chip,
> +				    unsigned int offset)
> +{
> +	struct bd73800_gpio *bdgpio = gpiochip_get_data(chip);
> +
> +	if (bdgpio->pin[offset].state == BD73800_PIN_GPO)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +/*
> + * Template for GPIO chip. The BD73800 GPO supports both CMOS and open drain
> + * configurations. The default however depends on the OTP. The runtime config
> + * can be done via undocumented test registers - but at the moment there is no
> + * support for this.
> + *
> + * NOTE: When the BD73800 GPIO pins are used as IRQ source, the users are
> + * expected to request them directly from the regmap_irq IRQ-chip (implemented
> + * in the MFD driver). This way we don't need to populate another IRQ-chip
> + * here.
> + */
> +static const struct gpio_chip bd73800gpio_chip = {
> +	.label			= "bd73800",
> +	.owner			= THIS_MODULE,
> +	.get			= bd73800gpio_get,
> +	.get_direction		= bd73800gpio_direction_get,
> +	.set			= bd73800gpo_set,
> +	.can_sleep		= true,
> +};
> +
> +static int gpo_bd73800_probe(struct platform_device *pdev)
> +{
> +	struct bd73800_gpio *g;

May I suggest a slightly more descriptive name for driver data? Maybe at the
very least... "data"? :)

> +	struct device *parent, *dev;
> +	int ret;
> +
> +	/*
> +	 * Bind devm lifetime to this platform device => use dev for devm.
> +	 * also the prints should originate from this device.
> +	 */

Why would you need to comment on it though? It's very much the standard
approach, isn't it?

> +	dev = &pdev->dev;
> +	/* The device-tree and regmap come from MFD => use parent for that */
> +	parent = dev->parent;
> +
> +	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
> +	if (!g)
> +		return -ENOMEM;
> +
> +	g->chip = bd73800gpio_chip;
> +	g->chip.base = -1;
> +	g->chip.parent = parent;
> +	g->regmap = dev_get_regmap(parent, NULL);
> +	g->dev = dev;
> +
> +	ret = bd73800_gpio_get_pins(g);
> +	if (ret)
> +		return ret;
> +
> +	if (!g->num_pins) {
> +		/*
> +		 * The BD73800 may or may not have pins allocated for GPIO
> +		 * depending on the OTP used at manufacturing. Free the memory
> +		 * and go out if there is no pins as then we have nothing to do
> +		 */
> +		dev_dbg(dev, "no GPIO pins\n");
> +		devm_kfree(dev, g);

No need for that, because...

> +		return 0;

... this will still leave a bound device in the system, I'm not sure we want
it? The correct error code in this case is -ENODEV.

> +	}
> +	g->chip.ngpio = g->num_pins;
> +
> +	return devm_gpiochip_add_data(dev, &g->chip, g);
> +}
> +
> +static const struct platform_device_id bd73800_gpio_id[] = {
> +	{ "bd73800-gpio" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
> +
> +static struct platform_driver gpo_bd73800_driver = {
> +	.driver = {
> +		.name = "bd73800-gpio",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe = gpo_bd73800_probe,
> +	.id_table = bd73800_gpio_id,
> +};
> +module_platform_driver(gpo_bd73800_driver);
> +
> +MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
> +MODULE_DESCRIPTION("GPIO interface for BD73800");
> +MODULE_LICENSE("GPL");
> --
> 2.54.0
>
>

Bart

