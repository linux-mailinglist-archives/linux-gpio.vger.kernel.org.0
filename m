Return-Path: <linux-gpio+bounces-16575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B719CA44754
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 18:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 251033AC5E1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEE51991CF;
	Tue, 25 Feb 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1KtHPO/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83911990D9;
	Tue, 25 Feb 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502685; cv=none; b=oQwpX3qcB4yoWr9xmQ7+LQsAVYDqp2fl4TdqIQdSANnsDu+SZmF2DHLkMIoluxrNp4JiyTEuaYsemVKwez6g1AKOV45Gu5XTo7i6ffVTpMMe8kpVB++/qU2enX+J81MHWKLzCmgaZIebsNHvjclRi9TEjoIkjWT+Pl9LmKT7zy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502685; c=relaxed/simple;
	bh=UmlCUOifDi78PZ3sZ9Hgh4boP9yes+3i/SeSn4tG0PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eI1HAnCcAPiEvllziR86c0VSjgEKbM0WjVtg2v8WRoW/n2hfxw+YjYpn4mRcX0pAKWqys5dVxW31G1/K5Ckz0FAibeK0dJ7wiwbcdfji8xr6qNBZ8G2AI7/BmlwK8MpgY3//3rkZySopXddJW2YLHBOGSVaxDO1q3bsbHCYdPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1KtHPO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EB9C4CEE7;
	Tue, 25 Feb 2025 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740502684;
	bh=UmlCUOifDi78PZ3sZ9Hgh4boP9yes+3i/SeSn4tG0PE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j1KtHPO/x9OfCPfgUTJEoVspBhAw4LvI6vd9BERgctRxolycyO8a1Ss+y+O5kVDkX
	 L3Xe+gvx/qSNTsSWaAbRqpf8YJFakCnsiU1aY1XHNuUg5cxStIwzxZJceDhzc2Me/Z
	 iliz3c0NX/XWbK0pQZAcQDMuKhwSkPDFPIpDrCX3O/B8bTSSWmb7VBaSL/fLAt4TS/
	 ZUcArHkzCklAuXAS5VJgDZcRlo32MeHXKKUTHA2TXB5znfIVVy4LuZYeruWZSiVZ4C
	 8UBaU08wKJMR8qzeeE8luVmy2UJqnh2ptlWPjo2/4m5lNtMPd4kdhQco3uScr5auMJ
	 2W++qBTGzZVrA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so9002772a12.1;
        Tue, 25 Feb 2025 08:58:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOhrVhtSHR9cJjDP0gqZBsVV+H/gDDqeQ7MG8Kh7Oq5vCfjHbNavbsDeG1Y2KBdNNt1IygaHPV00JT@vger.kernel.org, AJvYcCWq0NyPwNHujjqNJwOkufdOhk39F7l9mBizZBMqpqNgL0/Dl3rkIFf3C5/YM5cuOvig04OzhBaLpHZEsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3uJZeZYkMr1EKTL/eOSzMv2uxwVQwAL+iaVi5GLwup7l2YzC
	hoZ5OYGeqTEVaNInXJrCrved5BPfw6lMZTifhUhEJNkrsqRytpkSoYRaSNT7ZX4Dq7FqhaudUD9
	6RYbH8VgVl+NL06WitxjMb2ID8A==
X-Google-Smtp-Source: AGHT+IHU0VMm2qsc1xH1Uy1x2otaarsyDtRv2AMJTjxVs/z2V8zUUxlaQa+ad3iGfyDLjHh/RMZvjmmNUG/PgJyb0g0=
X-Received: by 2002:a05:6402:3220:b0:5e0:82a0:50dd with SMTP id
 4fb4d7f45d1cf-5e0b7252d44mr18879647a12.27.1740502682731; Tue, 25 Feb 2025
 08:58:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org> <20250225-gpio-ranges-fourcell-v2-2-8da9998fa976@linaro.org>
In-Reply-To: <20250225-gpio-ranges-fourcell-v2-2-8da9998fa976@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2025 10:57:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL1tLPP_Waw61ygTZECCRVBE_asTccCWMOQTYnJb9=wvA@mail.gmail.com>
X-Gm-Features: AQ5f1JonlDqgjmGMTmM-l4DT7QnEMLGcmWUc1hpupPcXhY-rrPaX5FgWjOf9rDA
Message-ID: <CAL_JsqL1tLPP_Waw61ygTZECCRVBE_asTccCWMOQTYnJb9=wvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: of: Handle threecell GPIO chips
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:15=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> When describing GPIO controllers in the device tree, the ambition
> of device tree to describe the hardware may require a three-cell
> scheme:
>
> gpios =3D <&gpio instance offset flags>;

I think we have cases where bank/instance and offset are in 1 cell.
Not sure if you want to make it possible to split those into separate
gpio chips.

> This implements support for this scheme in the gpiolib OF core.
>
> Drivers that want to handle multiple gpiochip instances from one
> OF node need to implement a callback similar to this to
> determine if a certain gpio chip is a pointer to the right
> instance (pseudo-code):
>
> struct my_gpio {
>     struct gpio_chip gcs[MAX_CHIPS];
> };
>
> static bool my_of_node_instance_match(struct gpio_chip *gc
>                                       unsigned int instance)
> {
>     struct my_gpio *mg =3D gpiochip_get_data(gc);
>
>     if (instance >=3D MAX_CHIPS)
>         return false;
>     return (gc =3D=3D &mg->gcs[instance]);
> }
>
> probe() {
>     struct my_gpio *mg;
>     struct gpio_chip *gc;
>     int i, ret;
>
>     for (i =3D 0; i++; i < MAX_CHIPS) {
>         gc =3D &mg->gcs[i];
>         /* This tells gpiolib we have several instances per node */
>         gc->of_gpio_n_cells =3D 3;
>         gc->of_node_instance_match =3D my_of_node_instance_match;
>         gc->base =3D -1;
>         ...
>
>         ret =3D devm_gpiochip_add_data(dev, gc, mg);
>         if (ret)
>             return ret;
>     }
> }
>
> Rename the "simple" of_xlate function to "twocell" which is closer
> to what it actually does.
>
> In the device tree bindings, the provide node needs
> to specify #gpio-cells =3D <3>; where the first cell is the instance
> number:
>
> gpios =3D <&gpio instance offset flags>;
>
> Conversely ranges need to have four cells:
>
> gpio-ranges =3D <&pinctrl instance gpio_offset pin_offset count>;
>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Tested-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c   | 93 +++++++++++++++++++++++++++++++++++++++=
+-----
>  include/linux/gpio/driver.h | 24 +++++++++++-
>  2 files changed, 106 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 86405218f4e2ddc951a1a9d168e886400652bf60..614590a5bcd10e5605ecb66eb=
d956250e4ea1fd8 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -929,7 +929,7 @@ struct notifier_block gpio_of_notifier =3D {
>  #endif /* CONFIG_OF_DYNAMIC */
>
>  /**
> - * of_gpio_simple_xlate - translate gpiospec to the GPIO number and flag=
s
> + * of_gpio_twocell_xlate - translate twocell gpiospec to the GPIO number=
 and flags
>   * @gc:                pointer to the gpio_chip structure
>   * @gpiospec:  GPIO specifier as found in the device tree
>   * @flags:     a flags pointer to fill in
> @@ -941,9 +941,9 @@ struct notifier_block gpio_of_notifier =3D {
>   * Returns:
>   * GPIO number (>=3D 0) on success, negative errno on failure.
>   */
> -static int of_gpio_simple_xlate(struct gpio_chip *gc,
> -                               const struct of_phandle_args *gpiospec,
> -                               u32 *flags)
> +static int of_gpio_twocell_xlate(struct gpio_chip *gc,
> +                                const struct of_phandle_args *gpiospec,
> +                                u32 *flags)
>  {
>         /*
>          * We're discouraging gpio_cells < 2, since that way you'll have =
to

Note that this function only rejects <2, but I doubt 3 cells worked
for it. So it should probably check for !=3D2.

> @@ -968,6 +968,49 @@ static int of_gpio_simple_xlate(struct gpio_chip *gc=
,
>         return gpiospec->args[0];
>  }
>
> +/**
> + * of_gpio_threecell_xlate - translate threecell gpiospec to the GPIO nu=
mber and flags
> + * @gc:                pointer to the gpio_chip structure
> + * @gpiospec:  GPIO specifier as found in the device tree
> + * @flags:     a flags pointer to fill in
> + *
> + * This is simple translation function, suitable for the most 1:n mapped
> + * GPIO chips, i.e. several GPIO chip instances from one device tree nod=
e.
> + * In this case the following binding is implied:
> + *
> + * foo-gpios =3D <&gpio instance offset flags>;
> + *
> + * Returns:
> + * GPIO number (>=3D 0) on success, negative errno on failure.
> + */
> +static int of_gpio_threecell_xlate(struct gpio_chip *gc,
> +                                  const struct of_phandle_args *gpiospec=
,
> +                                  u32 *flags)
> +{
> +       if (gc->of_gpio_n_cells !=3D 3) {
> +               WARN_ON(1);
> +               return -EINVAL;
> +       }
> +
> +       if (WARN_ON(gpiospec->args_count !=3D 3))
> +               return -EINVAL;
> +
> +       /*
> +        * Check chip instance number, the driver responds with true if
> +        * this is the chip we are looking for.
> +        */
> +       if (!gc->of_node_instance_match(gc, gpiospec->args[0]))

I would just pass gpiospec here. Then it can look at anything it wants
in the args.

Taking it a step further, if you made the function return the GPIO
line number, you could combine the 2 translate functions. You'd need a
default of_node_instance_match() to return args[0] for the 2 cell
case.

> +               return -EINVAL;
> +
> +       if (gpiospec->args[1] >=3D gc->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags =3D gpiospec->args[2];

With the above, this would work for both cases:

gpiospec->args[gpiospec->args_count - 1]


Just an idea. Keep it as-is if you prefer.

Rob

