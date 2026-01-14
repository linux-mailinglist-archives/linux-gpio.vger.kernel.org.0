Return-Path: <linux-gpio+bounces-30516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F026D1D646
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C9C307675E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 08:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A7A37FF47;
	Wed, 14 Jan 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CtdXhCD7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89437E312;
	Wed, 14 Jan 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381156; cv=none; b=Q1I2yN+mGBwOQb8x8rW1dqK9FLAB2SV7XXr8gotOmYcM50qudvjCNtJkMflgM4IGOaGln+KPbPs/1+jr5UGzBoV9ZB/vzrXWML/qSuSy553Go2vWSr8xJTTlrXzK+AanjerfN3bZVul+Wnojq68aC+stKqhSvlorx0whHTBP7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381156; c=relaxed/simple;
	bh=alYneXG4Kl+PUCMkLvREjdXsq4e/uGVZBEyuXSPJFH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkCP7s/NNbKMXDBw0EVixSPVoW/cNctIF147mlj8d5f0VHhdR1wJWjH1dZRsMiBh1K1J2Fnzp5i+6XtEx14HENbPZ7OEnfrOdtAmro4Ur0pAeuPyK8zpjqpamZOnGGox+v9GJhOncL1S6HuungSIU1Va20d2QyEUNDW8Oe1rTBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CtdXhCD7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23E38C1C96B;
	Wed, 14 Jan 2026 08:58:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B245A6074A;
	Wed, 14 Jan 2026 08:59:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAE35103C837F;
	Wed, 14 Jan 2026 09:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768381148; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=764/c4Amod76UQU+5CMpywB2vKHz4yp6Ft021kUrQzA=;
	b=CtdXhCD7qavBZyQ9oqDIRvIFtpeK6y87husbympn81pcnT6eA/azlQjTns8Kgnf7HCtAUj
	OZyM3QviC21htUDch2QoazV/mfle8bolKPl1cb7aJ28qdNN7i9qXMhOtnj/x8Xs08/mwic
	zXjbRtnjYEx8zlfhPDRMVRq244G1aT9PzgcRUMNy9UCyHv2BivdfPwjrxRti5XH0ANijBs
	6CecRbupwYjKXLuUQexsr3lhcqMn0mdckSIaA5T/lbtBTHX4ARyREEot7ip5Gy48eE6DJV
	NLQgmq+koXwxAU+1DVhHEmYx+GVNZGMNUPxnwdC8HB2tDNvWSpQYIet6EN0fag==
Message-ID: <0c6073253466314acde4394c5b8d3703a59b28b7.camel@bootlin.com>
Subject: Re: [PATCH 5/8] mfd: aaeon: Add SRG-IMX8PL MCU driver
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: thomas.perrot@bootlin.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij <linusw@kernel.org>,  Bartosz Golaszewski	 <brgl@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer	 <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>, =?ISO-8859-1?Q?J=E9r=E9mie?= Dautheribes
 <jeremie.dautheribes@bootlin.com>,  Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Jan 2026 09:59:03 +0100
In-Reply-To: <20260109171431.GE1808297@google.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
	 <20251212-dev-b4-aaeon-mcu-driver-v1-5-6bd65bc8ef12@bootlin.com>
	 <20260109171431.GE1808297@google.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kiPaB+C8pSildM/wevlA"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3


--=-kiPaB+C8pSildM/wevlA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Fri, 2026-01-09 at 17:14 +0000, Lee Jones wrote:
> On Fri, 12 Dec 2025, Thomas Perrot (Schneider Electric) wrote:
>=20
> > Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL
>=20
> Drop all mentions of MFD.=C2=A0 It's not a real thing - we made it up.
>=20
> > embedded controller. This driver provides the core I2C
> > communication
> > interface and registers child devices (GPIO and watchdog
> > controllers).
> >=20
> > The MCU firmware version is queried during probe and logged for
> > diagnostic purposes. All I2C transactions are serialized using a
> > mutex
> > to ensure proper communication with the microcontroller.
> >=20
> > Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric)
> > <jeremie.dautheribes@bootlin.com>
> > Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric)
> > <jeremie.dautheribes@bootlin.com>
> > Signed-off-by: Thomas Perrot (Schneider Electric)
> > <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0drivers/mfd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 10 ++++
> > =C2=A0drivers/mfd/aaeon-mcu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 133
> > ++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/linux/mfd/aaeon-mcu.h |=C2=A0 30 ++++++++++
> > =C2=A03 files changed, 173 insertions(+)
> >=20
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index
> > aace5766b38aa5e46e32a8a7b42eea238159fbcf..9195115c7bcd619439cb9ff71
> > d70e46629291867 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1574,6 +1574,16 @@ config AB8500_CORE
> > =C2=A0	=C2=A0 the irq_chip parts for handling the Mixed Signal chip
> > events.
> > =C2=A0	=C2=A0 This chip embeds various other multimedia
> > functionalities as well.
> > =C2=A0
> > +config MFD_AAEON_MCU
> > +	tristate "Aaeon SRG-IMX8PL MCU Driver"
> > +	depends on I2C
> > +	select MFD_CORE
> > +	help
> > +	=C2=A0 Select this option to enable support for the Aaeon SRG-
> > IMX8PL
> > +	=C2=A0 onboard microcontroller (MCU). This driver provides the
> > core
> > +	=C2=A0 functionality to communicate with the MCU over I2C. The
> > MCU
> > +	=C2=A0 provides various sub-devices including GPIO and watchdog
> > controllers.
>=20
> Is that an exhaustive list of sub-devices?
>=20
> > =C2=A0config MFD_DB8500_PRCMU
> > =C2=A0	bool "ST-Ericsson DB8500 Power Reset Control Management
> > Unit"
> > =C2=A0	depends on UX500_SOC_DB8500
> > diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..472d44d5e8627f46806015599
> > 542753a5bda4526
> > --- /dev/null
> > +++ b/drivers/mfd/aaeon-mcu.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Aaeon MCU MFD driver
>=20
> Not MFD - describe the actual device.
>=20
> > + *
> > + * Copyright (C) 2025 Bootlin
>=20
> Has it been agreed that you would hold the copyright to this?
>=20

Yes, we would like to retain the copyright.

> > + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.=
com>
> > + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/aaeon-mcu.h>
>=20
> Alphabetical.
>=20
> > +#define AAEON_MCU_GET_FW_VERSION 0x76
>=20
> Is that what the register is called in the datasheet?
>=20
> The GET part is odd.

There isn't a datasheet; the driver was written using reverse
engineering.

I will rename it to AAEON_MCU_FW_VERSION.

>=20
> > +static struct mfd_cell aaeon_mcu_devs[] =3D {
> > +	{
> > +		.name =3D "aaeon-mcu-wdt",
> > +		.of_compatible =3D "aaeon,srg-imx8pl-wdt",
> > +	},
> > +	{
> > +		.name =3D "aaeon-mcu-gpio",
> > +		.of_compatible =3D "aaeon,srg-imx8pl-gpio",
> > +	},
> > +};
> > +
> > +static int aaeon_mcu_print_fw_version(struct i2c_client *client)
> > +{
> > +	u8 cmd[3], version[2];
> > +	int ret;
> > +
> > +	/* Major version number */
> > +	cmd[0] =3D AAEON_MCU_GET_FW_VERSION;
> > +	cmd[1] =3D 0x00;
> > +	cmd[2] =3D 0x00;
> > +
> > +	ret =3D aaeon_mcu_i2c_xfer(client, cmd, 3, &version[0], 1);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Minor version number */
> > +	cmd[0] =3D AAEON_MCU_GET_FW_VERSION;
> > +	cmd[1] =3D 0x01;
> > +	/* cmd[2] =3D 0x00; */
> > +
> > +	ret =3D aaeon_mcu_i2c_xfer(client, cmd, 3, &version[1], 1);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	dev_info(&client->dev, "firmware version: v%d.%d\n",
> > +		 version[0], version[1]);
>=20
> What do you expect a user to do with this information?
>=20

I believe this information can be useful, as there may be different
firmware versions, potentially leading to varying behaviors or bugs.
This will help us determine how to extend the driver to implement
specific quirks or features based on the firmware version.

> Let's cut the debug cruft - you can add it again locally if you need
> to debug.
>=20
> > +
> > +	return 0;
> > +}
>=20
> Besides providing a questionable print, you don't seem to be doing
> anything with this information - is it needed at all?

This information isn't required for now, but it can be useful if
different behavior is observed in the field for products using
different firmware versions.

>=20
> > +static int aaeon_mcu_probe(struct i2c_client *client)
> > +{
> > +	struct aaeon_mcu_dev *mcu;
> > +	int ret;
> > +
> > +	mcu =3D devm_kzalloc(&client->dev, sizeof(*mcu),
> > GFP_KERNEL);
> > +	if (!mcu)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, mcu);
>=20
> > +	mcu->dev =3D &client->dev;
> > +	mcu->i2c_client =3D client;
>=20
> How do you expect to be able to 'get' this data back if you do not
> have
> the 'dev' or the 'client'?

Thank you. I will remove the client and use to_i2c_client() instead.

>=20
> > +	mutex_init(&mcu->i2c_lock);
> > +
> > +	ret =3D aaeon_mcu_print_fw_version(client);
> > +	if (ret) {
> > +		dev_err(&client->dev, "unable to read firmware
> > version\n");
> > +		return ret;
> > +	}
> > +
> > +	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE,
> > aaeon_mcu_devs,
> > +				=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(aaeon_mcu_devs),
> > NULL, 0, NULL);
> > +}
> > +
> > +int aaeon_mcu_i2c_xfer(struct i2c_client *client,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u8 *cmd, int cmd_len,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 *rsp, int rsp_len)
> > +{
> > +	struct aaeon_mcu_dev *mcu =3D i2c_get_clientdata(client);
> > +	int ret;
> > +
> > +	mutex_lock(&mcu->i2c_lock);
> > +
> > +	ret =3D i2c_master_send(client, cmd, cmd_len);
> > +	if (ret < 0)
> > +		goto unlock;
> > +
> > +	ret =3D i2c_master_recv(client, rsp, rsp_len);
> > +	if (ret < 0)
> > +		goto unlock;
>=20
> Isn't this all very generic?

In this case, it doesn=E2=80=99t seem possible to use i2c_transfer() becaus=
e
the mcu requires a stop condition after receiving the command before it
can respond.

Kind regards,
Thomas Perrot

> I wonder how many similar functions there are in the kernel.
>=20
> Worth making this global?
>=20
> > +	if (ret !=3D rsp_len) {
> > +		dev_err(&client->dev,
> > +			"i2c recv count error (expected: %d,
> > actual: %d)\n",
> > +			rsp_len, ret);
> > +		ret =3D -EIO;
> > +		goto unlock;
> > +	}
> > +
> > +	ret =3D 0;
> > +
> > +unlock:
> > +	mutex_unlock(&mcu->i2c_lock);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
>=20
> This should be much further up.=C2=A0 At least above probe - perhaps
> higher.
> > +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> > +	{ .compatible =3D "aaeon,srg-imx8pl-mcu" },
> > +	{},
> > +};
> > +
>=20
> Remove this line.
>=20
> > +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> > +
> > +static struct i2c_driver aaeon_mcu_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "aaeon_mcu",
> > +		.of_match_table =3D aaeon_mcu_of_match,
> > +	},
> > +	.probe =3D aaeon_mcu_probe,
> > +};
> > +
>=20
> And this one.
>=20
> > +module_i2c_driver(aaeon_mcu_driver);
> > +
> > +MODULE_DESCRIPTION("Aaeon MCU MFD Driver");
>=20
> Not MFD.
>=20
> > +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes");
>=20
> Email?
>=20
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/aaeon-mcu.h
> > b/include/linux/mfd/aaeon-mcu.h
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..89632cb46bc6c9518755dc43a
> > fb87faa94acb6f5
> > --- /dev/null
> > +++ b/include/linux/mfd/aaeon-mcu.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Aaeon MCU driver definitions
> > + *
> > + * Copyright (C) 2025 Bootlin
> > + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.=
com>
> > + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > + */
> > +
> > +#ifndef __LINUX_MFD_AAEON_MCU_H
> > +#define __LINUX_MFD_AAEON_MCU_H
> > +
> > +/**
> > + * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
> > + * @dev: Pointer to kernel device structure
> > + * @i2c_client: Pointer to the Aaeon MCU I2C client
> > + * @i2c_lock: Mutex to serialize I2C bus access
> > + */
> > +
> > +struct aaeon_mcu_dev {
> > +	struct device *dev;
> > +	struct i2c_client *i2c_client;
> > +	struct mutex i2c_lock;
> > +};
> > +
> > +int aaeon_mcu_i2c_xfer(struct i2c_client *client,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u8 *cmd, int cmd_len,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 *rsp, int rsp_len);
> > +
> > +#endif /*=C2=A0 __LINUX_MFD_AAEON_MCU_H */
> >=20
> > --=20
> > 2.52.0
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-kiPaB+C8pSildM/wevlA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmlnWtcACgkQn8ALBXH+
Cu0AHgv/QJe8AKnxkTJHJ2FPZ4X8lSdzdvUj8++F6kvFDHU4mpCzrer6k2o8WDjL
5x++1olrSjMPB2K2yTX+Jfz29rOwqz1DFqtpN4rKTlIO+a31E4kZKIKQwMcu0STg
hNCjM9FhYrFqlpyFNbNRzBlcJpskh7N4t2cpY67QbyCZa7o46gCiWZ/OufI8tvJ8
uwY4M31pL/a6IxxCq/jQ0vAGDwQNarWaTzXiQ2O+ldggMJP5nP72T0t9/JwQTPaP
wRAbZW/4jJ7RPYDB3+Faad3loMOA3T6NgngVy47xr8ttH8cZSeBrskgiqOs3ox/h
8rqkSMHWaW8TFsAqafu+sP2GSLSxbWRFKMVXjdL1OTpuzD7tSvy4GcNGVSakGMr3
hFfnV2JkSJrZ8s2wbD3Pt75slixOHb6gRY+BfxP396o8bDCzaDNIdy/jh1ygrQiH
5p9XaziocfxXRj+k+r6bca87rRLh/P7VLyjC3jWLlIE2SBFGsSNdElB3cEbxMJP9
RlJcY6N1
=35M5
-----END PGP SIGNATURE-----

--=-kiPaB+C8pSildM/wevlA--

