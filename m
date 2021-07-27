Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0629F3D7472
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 13:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbhG0LkT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 07:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbhG0LkT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 07:40:19 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C19C061757;
        Tue, 27 Jul 2021 04:40:18 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id bg4so6932770vsb.6;
        Tue, 27 Jul 2021 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcEMNKjvuDrcfFCIzmvTxD8j5XhA88/xOYEHf4Nn7NE=;
        b=ZQ+bJczVGM+2X0iBaWz/5BfkqIoQAdzIvv8kgQcuJ3VHzeeBu6GwwS67Zk/hBMeRrm
         F2OflWQZ00VOyOqd0DhrKsn6qtEDU0ss9QgZ2Z4SINXsTTEWeZRnIN87pxa1C8zncKtM
         IRaV8O+xOGnhoxyRZ8nmt0g3hubzhowaUTBp2H3BKdq8KdkcnjplnUhhnf8KVC//GHYD
         DwtdAirLSdeGkPiEM3MTkaoKsRjWNBd3Vcz+yStggKdZCU8ANSw5vq/7mA/YqFycjWHn
         GVBiF/21jq2ymA6/7/C6zHLFnmqDf7bZ89Wj6OoPlfj73E2m3JUiiDZ8hRDkJceJp2Ga
         TGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcEMNKjvuDrcfFCIzmvTxD8j5XhA88/xOYEHf4Nn7NE=;
        b=Qi0fV4naxtjSUYgUo0rsDZYhi5bVFYCrLKXr06lSSrkXvnH0mGaTMFdwg5G9R/6tQx
         I1Dc/SbeBPngfb+12Aw4in3n5G3lRaA76YlaNCs9To4ZLFnPq2pMYCK3GPdkMbOEKBbr
         l5AKQH8NuiNyM8ExNXW1i+JG7PF2AX3VRe39SyRGtH2JGFrgRI+fYjG8zeAfUHVVOkMT
         YeDKlb5XsdfJaej4CrPwl2fDAhCz46mkJz6CklF2S63UkMnLrfnd1GAjfxe9QjkG1Ay4
         74VKni4rEveUJdsVNS1ritNZnTzuD8NXzy+o5aJPwwAL548jESeEE/IxdnLs0hyd4dmp
         8GQg==
X-Gm-Message-State: AOAM5339MBbIofYCY3xXDG3QK/WE+0I6gG8NqcT1Z6d648Zyz1uLG5OX
        4EqnK/DWbIE1me20ZYyCIcdAWcGePkk3VVj3Sew=
X-Google-Smtp-Source: ABdhPJwYzF9JI6MwKdraLfpYmltLSVttyweIDytdmki4Ljrbw66Q9LkDvGzTWokxSW4+cRXW0jf/zc/2SrzAVBAH1Pw=
X-Received: by 2002:a67:e94c:: with SMTP id p12mr15652851vso.28.1627386018116;
 Tue, 27 Jul 2021 04:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
 <CAMhs-H9fbHMxxSaqMj=nyACAN6aDB-bYK1nF1dRh8a1krTdaZg@mail.gmail.com> <CAMpxmJUQmdfesygysBHB=bx7tYqMyry9tSw6E4dOnatTNKcAug@mail.gmail.com>
In-Reply-To: <CAMpxmJUQmdfesygysBHB=bx7tYqMyry9tSw6E4dOnatTNKcAug@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 27 Jul 2021 13:40:06 +0200
Message-ID: <CAMhs-H8ABwqAOk9gmU3H+tWzoD_rSGq9d3u8dakLeKq6WT+cHg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip per device
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Jul 27, 2021 at 1:35 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Tue, Jul 27, 2021 at 8:02 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > On Thu, Jul 8, 2021 at 9:04 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > There are some unfortunate cases where the DT representation
> > > of the device and the Linux internal representation differs.
> > > Such drivers for devices are forced to implement a custom function
> > > to avoid the core code 'devprop_gpiochip_set_names' to be executed
> > > since in any other case every gpiochip inside will got repeated
> > > names through its internal gpiochip banks. To avoid this antipattern
> > > this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
> > > to get a correct behaviour for every single situation.
> > >
> > > This series introduces a new 'offset' field in the gpiochip structure
> > > that can be used for those unfortunate drivers that must define multiple
> > > gpiochips per device.
> > >
> > > Drivers affected by this situation are also updated. These are
> > > 'gpio-mt7621' and 'gpio-brcmstb'.
> > >
> > > Motivation for this series available at [0].
> > >
> > > Thanks in advance for your feedback.
> > >
> > > Best regards,
> > >     Sergio Paracuellos
> > >
> > > [0]: https://lkml.org/lkml/2021/6/26/198
> > >
> > > Sergio Paracuellos (3):
> > >   gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
> > >     gpiochip baks per device
> > >   gpio: mt7621: support gpio-line-names property
> > >   gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
> > >
> > >  drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
> > >  drivers/gpio/gpio-mt7621.c  |  1 +
> > >  drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++-----
> > >  include/linux/gpio/driver.h |  4 ++++
> > >  4 files changed, 34 insertions(+), 50 deletions(-)
> >
> > Hi!
> >
> > Linus, Bartosz, any comments on this series?
> >
>
> Looks good, but I was thinking you were going to address Gregory's
> points first and resend a v2?

I was waiting for your opinion about the last warning stuff Gregory
commented on PATCH 1 since it is not a good way to distinguish between
normal (1 gpiochip) and special cases (multiple gpiochips). I think
since that can happen normally we can just remove the warning. With
that clear I properly fix it up and resend v2.

>
> Bartosz

Best regards,
    Sergio Paracuellos
