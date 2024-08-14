Return-Path: <linux-gpio+bounces-8747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 254BE951778
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 11:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93CFC1F22E32
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 09:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4691448ED;
	Wed, 14 Aug 2024 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pUqcu21W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E3143C50
	for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2024 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723627015; cv=none; b=W2gpmvVhaw5BqjtqqPHwAtJcyPteHyzs13+bGWRlgI7X5Ca4KWeJfnPxOF5t7OnFyGPIHjkKzLdR3FzgsYAn3P/hSVPSFPF5OiMvC/fH8+KCiw3444N+hAftfMvfPZ+1oyPlI7ey6FTHeK+oQ/qf5PcwpdQiYGDQ4WXUfvwBLAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723627015; c=relaxed/simple;
	bh=PZE/Rt9xs974mwZejqQUGxJHXzN/WzAHYJGpQWuS1s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2+8IMz5pHhs2qWFyPsY80bx0IoXrB9vRKzmc7I2aqP8bedjch2vhnHE74LZFR+R1vk9JcnPNbCGzaokzA6OxZNZZ45VvRMY0FN0xp4/G9HAMueXP5WrpOGfAEBM+Fd5ApSP0I75BcX3jkAHiIkmzjKxTyh69C6uX2FBNwJ7pLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pUqcu21W; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efdf02d13so10464650e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2024 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723627011; x=1724231811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxC7kdybifVhUqn7ncALrAjg97mdQ2TxZUkRfH1PSjI=;
        b=pUqcu21W/XnqVcYu053rQwQzencrCf9f4ik6uBqz8SM0P5CC+E2oHiIUrfVyqxCr5D
         +QQBt8FJHvgwKOnwtJt+V2ZokkbyVsuPnJGhRdLJOhgn22g4zwQMGgJN5a0gzZm8YVxj
         ewJf+vtxpNUjDNRqYfw/aOoLStDzSuvR6nuvqltogkEQxBLT+QNYU2t4R6+10RJ8G4Bc
         8UG6yROEtgu8GoI2vLljNG4VB3Dv2s561/x3qR5UwhEeYm6XMtBv1vjB7xiGIr6QTBXO
         gl7bCUfix+2N/fKPY/7LSSWb8T5QN/fjE7sI4VyTUE4UzDcJySSLTiWSrj5dNi4523OX
         o10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723627011; x=1724231811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxC7kdybifVhUqn7ncALrAjg97mdQ2TxZUkRfH1PSjI=;
        b=oXTucmVcvxwarKRSy4CneTYC/emJQxLDFfdIVXBY7LNUE2E0VvTynQy3O94zu1U8wg
         Oa4AiVBn2qcDc4txnRUPk8K+jm/GcnOqc8EA/FC5OroNfP5yRGG5etrAP2MyOrNe4zkG
         fYvBXjBb7gfAqTugDG8AwA3k4nXnsUROb7nIIfaIhowucs639n75rGRd6WuTtDRm41Wt
         o7Pm3wLnY5dIHG5mUlC76whEMFIRkiinxDC9X5ZaDLJ84aCQZkoxGYzlj9/ByHebfO3Z
         +Ft4FQ95+UGXMRUhmX6TN/vXgTWNVBWCaHcy+3gDVRkHnrKTZkJbzmgqyr//3B3HMD7s
         9Jug==
X-Forwarded-Encrypted: i=1; AJvYcCVAMTr0WfS4lRboLgmMCMJkmH5V89pcFAXv18g+YI9RAjcIGVagbt0GZ9BQ+/YSoScJZdR8xRrRWsdLQtdTacnMzdje8+s1Wv2Odg==
X-Gm-Message-State: AOJu0YxlzFbXTb39Ct6KDn6srpW7H9FlKJoiV0nbUaz2gMmeGlo6e/LS
	ruCqlMg6nSC4wPbntD5Jzgs12ZXid+PgIEBSZ2jOaxGIKWSl7lQPw420E9iXlTLMA7L1z2qbHml
	9whQoRtTWfFHGjWuv9qGMRl+9CQiKPDI02wFVk/xJVfduKKrqiSA=
X-Google-Smtp-Source: AGHT+IFIsCffTyQseLNzVA8LUwSI98USyjdTuG0s4gY7q6vJflHoozaE+P1rkDLdW8Y+JLjetsoEnQsdUxhwHjoBOaM=
X-Received: by 2002:a05:6512:104a:b0:52c:9877:71b7 with SMTP id
 2adb3069b0e04-532edbd19f5mr1703786e87.59.1723627010847; Wed, 14 Aug 2024
 02:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com> <20240503-congatec-board-controller-v1-2-fec5236270e7@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v1-2-fec5236270e7@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Aug 2024 11:16:39 +0200
Message-ID: <CAMRc=MeC4q3BGxycxnOZCC8nD7p=8AO9rQasb5Gd4T1E+aKvHA@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: Congatec Board Controller gpio driver
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 4:52=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add gpio support for the Congatec Board Controller.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/gpio/Kconfig     |  10 +++
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-cgbc.c | 203 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 214 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 58f43bcced7c..ce77bad40087 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -233,6 +233,16 @@ config GPIO_CADENCE
>         help
>           Say yes here to enable support for Cadence GPIO controller.
>
> +config GPIO_CGBC
> +       tristate "Congatec Board Controller GPIO support"
> +       depends on MFD_CGBC
> +       help
> +         Select this option to enable GPIO support for the Congatec Boar=
d
> +         Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called gpio-cgbc.
> +
>  config GPIO_CLPS711X
>         tristate "CLPS711X GPIO support"
>         depends on ARCH_CLPS711X || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 64dd6d9d730d..3a96e3c27a2d 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)          +=3D gpio-bd9571m=
wv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)             +=3D gpio-brcmstb.o
>  obj-$(CONFIG_GPIO_BT8XX)               +=3D gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CADENCE)             +=3D gpio-cadence.o
> +obj-$(CONFIG_GPIO_CGBC)                        +=3D gpio-cgbc.o
>  obj-$(CONFIG_GPIO_CLPS711X)            +=3D gpio-clps711x.o
>  obj-$(CONFIG_GPIO_SNPS_CREG)           +=3D gpio-creg-snps.o
>  obj-$(CONFIG_GPIO_CROS_EC)             +=3D gpio-cros-ec.o
> diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
> new file mode 100644
> index 000000000000..6da50c794872
> --- /dev/null
> +++ b/drivers/gpio/gpio-cgbc.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Congatec Board Controller GPIO driver
> + *
> + * Copyright (C) 2024 Bootlin
> + * Author: Thomas Richard <thomas.richard@bootlin.com>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/cgbc.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#define CGBC_GPIO_NGPIO        14
> +
> +#define CGBC_GPIO_CMD_GET      0x64
> +#define CGBC_GPIO_CMD_SET      0x65
> +#define CGBC_GPIO_CMD_DIR_GET  0x66
> +#define CGBC_GPIO_CMD_DIR_SET  0x67
> +
> +struct cgbc_gpio_data {
> +       struct gpio_chip        chip;
> +       struct cgbc_device_data *cgbc;
> +       struct mutex lock;
> +};
> +
> +static int cgbc_gpio_cmd(struct cgbc_device_data *cgbc,
> +                        u8 cmd0, u8 cmd1, u8 cmd2, u8 *value)
> +{
> +       u8 cmd[3] =3D {cmd0, cmd1, cmd2};
> +
> +       return cgbc_command(cgbc, cmd, sizeof(cmd), value, 1, NULL);
> +}
> +
> +static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       int ret;
> +       u8 val;
> +

Can you use scoped_guard() here and elsewhere?

> +       mutex_lock(&gpio->lock);
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 :=
 0, 0, &val);
> +
> +       mutex_unlock(&gpio->lock);
> +
> +       offset %=3D 8;
> +
> +       if (ret)
> +               return ret;
> +       else
> +               return (int)(val & (u8)BIT(offset));
> +}
> +
> +static void __cgbc_gpio_set(struct gpio_chip *chip,
> +                           unsigned int offset, int value)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       u8 val;
> +       int ret;
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 :=
 0, 0, &val);
> +       if (ret)
> +               return;
> +
> +       if (value)
> +               val |=3D BIT(offset % 8);
> +       else
> +               val &=3D ~((u8)BIT(offset % 8));
> +
> +       cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val,=
 &val);
> +}
> +
> +static void cgbc_gpio_set(struct gpio_chip *chip,
> +                         unsigned int offset, int value)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +
> +       mutex_lock(&gpio->lock);
> +       __cgbc_gpio_set(chip, offset, value);
> +       mutex_unlock(&gpio->lock);
> +}
> +
> +static int cgbc_gpio_direction_set(struct gpio_chip *chip,
> +                                  unsigned int offset, int direction)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       int ret;
> +       u8 val;
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_GET, (offset > 7) ?=
 1 : 0, 0, &val);
> +       if (ret)
> +               goto end;
> +
> +       if (direction =3D=3D GPIO_LINE_DIRECTION_IN)
> +               val &=3D ~((u8)BIT(offset % 8));
> +       else
> +               val |=3D BIT(offset % 8);
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_SET, (offset > 7) ?=
 1 : 0, val, &val);
> +
> +end:
> +       return ret;
> +}
> +
> +static int cgbc_gpio_direction_input(struct gpio_chip *chip,
> +                                    unsigned int offset)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       int ret;
> +
> +       mutex_lock(&gpio->lock);
> +       ret =3D cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION=
_IN);
> +       mutex_unlock(&gpio->lock);
> +
> +       return ret;
> +}
> +
> +static int cgbc_gpio_direction_output(struct gpio_chip *chip,
> +                                     unsigned int offset, int value)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       int ret;
> +
> +       mutex_lock(&gpio->lock);
> +       __cgbc_gpio_set(chip, offset, value);
> +       ret =3D cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION=
_OUT);
> +       mutex_unlock(&gpio->lock);
> +
> +       return ret;
> +}
> +
> +static int cgbc_gpio_get_direction(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       int ret;
> +       u8 val;
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_GET, (offset > 7) ?=
 1 : 0, 0, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BIT(offset % 8))
> +               return GPIO_LINE_DIRECTION_OUT;
> +       else
> +               return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int cgbc_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct cgbc_device_data *cgbc =3D dev_get_drvdata(dev->parent);
> +       struct cgbc_gpio_data *gpio;
> +       struct gpio_chip *chip;
> +       int ret;
> +
> +       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->cgbc =3D cgbc;
> +
> +       platform_set_drvdata(pdev, gpio);
> +
> +       chip =3D &gpio->chip;
> +       chip->label =3D dev_name(&pdev->dev);
> +       chip->owner =3D THIS_MODULE;
> +       chip->parent =3D dev;
> +       chip->base =3D -1;
> +       chip->direction_input =3D cgbc_gpio_direction_input;
> +       chip->direction_output =3D cgbc_gpio_direction_output;
> +       chip->get_direction =3D cgbc_gpio_get_direction;
> +       chip->get =3D cgbc_gpio_get;
> +       chip->set =3D cgbc_gpio_set;
> +       chip->ngpio =3D CGBC_GPIO_NGPIO;
> +
> +       mutex_init(&gpio->lock);

Please use devm_mutex_init() so that it gets cleaned up at exit. It's
not strictly necessary but helps with lock debugging.

> +
> +       ret =3D devm_gpiochip_add_data(dev, chip, gpio);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Could not register GPIO c=
hip\n");
> +
> +       return 0;
> +}
> +
> +static struct platform_driver cgbc_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "cgbc-gpio",
> +       },
> +       .probe  =3D cgbc_gpio_probe,
> +};
> +
> +module_platform_driver(cgbc_gpio_driver);
> +
> +MODULE_DESCRIPTION("Congatec Board Controller GPIO Driver");
> +MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:cgbc-gpio");
>
> --
> 2.39.2
>

Bart

