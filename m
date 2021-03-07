Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4174733041D
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Mar 2021 20:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhCGTFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Mar 2021 14:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhCGTFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Mar 2021 14:05:36 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A755C06174A;
        Sun,  7 Mar 2021 11:05:36 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t25so4981270pga.2;
        Sun, 07 Mar 2021 11:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6OopSw5D8ep2q2/dbMs+34bXsAVe5qvVqgXWtPVK+p0=;
        b=isQFK0hiYv6VN2fc5B8j6iJxbMapK7CSFtjIM+VwgPossPH2Wb42Yu6KrMataC0l3m
         pHK1Nsr5WmCjrw7gKLnW6tmQMGPx8rACcNdd/VdI1P9cwUQh9Hd6C36wYdXEQgJdYjYF
         Vu/EPblMCm+I4x9TBJhu327DLCjfpAGT6EBj6VpV4dOxVYBZ0pzNZ+hZg5ZoX9PZu2tY
         vF7WVmp+rgjVvfTWZ906znyrpWWeT/3i3lN/JqcGoWzHzZ7Awn0s68ogeOo/xyUQ/4AK
         URMDZFd9y4g2KqongEhPW5ELy/hTgWpxlVHgiFSTGPSAjP6lsN2GU7lJDR1zuxySU+nw
         ulJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6OopSw5D8ep2q2/dbMs+34bXsAVe5qvVqgXWtPVK+p0=;
        b=MWSpJftua7vEn/b0Quo5OlEHRqqfnRVBQtpgb6Sd/ns8RgIvAE/5v3p7cEy7frzMEP
         FDd+w5OH00WNJRo02ZqrBawr35CJJNTnP46Kxj1xYUjc9bpUlg87dSin2bj7vW6ISHh0
         ZrADoATNT5D3XCu5K+Id2ExtE/tsA0/8P8ZokBfic23ukuYc1gII/RIhOwwMnh2Jg9T/
         YO7EI2qLZK1VBfUAPHEOZoQNA9w1abdB64W8JWD2Gfn2SDNBPYvKqTDcEPnCF6GL7nJq
         /7fgvhIxlj7vRiWLKHo8XWTKP3wlwqSW98qWS1eg3WUAxETkVA55IAVR4s2W6yEAfP4U
         SVdw==
X-Gm-Message-State: AOAM532riAtNBwnbHWvXOia3hRLeB3gsic6bZ+mhsFfMzmqU3j1vCRPt
        Y11ON/ylIPDWgRO+jAfx9YLI7v/JEZlToesgPjI=
X-Google-Smtp-Source: ABdhPJxZugS/AtpXgTFu6XJ6VxJbgAYkkSqb2BomvwTTqEG2l/My8fZS4KbhuaEgVaVIIJpmYra6PYX9yfCCVGnwW3o=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr17755594pgf.4.1615143936052;
 Sun, 07 Mar 2021 11:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20210306155712.4298-1-noltari@gmail.com> <20210306155712.4298-4-noltari@gmail.com>
In-Reply-To: <20210306155712.4298-4-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 7 Mar 2021 21:05:19 +0200
Message-ID: <CAHp75VdwqpL0UScR5s+Tf4z7RZQfyo+625uXZtfWV3=xQr6Z2Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/15] pinctrl: bcm: add bcm63xx base code
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

On Sat, Mar 6, 2021 at 5:57 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>
> Add a helper for registering BCM63XX pin controllers.

Thanks for this, but I think we may use the fwnode API. See below.

...

> +#include <linux/gpio/regmap.h>
> +#include <linux/mfd/syscon.h>

> +#include <linux/of.h>

+ property.h
+ mod_devicetable.h

> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-bcm63xx.h"

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

> +static int bcm63xx_gpio_probe(struct device *dev, struct device_node *no=
de,

device_node *node -> fwnode_handle *fwnode

> +                             const struct bcm63xx_pinctrl_soc *soc,
> +                             struct bcm63xx_pinctrl *pc)
> +{
> +       struct gpio_regmap_config grc =3D {0};
> +
> +       grc.parent =3D dev;

> +       grc.fwnode =3D &node->fwnode;

grc.fwnode =3D fwnode;

> +       grc.ngpio =3D soc->ngpios;
> +       grc.ngpio_per_reg =3D BCM63XX_BANK_GPIOS;
> +       grc.regmap =3D pc->regs;
> +       grc.reg_mask_xlate =3D bcm63xx_reg_mask_xlate;

> +       if (of_property_read_u32(node, "data", &grc.reg_dat_base))

fwnode_property_read_u32()

> +               grc.reg_dat_base =3D BCM63XX_DATA_REG;
> +       grc.reg_set_base =3D grc.reg_dat_base;

> +       if (of_property_read_u32(node, "dirout", &grc.reg_dir_out_base))

Ditto.

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

> +       struct device_node *node;

struct fwnode_handle *fwnode;

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

> +       for_each_child_of_node(dev->of_node, node) {

device_for_each_child_node(dev, fwnode) {

> +               if (of_match_node(bcm63xx_gpio_of_match, node)) {

// for now, since we have not an analogue (yet)
node =3D=3D> to_of_node(fwnode)

> +                       err =3D bcm63xx_gpio_probe(dev, node, soc, pc);

...(dev, fwnode, soc, pc);

> +                       if (err) {
> +                               dev_err(dev, "could not add GPIO chip\n")=
;

> +                               of_node_put(node);

fwnode_handle_put(fwnode);

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


--
With Best Regards,
Andy Shevchenko
