Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003133AF238
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhFURqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhFURqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 13:46:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6F3C061574;
        Mon, 21 Jun 2021 10:43:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i4so5280299plt.12;
        Mon, 21 Jun 2021 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T3D8UK1gOfFX+dIRRDU1M/FRUJLxaVbvp2i5V6ZSH0I=;
        b=csDCzyeLDt//0q65Pr3MMBhIUfQs0CYWjquByITpiVEIcI4G+b/hUIhI3yKCa2WePd
         XPHBCf1IQ9yGs7xBrFo1Py95qkbSL2elHkewLGXbBWrmDRQ4QF7TiRnSjv3bqtyJ7qYV
         5yh2SMJr5u4Vux8yK9QJpOZwlHoIuknBYrv2cfaV5ihEseAMeHIn2q1vrj99+uyfwL2R
         eaZZEBEf2z/0aE1iR6dKNeoXxDFgUrJSyDzDY+dqpIJ1nG3zIi58gWB/Be6kh5h1D0ms
         qzasvpXq08y0Z9klwA57JO3fyveTZkpzQR7cgz8dTWKZotVkijR8p+Q90Msm/dlEwouQ
         Ab7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T3D8UK1gOfFX+dIRRDU1M/FRUJLxaVbvp2i5V6ZSH0I=;
        b=nfEJ8xbWla/JWCNRHnChETpuoeXk0ePCxFLMyvBmTNg7wcXmuCJKkBDB5KnqIpXrx/
         tNMdgl2MANq+njXd1J5k84VXdw9ApOp412rJHLcIPNtKnZ147Hof+mBwlB58Wh6X7rAW
         ZNDCeIJMNMBpsx6mAH36GV9QSw+kXpPLr3EegMdg6s7Aeljgk11oDybzBXrzwbVwWjEW
         51MJsC2fweGjYpT5lvJhUr93mKc9ZtP3z2piMGBLit8wXnRGJTom3NXjtqIJIm5PPaFr
         x+BEWbQ56L/7mEqYyz8L0s9pcjeoW9a1+8yu8d3OMQ9enlCTuD9BB41bSlPWty+UHN5z
         0Piw==
X-Gm-Message-State: AOAM533gk/O+ZbROZqQW9hAeYh3xHZ+KEqd6wvUwiYVoXgVOhwOy22ch
        hvdX1ODutr7smOIMCBflLcZuoz3l9cfgMAN82nc=
X-Google-Smtp-Source: ABdhPJwC5Xjlye0MYX3gpukX12I4fnYwkUQ3eEdBjwS/AAgNYGE1WDCwOBcW5s75KMsf/fhybYG1yWZCTJ1sZu14GZ8=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr40103459pja.181.1624297438238;
 Mon, 21 Jun 2021 10:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi> <20210621172053.107045-3-maukka@ext.kapsi.fi>
In-Reply-To: <20210621172053.107045-3-maukka@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Jun 2021 20:43:21 +0300
Message-ID: <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 21, 2021 at 8:25 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Adds support for a building cascades of GPIO lines. That is, it allows

for building

> setups when there is one upstream line and multiple cascaded lines, out
> of which one can be chosen at a time. The status of the upstream line
> can be conveyd to the selected cascaded line or, vice versa, the status

conveyed

> of the cascaded line can be conveyed to the upstream line.
>
> A gpio-mux is being used to select, which cascaded GPIO line is being
> used at any given time.
>
> At the moment only input direction is supported. In future it should be
> possible to add support for output direction, too.

Since in parallel there is a discussion about the virtio-gpio
interface, how will this work with it?

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  A generic GPIO cascade driver
> + *
> + *  Copyright (C) 2021 Mauri Sandberg <maukka@ext.kapsi.fi>
> + *
> + * This allows building cascades of GPIO lines in a manner illustrated
> + * below:
> + *
> + *                 /|---- Cascaded GPIO line 0
> + *  Upstream      | |---- Cascaded GPIO line 1
> + *  GPIO line ----+ | .
> + *                | | .
> + *                 \|---- Cascaded GPIO line n
> + *
> + * A gpio-mux is being used to select, which cascaded line is being
> + * addressed at any given time.
> + *
> + * At the moment only input mode is supported due to lack of means for
> + * testing output functionality. At least theoretically output should be
> + * possible with an open drain constructions.
> + */

...

> +static int gpio_cascade_get_value(struct gpio_chip *gc, unsigned int off=
set)
> +{
> +       struct gpio_cascade *cas;
> +       int ret;

> +       cas =3D chip_to_cascade(gc);

Doing this in the definition block above will save a LOC.

> +       ret =3D mux_control_select(cas->mux_control, offset);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D gpiod_get_value(cas->upstream_line);
> +       mux_control_deselect(cas->mux_control);
> +       return ret;
> +}

...

> +       struct device_node *np =3D pdev->dev.of_node;

Nope, see below.

...

> +       cas =3D devm_kzalloc(dev, sizeof(struct gpio_cascade), GFP_KERNEL=
);

sizeof(*cas)

> +       if (cas =3D=3D NULL)

if (!cas)

> +               return -ENOMEM;

...

> +       mc =3D devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(mc)) {
> +               err =3D (int) PTR_ERR(mc);
> +               if (err !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "unable to get mux-control: %d\n", e=
rr);
> +               return err;

Oh l=C3=A0 l=C3=A0! No, the explicit castings are bad. besides the fact tha=
t all
above can be replaced by

  return dev_err_probe(...);

> +       }
> +
> +       cas->mux_control =3D mc;
> +       upstream =3D devm_gpiod_get(dev, "upstream",  GPIOD_IN);
> +       if (IS_ERR(upstream)) {

> +               err =3D (int) PTR_ERR(upstream);
> +               dev_err(dev, "unable to claim upstream GPIO line: %d\n", =
err);

No castings. Use proper printf() specifiers.

> +               return err;
> +       }

...

> +       gc->of_node =3D np;

This should be guarded by CONFIG_OF_GPIO.
And no need to use the np temporary variable for one use like this.

...

> +       err =3D gpiochip_add(&cas->gpio_chip);

Why not the devm variant?

> +       if (err) {
> +               dev_err(dev, "unable to add gpio chip, err=3D%d\n", err);
> +               return err;
> +       }

...

> +       dev_info(dev, "registered %u cascaded GPIO lines\n", gc->ngpio);

No, we don't pollute logs when everything is fine.

...

> +static const struct of_device_id gpio_cascade_id[] =3D {
> +       {
> +               .compatible =3D "gpio-cascade",

> +               .data =3D NULL,

Redundant.

> +       },

All above may consume only a single LOC.

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, gpio_cascade_id);

--=20
With Best Regards,
Andy Shevchenko
