Return-Path: <linux-gpio+bounces-30054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E4ECEE2AB
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 11:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB04300B9BC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 10:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410F82D73BE;
	Fri,  2 Jan 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6spx48E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164D4A3E
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767349785; cv=none; b=EGMeu9gkihm+S+vQ3gtf0FWXcNP9oWSEQdLEwlWCgK3hMGobTnkBk4P4yJ+y0yEpNhDanM5e+AMmK6G77bVz5Vk7irRmX1C8Cc0t70xYWUKzQo7tsJTUtr33fg8yW0aSfTjGL3GTXU9Ug7r1TitrfaHQaREyMS2U7LtpHO+neZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767349785; c=relaxed/simple;
	bh=fvoMNAbdqvP92dhYq1nfi37dK43O80JjH7EIa0iBWX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqHcKw85oru0u1JBfkkdfy95s9tHl6T7RzVO7STWWG5CzHrV9uZjXKXxKHRBiyKEleKleAGAwZTSHiwnZ1gw2Dr6SPicSH0OWlRJFxhXBUV4hbvgmGUfE+Bj7EqQfgauK43nsbeeg0n8Kmtuwp/vM+CoyuRuUNBeLLwPPukH8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6spx48E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877A9C19422
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767349784;
	bh=fvoMNAbdqvP92dhYq1nfi37dK43O80JjH7EIa0iBWX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s6spx48EQo1akd1ApMY0b3PUtT+NBhruEIBiroaeikrV92bS3LofkOnPfIHka4b7T
	 ASeI7byUK5dDnYVrzfoHC7vfhKz6xGWQHbAPcRW8Ofno/zeHPG+SVdFqZuAbxnSrM6
	 r/mpC3k2OWtnk8Rf6RUC5+P6ml1BfBTCTZe/97KAqWImwDwEDnonafzKs/bqTJUO5D
	 MPAUsLGAwJ51sCuKdgWP3u6/ax8yF8SCDtOVgfJ4gDV97SjI2ey4TGqXo2FSaHxwIz
	 U/WgxDbYzJRk+mqtGIlDbHjx3SF92dfUsHeWLumCYdSqB7lSLHoClEZ4mJ9voaaz9T
	 pYthoqF140j+g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959187c5a9so10284641e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 02:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0t468yaJs/Y94zSz0CKVH1pDphFA5KRUQUVdyDmTMpAbCYeM1uUxMyqJvF0cn8GcYLunEmQUl25G+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8C80Brsb18oC6cvmNXBM3Eu0b/YxQ/FaziN5UuHwSboVnqtfr
	wqJjhbgOd4Gd1isufkEuUusc87QdrDKv1AZvqQcjs3fnoNxGUdSG8GJyroE9JJzrKe9nXG76EJU
	Y9skU/TPtIwzYkvO4FomKNTY+Ol6AXSQwJd/EZ1oo8A==
X-Google-Smtp-Source: AGHT+IG9KsTNhdvD3hNA4by6Oh3vsJCw6a1+IJ+TvN2At6IjX0fAOBHpQVlYERDELDwgiBq0kxlBTLzuF/G+OSUNLq8=
X-Received: by 2002:a05:6512:4010:b0:598:fabd:b3f5 with SMTP id
 2adb3069b0e04-59a17d606ccmr13503319e87.17.1767349783098; Fri, 02 Jan 2026
 02:29:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
 <20251222-axiado-ax3000-cadence-gpio-support-v1-1-c9ef8e0d0bce@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-cadence-gpio-support-v1-1-c9ef8e0d0bce@axiado.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:29:31 +0100
X-Gmail-Original-Message-ID: <CAMRc=MesW=pf9K4OcgZHn3iyULLf0ysRrFx51cj82JCeugcHWw@mail.gmail.com>
X-Gm-Features: AQt7F2oc83-1fOqEv6lJNcIrBPjoNokHdwdyI15hqouhDChRgCJCLtRiUEcjrPs
Message-ID: <CAMRc=MesW=pf9K4OcgZHn3iyULLf0ysRrFx51cj82JCeugcHWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
To: Swark Yang <syang@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzu-Hao Wei <twei@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 8:30=E2=80=AFAM Swark Yang <syang@axiado.com> wrote=
:
>
> On the Axiado AX3000 platform, pinmux and pin configuration (such as
> direction and output enable) are configured by the hardware/firmware
> at boot time before Linux boots.
>
> To prevent conflicts, introduce a platform-specific quirk triggered by
> the "axiado,ax3000-gpio" compatible string.
>
> When this quirk is active, the driver will skip its default
> initialization of pinmux configuration and direction settings during
> probe.
>
> Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Swark Yang <syang@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> ---
>  drivers/gpio/gpio-cadence.c | 53 +++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
> index b75734ca22dd..b9f39566b0f9 100644
> --- a/drivers/gpio/gpio-cadence.c
> +++ b/drivers/gpio/gpio-cadence.c
> @@ -6,6 +6,9 @@
>   * Authors:
>   *  Jan Kotas <jank@cadence.com>
>   *  Boris Brezillon <boris.brezillon@free-electrons.com>
> + *
> + * Copyright (C) 2025 Axiado Corporation.

Move this to where the original copyright is.

> + *
>   */
>
>  #include <linux/cleanup.h>
> @@ -31,12 +34,18 @@
>  #define CDNS_GPIO_IRQ_VALUE            0x28
>  #define CDNS_GPIO_IRQ_ANY_EDGE         0x2c
>
> +#define CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG       BIT(1)
> +
>  struct cdns_gpio_chip {
>         struct gpio_generic_chip gen_gc;
>         void __iomem *regs;
>         u32 bypass_orig;
>  };
>
> +struct cdns_platform_data {
> +       u32 quirks;
> +};
> +
>  static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset=
)
>  {
>         struct cdns_gpio_chip *cgpio =3D gpiochip_get_data(chip);
> @@ -141,6 +150,16 @@ static const struct irq_chip cdns_gpio_irqchip =3D {
>         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
> +static const struct cdns_platform_data ax3000_gpio_def =3D {
> +       .quirks =3D CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG, };

Didn't checkpatch complain about the trailing bracket? Please move it
to the next line.

> +
> +static const struct of_device_id cdns_of_ids[] =3D {
> +       { .compatible =3D "axiado,ax3000-gpio", .data =3D &ax3000_gpio_de=
f },
> +       { .compatible =3D "cdns,gpio-r1p02" },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, cdns_of_ids);
> +
>  static int cdns_gpio_probe(struct platform_device *pdev)
>  {
>         struct gpio_generic_chip_config config =3D { };
> @@ -148,6 +167,8 @@ static int cdns_gpio_probe(struct platform_device *pd=
ev)
>         int ret, irq;
>         u32 dir_prev;
>         u32 num_gpios =3D 32;
> +       bool skip_pinmux_cfg =3D false;
> +       const struct of_device_id *match;
>         struct clk *clk;
>
>         cgpio =3D devm_kzalloc(&pdev->dev, sizeof(*cgpio), GFP_KERNEL);
> @@ -165,6 +186,13 @@ static int cdns_gpio_probe(struct platform_device *p=
dev)
>                 return -EINVAL;
>         }
>
> +       match =3D of_match_node(cdns_of_ids, pdev->dev.of_node);

Just use device_get_match_data().

> +       if (match && match->data) {
> +               const struct cdns_platform_data *data =3D match->data;
> +
> +               skip_pinmux_cfg =3D data->quirks & CDNS_GPIO_QUIRKS_SKIP_=
PINMUX_CFG;
> +       }
> +
>         /*
>          * Set all pins as inputs by default, otherwise:
>          * gpiochip_lock_as_irq:
> @@ -173,8 +201,15 @@ static int cdns_gpio_probe(struct platform_device *p=
dev)
>          * so it needs to be changed before gpio_generic_chip_init() is c=
alled.
>          */
>         dir_prev =3D ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
> -       iowrite32(GENMASK(num_gpios - 1, 0),
> -                 cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
> +
> +       /*
> +        * The AX3000 platform performs the required configuration at boo=
t time
> +        * before Linux boots, so this quirk disables pinmux initializati=
on.
> +        */
> +       if (!skip_pinmux_cfg) {
> +               iowrite32(GENMASK(num_gpios - 1, 0),
> +                         cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
> +       }
>
>         config.dev =3D &pdev->dev;
>         config.sz =3D 4;
> @@ -240,9 +275,11 @@ static int cdns_gpio_probe(struct platform_device *p=
dev)
>         /*
>          * Enable gpio outputs, ignored for input direction
>          */
> -       iowrite32(GENMASK(num_gpios - 1, 0),
> -                 cgpio->regs + CDNS_GPIO_OUTPUT_EN);
> -       iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
> +       if (!skip_pinmux_cfg) {
> +               iowrite32(GENMASK(num_gpios - 1, 0),
> +                         cgpio->regs + CDNS_GPIO_OUTPUT_EN);
> +               iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
> +       }
>
>         platform_set_drvdata(pdev, cgpio);
>         return 0;
> @@ -260,12 +297,6 @@ static void cdns_gpio_remove(struct platform_device =
*pdev)
>         iowrite32(cgpio->bypass_orig, cgpio->regs + CDNS_GPIO_BYPASS_MODE=
);
>  }
>
> -static const struct of_device_id cdns_of_ids[] =3D {
> -       { .compatible =3D "cdns,gpio-r1p02" },
> -       { /* sentinel */ },
> -};
> -MODULE_DEVICE_TABLE(of, cdns_of_ids);
> -
>  static struct platform_driver cdns_gpio_driver =3D {
>         .driver =3D {
>                 .name =3D "cdns-gpio",
>
> --
> 2.25.1
>

Bart

