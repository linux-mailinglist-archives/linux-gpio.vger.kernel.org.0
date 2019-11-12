Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405CCF8C86
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 11:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfKLKLr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 05:11:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41362 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLKLr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 05:11:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id 94so13813957oty.8
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OZCLmcxM0cSpy/HV74nh+VraTgf1M51v1c4VTGCeiSQ=;
        b=myhhOAX1AIdioOXvxRj+S64bQKiAbsdgZjNOe249qv16XpU+GBXKyvlSqk/ogI/gek
         OSs1/NYEKXYx5KO20VUo3FlgQsOzx0UIRJjvHeyDuOe12stW2Gs/3VvXuuLzPL9QKiKW
         ju/NzJwrNVfA5qb2I6AFyKIDk49vXslwEPjhYZLB7eMXraLRh0kmTTIWFcNVi9Kz36Ak
         4opo6WhSlZ9+4SIqyu1A6zAuNPWWhMIGC55B265WTuESckeDvKIZ7QnnkNJmaMKITsq5
         YkXugjGD6PCsY6tiY55V74pg6Uaw0+/wV+j5CCqA1S/NVfSnktEpiBqLyHQe32pi+8s8
         /D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OZCLmcxM0cSpy/HV74nh+VraTgf1M51v1c4VTGCeiSQ=;
        b=b8sUztC6WXxrsBB0a0P9coj7ANz2faOjapXjClPg3qPi9EalCJCYfVVY6fqoBIuMWS
         /1dpH93/YEZN2AcMg36LPVvd7XbNGsbMF9PDj6eerdwzTU3RxprMS90Jz77JoWNvB2e2
         4JZZTPJJyRFzNmiAIYos2muN6jeV0HbXlix+UOz7erC0nlUQX84Ia8EQX8Edxp8rrwMR
         h1dygKmy8oU8dTL4iFR2eVj3Y2SBtWAOOmwbg8wMK0BgJPLfqZc+qyTVICBQIwyz09F7
         obqDfVPo4IzC0GnofgWGuGoV8TgXYzCpXmOm0IGKrMa8uIt4jaFTfRQdbyLkBWyUg1VT
         uImA==
X-Gm-Message-State: APjAAAWWB7nPwreBMZ6Bn/XXIm3/StfWgQzOwHUIhzd1vCeGmZPfVhhb
        UsdfALjGqI8bQ137dLb77yxfKUtstqV8nU5vdZftxw==
X-Google-Smtp-Source: APXvYqwRRCruMjuBBqi3mRM1Xn1LDd+/koxSw0rphHpN+mn3bjR0Xk7L1Fbg6R3QkL2NZV3UU/l8RD2wRDzQKKnJpNA=
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr24520412otc.250.1573553506298;
 Tue, 12 Nov 2019 02:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20191108153353.3149078-1-thierry.reding@gmail.com> <20191108153353.3149078-2-thierry.reding@gmail.com>
In-Reply-To: <20191108153353.3149078-2-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 11:11:35 +0100
Message-ID: <CAMpxmJXOdHOH5tWcZXzK0gb6aEAs-d_sM-uL6fdw5eFu_5L4Ug@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: tegra186: Program interrupt route mapping
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 8 lis 2019 o 16:34 Thierry Reding <thierry.reding@gmail.com> napisa=C5=
=82(a):
>
> From: Thierry Reding <treding@nvidia.com>
>
> The controls for the GG port on Tegra194 resides in the power partition
> of the C5 PCIe controller and its interrupt route mapping can therefore
> not be programmed by early boot firmware along with that of the other
> ports.
>
> Detect this generically by looking at which controls have already been
> locked down using the security registers and fill in default values for
> controls that are unlocked.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 46 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 32714cefdfde..404ebb82bfa2 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -15,6 +15,14 @@
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
>
> +/* security registers */
> +#define TEGRA186_GPIO_CTL_SCR 0x0c
> +#define  TEGRA186_GPIO_CTL_SCR_SEC_WEN BIT(28)
> +#define  TEGRA186_GPIO_CTL_SCR_SEC_REN BIT(27)
> +
> +#define TEGRA186_GPIO_INT_ROUTE_MAPPING(p, x) (0x14 + (p) * 0x20 + (x) *=
 4)
> +
> +/* control registers */
>  #define TEGRA186_GPIO_ENABLE_CONFIG 0x00
>  #define  TEGRA186_GPIO_ENABLE_CONFIG_ENABLE BIT(0)
>  #define  TEGRA186_GPIO_ENABLE_CONFIG_OUT BIT(1)
> @@ -64,6 +72,7 @@ struct tegra_gpio {
>
>         const struct tegra_gpio_soc *soc;
>
> +       void __iomem *secure;
>         void __iomem *base;
>  };
>
> @@ -449,6 +458,37 @@ static const struct of_device_id tegra186_pmc_of_mat=
ch[] =3D {
>         { /* sentinel */ }
>  };
>
> +static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
> +{
> +       unsigned int i, j;
> +       u32 value;
> +
> +       for (i =3D 0; i < gpio->soc->num_ports; i++) {
> +               const struct tegra_gpio_port *port =3D &gpio->soc->ports[=
i];
> +               unsigned int offset, p =3D port->port;
> +               void __iomem *base;
> +
> +               base =3D gpio->secure + port->bank * 0x1000 + 0x800;
> +
> +               value =3D readl(base + TEGRA186_GPIO_CTL_SCR);
> +
> +               /*
> +                * For controllers that haven't been locked down yet, mak=
e
> +                * sure to program the default interrupt route mapping.
> +                */
> +               if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) =3D=3D 0 &&
> +                   (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) =3D=3D 0) {
> +                       for (j =3D 0; j < 8; j++) {
> +                               offset =3D TEGRA186_GPIO_INT_ROUTE_MAPPIN=
G(p, j);
> +
> +                               value =3D readl(base + offset);
> +                               value =3D BIT(port->pins) - 1;
> +                               writel(value, base + offset);
> +                       }
> +               }
> +       }
> +}
> +
>  static int tegra186_gpio_probe(struct platform_device *pdev)
>  {
>         unsigned int i, j, offset;
> @@ -464,6 +504,10 @@ static int tegra186_gpio_probe(struct platform_devic=
e *pdev)
>
>         gpio->soc =3D of_device_get_match_data(&pdev->dev);
>
> +       gpio->secure =3D devm_platform_ioremap_resource_byname(pdev, "sec=
urity");
> +       if (IS_ERR(gpio->secure))
> +               return PTR_ERR(gpio->secure);
> +
>         gpio->base =3D devm_platform_ioremap_resource_byname(pdev, "gpio"=
);
>         if (IS_ERR(gpio->base))
>                 return PTR_ERR(gpio->base);
> @@ -558,6 +602,8 @@ static int tegra186_gpio_probe(struct platform_device=
 *pdev)
>                         return -EPROBE_DEFER;
>         }
>
> +       tegra186_gpio_init_route_mapping(gpio);
> +
>         irq->map =3D devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
>                                 sizeof(*irq->map), GFP_KERNEL);
>         if (!irq->map)
> --
> 2.23.0
>

This doesn't apply without a patch that went through Greg's driver-core tre=
e.

Greg: can you provide us with an immutable branch which we can merge
into the gpio for-next tree?

Bart
