Return-Path: <linux-gpio+bounces-22699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F6AF6F5D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3AB168DAC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650112E0B5C;
	Thu,  3 Jul 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d/7MySGl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDDE2D6632
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536480; cv=none; b=iPFc3xZezBDoTPCmD8RO+l5pYLy+uWjko9Aopop3Tb6Pokv9Dk8jZ0Q1VfrQ2HsJynudWVoXT/GboYZuepqDuha10/7QPwBxSK9fhNpYUD49JoHa3JQEAvPYoc96SJ2RO927ZR3TQUZxmH6etvZdNeQaTRmJsa6cpUweD5AybeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536480; c=relaxed/simple;
	bh=9Di04dKRRzGzH9uS0SWbhWZhg3VadBdk6qfiDQQSeW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZqeGC8Q7jRrczTidGVvwb3S6WHYubxl4uyQi/1CbGH2iXgpNfDl+u5ni2tO3Gyfcw+wtt9UEp0PRC9rZe/Grs6l1/pzBzsq06I50VTj5GgaT5k5opQur9hzi3/29YKbWto6JF0N+4N7hIsi+bdf/b+iKV782LsxkDZrDA9wQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d/7MySGl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-555024588b1so6255217e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751536474; x=1752141274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufo6//NKDbQUTd0ZZhjmX7Lt4QsAJLe/cUlkydR1KdE=;
        b=d/7MySGlXiG6oXIURiiBnI8mhCkzDOpWjyHnQseyzPtJzpeNVF6FfwBCJv9Q05u4bD
         5MDy9dakqO5jvuDgWjr+BN/LEuipBLeEdsZkk8Iw/NsxkPcMZRAjsyKRBQ5Xo2ePxcmv
         H8VRRbeXbT1jvu9w7M7AeF6QOhJejSgl/EYHwyfVUzdS4Z6x6fk7hpff56ncGQVoY9Kc
         G/7QysKpS5lzjASac1gil3MmGGtiiPvrfANkES+5bpG1xH9jxozWXfZLfJWw44GHaCWu
         7+h8SKPxeRS0W2Pre/03hY1MR3GHY1eilKJCWBFVtgkE0/dUl55CZs/quTUfXfAUFU5v
         nn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536474; x=1752141274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufo6//NKDbQUTd0ZZhjmX7Lt4QsAJLe/cUlkydR1KdE=;
        b=NpGlnAMz5QPAFJypUWRhQDrG+t+ECwfAXWXysZ2CdSbPCxrdxZ+1MVY197y28zsPt0
         xfXhFp8BZcrs/+tjqMRHf/fnraznI3fbiJBbNyb8vMek3u9m6DSAOxrd+ivKWZIGHQZf
         o3G9uWXVzBycP74B+hQHofSuGbPqxDKymD0zFmFtSrd+GDwi0D6tVrww2LO/Uf7JSsYd
         nE+8BX+hzIThROJ9MEpU1XsQRK5rKrM5e+hKwm1hWBgYbQwDG+eW9ThyngkLS87xHxdk
         TDs2Zi4eC3HJluZHCh+8IuDxdK+l4wvQpwBM8zrn82gRXku9FlIEoy1BxIMPan4pL087
         W7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKFooLBz9HHPne9Vpl2Ym26byMSzVwZtWcK6Awc/TrP2cB6AJ1rP/F3h6b2cb9o5npTbaGu4g7738h@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzEHA/62bgRKIGGqJI+7z7N7DgEGArA3YAiJCrvFnx1fy2970
	KBwgpGAjFPQE5hNEwDP873yRHFEtC2f8HukVXp6Srwn3yaiexceYiQdK9FVC8qNc8JYvxhAmhQ/
	WOXnUJPQNChdMx1k6Iez4RiYtYZ1C2GDJAXFdvTFlErts1HXkaOVcSw0=
X-Gm-Gg: ASbGncsBTDymrc/USc24k8+vgygLypN+j4x8tfRXdWgb8BAzqM5/R7mLJaktkbJJ/3+
	thw1UCn+SJnlSHBd1LRb6LCtIl/ZwpF2N8lmN0gLHtXPFahT1BxCvMjC58er2Gtxi1J9x/OyZwH
	BxBXPS3X1LuzFPwD3M5vOcozKzCKk/uiY1wnRnyo9ZcGIYZQVndc4w3Gf7yvXLUkopeW6DjpiVN
	1JqqbfYCDRO
X-Google-Smtp-Source: AGHT+IGVZqLY6sEPHfBPNPlL1goSIdovB3R0MRIKImsjvCWRwJU+4k56ayeFT7L6lLxUt1XDJKMU7J0/VhZsHOClv2s=
X-Received: by 2002:a05:6512:3f21:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-556282f155amr1917221e87.9.1751536474170; Thu, 03 Jul 2025
 02:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com> <20250702164926.2990958-3-s-ramamoorthy@ti.com>
In-Reply-To: <20250702164926.2990958-3-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 11:54:22 +0200
X-Gm-Features: Ac12FXw-F-3yV40Vzq_seztSA_t83xSkBosBDGPsI1jaC-yi5lN1A5NWAHXDewI
Message-ID: <CAMRc=Md4cq7jGOZgfnEJkXEXMu4NuJL1-r_fntuAhmCzEwfOpg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:51=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti.=
com> wrote:
>
> Add support for the TI TPS65214 PMIC with the addition of an id_table,
> separate TPS65214 template_chip, and device-specific _change_direction
> functions.
>
> - Use platform_get_device_id() to assign dev-specific information.
> - Use different change_direction() functions since TPS65214's GPIO
>   configuration bits are changeable during device operation through bit
>   GPIO_CONFIG in GENERAL_CONFIG register.
> - Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/gpio/gpio-tps65219.c | 93 +++++++++++++++++++++++++++++++++---
>  1 file changed, 87 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 3c762103babc..7a62d490ad0a 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * GPIO driver for TI TPS65215/TPS65219 PMICs
> + * GPIO driver for TI TPS65214/TPS65215/TPS65219 PMICs
>   *
>   * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com=
/
>   */
> @@ -13,10 +13,15 @@
>  #include <linux/regmap.h>
>
>  #define TPS65219_GPIO0_DIR_MASK                BIT(3)
> +#define TPS65214_GPIO0_DIR_MASK                BIT(1)
>  #define TPS6521X_GPIO0_OFFSET          2
>  #define TPS6521X_GPIO0_IDX             0
>
>  /*
> + * TPS65214 GPIO mapping
> + * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
> + * Linux gpio offset 1 -> GPO1 (pin9 ) -> bit_offset 0
> + *
>   * TPS65215 & TPS65219 GPIO mapping
>   * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
>   * Linux gpio offset 1 -> GPO1 (pin8 ) -> bit_offset 0
> @@ -24,10 +29,26 @@
>   */
>
>  struct tps65219_gpio {
> +       int (*change_dir)(struct gpio_chip *gc, unsigned int offset, unsi=
gned int dir);
>         struct gpio_chip gpio_chip;
>         struct tps65219 *tps;
>  };
>
> +static int tps65214_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
> +{
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +       int ret, val;
> +
> +       if (offset !=3D TPS6521X_GPIO0_IDX)
> +               return GPIO_LINE_DIRECTION_OUT;
> +
> +       ret =3D regmap_read(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFI=
G, &val);
> +       if (ret)
> +               return ret;
> +
> +       return !(val & TPS65214_GPIO0_DIR_MASK);
> +}
> +
>  static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
>  {
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -119,6 +140,34 @@ static int tps65219_gpio_change_direction(struct gpi=
o_chip *gc, unsigned int off
>         return -ENOTSUPP;
>  }
>
> +static int tps65214_gpio_change_direction(struct gpio_chip *gc, unsigned=
 int offset,
> +                                         unsigned int direction)
> +{
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +       struct device *dev =3D gpio->tps->dev;
> +       int val, ret;
> +
> +       /* Verified if GPIO or GPO in parent function
> +        * Masked value: 0 =3D GPIO, 1 =3D VSEL
> +        */
> +       ret =3D regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG,=
 &val);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D !!(val & BIT(TPS65219_GPIO0_DIR_MASK));
> +       if (ret)
> +               dev_err(dev, "GPIO%d configured as VSEL, not GPIO\n", off=
set);
> +
> +       ret =3D regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERA=
L_CONFIG,
> +                                TPS65214_GPIO0_DIR_MASK, direction);
> +       if (ret)
> +               dev_err(dev,
> +                       "Fail to change direction to %u for GPIO%d.\n",
> +                       direction, offset);
> +
> +       return ret;
> +}
> +
>  static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned =
int offset)
>  {
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -132,11 +181,13 @@ static int tps65219_gpio_direction_input(struct gpi=
o_chip *gc, unsigned int offs
>         if (tps65219_gpio_get_direction(gc, offset) =3D=3D GPIO_LINE_DIRE=
CTION_IN)
>                 return 0;
>
> -       return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIREC=
TION_IN);
> +       return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_IN);
>  }
>
>  static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned=
 int offset, int value)
>  {
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +
>         tps65219_gpio_set(gc, offset, value);
>         if (offset !=3D TPS6521X_GPIO0_IDX)
>                 return 0;
> @@ -144,9 +195,22 @@ static int tps65219_gpio_direction_output(struct gpi=
o_chip *gc, unsigned int off
>         if (tps65219_gpio_get_direction(gc, offset) =3D=3D GPIO_LINE_DIRE=
CTION_OUT)
>                 return 0;
>
> -       return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIREC=
TION_OUT);
> +       return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_OUT);
>  }
>
> +static const struct gpio_chip tps65214_template_chip =3D {
> +       .label                  =3D "tps65214-gpio",
> +       .owner                  =3D THIS_MODULE,
> +       .get_direction          =3D tps65214_gpio_get_direction,
> +       .direction_input        =3D tps65219_gpio_direction_input,
> +       .direction_output       =3D tps65219_gpio_direction_output,
> +       .get                    =3D tps65219_gpio_get,
> +       .set                    =3D tps65219_gpio_set,

Please use the set_rv() variant, regular set() is deprecated and will
be removed soon.

> +       .base                   =3D -1,
> +       .ngpio                  =3D 2,
> +       .can_sleep              =3D true,
> +};
> +
>  static const struct gpio_chip tps65219_template_chip =3D {
>         .label                  =3D "tps65219-gpio",
>         .owner                  =3D THIS_MODULE,
> @@ -162,6 +226,7 @@ static const struct gpio_chip tps65219_template_chip =
=3D {
>
>  static int tps65219_gpio_probe(struct platform_device *pdev)
>  {
> +       enum pmic_id chip =3D platform_get_device_id(pdev)->driver_data;
>         struct tps65219 *tps =3D dev_get_drvdata(pdev->dev.parent);
>         struct tps65219_gpio *gpio;
>
> @@ -169,22 +234,38 @@ static int tps65219_gpio_probe(struct platform_devi=
ce *pdev)
>         if (!gpio)
>                 return -ENOMEM;
>
> +       if (chip =3D=3D TPS65214) {
> +               gpio->gpio_chip =3D tps65214_template_chip;
> +               gpio->change_dir =3D tps65214_gpio_change_direction;
> +       } else if (chip =3D=3D TPS65219) {
> +               gpio->gpio_chip =3D tps65219_template_chip;
> +               gpio->change_dir =3D tps65219_gpio_change_direction;
> +       } else {
> +               return -ENODATA;
> +       }
> +
>         gpio->tps =3D tps;
> -       gpio->gpio_chip =3D tps65219_template_chip;
>         gpio->gpio_chip.parent =3D tps->dev;
>
>         return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio)=
;
>  }
>
> +static const struct platform_device_id tps6521x_gpio_id_table[] =3D {
> +       { "tps65214-gpio", TPS65214 },
> +       { "tps65219-gpio", TPS65219 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
> +
>  static struct platform_driver tps65219_gpio_driver =3D {
>         .driver =3D {
>                 .name =3D "tps65219-gpio",
>         },
>         .probe =3D tps65219_gpio_probe,
> +       .id_table =3D tps6521x_gpio_id_table,
>  };
>  module_platform_driver(tps65219_gpio_driver);
>
> -MODULE_ALIAS("platform:tps65219-gpio");
>  MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
> -MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
> +MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 GPIO driver");
>  MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>

Bartosz

