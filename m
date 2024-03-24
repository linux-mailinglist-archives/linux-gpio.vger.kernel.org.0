Return-Path: <linux-gpio+bounces-4586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF4887D64
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 16:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA39B20B38
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 15:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93421862B;
	Sun, 24 Mar 2024 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgZW4C6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB26182BF;
	Sun, 24 Mar 2024 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711292663; cv=none; b=P/B4e4mVJw1KQQYcZDW2didvV3JRgxfeaHumGSykd8eooLc99/rCbcG7BIO31IuLBVwLeFAEzQRpOY330vJffw3C7P2JWRmbMnMJ2ZsVpmP+eDUDuMyDfHVKbFLJGcb2XXVabYjUZ0chHzYOUBgmpq+0GQJ54TiiV7RjSSwM4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711292663; c=relaxed/simple;
	bh=rf3b26KuECC9MTFW/pddYxruswZh6tBWvG0s53kSfzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwVoAfoBOKh1sRAWmkunIlmRY5oqdj1pJQbKRWXU1DbcUNI2I9Ta1udirNF1ry/OHXlsHbvglX3Z3a5lfB78kswANxHAbbzaL1o4CCa1Nh23aKaJnkdvI3OxS1lXJpEBQ+0kZTOVExXoaiXkkI0z7xowUEKQcMXhB2ai/lrMltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgZW4C6i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113AEC433F1;
	Sun, 24 Mar 2024 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711292663;
	bh=rf3b26KuECC9MTFW/pddYxruswZh6tBWvG0s53kSfzQ=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=rgZW4C6iXaOLkEa+zKmkO76TnGVu1vqFEV1NHyarlK01d+Dh4DgoA1NdrvSMuzEkb
	 eeIMQ3zfm0SbxPIPhF7LKfQImYKUlSy/GxMHUDA8EaW7ih2vQSO6CaWPu108XT2mum
	 SM6nE2PwD5XPS0EcAgfHmdyHTC/ppv8jNY3Rq7gqbZGql3ziYSZrvDzZ8VVn5oJ5z0
	 WT3eT3MZyRjJz4gc7pKmHEla/gOk+StjmzwD3H698CFd5BKsqCePolVQ/Fe3w75FOs
	 dvgyxMVfqKwBolJ8XXJS0SydynGR4nALWDJ4vIA3H68DP3UPsRoSqyeGMDYkTN5bNG
	 J10G//JxY1zkg==
Date: Sun, 24 Mar 2024 16:04:08 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240324160408.77c8574e@thinkpad>
In-Reply-To: <ZgAII1B03bLUisWr@surfacebook.localdomain>
References: <20240323164359.21642-1-kabel@kernel.org>
	<20240323164359.21642-3-kabel@kernel.org>
	<ZgAII1B03bLUisWr@surfacebook.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andy,

thank you very much for the review. I have some notes and some
questions, see below.

On Sun, 24 Mar 2024 13:01:55 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Sat, Mar 23, 2024 at 05:43:50PM +0100, Marek Beh=C3=BAn kirjoitti:
> > Add the basic skeleton for a new platform driver for the microcontroller
> > found on the Turris Omnia board. =20
>=20
> ...
>=20
> > +++ b/drivers/platform/cznic/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_TURRIS_OMNIA_MCU)	+=3D turris-omnia-mcu.o
> > +turris-omnia-mcu-objs		:=3D turris-omnia-mcu-base.o =20
>=20
> 'objs' is for user space. You need to use 'y'. Same applies to the entire
> series.

Fixed for v6.

>=20
> + array_size.h
> + bits.h

Fixed for v6. Is there some tool for this?

> + string.h

Fixed for v6.
>=20
> > +#include <linux/sysfs.h> =20
>=20
> ...
>=20
> > +	err =3D omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSION_B=
OOT :
> > +						       CMD_GET_FW_VERSION_APP,
> > +			     reply, sizeof(reply)); =20
>=20
> Wouldn't be better to have a logical split?
>=20
> 	err =3D omnia_cmd_read(mcu->client,
> 			     bootloader ? CMD_GET_FW_VERSION_BOOT : CMD_GET_FW_VERSION_APP,
> 			     reply, sizeof(reply));

Changed for v6 to

> 	err =3D omnia_cmd_read(mcu->client,
> 			     bootloader ? CMD_GET_FW_VERSION_BOOT
> 					: CMD_GET_FW_VERSION_APP,
> 			     reply, sizeof(reply));

There are still some people wanting only 80 columns, and the whole
driver is written that way.

>=20
> ?
>=20
> ...
>=20
> > +	struct omnia_mcu *mcu =3D i2c_get_clientdata(to_i2c_client(dev)); =20
>=20
> What's wrong with dev_get_drvdata()?

Fixed for v6.

> ...
>=20
> > +static ssize_t fw_features_show(struct device *dev, struct device_attr=
ibute *a,
> > +				char *buf) =20
>=20
> One line?

80 columns...

...

> > +static const struct attribute_group omnia_mcu_base_group =3D {
> > +	.attrs =3D omnia_mcu_base_attrs,
> > +	.is_visible =3D omnia_mcu_base_attrs_visible,
> > +};
> > +
> > +static const struct attribute_group *omnia_mcu_groups[] =3D {
> > +	&omnia_mcu_base_group,
> > +	NULL
> > +}; =20
>=20
> __ATTRIBUTE_GROUPS()

The next patches add more groups into this array, after the whole
series it looks like this:

static const struct attribute_group *omnia_mcu_groups[] =3D {
	&omnia_mcu_base_group,
	&omnia_mcu_gpio_group,
	&omnia_mcu_poweroff_group,
	NULL
};

There is no macro for that. Should I still use __ATTRIBUTE_GROUPS() in
the first patch and than change it in the next one?

>=20
> ...
>=20
> > +static struct i2c_driver omnia_mcu_driver =3D {
> > +	.probe		=3D omnia_mcu_probe,
> > +	.driver		=3D {
> > +		.name	=3D "turris-omnia-mcu",
> > +		.of_match_table =3D of_omnia_mcu_match,
> > +		.dev_groups =3D omnia_mcu_groups,
> > +	},
> > +}; =20
>=20
> > + =20
>=20
> Redundant blank line.
>=20

Fixed for v6.

> > +module_i2c_driver(omnia_mcu_driver); =20
>=20
> ...
>=20
> > +#ifndef __TURRIS_OMNIA_MCU_H
> > +#define __TURRIS_OMNIA_MCU_H =20
>=20
> + array_size.h

Fixed for v6.

>=20
> > +#include <linux/i2c.h>
> > +#include <linux/if_ether.h>
> > +#include <linux/types.h>
> > +#include <asm/byteorder.h> =20
>=20
> ...
>=20
> > +static inline int omnia_cmd_read(const struct i2c_client *client, u8 c=
md,
> > +				 void *reply, unsigned int len)
> > +{ =20
>=20
> Why is this in the header?

I considered it a helper function that should be defined in the header
file, like the rest of the cmd helpers in this file. If you disagree, I
will put it into the -base.c file.

>=20
> > +	struct i2c_msg msgs[2];
> > +	int ret;
> > +
> > +	msgs[0].addr =3D client->addr;
> > +	msgs[0].flags =3D 0;
> > +	msgs[0].len =3D 1;
> > +	msgs[0].buf =3D &cmd;
> > +	msgs[1].addr =3D client->addr;
> > +	msgs[1].flags =3D I2C_M_RD;
> > +	msgs[1].len =3D len;
> > +	msgs[1].buf =3D reply;
> > +
> > +	ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D ARRAY_SIZE(msgs))
> > +		return -EIO;
> > +
> > +	return 0;
> > +} =20
>=20
> ...
>=20
> > +#ifndef __TURRIS_OMNIA_MCU_INTERFACE_H
> > +#define __TURRIS_OMNIA_MCU_INTERFACE_H
> > +
> > +#include <linux/bits.h> =20
>=20
> + bitfield.h

Fixed for v6.

>=20
> > +#endif /* __TURRIS_OMNIA_MCU_INTERFACE_H */ =20
>=20


