Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB46F34E528
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhC3KMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhC3KL4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:11:56 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CDDC061574;
        Tue, 30 Mar 2021 03:11:56 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id y32so10225486pga.11;
        Tue, 30 Mar 2021 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D64Z0ipiSGjIBRscBt7Hj8JlFiWyuPUHxNwLeCeVO14=;
        b=pme7hRVQQ62mCdj/DJ8yYIZZwvljFEGqajaoqH2E0JKLyslpvRPinagWmsIb5R5VGn
         j4TJmvArUzdFno47WEKPprN2+CPJE6ZX4b7bUDbRXRx7qHJNIxCClgRQrOvBg2gUX425
         QHrH/9usLgf1GP8kdVzm5mapzgDlm7AeK4qYGBf10OqHZ0NbTB370kdZEAe7hjHO6f+J
         xPwj3jZu1dR3NwhL7r9RcAhyhNgpZLC9R138Uf8yolgIRyN4U0Y3MwAhkY1BdKYr+9Q8
         lzUCw3cGbdXWCAdgPlpCTiUSoWyT4m9pAKOpw1B/elmHMxSxDAIR6JoXxq4ip6MCDIBM
         TLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D64Z0ipiSGjIBRscBt7Hj8JlFiWyuPUHxNwLeCeVO14=;
        b=uhsfyCmM3bBHhh2jtKFGHBYDNBQUqB//hI0ddWjLGHllzbPEAIhfWCgBUZS5mawRqX
         WjeOwn0syAVqTPRZY9ad0J443czvx126XyLu95nsCB6B3P6UjnIw75lRi5mtqolWlT00
         lsioT+PWluylVWTEh8tW9rl0OLZH9B98N5M4UebHjtWCWxMioL5k9IM6VaGZIxzQab5O
         4x0B2+ZVRb1aQJTnNFIK0T60avzOrYwE26jFw6cqh3zzEakD3e6Zj1WozCZUtN0kUGRm
         dwaN2OW6xAFpp3o6SdTtwR8I3sZ7q+hln074eZIneAcrf8NYM1v4vBh0XFgOf8CRKwGi
         UxnQ==
X-Gm-Message-State: AOAM533sgliVzr9oIFAmsAZjtp8X3dpfSyPNcJgg4JEOfHx4hBOg6NI5
        XbG3Ji5CKB8YnB26GgjGuEBYC9aSk/2B72XOMHA=
X-Google-Smtp-Source: ABdhPJyot5Mzdi+RZAdXsFR/oJ2wQd6fBrsoSnwBTwFD4jBvm8DtkP3JFA6R7w+tnluGW4uFfYU0N1p60KSrgUjY7Rw=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr6674506pga.203.1617099116029;
 Tue, 30 Mar 2021 03:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com> <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:11:39 +0300
Message-ID: <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
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

On Mon, Mar 29, 2021 at 3:58 PM Matti Vaittinen
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

It seems you ignored my comments about the commit message. :-(



> +struct bd71815_gpio {
> +       struct gpio_chip chip;

> +       struct device *dev;

Wondering why you need this. Is it the same as chip.parent?

> +       struct regmap *regmap;
> +};

...

> +       int ret, bit;
> +
> +       bit = BIT(offset);

I prefer
  int bit = BIT(offset);
  int ret;
but I think we already discussed that. OK.

...

> +       default:
> +               break;
> +       }
> +       return -ENOTSUPP;

Here is a waste of line. Why break instead of direct return?

...

> +/* Template for GPIO chip */
> +static const struct gpio_chip bd71815gpo_chip = {
> +       .label                  = "bd71815",
> +       .owner                  = THIS_MODULE,
> +       .get                    = bd71815gpo_get,
> +       .get_direction          = bd71815gpo_direction_get,
> +       .set                    = bd71815gpo_set,
> +       .set_config             = bd71815_gpio_set_config,

> +       .can_sleep              = 1,

Strictly speaking this should be true (boolean type value).

> +};

...

> +#define BD71815_TWO_GPIOS      0x3UL
> +#define BD71815_ONE_GPIO       0x1UL

Are they masks? Can you use BIT() and GENMASK()?

...

> +/*
> + * Sigh. The BD71815 and BD71817 were originally designed to support two GPO
> + * pins. At some point it was noticed the second GPO pin which is the E5 pin
> + * located at the center of IC is hard to use on PCB (due to the location). It
> + * was decided to not promote this second GPO and pin is marked as GND in the

and the pin

> + * datasheet. The functionality is still there though! I guess driving a GPO
> + * connected to the ground is a bad idea. Thus we do not support it by default.
> + * OTOH - the original driver written by colleagues at Embest did support
> + * controlling this second GPO. It is thus possible this is used in some of the
> + * products.
> + *
> + * This driver does not by default support configuring this second GPO
> + * but allows using it by providing the DT property
> + * "rohm,enable-hidden-gpo".
> + */

...

> +       /*
> +        * As writing of this the sysfs interface for GPIO control does not
> +        * respect the valid_mask. Do not trust it but rather set the ngpios
> +        * to 1 if "rohm,enable-hidden-gpo" is not given.
> +        *
> +        * This check can be removed later if the sysfs export is fixed and
> +        * if the fix is backported.

So, mark this comment with the TODO/FIXME keyword?

> +        *
> +        * For now it is safest to just set the ngpios though.
> +        */

...

> +       ret = devm_gpiochip_add_data(dev, &g->chip, g);
> +       if (ret < 0) {
> +               dev_err(dev, "could not register gpiochip, %d\n", ret);
> +               return ret;
> +       }
> +
> +       return ret;

This entire piece can be simplified by

return devm_gpiochip_add_data(...);

...

> +static struct platform_driver gpo_bd71815_driver = {
> +       .driver = {
> +               .name   = "bd71815-gpo",

> +               .owner  = THIS_MODULE,

Seems I commented on this. The module_*_driver() macro(s) will take care of it.

> +       },
> +       .probe          = gpo_bd71815_probe,
> +};

> +

Extra blank line. Drop it.

> +module_platform_driver(gpo_bd71815_driver);

-- 
With Best Regards,
Andy Shevchenko
