Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226EB477CE5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 20:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241146AbhLPT4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 14:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhLPT4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 14:56:18 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A1AC061574;
        Thu, 16 Dec 2021 11:56:18 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id t5so90838251edd.0;
        Thu, 16 Dec 2021 11:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hJZgmxASvYDVMKAJlFy9/ZnK8KF/6KsK8mpYOfhaOZE=;
        b=E1dWrHYb4z7UdwBbgD+F6QmK3sfXfZzIVwL3cZvI8uqaCOFWqYqK+bqcm3sW5vrNXs
         hxlaqaEIaK8GWtqZOKEUctAoOFbaOAGUB4pOTDc9xOiO33i31mGHTDTZIEr/IcBMthFV
         1IxvYfCp8LyDRoECRNhYEflLZXdJF9BYkUajHAocx4d9rzvcRBlWofnHw93lJLCsotRu
         faO/Hj2/sy3G/TMd772Hfb2mCbOh/k7Fw37y3013e//ff6hofescqlOVtoo29XSdxVID
         rOY/AI+dNtzCvEPm4JxanfBkz3be30pAuLCMt/QAvdS43c/dUcXE6KOF8d5dTT8B9Ozh
         1V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hJZgmxASvYDVMKAJlFy9/ZnK8KF/6KsK8mpYOfhaOZE=;
        b=I5peMJH+pYldvz/Io5gR+rYRtZIcmvmk+bJv+lPjjf8Z4fDxlBRSlB/6j7JjqQPJ8Y
         5RAppiHsV9TnlvdzRFZe6UEMuceBKvclRsHTRpu3PgLL3O8Uqtm9poFGGp/itQemK805
         Eml/W6mK/7OywfNKpEtPYv6NO3f7gMMv5/QAJ7z1b/ftLGXnXyi6wnxo/gAnjA6uoa3/
         luzJPkzNvJcEFvN21x3UaVNZaqjhPcROCQXUMOiVlimkRKdIT8107z6QOyteDgU/QP3g
         Oi7c8ZsS1nJfiy96Cb7PO4eYRMELNEJbtpSDXDIckYJaZL9ggYXSBwC6ku6Iy374C8LV
         9xXw==
X-Gm-Message-State: AOAM531EEMKKwJXD/ojCqt+YVwT4+ZuwKU3es0QmWv95eeq73Ws53gPF
        pR5piN9U+hJ1dCLUtHy0dHV+dYljOP896rfjdsolPPYWhglWNPbS
X-Google-Smtp-Source: ABdhPJwn6BkWZlbFjVx1N8qd2ALs6n8lMXM33DXzlmQ07btWoqgL+y2S+VdyOLcGlI1RJ/+iVWVUzD5lkfpq0oF6fCs=
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr12666866ejb.639.1639684576892;
 Thu, 16 Dec 2021 11:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20211215204753.5956-1-zajec5@gmail.com> <20211215204753.5956-2-zajec5@gmail.com>
In-Reply-To: <20211215204753.5956-2-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Dec 2021 21:55:40 +0200
Message-ID: <CAHp75Vcu2JLE2w8LkGO9i1kL6-stL6nXsG6Ghnk0af4amY---A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 1:25 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> BCM4908 has its own pins layout so it needs a custom binding and a Linux
> driver.

...

> +config PINCTRL_BCM4908
> +       bool "Broadcom BCM4908 pinmux driver"

Why not tristate?

> +       depends on OF && (ARCH_BCM4908 || COMPILE_TEST)

Is there really dependency to OF?

> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       default ARCH_BCM4908
> +       help
> +         Say Y here to enable driver for BCM4908 family SoCs with integr=
ated
> +         pin controller.

With a module available it's good to mention its name here.

...

> +/*
> + * Copyright (C) 2021 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> + */

One line?

...

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

> +#include <linux/of.h>
> +#include <linux/of_device.h>

No evidence of use of these headers.
But missed mod_devicetable.h.

> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>

Can you move this group...

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

...here?

> +#include "../core.h"
> +#include "../pinmux.h"

...

> +#define TEST_PORT_BLOCK_EN_LSB                 0x00
> +#define TEST_PORT_BLOCK_DATA_MSB               0x04
> +#define TEST_PORT_BLOCK_DATA_LSB               0x08
> +#define  TEST_PORT_LSB_PINMUX_DATA_SHIFT       12
> +#define TEST_PORT_COMMAND                      0x0c
> +#define  TEST_PORT_CMD_LOAD_MUX_REG            0x00000021

The prefix of all above doesn't match the module name.

...

> +struct bcm4908_pinctrl_grp {
> +       const char *name;
> +       const struct bcm4908_pinctrl_pin_setup *pins;
> +       const unsigned int num_pins;
> +};

Why not to (re)use struct group_desc?

...

> +       for (i =3D 0; i < group->num_pins; i++) {
> +               u32 lsb =3D 0;
> +
> +               lsb |=3D group->pins[i].number;
> +               lsb |=3D group->pins[i].function << TEST_PORT_LSB_PINMUX_=
DATA_SHIFT;
> +
> +               writel(0x0, bcm4908_pinctrl->base + TEST_PORT_BLOCK_DATA_=
MSB);
> +               writel(lsb, bcm4908_pinctrl->base + TEST_PORT_BLOCK_DATA_=
LSB);
> +               writel(TEST_PORT_CMD_LOAD_MUX_REG, bcm4908_pinctrl->base =
+ TEST_PORT_COMMAND);
> +       }

No serialization for IO, is it okay?

...

> +       bcm4908_pinctrl->base =3D devm_platform_ioremap_resource(pdev, 0)=
;
> +       if (IS_ERR(bcm4908_pinctrl->base)) {
> +               dev_err(dev, "Failed to map pinctrl regs\n");
> +               return PTR_ERR(bcm4908_pinctrl->base);

Besides of dev_err_probe(), why you duplicate message that already
printed by core?

> +       }

...

> +       /* Set pinctrl properties */
> +

Here and everywhere else, please drop redundant blank line.

...

> +       pins =3D devm_kcalloc(dev, BCM4908_NUM_PINS,
> +                           sizeof(struct pinctrl_pin_desc), GFP_KERNEL);

Please, use sizeof(*foo) form. Then put it on one line.

> +       if (!pins)
> +               return -ENOMEM;

...

> +       for (i =3D 0; i < BCM4908_NUM_PINS; i++) {
> +               pins[i].number =3D i;
> +               pins[i].name =3D devm_kasprintf(dev, GFP_KERNEL, "pin%d",=
 i);
> +               if (!pins[i].name)
> +                       return -ENOMEM;
> +       }

Can you use the kasprintf_strarray() to make the style unified, please?

...

> +       bcm4908_pinctrl->pctldev =3D devm_pinctrl_register(dev, pctldesc,=
 bcm4908_pinctrl);
> +       if (IS_ERR(bcm4908_pinctrl->pctldev)) {
> +               dev_err(dev, "Failed to register pinctrl\n");
> +               return PTR_ERR(bcm4908_pinctrl->pctldev);

return dev_err_probe(...);

> +       }

...

> +static struct platform_driver bcm4908_pinctrl_driver =3D {
> +       .probe =3D bcm4908_pinctrl_probe,
> +       .driver =3D {
> +               .name =3D "bcm4908-pinctrl",
> +               .of_match_table =3D bcm4908_pinctrl_of_match_table,
> +       },
> +};

> +

No need.

> +module_platform_driver(bcm4908_pinctrl_driver);


--=20
With Best Regards,
Andy Shevchenko
