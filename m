Return-Path: <linux-gpio+bounces-27961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D553AC2B459
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 12:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4FAC4EF422
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F721301704;
	Mon,  3 Nov 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6209kcr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17594287505
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762168691; cv=none; b=QAGNrzPfBa0igE/+xszlLWlbFbA8mIvIpMm+v+sEf1NcpHDYi0DWRQs6+T6p12LLjJHmjKkYXnFRWfYSFsn8Ac4xsEE/iGj1vaQTyDajdgrIK1hNVdQztPmQ6Pvo5AsIxEQGhai0eFCu0xPGAe90kH5Kjnl5Cz2TRnfrCYDWWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762168691; c=relaxed/simple;
	bh=60lDMBL2oNpdxDCfZ/zaAoqSFSwNxdJ9b1c9SZ6HPGc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKgjFY+rInzc/hnn0Cu7D6wV9M6NyG0xlNfE3chW22bRXTUJiJBaxV1CMpnNfQWez4cVbyhYZp5BA+oHBDGXfj3KJ0g2LKObgUrAnqeiIaRccM5VVMyqBq7j+Vy0i4EaEW9yYS2or4bUAM+euDWt68h0bah6JlHQCacFZcawN9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6209kcr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso48196705e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 03:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168687; x=1762773487; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6G1U+3shNA1F9Kl+gGDGcY4sTpab/foYa+z2DPImsw=;
        b=X6209kcr5D55B9vEUyNCd+qG2YGOfxR7ZUdl+d9J6fsrtDNNpJw5vG+OophBv0kAvG
         aKPBx4e2Oo0VkVbgGyS5SBIs/BdJ+143XkMpBdxyae2hKpmtcF2On0AFOv/L3QF09rMT
         ROars0OFJIteG7kju2RZV3j0vXT8aAEDq6eX7NoPCLChBMcwFgCkvozgWGoKUxt8NYNc
         xZ2Psiceu+kYfWUpKSXvI1aVNe27TwPXfBRscaxWzUGz6SUXQ8TJgSrUaNPWLOHTNXFM
         UCKwzeIwvCescPx0s1bnJaJUinTEEO7XCZFfQpJ/oZarJqmiUjKCJgUdc0apRJIIOKtg
         HBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168687; x=1762773487;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6G1U+3shNA1F9Kl+gGDGcY4sTpab/foYa+z2DPImsw=;
        b=jXR+ZL7B5M+990wJiE9nFEVUzk4HWj5To5xXikCCKeRQ99SqVeB+z/jCJDef4sdfLh
         AQJB5hyKbp17LVVV6YCbC6zQYqbLWdMCijTsBOQzM1En3WvyiL5KWSEmdzCU2Q79RXMM
         +TYX/RlpEYzl9slmWNzXWWBEU0QGH9K4WMLhLK+WVeSJwX+XDVf+IuttSyHi8c2ou4Oj
         4/Okz9sDMadzSjr3MF2MocyZu3qKwGIFyp5uVQVymN2p1O1MKzJuAmdgV+lbORTvflmv
         49OTvnIf2G41a3A0fEzxF4ctdLnIczQkKtbi23KhBgxxVTT6baughEiw2BwyaquhBoVM
         7tbA==
X-Forwarded-Encrypted: i=1; AJvYcCVj8yzKT+cSKrK4DE3znOruoiXlHWQUIWG+0PWjX0wynx8Sy+RuD5t0ZvFNSkpouzyF0c1ioBVlxoTb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQk7PmKXGwXuKZENbbf4L+k3UDsIhsSBUxP7dnjVby8FJoXSwo
	Ol0/zQxanfUkkcSrdcpVffbQqtYicD3GAn8hUplLg+YDNGAckyozotQr
X-Gm-Gg: ASbGnctba05/xPWq0/psCGbCXI8M/pf0R269ORMDuybGU2wz2rRvnGE+1iCa8BtMdk5
	7L854TUYVBsE8c0Fb3a3tuIWpUU2uNhhAJ6PwC/34UruOLnigOSQVSx4agtnz1sEDfgUYNoGUvY
	Fz/zzwLKuCR6aDchZCwe7L1+WjleDmQzNVElYZE95eK4NB9VOwTGGuIaQkUQj8q9msITLQX5D6a
	d4OVwo/+l4DlonIVQ1UzL+3etTlfZzzPkM/SWjn0iNinkldsniA5+ptGiLIKumpjKeCrOQjjSi2
	31xcoD48zdNqVY2GAbiVZHri7Abm+9r6A5LxNO+LsWLKyA+O0EnorcooP/eQJQxm/PzQ239PwUc
	+Q18VcMf4+jONTrukQqRfjjz3EmKvzay1d585TNmQYeTdK8n+vMNFGmW7Gb5QKLDiBmdlG2UMxB
	UkjxH78RwWogs1/yIXMME=
X-Google-Smtp-Source: AGHT+IH6i0PkBRAZb8K1KRO55KHAWOtXj4yQJQGAO0NKO2FQdbsbSicqPiEU9u6kw13j3FaaQD7dzg==
X-Received: by 2002:a05:600d:4393:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-477331db3ccmr69867085e9.3.1762168687127;
        Mon, 03 Nov 2025 03:18:07 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c583d91sm150548485e9.17.2025.11.03.03.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:18:06 -0800 (PST)
Message-ID: <a1577c7ce81d039f47e189e130295b76447b05c2.camel@gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, Linus Walleij	
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 03 Nov 2025 11:18:42 +0000
In-Reply-To: <20251031160710.13343-3-antoniu.miclaus@analog.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
	 <20251031160710.13343-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-31 at 16:07 +0000, Antoniu Miclaus wrote:
> Add driver support for the ADG1712, which contains four independent
> single-pole/single-throw (SPST) switches and operates with a
> low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> dual supply range from =C2=B11.08V to =C2=B12.75V.
>=20
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> =C2=A0drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 9 +++
> =C2=A0drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> =C2=A0drivers/gpio/gpio-adg1712.c | 146 +++++++++++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 156 insertions(+)
> =C2=A0create mode 100644 drivers/gpio/gpio-adg1712.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7ee3afbc2b05..3fac05823eae 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -157,6 +157,15 @@ config GPIO_74XX_MMIO
> =C2=A0	=C2=A0=C2=A0=C2=A0 8 bits:	74244 (Input), 74273 (Output)
> =C2=A0	=C2=A0=C2=A0=C2=A0 16 bits:	741624 (Input), 7416374 (Output)
> =C2=A0
> +config GPIO_ADG1712
> +	tristate "Analog Devices ADG1712 quad SPST switch GPIO driver"
> +	depends on GPIOLIB
> +	help
> +	=C2=A0 GPIO driver for Analog Devices ADG1712 quad single-pole,
> +	=C2=A0 single-throw (SPST) switch. The driver provides a GPIO controlle=
r
> +	=C2=A0 interface where each GPIO line controls one of the four independ=
ent
> +	=C2=A0 analog switches on the ADG1712.
> +
> =C2=A0config GPIO_ALTERA
> =C2=A0	tristate "Altera GPIO"
> =C2=A0	select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ec296fa14bfd..9043d2d07a15 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+=3D gpio-104-idi-48.o
> =C2=A0obj-$(CONFIG_GPIO_104_IDIO_16)		+=3D gpio-104-idio-16.o
> =C2=A0obj-$(CONFIG_GPIO_74X164)		+=3D gpio-74x164.o
> =C2=A0obj-$(CONFIG_GPIO_74XX_MMIO)		+=3D gpio-74xx-mmio.o
> +obj-$(CONFIG_GPIO_ADG1712)		+=3D gpio-adg1712.o
> =C2=A0obj-$(CONFIG_GPIO_ADNP)			+=3D gpio-adnp.o
> =C2=A0obj-$(CONFIG_GPIO_ADP5520)		+=3D gpio-adp5520.o
> =C2=A0obj-$(CONFIG_GPIO_ADP5585)		+=3D gpio-adp5585.o
> diff --git a/drivers/gpio/gpio-adg1712.c b/drivers/gpio/gpio-adg1712.c
> new file mode 100644
> index 000000000000..f8d3481ac9d0
> --- /dev/null
> +++ b/drivers/gpio/gpio-adg1712.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices ADG1712 quad SPST switch GPIO driver
> + *
> + * Copyright 2025 Analog Devices Inc.
> + *
> + * Author: Antoniu Miclaus <antoniu.miclaus@analog.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#define ADG1712_NUM_GPIOS	4
> +
> +struct adg1712 {
> +	struct gpio_chip chip;
> +	struct gpio_desc *switch_gpios[ADG1712_NUM_GPIOS];
> +};
> +
> +static int adg1712_get_direction(struct gpio_chip *chip, unsigned int of=
fset)
> +{
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int adg1712_direction_input(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +	return -EINVAL;
> +}

Did not checked gpiolib for this but do we need the above given that we alw=
ays
return GPIO_LINE_DIRECTION_OUT?

> +
> +static int adg1712_direction_output(struct gpio_chip *chip, unsigned int=
 offset,
> +				=C2=A0=C2=A0=C2=A0 int value)
> +{
> +	struct adg1712 *adg1712 =3D gpiochip_get_data(chip);
> +
> +	if (offset >=3D ADG1712_NUM_GPIOS)
> +		return -EINVAL;

I don't think above can happen.

> +
> +	gpiod_set_value_cansleep(adg1712->switch_gpios[offset], value);

return gpiod_set_value_cansleep().

> +	return 0;
> +}
> +
> +static int adg1712_set(struct gpio_chip *chip, unsigned int offset, int =
value)
> +{
> +	struct adg1712 *adg1712 =3D gpiochip_get_data(chip);
> +
> +	if (offset >=3D ADG1712_NUM_GPIOS)
> +		return -EINVAL;

Ditto

> +
> +	gpiod_set_value_cansleep(adg1712->switch_gpios[offset], value);
> +	return 0;
> +}
> +
> +static int adg1712_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct adg1712 *adg1712 =3D gpiochip_get_data(chip);
> +
> +	if (offset >=3D ADG1712_NUM_GPIOS)
> +		return -EINVAL;
> +
> +	return gpiod_get_value_cansleep(adg1712->switch_gpios[offset]);
> +}
> +
> +static int adg1712_set_multiple(struct gpio_chip *chip, unsigned long *m=
ask,
> +				 unsigned long *bits)
> +{
> +	struct adg1712 *adg1712 =3D gpiochip_get_data(chip);
> +	int i;
> +
> +	for_each_set_bit(i, mask, ADG1712_NUM_GPIOS) {
> +		gpiod_set_value_cansleep(adg1712->switch_gpios[i],
> +					 test_bit(i, bits));

Error handling.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct gpio_chip adg1712_gpio_chip =3D {
> +	.label			=3D "adg1712",
> +	.owner			=3D THIS_MODULE,
> +	.get_direction		=3D adg1712_get_direction,
> +	.direction_input	=3D adg1712_direction_input,
> +	.direction_output	=3D adg1712_direction_output,
> +	.get			=3D adg1712_get,
> +	.set			=3D adg1712_set,
> +	.set_multiple		=3D adg1712_set_multiple,
> +	.base			=3D -1,
> +	.ngpio			=3D ADG1712_NUM_GPIOS,
> +	.can_sleep		=3D true,
> +};
> +
> +static int adg1712_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct adg1712 *adg1712;
> +	int ret, i;
> +	char gpio_name[16];
> +
> +	adg1712 =3D devm_kzalloc(dev, sizeof(*adg1712), GFP_KERNEL);
> +	if (!adg1712)
> +		return -ENOMEM;
> +
> +	adg1712->chip =3D adg1712_gpio_chip;
> +	adg1712->chip.parent =3D dev;
> +
> +	for (i =3D 0; i < ADG1712_NUM_GPIOS; i++) {
> +		snprintf(gpio_name, sizeof(gpio_name), "switch%d", i + 1);

Just a suggestion. Instead of the snprintf(), you could have a const array =
of
strings and just go over it. Not a big deal to me though. You could also
consider devm_gpiod_get_array()

> +		adg1712->switch_gpios[i] =3D devm_gpiod_get(dev, gpio_name,
> +							=C2=A0 GPIOD_OUT_LOW);

Should we make assumptions on the initial value? Not sure if GPIO_ASIS woul=
d
make sense here.

> +		if (IS_ERR(adg1712->switch_gpios[i]))
> +			return dev_err_probe(dev, PTR_ERR(adg1712->switch_gpios[i]),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get %s gpio\n", gpio_name);
> +	}
> +
> +	ret =3D devm_gpiochip_add_data(dev, &adg1712->chip, adg1712);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
> +
> +	dev_info(dev, "ADG1712 %u-GPIO expander registered\n",
> +		 adg1712->chip.ngpio);

Drop the above or turn it into dev_dbg()

- Nuno S=C3=A1
>=20

