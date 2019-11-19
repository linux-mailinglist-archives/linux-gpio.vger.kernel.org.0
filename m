Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C086102725
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 15:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfKSOoD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 09:44:03 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39891 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbfKSOoC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 09:44:02 -0500
Received: by mail-lf1-f65.google.com with SMTP id f18so4922734lfj.6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3HGForXYrnzKKwFOiKAr5qSOuuqdU2k4wA1CfbalcbQ=;
        b=o8/7NQNCdscgcAzoUXE+jNTk/DJagMvuw5Z5JaWY30/Z/muA51WNthzWcG+/MtHPBP
         ny6dVonMKRnen+it9ngeeXt1nR2rMvm4MxOKRsW5mUt9arjSEhZM4tMEKXJRcjqQx8t8
         UwAYBSUYodJCrJjJxwSpcnYicu7wJuE+0By/ddHV3P+BQR3Lp7t+G1kjRHchnAx24qMJ
         SA9vVP9M+gd+aI6o0RnPHJ0b1q0yRooX6UUA86zcAYvWai/ge//6X1NsbP93Bwm+VLIX
         BqN6l+PH8M5Cw6YFIvmW/Ygb/vNNIT3uU4vu68nKXH9wt785xkMpxaAXLMSC4C3ZTGrO
         vEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3HGForXYrnzKKwFOiKAr5qSOuuqdU2k4wA1CfbalcbQ=;
        b=sexShm3ljdH7YblTlsR/55TTlQdhG+ZVtvCPOQwxe0Jf0jAUWyeA800TMrpKEF56DD
         Asvhkx5L5752E25TnZWl038mn/VOLQk4xZfd6R6goGbV2GlGkDGORYnx3luFws8DXhsg
         BiPKtWGjZvj6s9mT0gCT1RCSV0sKsIPyBx7wXlDsHelMmxBK6C/DcoKs7wGKxXkFUZ4V
         Ga5KLIBlaijnkEnv6lcrqUxt3S6SwNbaIe9PRthnSUnIa/DpD0582bbjUEXdjcMIrO5I
         UMzpbitonCiTgWlaLYaZDMpKLXS5215the7gEPAI9LIbgXsls5gc6u2Gv9LW+nEj/mTM
         3+vw==
X-Gm-Message-State: APjAAAWu3c9vdqqxOVqlsYXGQGtxeLpDPqyjiL2WV02mq4jk9MuU2vJa
        I/4QA0skYVfJ8MO9HAtoPKI+vac5JA/KNHEoTx+XQQ==
X-Google-Smtp-Source: APXvYqxiJDKtjaMparegwwsvRl+fvmQtXcsqSKBMv1kiOZ+otWv/0CzoTQp+omLTRtPr/aKLvkVblynEb9GKo+vyzx0=
X-Received: by 2002:a19:651b:: with SMTP id z27mr4166813lfb.117.1574174639988;
 Tue, 19 Nov 2019 06:43:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com> <8dd9dad2765d47fd6c6fec20566326d00e48a696.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <8dd9dad2765d47fd6c6fec20566326d00e48a696.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 15:43:47 +0100
Message-ID: <CACRpkdY_2WzAnK01bQdMF69KsDvHHu9TXuyRoBcmiQMziux=eQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] gpio: devres: Add devm_gpiod_get_parent_array
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 7:58 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Bunch of MFD sub-devices which are instantiated by MFD do not have
> own device-tree nodes but have (for example) the GPIO consumer
> information in parent device's DT node. Add resource managed
> devm_gpiod_get_array() for such devices so that they can get the
> consumer information from parent DT while still binding the GPIO
> reservation life-time to this sub-device life time.
>
> If devm_gpiod_get_array is used as such - then unloading and then
> re-loading the child device fails as the GPIOs reserved during first
> load are not freed when driver for sub-device is unload (if parent
> stays there).
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
(...)
> +static struct gpio_descs *__must_check
> +__devm_gpiod_get_array(struct device *gpiodev,
> +                      struct device *managed,
> +                      const char *con_id,
> +                      enum gpiod_flags flags)

I'm opposed to functions named __underscore_something()
so find a proper name for this function.
devm_gpiod_get_array_common() works if nothing else.

> @@ -292,19 +284,62 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
>         if (!dr)
>                 return ERR_PTR(-ENOMEM);
>
> -       descs = gpiod_get_array(dev, con_id, flags);
> +       descs = gpiod_get_array(gpiodev, con_id, flags);
>         if (IS_ERR(descs)) {
>                 devres_free(dr);
>                 return descs;
>         }
>
>         *dr = descs;
> -       devres_add(dev, dr);
> +       if (managed)
> +               devres_add(managed, dr);
> +       else
> +               devres_add(gpiodev, dr);

So we only get managed resources if the "managed" device is
passed in.

> +/**
> + * devm_gpiod_get_array - Resource-managed gpiod_get_array()

And this function is supposed to be resource managed for sure.

> + * @dev:       GPIO consumer
> + * @con_id:    function within the GPIO consumer
> + * @flags:     optional GPIO initialization flags
> + *
> + * Managed gpiod_get_array(). GPIO descriptors returned from this function are
> + * automatically disposed on driver detach. See gpiod_get_array() for detailed
> + * information about behavior and return values.
> + */
> +struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
> +                                                    const char *con_id,
> +                                                    enum gpiod_flags flags)
> +{
> +       return __devm_gpiod_get_array(dev, NULL, con_id, flags);

So what is this? NULL?

Doesn't that mean you just removed all resource management for this
call?

Or am I reading it wrong?

Yours,
Linus Walleij
