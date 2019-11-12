Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2123F9452
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 16:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKLPd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 10:33:26 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41504 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLPdZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 10:33:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id e9so15148804oif.8
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 07:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mp13Uaka/3Dm0dQHgYQg31nafY1gcY8PQVc9g3PvfII=;
        b=qe+6SIgPQnxevnP62PmKifdpfONbA5lKVmmqZwLGW6eZ8LI4u1HW64zb9Fdf/Pl+bu
         NG8HSNsaMwbJj3dZQkwylrwGJ0YQwRoK+qp7gNCKfATW7vr280uK2rOTJgjXUbIrGuin
         eIuQxv1hIjLxuYHdLLrqFvXjx6JJdmssIYm6Gf2XKvDYOvroqD0yunckU0Hp9vHvLx34
         31aJ7hd+//OqDVo6CjEX1zzLqx6y8nOa2+kwvIOXRolPa2u9wSts92ovDVAl9pRNZOMD
         Ti0wEUMG7Iqojq2DgRiUdtRLVLADmaCWQV6Rej/Pz+dtZoFBm2ULMezPFcxJFk+YjeNc
         XQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mp13Uaka/3Dm0dQHgYQg31nafY1gcY8PQVc9g3PvfII=;
        b=DMwO6rMaPKuDyoEuKLIly0bwpQ2Dshs7YydeosuQjpsF3LBSci1QuFwEPwalKT5ya1
         WS6N0/KFiPQ3CBt73rxWIs6flS4hzfwZ+k5qlPr8Ju769rY8l8CyfNeYt7HHTtDHnH7G
         6YSpybEBYzKFd67fntUE8zP/HCah3yNeEMODWYi49A4iFv19eZGCLv7lyYOUQ7Y3GFOI
         rUSfE63pBzoXLU/vEMWQVB+BAGTPpZr5Ue8Rbu8MMm414LLPZeuLFwA2yL308cItzte6
         xDHkbJSoWvv/uf75AZsN47CgCy1mhpL1NYsq5Q7OI2tzNdwKLd4KlEWu9i0SEe/2yr4u
         NCVA==
X-Gm-Message-State: APjAAAUkXYx5wTlC3SSyW7YuQZfORnTWOynzeYublgcBIEohUywD8QSN
        yfwdTKIvc5Z+xmtilUQ75ZFSOIPgUBANCqN/UV2TyQ==
X-Google-Smtp-Source: APXvYqxYbSiM91NWqMkkVWfYzqg6Lz9zdSeHb6ISymYzCaH6pysA5KYUSSxcaNOZCVqXm5bhIRXCLhn9mhFj/uEPwd8=
X-Received: by 2002:aca:d6d7:: with SMTP id n206mr4582558oig.147.1573572804523;
 Tue, 12 Nov 2019 07:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20191108153353.3149078-1-thierry.reding@gmail.com>
 <20191108153353.3149078-2-thierry.reding@gmail.com> <CAMpxmJXOdHOH5tWcZXzK0gb6aEAs-d_sM-uL6fdw5eFu_5L4Ug@mail.gmail.com>
 <20191112141026.GA1334596@kroah.com>
In-Reply-To: <20191112141026.GA1334596@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 16:33:13 +0100
Message-ID: <CAMpxmJV0L-n7Rgr+HeXBO+DG=r4p-17ZcD3XTNsU_PayePQj1g@mail.gmail.com>
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

wt., 12 lis 2019 o 15:10 Greg KH <gregkh@linuxfoundation.org> napisa=C5=82(=
a):
>
> On Tue, Nov 12, 2019 at 11:11:35AM +0100, Bartosz Golaszewski wrote:
> > pt., 8 lis 2019 o 16:34 Thierry Reding <thierry.reding@gmail.com> napis=
a=C5=82(a):
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The controls for the GG port on Tegra194 resides in the power partiti=
on
> > > of the C5 PCIe controller and its interrupt route mapping can therefo=
re
> > > not be programmed by early boot firmware along with that of the other
> > > ports.
> > >
> > > Detect this generically by looking at which controls have already bee=
n
> > > locked down using the security registers and fill in default values f=
or
> > > controls that are unlocked.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/gpio/gpio-tegra186.c | 46 ++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 46 insertions(+)
> > >
> > > diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra18=
6.c
> > > index 32714cefdfde..404ebb82bfa2 100644
> > > --- a/drivers/gpio/gpio-tegra186.c
> > > +++ b/drivers/gpio/gpio-tegra186.c
> > > @@ -15,6 +15,14 @@
> > >  #include <dt-bindings/gpio/tegra186-gpio.h>
> > >  #include <dt-bindings/gpio/tegra194-gpio.h>
> > >
> > > +/* security registers */
> > > +#define TEGRA186_GPIO_CTL_SCR 0x0c
> > > +#define  TEGRA186_GPIO_CTL_SCR_SEC_WEN BIT(28)
> > > +#define  TEGRA186_GPIO_CTL_SCR_SEC_REN BIT(27)
> > > +
> > > +#define TEGRA186_GPIO_INT_ROUTE_MAPPING(p, x) (0x14 + (p) * 0x20 + (=
x) * 4)
> > > +
> > > +/* control registers */
> > >  #define TEGRA186_GPIO_ENABLE_CONFIG 0x00
> > >  #define  TEGRA186_GPIO_ENABLE_CONFIG_ENABLE BIT(0)
> > >  #define  TEGRA186_GPIO_ENABLE_CONFIG_OUT BIT(1)
> > > @@ -64,6 +72,7 @@ struct tegra_gpio {
> > >
> > >         const struct tegra_gpio_soc *soc;
> > >
> > > +       void __iomem *secure;
> > >         void __iomem *base;
> > >  };
> > >
> > > @@ -449,6 +458,37 @@ static const struct of_device_id tegra186_pmc_of=
_match[] =3D {
> > >         { /* sentinel */ }
> > >  };
> > >
> > > +static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio=
)
> > > +{
> > > +       unsigned int i, j;
> > > +       u32 value;
> > > +
> > > +       for (i =3D 0; i < gpio->soc->num_ports; i++) {
> > > +               const struct tegra_gpio_port *port =3D &gpio->soc->po=
rts[i];
> > > +               unsigned int offset, p =3D port->port;
> > > +               void __iomem *base;
> > > +
> > > +               base =3D gpio->secure + port->bank * 0x1000 + 0x800;
> > > +
> > > +               value =3D readl(base + TEGRA186_GPIO_CTL_SCR);
> > > +
> > > +               /*
> > > +                * For controllers that haven't been locked down yet,=
 make
> > > +                * sure to program the default interrupt route mappin=
g.
> > > +                */
> > > +               if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) =3D=3D 0 =
&&
> > > +                   (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) =3D=3D 0)=
 {
> > > +                       for (j =3D 0; j < 8; j++) {
> > > +                               offset =3D TEGRA186_GPIO_INT_ROUTE_MA=
PPING(p, j);
> > > +
> > > +                               value =3D readl(base + offset);
> > > +                               value =3D BIT(port->pins) - 1;
> > > +                               writel(value, base + offset);
> > > +                       }
> > > +               }
> > > +       }
> > > +}
> > > +
> > >  static int tegra186_gpio_probe(struct platform_device *pdev)
> > >  {
> > >         unsigned int i, j, offset;
> > > @@ -464,6 +504,10 @@ static int tegra186_gpio_probe(struct platform_d=
evice *pdev)
> > >
> > >         gpio->soc =3D of_device_get_match_data(&pdev->dev);
> > >
> > > +       gpio->secure =3D devm_platform_ioremap_resource_byname(pdev, =
"security");
> > > +       if (IS_ERR(gpio->secure))
> > > +               return PTR_ERR(gpio->secure);
> > > +
> > >         gpio->base =3D devm_platform_ioremap_resource_byname(pdev, "g=
pio");
> > >         if (IS_ERR(gpio->base))
> > >                 return PTR_ERR(gpio->base);
> > > @@ -558,6 +602,8 @@ static int tegra186_gpio_probe(struct platform_de=
vice *pdev)
> > >                         return -EPROBE_DEFER;
> > >         }
> > >
> > > +       tegra186_gpio_init_route_mapping(gpio);
> > > +
> > >         irq->map =3D devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
> > >                                 sizeof(*irq->map), GFP_KERNEL);
> > >         if (!irq->map)
> > > --
> > > 2.23.0
> > >
> >
> > This doesn't apply without a patch that went through Greg's driver-core=
 tree.
> >
> > Greg: can you provide us with an immutable branch which we can merge
> > into the gpio for-next tree?
>
> A branch for/called what?
>
> You can always pull from my driver-core-next branch, I never rebase it.
>

That works for me - thanks!

Bart

> thanks,
>
> greg k-h
