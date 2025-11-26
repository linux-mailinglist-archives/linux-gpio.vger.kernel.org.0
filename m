Return-Path: <linux-gpio+bounces-29113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7DC8BB93
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 20:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A820E352596
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 19:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE382201278;
	Wed, 26 Nov 2025 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="oG4F1+oP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF133F8BF
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186897; cv=none; b=LDGE7RuJQDq5mtK3j7xaj0ROKK1R9ZMpcnOqRSKGV9Pvtq4BkG3fzYFZWxxkYAl7EhPrKuGAaRAPCTC/UQgKSbakNBhvHW2Fk8AkneE6ESQXXbBlkH4nOIqawG9Y784Wbi2PQ/MiD1cvMVcQCvgVwS77oMQqHr/nT8Y76Zcu+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186897; c=relaxed/simple;
	bh=2Av56t9uJGDOdh1tiDXLSIs+ur3rFEJiL4aNQMWeziU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iYJxDdGRtNY5M4uDcrLwL1YbLt2gkcm8n61xX3/v1hD76JKKJ7u5Yb6NxtiviCMAm/ssMKwSZYKctKIaNgkmZMaDIVgvi1R/7CPGAGIi4hHOb37u7RDsJrsbss9uyPh6BodfBPffEHQmGi4dHMMMchIHlCT4AROdcFyagaBuf9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=oG4F1+oP; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:74f7:450e:16bb:b45f] (2a02-1812-162c-8f00-74f7-450e-16bb-b45f.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:74f7:450e:16bb:b45f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 29D066A61AC;
	Wed, 26 Nov 2025 20:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1764186887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEm82vySwX2e9VO+ntVk9tkKUj/BEzLPKS4pAtBBzwg=;
	b=oG4F1+oPVjAIYPoSZGOAaiU4VXPJHNUMALBJ/a/+390wM6+ael2S6u8gwV76vDsXV5FfOk
	wgzyia7gWwWa89Ez1eevZsnV7T/+kl/hETR8r36Z8FMuxmBVouTt0bkpb9OMEkJhj/nisM
	7DpyBZiYpCSEhfhjahKi4nqg5kpd+AsHvatdycfcGmVt7gZ6DrQpXE7yVqGP9+BhlBaaSb
	clDaxHitOxCiza73aPU6p31fXliMVrIhSL4Powom0vcV+j2UlVz80KoyLL+uTYiO1hZijH
	nFijkpVn9aBgxovs3rWk76MmjcBXXGJkTMTavSky2LJZyKvCbISdRl+e4SeU0Q==
Message-ID: <38c9b9e77029f894dd186305a275231aaa502664.camel@svanheule.net>
Subject: Re: [PATCH v8 3/6] mfd: Add RTL8231 core device
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij	 <linus.walleij@linaro.org>, Michael
 Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 26 Nov 2025 20:54:44 +0100
In-Reply-To: <20251126130447.GB3070764@google.com>
References: <20251119200306.60569-1-sander@svanheule.net>
	 <20251119200306.60569-4-sander@svanheule.net>
	 <20251126130447.GB3070764@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Wed, 2025-11-26 at 13:04 +0000, Lee Jones wrote:
> On Wed, 19 Nov 2025, Sander Vanheule wrote:
> > --- /dev/null
> > +++ b/drivers/mfd/rtl8231.c
> > @@ -0,0 +1,193 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
>=20
> No company copyright or author tags?
>=20

I'm writing this driver on my own time, so there's no company. My name is a=
t the
bottom of the driver, in the MODULE_AUTHOR() macro. That's enough for me.


> > +static int rtl8231_soft_reset(struct regmap *regmap)
> > +{
> > +	const unsigned int all_pins_mask =3D GENMASK(RTL8231_BITS_VAL - 1,
> > 0);
> > +	unsigned int cfg;
> > +	int err;
> > +
> > +	/* SOFT_RESET bit self-clears when done */
> > +	regmap_write_bits(regmap, RTL8231_REG_PIN_HI_CFG,
> > +			=C2=A0 RTL8231_PIN_HI_CFG_SOFT_RESET,
> > RTL8231_PIN_HI_CFG_SOFT_RESET);
> > +
> > +	err =3D regmap_read_poll_timeout(regmap, RTL8231_REG_PIN_HI_CFG, cfg,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(cfg &
> > RTL8231_PIN_HI_CFG_SOFT_RESET), 50, 1000);
> > +	if (err)
> > +		return err;
> > +
> > +	regcache_drop_region(regmap, 0, RTL8231_REG_COUNT - 1);
>=20
> Nit:
>=20
> RTL8231_REG_FUNC0, RTL8231_REG_GPIO_DATA2
>=20
> I'll also accept additional devices for each of these which would make
> things very clear.
>=20
> RTL8231_REG_START	0
> RTL8231_REG_END		RTL8231_REG_COUNT - 1
>=20
> Or similar.

I went with:

#define RTL8231_REG_START	0x00
#define RTL8231_REG_END		0x1e

I will also use RTL8231_REG_END for the regmap config's max_register, so
RTL8231_REG_COUNT can even be dropped.


> > +static int rtl8231_init(struct device *dev, struct regmap *regmap)
> > +{
> > +	struct regmap_field *led_start;
> > +	unsigned int ready_code;
> > +	unsigned int started;
> > +	unsigned int status;
> > +	int err;
> > +
> > +	err =3D regmap_read(regmap, RTL8231_REG_FUNC1, &status);
> > +	if (err) {
> > +		dev_err(dev, "failed to read READY_CODE\n");
> > +		return err;
> > +	}
> > +
> > +	ready_code =3D FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, status);
> > +	if (ready_code !=3D RTL8231_FUNC1_READY_CODE_VALUE) {
> > +		dev_err(dev, "RTL8231 not present or ready 0x%x !=3D 0x%x\n",
> > +			ready_code, RTL8231_FUNC1_READY_CODE_VALUE);
> > +		return -ENODEV;
> > +	}
> > +
> > +	led_start =3D dev_get_drvdata(dev);
> > +	err =3D regmap_field_read(led_start, &started);
> > +	if (err)
> > +		return err;
> > +
> > +	if (started)
> > +		return 0;
> > +
> > +	err =3D rtl8231_soft_reset(regmap);
> > +	if (err)
> > +		return err;
> > +
> > +	/* LED_START enables power to output pins, and starts the LED
> > engine */
> > +	return regmap_field_write(led_start, 1);
>=20
> Why can't the dedicated LED driver initialise itself?

Perhaps I didn't explain this clearly enough in my previous message, but th=
e
"led_start" bit must also be set if all pins are configured for use as GPIO=
 and
the LED driver isn't even loaded in the kernel. Otherwise the output driver=
s of
the pins remain disabled.

I can rename "led_start" to "output_enable" if that would make things clear=
er.

>=20
> > +}
> > +
> > +static const struct regmap_config rtl8231_mdio_regmap_config =3D {
> > +	.val_bits =3D RTL8231_BITS_VAL,
> > +	.reg_bits =3D RTL8231_BITS_REG,
> > +	.volatile_reg =3D rtl8231_volatile_reg,
> > +	.max_register =3D RTL8231_REG_COUNT - 1,

Changed to RTL8231_REG_END.

> > +	regmap =3D devm_regmap_init_mdio(mdiodev,
> > &rtl8231_mdio_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(dev, "failed to init regmap\n");
>=20
> Nit: Let's not shorten user messages - "initialise".

Ack.


> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	led_start =3D devm_regmap_field_alloc(dev, regmap, field_led_start);
> > +	if (IS_ERR(led_start))
> > +		return PTR_ERR(led_start);
> > +
> > +	dev_set_drvdata(dev, led_start);
>=20
> I'd pass the whole Regmap through and let the LED extract its own part.
>=20
> > +	mdiodev->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > GPIOD_OUT_LOW);
> > +	if (IS_ERR(mdiodev->reset_gpio))
> > +		return PTR_ERR(mdiodev->reset_gpio);
> > +
> > +	device_property_read_u32(dev, "reset-assert-delay", &mdiodev-
> > >reset_assert_delay);
> > +	device_property_read_u32(dev, "reset-deassert-delay", &mdiodev-
> > >reset_deassert_delay);
> > +
> > +	err =3D rtl8231_init(dev, regmap);
>=20
> ... then you can omit the 'regmap' argument.

Sure, that's one less allocation too. The field writes become a bit more
verbose, but it's not too unwieldy.


> > +	if (err)
> > +		return err;
> > +
> > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> > rtl8231_cells,
> > +				=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(rtl8231_cells), NULL, 0,
> > NULL);
> > +}
> > +
> > +static int __maybe_unused rtl8231_suspend(struct device *dev)

I've learned the __maybe_unused is (no longer) required, so I dropped these=
.

> > +{
> > +	struct regmap_field *led_start =3D dev_get_drvdata(dev);
> > +
> > +	return regmap_field_write(led_start, 0);
>=20
> The LED driver doesn't have its own suspend support?

Because this affects both the GPIO outputs and the LED scanning feature, th=
is
does belong in the core driver IMHO.

>=20
> > +}
> > +
> > +static int __maybe_unused rtl8231_resume(struct device *dev)
> > +{
> > +	struct regmap_field *led_start =3D dev_get_drvdata(dev);
> > +
> > +	return regmap_field_write(led_start, 1);
> > +}
> > +
>=20
> Nit: Remove this line.

You mean the blank line above "SIMPLE_DEV_PM_OPS"? AFAICT this is standard =
style
for this kind of statement. It feels "ugly" to me to glue the PM_OPS macro =
to
the resume function, while the suspend function is separated from it.

>=20
Best,
Sander

