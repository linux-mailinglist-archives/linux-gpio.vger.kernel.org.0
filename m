Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494DA34A66D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 12:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhCZL1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 07:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhCZL0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 07:26:43 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5587C0613AA;
        Fri, 26 Mar 2021 04:26:42 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id i22so4409103pgl.4;
        Fri, 26 Mar 2021 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=goMsdqRFn6mrANwa55defdsPmfwRHtVaRharqIy6xg4=;
        b=VsUFG8hWimTPIifHT8VT4vE3ehLFG08+bytkmQitMgc+FV0jmisu0YXuoGtlDXKkfZ
         sfEjJAmZIKrJle8cofBMjR3SiTOADQd380+R4zbqyQMUFImyID0nMNLlk9W1BNc0o4CR
         pGSjJc5KyDKuuxO1Gp0Ewy+DBq1lmNFuzEjBdQ77YLNbZWU9jFIhxnIWM98jQEbzNCbA
         R7R78sQ6kkwA0URscBvjKbzDJntVkhVKntaTlpc0UbDGGqdzT29IzP2BnBEpkYPiR3yo
         r6LeNOZ3DVhvU9LmcpHhWjkye5UM4rEDhHSe6SG31EMVDybO2NUiUAmy75GAWrtkvx2j
         GXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=goMsdqRFn6mrANwa55defdsPmfwRHtVaRharqIy6xg4=;
        b=CCeIOR0iNQFeP3sgwpZ9jB8fm0jQH8znJ5o5Gpg/4iKEXRd0CwLTkzsr5Oy4aQuhUw
         cHzrgj3g1bO9ZemC4TxaoXImcXj1IqMgOKdavlmxdUpe+4/pLw8qvvJwLSK6tlKPCW1U
         bQVDHOtCoSYr9d2SMOLLIUNc0TFKahKQhmwzOr0VTsGvGeNnJekPWu4uk+/jFmK3WKna
         ABvstcNbck5NcTPqyrw9Wq9+LyuUFx63TUYS/I6Zg5wIjv3RvfaSC755fpJsjwFSnX/a
         k6UmFFRU2n9er0JgiU1Zkv8V1hN5DvYYXI7Fk+4WymUTaVNojj16OS5uuNTVrQneTewO
         grBw==
X-Gm-Message-State: AOAM533+TkMawrDL1GdXIWmygS/94BIFi7kBD2q0RQ0LrzciVEh1HlCn
        FKJL20Y3sv7xQUYdGtJ1Zn7MX+I0kgB1rV8y0Ts=
X-Google-Smtp-Source: ABdhPJyA5HSXeE6DY37+dxhH7b2gZD4OpYhOzggoLxVyB3BDFnmNuqfst+8Q+WX/+bPV/DQhHJQJq3sL4UOQ4UAky18=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr12187108pfb.7.1616758002254; Fri, 26
 Mar 2021 04:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com> <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Mar 2021 13:26:26 +0200
Message-ID: <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 12:20 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Support GPO(s) found from ROHM BD71815 power management IC. The IC has two
> GPO pins but only one is properly documented in data-sheet. The driver

in the datasheet

> exposes by default only the documented GPO. The second GPO is connected to
> E5 pin and is marked as GND in data-sheet. Control for this undocumented

in the datasheet

> pin can be enabled using a special DT property.
>
> This driver is derived from work by Peter Yang <yanglsh@embest-tech.com>
> although not so much of original is left.

of the original

Below my comments independently on the fact if this driver will be
completely rewritten, consider them as a good practice for your new
contribution.

...

> +/*
> + * Support to GPOs on ROHM BD71815
> + */

This is effectively one line.

...

> +/* For the BD71815 register definitions */
> +#include <linux/mfd/rohm-bd71815.h>

Since it's component specific header(s) I would move it to a separate
group and locate...

> +#include <linux/module.h>

> +#include <linux/of.h>

You may do better than be OF-centric. See below.

> +#include <linux/platform_device.h>
> +

...somewhere here.

...

> +       /*
> +        * Sigh. The BD71815 and BD71817 were originally designed to support two
> +        * GPO pins. At some point it was noticed the second GPO pin which is
> +        * the E5 pin located at the center of IC is hard to use on PCB (due to
> +        * the location). It was decided to not promote this second GPO and pin
> +        * is marked as GND on the data-sheet. The functionality is still there
> +        * though! I guess driving GPO connected to ground is a bad idea. Thus

a GPO
to the ground

> +        * we do not support it by default. OTOH - the original driver written
> +        * by colleagues at Embest did support controlling this second GPO. It
> +        * is thus possible this is used in some of the products.
> +        *
> +        * This driver does not by default support configuring this second GPO
> +        * but allows using it by providing the DT property
> +        * "rohm,enable-hidden-gpo".
> +        */

...

> +       int ret = 0;

Redundant assignment.

> +       int val;
> +
> +       ret = regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
> +       if (ret)
> +               return ret;

> +       return (val >> offset) & 1;

!!(val & BIT(offset)) can also work and be in alignment with the below code.

...

> +       if (!bd71815->e5_pin_is_gpo && offset)
> +               return;

I wonder if you can use valid_mask instead of this.

...

> +       bit = BIT(offset);

Can be moved to the definition block.

...

> +       if (!bdgpio->e5_pin_is_gpo && offset)
> +               return -EOPNOTSUPP;

As above.

...

> +       default:
> +               break;
> +       }
> +       return -EOPNOTSUPP;

You may return directly from default.

...

> +       int ret;
> +       struct bd71815_gpio *g;
> +       struct device *dev;
> +       struct device *parent;

Reversed xmas tree order.

...

> +       /*
> +        * Bind devm lifetime to this platform device => use dev for devm.
> +        * also the prints should originate from this device.
> +        */

Why is this comment needed?

...

> +       dev = &pdev->dev;

Can be done in the definition block.

...

> +       /* The device-tree and regmap come from MFD => use parent for that */

Why do you need this comment?

> +       parent = dev->parent;

Ditto, can be moved to the definition block.

...

> +       g->e5_pin_is_gpo = of_property_read_bool(parent->of_node,
> +                                                "rohm,enable-hidden-gpo");

You may use device_property_read_bool().

...

> +       g->chip.of_node = parent->of_node;

Redundant. GPIO library does it for you and even better.

...

> +       ret = devm_gpiochip_add_data(dev, &g->chip, g);
> +       if (ret < 0) {
> +               dev_err(dev, "could not register gpiochip, %d\n", ret);
> +               return ret;
> +       }
> +
> +       return ret;

It's as simply as
return devm_gpiochip_add_data(...);

...

> +static const struct platform_device_id bd7181x_gpo_id[] = {
> +       { "bd71815-gpo" },

> +       { },

No comma for the terminator line.

> +};
> +MODULE_DEVICE_TABLE(platform, bd7181x_gpo_id);

Why do you need this ID table exactly?
You have the same name as in the platform driver structure below.

> +static struct platform_driver gpo_bd71815_driver = {
> +       .driver = {
> +               .name   = "bd71815-gpo",

> +               .owner  = THIS_MODULE,

This is done by module_*_driver() macros, drop it.

> +       },
> +       .probe          = gpo_bd71815_probe,
> +       .id_table       = bd7181x_gpo_id,
> +};

> +

Extra blank line.

> +module_platform_driver(gpo_bd71815_driver);

> +/* Note:  this hardware lives inside an I2C-based multi-function device. */
> +MODULE_ALIAS("platform:bd71815-gpo");

> +

Ditto.

> +MODULE_AUTHOR("Peter Yang <yanglsh@embest-tech.com>");

And I don't see a match with a committer/submitter/co-developer/etc.
Please, make corresponding fields and this macro (or macros, you may
have as many MODULE_AUTHOR() entries as developers of the code)
aligned to each other.

> +MODULE_DESCRIPTION("GPO interface for BD71815");
> +MODULE_LICENSE("GPL");

-- 
With Best Regards,
Andy Shevchenko
