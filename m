Return-Path: <linux-gpio+bounces-30083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35624CEF5D3
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 22:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87BED300749B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 21:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4071E1A3D;
	Fri,  2 Jan 2026 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JobVJNOL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021214A8E
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767390374; cv=none; b=Rgx3evn7gpCoVsPhL7CeFNUWl3E5DL0WFxYKyfn8z52H/A8VbsPbXX/776MMLx2k1pICD7RYNlAu/hcFxKDLRvoqur42J1RywyqVkRk5CxuN++GjpgLbPxvXKtAYxZ3TK6n3GN7sUZqMJS2eFZMimd+tsWFnDBDRreEUyFN8QkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767390374; c=relaxed/simple;
	bh=NTdnCl4f2V1cGkrm0UOB+dRqAyLBUxn3DkcIZlsbztI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oR5NWxKko0WIZ/MWrpmk8MR6DFf/JigcNO/o+J2uHqXlZqGpExDzV9CdZRHALIxeoygnFt69WpRR/5dCK131wVFjEflk0fnET9CfhvN519r2/M68nIH5MfqSCir7IUkHFsbOm5yz5tiPS9s1E84Kau5WRP5xg+Ylne7n86h+MU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JobVJNOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C7C116C6
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 21:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390374;
	bh=NTdnCl4f2V1cGkrm0UOB+dRqAyLBUxn3DkcIZlsbztI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JobVJNOLvMN5w4REcp926dGvD1aUF+QalXIR0holTtGUa+/MwNXyDUcIwz8J5eEaD
	 C5TvLmTuf/qt/ec+5rF1p+MPy6nXbs5DsdCMhds5keKK78JqrGA9VvCr6CXwmaLjsZ
	 zmzsheZ1EgqGbtd/i1JylvAaeVYSFmtGZl9U5bp63I1THcKAxe1dWW7R86eGq93c4H
	 NkiHch4KKCmtW91A6RiizojrkTHRmDHQfs13kK3vWFzhWOnzr7ZqL+DnaM6yzK9h8t
	 i59Urku+YTar3Noj2j+JwfFnaBrXaa1SdAGSxWSWyTvsWJI+xAct1TkWPRYucg4HsS
	 8ph5Rz9ZSodVg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fb6c7874cso114441357b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 13:46:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzWIqzj9shfj28+TpFgCrr7/mJD+IUeHgiAp45TalNHldnXxxft3Y7INXoiT9E/BJh9dWxb9dzq1j0@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOKTS3EzylUt805Up2b8oE9d4X8vM+dWoCe1aRvzyVGfXH6U5
	Zzfn+eNY4H221qOQduSUE3L8ivN7v9qzchL1MAjgq4sdfiiqwMiNEX7t7ySNXh6BQOS4qIVNEUm
	sNLnW7dk0+IjRXukSNdJwRl9DJf6oRYM=
X-Google-Smtp-Source: AGHT+IH33olNfgulnhiqfwveNZ/JUIYECnmqjnapImldBhSvuoAY0vQgtlBVK5spJfNyThgZAg6EHVDlx9d3WxxA4nU=
X-Received: by 2002:a05:690c:c533:b0:78d:6716:229 with SMTP id
 00721157ae682-78fb405d282mr305206767b3.48.1767390373785; Fri, 02 Jan 2026
 13:46:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
 <20251222-axiado-ax3000-cadence-gpio-support-v1-1-c9ef8e0d0bce@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-cadence-gpio-support-v1-1-c9ef8e0d0bce@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Jan 2026 22:46:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=BxQ0oqmSJnwLPnev1rjEygVXW1okB9VkywJUbXf3puQ@mail.gmail.com>
X-Gm-Features: AQt7F2oVG1hZIE9pct9EJL51eDTK0oJQwNIYpT9OV5vCIXg4nikXu49g7eYW3Tk
Message-ID: <CAD++jL=BxQ0oqmSJnwLPnev1rjEygVXW1okB9VkywJUbXf3puQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
To: Swark Yang <syang@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tzu-Hao Wei <twei@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Swark,

thanks for your patch!

On Tue, Dec 23, 2025 at 8:30=E2=80=AFAM Swark Yang <syang@axiado.com> wrote=
:

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

> +#define CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG       BIT(1)

This is just using bits and copying stuff unnecessarily.

Do this:

struct cdns_gpio_quirks {
    bool skip_init;
};

>  struct cdns_gpio_chip {
>         struct gpio_generic_chip gen_gc;
>         void __iomem *regs;
>         u32 bypass_orig;

In this struct add:

struct cdns_gpio_quirks *quirks;

And assign it in probe.

> +struct cdns_platform_data {
> +       u32 quirks;
> +};

Skip this double-translated thing.

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

static const struct cdns_gpio_quirks cdns_default_quirks =3D {
    .skip_init =3D true,
};

static const struct cdns_gpio_quirks ax300_gpio_quirks =3D {
    .skip_init =3D true,
};

> +static const struct of_device_id cdns_of_ids[] =3D {
> +       { .compatible =3D "axiado,ax3000-gpio", .data =3D &ax3000_gpio_de=
f },

.data =3D &ax3000_gpio_quirks,

> +       { .compatible =3D "cdns,gpio-r1p02" },

.data =3D &cdns_default_quirks,

This becomes more manageable, as I know there is *at least* one
more variant arriving, which is for CIX semiconductors and who knows
how many quirks we will have to carry in the future.

>  static int cdns_gpio_probe(struct platform_device *pdev)
>  {
>         struct gpio_generic_chip_config config =3D { };
> @@ -148,6 +167,8 @@ static int cdns_gpio_probe(struct platform_device *pd=
ev)
>         int ret, irq;
>         u32 dir_prev;
>         u32 num_gpios =3D 32;
> +       bool skip_pinmux_cfg =3D false;

Nah, just reference the quirk.

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
> +       if (match && match->data) {
> +               const struct cdns_platform_data *data =3D match->data;
> +
> +               skip_pinmux_cfg =3D data->quirks & CDNS_GPIO_QUIRKS_SKIP_=
PINMUX_CFG;
> +       }

Instead do:

cgpio->quirks =3D device_get_match_data() like Bartosz suggests.

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

Here:
if (cgpio->quirks->skip_init) {

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

if (cgpio->quirks->skip_init) {

> +               iowrite32(GENMASK(num_gpios - 1, 0),
> +                         cgpio->regs + CDNS_GPIO_OUTPUT_EN);

This has nothing to do with pinmux whatsoever so it is better to call
this quirk "skip_init"

> +               iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);

This affects the pinmuxing though. But the muxing happens outside
of the GPIO block itself.

Yours,
Linus Walleij

