Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3BB446400
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhKENVw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbhKENVt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 09:21:49 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A915C061714;
        Fri,  5 Nov 2021 06:19:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c8so16276148ede.13;
        Fri, 05 Nov 2021 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXvIXUwdhnwsQptNDf+LXPNje9m2HJqMbS8TaZl13qU=;
        b=Wxyy6A94A1dtcmgVO2w9xOAJFu2vlvVvgNdW1VUKN5OnHC8ltP4Udg1gQ+tTw9MCw7
         cnLfbP46WBPOQ+4zebvlEKdZHeAtyCZoTvMsk2evB0nHG9+yYCTDhpX7cZaeiKBcbG77
         jw3lBmn0/QCmsw8QzPp/U28QEIB7NseTjcpHHUb67irBrBdvMlBeJlO9hzt1oD7aGvzk
         S1k6dtiI0flb5G97yh7OYr6crvd0FZYZy0iwsrE5PsIHmbXReoFUohp42Cp9X9xIQALh
         2e2fdmdZt6D5xG954hnogGPk2OKDB2GQo3ANaMjTUpdh1ERyCQfrG0DStjxMVI4Otj5Q
         B4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXvIXUwdhnwsQptNDf+LXPNje9m2HJqMbS8TaZl13qU=;
        b=oILcyJIOe38HOhihH3l4JmcSFu0iR/NM7+04BdEJsBE9P55n5eWZg4W/iJxq2Pk6gn
         nGUTSOWrHErdIDjyXlB1e1XQiVo/fmdM4WtUyRl66MTfXe0OBZ9JjDh8Q/vWIhFYbNaX
         Jy+7hZhHsVfx+ws1Do/Tb39ZVkBHpw/eMwvBPXVCkym6AQtLPhwT5kyHIc3ppd40fkpV
         sWRy/6hrz8h24CvIMZbK0qasja0kU0JkdvcjnQEZT/e+NLuSfAD2h3rgoUwE964leKXD
         VBWd1EpnDhh3LFRYNOVnnCHpUNLunLvuLptmvt8d0rTQyg71b4cE8I5UrLJAc5F5+gKX
         BS/w==
X-Gm-Message-State: AOAM532QXJf5ESjVvmFjZv9K7F8Nxr7XIE6Bf2pLPYQo9vc6g9/sgj/s
        faqAJqMxhL/TkZN9y+a4K3ciufrQ50nJAJQ+xsc=
X-Google-Smtp-Source: ABdhPJwg31MBG3tQ0eaKTNytMOXJUg3q3Ol5S4BWN+X969S6WXyWEwwgTiSTDBWCU12L+R7UdTh1rJuS8LNsNcATH6Y=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr13588799ejb.377.1636118346018;
 Fri, 05 Nov 2021 06:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211105113859.101868-1-robert.marko@sartura.hr> <20211105113859.101868-4-robert.marko@sartura.hr>
In-Reply-To: <20211105113859.101868-4-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Nov 2021 15:18:18 +0200
Message-ID: <CAHp75Vct5JG=y=yvnUoeuSwDiqXJHwFDC9hPxRF4W1P4AcK8_g@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] reset: Add Delta TN48M CPLD reset controller
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Walle <michael@walle.cc>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 1:39 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M CPLD exposes resets for the following:
> * 88F7040 SoC
> * 88F6820 SoC
> * 98DX3265 switch MAC-s
> * 88E1680 PHY-s
> * 88E1512 PHY
> * PoE PSE controller
>
> Controller supports only self clearing resets.

After addressing below,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes in v8:
> * Drop of.h and include mod_devicetable.h per Andys comment
> * Mark the units used in timeout and sleep defines for the timeout poller
>
> Changes in v5:
> * Allow COMPILE_TEST as well
> * Default to MFD_TN48M_CPLD
>
> Changes in v4:
> * Drop assert and deassert as only self-clearing
> resets are support by the HW
> * Make sure that reset is cleared before returning
> from reset.
> ---
>  drivers/reset/Kconfig       |  10 +++
>  drivers/reset/Makefile      |   1 +
>  drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/reset/reset-tn48m.c
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5656cac04b4c..e76aba5f4c84 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -243,6 +243,16 @@ config RESET_TI_SYSCON
>           you wish to use the reset framework for such memory-mapped devices,
>           say Y here. Otherwise, say N.
>
> +config RESET_TN48M_CPLD
> +       tristate "Delta Networks TN48M switch CPLD reset controller"
> +       depends on MFD_TN48M_CPLD || COMPILE_TEST
> +       default MFD_TN48M_CPLD
> +       help
> +         This enables the reset controller driver for the Delta TN48M CPLD.
> +         It provides reset signals for Armada 7040 and 385 SoC-s, Alleycat 3X
> +         switch MAC-s, Alaska OOB ethernet PHY, Quad Alaska ethernet PHY-s and
> +         Microchip PD69200 PoE PSE controller.

Since it's a tristate, the common practice is to mentioned the module
name in the help.

>  config RESET_UNIPHIER
>         tristate "Reset controller driver for UniPhier SoCs"
>         depends on ARCH_UNIPHIER || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index ea8b8d9ca565..79beab92324f 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
> +obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
>  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
> diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
> new file mode 100644
> index 000000000000..6889e9173577
> --- /dev/null
> +++ b/drivers/reset/reset-tn48m.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD reset driver
> + *
> + * Copyright (C) 2021 Sartura Ltd.
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/delta,tn48m-reset.h>
> +
> +#define TN48M_RESET_REG                0x10
> +
> +#define TN48M_RESET_TIMEOUT_US 125000
> +#define TN48M_RESET_SLEEP_US   10
> +
> +struct tn48_reset_map {
> +       u8 bit;
> +};
> +
> +struct tn48_reset_data {
> +       struct reset_controller_dev rcdev;
> +       struct regmap *regmap;
> +};
> +
> +static const struct tn48_reset_map tn48m_resets[] = {
> +       [CPU_88F7040_RESET] = {0},
> +       [CPU_88F6820_RESET] = {1},
> +       [MAC_98DX3265_RESET] = {2},
> +       [PHY_88E1680_RESET] = {4},
> +       [PHY_88E1512_RESET] = {6},
> +       [POE_RESET] = {7},
> +};
> +
> +static inline struct tn48_reset_data *to_tn48_reset_data(
> +                       struct reset_controller_dev *rcdev)
> +{
> +       return container_of(rcdev, struct tn48_reset_data, rcdev);
> +}
> +
> +static int tn48m_control_reset(struct reset_controller_dev *rcdev,
> +                              unsigned long id)
> +{
> +       struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> +       unsigned int val;
> +
> +       regmap_update_bits(data->regmap, TN48M_RESET_REG,
> +                          BIT(tn48m_resets[id].bit), 0);
> +
> +       return regmap_read_poll_timeout(data->regmap,
> +                                       TN48M_RESET_REG,
> +                                       val,
> +                                       val & BIT(tn48m_resets[id].bit),
> +                                       TN48M_RESET_SLEEP_US,
> +                                       TN48M_RESET_TIMEOUT_US);
> +}
> +
> +static int tn48m_control_status(struct reset_controller_dev *rcdev,
> +                               unsigned long id)
> +{
> +       struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> +       unsigned int regval;
> +       int ret;
> +
> +       ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (BIT(tn48m_resets[id].bit) & regval)
> +               return 0;
> +       else
> +               return 1;
> +}
> +
> +static const struct reset_control_ops tn48_reset_ops = {
> +       .reset          = tn48m_control_reset,
> +       .status         = tn48m_control_status,
> +};
> +
> +static int tn48m_reset_probe(struct platform_device *pdev)
> +{
> +       struct tn48_reset_data *data;
> +       struct regmap *regmap;
> +
> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->regmap = regmap;
> +
> +       data->rcdev.owner = THIS_MODULE;
> +       data->rcdev.ops = &tn48_reset_ops;
> +       data->rcdev.nr_resets = ARRAY_SIZE(tn48m_resets);
> +       data->rcdev.of_node = pdev->dev.of_node;
> +
> +       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}
> +
> +static const struct of_device_id tn48m_reset_of_match[] = {
> +       { .compatible = "delta,tn48m-reset", },

Comma inside {} is not required.

> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, tn48m_reset_of_match);
> +
> +static struct platform_driver tn48m_reset_driver = {
> +       .driver = {
> +               .name = "delta-tn48m-reset",
> +               .of_match_table = tn48m_reset_of_match,
> +       },
> +       .probe = tn48m_reset_probe,
> +};
> +module_platform_driver(tn48m_reset_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("Delta TN48M CPLD reset driver");
> +MODULE_LICENSE("GPL");
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
