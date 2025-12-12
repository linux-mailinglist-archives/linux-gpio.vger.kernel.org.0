Return-Path: <linux-gpio+bounces-29483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 987ECCB8944
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 11:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA5D3304198F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3C9315D28;
	Fri, 12 Dec 2025 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Grw/XY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30330FF26
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534275; cv=none; b=mMaqe9t9XuZqd2N48+XeoKF0UsISzskuTZtaYqg3M64sviyDWd886EnIIgUNrlSqN25Xt9A4vqqFvr8JBAtLmzt2/pl2GkjBtCPQx7j3FNaEk3vycr1spdcF0M2GmjfxuWJ4D3253BVJtK+/nf0F+PUoFb1LRx6/5oT54cehwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534275; c=relaxed/simple;
	bh=K9iOfHu3sHH8E2mx/0wrzT5tjpWF/oxkt/1WE6QwHvc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muwrDoWTc5Pr37Yj4cwZBr+PlV1MtMmlkhQB2/DQ7bYMMCp0EpZXNmgG1wJGPudGBvFjBXuVcigeaCMcf2m706Yt3B49hqWCrvxNU01/64I7oGY4TF6Rls5t1tWVHlgWhPh0GB/lPVlb1rGNM/St8c2rR1v9Yaz7NKFxVxENlSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Grw/XY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97ACC116B1
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765534274;
	bh=K9iOfHu3sHH8E2mx/0wrzT5tjpWF/oxkt/1WE6QwHvc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=B4Grw/XYgfImbgds3cMa893XWbZhiOjKQrw2KF9QHZLYIC3QpCHOqDsX0FPv+95ZA
	 MtVWlIM9q5R55GZukJY5aHWz/R5bZGJj5zYusPu/v42G6olNoebuToBTIo/WyZvZh2
	 xmagALpXV6kY1/wIHLMOfARvx/zlsQYdgEjvG7aA3A1Y2/Rz6kspBp22j86ebBkMHy
	 V8TxVS9QzWDUCL5YCprzPoTREi8IC0r7IDSolRdY1BACD9h/pwhfT1gIsCr1KAwd+3
	 SgfEX+KVHCl6trqKeiRsp1xqscRedCq2uTdwMzuG6bjv9Y/CPf5s4bANrxDJfkIHeO
	 nFAdAYOy0Cs5g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-598efcf3a89so1023049e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 02:11:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXE+ebgG5IYsmPsIjTykUUs/u9yXqcUxs3nKxL6svnldHaf4ypQLF78NRpnN0x9JlPmg+8rLP+whDT4@vger.kernel.org
X-Gm-Message-State: AOJu0YziLT+jzwvireWM+nIBmnBgsYYMlfWU9mZc4m524WUmkRf2O7zH
	huWEXTNV/7UU1KKAPMGRW4xkoc10/7aifqfjli5O4+k4HdpH3e46X0qNH8MEv9E1dfqCxfqeDa2
	3DLS23sMnr1f5sKP6Z7QTADhglPqowfnL6H70FkEhLw==
X-Google-Smtp-Source: AGHT+IGgQcDDVx5CV5iALdJF8BCtSi9/N1Hvmh5TeNsn50J9aXMOA2he1DDvPHJXZouFGJPTLM1rhMNOTARniy28pOQ=
X-Received: by 2002:a05:6512:3e01:b0:598:f262:15ec with SMTP id
 2adb3069b0e04-598faa8083bmr601324e87.26.1765534273448; Fri, 12 Dec 2025
 02:11:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Dec 2025 02:11:11 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Dec 2025 02:11:11 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com> <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
Date: Fri, 12 Dec 2025 02:11:11 -0800
X-Gmail-Original-Message-ID: <CAMRc=McSHcYfz2L-jeJa9Dnb=fp8ACRAwNtDJmHEMQ3b+BOd+A@mail.gmail.com>
X-Gm-Features: AQt7F2oPhStXk_-W99l7ac0r049RG0GE-tK9DybvagfZd3dPy0ulff7h6NWizGs
Message-ID: <CAMRc=McSHcYfz2L-jeJa9Dnb=fp8ACRAwNtDJmHEMQ3b+BOd+A@mail.gmail.com>
Subject: Re: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Dec 2025 08:41:09 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add GPIO driver for the Aaeon SRG-IMX8PL embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  drivers/gpio/Kconfig          |  10 ++
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-aaeon-mcu.c | 248 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 259 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c74da29253e810b51540684b1186e8f274066b69..7e0f675b664fa25243fc2802e=
dc3380572c94c41 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
>  	    8 bits:	74244 (Input), 74273 (Output)
>  	    16 bits:	741624 (Input), 7416374 (Output)
>
> +config GPIO_AAEON_MCU
> +	tristate "Aaeon MCU GPIO support"
> +	depends on MFD_AAEON_MCU && OF_GPIO

You don't need OF_GPIO, please drop it.

> +	select GPIO_GENERIC
> +	help
> +	  Select this option to enable GPIO support for the Aaeon SRG-IMX8PL
> +	  onboard MCU. This driver provides access to GPIO pins and GPO
> +	  (General Purpose Output) pins controlled by the microcontroller.
> +	  The driver handles both input and output configuration.
> +
>  config GPIO_ALTERA
>  	tristate "Altera GPIO"
>  	select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2421a8fd3733e0b06c2581262aaa9cd629f66c7d..1ba6318bc558743fbe5910966=
c2c8fc3f792efe9 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+=3D gpio-104-idi-48.o
>  obj-$(CONFIG_GPIO_104_IDIO_16)		+=3D gpio-104-idio-16.o
>  obj-$(CONFIG_GPIO_74X164)		+=3D gpio-74x164.o
>  obj-$(CONFIG_GPIO_74XX_MMIO)		+=3D gpio-74xx-mmio.o
> +obj-$(CONFIG_GPIO_AAEON_MCU)		+=3D gpio-aaeon-mcu.o
>  obj-$(CONFIG_GPIO_ADNP)			+=3D gpio-adnp.o
>  obj-$(CONFIG_GPIO_ADP5520)		+=3D gpio-adp5520.o
>  obj-$(CONFIG_GPIO_ADP5585)		+=3D gpio-adp5585.o
> diff --git a/drivers/gpio/gpio-aaeon-mcu.c b/drivers/gpio/gpio-aaeon-mcu.=
c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cebd17d1877147b987ea673b0=
81334c8062f5fc0
> --- /dev/null
> +++ b/drivers/gpio/gpio-aaeon-mcu.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU GPIO driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

You need more headers than that. At least device.h for devm_kzalloc(),
mod_devicetable.h, bitops.h and probably some more.

> +
> +#define AAEON_MCU_CONFIG_GPIO_INPUT 0x69
> +#define AAEON_MCU_CONFIG_GPIO_OUTPUT 0x6F
> +#define AAEON_MCU_READ_GPIO 0x72
> +#define AAEON_MCU_WRITE_GPIO 0x77
> +
> +#define AAEON_MCU_CONTROL_GPO 0x6C
> +
> +#define MAX_GPIOS 12
> +#define MAX_GPOS 7
> +
> +struct aaeon_mcu_gpio {
> +	struct gpio_chip gc;
> +	struct aaeon_mcu_dev *mfd;
> +	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
> +	DECLARE_BITMAP(gpo_state, MAX_GPOS);
> +};
> +
> +static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
> +					    unsigned int offset)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_CONFIG_GPIO_INPUT;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_direction_input(struct gpio_chip *gc, unsigned=
 int offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset < MAX_GPOS) {
> +		dev_err(gc->parent, "GPIO offset (%d) must be an output GPO\n", offset=
);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret =3D aaeon_mcu_gpio_config_input_cmd(data, offset);
> +	if (ret < 0)
> +		return ret;
> +
> +	set_bit(offset, data->dir_in);
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
> +					     unsigned int offset,
> +					     int value)
> +{
> +	u8 cmd[3], rsp;
> +	int ret;
> +
> +	cmd[0] =3D AAEON_MCU_CONFIG_GPIO_OUTPUT;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	ret =3D aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	cmd[0] =3D AAEON_MCU_WRITE_GPIO;
> +	/* cmd[1] =3D offset - 7; */
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_direction_output(struct gpio_chip *gc, unsigne=
d int offset, int value)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset < MAX_GPOS)
> +		return 0;
> +
> +	ret =3D aaeon_mcu_gpio_config_output_cmd(data, offset, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	clear_bit(offset, data->dir_in);
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_gpio_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +
> +	return test_bit(offset, data->dir_in) ?
> +		GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int aaeon_mcu_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	u8 cmd[3], rsp;
> +	int ret;
> +
> +	if (offset < MAX_GPOS)
> +		return test_bit(offset, data->gpo_state);

Are you sure the bit ops in this driver need to be atomic?

> +
> +	cmd[0] =3D AAEON_MCU_READ_GPIO;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	ret =3D aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return rsp;
> +}
> +
> +static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned i=
nt offset, int value)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_CONTROL_GPO;
> +	cmd[1] =3D offset + 1;
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned =
int offset, int value)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_WRITE_GPIO;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			      int value)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +
> +	if (offset < MAX_GPOS) {
> +		if (aaeon_mcu_gpo_set_cmd(data, offset, value) =3D=3D 0)
> +			assign_bit(offset, data->gpo_state, value);
> +	} else {
> +		return aaeon_mcu_gpio_set_cmd(data, offset, value);
> +	}
> +	return 0;


It would be much cleaner if you did it like:

	if (offset >=3D MAX_GPOS)
		return aaeon_mcu_gpio_set_cmd(data, offset, value);

	if (aaeon_mcu_gpo_set_cmd(data, offset, value) =3D=3D 0)
		assign_bit(offset, data->gpo_state, value);

	return 0;

> +}
> +
> +static const struct gpio_chip aaeon_mcu_chip =3D {
> +	.label			=3D "gpio-aaeon-mcu",
> +	.owner			=3D THIS_MODULE,
> +	.get_direction		=3D aaeon_mcu_gpio_get_direction,
> +	.direction_input	=3D aaeon_mcu_gpio_direction_input,
> +	.direction_output	=3D aaeon_mcu_gpio_direction_output,
> +	.get			=3D aaeon_mcu_gpio_get,
> +	.set			=3D aaeon_mcu_gpio_set,
> +	.base			=3D -1,
> +	.ngpio			=3D MAX_GPOS + MAX_GPIOS,
> +	.can_sleep		=3D true,
> +};

There's no point in keeping it in memory if you copy it into data->gc anywa=
y.
Use compound literals in aaeon_mcu_gpio_probe() if you want to initialize
members explicitly.

> +
> +static void aaeon_mcu_gpio_reset(struct aaeon_mcu_gpio *data, struct dev=
ice *dev)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	/* Reset all GPOs */
> +	for (i =3D 0; i < MAX_GPOS; i++) {
> +		ret =3D aaeon_mcu_gpo_set_cmd(data, i, 0);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to reset GPO %u state: %d\n", i, ret);
> +		clear_bit(i, data->dir_in);
> +	}
> +
> +	/* Reset all GPIOs */
> +	for (i =3D MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
> +		ret =3D aaeon_mcu_gpio_config_input_cmd(data, i);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
> +		set_bit(i, data->dir_in);
> +	}
> +}
> +
> +static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
> +{
> +	struct aaeon_mcu_dev *mfd =3D dev_get_drvdata(pdev->dev.parent);
> +	struct aaeon_mcu_gpio *data;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->mfd =3D mfd;

It looks like all you need is the i2c_client, maybe just store its address =
and
avoid constant dereferencing.

> +	data->gc =3D aaeon_mcu_chip;
> +	data->gc.parent =3D &pdev->dev;
> +
> +	/*
> +	 * Reset all GPIO states to a known configuration. The MCU does not
> +	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
> +	 * Without this reset, GPIOs would retain their previous state across
> +	 * reboots, which could lead to unexpected behavior.
> +	 */
> +	aaeon_mcu_gpio_reset(data, &pdev->dev);
> +
> +	platform_set_drvdata(pdev, data);

Where is the corresponding call to platform_get_drvdata()?

> +
> +	return devm_gpiochip_add_data(&pdev->dev, &data->gc,
> +				      data);
> +}
> +
> +static const struct of_device_id aaeon_mcu_gpio_of_match[] =3D {
> +	{ .compatible =3D "aaeon,srg-imx8pl-gpio" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_gpio_of_match);
> +
> +static struct platform_driver aaeon_mcu_gpio_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon-mcu-gpio",
> +		.of_match_table =3D aaeon_mcu_gpio_of_match,
> +	},
> +	.probe =3D aaeon_mcu_gpio_probe,
> +};
> +
> +module_platform_driver(aaeon_mcu_gpio_driver);
> +
> +MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautherbes <jeremie.dautheribes@bootlin=
.com>");
> +MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

Bart

