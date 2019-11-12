Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC597F919D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 15:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKLOK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 09:10:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:34614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfKLOK3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 09:10:29 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1A47206B6;
        Tue, 12 Nov 2019 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573567828;
        bh=qAoatz50iWfgEGPMod5U+smVjIUblNwMEKnzo9+UXSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JOIlM7zPNdaWsxaKxBrQsFfC5rI/gZUhTLR97HLLoN4YdXrFV01fknIwhMidT+R5S
         vqZq4OWKRUpIxJ0E6ruUhImgt9cpuDm+TMG9v5Mx2E2wZCAUPZyoBzdNtY1YJ2WOZD
         5OfEazVGXDDPHty0Fm59P7a0Ok5gDiOROyA1zO0g=
Date:   Tue, 12 Nov 2019 15:10:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: tegra186: Program interrupt route mapping
Message-ID: <20191112141026.GA1334596@kroah.com>
References: <20191108153353.3149078-1-thierry.reding@gmail.com>
 <20191108153353.3149078-2-thierry.reding@gmail.com>
 <CAMpxmJXOdHOH5tWcZXzK0gb6aEAs-d_sM-uL6fdw5eFu_5L4Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXOdHOH5tWcZXzK0gb6aEAs-d_sM-uL6fdw5eFu_5L4Ug@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 12, 2019 at 11:11:35AM +0100, Bartosz Golaszewski wrote:
> pt., 8 lis 2019 o 16:34 Thierry Reding <thierry.reding@gmail.com> napisał(a):
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The controls for the GG port on Tegra194 resides in the power partition
> > of the C5 PCIe controller and its interrupt route mapping can therefore
> > not be programmed by early boot firmware along with that of the other
> > ports.
> >
> > Detect this generically by looking at which controls have already been
> > locked down using the security registers and fill in default values for
> > controls that are unlocked.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpio/gpio-tegra186.c | 46 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> > index 32714cefdfde..404ebb82bfa2 100644
> > --- a/drivers/gpio/gpio-tegra186.c
> > +++ b/drivers/gpio/gpio-tegra186.c
> > @@ -15,6 +15,14 @@
> >  #include <dt-bindings/gpio/tegra186-gpio.h>
> >  #include <dt-bindings/gpio/tegra194-gpio.h>
> >
> > +/* security registers */
> > +#define TEGRA186_GPIO_CTL_SCR 0x0c
> > +#define  TEGRA186_GPIO_CTL_SCR_SEC_WEN BIT(28)
> > +#define  TEGRA186_GPIO_CTL_SCR_SEC_REN BIT(27)
> > +
> > +#define TEGRA186_GPIO_INT_ROUTE_MAPPING(p, x) (0x14 + (p) * 0x20 + (x) * 4)
> > +
> > +/* control registers */
> >  #define TEGRA186_GPIO_ENABLE_CONFIG 0x00
> >  #define  TEGRA186_GPIO_ENABLE_CONFIG_ENABLE BIT(0)
> >  #define  TEGRA186_GPIO_ENABLE_CONFIG_OUT BIT(1)
> > @@ -64,6 +72,7 @@ struct tegra_gpio {
> >
> >         const struct tegra_gpio_soc *soc;
> >
> > +       void __iomem *secure;
> >         void __iomem *base;
> >  };
> >
> > @@ -449,6 +458,37 @@ static const struct of_device_id tegra186_pmc_of_match[] = {
> >         { /* sentinel */ }
> >  };
> >
> > +static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
> > +{
> > +       unsigned int i, j;
> > +       u32 value;
> > +
> > +       for (i = 0; i < gpio->soc->num_ports; i++) {
> > +               const struct tegra_gpio_port *port = &gpio->soc->ports[i];
> > +               unsigned int offset, p = port->port;
> > +               void __iomem *base;
> > +
> > +               base = gpio->secure + port->bank * 0x1000 + 0x800;
> > +
> > +               value = readl(base + TEGRA186_GPIO_CTL_SCR);
> > +
> > +               /*
> > +                * For controllers that haven't been locked down yet, make
> > +                * sure to program the default interrupt route mapping.
> > +                */
> > +               if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) == 0 &&
> > +                   (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) == 0) {
> > +                       for (j = 0; j < 8; j++) {
> > +                               offset = TEGRA186_GPIO_INT_ROUTE_MAPPING(p, j);
> > +
> > +                               value = readl(base + offset);
> > +                               value = BIT(port->pins) - 1;
> > +                               writel(value, base + offset);
> > +                       }
> > +               }
> > +       }
> > +}
> > +
> >  static int tegra186_gpio_probe(struct platform_device *pdev)
> >  {
> >         unsigned int i, j, offset;
> > @@ -464,6 +504,10 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
> >
> >         gpio->soc = of_device_get_match_data(&pdev->dev);
> >
> > +       gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> > +       if (IS_ERR(gpio->secure))
> > +               return PTR_ERR(gpio->secure);
> > +
> >         gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> >         if (IS_ERR(gpio->base))
> >                 return PTR_ERR(gpio->base);
> > @@ -558,6 +602,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
> >                         return -EPROBE_DEFER;
> >         }
> >
> > +       tegra186_gpio_init_route_mapping(gpio);
> > +
> >         irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
> >                                 sizeof(*irq->map), GFP_KERNEL);
> >         if (!irq->map)
> > --
> > 2.23.0
> >
> 
> This doesn't apply without a patch that went through Greg's driver-core tree.
> 
> Greg: can you provide us with an immutable branch which we can merge
> into the gpio for-next tree?

A branch for/called what?

You can always pull from my driver-core-next branch, I never rebase it.

thanks,

greg k-h
