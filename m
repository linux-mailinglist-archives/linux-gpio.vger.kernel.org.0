Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD07F3BA8C5
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 14:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhGCMyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhGCMyL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 08:54:11 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B1CC061762;
        Sat,  3 Jul 2021 05:51:37 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id r9so4982107ual.7;
        Sat, 03 Jul 2021 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NoncdDc+nzorH8oELm/uh1CG/r+HvgN0j+4gRQRIkqs=;
        b=sAHbtngtOE4vaFoFxKph4KSjU9oIf9SzDGoSHSwnzUlH4Dv/9Wb2NeuFvySHmf0jfw
         8XokQAlzo1eNtmb2At7p347Qu20RSGcF0Txvr9QchQ1LLwuMWvgA+XlX/r5v5S6kvijk
         JYCrgRPE12+WCmUhq9b41DHc/Ba94DZEswceRN1BqeHbE4jyK8a1x1vtJ64Xbc3Fq7S4
         T2zt/1yeimRM3UVaOjoOivz4wCmZhKsyw3fcbAmmOt+ay5isK6A+bzB8BY7M9bWJ0Alj
         j4H6jfAiy3TyITbGWnrFOFQhMOa4wMQJKrUkrpMFLtxvyvBmCubpfetaIo6jzvZfxV7/
         Vlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NoncdDc+nzorH8oELm/uh1CG/r+HvgN0j+4gRQRIkqs=;
        b=NB2gJmF36wk0i5KFhmBS5dI0eb012RGayNxSdnuP1G/8cVtqLfozatp2LDQI+xSbcl
         xjq1j/vgU+sZE81XZxywhnsVON6dw+4kLq8/4fex1m1XrKI/BAck6HogJki9lgA0C8RB
         fTLELrGsbDmhPpJYD9FadT0nmxA32VXLllPNo1W38r+ut/7UuB1kmQPcYODBbJruUc2n
         hdeHx35zqmFm8y1NrrJ8O7uODbIS4BFV6UWnKVeOvirVfjygdorV9vwXOKoSemt5sH5L
         Q3ess9rObXx4yAnzR+Klam6xIVDiUsmmMPfqo4CsKZ+Qs62sPQr5sUO2rjDvATZC5c6V
         hDig==
X-Gm-Message-State: AOAM5334rES+TF8dYpd/0YpSB0f2g8wIR+sr+oTWi37O8NKW6q02DWSP
        FHg+ai8GnKILlRDQxBQiVArFTX/FQtUnE4vPAcg=
X-Google-Smtp-Source: ABdhPJzS164I9l79+cU2TgjxmtE7V50BzTNBiMvcKvbLGphSPhuWSd6I2Qundfsb7B+ETpV+r0g4GQN3eKdTXFfOuyY=
X-Received: by 2002:ab0:77d0:: with SMTP id y16mr4564973uar.46.1625316696630;
 Sat, 03 Jul 2021 05:51:36 -0700 (PDT)
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
 <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com> <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com>
In-Reply-To: <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 3 Jul 2021 14:51:25 +0200
Message-ID: <CAMhs-H8Y0txwcqRTxpsB_GEoOYbhHWO81EANMxMSybzWPS=HTA@mail.gmail.com>
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

On Sat, Jul 3, 2021 at 2:05 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Andy,
>
> On Sat, Jul 3, 2021 at 1:32 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sat, Jul 3, 2021 at 2:06 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> >
> > ...
> >
> > > -               ret = devprop_gpiochip_set_names(gc);
> > > +               ret = devprop_gpiochip_set_names(gc, 0);
> >
> > I had been expecting that this parameter would be in the field of the gpiochip.
> >
> > ...
>
> If doing it in that way is preferred, I have no problem at all. But in
> that case I think there is no need for a new
> 'devprop_gpiochip_set_names_base' and we can assume for all drivers to
> be zero and if is set taking it into account directly in
> devprop_gpiochip_set_names function? Is this what you mean by having
> this field added there??

How about something like this?

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..5854a9343491 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
        if (!rg->chip.label)
                return -ENOMEM;

+       rg->chip.offset = bank * MTK_BANK_WIDTH;
        rg->irq_chip.name = dev_name(dev);
        rg->irq_chip.parent_device = dev;
        rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e3c4d7a7d14..0587f46b7c22 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -380,10 +380,10 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
                return 0;

        count = device_property_string_array_count(dev, "gpio-line-names");
-       if (count < 0)
+       if (count < 0 || count <= chip->offset)
                return 0;

-       if (count > gdev->ngpio) {
+       if (count > gdev->ngpio && chip->offset == 0) {
                dev_warn(&gdev->dev, "gpio-line-names is length %d but
should be at most length %d",
                         count, gdev->ngpio);
                count = gdev->ngpio;
@@ -401,8 +401,9 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
                return ret;
        }

+       count = (chip->offset >= count) ? (chip->offset - count) : count;
        for (i = 0; i < count; i++)
-               gdev->descs[i].name = names[i];
+               gdev->descs[i].name = names[chip->offset + i];

        kfree(names);

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4a7e295c3640..39e0786586f6 100644
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
+       int                     offset;
        const char              *const *names;
        bool                    can_sleep;


Does this sound reasonable?

Best regards,
   Sergio Paracuellos


>
> >
> > > The problem I see with this approach is that
> > > 'devprop_gpiochip_set_names' already trusts in gpio_device already
> > > created and this happens in 'gpiochip_add_data_with_key'. So doing in
> > > this way force "broken drivers" to call this new
> > > 'devprop_gpiochip_set_names_base' function after
> > > 'devm_gpiochip_add_data' is called so the core code has already set up
> > > the friendly names repeated for all gpio chip banks and the approach
> > > would be to "overwrite" those in a second pass which sounds more like
> > > a hack than a solution.
> > >
> > > But maybe I am missing something in what you were pointing out here.
> >
> > Would the above work?
>
> The following works for me, but the overwritten part of the
> 'gdev->descs[i].name' because this has been already called once by the
> core code is hacky and dirty, IMHO :)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 4a7e295c3640..ad145ab0794c 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -537,6 +537,8 @@ extern int gpiochip_add_data_with_key(struct
> gpio_chip *gc, void *data,
>         devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
>  #endif /* CONFIG_LOCKDEP */
>
> +extern int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base);
> +
>  static inline int gpiochip_add(struct gpio_chip *gc)
>  {
>         return gpiochip_add_data(gc, NULL);
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6e3c4d7a7d14..f9942d5d2f2a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -361,13 +361,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  /*
>   * devprop_gpiochip_set_names - Set GPIO line names using device properties
>   * @chip: GPIO chip whose lines should be named, if possible
> + * @base: starting index in names array to start copying from
>   *
>   * Looks for device property "gpio-line-names" and if it exists assigns
>   * GPIO line names for the chip. The memory allocated for the assigned
>   * names belong to the underlying software node and should not be released
>   * by the caller.
>   */
> -static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> +static int devprop_gpiochip_set_names(struct gpio_chip *chip, int base)
>  {
>         struct gpio_device *gdev = chip->gpiodev;
>         struct device *dev = chip->parent;
> @@ -383,12 +384,18 @@ static int devprop_gpiochip_set_names(struct
> gpio_chip *chip)
>         if (count < 0)
>                 return 0;
>
> -       if (count > gdev->ngpio) {
> +       if (count > gdev->ngpio && base == 0) {
>                 dev_warn(&gdev->dev, "gpio-line-names is length %d but
> should be at most length %d",
>                          count, gdev->ngpio);
>                 count = gdev->ngpio;
>         }
>
> +       if (count <= base) {
> +               for (i = 0; i < count; i++)
> +                       gdev->descs[i].name = "";
> +               return 0;
> +       }
> +
>         names = kcalloc(count, sizeof(*names), GFP_KERNEL);
>         if (!names)
>                 return -ENOMEM;
> @@ -401,14 +408,21 @@ static int devprop_gpiochip_set_names(struct
> gpio_chip *chip)
>                 return ret;
>         }
>
> +       count = (base >= count) ? (base - count) : count;
>         for (i = 0; i < count; i++)
> -               gdev->descs[i].name = names[i];
> +               gdev->descs[i].name = names[base + i];
>
>         kfree(names);
>
>         return 0;
>  }
>
> +int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base)
> +{
> +       return devprop_gpiochip_set_names(gc, base);
> +}
> +EXPORT_SYMBOL_GPL(devprop_gpiochip_set_names_base);
> +
>  static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
>  {
>         unsigned long *p;
> @@ -684,7 +698,7 @@ int gpiochip_add_data_with_key(struct gpio_chip
> *gc, void *data,
>         if (gc->names)
>                 ret = gpiochip_set_desc_names(gc);
>         else
> -               ret = devprop_gpiochip_set_names(gc);
> +               ret = devprop_gpiochip_set_names(gc, 0);
>         if (ret)
>                 goto err_remove_from_list;
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 82fb20dca53a..d4f19ab726b2 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -282,6 +282,12 @@ mediatek_gpio_bank_probe(struct device *dev,
>                 return ret;
>         }
>
> +       ret = devprop_gpiochip_set_names_base(&rg->chip, bank * MTK_BANK_WIDTH);
> +       if (ret) {
> +               dev_err(dev, "Error setting line names for bank %d", bank);
> +               return ret;
> +       }
> +
>         /* set polarity to low for all gpios */
>         mtk_gpio_w32(rg, GPIO_REG_POL, 0);
>
> Best regards,
>     Sergio Paracuellos
>
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
