Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C292333FF0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 15:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhCJOIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 09:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhCJOHa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 09:07:30 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C902DC061761;
        Wed, 10 Mar 2021 06:07:30 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id g4so11480190pgj.0;
        Wed, 10 Mar 2021 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e+GrZGjS+EgPMWnE/4rkQTpHRSyB8xaHRSvFe1ylNog=;
        b=bGLUt7jgIW9RtpRt0FMLQOES5GSkrdBG9HyFpzofe1O+F2yBHMRBicIW2d0CxZnbuK
         fForKm1YLlNmkzuW8buesuplEpRHU7UrKscJHTe3e0jnlsCHa++0eJdVoOcWRU9/Utsn
         Fg7+HAgKSYOkLpFPLEwKqLIuggwvJ35LEyluhQXZF3SXCSoFYbIEUJbfnkQf953B07AP
         2DTIbK0f1M8bQn2GBc321J3HdO8eqIltOXaQLBfofO8+LPwxda5cToc22APaN9TrVCUu
         hHI3p3PDa/6Awq/dinPznovXi2ht2oSZXe/4n5Ow+SIL7zqgDpAoS5q7Rpx4UY7leMrC
         iEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e+GrZGjS+EgPMWnE/4rkQTpHRSyB8xaHRSvFe1ylNog=;
        b=SXVJbwcdrEWcMnqW+NB2f1u1nB0CtwFD3PS5EX00Cf7vZvc7nTkvBTcfQWamYkTu8h
         JyNqZKVzvvMZ8Mk6D4zqYnGnxkO8rz8zhNgfj9Buav4ZcZAe2J3ZJBdb6gseEFnGS6Ig
         b33lgk1G/tjg76O2c8juvZgobExBFMKzPMKr7aHy/7CpPLb9YxLXy5fjN1KbKWSkgu+r
         S7RnaxGDVGCcAHb2P6Ah28Khmg4Hg9smCLES4XO/f2tdAOwdX3pbWXjpuSKZLPUKS757
         8atGBW9Bu+O9pSR0GPpv9H3vx/gQ5W0CazVPbnpSMxnUWCyOmvmmhQokGw9UX/DMr2U6
         fp2g==
X-Gm-Message-State: AOAM531kbqAk+JYB4xGOwaX/lrI7jc5IQ+ihWlAMYXzDsDF/o9wkq3Bs
        tU8SUQR8RTndnBUeOQ18bHaekf6wlmDWBQ/j8Eg=
X-Google-Smtp-Source: ABdhPJxVVwyXo9hZnsdaeYUfus7E6TFy38ZOw+o2ETry7g5nG+jJCArYG/o9aQo2FA0TRgrOAz+gKyFQYsZoCBsCDko=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr3268571pfc.40.1615385250317; Wed, 10
 Mar 2021 06:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-4-noltari@gmail.com>
In-Reply-To: <20210310125504.31886-4-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Mar 2021 16:07:14 +0200
Message-ID: <CAHp75Vf3ADd+YbnUZni8GL+7_+djUC7bdDK=RuOyGmTYE8LzPQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 2:55 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add a helper for registering BCM63XX pin controllers.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(from use of the fwnode API perspective)

I'll think about of_match_node() case and perhaps come up with
corresponding fwnode API solution.

> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>

Other way around (Co-DB followed by SoB), but this is minor thingy

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


--=20
With Best Regards,
Andy Shevchenko
