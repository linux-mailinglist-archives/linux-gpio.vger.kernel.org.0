Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49F03978CD
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 19:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbhFARLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 13:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhFARLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 13:11:37 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7784C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 10:09:54 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id x18so8087437ila.10
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+Rz3Lhcejb7HYCpXC74t+FaU8kf98DbGjszGlQZc0Y=;
        b=QpNc9h4rw8vXfFDVPSkzkMB/cP3vX6woCKter+Qxj7Y1Y7kWRr9fmv+y40seGL424W
         7S9RTbV3Y2rrUbdZiAqMyrShtp6g20AD/SxpmPXwYX9b6YvEswzFKTVxAQsupcQ2zGzy
         pXZBvgaSMdHQP/7/Cqx3oJhG7/aCgfoDjduveEPH1/u7ilTetgGXhljOfu4Ub2pdF8Zw
         8K3E1ASc9A2BcbYAST9n6qj6ddSzNkcRxgMVOtly8Kj4rx03Hzli0DqyeJYKje/AuK4D
         JBg2M4R67C3PBAtwTvWaDcfR6pZ1qwo49BdkK7vPinFzWEo5rjnyvvtYGu/B2jhUN8Xe
         NZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+Rz3Lhcejb7HYCpXC74t+FaU8kf98DbGjszGlQZc0Y=;
        b=IYhIt9eXnL2H0MnQgWLwS1VnWOGfHYLzzjDzY0X9xewC5JMq6HbMmKPD5bg8Dg5HqL
         DF65g50MkhOdjiEknW53nl0tw5VhThkPiINzGV8HeJAFp0SfiSgTgo8fWy8XiQTEzV9o
         HctOwTqPOL6USyvwbT+OELyfRH3qvVr+KRPwpA1jrWX7SIGnQFrvwaWyWCUHc16w/qBt
         ERYkeTMaJRPZdBMoJjYffz8aJQhcd/i48gRnF6t44xg3bkUxOyZEUg0yxP2bflxbOt08
         +lGykBFUgkCU3e5j8izHNxtmaMLhNV9fUZWsQUTtYH0yw8FPLzLN9bcug3mC+lJ2LNkG
         wekQ==
X-Gm-Message-State: AOAM532JLWY8vBAMNnKFXJ83PZzwLDcoLaYuCeishsEv8Nb1rAEadHcx
        598shsN9JhOTX7aABO/IZAcvPBtrAhfVKrozxxh2sQ==
X-Google-Smtp-Source: ABdhPJywrV5idkePTh207NsMmYcHSjFJZB9Y4WcJUy3l3DSaXB9DrUzzrI0y7K1CxUlTgwYRSFs6BgPKtD5TfzlnPmU=
X-Received: by 2002:a92:c10a:: with SMTP id p10mr9363696ile.183.1622567393997;
 Tue, 01 Jun 2021 10:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210531125143.257622-1-robert.marko@sartura.hr>
 <20210531125143.257622-4-robert.marko@sartura.hr> <20210601153818.GA20254@pengutronix.de>
In-Reply-To: <20210601153818.GA20254@pengutronix.de>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 1 Jun 2021 19:09:43 +0200
Message-ID: <CA+HBbNG3O_QORj1NEKvoC4C5FfyfXyO_PMOZS0pHJimGn+HTUA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] reset: Add Delta TN48M CPLD reset controller
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 5:38 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Robert,
>
> thank you for the patch. A few comments below:
>
> On Mon, May 31, 2021 at 02:51:41PM +0200, Robert Marko wrote:
> > Delta TN48M CPLD exposes resets for the following:
> > * 88F7040 SoC
> > * 88F6820 SoC
> > * 98DX3265 switch MAC-s
> > * 88E1680 PHY-s
> > * 88E1512 PHY
> > * PoE PSE controller
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/reset/Kconfig       |   9 +++
> >  drivers/reset/Makefile      |   1 +
> >  drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 138 insertions(+)
> >  create mode 100644 drivers/reset/reset-tn48m.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 4171c6f76385..e3ff4b020c96 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -64,6 +64,15 @@ config RESET_BRCMSTB_RESCAL
> >         This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
> >         BCM7216.
> >
> > +config RESET_TN48M_CPLD
>
> Please sort this alphabetically.
Yeah, sorry I was sorting this by the tristate text.
Leftover from some other subsystems that sort like that.

>
> > +     tristate "Delta Networks TN48M switch CPLD reset controller"
> > +     depends on MFD_TN48M_CPLD
> > +     help
> > +       This enables the reset controller driver for the Delta TN48M CPLD.
> > +       It provides reset signals for Armada 7040 and 385 SoC-s, Alleycat 3X
> > +       switch MAC-s, Alaska OOB ethernet PHY, Quad Alaska ethernet PHY-s and
> > +       Microchip PD69200 PoE PSE controller.
> > +
> >  config RESET_HSDK
> >       bool "Synopsys HSDK Reset Driver"
> >       depends on HAS_IOMEM
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 65a118a91b27..6d6945638b76 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
> >  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
> >  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
> >  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> > +obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
>
> Same as here.

Yeah, same as before.
Will fix that.
>
> >  obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
> >  obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
> >  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
> > diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
> > new file mode 100644
> > index 000000000000..960ee5f4eb40
> > --- /dev/null
> > +++ b/drivers/reset/reset-tn48m.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Delta TN48M CPLD reset driver
> > + *
> > + * Copyright 2021 Sartura Ltd
> > + *
> > + * Author: Robert Marko <robert.marko@sartura.hr>
> > + */
> > +
> > +#include <linux/bitfield.h>
>
> What is this used for?

Actually its not, its leftover from when I was thinking to use FIELD_GET()
macro.
Will drop it.
>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> > +
> > +#include <dt-bindings/reset/delta,tn48m-reset.h>
> > +
> > +#define TN48M_RESET_REG              0x10
> > +
> > +struct tn48_reset_map {
> > +     u8 bit;
> > +};
> > +
> > +struct tn48_reset_data {
> > +     struct reset_controller_dev rcdev;
> > +     struct regmap *regmap;
> > +};
> > +
> > +static const struct tn48_reset_map tn48m_resets[] = {
> > +     [CPU_88F7040_RESET] = {0},
> > +     [CPU_88F6820_RESET] = {1},
> > +     [MAC_98DX3265_RESET] = {2},
> > +     [PHY_88E1680_RESET] = {4},
> > +     [PHY_88E1512_RESET] = {6},
> > +     [POE_RESET] = {7},
> > +};
> > +
> > +static inline struct tn48_reset_data *to_tn48_reset_data(
> > +                     struct reset_controller_dev *rcdev)
> > +{
> > +     return container_of(rcdev, struct tn48_reset_data, rcdev);
> > +}
> > +
> > +static int tn48m_control_assert(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> > +
> > +     return regmap_update_bits(data->regmap, TN48M_RESET_REG,
> > +                               BIT(tn48m_resets[id].bit), 0);
> > +}
>
> Why is there no deassert?
All of the reset are self-clearing, so no need for it.
>
> > +static int tn48m_control_reset(struct reset_controller_dev *rcdev,
> > +                            unsigned long id)
> > +{
> > +     return tn48m_control_assert(rcdev, id);
>
> Is this a self-clearing (or rather self re-setting) bit that triggers a
> reset pulse?
> If so, assert shouldn't be implemented.

Yes, it's self-clearing, per spec they will be cleared after 100ms.
Will drop assert then, I saw that reset was for self-clearing, but other
drivers I looked for example implemented both which was confusing.

>
> > +}
> > +
> > +static int tn48m_control_status(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> > +     unsigned int regval;
> > +     int ret;
> > +
> > +     ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (BIT(tn48m_resets[id].bit) & regval)
> > +             return 0;
> > +     else
> > +             return 1;
> > +}
> > +
> > +static const struct reset_control_ops tn48_reset_ops = {
> > +     .reset          = tn48m_control_reset,
> > +     .assert         = tn48m_control_assert,
> > +     .status         = tn48m_control_status,
> > +};
> > +
> > +static int tn48m_reset_probe(struct platform_device *pdev)
> > +{
> > +     struct tn48_reset_data *data;
> > +     struct regmap *regmap;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
>
> That shouldn't be necessary.

This driver depends on having a parent as it needs to get the
regmap from it.
The parent is a CPLD using simple-i2c-mfd.
So it's nice to check.

Regards, Robert
>
> > +     regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +     if (!regmap)
> > +             return -ENODEV;
> > +
> > +     data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->regmap = regmap;
> > +
> > +     data->rcdev.owner = THIS_MODULE;
> > +     data->rcdev.ops = &tn48_reset_ops;
> > +     data->rcdev.nr_resets = ARRAY_SIZE(tn48m_resets);
> > +     data->rcdev.of_node = pdev->dev.of_node;
> > +
> > +     return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> > +}
> > +
> > +static const struct of_device_id tn48m_reset_of_match[] = {
> > +     { .compatible = "delta,tn48m-reset", },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, tn48m_reset_of_match);
> > +
> > +static struct platform_driver tn48m_reset_driver = {
> > +     .driver = {
> > +             .name = "delta-tn48m-reset",
> > +             .of_match_table = tn48m_reset_of_match,
> > +     },
> > +     .probe = tn48m_reset_probe,
> > +};
> > +module_platform_driver(tn48m_reset_driver);
> > +
> > +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> > +MODULE_DESCRIPTION("Delta TN48M CPLD reset driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.31.1
> >
> >
>
> regards
> Philipp



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
