Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8143BAA22
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhGCTjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 15:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhGCTjX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 15:39:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A625BC061762;
        Sat,  3 Jul 2021 12:36:49 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id j24so12614516pfi.12;
        Sat, 03 Jul 2021 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QJwXPHklFmm/M0F7FosREaVzctnCkZAKK3BhxKroh4E=;
        b=Ik4SjVjT394OT4b0ZiXqiYoiV8wAadFNh1nKnvy0xsoD/nUbvh1gfg9zSVqvngKlji
         tly/OjFIDTuBNEH8U3Nxdi2WP6YTQ9IKYuiaYy7dMDArXavN/dkrHoKvQ3rM6XhDM9DF
         HfviLJAvZI8CuMVDdzIOubf+UZ5BYR+eGJLs0e1esPKtLAon98tvQSW9Vgffo1lZsVX3
         Q2XUAqhhiE0w0ruTwF6CI2nZhACj3LbcO/ExZH1a56JD1Bz+SL+Y/81gNx5LFoCSQ5/n
         ipEmiBSWDXfPKkc5yunEEWhPo/Kk46q+x975bY1L9EckFeYJeVk4OD7Xy9vHZZiQJcBl
         Ia8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QJwXPHklFmm/M0F7FosREaVzctnCkZAKK3BhxKroh4E=;
        b=Sh1EVy42tSS+AfydzlTimCGIi0Czvj3tn0nU+umxI0JlrQ1mwXHB8zI2hsK0b4IEDX
         KbFel4P8i1UeOvh7HQ/J53mLELfjgQxnbezEZUPeDGPcZMtQ7RuR2tyEy3SI8FK5np27
         6mHX4wiLhLihKg/+Wf4+vIqaF9wlmEC4IlNaP9ZGRR0lMp8b1LOLiDQ6sJd6HttHGi6l
         PPBKoQWAG8aoZiOgM6gWRreVWBdJzJ5APih9dFHh0m0+BDwN7BDSN0/Wn3oOKdLJZDer
         8uKura4myu//ll30dncTfb5Of7GDKqUFRrq6UgXDZkks6rrm3corm96Yrc15s+6WS5ke
         a9Rw==
X-Gm-Message-State: AOAM533iJuomXYTDkiL1FlKuUX99GeMycIWLxgAucFsRpNYNkPju8EOE
        MVZAjlhupF1ShAa3jQ2MIY/+Dm1YfSmKNyedBo8=
X-Google-Smtp-Source: ABdhPJxxFL/lvNCNH/CWOol+QiT1hhYcc8osyzXmayJMl2Komgo60xwIJwNXrPUOlA7U0KVYTLEGHAhn/W9zGqM4iDY=
X-Received: by 2002:a63:d014:: with SMTP id z20mr6708365pgf.203.1625341009085;
 Sat, 03 Jul 2021 12:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
 <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
 <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
 <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
 <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com>
 <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com>
 <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com> <CAMhs-H8Y0txwcqRTxpsB_GEoOYbhHWO81EANMxMSybzWPS=HTA@mail.gmail.com>
In-Reply-To: <CAMhs-H8Y0txwcqRTxpsB_GEoOYbhHWO81EANMxMSybzWPS=HTA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 3 Jul 2021 22:36:12 +0300
Message-ID: <CAHp75VfRYZn5uuPgQHJ5Hm3p3XVrfs=ReZXxEPm+dqLNb5QtGA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 3, 2021 at 3:51 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Sat, Jul 3, 2021 at 2:05 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sat, Jul 3, 2021 at 1:32 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sat, Jul 3, 2021 at 2:06 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > -               ret = devprop_gpiochip_set_names(gc);
> > > > +               ret = devprop_gpiochip_set_names(gc, 0);
> > >
> > > I had been expecting that this parameter would be in the field of the gpiochip.
> > >
> > > ...
> >
> > If doing it in that way is preferred, I have no problem at all. But in
> > that case I think there is no need for a new
> > 'devprop_gpiochip_set_names_base' and we can assume for all drivers to
> > be zero and if is set taking it into account directly in
> > devprop_gpiochip_set_names function? Is this what you mean by having
> > this field added there??

The below is closer to what I meant, yes. I have not much time to look
into the details, but I don't have objections about what you suggested
below. Additional comments there as well.

> How about something like this?
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 82fb20dca53a..5854a9343491 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
>         if (!rg->chip.label)
>                 return -ENOMEM;
>
> +       rg->chip.offset = bank * MTK_BANK_WIDTH;
>         rg->irq_chip.name = dev_name(dev);
>         rg->irq_chip.parent_device = dev;
>         rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;

Obviously it should be a separate patch :-)

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6e3c4d7a7d14..0587f46b7c22 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -380,10 +380,10 @@ static int devprop_gpiochip_set_names(struct
> gpio_chip *chip)
>                 return 0;
>
>         count = device_property_string_array_count(dev, "gpio-line-names");
> -       if (count < 0)

> +       if (count < 0 || count <= chip->offset)

Please, split it into two conditionals and add a comment to the second one.

>                 return 0;
>
> -       if (count > gdev->ngpio) {
> +       if (count > gdev->ngpio && chip->offset == 0) {
>                 dev_warn(&gdev->dev, "gpio-line-names is length %d but
> should be at most length %d",
>                          count, gdev->ngpio);
>                 count = gdev->ngpio;
> @@ -401,8 +401,9 @@ static int devprop_gpiochip_set_names(struct
> gpio_chip *chip)
>                 return ret;
>         }
>
> +       count = (chip->offset >= count) ? (chip->offset - count) : count;

Too many parentheses.

>         for (i = 0; i < count; i++)
> -               gdev->descs[i].name = names[i];
> +               gdev->descs[i].name = names[chip->offset + i];
>
>         kfree(names);
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 4a7e295c3640..39e0786586f6 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -312,6 +312,9 @@ struct gpio_irq_chip {
>   *     get rid of the static GPIO number space in the long run.
>   * @ngpio: the number of GPIOs handled by this controller; the last GPIO
>   *     handled is (base + ngpio - 1).
> + * @offset: when multiple gpio chips belong to the same device this
> + *     can be used as offset within the device so friendly names can
> + *     be properly assigned.
>   * @names: if set, must be an array of strings to use as alternative
>   *      names for the GPIOs in this chip. Any entry in the array
>   *      may be NULL if there is no alias for the GPIO, however the
> @@ -398,6 +401,7 @@ struct gpio_chip {
>
>         int                     base;
>         u16                     ngpio;
> +       int                     offset;

u16 (as ngpio has that type)

>         const char              *const *names;
>         bool                    can_sleep;
>
>
> Does this sound reasonable?

> > > > The problem I see with this approach is that
> > > > 'devprop_gpiochip_set_names' already trusts in gpio_device already
> > > > created and this happens in 'gpiochip_add_data_with_key'. So doing in
> > > > this way force "broken drivers" to call this new
> > > > 'devprop_gpiochip_set_names_base' function after
> > > > 'devm_gpiochip_add_data' is called so the core code has already set up
> > > > the friendly names repeated for all gpio chip banks and the approach
> > > > would be to "overwrite" those in a second pass which sounds more like
> > > > a hack than a solution.
> > > >
> > > > But maybe I am missing something in what you were pointing out here.
> > >
> > > Would the above work?

-- 
With Best Regards,
Andy Shevchenko
