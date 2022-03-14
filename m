Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C464D8733
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Mar 2022 15:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240449AbiCNOsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 10:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240390AbiCNOsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 10:48:07 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F2641637
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 07:46:56 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b15so16161310edn.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tejnvpcItznP+XieeMEeqmEZtG7EKmEE378s7VoibWA=;
        b=dDLUQ6796YMEiUp31VGhDzOTCJr1qPyT996cw3CMfVjF2raAunLZqee5fmKQC/ZKET
         8kNjpMX7hXBBd3ITSA2ZdyFyCRAASlr39t+ZkyFCi7UPtLnpTP2SZUQj7b90Tp8AgjYB
         78IFCI/CbnDsY6OhmVYtoKxx+kUYQImiaKqX1jeGHu/oKH9mkQqF/Z2QrP9HxBa2rGhj
         PbEaICb5JmwdKuEhVlPseLUJYBlF1YSUieZvN6MoVl16R7LpfMZFy8/ARis7FvAaHRO1
         TZqup7X0JHfaOF1KJ++xjeHwfBUDikPdIdN+i0Dw2maagYT4r0KHbJwrXrR8omFkW9/Q
         6B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tejnvpcItznP+XieeMEeqmEZtG7EKmEE378s7VoibWA=;
        b=78yjfLuupHb0Erx2xPXwk/Ol1isFDs95SheQwLh8tQ2xgaE0sGJvzBEGBfcqeHpSMU
         97u6eE/hTYdtUjquAByM2gxlzJxRLbK7KQwqpLGcy0e3IMV7cMLcAdo1fUUxk0FJrTI+
         JEBhDJXoctDYQ9N6rb8bBEYeGUZf16oeEf6u5fNXyo+aGOWjHxWfi7DyRHGgovsB1yMc
         DKZqEOcDYMCuFsQJLMjUK9SBHItfOCDtJB84Xa7IwppHjlVo9Hb6y77dcyjqbgibKDLE
         4A1EmUwsKPCxr+LRb1pXYZBWCuxomBxupkYn/EDlOoME9NVsUOywVoBwkqXhJ49LxJQ0
         9TRA==
X-Gm-Message-State: AOAM532hPgrL5cckOXujNEfPkfjmsPVCzmIMyNo8bddDS9VFKSt5SH5T
        vzFHr3/NOaGBAz4sNYZsXXsIwAV1JY8G0gA2LJU0sQ==
X-Google-Smtp-Source: ABdhPJwSUtZwdFVddUfnEml4egreDeBD098RwDKR5/7dPMwJXBj/gYOWAdLCLzX+HmZAkJSD2+2Ya1d2KQwu9LEE3/A=
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id
 n11-20020a05640205cb00b00415e04a5230mr21115927edx.352.1647269214900; Mon, 14
 Mar 2022 07:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220311181958.4487-1-kris@embeddedTS.com> <CAHp75VfVhCa-Td+X0cg-eYPtarFyKrsF92oPB2HdraCXW2CRTg@mail.gmail.com>
In-Reply-To: <CAHp75VfVhCa-Td+X0cg-eYPtarFyKrsF92oPB2HdraCXW2CRTg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Mar 2022 15:46:44 +0100
Message-ID: <CAMRc=MeC-1HfCmjiWUaEutnHQ3XHK6C4V=5=gn9_aPSSd7ZvLA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ts4900: Fix comment formatting and grammar
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kris Bahnsen <kris@embeddedts.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Sat, Mar 12, 2022 at 2:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 11, 2022 at 8:20 PM Kris Bahnsen <kris@embeddedts.com> wrote:
> >
> > The issues were pointed out after the prior commit was applied
>
> Missed period in the above sentence.
>
> Otherwise LGTM,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> > ---
> >  drivers/gpio/gpio-ts4900.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
> > index d918d2df4de2..ede605b8e098 100644
> > --- a/drivers/gpio/gpio-ts4900.c
> > +++ b/drivers/gpio/gpio-ts4900.c
> > @@ -55,8 +55,9 @@ static int ts4900_gpio_direction_input(struct gpio_chip *chip,
> >  {
> >         struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> >
> > -       /* Only clear the OE bit here, requires a RMW. Prevents potential issue
> > -        * with OE and data getting to the physical pin at different times.
> > +       /*
> > +        * Only clear the OE bit here, requires a RMW. Prevents a potential issue
> > +        * with OE and DAT getting to the physical pin at different times.
> >          */
> >         return regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OE, 0);
> >  }
> > @@ -68,9 +69,10 @@ static int ts4900_gpio_direction_output(struct gpio_chip *chip,
> >         unsigned int reg;
> >         int ret;
> >
> > -       /* If changing from an input to an output, we need to first set the
> > -        * proper data bit to what is requested and then set OE bit. This
> > -        * prevents a glitch that can occur on the IO line
> > +       /*
> > +        * If changing from an input to an output, we need to first set the
> > +        * GPIO's DAT bit to what is requested and then set the OE bit. This
> > +        * prevents a glitch that can occur on the IO line.
> >          */
> >         regmap_read(priv->regmap, offset, &reg);
> >         if (!(reg & TS4900_GPIO_OE)) {
> > --
> > 2.11.0
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko

Added the missing period and applied.

Bart
