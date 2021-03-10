Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C2F3345B3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 18:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhCJRvS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 12:51:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:54024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233392AbhCJRvM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 12:51:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDEDC64F88;
        Wed, 10 Mar 2021 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615398672;
        bh=IXYtkxw4YxxzJb8bBxiyfhf2vxtgBL23FMyEgIBL6cQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HTqKhyzJkdKyZWTszFooIsRMpuKXrf0+aajG42IeYp0Keqf4G/8Bb+Tg0D64gjXBx
         lVGkn+wu+gwzp3MmeCG+Jpe0RFGfcYewwKjo+99PTmQgzSQI6k1Fy98ujJrlnBGQbQ
         GHKYYsEn8iEEdOx1mh8VwfHqEov0e82BJZ3uQ9gBVNB++0IqabxILFLFOkREwGhYru
         3hllMYX5JO54OLGNyun1d2l8xH2nyzQIdoeojzsLB9wvdk3PORirzdbdFKLZylRbCw
         +NXwQXq+pz8atFrnymEoAmQQ17mKlkG8swzTbjZFGHLi52+CFfBPn/acBMkageiiPb
         HJzuuYgZpX1Gg==
Received: by mail-ed1-f48.google.com with SMTP id m9so29354657edd.5;
        Wed, 10 Mar 2021 09:51:11 -0800 (PST)
X-Gm-Message-State: AOAM530z6wEFRj0+y2ghWAJjj47T4DT7FwoNSc0ALRaRdAk2SeK609SU
        nv4PZGxBAK5rfHio5dAH0kB+xJUo9L7E6wutXg==
X-Google-Smtp-Source: ABdhPJzKhhIznTU3OS9uuak2vleawCsQk7YgPxNPWOlhpj8EFUQn1NL9/MglB36rqktTpvhAqPgb4qwsuqw3LLvX0WQ=
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr4622103edr.165.1615398670387;
 Wed, 10 Mar 2021 09:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-4-noltari@gmail.com>
In-Reply-To: <20210310125504.31886-4-noltari@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Mar 2021 10:50:58 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com>
Message-ID: <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add a helper for registering BCM63XX pin controllers.

Comments below based on my binding changes suggested.

>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  v6: add changes suggested by Andy Shevchenko
>  v5: add changes suggested by Andy Shevchenko
>  v4: drop IRQ selects from Kconfig and add missing of_node_put()
>  v3: add new patch with shared code
>
>  drivers/pinctrl/bcm/Kconfig           |   7 ++
>  drivers/pinctrl/bcm/Makefile          |   1 +
>  drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 113 ++++++++++++++++++++++++++
>  drivers/pinctrl/bcm/pinctrl-bcm63xx.h |  43 ++++++++++
>  4 files changed, 164 insertions(+)
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.c
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.h
>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 0ed14de0134c..882f19bdc243 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -29,6 +29,13 @@ config PINCTRL_BCM2835
>         help
>            Say Y here to enable the Broadcom BCM2835 GPIO driver.
>
> +config PINCTRL_BCM63XX
> +       bool
> +       select GENERIC_PINCONF
> +       select GPIO_REGMAP
> +       select PINCONF
> +       select PINMUX
> +
>  config PINCTRL_IPROC_GPIO
>         bool "Broadcom iProc GPIO (with PINCONF) driver"
>         depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
> index 79d5e49fdd9a..0e3cf9b15c65 100644
> --- a/drivers/pinctrl/bcm/Makefile
> +++ b/drivers/pinctrl/bcm/Makefile
> @@ -3,6 +3,7 @@
>
>  obj-$(CONFIG_PINCTRL_BCM281XX)         +=3D pinctrl-bcm281xx.o
>  obj-$(CONFIG_PINCTRL_BCM2835)          +=3D pinctrl-bcm2835.o
> +obj-$(CONFIG_PINCTRL_BCM63XX)          +=3D pinctrl-bcm63xx.o
>  obj-$(CONFIG_PINCTRL_IPROC_GPIO)       +=3D pinctrl-iproc-gpio.o
>  obj-$(CONFIG_PINCTRL_CYGNUS_MUX)       +=3D pinctrl-cygnus-mux.o
>  obj-$(CONFIG_PINCTRL_NS)               +=3D pinctrl-ns.o
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm/=
pinctrl-bcm63xx.c
> new file mode 100644
> index 000000000000..2eaac8e6f79f
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for BCM63xx GPIO unit (pinctrl + GPIO)
> + *
> + * Copyright (C) 2021 =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.co=
m>
> + * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
> + */
> +
> +#include <linux/gpio/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-bcm63xx.h"
> +
> +#define BCM63XX_BANK_SIZE      4
> +
> +#define BCM63XX_DIROUT_REG     0x04
> +#define BCM63XX_DATA_REG       0x0c
> +
> +static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
> +                                 unsigned int base, unsigned int offset,
> +                                 unsigned int *reg, unsigned int *mask)
> +{
> +       unsigned int line =3D offset % BCM63XX_BANK_GPIOS;
> +       unsigned int stride =3D offset / BCM63XX_BANK_GPIOS;
> +
> +       *reg =3D base - stride * BCM63XX_BANK_SIZE;
> +       *mask =3D BIT(line);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id bcm63xx_gpio_of_match[] =3D {
> +       { .compatible =3D "brcm,bcm6318-gpio", },
> +       { .compatible =3D "brcm,bcm6328-gpio", },
> +       { .compatible =3D "brcm,bcm6358-gpio", },
> +       { .compatible =3D "brcm,bcm6362-gpio", },
> +       { .compatible =3D "brcm,bcm6368-gpio", },
> +       { .compatible =3D "brcm,bcm63268-gpio", },

All these would be moved to gpio-mmio.c (or maybe that can have a
fallback compatible?).

> +       { /* sentinel */ }
> +};
> +
> +static int bcm63xx_gpio_probe(struct device *dev,
> +                             struct fwnode_handle *node,
> +                             const struct bcm63xx_pinctrl_soc *soc,
> +                             struct bcm63xx_pinctrl *pc)
> +{
> +       struct gpio_regmap_config grc =3D {0};
> +
> +       grc.parent =3D dev;
> +       grc.fwnode =3D node;
> +       grc.ngpio =3D soc->ngpios;
> +       grc.ngpio_per_reg =3D BCM63XX_BANK_GPIOS;
> +       grc.regmap =3D pc->regs;
> +       grc.reg_mask_xlate =3D bcm63xx_reg_mask_xlate;
> +
> +       if (fwnode_property_read_u32(node, "data", &grc.reg_dat_base))
> +               grc.reg_dat_base =3D BCM63XX_DATA_REG;
> +       grc.reg_set_base =3D grc.reg_dat_base;
> +
> +       if (fwnode_property_read_u32(node, "dirout", &grc.reg_dir_out_bas=
e))
> +               grc.reg_dir_out_base =3D BCM63XX_DIROUT_REG;
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &grc));
> +}

This function can go.

> +
> +int bcm63xx_pinctrl_probe(struct platform_device *pdev,
> +                         const struct bcm63xx_pinctrl_soc *soc,
> +                         void *driver_data)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct bcm63xx_pinctrl *pc;
> +       struct fwnode_handle *node;
> +       int err;
> +
> +       pc =3D devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
> +       if (!pc)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, pc);
> +
> +       pc->dev =3D dev;
> +       pc->driver_data =3D driver_data;
> +
> +       pc->regs =3D syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(pc->regs))
> +               return PTR_ERR(pc->regs);
> +
> +       pc->pctl_desc.name =3D dev_name(dev);
> +       pc->pctl_desc.pins =3D soc->pins;
> +       pc->pctl_desc.npins =3D soc->npins;
> +       pc->pctl_desc.pctlops =3D soc->pctl_ops;
> +       pc->pctl_desc.pmxops =3D soc->pmx_ops;
> +       pc->pctl_desc.owner =3D THIS_MODULE;
> +
> +       pc->pctl_dev =3D devm_pinctrl_register(dev, &pc->pctl_desc, pc);
> +       if (IS_ERR(pc->pctl_dev))
> +               return PTR_ERR(pc->pctl_dev);
> +
> +       device_for_each_child_node(dev, node) {
> +               if (of_match_node(bcm63xx_gpio_of_match, to_of_node(node)=
)) {
> +                       err =3D bcm63xx_gpio_probe(dev, node, soc, pc);

This would just need an of_platform_populate call.

> +                       if (err) {
> +                               dev_err(dev, "could not add GPIO chip\n")=
;
> +                               fwnode_handle_put(node);
> +                               return err;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/=
pinctrl-bcm63xx.h
> new file mode 100644
> index 000000000000..3bdb50021f1b
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2021 =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.co=
m>
> + * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
> + */
> +
> +#ifndef __PINCTRL_BCM63XX_H__
> +#define __PINCTRL_BCM63XX_H__
> +
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#define BCM63XX_BANK_GPIOS 32
> +
> +struct bcm63xx_pinctrl_soc {
> +       struct pinctrl_ops *pctl_ops;
> +       struct pinmux_ops *pmx_ops;
> +
> +       const struct pinctrl_pin_desc *pins;
> +       unsigned npins;
> +
> +       unsigned int ngpios;
> +};
> +
> +struct bcm63xx_pinctrl {
> +       struct device *dev;
> +       struct regmap *regs;
> +
> +       struct pinctrl_desc pctl_desc;
> +       struct pinctrl_dev *pctl_dev;
> +
> +       void *driver_data;
> +};
> +
> +static inline unsigned int bcm63xx_bank_pin(unsigned int pin)
> +{
> +       return pin % BCM63XX_BANK_GPIOS;
> +}
> +
> +int bcm63xx_pinctrl_probe(struct platform_device *pdev,
> +                         const struct bcm63xx_pinctrl_soc *soc,
> +                         void *driver_data);
> +
> +#endif /* __PINCTRL_BCM63XX_H__ */
> --
> 2.20.1
>
