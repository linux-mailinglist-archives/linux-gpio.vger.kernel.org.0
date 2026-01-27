Return-Path: <linux-gpio+bounces-31142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEa6HS6MeGmqqwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:58:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF169238A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49C72300E1A6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAFC3358AD;
	Tue, 27 Jan 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0+7sslX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E134335547
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507659; cv=none; b=WP06GC/LOo1BbsJZMdOnqiAUBkmn4NFM+4yynp2oneu06HHjIKm7cTOjPNmgfaQyYY3Aye7sbyrBMr4GEZiHmicWteFVy6M+OCXSXvMcbp2Eaw6wEs6CYTVqmMJdsAelwu+B970MsW1HFNnJ/be8BsdeA2YW+CXdw4yDId5ymgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507659; c=relaxed/simple;
	bh=q3on6zXQlBcRn83TcC1mwoIQdTfMogS1m+JCEdUOHdg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Llp1CxWixXLemFZ4L7Pqo37UWNVJChNtbJMvB7ZBWF19RM4vjrfl92ohe6A1nnfWZao2obsfJT0zP4QpfzI8wJ7h9k4QZY2TsUBb8Y3QpDz+GGCjYxGt9pns/OZtyoQCV4RRvsT1R8+dT0xMKmh/sPKNCwPJFkZ/ZPQM9sQoItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0+7sslX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0BC4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507659;
	bh=q3on6zXQlBcRn83TcC1mwoIQdTfMogS1m+JCEdUOHdg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Y0+7sslXPA4UMdogs5ANhTkrlJaPLfmFM1izAhTvIv7O0yDYW9K5B4MW4skmVHQIM
	 Oh/IrSuMorP1ANOssCPD46vcKK9k5KEC2JLfiklINjsnaQ4aa8o+kGzJ9Uivim+eyh
	 OKkTeE0vM4Ze8C6cA7WVzZjWOuO6+Bm18x+cjhP05M+77TSiz+p/GOmPn5z3v7mXsl
	 L8X18UdR5y0loIqxFMwfg25Emg+NomFWuTBltoNFyi6AK/WVCBXDU8YO2i4LPgR8bF
	 SCMDZbuL7DZwjoyxIprz55mjRIrXl2xEGLpMn53/3T+w6mJNLFakGCQyVuUCEJ0Ni6
	 M7DfKlxuT8S9w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so5673654e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:54:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUADZmpswZdOvJl0qw+uvYFkrcM/PgzArHD5HEvFaCKwatmtlhzTsUCF5u9NDg2Bc9CRPkEH43RoWDB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp45KaWn1uVhfOvkvReyz/grDa8MYoDvprKh69QbKo6HUYAN+E
	/7NRHAhR9Lf6CdLTdPM/ZZi588jPo/+6nI2cS95jE6o7Fpo2jKAeAgvxJBzPvyaFsef96/+qAPL
	whswFo3F38KpaybYn8dcm5hGwAeb1ryUxvj2pxG8neQ==
X-Received: by 2002:ac2:4f07:0:b0:59d:e350:3c45 with SMTP id
 2adb3069b0e04-59e0412c85dmr497277e87.52.1769507657517; Tue, 27 Jan 2026
 01:54:17 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:54:15 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:54:15 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com> <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
Date: Tue, 27 Jan 2026 01:54:15 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mf_=PY6QL8fA7v0GQPA-m6dEfyPYv9pm84_z_EF5Yewbw@mail.gmail.com>
X-Gm-Features: AZwV_Qj8CKcS1FFb3PqQsuTgXOVMPEaGS00ey8cIdqqL78URlgFTGWvnaXxD5qA
Message-ID: <CAMRc=Mf_=PY6QL8fA7v0GQPA-m6dEfyPYv9pm84_z_EF5Yewbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31142-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AF169238A
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 10:54:33 +0100, "Thomas Perrot (Schneider
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
>  MAINTAINERS                   |   1 +
>  drivers/gpio/Kconfig          |  10 ++
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-aaeon-mcu.c | 238 ++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 250 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 175c1e1b28b8151580ed340207d4a6fd59aa8853..28dd964cdf69bdcaec3eb82d6=
df851a2bad47415 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,7 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
> +F:	drivers/gpio/gpio-aaeon-mcu.c
>  F:	drivers/mfd/aaeon-mcu.c
>  F:	include/linux/mfd/aaeon-mcu.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c74da29253e810b51540684b1186e8f274066b69..6142d50b92b3d8c1fac8b0d81=
397dc22428fbb51 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
>  	    8 bits:	74244 (Input), 74273 (Output)
>  	    16 bits:	741624 (Input), 7416374 (Output)
>
> +config GPIO_AAEON_MCU
> +	tristate "Aaeon MCU GPIO support"
> +	depends on MFD_AAEON_MCU

Can you add support for COMPILE_TEST here and in the MFD part?

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
> index 0000000000000000000000000000000000000000..533eaf3e7f82f3b9e3f50a1a6=
31c8e853adc1226
> --- /dev/null
> +++ b/drivers/gpio/gpio-aaeon-mcu.c
> @@ -0,0 +1,238 @@
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
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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
> +	struct device *dev;
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
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
> +	__set_bit(offset, data->dir_in);
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
> +	ret =3D aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	cmd[0] =3D AAEON_MCU_WRITE_GPIO;
> +	/* cmd[1] =3D offset - 7; */
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
> +	__clear_bit(offset, data->dir_in);
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
> +
> +	cmd[0] =3D AAEON_MCU_READ_GPIO;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	ret =3D aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
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
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			      int value)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +
> +	if (offset >=3D MAX_GPOS)
> +		return aaeon_mcu_gpio_set_cmd(data, offset, value);
> +
> +	if (aaeon_mcu_gpo_set_cmd(data, offset, value) =3D=3D 0)
> +		__assign_bit(offset, data->gpo_state, value);
> +
> +	return 0;
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
> +		__clear_bit(i, data->dir_in);
> +	}
> +
> +	/* Reset all GPIOs */
> +	for (i =3D MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
> +		ret =3D aaeon_mcu_gpio_config_input_cmd(data, i);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
> +		__set_bit(i, data->dir_in);
> +	}
> +}
> +
> +static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
> +{
> +	struct aaeon_mcu_gpio *data;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D pdev->dev.parent;
> +	data->gc =3D aaeon_mcu_chip;
> +	data->gc.parent =3D data->dev;
> +
> +	/*
> +	 * Reset all GPIO states to a known configuration. The MCU does not
> +	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
> +	 * Without this reset, GPIOs would retain their previous state across
> +	 * reboots, which could lead to unexpected behavior.
> +	 */
> +	aaeon_mcu_gpio_reset(data, &pdev->dev);
> +
> +	return devm_gpiochip_add_data(&pdev->dev, &data->gc, data);
> +}
> +
> +static struct platform_driver aaeon_mcu_gpio_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon-mcu-gpio",
> +	},
> +	.probe =3D aaeon_mcu_gpio_probe,
> +};
> +

Drop the newline.

> +module_platform_driver(aaeon_mcu_gpio_driver);
> +
> +MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

Looks pretty good, just some nits.

Bartosz

