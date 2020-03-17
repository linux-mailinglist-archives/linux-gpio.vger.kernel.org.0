Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E8B188241
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 12:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgCQLcq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 07:32:46 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42291 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQLcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 07:32:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id a2so362818otq.9;
        Tue, 17 Mar 2020 04:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yETyFwQ9Htl1KGbLhFFP34JxwM+8all8kt5P2BYv2cs=;
        b=fFmWaGRP50iLWykmVJMdnEKnpISzEjo9Sn0f1FwWkcW/b+/a2QQhFmVdPlvbFS3WaH
         yGlVd6Qj9wfuOK4rAOCEqjh345Vk63nTpOHsyckuJO4luM5x8giHWlbjhe45f3pY62xy
         hE5+fUPtfuuRv3TNobMIeVOCgAVVMmDf6oDKmbj6vZtdC7iF+sv7+aluMJgBjD9+q9zy
         E2ij2P3iO73fiIUpJk8y9ENCsA+MR8qOFAbZ3L40pIW57E+irTeiA0QwDHjPYiwyxtbS
         Ha10zX+5EJ7qoJZBnEqlR2enM9jM7VbUkflNLtZKooC95MJeh27URlNMY10VnvJbVKRS
         thmA==
X-Gm-Message-State: ANhLgQ0xU5/AaCkxHNeIDFuPw7wxuPKBc6+R4U3TlZha5Rn1fTePRvk1
        mXCElEIonS1sEGkrUdElq6jKMgOkmfG9QyTH3VE=
X-Google-Smtp-Source: ADFU+vvQTAgcQxsOpqflnHCgzX47yo6RoUnPbT1ipGmHWNBjNYcXjsyzilFOOHau23AhLSA/+Thi1PZ5zI/u0X1X+7w=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr3337224ota.250.1584444762958;
 Tue, 17 Mar 2020 04:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be> <20200218151812.7816-4-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-4-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Mar 2020 12:32:31 +0100
Message-ID: <CAMuHMdWXJKdD7j6QiRb4fL+fFsyDKpc7aGK-nER=CZd7bxGyPg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: Add GPIO Aggregator
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
>
> Hence add a GPIO driver to aggregate existing GPIOs, and expose them as
> a new gpiochip.
>
> This supports the following use cases:
>   - Aggregating GPIOs using Sysfs
>     This is useful for implementing access control, and assigning a set
>     of GPIOs to a specific user or virtual machine.
>   - Generic GPIO Driver
>     This is useful for industrial control, where it can provide
>     userspace access to a simple GPIO-operated device described in DT,
>     cfr. e.g. spidev for SPI-operated devices.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/drivers/gpio/gpio-aggregator.c

> +static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> +                              unsigned long config)
> +{
> +       struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +       chip = fwd->descs[offset]->gdev->chip;
> +       if (chip->set_config)

-       chip = fwd->descs[offset]->gdev->chip;
-       if (chip->set_config)
+       chip = gpiod_to_chip(fwd->descs[offset]);
+       if (chip && chip->set_config)

> +               return chip->set_config(chip, offset, config);

This is not correct: offset should be translated, too, i.e.

    offset = gpio_chip_hwgpio(fwd->descs[offset]);

Which adds a new dependency on "gpiolib.h"...

Is there a better alternative, than providing a public gpiod_set_config()
helper?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
