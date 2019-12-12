Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92B211CE5D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfLLNdh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:33:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40342 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729302AbfLLNdh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 08:33:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id 6so410540oix.7;
        Thu, 12 Dec 2019 05:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B1c5GbpC2qZV4XZL32ReXMmOl4Gf9Xdye7e43MFMR8g=;
        b=ir+J4KCiAPAkjvp0ky7CL/fRvOfMW0Zm7o6v1rXeaVUwDUxF+C9TNjXpn/BysOxlk7
         jJoVe5vx7/SBDPPYb7u1VhtIifglsrR+YblRpsrivUjYZYP9lccjXlwbyfruFgZBi8qa
         FG80TRt7j8ounLnQC3UpkFKEVH/R6a6/IJHuA+ChO6JBMQ5umQTxLXd46SyztwKTsBUj
         +kXOZseOs9sI5AUoKcO2Vr3PN/+LrB6oxo5jqQKIwFy3+s96Uop2ypSNkqKzDZ5/i3KZ
         6oaJR4CsJthXtHp5SJYfNYltMOJyuTE6WmZQV9n85PdWWAtrg0fWq9yUp/ixquWJprKb
         WHPA==
X-Gm-Message-State: APjAAAVhFittvr2zZoo96SeXv2x9q8StI17TKbAhNdj1Uu3I2nzUKQ7u
        HaYg40oYzoh4JCwP1mVESs5PZCWVAVuwNI6D3Tk=
X-Google-Smtp-Source: APXvYqyZrB81syD0Ce6WwALcSofZswA84PMJGyV785ydrh5qmd3i1ZIC8I8AuxCcmSbHRH3rYOaGved6PnxX/cMztls=
X-Received: by 2002:aca:4e87:: with SMTP id c129mr4645921oib.153.1576157615510;
 Thu, 12 Dec 2019 05:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-3-geert+renesas@glider.be> <CACRpkdYyY0eGipdK6ixZxLtdJ5px=U2mOa79VZb00NEEAEL=6g@mail.gmail.com>
In-Reply-To: <CACRpkdYyY0eGipdK6ixZxLtdJ5px=U2mOa79VZb00NEEAEL=6g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 14:33:24 +0100
Message-ID: <CAMuHMdVL2w=DzOHTh-Tq6NZLTNUKxUneMi3wX71Z83mdsy3LTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table lookup
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Dec 12, 2019 at 2:20 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently GPIO controllers can only be referred to by label in GPIO
> > lookup tables.
> >
> > Add support for looking them up by "gpiochipN" name, with "N" either the
> > corresponding GPIO device's ID number, or the GPIO controller's first
> > GPIO number.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> What the commit message is missing is a rationale, why is this needed?

Right. To be added: so they can be looked up in the GPIO lookup table
using either the chip's label, or the "gpiochipN" name.

> > If this is rejected, the GPIO Aggregator documentation must be updated.
> >
> > The second variant is currently used by the legacy sysfs interface only,
> > so perhaps the chip->base check should be dropped?
>
> Anything improving the sysfs is actively discouraged by me.
> If it is just about staying compatible it is another thing.

OK, so N must be the corresponding GPIO device's ID number.

> > +static int gpiochip_match_id(struct gpio_chip *chip, void *data)
> > +{
> > +       int id = (uintptr_t)data;
> > +
> > +       return id == chip->base || id == chip->gpiodev->id;
> > +}
> >  static struct gpio_chip *find_chip_by_name(const char *name)
> >  {
> > -       return gpiochip_find((void *)name, gpiochip_match_name);
> > +       struct gpio_chip *chip;
> > +       int id;
> > +
> > +       chip = gpiochip_find((void *)name, gpiochip_match_name);
> > +       if (chip)
> > +               return chip;
> > +
> > +       if (!str_has_prefix(name, GPIOCHIP_NAME))
> > +               return NULL;
> > +
> > +       if (kstrtoint(name + strlen(GPIOCHIP_NAME), 10, &id))
> > +               return NULL;
> > +
> > +       return gpiochip_find((void *)(uintptr_t)id, gpiochip_match_id);
>
> Isn't it easier to just  augment the existing match function to
> check like this:
>
> static int gpiochip_match_name(struct gpio_chip *chip, void *data)
> {
>         const char *name = data;
>
>         if (!strcmp(chip->label, name))
>                return 0;

return true;

>         return !strcmp(dev_name(&chip->gpiodev->dev), name);
> }

Oh, didn't think of using dev_name() on the gpiodev.
Yes, with the chip->base check removed, the code can be simplified.

Or just

        return !strcmp(chip->label, name) ||
               !strcmp(dev_name(&chip->gpiodev->dev), name);

> We should I guess also add some kerneldoc to say we first
> match on the label and second on dev_name().

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
