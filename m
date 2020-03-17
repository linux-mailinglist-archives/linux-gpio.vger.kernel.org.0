Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24F8187EB4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 11:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCQKua (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 06:50:30 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36545 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgCQKu3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 06:50:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id 39so5697812otu.3;
        Tue, 17 Mar 2020 03:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4RHKUQaqLP0RIgfBpLL5qOEOQG1NeX+nzzByYvELZmw=;
        b=Ct4BrrRyd6FKIOM3sz16sP3XI/ZZW/XrB3uULRBkW3ShVZ/q/GRajsj/4mgPgQcbes
         MENTKs65az5Zia3U8GT5kstaTs+KVO4fFy92WnWvMtbNvdCiPboxTzxBkzQxoC+wc+zC
         6rjgW9ID1aXfSSVwtmTROwdrLO5IEJPDZr0DOhdeupo5hm/yFlhmv+SZNdIesECHa8YW
         svHIVt/wFr55DUTiSczig1POI9D4Erlv34UByMrihTyuYBchZmnm5u/Hl7sASOmjhh5M
         vGuS8PStWcbtyzKHK7ormqfRWyOSznkkVlaSE/1kGhdGQtBsDl5g/kC96MO4U+m7r7CX
         lTvA==
X-Gm-Message-State: ANhLgQ180CmeEysxlatCKk1Ozfr6XL2sqizT1sHJvBflEMWZ7DqHuO44
        OBAGeE3GNYTelst7Pm1eDCmnzhLhPotmeGTBv9c=
X-Google-Smtp-Source: ADFU+vvCnj5TM9jDoklN6SW2pOqgA8Yhy1UV90pkEYu70e2sIcYjz1ttaGrq9DI81fCb/fZk6X299+gFRk0K7Dbjlgs=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr2946810otf.107.1584442226939;
 Tue, 17 Mar 2020 03:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-4-geert+renesas@glider.be> <CACRpkdacAaw4PJp3Oa569JJTHTB4HjP-hPqZLmdFcuxvdvwBHg@mail.gmail.com>
In-Reply-To: <CACRpkdacAaw4PJp3Oa569JJTHTB4HjP-hPqZLmdFcuxvdvwBHg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Mar 2020 11:50:15 +0100
Message-ID: <CAMuHMdVnoZ8uki9Ur-E-pDe60U_d=hNs8GTkMoTU3kACwFeY=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: Add GPIO Aggregator
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Mar 12, 2020 at 3:57 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> thanks for your patience and again sorry for procrastination on my part :(
>
> Overall I start to like this driver a lot. It has come a long way.
>
> Some comments below are nitpicky, bear with me if they seem stupid.

Thanks a lot for your comments!

> On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > +#define DRV_NAME       "gpio-aggregator"
> > +#define pr_fmt(fmt)    DRV_NAME ": " fmt
>
> I would just use dev_[info|err] for all messages to get rid of this.

See below.

> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> > +#include <linux/ctype.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/idr.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/overflow.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +
> > +#include "gpiolib.h"
>
> When this file is includes I prefer if there is a comment next to
> this include saying why we have to touch internals and which
> ones.

I have just discovered gpiod_to_chip(), which removes the need for two
of the three users ;-)

> > +struct gpio_aggregator {
> > +       struct gpiod_lookup_table *lookups;
> > +       struct platform_device *pdev;
>
> What about just storing struct device *dev?
>
> Then callbacks can just
>
> dev_err(aggregator->dev, "myerror\n");

&aggr->pdev.dev or aggr->dev does't make much of a difference.

> > +static char *get_arg(char **args)
> > +{
> > +       char *start = *args, *end;
> > +
> > +       start = skip_spaces(start);
> > +       if (!*start)
> > +               return NULL;
> > +
> > +       if (*start == '"') {
> > +               /* Quoted arg */
> > +               end = strchr(++start, '"');
> > +               if (!end)
> > +                       return ERR_PTR(-EINVAL);
> > +       } else {
> > +               /* Unquoted arg */
> > +               for (end = start; *end && !isspace(*end); end++) ;
> > +       }
> > +
> > +       if (*end)
> > +               *end++ = '\0';
> > +
> > +       *args = end;
> > +       return start;
> > +}
>
> Isn't this function reimplementing strsep()?
> while ((s = strsep(&p, " \""))) {
> or something.
>
> I'm not the best with strings, just asking so I know you tried it
> already.

strsep(&p, " \"") would terminate the token if a space or double quote is
seen.  I.e. it wouldn't handle spaces in quoted arguments.
There's also argv_split(), but that doesn't handle quoted args, and
duplicates all arguments.

Line names assigned by "gpio-lines-names" may contain spaces, so support
for quoted args is mandatory.

> > +static int aggr_parse(struct gpio_aggregator *aggr)
> > +{
> > +       unsigned int first_index, last_index, i, n = 0;
> > +       char *name, *offsets, *first, *last, *next;
> > +       char *args = aggr->args;
> > +       int error;
> > +
> > +       for (name = get_arg(&args), offsets = get_arg(&args); name;
> > +            offsets = get_arg(&args)) {
> > +               if (IS_ERR(name)) {
> > +                       pr_err("Cannot get GPIO specifier: %pe\n", name);
>
> If gpio_aggregrator contained struct device *dev this would be
> dev_err(aggr->dev, "...\n");

aggr_parse() is called before the platform device is created, and before
aggr->pdev is populated.  So there is no device to print yet.

> > +static void gpio_aggregator_free(struct gpio_aggregator *aggr)
> > +{
> > +       platform_device_unregister(aggr->pdev);
>
> Aha maybe store both the pdev and the dev in the struct then?
>
> Or print using &aggr->pdev.dev.

Same for aggr->pdev.dev (or aggr->dev).

> > +       /*
> > +        * If any of the GPIO lines are sleeping, then the entire forwarder
> > +        * will be sleeping.
> > +        * If any of the chips support .set_config(), then the forwarder will
> > +        * support setting configs.
> > +        */
> > +       for (i = 0; i < ngpios; i++) {
> > +               dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
> > +                       desc_to_gpio(descs[i]), descs[i]->label ? : "?");
>
> If this desc->label business is why you need to include
> "gpiolib.h" then I'd prefer if you just add a

It was the third reason to include that file...

> const char *gpiod_get_producer_name(struct gpio_desc *desc);
>
> to gpiolib (add in <linux/gpio/consumer.h> so that gpiolib can
> try to give you something reasonable to print for the label here.
> I ran into that problem before (wanting to print something like this)
> and usually just printed the offset.
>
> But if it is a serious debug issue, let's fix a helper for this.
>
> gpiod_get_producer_name() could return the thing in
> desc->label if that is set or else something along
> "chipname-offset" or "unknown", I'm not very picky
> with that.

I will just remove the printing of the label, as it is no longer useful.
Since I started using gpiod_lookup, the descriptor has already been
requested at this point, which means its label will usually be
"gpio-aggregator.N", i.e. it doesn't provide any help.
The only exception is for a GPIO line which has an associated line name
through "gpio-line-names" in DT.  But just seeing the global GPIO number
should be good enough for debugging.

BTW, one day you may want to have your our printk() format specifier for
GPIOs?  Oh, no "%pg" and "%pG" are already taken; "%pp" is still
available.

> > error = aggr_add_gpio(aggr, name, U16_MAX, &n);
>
> Is the reason why you use e.g. "gpiochip0" as name here that this
> is a simple ABI for userspace?

"name" is not the "gpiochipN" name here, but the line name, cfr. the
U16_MAX value for chip index, and the comment just above:

+                       /* Named GPIO line */

That one is supposed to be stable, right?
Note that this is the most use-centric way to refer to a GPIO.

In the other caller:

+                               error = aggr_add_gpio(aggr, name, i, &n);

"name" is a reference to the gpiochip, i.e. either its label, or the
"gpiochipN" name.

> Such like obtained from /sys/bus/gpio/devices/<chipname>?
>
> I would actually prefer to just add a sysfs attribute
> such as "name" and set it to the value of gpiochip->label.

Makes sense, but that would be a separate, unrelated patch, right?

> These labels are compulsory and supposed to be unique.
>
> Then whatever creates an aggregator can just use
> cat /sys/bus/gpio/devices/gpiochipN/name to send in
> through the sysfs interface to this kernel driver.
>
> This will protect you in the following way:
>
> When a system is booted and populated the N in
> gpiochipN is not stable and this aggregator will be used
> by scripts that assume it is. We already had this dilemma
> with things like network interfaces like eth0/1.
>
> This can be because of things like probe order which
> can be random, or because someone compiled a
> kernel with a new driver for a gpiochip that wasn't
> detected before. This recently happened to Raspberry Pi,
> that added gpio driver for "firmware GPIOs" (IIRC).
>
> The label on the chip is going to be more stable
> I think, so it is better to use that.

OK, so support for "gpiochipN" matching can be dropped, obsoleting
"[PATCH v5 1/5] gpiolib: Add support for gpiochipN-based table lookup".

Note that I added support for that in response to Bartosz' first try
https://lore.kernel.org/linux-gpio/CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com/

> This should also rid the need to include "gpiolib.h"
> which makes me nervous.

Consider it done!
Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
