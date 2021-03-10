Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1893333654
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 08:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhCJHZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 02:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhCJHZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 02:25:17 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39147C06174A;
        Tue,  9 Mar 2021 23:25:17 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i9so6276873wml.0;
        Tue, 09 Mar 2021 23:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fzlYrHdM6I5OZCDaqPvPVMHnausCMIDp7XXhC2P5JxE=;
        b=GVS6fgVuiI8lwr1SPFKtbrYdVTM/T8Sv9eGZM9ICNHZhw9sAQ7MU/QRG1dUnIaT3W9
         bG1Lx61O6Z64hBW41PCU004cqL185RvQf28xZTEcCXoskwIeOEDUAZNJh1rtc8TD+7XF
         A/4TyefSbLMiV1dKa5aay4kMm2f8WPrfnu6Z0HbTt0NV3xdy2kV6lVzw7SkmIRTPORl6
         GIfUxSBx0kD80rHR9T0Awy3L4NOgdnKO51xZ8nPZfs9SNNphUX3Mph26JGBy5Ajjjgl2
         c4DynkLRXkTf+oi2jniVMDwH446wonN/H8dO1rKgCnmL0dJKNvOB3UVoFlHOVSSrv7sj
         B6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fzlYrHdM6I5OZCDaqPvPVMHnausCMIDp7XXhC2P5JxE=;
        b=r1OQzxQRnmuEz00TVjlanfGn/U2M3cz+RhYYxnVElxAhYt66dIhXispN4cOqzyRZj+
         y5ciMdNQU9YbTJxFumzhKNPy8Y2Gj69gvqcLuegaRoetbIJMeTBJQJAcyU0LfbLW8hpD
         2pboahlNKFBaFPPiT3FmmqQA7XFVH5IAMbNSJ38atVn+B2KfISf9jgRjNIx8ibaR88oe
         1wI/rP6wLZ0etvBT/gBa/N3+/a3+v1IGv/LEeaTxW+djbgRPfFI/zJuvGUgXCOjH7sr5
         iQznWXIyg59VF1QSt2FlBfLkk6ZXqsBHMJAm5lL/2qyOn3er/sV5af0qcYjZFv4XL2hm
         mNWA==
X-Gm-Message-State: AOAM5306W/RZDm0ISOXckjxZl3Ix1y/WH3ajtT0VOm8nqG9m60x0D7n0
        amfsS38widXfuJmk4rVF3lM=
X-Google-Smtp-Source: ABdhPJz9tJLolWqRg9+yUkFSvUcAIZi8w8rr87OdKdD8qP7tF7XM64FdcpdUtcfijCpqVrMbx/Kp7Q==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr1856650wmg.37.1615361115947;
        Tue, 09 Mar 2021 23:25:15 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id u3sm27812011wrt.82.2021.03.09.23.25.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 23:25:15 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v5 03/15] pinctrl: bcm: add bcm63xx base code
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VdwqpL0UScR5s+Tf4z7RZQfyo+625uXZtfWV3=xQr6Z2Q@mail.gmail.com>
Date:   Wed, 10 Mar 2021 08:25:14 +0100
Cc:     Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC7F8938-63CB-43D9-AE75-644B2E647360@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
 <20210306155712.4298-4-noltari@gmail.com>
 <CAHp75VdwqpL0UScR5s+Tf4z7RZQfyo+625uXZtfWV3=xQr6Z2Q@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 7 mar 2021, a las 20:05, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Sat, Mar 6, 2021 at 5:57 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>=20
>> Add a helper for registering BCM63XX pin controllers.
>=20
> Thanks for this, but I think we may use the fwnode API. See below.
>=20
> ...
>=20
>> +#include <linux/gpio/regmap.h>
>> +#include <linux/mfd/syscon.h>
>=20
>> +#include <linux/of.h>
>=20
> + property.h
> + mod_devicetable.h
>=20
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-bcm63xx.h"
>=20
>> +static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
>> +                                 unsigned int base, unsigned int =
offset,
>> +                                 unsigned int *reg, unsigned int =
*mask)
>> +{
>> +       unsigned int line =3D offset % BCM63XX_BANK_GPIOS;
>> +       unsigned int stride =3D offset / BCM63XX_BANK_GPIOS;
>> +
>> +       *reg =3D base - stride * BCM63XX_BANK_SIZE;
>> +       *mask =3D BIT(line);
>> +
>> +       return 0;
>> +}
>=20
>> +static int bcm63xx_gpio_probe(struct device *dev, struct device_node =
*node,
>=20
> device_node *node -> fwnode_handle *fwnode
>=20
>> +                             const struct bcm63xx_pinctrl_soc *soc,
>> +                             struct bcm63xx_pinctrl *pc)
>> +{
>> +       struct gpio_regmap_config grc =3D {0};
>> +
>> +       grc.parent =3D dev;
>=20
>> +       grc.fwnode =3D &node->fwnode;
>=20
> grc.fwnode =3D fwnode;
>=20
>> +       grc.ngpio =3D soc->ngpios;
>> +       grc.ngpio_per_reg =3D BCM63XX_BANK_GPIOS;
>> +       grc.regmap =3D pc->regs;
>> +       grc.reg_mask_xlate =3D bcm63xx_reg_mask_xlate;
>=20
>> +       if (of_property_read_u32(node, "data", &grc.reg_dat_base))
>=20
> fwnode_property_read_u32()
>=20
>> +               grc.reg_dat_base =3D BCM63XX_DATA_REG;
>> +       grc.reg_set_base =3D grc.reg_dat_base;
>=20
>> +       if (of_property_read_u32(node, "dirout", =
&grc.reg_dir_out_base))
>=20
> Ditto.
>=20
>> +               grc.reg_dir_out_base =3D BCM63XX_DIROUT_REG;
>> +
>> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &grc));
>> +}
>> +
>> +int bcm63xx_pinctrl_probe(struct platform_device *pdev,
>> +                         const struct bcm63xx_pinctrl_soc *soc,
>> +                         void *driver_data)
>> +{
>> +       struct device *dev =3D &pdev->dev;
>> +       struct bcm63xx_pinctrl *pc;
>=20
>> +       struct device_node *node;
>=20
> struct fwnode_handle *fwnode;
>=20
>> +       int err;
>> +
>> +       pc =3D devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
>> +       if (!pc)
>> +               return -ENOMEM;
>> +
>> +       platform_set_drvdata(pdev, pc);
>> +
>> +       pc->dev =3D dev;
>> +       pc->driver_data =3D driver_data;
>=20
>> +       pc->regs =3D syscon_node_to_regmap(dev->parent->of_node);
>> +       if (IS_ERR(pc->regs))
>> +               return PTR_ERR(pc->regs);
>> +
>> +       pc->pctl_desc.name =3D dev_name(dev);
>> +       pc->pctl_desc.pins =3D soc->pins;
>> +       pc->pctl_desc.npins =3D soc->npins;
>> +       pc->pctl_desc.pctlops =3D soc->pctl_ops;
>> +       pc->pctl_desc.pmxops =3D soc->pmx_ops;
>> +       pc->pctl_desc.owner =3D THIS_MODULE;
>> +
>> +       pc->pctl_dev =3D devm_pinctrl_register(dev, &pc->pctl_desc, =
pc);
>> +       if (IS_ERR(pc->pctl_dev))
>> +               return PTR_ERR(pc->pctl_dev);
>=20
>> +       for_each_child_of_node(dev->of_node, node) {
>=20
> device_for_each_child_node(dev, fwnode) {
>=20
>> +               if (of_match_node(bcm63xx_gpio_of_match, node)) {
>=20
> // for now, since we have not an analogue (yet)
> node =3D=3D> to_of_node(fwnode)

So you want me to convert everything to fwnode, but then I would need to =
use of_node here=E2=80=A6
It makes more sense to me to use of_node for now and convert it to =
fwnode in the future=E2=80=A6
@Linus, what do you think?

>=20
>> +                       err =3D bcm63xx_gpio_probe(dev, node, soc, =
pc);
>=20
> ...(dev, fwnode, soc, pc);
>=20
>> +                       if (err) {
>> +                               dev_err(dev, "could not add GPIO =
chip\n");
>=20
>> +                               of_node_put(node);
>=20
> fwnode_handle_put(fwnode);
>=20
>> +                               return err;
>> +                       }
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h =
b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
>> new file mode 100644
>> index 000000000000..3bdb50021f1b
>> --- /dev/null
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
>> @@ -0,0 +1,43 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2021 =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com>
>> + * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
>> + */
>> +
>> +#ifndef __PINCTRL_BCM63XX_H__
>> +#define __PINCTRL_BCM63XX_H__
>> +
>> +#include <linux/pinctrl/pinctrl.h>
>> +
>> +#define BCM63XX_BANK_GPIOS 32
>> +
>> +struct bcm63xx_pinctrl_soc {
>> +       struct pinctrl_ops *pctl_ops;
>> +       struct pinmux_ops *pmx_ops;
>> +
>> +       const struct pinctrl_pin_desc *pins;
>> +       unsigned npins;
>> +
>> +       unsigned int ngpios;
>> +};
>> +
>> +struct bcm63xx_pinctrl {
>> +       struct device *dev;
>> +       struct regmap *regs;
>> +
>> +       struct pinctrl_desc pctl_desc;
>> +       struct pinctrl_dev *pctl_dev;
>> +
>> +       void *driver_data;
>> +};
>> +
>> +static inline unsigned int bcm63xx_bank_pin(unsigned int pin)
>> +{
>> +       return pin % BCM63XX_BANK_GPIOS;
>> +}
>> +
>> +int bcm63xx_pinctrl_probe(struct platform_device *pdev,
>> +                         const struct bcm63xx_pinctrl_soc *soc,
>> +                         void *driver_data);
>> +
>> +#endif /* __PINCTRL_BCM63XX_H__ */
>> --
>> 2.20.1
>>=20
>=20
>=20
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
