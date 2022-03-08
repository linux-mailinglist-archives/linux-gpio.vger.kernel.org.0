Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC2A4D1264
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 09:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240961AbiCHIkA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 03:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbiCHIkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 03:40:00 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D386237D3
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 00:39:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id gb39so37457304ejc.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZfDDN8hW2sYhsKMQgu6eSfyeIQoYU8/4m7KffutdgQY=;
        b=jY+kO+Y5xP9W109N++3xWaqUysbX8hWBFEEerBic1ca1eCKatOa8A+Qbl6r389YVqC
         H9qnhj+VWuwZieVOGcAegSe8wmbAFXM4X916ru6AmucznrWsZTOVQ0sUcENRCDWzyS5j
         pALWhSrK9Yw6iIXxBQZQFpslO34hRq3xQMeauq8R5ihS/Is5KGiw2jW1P2Nvl4WBBdax
         /6gmssHBzh3HdFklMfJBJ6owVSfwctPT8qwUDn/lGc4a/ss37Hc0p3l+d2LKAwFP+gAh
         HhgQTN46hXg7ysAM5HQFzmNOxj3F1XfzH+8xkgH0ymOqsJRbV20XWnC40V/puRPO/vJ/
         geqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZfDDN8hW2sYhsKMQgu6eSfyeIQoYU8/4m7KffutdgQY=;
        b=L3XhcKqjzr3iQ4tRV+PkJZSU2zWrqYD4vRDu1KTJI80v3UhLEfInL6yMJCd50m6hWw
         a3Q91JvcmXfWtr6kqUA2A5aUmyEtf27CECFMFyOSCO73MoyXGxfB+S2uebdskWPuPQOw
         bAmopRpsJGBO8u/UHlQ8cr4ur6Q+yJ8CBtTZQ7eH/RNKWBYLKyY7SKOcUr+R5ZIHL7p9
         jYOGONrbLj/rRRWlZvy0bHK73EnMttfvGY1Y3crDJ6gkklYcbXHkXWab/SbYcjtE/0Q2
         s3hWwX8/vRzqD6KVSYYHfMuaAHGzQTyrsfjnU9fjQ7Fkpkh4zR3t4WO+ixIwFrOsgMc+
         Dwlg==
X-Gm-Message-State: AOAM533hlpwU6ZAkf0uuonXOlTpBPDEDEuL73ukJIwMGWU3mFvPZp/kf
        6OaYBWviq6hh6LZVxdK8EwgFiRxMUrrrhOuI/6lRIPxYZiI=
X-Google-Smtp-Source: ABdhPJxIi2hf/1LE3nWvWq2cByr3eOy/v8RD3lX9vEvd2C5D64zUw8QRfGF9hng7XpeVo3tVwRTA+FNSX7ciiWtcrN0=
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr12134797ejc.636.1646728742085; Tue, 08
 Mar 2022 00:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20220304221517.30213-1-kris@embeddedTS.com> <CAMRc=MeHT4pX1ZRbOz0owDDec5rv+FE84rp464ugffbH5PuS5w@mail.gmail.com>
 <1646682026.7444.2.camel@embeddedTS.com>
In-Reply-To: <1646682026.7444.2.camel@embeddedTS.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Mar 2022 09:38:50 +0100
Message-ID: <CAMRc=MeObKcaS_73wVcR6LJbQO10XebKoWwURLspXuKgCETC3A@mail.gmail.com>
Subject: Re: [PATCH] gpio: ts4900: Do not set DAT and OE together
To:     Kris Bahnsen <kris@embeddedts.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 7, 2022 at 8:40 PM Kris Bahnsen <kris@embeddedts.com> wrote:
>
> On Mon, 2022-03-07 at 10:13 +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 4, 2022 at 11:15 PM Kris Bahnsen <kris@embeddedts.com> wrote:
> > >
> > > From: Mark Featherston <mark@embeddedTS.com>
> > >
> > > This works around an issue with the hardware where both OE and
> > > DAT are exposed in the same register. If both are updated
> > > simultaneously, the harware makes no guarantees that OE or DAT
> > > will actually change in any given order and may result in a
> > > glitch of a few ns on a GPIO pin when changing direction and value
> > > in a single write.
> > >
> > > Setting direction to input now only affects OE bit. Setting
> > > direction to output updates DAT first, then OE.
> > >
> > > Signed-off-by: Mark Featherston <mark@embeddedTS.com>
> > > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> > > ---
> > >  drivers/gpio/gpio-ts4900.c | 25 ++++++++++++++++++++-----
> > >  1 file changed, 20 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
> > > index d885032cf814..fbabfca030c0 100644
> > > --- a/drivers/gpio/gpio-ts4900.c
> > > +++ b/drivers/gpio/gpio-ts4900.c
> > > @@ -1,7 +1,8 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > >  /*
> > >   * Digital I/O driver for Technologic Systems I2C FPGA Core
> > >   *
> > > - * Copyright (C) 2015 Technologic Systems
> > > + * Copyright (C) 2015-2018 Technologic Systems
> > >   * Copyright (C) 2016 Savoir-Faire Linux
> > >   *
> > >   * This program is free software; you can redistribute it and/or
> > > @@ -55,19 +56,33 @@ static int ts4900_gpio_direction_input(struct gpio_chip *chip,
> > >  {
> > >         struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> > >
> > > -       /*
> > > -        * This will clear the output enable bit, the other bits are
> > > -        * dontcare when this is cleared
> > > +       /* Only clear the OE bit here, requires a RMW. Prevents potential issue
> > > +        * with OE and data getting to the physical pin at different times.
> > >          */
> > > -       return regmap_write(priv->regmap, offset, 0);
> > > +       return regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OE, 0);
> > >  }
> > >
> > >  static int ts4900_gpio_direction_output(struct gpio_chip *chip,
> > >                                         unsigned int offset, int value)
> > >  {
> > >         struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> > > +       unsigned int reg;
> > >         int ret;
> > >
> > > +       /* If changing from an input to an output, we need to first set the
> > > +        * proper data bit to what is requested and then set OE bit. This
> > > +        * prevents a glitch that can occur on the IO line
> > > +        */
> > > +       regmap_read(priv->regmap, offset, &reg);
> > > +       if (!(reg & TS4900_GPIO_OE)) {
> > > +               if (value)
> > > +                       reg = TS4900_GPIO_OUT;
> > > +               else
> > > +                       reg &= ~TS4900_GPIO_OUT;
> > > +
> > > +               regmap_write(priv->regmap, offset, reg);
> > > +       }
> > > +
> > >         if (value)
> > >                 ret = regmap_write(priv->regmap, offset, TS4900_GPIO_OE |
> > >                                                          TS4900_GPIO_OUT);
> > > --
> > > 2.11.0
> > >
> >
> > This looks like a fix, can you add a Fixes tag?
> >
> > Bart
> >
>
> Please excuse my ignorance (and email client issues) I am still learning the
> submission process. I'm not sure what kind of Fixes tag to add in this scenario.
>
> This GPIO issue has existed since the driver's inception. It is a quirk of
> hardware that has always existed on this platform. The driver was originally
> implemented by Savoir-faire Linux. We discovered the issue and have had it
> patched in our trees for years and wanted to push it upstream.
>
> There is no public discussion on it, it was found and patched. And, aside from
> the first commit of this driver, there is no commit that introduced any issue.
>
> Can you please advise what kind of Fixes tag is appropriate in this situation?
>
> Additionally, if I do add a Fixes tag, would that warrant a v2 patch? Or would
> it just need to be an email response that includes it?
>
> Kris

Yeah, just send a v2 with "Fixes: <short commit hash> ("<commit
title>")" referring to the original patch that added the driver.

We'll send it for stable.

Bart
