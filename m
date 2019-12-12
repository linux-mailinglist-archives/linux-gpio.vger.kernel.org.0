Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6A611CFE6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 15:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfLLOeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 09:34:25 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37073 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729709AbfLLOeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 09:34:25 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so2548751lja.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 06:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M01hRpD11CkkOeauBIVCjuItQ11kCezb4GIbMatT12c=;
        b=jwMxC2KjvVPAJJabNt2EixKGKNXDmT6INs3XC3sgyHNqZBtPmTN4Tm+tz0Ys8mMnlI
         6iXQrpWyX159Jei4YMB2xTsoD/xSMAZVmG2upOB4pQq9PG0NPT5ZVkVMoeHIMv0ALiLq
         ZqRfteFEjzauejojoUL4jnojtYaFCLrtZMLNlqiFNufQeb9yeU6XifAljnjLUYBpIRZ3
         hCe6KvmaOnpA8ZxohByGH/M3WUG0NmNop6Ept8tGjmI9oYU7NethV3yAqH8g+ORjoocp
         eKj+9MPSdmcu1QAjGxi/pYJmZ5pU1BKMgd/Xx5nJs25JpNgA5IejqQ41Bj0K/IkFut/G
         XvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M01hRpD11CkkOeauBIVCjuItQ11kCezb4GIbMatT12c=;
        b=jJqXOGnva6glzIjQhyTb53ZK7H87XnjGa/7vdlSBAyu5z45Petxl+sIsl4nXXaRuYF
         7+aCGRdlEPmK7pYfe5VN3cTHD06tzgFO5kCkTH3Xj3+QCEZTxVAii6Xmmp251nmFBq12
         n5TWEPIP/Rhxbn1CPurKgXPQw8llrU8UNHAg/B48YqXthnZ2hNOYWF9yGxj45OjSb9bR
         CTlj+7g+VNkVaHSnnV/mivJgokHb+avd2e4RmB1D/p+f6U2nfBPRJvNxiNBn8Xcvd24x
         nhGjH6e73SVnoc/bk6VdlLSxgYbC0riOpcPUrwI9wtBBjdu6WHZxXnIQl+7fVJfTtoqE
         PGfg==
X-Gm-Message-State: APjAAAVcWm/bYOHJvcW9djOiVLBF192vNVRBGOrZCN3m1RwBBl11xbAr
        S6ZW76sJ7+VHOE0Sik9GRU8dvuxNUzW9UAn+FvUw7A==
X-Google-Smtp-Source: APXvYqwxi4IxwAztLPEIoaBKmWi+PA6mLW1szFcIPlhkAwR494Ll690WDLTixRbkmknZWP+z6eu4/b3mbO4S/MBcekg=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr6202874ljk.77.1576161261524;
 Thu, 12 Dec 2019 06:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be> <20191127084253.16356-6-geert+renesas@glider.be>
In-Reply-To: <20191127084253.16356-6-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 15:34:09 +0100
Message-ID: <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

Hi Geert!

Thanks for this interesting patch!

On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
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
>   1. Aggregating GPIOs using Sysfs
>      This is useful for implementing access control, and assigning a set
>      of GPIOs to a specific user or virtual machine.
>
>   2. GPIO Repeater in Device Tree
>      This supports modelling e.g. GPIO inverters in DT.
>
>   3. Generic GPIO Driver
>      This provides userspace access to a simple GPIO-operated device
>      described in DT, cfr. e.g. spidev for SPI-operated devices.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Overall I like how this is developing!

> +config GPIO_AGGREGATOR
> +       tristate "GPIO Aggregator/Repeater"
> +       help
> +         Say yes here to enable the GPIO Aggregator and repeater, which
> +         provides a way to aggregate and/or repeat existing GPIOs into a new
> +         GPIO device.

Should it say a "new virtual GPIO chip"?

> +         This can serve the following purposes:
> +           1. Assign a collection of GPIOs to a user, or export them to a
> +              virtual machine,

This is ambiguous. What is a "user"? A process calling from
userspace? A device tree node?

I would write "assign a collection of GPIO lines from any lines on
existing physical GPIO chips to form a new virtual GPIO chip"

That should be to the point, right?

> +           2. Support GPIOs that are connected to a physical inverter,

s/to/through/g

> +           3. Provide a generic driver for a GPIO-operated device, to be
> +               controlled from userspace using the GPIO chardev interface.

I don't understand this, it needs to be elaborated. What is meant
by a "GPIO-operated device" in this context? Example?

I consistently use the term "GPIO line" as opposed to "GPIO"
or "GPIO number" etc that are abigous, so please rephrase using
"GPIO lines" rather than just "GPIOs" above.

> +#include "gpiolib.h"

Whenever this is included in a driver I want it to come with a comment
explicitly stating exactly why and which internal symbols the driver
needs to access. Ideally all drivers should just need <linux/gpio/driver.h>...

> +static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *label,
> +                        int hwnum, unsigned int *n)

u16 hwnum for the hardware number but if it is always -1/U16_MAX
then why pass the parameter at all.

Is "label" the right name of this parameter if that is going to actually
be line_name then use that.

> +{
> +       struct gpiod_lookup_table *lookups;
> +
> +       lookups = krealloc(aggr->lookups, struct_size(lookups, table, *n + 2),
> +                          GFP_KERNEL);
> +       if (!lookups)
> +               return -ENOMEM;
> +
> +       lookups->table[*n].chip_label = label;

This is pending the discussion on whether to just use "key" for this
name.

> +       lookups->table[*n].chip_hwnum = hwnum;

If this is always going to be U16_MAX (-1 in the current code)
then it can just be assigned as that here instead of passed as
parameter.

> +static int aggr_parse(struct gpio_aggregator *aggr)
> +{
> +       char *name, *offsets, *first, *last, *next;
> +       unsigned int a, b, i, n = 0;
> +       char *args = aggr->args;
> +       int error;
> +
> +       for (name = get_arg(&args), offsets = get_arg(&args); name;
> +            offsets = get_arg(&args)) {
> +               if (IS_ERR(name)) {
> +                       pr_err("Cannot get GPIO specifier: %ld\n",
> +                              PTR_ERR(name));
> +                       return PTR_ERR(name);
> +               }
> +
> +               if (!isrange(offsets)) {
> +                       /* Named GPIO line */
> +                       error = aggr_add_gpio(aggr, name, -1, &n);

So the third argument woule be U16_MAX here. Or not pass
a parameter at all.

But honestly, when I look at this I don't understand why you
have to avoid so hard to use offsets for the GPIO lines on
your aggregator?

Just put a u16 ngpios in your
struct gpio_aggregator and count it up every time you
add some new offsets here and you have
offset numbers for all your GPIO lines on the aggregator
and you can just drop the patch for lookup up lines by line
names.

Is there something wrong with my reasoning here?

At the pointe later when the lines are counted from the
allocated lookups using gpiod_count() that will just figure
out this number anyways, so it is not like we don't know
it at the end of the day.

So it seems the patch to gpiolib is just to use machine
descriptor tables as a substitute for a simple counter
variable in this local struct to me.

> +static void __exit gpio_aggregator_remove_all(void)
> +{
> +       mutex_lock(&gpio_aggregator_lock);
> +       idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
> +       idr_destroy(&gpio_aggregator_idr);
> +       mutex_unlock(&gpio_aggregator_lock);
> +}
> +
> +
> +       /*
> +        *  Common GPIO Forwarder
> +        */
> +

Nitpick: lots and weird spacing here.

> +struct gpiochip_fwd {
> +       struct gpio_chip chip;
> +       struct gpio_desc **descs;
> +       union {
> +               struct mutex mlock;     /* protects tmp[] if can_sleep */
> +               spinlock_t slock;       /* protects tmp[] if !can_sleep */
> +       };

That was a very elegant use of union!

> +static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +                                unsigned long *bits)
> +static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +                                 unsigned long *bits)

I guess these can both be optimized to use get/set_multiple on
the target chip if the offsets are consecutive?

However that is going to be tricky so I'm not saying you should
implement that. So for now, let's say just add a TODO: comment
about it.

> +static int gpio_fwd_init_valid_mask(struct gpio_chip *chip,
> +                                   unsigned long *valid_mask,
> +                                   unsigned int ngpios)
> +{
> +       struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +       unsigned int i;
> +
> +       for (i = 0; i < ngpios; i++) {
> +               if (!gpiochip_line_is_valid(fwd->descs[i]->gdev->chip,
> +                                           gpio_chip_hwgpio(fwd->descs[i])))
> +                       clear_bit(i, valid_mask);
> +       }

This is what uses "gpiolib.h" is it not?

devm_gpiod_get_index() will not succeed if the line
is not valid so I think this can be just dropped, since
what you do before this is exactly devm_gpiod_get_index()
on each line, then you call gpiochip_fwd_create()
with the result.

So I think you can just drop this entire function.
This will not happen.

If it does happen, add a comment above this loop
explaining which circumstances would make lines on
the forwarder invalid.

> +       for (i = 0; i < ngpios; i++) {
> +               dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
> +                       desc_to_gpio(descs[i]), descs[i]->label ? : "?");
> +
> +               if (gpiod_cansleep(descs[i]))
> +                       chip->can_sleep = true;
> +               if (descs[i]->gdev->chip->set_config)
> +                       chip->set_config = gpio_fwd_set_config;
> +               if (descs[i]->gdev->chip->init_valid_mask)
> +                       chip->init_valid_mask = gpio_fwd_init_valid_mask;
> +       }

I do not think you should need to inspect the init_valid_mask()
as explained above.

Add a comment above the loop that if any of the GPIO lines
are sleeping then the entire forwarder will be sleeping
and if any of the chips support .set_config() we will support
setting configs.

However the way that the .gpio_fwd_set_config() is coded
it looks like you can just unconditionally assign it and
only check the cansleep condition in this loop.

> +}
> +
> +
> +       /*
> +        *  Common GPIO Aggregator/Repeater platform device
> +        */
> +

Nitpick: weird and excess spacing again.

> +       for (i = 0; i < n; i++) {
> +               descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
> +               if (IS_ERR(descs[i]))
> +                       return PTR_ERR(descs[i]);
> +       }

If this succeeds none of the obtained gpio_desc:s can be
invalid.

Yours,
Linus Walleij
