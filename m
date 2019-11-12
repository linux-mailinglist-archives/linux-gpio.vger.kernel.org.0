Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2424F9454
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 16:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfKLPeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 10:34:00 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45425 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfKLPeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 10:34:00 -0500
Received: by mail-oi1-f193.google.com with SMTP id 14so9155652oir.12
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BnLJ4A/3xXtxupVxRE4VXyH1Aw9p8eRgaRUeBXpl3SI=;
        b=BniZxVUyz0oi7I8JhKex30EF5+HvwbM4xgM6l6aXdqeumU9mS6obivfuZXj4+1fdGo
         uFkkWv2MZCZxMTB0pfTpnK+fs9JgEETg8rSuQLea8l2vS+AKhOvJpTtUGZms8Cv2SFF1
         DvSQWTuaKm80CIeGxUUq3/PHZk8PJzH6RPppPnyK2peBGdhu8yQSXJxVX5W2J3iiAFoS
         /RmvGfXxsbjNwWeQsJHIYPPfzHQkLnrLJQnCMZ8kP2y1kLzcMZPhrqR707nQdj8OKNSN
         uC8QwhJ67350apbFHhLMWCSXpkKgGD5vT1Y+Bdg2dKuAZMiUZSBCoi/zQNoPH8sKFeAB
         SOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BnLJ4A/3xXtxupVxRE4VXyH1Aw9p8eRgaRUeBXpl3SI=;
        b=cVOqwgdhgQmvNvGnsgepbOZ0htY1lHXrXj8SZ6epgnxOiRp8rZy7XfvJHMLxTxN6eY
         jxhj1fLsS+BPozTC2BljKPLt3+tMfEN5Rf9zhNDHzj3+hSXCwzhZHqy0uhARzzrcWsYG
         mt1hFNm6xrvmjSKazXRcFq1ZGKiFi9d0XDFLeXC0258Sd8MnIG6rL3q2sjMT/81xmGam
         WvOAXuiCv6pFuK95te1pDlo8bk5MKYDmZ37+omDvTqrwteBXa169sUVwdUFRU2kHYbW4
         XEV6Lhbbi0ghbGclOphLDRzvAIt64ecaenHELxGXh7tkVZd2MfyHi0Qmhy7CGyTd7sUm
         SpBw==
X-Gm-Message-State: APjAAAUhhbvzg3mgInAgxV+IUbODdOz0eksPnSxmFnjQXtZpWaPTJrdD
        WFDxPr1nPF1TLjwPHD0oKxQzJEB8ZyFg416ozqA+DA==
X-Google-Smtp-Source: APXvYqz9638snpoESyJ3D18g0E4QQ1j9xSwAXMhaJuiG3dV5exLCvpWZigrVXFS7VeMkaN5n2gDHWBelJGFJ0uAFE2k=
X-Received: by 2002:aca:451:: with SMTP id 78mr4660325oie.170.1573572838557;
 Tue, 12 Nov 2019 07:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20191108153353.3149078-1-thierry.reding@gmail.com>
In-Reply-To: <20191108153353.3149078-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 16:33:47 +0100
Message-ID: <CAMpxmJU+iHwDr9Hb_KH=K_LHpOMTepcgZckhYHDVRg2WchSh_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tegra186: Derive register offsets from bank/port
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

pt., 8 lis 2019 o 16:33 Thierry Reding <thierry.reding@gmail.com> napisa=C5=
=82(a):
>
> From: Thierry Reding <treding@nvidia.com>
>
> The register offsets for a given bank and port can be easily derived
> from the bank and port indices. Update the port descriptors to list only
> the bank and port numbers to simplify this.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 195 ++++++++++++++++++-----------------
>  1 file changed, 100 insertions(+), 95 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 0cc3f781592d..32714cefdfde 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -44,9 +44,9 @@
>
>  struct tegra_gpio_port {
>         const char *name;
> -       unsigned int offset;
> +       unsigned int bank;
> +       unsigned int port;
>         unsigned int pins;
> -       unsigned int irq;
>  };
>
>  struct tegra_gpio_soc {
> @@ -90,12 +90,15 @@ static void __iomem *tegra186_gpio_get_base(struct te=
gra_gpio *gpio,
>                                             unsigned int pin)
>  {
>         const struct tegra_gpio_port *port;
> +       unsigned int offset;
>
>         port =3D tegra186_gpio_get_port(gpio, &pin);
>         if (!port)
>                 return NULL;
>
> -       return gpio->base + port->offset + pin * 0x20;
> +       offset =3D port->bank * 0x1000 + port->port * 0x200;
> +
> +       return gpio->base + offset + pin * 0x20;
>  }
>
>  static int tegra186_gpio_get_direction(struct gpio_chip *chip,
> @@ -343,12 +346,14 @@ static void tegra186_gpio_irq(struct irq_desc *desc=
)
>
>         for (i =3D 0; i < gpio->soc->num_ports; i++) {
>                 const struct tegra_gpio_port *port =3D &gpio->soc->ports[=
i];
> -               void __iomem *base =3D gpio->base + port->offset;
>                 unsigned int pin, irq;
>                 unsigned long value;
> +               void __iomem *base;
> +
> +               base =3D gpio->base + port->bank * 0x1000 + port->port * =
0x200;
>
> -               /* skip ports that are not associated with this controlle=
r */
> -               if (parent !=3D gpio->irq[port->irq])
> +               /* skip ports that are not associated with this bank */
> +               if (parent !=3D gpio->irq[port->bank])
>                         goto skip;
>
>                 value =3D readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1))=
;
> @@ -562,7 +567,7 @@ static int tegra186_gpio_probe(struct platform_device=
 *pdev)
>                 const struct tegra_gpio_port *port =3D &gpio->soc->ports[=
i];
>
>                 for (j =3D 0; j < port->pins; j++)
> -                       irq->map[offset + j] =3D irq->parents[port->irq];
> +                       irq->map[offset + j] =3D irq->parents[port->bank]=
;
>
>                 offset +=3D port->pins;
>         }
> @@ -581,38 +586,38 @@ static int tegra186_gpio_remove(struct platform_dev=
ice *pdev)
>         return 0;
>  }
>
> -#define TEGRA186_MAIN_GPIO_PORT(port, base, count, controller) \
> -       [TEGRA186_MAIN_GPIO_PORT_##port] =3D {                    \
> -               .name =3D #port,                                  \
> -               .offset =3D base,                                 \
> -               .pins =3D count,                                  \
> -               .irq =3D controller,                              \
> +#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)    \
> +       [TEGRA186_MAIN_GPIO_PORT_##_name] =3D {                   \
> +               .name =3D #_name,                                 \
> +               .bank =3D _bank,                                  \
> +               .port =3D _port,                                  \
> +               .pins =3D _pins,                                  \
>         }
>
>  static const struct tegra_gpio_port tegra186_main_ports[] =3D {
> -       TEGRA186_MAIN_GPIO_PORT( A, 0x2000, 7, 2),
> -       TEGRA186_MAIN_GPIO_PORT( B, 0x3000, 7, 3),
> -       TEGRA186_MAIN_GPIO_PORT( C, 0x3200, 7, 3),
> -       TEGRA186_MAIN_GPIO_PORT( D, 0x3400, 6, 3),
> -       TEGRA186_MAIN_GPIO_PORT( E, 0x2200, 8, 2),
> -       TEGRA186_MAIN_GPIO_PORT( F, 0x2400, 6, 2),
> -       TEGRA186_MAIN_GPIO_PORT( G, 0x4200, 6, 4),
> -       TEGRA186_MAIN_GPIO_PORT( H, 0x1000, 7, 1),
> -       TEGRA186_MAIN_GPIO_PORT( I, 0x0800, 8, 0),
> -       TEGRA186_MAIN_GPIO_PORT( J, 0x5000, 8, 5),
> -       TEGRA186_MAIN_GPIO_PORT( K, 0x5200, 1, 5),
> -       TEGRA186_MAIN_GPIO_PORT( L, 0x1200, 8, 1),
> -       TEGRA186_MAIN_GPIO_PORT( M, 0x5600, 6, 5),
> -       TEGRA186_MAIN_GPIO_PORT( N, 0x0000, 7, 0),
> -       TEGRA186_MAIN_GPIO_PORT( O, 0x0200, 4, 0),
> -       TEGRA186_MAIN_GPIO_PORT( P, 0x4000, 7, 4),
> -       TEGRA186_MAIN_GPIO_PORT( Q, 0x0400, 6, 0),
> -       TEGRA186_MAIN_GPIO_PORT( R, 0x0a00, 6, 0),
> -       TEGRA186_MAIN_GPIO_PORT( T, 0x0600, 4, 0),
> -       TEGRA186_MAIN_GPIO_PORT( X, 0x1400, 8, 1),
> -       TEGRA186_MAIN_GPIO_PORT( Y, 0x1600, 7, 1),
> -       TEGRA186_MAIN_GPIO_PORT(BB, 0x2600, 2, 2),
> -       TEGRA186_MAIN_GPIO_PORT(CC, 0x5400, 4, 5),
> +       TEGRA186_MAIN_GPIO_PORT( A, 2, 0, 7),
> +       TEGRA186_MAIN_GPIO_PORT( B, 3, 0, 7),
> +       TEGRA186_MAIN_GPIO_PORT( C, 3, 1, 7),
> +       TEGRA186_MAIN_GPIO_PORT( D, 3, 2, 6),
> +       TEGRA186_MAIN_GPIO_PORT( E, 2, 1, 8),
> +       TEGRA186_MAIN_GPIO_PORT( F, 2, 2, 6),
> +       TEGRA186_MAIN_GPIO_PORT( G, 4, 1, 6),
> +       TEGRA186_MAIN_GPIO_PORT( H, 1, 0, 7),
> +       TEGRA186_MAIN_GPIO_PORT( I, 0, 4, 8),
> +       TEGRA186_MAIN_GPIO_PORT( J, 5, 0, 8),
> +       TEGRA186_MAIN_GPIO_PORT( K, 5, 1, 1),
> +       TEGRA186_MAIN_GPIO_PORT( L, 1, 1, 8),
> +       TEGRA186_MAIN_GPIO_PORT( M, 5, 3, 6),
> +       TEGRA186_MAIN_GPIO_PORT( N, 0, 0, 7),
> +       TEGRA186_MAIN_GPIO_PORT( O, 0, 1, 4),
> +       TEGRA186_MAIN_GPIO_PORT( P, 4, 0, 7),
> +       TEGRA186_MAIN_GPIO_PORT( Q, 0, 2, 6),
> +       TEGRA186_MAIN_GPIO_PORT( R, 0, 5, 6),
> +       TEGRA186_MAIN_GPIO_PORT( T, 0, 3, 4),
> +       TEGRA186_MAIN_GPIO_PORT( X, 1, 2, 8),
> +       TEGRA186_MAIN_GPIO_PORT( Y, 1, 3, 7),
> +       TEGRA186_MAIN_GPIO_PORT(BB, 2, 3, 2),
> +       TEGRA186_MAIN_GPIO_PORT(CC, 5, 2, 4),
>  };
>
>  static const struct tegra_gpio_soc tegra186_main_soc =3D {
> @@ -622,23 +627,23 @@ static const struct tegra_gpio_soc tegra186_main_so=
c =3D {
>         .instance =3D 0,
>  };
>
> -#define TEGRA186_AON_GPIO_PORT(port, base, count, controller)  \
> -       [TEGRA186_AON_GPIO_PORT_##port] =3D {                     \
> -               .name =3D #port,                                  \
> -               .offset =3D base,                                 \
> -               .pins =3D count,                                  \
> -               .irq =3D controller,                              \
> +#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> +       [TEGRA186_AON_GPIO_PORT_##_name] =3D {                    \
> +               .name =3D #_name,                                 \
> +               .bank =3D _bank,                                  \
> +               .port =3D _port,                                  \
> +               .pins =3D _pins,                                  \
>         }
>
>  static const struct tegra_gpio_port tegra186_aon_ports[] =3D {
> -       TEGRA186_AON_GPIO_PORT( S, 0x0200, 5, 0),
> -       TEGRA186_AON_GPIO_PORT( U, 0x0400, 6, 0),
> -       TEGRA186_AON_GPIO_PORT( V, 0x0800, 8, 0),
> -       TEGRA186_AON_GPIO_PORT( W, 0x0a00, 8, 0),
> -       TEGRA186_AON_GPIO_PORT( Z, 0x0e00, 4, 0),
> -       TEGRA186_AON_GPIO_PORT(AA, 0x0c00, 8, 0),
> -       TEGRA186_AON_GPIO_PORT(EE, 0x0600, 3, 0),
> -       TEGRA186_AON_GPIO_PORT(FF, 0x0000, 5, 0),
> +       TEGRA186_AON_GPIO_PORT( S, 0, 1, 5),
> +       TEGRA186_AON_GPIO_PORT( U, 0, 2, 6),
> +       TEGRA186_AON_GPIO_PORT( V, 0, 4, 8),
> +       TEGRA186_AON_GPIO_PORT( W, 0, 5, 8),
> +       TEGRA186_AON_GPIO_PORT( Z, 0, 7, 4),
> +       TEGRA186_AON_GPIO_PORT(AA, 0, 6, 8),
> +       TEGRA186_AON_GPIO_PORT(EE, 0, 3, 3),
> +       TEGRA186_AON_GPIO_PORT(FF, 0, 0, 5),
>  };
>
>  static const struct tegra_gpio_soc tegra186_aon_soc =3D {
> @@ -648,43 +653,43 @@ static const struct tegra_gpio_soc tegra186_aon_soc=
 =3D {
>         .instance =3D 1,
>  };
>
> -#define TEGRA194_MAIN_GPIO_PORT(port, base, count, controller) \
> -       [TEGRA194_MAIN_GPIO_PORT_##port] =3D {                    \
> -               .name =3D #port,                                  \
> -               .offset =3D base,                                 \
> -               .pins =3D count,                                  \
> -               .irq =3D controller,                              \
> +#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)    \
> +       [TEGRA194_MAIN_GPIO_PORT_##_name] =3D {                   \
> +               .name =3D #_name,                                 \
> +               .bank =3D _bank,                                  \
> +               .port =3D _port,                                  \
> +               .pins =3D _pins,                                  \
>         }
>
>  static const struct tegra_gpio_port tegra194_main_ports[] =3D {
> -       TEGRA194_MAIN_GPIO_PORT( A, 0x1400, 8, 1),
> -       TEGRA194_MAIN_GPIO_PORT( B, 0x4e00, 2, 4),
> -       TEGRA194_MAIN_GPIO_PORT( C, 0x4600, 8, 4),
> -       TEGRA194_MAIN_GPIO_PORT( D, 0x4800, 4, 4),
> -       TEGRA194_MAIN_GPIO_PORT( E, 0x4a00, 8, 4),
> -       TEGRA194_MAIN_GPIO_PORT( F, 0x4c00, 6, 4),
> -       TEGRA194_MAIN_GPIO_PORT( G, 0x4000, 8, 4),
> -       TEGRA194_MAIN_GPIO_PORT( H, 0x4200, 8, 4),
> -       TEGRA194_MAIN_GPIO_PORT( I, 0x4400, 5, 4),
> -       TEGRA194_MAIN_GPIO_PORT( J, 0x5200, 6, 5),
> -       TEGRA194_MAIN_GPIO_PORT( K, 0x3000, 8, 3),
> -       TEGRA194_MAIN_GPIO_PORT( L, 0x3200, 4, 3),
> -       TEGRA194_MAIN_GPIO_PORT( M, 0x2600, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT( N, 0x2800, 3, 2),
> -       TEGRA194_MAIN_GPIO_PORT( O, 0x5000, 6, 5),
> -       TEGRA194_MAIN_GPIO_PORT( P, 0x2a00, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT( Q, 0x2c00, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT( R, 0x2e00, 6, 2),
> -       TEGRA194_MAIN_GPIO_PORT( S, 0x3600, 8, 3),
> -       TEGRA194_MAIN_GPIO_PORT( T, 0x3800, 8, 3),
> -       TEGRA194_MAIN_GPIO_PORT( U, 0x3a00, 1, 3),
> -       TEGRA194_MAIN_GPIO_PORT( V, 0x1000, 8, 1),
> -       TEGRA194_MAIN_GPIO_PORT( W, 0x1200, 2, 1),
> -       TEGRA194_MAIN_GPIO_PORT( X, 0x2000, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT( Y, 0x2200, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT( Z, 0x2400, 8, 2),
> -       TEGRA194_MAIN_GPIO_PORT(FF, 0x3400, 2, 3),
> -       TEGRA194_MAIN_GPIO_PORT(GG, 0x0000, 2, 0)
> +       TEGRA194_MAIN_GPIO_PORT( A, 1, 2, 8),
> +       TEGRA194_MAIN_GPIO_PORT( B, 4, 7, 2),
> +       TEGRA194_MAIN_GPIO_PORT( C, 4, 3, 8),
> +       TEGRA194_MAIN_GPIO_PORT( D, 4, 4, 4),
> +       TEGRA194_MAIN_GPIO_PORT( E, 4, 5, 8),
> +       TEGRA194_MAIN_GPIO_PORT( F, 4, 6, 6),
> +       TEGRA194_MAIN_GPIO_PORT( G, 4, 0, 8),
> +       TEGRA194_MAIN_GPIO_PORT( H, 4, 1, 8),
> +       TEGRA194_MAIN_GPIO_PORT( I, 4, 2, 5),
> +       TEGRA194_MAIN_GPIO_PORT( J, 5, 1, 6),
> +       TEGRA194_MAIN_GPIO_PORT( K, 3, 0, 8),
> +       TEGRA194_MAIN_GPIO_PORT( L, 3, 1, 4),
> +       TEGRA194_MAIN_GPIO_PORT( M, 2, 3, 8),
> +       TEGRA194_MAIN_GPIO_PORT( N, 2, 4, 3),
> +       TEGRA194_MAIN_GPIO_PORT( O, 5, 0, 6),
> +       TEGRA194_MAIN_GPIO_PORT( P, 2, 5, 8),
> +       TEGRA194_MAIN_GPIO_PORT( Q, 2, 6, 8),
> +       TEGRA194_MAIN_GPIO_PORT( R, 2, 7, 6),
> +       TEGRA194_MAIN_GPIO_PORT( S, 3, 3, 8),
> +       TEGRA194_MAIN_GPIO_PORT( T, 3, 4, 8),
> +       TEGRA194_MAIN_GPIO_PORT( U, 3, 5, 1),
> +       TEGRA194_MAIN_GPIO_PORT( V, 1, 0, 8),
> +       TEGRA194_MAIN_GPIO_PORT( W, 1, 1, 2),
> +       TEGRA194_MAIN_GPIO_PORT( X, 2, 0, 8),
> +       TEGRA194_MAIN_GPIO_PORT( Y, 2, 1, 8),
> +       TEGRA194_MAIN_GPIO_PORT( Z, 2, 2, 8),
> +       TEGRA194_MAIN_GPIO_PORT(FF, 3, 2, 2),
> +       TEGRA194_MAIN_GPIO_PORT(GG, 0, 0, 2)
>  };
>
>  static const struct tegra_gpio_soc tegra194_main_soc =3D {
> @@ -694,20 +699,20 @@ static const struct tegra_gpio_soc tegra194_main_so=
c =3D {
>         .instance =3D 0,
>  };
>
> -#define TEGRA194_AON_GPIO_PORT(port, base, count, controller)  \
> -       [TEGRA194_AON_GPIO_PORT_##port] =3D {                     \
> -               .name =3D #port,                                  \
> -               .offset =3D base,                                 \
> -               .pins =3D count,                                  \
> -               .irq =3D controller,                              \
> +#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> +       [TEGRA194_AON_GPIO_PORT_##_name] =3D {                    \
> +               .name =3D #_name,                                 \
> +               .bank =3D _bank,                                  \
> +               .port =3D _port,                                  \
> +               .pins =3D _pins,                                  \
>         }
>
>  static const struct tegra_gpio_port tegra194_aon_ports[] =3D {
> -       TEGRA194_AON_GPIO_PORT(AA, 0x0600, 8, 0),
> -       TEGRA194_AON_GPIO_PORT(BB, 0x0800, 4, 0),
> -       TEGRA194_AON_GPIO_PORT(CC, 0x0200, 8, 0),
> -       TEGRA194_AON_GPIO_PORT(DD, 0x0400, 3, 0),
> -       TEGRA194_AON_GPIO_PORT(EE, 0x0000, 7, 0)
> +       TEGRA194_AON_GPIO_PORT(AA, 0, 3, 8),
> +       TEGRA194_AON_GPIO_PORT(BB, 0, 4, 4),
> +       TEGRA194_AON_GPIO_PORT(CC, 0, 1, 8),
> +       TEGRA194_AON_GPIO_PORT(DD, 0, 2, 3),
> +       TEGRA194_AON_GPIO_PORT(EE, 0, 0, 7)
>  };
>
>  static const struct tegra_gpio_soc tegra194_aon_soc =3D {
> --
> 2.23.0
>

All three applied, thanks!

Bartosz
