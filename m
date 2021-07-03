Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FF73BA855
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 13:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGCLJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 07:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGCLJ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 07:09:29 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3F7C061762;
        Sat,  3 Jul 2021 04:06:55 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id j23so291235vki.4;
        Sat, 03 Jul 2021 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZ4HsDs6b9mvzeZXoceC90pUFVVJiY28SrKqwA4xe4Y=;
        b=tILncNLNWsI2BEyuUUkoFyxW5upoSeuYnCMTnHdQUYPMob1IDTB+txpGexY5r1LExI
         gXy5Axp6GAvdQ24NlJa1cSrJqz506sUxYeOL5ZW8pO/1j0FYKAjVlD+oeTd4wwKiNt35
         p8cWeeWBhpBAFBA1++TGUVITinY0UdrQhccyZuQRD1MvBmGpRmXkw6evDpRjDtaBqVUG
         wbYeQZqCkU+JxNkqjF01vm60sL8MLv7xCbCutVLlYzOio6DLxqWY/ranpu/uEgmrsk4Z
         euWQdC37mfyXTs2jr/dcdLiMdPvdIjLga2dkN36KaFBS+F3XxT1yzxATWyrbB2in6Z/c
         n0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZ4HsDs6b9mvzeZXoceC90pUFVVJiY28SrKqwA4xe4Y=;
        b=pZ3jefS8/E//e9LZKZwk3RNShZy2k4IzcJfi/aILgS6F3hKVpRMy68hr5q99HI6s9G
         ESfu6NEN+jNBU3kdTjgh2vzcvItBhro0jLWs4HpkwgwBMOTRUC9OOMkqZFygacLIRnNo
         WALuST4JlIUzUj5clT64vBqEe6TJzOS3807+KpztJ2YtIRDOpDsRri3fFf+HjZs7JRgu
         MXwtIQoqJXdZI9/AKEsJqkMbEC6NJUEhWV7FrqFQL8giIS9LNCuHIckUYkWKRfTUEdKD
         R0MesZglknkeWT+yoC1VNwp4ovwETfrlmSMEKtIuBkt0LgUnYvDXJC2qt3+GvF0n2q79
         CYTw==
X-Gm-Message-State: AOAM533Ympr19wrePHZZ4VZMzwArCT1VZAswb/RoY8FKwkawh+hcC6lc
        OhIrCC0+GuFMSeUqUCwli/zWDIyPx3OlJYY5gmo=
X-Google-Smtp-Source: ABdhPJwtOd/xGysWYXjPRx6rZ3iO2Vc1f6/w1l3IupkWpXcOFOKfN29BcGcfoBQCHGNfoi93E8sdYxu5K1ftqfqYG1U=
X-Received: by 2002:a05:6122:2090:: with SMTP id i16mr3315243vkd.5.1625310413980;
 Sat, 03 Jul 2021 04:06:53 -0700 (PDT)
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
 <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com> <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
In-Reply-To: <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 3 Jul 2021 13:06:42 +0200
Message-ID: <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
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

Hi Linus,

On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Linus,
>
> On Fri, Jul 2, 2021 at 12:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Jul 2, 2021 at 11:40 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Fri, Jul 2, 2021 at 11:27 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> >
> > > > > There are no child nodes, all the stuff is in the same parent node
> > > > > and, as I said, belongs to the same device but internally uses three
> > > > > gpiochips.
> > > >
> > > > And it can't be split into three children in the overlay?
> > >
> > > Original code before this being mainlined was using three children and
> > > I was told in the review that three children were not allowed:
> > >
> > > See https://patchwork.ozlabs.org/project/linux-gpio/patch/1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com/#1932827
> >
> > Yeah this is one of those unfortunate cases where the DT representation
> > (or ACPI for that matter) of the device and the Linux internal representation
> > differs.
> >
> > > > Let's assume it can't, then the GPIO library function should be
> > > > refactored in a way that it takes parameters like base index for the
> > > > names and tries to satisfy the caller.
> > >
> > > Bartosz, Linus, any thoughts on this?
> >
> > This would be ideal, is there a reasonably simple way to get to this helper?
> >
> > In gpiolib.c devprop_gpiochip_set_names() need to be refactored to
> > take a base number, devprop_gpiochip_set_names_base() that
> > function exposed in <linux/gpio/driver.h> and then the old function
> > devprop_gpiochip_set_names() wrapped in the new
> > one so all old users continue to work without modification.
> > Sprinkle some kerneldoc on top so we do not make mistakes
> > in the future.
> >
> > This should work I think.

If I am understanding correctly what you mean is something like follows:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e3c4d7a7d14..5a88a305bc59 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -361,13 +361,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 /*
  * devprop_gpiochip_set_names - Set GPIO line names using device properties
  * @chip: GPIO chip whose lines should be named, if possible
+ * @base: starting index in names array to start copying from
  *
  * Looks for device property "gpio-line-names" and if it exists assigns
  * GPIO line names for the chip. The memory allocated for the assigned
  * names belong to the underlying software node and should not be released
  * by the caller.
  */
-static int devprop_gpiochip_set_names(struct gpio_chip *chip)
+static int devprop_gpiochip_set_names(struct gpio_chip *chip, int base)
 {
// WHATEVER CHANGES TO TAKE base into account

+int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base)
+{
+       return devprop_gpiochip_set_names(gc, base);
+}
+EXPORT_SYMBOL_GPL(devprop_gpiochip_set_names_base);
+
static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
 {
        unsigned long *p;
@@ -684,7 +706,7 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
        if (gc->names)
                ret = gpiochip_set_desc_names(gc);
        else
-               ret = devprop_gpiochip_set_names(gc);
+               ret = devprop_gpiochip_set_names(gc, 0);
        if (ret)
                goto err_remove_from_list;


diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4a7e295c3640..ad145ab0794c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -537,6 +537,8 @@ extern int gpiochip_add_data_with_key(struct
gpio_chip *gc, void *data,
        devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */

+extern int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base);
+

The problem I see with this approach is that
'devprop_gpiochip_set_names' already trusts in gpio_device already
created and this happens in 'gpiochip_add_data_with_key'. So doing in
this way force "broken drivers" to call this new
'devprop_gpiochip_set_names_base' function after
'devm_gpiochip_add_data' is called so the core code has already set up
the friendly names repeated for all gpio chip banks and the approach
would be to "overwrite" those in a second pass which sounds more like
a hack than a solution.

But maybe I am missing something in what you were pointing out here.

Best regards,
    Sergio Paracuellos

> >
> > Any similar drivers (several gpio_chip per FW node) that want to
> > set line names need to do the same thing.
>
> Thanks for the advices. I'll try to make a bit of time to try to
> handle this in the way you are pointing out here.
>
> Best regards,
>     Sergio Paracuellos
>
> >
> > Sorry that you ran into this, I hate it when I'm first at hairy stuff
> > like this.
> >
> > Yours,
> > Linus Walleij
