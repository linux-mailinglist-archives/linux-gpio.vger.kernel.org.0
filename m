Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A675411D0EE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfLLPYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:24:32 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37245 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbfLLPYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:24:32 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so2361923otn.4;
        Thu, 12 Dec 2019 07:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5eiYdgaPsuaNjKat9eSh0SH2mSzf4JO+utEpUCnyTPo=;
        b=WExrg24pnmBa4YtvJ4DuZRuuHLJumkSo4Q4X8Nk5xl1XVVxeNShquezq+0ylR2fRqN
         TQ5iDbXnwskX0+HlLjlz1rOPz8+rYJud6TDpGcKT8osvXwT5Ghyu7tVm2G7fQiALidg3
         iwfe7sd0hCNaHK2jgcjvl4LvK/mmLDSK2Ze60oWPTryh/UgsHzWDtNbDvyEIdAupSkyh
         vBHLWhgI1c/NjRSs+9QkpVy6SSQDV+bGroOcsiSUpj3PtS2W5mRe+7XtNCEARAT44cnK
         JXcRPSglmsPwN8PeNYFFTTlAmxJLXnHLBgNwFS7lhMkRcCedH9hw4qQtZFrH6YeAPs4p
         v58w==
X-Gm-Message-State: APjAAAVxpH4sasry5qBe5BzxKPoslnUZ/MoZ+kvB7aebZYCRCA2QJmmY
        1jTOetVQoXZZmkQ3TvqEDCta1DBBBnM3v2c3Qr8=
X-Google-Smtp-Source: APXvYqx6G6JtyfrS3/BoIs3YPBAZEJjC6Ig0g5RdBo+a7S4dxiDcydAEHMgy/uFa2xd0GFBBLcu73j0JFKA2CIyvPnk=
X-Received: by 2002:a05:6830:91:: with SMTP id a17mr8257869oto.107.1576164270611;
 Thu, 12 Dec 2019 07:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
In-Reply-To: <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 16:24:19 +0100
Message-ID: <CAMuHMdVbk5S__8OK-zNXmiW66=WVA8Jzyc=hUvf_hJSU=u9TFg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
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

On Thu, Dec 12, 2019 at 3:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > GPIO controllers are exported to userspace using /dev/gpiochip*
> > character devices.  Access control to these devices is provided by
> > standard UNIX file system permissions, on an all-or-nothing basis:
> > either a GPIO controller is accessible for a user, or it is not.
> > Currently no mechanism exists to control access to individual GPIOs.
> >
> > Hence add a GPIO driver to aggregate existing GPIOs, and expose them as
> > a new gpiochip.
> >
> > This supports the following use cases:
> >   1. Aggregating GPIOs using Sysfs
> >      This is useful for implementing access control, and assigning a set
> >      of GPIOs to a specific user or virtual machine.
> >
> >   2. GPIO Repeater in Device Tree
> >      This supports modelling e.g. GPIO inverters in DT.
> >
> >   3. Generic GPIO Driver
> >      This provides userspace access to a simple GPIO-operated device
> >      described in DT, cfr. e.g. spidev for SPI-operated devices.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Overall I like how this is developing!
>
> > +config GPIO_AGGREGATOR
> > +       tristate "GPIO Aggregator/Repeater"
> > +       help
> > +         Say yes here to enable the GPIO Aggregator and repeater, which
> > +         provides a way to aggregate and/or repeat existing GPIOs into a new
> > +         GPIO device.
>
> Should it say a "new virtual GPIO chip"?

OK.

> > +         This can serve the following purposes:
> > +           1. Assign a collection of GPIOs to a user, or export them to a
> > +              virtual machine,
>
> This is ambiguous. What is a "user"? A process calling from
> userspace? A device tree node?

A user is an entity with a UID, typically listed in /etc/passwd.
This is similar to letting some, not all, people on the machine access
the CD-ROM drive.

> I would write "assign a collection of GPIO lines from any lines on
> existing physical GPIO chips to form a new virtual GPIO chip"
>
> That should be to the point, right?

Yes, that's WHAT it does. The WHY is the granular access control.

> > +           2. Support GPIOs that are connected to a physical inverter,
>
> s/to/through/g

OK.

> > +           3. Provide a generic driver for a GPIO-operated device, to be
> > +               controlled from userspace using the GPIO chardev interface.
>
> I don't understand this, it needs to be elaborated. What is meant
> by a "GPIO-operated device" in this context? Example?

E.g. a motor. Or a door opener.

        door-opener {
                compatible = "mydoor,opener";

                gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
        };

You don't need a full-featured kernel driver for that, so just bind the
gpio-aggregator to the door-opener, and control it through libgpiod.

> I consistently use the term "GPIO line" as opposed to "GPIO"
> or "GPIO number" etc that are abigous, so please rephrase using
> "GPIO lines" rather than just "GPIOs" above.

OK.

> > +#include "gpiolib.h"
>
> Whenever this is included in a driver I want it to come with a comment
> explicitly stating exactly why and which internal symbols the driver
> needs to access. Ideally all drivers should just need <linux/gpio/driver.h>...

"gpiolib.h" is needed to access gpio_desc.gdev->chip in
gpio_fwd_set_config().  And for gpio_chip_hwgpio() (see below).

But indeed, I should add #include <linux/gpio/consumer.h>, for e.g. the
various gpiod_[gs]et_*() functions.

> > +static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *label,
> > +                        int hwnum, unsigned int *n)
>
> u16 hwnum for the hardware number but if it is always -1/U16_MAX
> then why pass the parameter at all.
>
> Is "label" the right name of this parameter if that is going to actually
> be line_name then use that.

It's not always -1.
This function can be called either with a gpiochip label/name and an
offset, or a line-name and -1.

> > +{
> > +       struct gpiod_lookup_table *lookups;
> > +
> > +       lookups = krealloc(aggr->lookups, struct_size(lookups, table, *n + 2),
> > +                          GFP_KERNEL);
> > +       if (!lookups)
> > +               return -ENOMEM;
> > +
> > +       lookups->table[*n].chip_label = label;
>
> This is pending the discussion on whether to just use "key" for this
> name.

Which would require touching all users (board files and mfd drivers).

> > +       lookups->table[*n].chip_hwnum = hwnum;
>
> If this is always going to be U16_MAX (-1 in the current code)
> then it can just be assigned as that here instead of passed as
> parameter.

So it's not, see above.

> > +static int aggr_parse(struct gpio_aggregator *aggr)
> > +{
> > +       char *name, *offsets, *first, *last, *next;
> > +       unsigned int a, b, i, n = 0;
> > +       char *args = aggr->args;
> > +       int error;
> > +
> > +       for (name = get_arg(&args), offsets = get_arg(&args); name;
> > +            offsets = get_arg(&args)) {
> > +               if (IS_ERR(name)) {
> > +                       pr_err("Cannot get GPIO specifier: %ld\n",
> > +                              PTR_ERR(name));
> > +                       return PTR_ERR(name);
> > +               }
> > +
> > +               if (!isrange(offsets)) {
> > +                       /* Named GPIO line */
> > +                       error = aggr_add_gpio(aggr, name, -1, &n);
>
> So the third argument woule be U16_MAX here. Or not pass
> a parameter at all.
>
> But honestly, when I look at this I don't understand why you
> have to avoid so hard to use offsets for the GPIO lines on
> your aggregator?
>
> Just put a u16 ngpios in your
> struct gpio_aggregator and count it up every time you
> add some new offsets here and you have
> offset numbers for all your GPIO lines on the aggregator
> and you can just drop the patch for lookup up lines by line
> names.
>
> Is there something wrong with my reasoning here?

Yes, I think there is.
The offsets are not offsets on the aggregated gpiochip, but on the
original target gpiochip.

> At the pointe later when the lines are counted from the
> allocated lookups using gpiod_count() that will just figure
> out this number anyways, so it is not like we don't know
> it at the end of the day.
>
> So it seems the patch to gpiolib is just to use machine
> descriptor tables as a substitute for a simple counter
> variable in this local struct to me.

Nope, it's used for looking up the target GPIO lines.

> > +static void __exit gpio_aggregator_remove_all(void)
> > +{
> > +       mutex_lock(&gpio_aggregator_lock);
> > +       idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
> > +       idr_destroy(&gpio_aggregator_idr);
> > +       mutex_unlock(&gpio_aggregator_lock);
> > +}
> > +
> > +
> > +       /*
> > +        *  Common GPIO Forwarder
> > +        */
> > +
>
> Nitpick: lots and weird spacing here.

OK.

> > +struct gpiochip_fwd {
> > +       struct gpio_chip chip;
> > +       struct gpio_desc **descs;
> > +       union {
> > +               struct mutex mlock;     /* protects tmp[] if can_sleep */
> > +               spinlock_t slock;       /* protects tmp[] if !can_sleep */
> > +       };
>
> That was a very elegant use of union!
>
> > +static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> > +                                unsigned long *bits)
> > +static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> > +                                 unsigned long *bits)
>
> I guess these can both be optimized to use get/set_multiple on
> the target chip if the offsets are consecutive?
>
> However that is going to be tricky so I'm not saying you should
> implement that. So for now, let's say just add a TODO: comment
> about it.

Doesn't gpiod_[gs]et_array_value() already call .[gs]et_multiple()?

> > +static int gpio_fwd_init_valid_mask(struct gpio_chip *chip,
> > +                                   unsigned long *valid_mask,
> > +                                   unsigned int ngpios)
> > +{
> > +       struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < ngpios; i++) {
> > +               if (!gpiochip_line_is_valid(fwd->descs[i]->gdev->chip,
> > +                                           gpio_chip_hwgpio(fwd->descs[i])))
> > +                       clear_bit(i, valid_mask);
> > +       }
>
> This is what uses "gpiolib.h" is it not?
>
> devm_gpiod_get_index() will not succeed if the line
> is not valid so I think this can be just dropped, since
> what you do before this is exactly devm_gpiod_get_index()
> on each line, then you call gpiochip_fwd_create()
> with the result.
>
> So I think you can just drop this entire function.
> This will not happen.

OK, if all lines are valid, the mask handling is indeed not needed.

> If it does happen, add a comment above this loop
> explaining which circumstances would make lines on
> the forwarder invalid.

OK, so cannot happen.

> > +       for (i = 0; i < ngpios; i++) {
> > +               dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
> > +                       desc_to_gpio(descs[i]), descs[i]->label ? : "?");
> > +
> > +               if (gpiod_cansleep(descs[i]))
> > +                       chip->can_sleep = true;
> > +               if (descs[i]->gdev->chip->set_config)
> > +                       chip->set_config = gpio_fwd_set_config;
> > +               if (descs[i]->gdev->chip->init_valid_mask)
> > +                       chip->init_valid_mask = gpio_fwd_init_valid_mask;
> > +       }
>
> I do not think you should need to inspect the init_valid_mask()
> as explained above.

OK.

> Add a comment above the loop that if any of the GPIO lines
> are sleeping then the entire forwarder will be sleeping
> and if any of the chips support .set_config() we will support
> setting configs.

OK.

> However the way that the .gpio_fwd_set_config() is coded
> it looks like you can just unconditionally assign it and
> only check the cansleep condition in this loop.

I wanted to avoid the overhead of calling into gpio_fwd_set_config() if
none of the targets gpiochips support .set_config(), see
gpiod_set_transitory().

> > +}
> > +
> > +
> > +       /*
> > +        *  Common GPIO Aggregator/Repeater platform device
> > +        */
> > +
>
> Nitpick: weird and excess spacing again.

Yeah, this dates back from when the aggregator, repeater, and
forwarder were all separate files and modules.

> > +       for (i = 0; i < n; i++) {
> > +               descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
> > +               if (IS_ERR(descs[i]))
> > +                       return PTR_ERR(descs[i]);
> > +       }
>
> If this succeeds none of the obtained gpio_desc:s can be
> invalid.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
