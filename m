Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2093E3BABA5
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jul 2021 07:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGDGAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 02:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhGDGAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jul 2021 02:00:31 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EB9C061762;
        Sat,  3 Jul 2021 22:57:55 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id c26so8296926vso.8;
        Sat, 03 Jul 2021 22:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kf/H9JjJmGnHIaVeVVll6XvW7wIZP51HMkNthrDXfI8=;
        b=de1PSN6jLhM/HbuNPvArURudupbavN538rDQUrs5N4BdbSCbB9VQYyVTl0xMduvavL
         jIBtXvjh1QvMAZhZjxJvxqEfi+tGkvipzFcfo7zwlVNIa3OfokBqMs4eIJItKcRW8Bq8
         DKizsOXf4iPJcT35gd1FEGrNjwUH5Uh5zMu+et0N9KsvProOLdWDJHWUhHtPiOb9d5Ld
         s5la8jXL/3iIWjhvQI6NDVA+w/gXjMvWxdqdenLNdvDb3XbF4p0DexYV37qjuCcYo9Ap
         sqHMlD5Va+1vj0XjijxWuuB1xWpnHY1gJfvLvlsGdoBKWXfQM6mlJhmMJrBn8/hRfTwP
         HVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kf/H9JjJmGnHIaVeVVll6XvW7wIZP51HMkNthrDXfI8=;
        b=eMMEsHzVRZRSqcTJW+ulHVnv5aGHzbWArn2D3PK2CzG0GutihUAO3GsyG2WNMqUx9p
         W75bSq3xu9FILdqqy0Un4GALnR9vFkxePCDH1LbAjz9MvKUDz2Qh/3etGFCQSiVKtZgc
         BmycH2dJCsYkGRGb3IdofvG8kc+gbcTJp3qtzHYBcb+1Ti26g7sP0qs0CgxqoVC7Fs0w
         vlMl+pJnnTznjQyoAzckiFbYtd9Nw1hQMzv0uleb443C5MDNopzBLZMWbvjQz3e2sw8/
         aPPqR3ZpXfcGbNTiczqkvR3BkpU9ywKL2YoPl7UYFviQl9ZkbgT2kk4TVWi7puZJPzkh
         VwNw==
X-Gm-Message-State: AOAM53349YldQoPQtD1uKb9WZyae+Qh5GJ5E11Y7hVTledqlJC7iEuze
        56P/HHHp6nXanOYcBwrtyEMJKO7zVg0os4HD8+o=
X-Google-Smtp-Source: ABdhPJwvT9ajyxEQYxNKu3L7Q+8Vml55Sc7rI0JPUaQmge+3iNTOgk6WkZwpSvIRvzibfXD4JrAoY1TeZ+fi/khWR+k=
X-Received: by 2002:a67:e116:: with SMTP id d22mr5766089vsl.49.1625378274495;
 Sat, 03 Jul 2021 22:57:54 -0700 (PDT)
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
 <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com>
 <CAMhs-H8Y0txwcqRTxpsB_GEoOYbhHWO81EANMxMSybzWPS=HTA@mail.gmail.com> <CAHp75VfRYZn5uuPgQHJ5Hm3p3XVrfs=ReZXxEPm+dqLNb5QtGA@mail.gmail.com>
In-Reply-To: <CAHp75VfRYZn5uuPgQHJ5Hm3p3XVrfs=ReZXxEPm+dqLNb5QtGA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 4 Jul 2021 07:57:43 +0200
Message-ID: <CAMhs-H8g8c047DSw2ObX7xS=YuPrXNRMecuV1TnKT--gnDdDOw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Sat, Jul 3, 2021 at 9:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 3, 2021 at 3:51 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sat, Jul 3, 2021 at 2:05 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Sat, Jul 3, 2021 at 1:32 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Jul 3, 2021 at 2:06 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
> > > > > <sergio.paracuellos@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > -               ret = devprop_gpiochip_set_names(gc);
> > > > > +               ret = devprop_gpiochip_set_names(gc, 0);
> > > >
> > > > I had been expecting that this parameter would be in the field of the gpiochip.
> > > >
> > > > ...
> > >
> > > If doing it in that way is preferred, I have no problem at all. But in
> > > that case I think there is no need for a new
> > > 'devprop_gpiochip_set_names_base' and we can assume for all drivers to
> > > be zero and if is set taking it into account directly in
> > > devprop_gpiochip_set_names function? Is this what you mean by having
> > > this field added there??
>
> The below is closer to what I meant, yes. I have not much time to look
> into the details, but I don't have objections about what you suggested
> below. Additional comments there as well.

Thanks for your time and review, Andy. Let's wait to see if Linus and
Bartosz are also ok with this approach.

>
> > How about something like this?
> >
> > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > index 82fb20dca53a..5854a9343491 100644
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
> >         if (!rg->chip.label)
> >                 return -ENOMEM;
> >
> > +       rg->chip.offset = bank * MTK_BANK_WIDTH;
> >         rg->irq_chip.name = dev_name(dev);
> >         rg->irq_chip.parent_device = dev;
> >         rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
>
> Obviously it should be a separate patch :-)

Of course :). I will include one separate patch per driver using the
custom set names stuff: gpio-mt7621 and gpio-brcmstb. I don't know if
any other one is also following that wrong pattern.

>
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 6e3c4d7a7d14..0587f46b7c22 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -380,10 +380,10 @@ static int devprop_gpiochip_set_names(struct
> > gpio_chip *chip)
> >                 return 0;
> >
> >         count = device_property_string_array_count(dev, "gpio-line-names");
> > -       if (count < 0)
>
> > +       if (count < 0 || count <= chip->offset)
>
> Please, split it into two conditionals and add a comment to the second one.

For sure I will do, thanks.

>
> >                 return 0;
> >
> > -       if (count > gdev->ngpio) {
> > +       if (count > gdev->ngpio && chip->offset == 0) {
> >                 dev_warn(&gdev->dev, "gpio-line-names is length %d but
> > should be at most length %d",
> >                          count, gdev->ngpio);
> >                 count = gdev->ngpio;
> > @@ -401,8 +401,9 @@ static int devprop_gpiochip_set_names(struct
> > gpio_chip *chip)
> >                 return ret;
> >         }
> >
> > +       count = (chip->offset >= count) ? (chip->offset - count) : count;
>
> Too many parentheses.

Ok, I will also change this.

>
> >         for (i = 0; i < count; i++)
> > -               gdev->descs[i].name = names[i];
> > +               gdev->descs[i].name = names[chip->offset + i];
> >
> >         kfree(names);
> >
> > diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> > index 4a7e295c3640..39e0786586f6 100644
> > --- a/include/linux/gpio/driver.h
> > +++ b/include/linux/gpio/driver.h
> > @@ -312,6 +312,9 @@ struct gpio_irq_chip {
> >   *     get rid of the static GPIO number space in the long run.
> >   * @ngpio: the number of GPIOs handled by this controller; the last GPIO
> >   *     handled is (base + ngpio - 1).
> > + * @offset: when multiple gpio chips belong to the same device this
> > + *     can be used as offset within the device so friendly names can
> > + *     be properly assigned.
> >   * @names: if set, must be an array of strings to use as alternative
> >   *      names for the GPIOs in this chip. Any entry in the array
> >   *      may be NULL if there is no alias for the GPIO, however the
> > @@ -398,6 +401,7 @@ struct gpio_chip {
> >
> >         int                     base;
> >         u16                     ngpio;
> > +       int                     offset;
>
> u16 (as ngpio has that type)
>
> >         const char              *const *names;
> >         bool                    can_sleep;
> >
> >
> > Does this sound reasonable?

So the gpiolib related patch updated code with your proposed changes
looks as follows:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e3c4d7a7d14..0c773d9ef292 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -383,7 +383,18 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
        if (count < 0)
                return 0;

-       if (count > gdev->ngpio) {
+       /*
+        * When offset is set in the driver side we assume the driver internally
+        * is using more than one gpiochip per the same device. We have to stop
+        * setting friendly names if the specified ones with 'gpio-line-names'
+        * are less than the offset in the device itself. This means all the
+        * lines are not present for every single pin within all the internal
+        * gpiochips.
+        */
+       if (count <= chip->offset)
+               return 0;
+
+       if (count > gdev->ngpio && chip->offset == 0) {
                dev_warn(&gdev->dev, "gpio-line-names is length %d but
should be at most length %d",
                         count, gdev->ngpio);
                count = gdev->ngpio;
@@ -401,8 +412,9 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
                return ret;
        }

+       count = (chip->offset >= count) ? chip->offset - count : count;
        for (i = 0; i < count; i++)
-               gdev->descs[i].name = names[i];
+               gdev->descs[i].name = names[chip->offset + i];

        kfree(names);

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4a7e295c3640..7a77f533d8fe 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -312,6 +312,9 @@ struct gpio_irq_chip {
  *     get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *     handled is (base + ngpio - 1).
+ * @offset: when multiple gpio chips belong to the same device this
+ *     can be used as offset within the device so friendly names can
+ *     be properly assigned.
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
@@ -398,6 +401,7 @@ struct gpio_chip {

        int                     base;
        u16                     ngpio;
+       u16                     offset;
        const char              *const *names;
        bool                    can_sleep;

Best regards,
    Sergio Paracuellos
>
> > > > > The problem I see with this approach is that
> > > > > 'devprop_gpiochip_set_names' already trusts in gpio_device already
> > > > > created and this happens in 'gpiochip_add_data_with_key'. So doing in
> > > > > this way force "broken drivers" to call this new
> > > > > 'devprop_gpiochip_set_names_base' function after
> > > > > 'devm_gpiochip_add_data' is called so the core code has already set up
> > > > > the friendly names repeated for all gpio chip banks and the approach
> > > > > would be to "overwrite" those in a second pass which sounds more like
> > > > > a hack than a solution.
> > > > >
> > > > > But maybe I am missing something in what you were pointing out here.
> > > >
> > > > Would the above work?
>
> --
> With Best Regards,
> Andy Shevchenko
