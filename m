Return-Path: <linux-gpio+bounces-39273-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUOkJc/CRGq80QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39273-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:33:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5586EAABA
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:33:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dXF2gbb4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39273-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39273-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9928C304B6AA
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D813A0EB3;
	Wed,  1 Jul 2026 07:31:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B822798EA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:31:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891099; cv=none; b=PFCKuzqUgXCi43BSTw4SzxAT0IgJVvJH0xamFE+DrjJ0LQEvMBIeZogtPtEmsqMMobvQnGkwzzwX523gt0ryavkV2R/j9IJOuYr8m0Yx2msa4pUhs+OaoSeIRi3H0jptYBqD12yzhBLqp9yHJMiz9SagPLnJEuwaDxyYBqOO2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891099; c=relaxed/simple;
	bh=iUaIFCGnuFfNH3URRFCdq+79pJiah1D8HEIjhWk+yCw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6T//37Y510ZzgG71s7dVdnpi5bBoHRdCMeQOuUQVUM4rxfv2Hc2E5z8mlidxJbV1OMcXSgXjBLreVhglMt8T3YiyZrtmjYR77mKDUSWDemBepUXois/OoTyASEIWBmoNDIddCNjs3soPnk+KAApypz1NEd2kPwdmlz61/Kxzkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXF2gbb4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57141F00ACA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891097;
	bh=EHH0hjrKeaZWnba6OJ5JT0e3gySxkqVh6AO3zCntqNE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dXF2gbb4zSreejAuIAugrOyXLuV+oDU7bhAYgL0LZxT0zrV9v8M5ANPVmGmXDFNKW
	 Zqy3X3gD6N5hBwHERKl8dd2ZkXb75PHo8petzIQkpDR9vDKkYMZxCq6jNbmxRZmz/C
	 /cA/iBHwJHvLucrePyNEZJWpTfOL2U6tLtXxV94EyOAblZaLwAqNtX30lgZ7pU7PEf
	 S1NcZvtsLS9BV/x/qC+mR/FH7XowLzv3L09xDuwXs/2uLIq5pQfKfqXTJw0wdtZJ3B
	 koAK0uVuwl844JRhO2/5wCvIMR4WhpBBWfmGFpx73gG8mbnMN4NQDxK7pG/9oG8C+W
	 m80tae7NgM2gw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39adb9a103aso3356651fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:31:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoAdxx9tnruJXy7O3g+bu9x/pepTP7Xe5sZu8NwyAXoneavfugjuUj8MrWY6i0iB898JSEGKl6GWAW3@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLmjdL/gM9gsjAJHo99nHtL9nBdw/czAB3xKgdGRMFIidb4od
	1OmmVd3iMKaaUBKB+nDOmD7gfCTIRjsiGXo5mkKwE/04nFDdnGqFwr5k8Cs1NzITmxA8ratb9TD
	uaVT8LslrshUWPZM6X9G+PlA1ZRoRR4/G83hwypo0fw==
X-Received: by 2002:a2e:bd83:0:b0:399:8394:9dee with SMTP id
 38308e7fff4ca-39b340c41d3mr912171fa.25.1782891096281; Wed, 01 Jul 2026
 00:31:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:31:35 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:31:35 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com> <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Date: Wed, 1 Jul 2026 03:31:35 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md2=u=tWhC-H6CA10zoS3ByPtA0UuSsCVkh-eLNe=Rmaw@mail.gmail.com>
X-Gm-Features: AVVi8Cc_OfLeKOGOhGEKktyfB7tzHJqrZ0eIZ3H6jyHsoTN6UQFcWrRNSrUer3M
Message-ID: <CAMRc=Md2=u=tWhC-H6CA10zoS3ByPtA0UuSsCVkh-eLNe=Rmaw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39273-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.perrot@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-watchdog@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:miquel.raynal@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jeremie.dautheribes@bootlin.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:lee@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5586EAABA

On Tue, 30 Jun 2026 14:51:13 +0200, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
>
> The driver implements a custom regmap bus over I2C to match the MCU's
> fixed 3-byte command format [opcode, arg, value]. Register addresses
> are encoded as 16-bit values (opcode << 8 | arg) using the
> AAEON_MCU_REG() macro defined in the shared header. The regmap
> instance is shared with child drivers via dev_get_regmap(). Concurrent
> I2C accesses from child drivers are serialized by regmap's built-in
> locking.
>
> I2C transfers use heap-allocated DMA-safe buffers rather than
> stack-allocated ones, as required by I2C controllers that perform DMA.
>
> Regmap caching is enabled (REGCACHE_MAPLE) with a volatile_reg
> callback that marks GPIO input read registers (opcode 0x72) and the
> watchdog status register (opcode 0x63, arg 0x02) as volatile. All
> other registers written by the driver (GPIO direction,
> GPO state, watchdog control) are stable and can be safely cached.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/mfd/Kconfig           |  11 +++
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/aaeon-mcu.c       | 205 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/aaeon-mcu.h |  40 +++++++++
>  5 files changed, 259 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d55f76f35..f91b6a1826d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> +F:	drivers/mfd/aaeon-mcu.c
> +F:	include/linux/mfd/aaeon-mcu.h
>
>  AAEON UPBOARD FPGA MFD DRIVER
>  M:	Thomas Richard <thomas.richard@bootlin.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38a..ed5169c7a683 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1561,6 +1561,17 @@ config ABX500_CORE
>  	  remain unchanged when IC changes. Binding of the functions to
>  	  actual register access is done by the IC core driver.
>
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C
> +	select MFD_CORE
> +    select REGMAP
> +	help
> +	  Select this option to enable support for the Aaeon SRG-IMX8P
> +	  onboard microcontroller (MCU). This driver provides the core
> +	  functionality to communicate with the MCU over I2C. The MCU
> +	  provides GPIO and watchdog functionality.
> +
>  config AB8500_CORE
>  	bool "ST-Ericsson AB8500 Mixed Signal Power Management chip"
>  	depends on ABX500_CORE && MFD_DB8500_PRCMU
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..34db5b033584 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+=3D 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+=3D 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM886_PMIC)	+=3D 88pm886.o
> +obj-$(CONFIG_MFD_AAEON_MCU)	+=3D aaeon-mcu.o
>  obj-$(CONFIG_MFD_ACT8945A)	+=3D act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
>  obj-$(CONFIG_ARCH_BCM2835)	+=3D bcm2835-pm.o
> diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> new file mode 100644
> index 000000000000..306aaac1bd60
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +struct aaeon_mcu {
> +	struct i2c_client *client;
> +	u8 *cmd;      /* DMA-safe 3-byte write buffer [opcode, arg, value] */
> +	u8 *response; /* DMA-safe 1-byte read buffer for MCU acknowledgment */
> +};
> +
> +static const struct mfd_cell aaeon_mcu_devs[] =3D {
> +	MFD_CELL_BASIC("aaeon-mcu-wdt", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("aaeon-mcu-gpio", NULL, NULL, 0, 0),
> +};
> +
> +/* Number of bytes in a MCU command: [opcode, arg, value] */
> +#define AAEON_MCU_CMD_LEN      3
> +
> +/*
> + * Custom regmap bus for the Aaeon MCU I2C protocol.
> + *
> + * The MCU uses a fixed 3-byte command format [opcode, arg, value] follo=
wed
> + * by a 1-byte response. It requires a STOP condition between the comman=
d
> + * write and the response read, so two separate i2c_transfer() calls are
> + * issued.  The regmap lock serialises concurrent accesses from the GPIO
> + * and watchdog child drivers.
> + *
> + * Register addresses are encoded as a 16-bit big-endian value where the
> + * high byte is the opcode and the low byte is the argument, matching th=
e
> + * wire layout produced by regmap for reg_bits=3D16.
> + */

I would have preferred this implemented as a quirk in the i2c regmap but
won't die on that hill.

> +
> +static int aaeon_mcu_regmap_write(void *context, const void *data, size_=
t count)
> +{
> +	struct aaeon_mcu *mcu =3D context;
> +	struct i2c_client *client =3D mcu->client;
> +	struct i2c_msg write_msg;
> +	/* The MCU always sends a response byte after each command; discard it.=
 */
> +	struct i2c_msg response_msg;
> +	int ret;
> +
> +	memcpy(mcu->cmd, data, count);
> +
> +	write_msg.addr  =3D client->addr;
> +	write_msg.flags =3D I2C_M_DMA_SAFE;
> +	write_msg.buf   =3D mcu->cmd;
> +	write_msg.len   =3D count;
> +
> +	response_msg.addr  =3D client->addr;
> +	response_msg.flags =3D I2C_M_RD | I2C_M_DMA_SAFE;
> +	response_msg.buf   =3D mcu->response;
> +	response_msg.len   =3D 1;
> +
> +	ret =3D i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 1)
> +		return -EIO;
> +
> +	ret =3D i2c_transfer(client->adapter, &response_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_regmap_read(void *context, const void *reg_buf,
> +				 size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct aaeon_mcu *mcu =3D context;
> +	struct i2c_client *client =3D mcu->client;
> +	struct i2c_msg write_msg;
> +	struct i2c_msg read_msg;
> +	int ret;
> +
> +	/*
> +	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
> +	 * Append a trailing 0x00 to form the full 3-byte MCU command.
> +	 */
> +	mcu->cmd[0] =3D ((u8 *)reg_buf)[0];
> +	mcu->cmd[1] =3D ((u8 *)reg_buf)[1];
> +	mcu->cmd[2] =3D 0x00;
> +
> +	write_msg.addr  =3D client->addr;
> +	write_msg.flags =3D I2C_M_DMA_SAFE;
> +	write_msg.buf   =3D mcu->cmd;
> +	write_msg.len   =3D AAEON_MCU_CMD_LEN;
> +
> +	read_msg.addr  =3D client->addr;
> +	read_msg.flags =3D I2C_M_RD | I2C_M_DMA_SAFE;
> +	read_msg.buf   =3D val_buf;
> +	read_msg.len   =3D val_size;
> +
> +	ret =3D i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 1)
> +		return -EIO;
> +
> +	ret =3D i2c_transfer(client->adapter, &read_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus aaeon_mcu_regmap_bus =3D {
> +	.write =3D aaeon_mcu_regmap_write,
> +	.read  =3D aaeon_mcu_regmap_read,
> +};
> +
> +static bool aaeon_mcu_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	/*
> +	 * GPIO input registers are driven by external signals and can change
> +	 * at any time without CPU involvement, always read from hardware.
> +	 *
> +	 * The watchdog status register reflects hardware state and can change
> +	 * autonomously.
> +	 *
> +	 * All other registers are written by the driver and their values are
> +	 * stable, so they can be safely cached.
> +	 */
> +	if ((reg >> 8) =3D=3D AAEON_MCU_READ_GPIO_OPCODE)
> +		return true;
> +	if (reg =3D=3D AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02))
> +		return true;
> +	return false;
> +}
> +
> +static const struct regmap_config aaeon_mcu_regmap_config =3D {
> +	.reg_bits          =3D 16,
> +	.val_bits          =3D 8,
> +	.reg_format_endian =3D REGMAP_ENDIAN_BIG,
> +	.max_register      =3D AAEON_MCU_MAX_REGISTER,
> +	.volatile_reg      =3D aaeon_mcu_volatile_reg,
> +	.cache_type        =3D REGCACHE_MAPLE,
> +};
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu *ddata;
> +	struct regmap *regmap;
> +
> +	ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->client =3D client;
> +
> +	ddata->cmd =3D devm_kzalloc(&client->dev, AAEON_MCU_CMD_LEN * sizeof(*d=
data->cmd),

Why not devm_kcalloc()?

> +				   GFP_KERNEL);
> +	if (!ddata->cmd)
> +		return -ENOMEM;
> +
> +	ddata->response =3D devm_kzalloc(&client->dev, sizeof(*ddata->response)=
, GFP_KERNEL);
> +	if (!ddata->response)
> +		return -ENOMEM;
> +
> +	regmap =3D devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
> +				  ddata, &aaeon_mcu_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "failed to initialize regmap\n");
> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> +	{ .compatible =3D "aaeon,srg-imx8p-mcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon-mcu",
> +		.of_match_table =3D aaeon_mcu_of_match,
> +	},
> +	.probe =3D aaeon_mcu_probe,
> +};
> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.=
h
> new file mode 100644
> index 000000000000..3a1aeec85d60
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +/*
> + * MCU register address: the high byte is the command opcode, the low
> + * byte is the argument.  This matches the 3-byte wire format
> + * [opcode, arg, value] used by the MCU I2C protocol.
> + */
> +#define AAEON_MCU_REG(op, arg)		(((op) << 8) | (arg))
> +
> +/*
> + * Opcode for GPIO input reads. These registers are volatile, their valu=
es
> + * are driven by external signals and can change without CPU involvement=
.
> + * Used by the MFD driver's volatile_reg callback to bypass the regmap c=
ache.
> + */
> +#define AAEON_MCU_READ_GPIO_OPCODE	0x72
> +
> +/*
> + * Opcode for watchdog control and status commands.
> + * The status register (arg=3D0x02) reflects hardware state and is volat=
ile.
> + */
> +#define AAEON_MCU_CONTROL_WDT_OPCODE	0x63
> +
> +/*
> + * Highest register address in the MCU register map.
> + * The WRITE_GPIO opcode (0x77) with the highest GPIO argument (0x0B =3D=
 11,
> + * i.e. MAX_GPIOS - 1) produces the largest encoded address.
> + */
> +#define AAEON_MCU_MAX_REGISTER		AAEON_MCU_REG(0x77, 0x0B)
> +
> +#endif /* __LINUX_MFD_AAEON_MCU_H */
>
> --
> 2.54.0
>
>

Bart

