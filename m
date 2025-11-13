Return-Path: <linux-gpio+bounces-28455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA0C5A3B9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 22:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 157864F76D6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 21:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0970326927;
	Thu, 13 Nov 2025 21:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="vlEeOcAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EF326926
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 21:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069614; cv=none; b=LhKb86FVYLaLQ95ePUHV7vXCvpYIqWhQRgm1yROf8aXrDx8VJIVH4yfPNJWxFmusGb6qUr2n91wLKFx8Q9hK9Vzmy2Qs77zsPUnITCvUxMeFzec4ZVoUBfIkzQvUjAf7G/NfClYd56U30NINi9bON/+R9DI99ENZWXaMf3puUAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069614; c=relaxed/simple;
	bh=dOsmlXAaLYzJ3dRoD+Ceh7/hl+sEnM6GJpMWKUQ/PyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHJ+rbiaet9JqnH3osma1z/TIl/Lam5YD43EmwDnAKnRP50XzGNdNVe6/xXO5iiE7TiY4BgDgOJyuA+e9Ay6Cx9wQHabFvuwH9pUa3IQLLCXUpLqoPu4uNlQzVPPwtdDzLfjquGeUfk76PsZKjAa4TWRZvXpvWBXZUGCXiS6xbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=vlEeOcAy; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 851FD69E555;
	Thu, 13 Nov 2025 22:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763069149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51L4HkBNkO3CTDdkbZuobL6jJipCP6lYYxkEhb+jVHM=;
	b=vlEeOcAyqO2WzKutM/FSRYPs8W3X4fMlYSSP3FWn6GO81rPCDdnZ9kFtzmAGX1BeR4/6Cz
	q74xxgcjcyQMgWtNTckYEyjV+hnvubxSJFjpySBdnv3mfUqwEBUwNxLXKyJU7RXqZ6wktp
	dSPouneWmJclkhhimjL5Y+BM68rrYd5BmU5DmztmkmjVCEYHStG1vDK9vw8AZgLEBxtl6m
	yoZh2y4Qr0UisFSaQHaHJC1mC00bOxLD1/JMJi0ILyhDgG3w1mzh3QwR+V/eKPwSpBSML8
	nzqHo3TZx3fgfRfc8GDyojnJ4hHfIXNFVFR2nclgCCYJIBWnL3rtz6G88bk8HA==
Message-ID: <d50db8a305d92b20a972a590f2082f39a8027edc.camel@svanheule.net>
Subject: Re: [PATCH v6 5/8] mfd: Add RTL8231 core device
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org, Pavel Machek <pavel@kernel.org>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 13 Nov 2025 22:25:48 +0100
In-Reply-To: <20251106163316.GV8064@google.com>
References: <20251021142407.307753-1-sander@svanheule.net>
	 <20251021142407.307753-6-sander@svanheule.net>
	 <20251106163316.GV8064@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-11-06 at 16:33 +0000, Lee Jones wrote:
> On Tue, 21 Oct 2025, Sander Vanheule wrote:
> > @@ -0,0 +1,193 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/bits.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mdio.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>=20
> Alphabetical please.

Ack

> > +static const struct reg_field RTL8231_FIELD_LED_START =3D
> > REG_FIELD(RTL8231_REG_FUNC0, 1, 1);
>=20
> Why does this have to be global?
>=20
> Variables should be lowercase.

Moving it to the one place where it's used.

> > +static const struct mfd_cell rtl8231_cells[] =3D {
> > +	{
> > +		.name =3D "rtl8231-pinctrl",
> > +	},
> > +	{
> > +		.name =3D "rtl8231-leds",
> > +		.of_compatible =3D "realtek,rtl8231-leds",
> > +	},
> > +};
>=20
> This is a pretty tenuous MFD!

I suppose two functions is the minimum to count as multi-functional :-)

I need a place to perform chip detection and to start the output drivers. T=
he
latter could be part of a pinctrl driver, but making the led driver depend =
on
the pinctrl driver doesn't sit too well with me. Now the functionality is
cleanly split across the MFD core driver and pinctrl/led drivers.

> > +static int rtl8231_soft_reset(struct regmap *map)
>=20
> s/map/regmap/

Ack, replaced throughout the driver.

> > +{
> > +	const unsigned int all_pins_mask =3D GENMASK(RTL8231_BITS_VAL - 1,
> > 0);
> > +	unsigned int val;
> > +	int err;
> > +
> > +	/* SOFT_RESET bit self-clears when done */
> > +	regmap_write_bits(map, RTL8231_REG_PIN_HI_CFG,
> > +		RTL8231_PIN_HI_CFG_SOFT_RESET,
> > RTL8231_PIN_HI_CFG_SOFT_RESET);
> > +	err =3D regmap_read_poll_timeout(map, RTL8231_REG_PIN_HI_CFG, val,
> > +		!(val & RTL8231_PIN_HI_CFG_SOFT_RESET), 50, 1000);
> > +	if (err)
> > +		return err;
>=20
> Do we have to scrunch these calls together?

Made it a bit less claustrophobic.

> > +	regcache_mark_dirty(map);

This marks the device register state as invalid, which isn't what I wanted =
here.
After a reset, the cache should be repopulated, so this is now:

	regcache_drop_region(0, RTL8231_REG_COUNT - 1);

> > +static int rtl8231_init(struct device *dev, struct regmap *map)
> > +{
> > +	struct regmap_field *led_start;
> > +	unsigned int started;
> > +	unsigned int val;
>=20
> If this is used for only one thing, it makes sense to use better
> nomenclature that refers to that thing.

Ack, updated the naming a bit.

> > +	led_start =3D dev_get_drvdata(dev);
> > +	err =3D regmap_field_read(led_start, &started);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!started) {
>=20
> Reverse the logic and exit early if 'started'.

Ack

>=20
> > +		err =3D rtl8231_soft_reset(map);
> > +		if (err)
> > +			return err;
>=20
> '\n' here.

Ack

> > +		/* LED_START enables power to output pins, and starts the
> > LED engine */
> > +		err =3D regmap_field_force_write(led_start, 1);

This is in a volatile register, so the driver doesn't need to force anythin=
g to
write to the device and will now use regmap_field_write().

> > +	led_start =3D devm_regmap_field_alloc(dev, map,
> > RTL8231_FIELD_LED_START);
> > +	if (IS_ERR(led_start))
> > +		return PTR_ERR(led_start);
>=20
> Why do we need to do LED specific actions in the core driver?

The is naming taken from the datasheet. Setting LED_START actually enables =
both
the LED scanning output engine and the output drivers. So this is needed fo=
r
proper functioning of the GPIO functionality too.


> > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> > rtl8231_cells,
> > +		ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
>=20
> Odd tabbing.=C2=A0 Please line-up with the '(' like usual.

Ack

> > +__maybe_unused static int rtl8231_suspend(struct device *dev)
>=20
> The __maybe_unused comes after the "static int" part.

Ack.

C11 attributes like [[maybe_unused]] must come before the "static int" part=
, but
that doesn't line up with how most of the kernel uses the attributes.


Best,
Sander

