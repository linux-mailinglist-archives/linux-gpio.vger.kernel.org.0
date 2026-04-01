Return-Path: <linux-gpio+bounces-34562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zQ3kCCYjzWlkaQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 15:52:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A637B9BA
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 15:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96EC9301F3BA
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 13:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE68443CECB;
	Wed,  1 Apr 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tkyzk5+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB8408256;
	Wed,  1 Apr 2026 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051300; cv=none; b=e1gZv80K3TttkFIU5hITfNs7HAxfwErLILt4ajEDjBNeYrTa7qZTeE4N+SZhJN3I9S4oljItx4S61kSCMSwoUiDuNYfkRu2fCr3x8eTGaGBwqx1T/gNYZMicvN2I64KTgFsE5v1v/oxVlGglU13O+SyQxs+jWXBDZ6teKsfKIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051300; c=relaxed/simple;
	bh=ggdVXHkH3QDx7OVyZru0/lNedC1XWTM1v7xFBHfETDo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNMYnxQKOcm2X/hK6IFZVgLvM48OIEUSv4oLz5qffMAkYtJ2PjvTCU80KV3HQN3VY5+jSYwBcXdH68BHk4DEIjmQO3nZeV5KJqEc6/MwsPk2fYuS4l+dYyn1QCwil/PaS/U49LSQilfDmZi/GGeT5XVsU27O4OZ8t30Tb+waBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tkyzk5+b; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 322DB1A315D;
	Wed,  1 Apr 2026 13:48:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9686602BF;
	Wed,  1 Apr 2026 13:48:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB74A10450A06;
	Wed,  1 Apr 2026 15:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775051294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=HoWKSnsKLtxY9sRG37q7JopC8BGz/Pr3NVh3r3H0wtg=;
	b=tkyzk5+bcmjJPZWDQVYYUF6MQeyeC3EoCrpJN+CU5Qyq50wiRJGECWFhjdgQzapypJqxYE
	oCslFr2SxiUnS5Q3TFEv1i+XuIsIYnJoQ6pVcK/UmOc9TOFO4/Hxkk5usw2SAB2ow9warh
	hiz2tbnra9fG2YNoBe8gVJLwLYAQ191WjyUtZaIFfCQGEq2b16SFqJOI6yEl94mk/5P6UK
	pqOZJ4SEmbZJK0hb7h7QZA2GUXPdePGBXh3TP4VugoH2GhPA9/GubbFeMgrTnxm3yUr20u
	U2cg3A6aYvxiFLp4UJ2gqWIYP3ggIuNVuK64l7c2FjjPphrPlXeNjZt3uCcD9g==
Message-ID: <9a66f7612a8d96d7c44e86a9426a8c553329580b.camel@bootlin.com>
Subject: Re: [PATCH v4 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Wed, 01 Apr 2026 15:48:08 +0200
In-Reply-To: <20260331130848.GG3795166@google.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
	 <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
	 <20260331130848.GG3795166@google.com>
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
	protocol="application/pgp-signature"; boundary="=-qAFYFdvVYExu7LPUqa+z"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34562-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D75A637B9BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-qAFYFdvVYExu7LPUqa+z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Lee,

Thank you for the review. Please find answers to your questions inline,
and the remaining items will be addressed in v5.

On Tue, 2026-03-31 at 14:08 +0100, Lee Jones wrote:
> On Tue, 24 Mar 2026, Thomas Perrot (Schneider Electric) wrote:
>=20
> > Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
> > embedded controller. This driver provides the core I2C
> > communication
> > interface and registers child devices (GPIO and watchdog
> > controllers).
> >=20
> > The driver implements a custom regmap bus over I2C to match the
> > MCU's
> > fixed 3-byte command format [opcode, arg, value]. Register
> > addresses
> > are encoded as 16-bit values (opcode << 8 | arg) using the
> > AAEON_MCU_REG() macro defined in the shared header. The regmap
> > instance is shared with child drivers via dev_get_regmap().
> > Concurrent
> > I2C accesses from child drivers are serialized by regmap's built-in
> > locking.
> >=20
> > Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric)
> > <jeremie.dautheribes@bootlin.com>
> > Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric)
> > <jeremie.dautheribes@bootlin.com>
> > Signed-off-by: Thomas Perrot (Schneider Electric)
> > <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/mfd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 10 +++
> > =C2=A0drivers/mfd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/mfd/aaeon-mcu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 155
> > ++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/linux/mfd/aaeon-mcu.h |=C2=A0 20 ++++++
> > =C2=A05 files changed, 188 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index
> > ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221
> > f6c8e8a3652cd77 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
> > =C2=A0R:	J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.com=
>
> > =C2=A0S:	Maintained
> > =C2=A0F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-
> > mcu.yaml
> > +F:	drivers/mfd/aaeon-mcu.c
> > +F:	include/linux/mfd/aaeon-mcu.h
> > =C2=A0
> > =C2=A0AAEON UPBOARD FPGA MFD DRIVER
> > =C2=A0M:	Thomas Richard <thomas.richard@bootlin.com>
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index
> > aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe
> > 7b1c91b72253c05 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1574,6 +1574,16 @@ config AB8500_CORE
> > =C2=A0	=C2=A0 the irq_chip parts for handling the Mixed Signal chip
> > events.
> > =C2=A0	=C2=A0 This chip embeds various other multimedia
> > functionalities as well.
> > =C2=A0
> > +config MFD_AAEON_MCU
> > +	tristate "Aaeon SRG-IMX8P MCU Driver"
> > +	depends on I2C || COMPILE_TEST
> > +	select MFD_CORE
> > +	help
> > +	=C2=A0 Select this option to enable support for the Aaeon SRG-
> > IMX8P
> > +	=C2=A0 onboard microcontroller (MCU). This driver provides the
> > core
> > +	=C2=A0 functionality to communicate with the MCU over I2C. The
> > MCU
> > +	=C2=A0 provides GPIO and watchdog functionality.
> > +
> > =C2=A0config MFD_DB8500_PRCMU
> > =C2=A0	bool "ST-Ericsson DB8500 Power Reset Control Management
> > Unit"
> > =C2=A0	depends on UX500_SOC_DB8500
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index
> > e75e8045c28afae975ac61d282b3b85af5440119..34db5b033584368b7a269b1ee
> > f12528a74baf8f5 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+=3D 88pm860x.o
> > =C2=A0obj-$(CONFIG_MFD_88PM800)	+=3D 88pm800.o 88pm80x.o
> > =C2=A0obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
> > =C2=A0obj-$(CONFIG_MFD_88PM886_PMIC)	+=3D 88pm886.o
> > +obj-$(CONFIG_MFD_AAEON_MCU)	+=3D aaeon-mcu.o
> > =C2=A0obj-$(CONFIG_MFD_ACT8945A)	+=3D act8945a.o
> > =C2=A0obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
> > =C2=A0obj-$(CONFIG_ARCH_BCM2835)	+=3D bcm2835-pm.o
> > diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..5a969890d201c027eb25c324b
> > 4d4d89b1f8c563e
> > --- /dev/null
> > +++ b/drivers/mfd/aaeon-mcu.c
> > @@ -0,0 +1,155 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Aaeon MCU driver
> > + *
> > + * Copyright (C) 2025 Bootlin
> > + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.=
com>
> > + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > + */
>=20
> Consider updating the Copyright date - we're pretty deep into 2026 at
> this point.
>=20
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +static const struct mfd_cell aaeon_mcu_devs[] =3D {
> > +	{
> > +		.name =3D "aaeon-mcu-wdt",
> > +	},
> > +	{
> > +		.name =3D "aaeon-mcu-gpio",
> > +	},
> > +};
>=20
> MFD_CELL_BASIC()
>=20
> > +/*
> > + * Custom regmap bus for the Aaeon MCU I2C protocol.
> > + *
> > + * The MCU uses a fixed 3-byte command format [opcode, arg, value]
> > followed
> > + * by a 1-byte response.=C2=A0 It requires a STOP condition between th=
e
> > command
> > + * write and the response read, so two separate i2c_transfer()
> > calls are
> > + * issued.=C2=A0 The regmap lock serialises concurrent accesses from
> > the GPIO
> > + * and watchdog child drivers.
> > + *
> > + * Register addresses are encoded as a 16-bit big-endian value
> > where the
> > + * high byte is the opcode and the low byte is the argument,
> > matching the
> > + * wire layout produced by regmap for reg_bits=3D16.
> > + */
> > +
> > +static int aaeon_mcu_regmap_write(void *context, const void *data,
> > size_t count)
> > +{
> > +	struct i2c_client *client =3D context;
> > +	/* data =3D [opcode, arg, value] as formatted by regmap */
> > +	struct i2c_msg write_msg =3D {
> > +		.addr=C2=A0 =3D client->addr,
> > +		.flags =3D 0,
> > +		.buf=C2=A0=C2=A0 =3D (u8 *)data,
> > +		.len=C2=A0=C2=A0 =3D count,
> > +	};
> > +	u8 rsp;
> > +	/* The MCU always sends a response byte after each
> > command; discard it. */
> > +	struct i2c_msg rsp_msg =3D {
>=20
> Assuming 'rsp' means response, let's just write that out in full.
>=20
> Readability wins over brevity every time.
>=20
> > +		.addr=C2=A0 =3D client->addr,
> > +		.flags =3D I2C_M_RD,
> > +		.buf=C2=A0=C2=A0 =3D &rsp,
> > +		.len=C2=A0=C2=A0 =3D 1,
> > +	};
> > +	int ret;
>=20
> Since some I2C host controllers might use DMA, should we ensure that
> the
> 'rsp' buffer is allocated in DMA-safe memory rather than on the stack
> to
> prevent potential cache-line corruption?
>=20
> Also allocation of structs during in declaration statements is rough!
>=20
> And adding that u8 in the middle is just rubbing it in.
>=20
> > +	ret =3D i2c_transfer(client->adapter, &write_msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D 1)
> > +		return -EIO;
> > +
> > +	ret =3D i2c_transfer(client->adapter, &rsp_msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D 1)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static int aaeon_mcu_regmap_read(void *context, const void
> > *reg_buf,
> > +				 size_t reg_size, void *val_buf,
> > size_t val_size)
> > +{
> > +	struct i2c_client *client =3D context;
> > +	/*
> > +	 * reg_buf holds the 2-byte big-endian register address
> > [opcode, arg].
> > +	 * Append a trailing 0x00 to form the full 3-byte MCU
> > command.
> > +	 */
> > +	u8 cmd[3] =3D { ((u8 *)reg_buf)[0], ((u8 *)reg_buf)[1], 0x00
> > };
> > +	struct i2c_msg write_msg =3D {
> > +		.addr=C2=A0 =3D client->addr,
> > +		.flags =3D 0,
> > +		.buf=C2=A0=C2=A0 =3D cmd,
> > +		.len=C2=A0=C2=A0 =3D sizeof(cmd),
> > +	};
> > +	struct i2c_msg read_msg =3D {
> > +		.addr=C2=A0 =3D client->addr,
> > +		.flags =3D I2C_M_RD,
> > +		.buf=C2=A0=C2=A0 =3D val_buf,
> > +		.len=C2=A0=C2=A0 =3D val_size,
> > +	};
> > +	int ret;
> > +
> > +	ret =3D i2c_transfer(client->adapter, &write_msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D 1)
> > +		return -EIO;
> > +
> > +	ret =3D i2c_transfer(client->adapter, &read_msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D 1)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_bus aaeon_mcu_regmap_bus =3D {
> > +	.write =3D aaeon_mcu_regmap_write,
> > +	.read=C2=A0 =3D aaeon_mcu_regmap_read,
> > +};
> > +
> > +static const struct regmap_config aaeon_mcu_regmap_config =3D {
> > +	.reg_bits=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1=
6,
> > +	.val_bits=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 8=
,
> > +	.reg_format_endian =3D REGMAP_ENDIAN_BIG,
> > +	.cache_type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D REGCACHE_NO=
NE,
>=20
> Are you sure?=C2=A0 Why none?

The GPIO and watchdog states are managed entirely by the MCU firmware,
which makes the design safer because every access goes directly to the
hardware. I will look into adding a cache; otherwise I will add a
comment in v5.

>=20
> > +};
> > +
> > +static int aaeon_mcu_probe(struct i2c_client *client)
> > +{
> > +	struct regmap *regmap;
> > +
> > +	regmap =3D devm_regmap_init(&client->dev,
> > &aaeon_mcu_regmap_bus,
> > +				=C2=A0 client,
> > &aaeon_mcu_regmap_config);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
>=20
> dev_err_probe()
>=20
> > +
> > +	return devm_mfd_add_devices(&client->dev,
> > PLATFORM_DEVID_NONE,
> > +				=C2=A0=C2=A0=C2=A0 aaeon_mcu_devs,
> > ARRAY_SIZE(aaeon_mcu_devs),
> > +				=C2=A0=C2=A0=C2=A0 NULL, 0, NULL);
>=20
> Why PLATFORM_DEVID_NONE over AUTO here?

No strong reason, it was an oversight. Since multiple instances of this
MCU could theoretically be present, AUTO is the safer choice and avoids
potential ID collisions.
Fixed in v5.

>=20
> > +}
> > +
> > +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> > +	{ .compatible =3D "aaeon,srg-imx8p-mcu" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> > +
> > +static struct i2c_driver aaeon_mcu_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "aaeon_mcu",
> > +		.of_match_table =3D aaeon_mcu_of_match,
> > +	},
> > +	.probe =3D aaeon_mcu_probe,
> > +};
> > +module_i2c_driver(aaeon_mcu_driver);
> > +
> > +MODULE_DESCRIPTION("Aaeon MCU Driver");
> > +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes
> > <jeremie.dautheribes@bootlin.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/aaeon-mcu.h
> > b/include/linux/mfd/aaeon-mcu.h
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..861003f6dfd20424c3785008b
> > d2cf89aaa1715b9
> > --- /dev/null
> > +++ b/include/linux/mfd/aaeon-mcu.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Aaeon MCU driver definitions
> > + *
> > + * Copyright (C) 2025 Bootlin
> > + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.=
com>
> > + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > + */
>=20
> As above.
>=20
> > +
> > +#ifndef __LINUX_MFD_AAEON_MCU_H
> > +#define __LINUX_MFD_AAEON_MCU_H
> > +
> > +/*
> > + * MCU register address: the high byte is the command opcode, the
> > low
> > + * byte is the argument.=C2=A0 This matches the 3-byte wire format
> > + * [opcode, arg, value] used by the MCU I2C protocol.
> > + */
> > +#define AAEON_MCU_REG(op, arg)	(((op) << 8) | (arg))
>=20
> Where else is this used?

It is used by both child drivers:                                    =20
  - drivers/gpio/gpio-aaeon-mcu.c
  - drivers/watchdog/aaeon_mcu_wdt.c                                 =20
                                                           =20
This macro encodes the regmap register address from the opcode and
argument that form the first two bytes of the MCU's 3-byte wire
command, so keeping it in the shared header avoids duplicating that
encoding in each child.

Kind regards,
Thomas Perrot

>=20
> > +#endif /* __LINUX_MFD_AAEON_MCU_H */
> >=20
> > --=20
> > 2.53.0
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-qAFYFdvVYExu7LPUqa+z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmnNIhgACgkQn8ALBXH+
Cu172gv9GgIfxJvzrGHi2oit23sgeO0wrp0sinvt75UMb7cK+Tp/HJ38Hx/DxbBr
kmTXzIBJV5tKZW47P0CTzLcawF933hiIgB5h5A296VD9q+cg/ngaMw64PckNKk3q
/1WCifNYu2V1N4x4D3KCsM1OpIn85BNvb4tPEVsFQJY4qr4V3G5+Q1RvD2iAX1wr
1tSvD7CQeMJehtGLxAmP9tvJlO2YjBg+eRwfh+flXe29IegWBTrbcSNTX1NIkCDG
1ep1bfKA+Nrr8lecc1+9gYp5LI7GmPOgyy3XQsGTuDOze+zoUV+S3+FQgEvWJrZ5
mkwx8vtm/eKgyn8ukfdHgTgRm2ys2Ar3FuzcdNivI6cv7JgF73/cAbHVxVf8ygs3
W70ljvXUqXj0AyK82UACVPShzjO/I75gSruJ0ky9G5GUqaKPatQIsY8k/l88hnzO
ndL4wh4cjZsGKLZyZ+MTk7LxYomoOvGXnAj/SJaLYKe/YCxjOF3KLYrWF9NP+4gh
YGKXXyXB
=Mf4x
-----END PGP SIGNATURE-----

--=-qAFYFdvVYExu7LPUqa+z--

