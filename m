Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EAF2D3FCA
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgLIKVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgLIKVo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:21:44 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85852C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 02:21:03 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id m19so2382739lfb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 02:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMI0CECIyqD9vuxo9krnxs3PVgofv8jhd/MMB9ewq5k=;
        b=TLqBgEsNohNpt3Wb719mQpnFGgMlv4h9kpqYTR/fYCbzd+VQMd6hg83tdJrtuxVWj5
         JezvRM+xm8I4O3gHT67YijOfo8mzpzFK+Dc6tmkJjUt3zjXeqnLUPaxc91CSiP9xcbyp
         gX53vtXolVZSUtUQXQXCoRAUuBt3Mt9dFv/pShpv9kMZ1qDHeGs/6/Gwg+kuqHiUtMMo
         vFxHLr5aioHsW7B9S+e1G/iYUMQttYmOJzzvFkuy364ch3KuvMKs3JedcPnLyB1x5FFt
         QtcY7KjyZqRL1XjQx0fblGmOLwySZZSKmLh1TtVw0OupoyVx16Iuoh4O5PJejuIuKk2J
         NG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMI0CECIyqD9vuxo9krnxs3PVgofv8jhd/MMB9ewq5k=;
        b=ptQC4FZGuCMGdyTtk1RkH+Qb9i+SPrZSp9JI9UMtz1e0n5QT2hrtH4QHLfYSl2nPFr
         vLwPJNQU6vPWwmAwOAuzsngo+GXZDq5CTUFEBW7RY7T/nSY2PPoT1GC7DMDx+ng8j5Ez
         b4nHX1gLRpTfoAwrthY7AavU+7fWM6U3HVJJsGXUQ+baZpSJ4zoV/4RU9FDGu37H2wMo
         eiuoJO0fSEQ2f4fjWx1fDzzFTXgtq+LyscIsQIDTjBwm3QvRc9LlXPCf3EsCRrcNSKm9
         L0thhCyqeI6vmV2VblstOCAfhuY382N2Ig7Cnu8ntL+emUW1RLRpATWpFbXX9snaF5JX
         u0tw==
X-Gm-Message-State: AOAM5334kjeYqOHGJu9WM7Rb6IfzeC5LH0EcRwQR/CR7Msf7Odg18Oog
        /cjGK9MmkBTgbSU2v6I1BQoPqBDkHGju+iS8LnsuZHjNxrbnSA==
X-Google-Smtp-Source: ABdhPJyWiG9LyXUa3QjRS3OqJcU1ciTbPmP4fQ7GteSGxpcEQecOpVlXes7j1IOg9ZBCnKjq1DfsveEuiC0lt8WaS0w=
X-Received: by 2002:a19:ee1a:: with SMTP id g26mr735609lfb.465.1607509261981;
 Wed, 09 Dec 2020 02:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
 <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 11:20:51 +0100
Message-ID: <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 11:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Wed, Dec 9, 2020 at 11:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Dec 9, 2020 at 10:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > > These are the patches I collected over this release cycle. Nothing all
> > > too exciting - mainly just updates to drivers and refactoring of the
> > > core code. Please pull.
> >
> > Nice!
> >
> > But I get a merge conflict in gpiolib-acpi.c! Since I said Andy should
> > be maintaining that file it makes me a bit nervous.
> >
> > It looks like this:
> >
> > index 6cc5f91bfe2e,23fa9df8241d..000000000000
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@@ -586,6 -526,40 +586,43 @@@ static bool acpi_get_driver_gpio_data(s
> >         return false;
> >   }
>
> Strange, I didn't see any conflicts in next...
>
> >
> > ++<<<<<<< HEAD
> > ++=======
> > + static enum gpiod_flags
> > + acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
> > + {
> > +       switch (agpio->io_restriction) {
> > +       case ACPI_IO_RESTRICT_INPUT:
> > +               return GPIOD_IN;
> > +       case ACPI_IO_RESTRICT_OUTPUT:
> > +               /*
> > +                * ACPI GPIO resources don't contain an initial value for the
> > +                * GPIO. Therefore we deduce that value from the pull field
> > +                * instead. If the pin is pulled up we assume default to be
> > +                * high, if it is pulled down we assume default to be low,
> > +                * otherwise we leave pin untouched.
> > +                */
> > +               switch (agpio->pin_config) {
> > +               case ACPI_PIN_CONFIG_PULLUP:
> > +                       return GPIOD_OUT_HIGH;
> > +               case ACPI_PIN_CONFIG_PULLDOWN:
> > +                       return GPIOD_OUT_LOW;
> > +               default:
> > +                       break;
> > +               }
> > +               break;
>
> This break is the only thing I have in my tree. Andy told me to take
> that patch with his ack. It seems you don't have this function in your
> tree - was it moved at some point?

Hm yeah I have a bunch of ACPI things I pulled from Andy in my tree.

I can try just -3 I guess. I assume the function shall be there.

Yours,
Linus Walleij
