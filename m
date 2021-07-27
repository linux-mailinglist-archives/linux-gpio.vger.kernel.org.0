Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C093D746B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 13:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhG0Lfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 07:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbhG0Lft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 07:35:49 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B868C061760
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:35:49 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id w17so20063741ybl.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qco/AyihnJ5LF9OqcB7SLvxoAFgJ7udwLUJdc+kCzpo=;
        b=OHQfAWwqSfJLysT2xL6FU2eutfu/bnXiRKUERsAljy4Uv81/MzxAEMW9OyxJokU5wr
         W2dOvsHDPxN4CtC9uJV40eSOkvfgSWYxDoKsiPQ49Zi4GQDMqGwGJCzCm6xsJ0fAgq+d
         H9iZvpX9NIbgNCGHa84OAKLaw7MLegBpB7/zaN6sOJN/vAGoT9ORbdQT6WNIF5SX43uJ
         RmiSzf6JcPfkJQ46jZScHB5/m8Ue/cQvj4jquIP9RYh8xGds6LeiTd/V7hbBW9xouC5y
         UITiIkzTBJ2wvgrAlPBi8+WUjghsteaOwPmsJErUiU5BFRjQ20bhzxZTyVY+iGlkxJcQ
         EEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qco/AyihnJ5LF9OqcB7SLvxoAFgJ7udwLUJdc+kCzpo=;
        b=Vk82zVEkOh3f2UBtIcqJ2uwMH6QSv9gWijaercIn5A5rlaKS+KkpTASvhQpk7OmxbO
         o7p5ulvRxIE+uqgexa0P64ehMbAo09Ru2BGO/XHyz43uUUPJwlX48pRZI8bAOUc6+wnc
         DPw0Nf+/xMfUpdngYZQjnGicpHsPJkL+QDgjmpxSKNzijsqk8elwyKQ4IGMAzqqlUj7U
         OerLl8g+bV75YsJVBwPeN69V0j+X/hrEURoIoymi53JnmmgmT/46flb9FbVjyQkewnPi
         gRtuGzXkODLe//QXDLaq8htbUB3cdoUXE+WYxDWeizz7Zmz+kvccCW8NfeOkIYODyJpB
         ELig==
X-Gm-Message-State: AOAM531EyNmIahsaYuwQ8xVl7j7L/9NtVSZUxdQh3KyOKk07/tk/9I1q
        R6XypkhOKf9nobu8gxT48k2Wuns0pFrun6m8wAR6KQ==
X-Google-Smtp-Source: ABdhPJzfxtZ4mgMNBH40Q61Gql8DSCEAQWyHWZwB7JYUQpLZ3NY96M/waaOpz6NzjZRVOJBGFxHptQ/RrHpFlVuVv4E=
X-Received: by 2002:a25:3750:: with SMTP id e77mr13079030yba.469.1627385748609;
 Tue, 27 Jul 2021 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com> <CAMhs-H9fbHMxxSaqMj=nyACAN6aDB-bYK1nF1dRh8a1krTdaZg@mail.gmail.com>
In-Reply-To: <CAMhs-H9fbHMxxSaqMj=nyACAN6aDB-bYK1nF1dRh8a1krTdaZg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 27 Jul 2021 13:35:38 +0200
Message-ID: <CAMpxmJUQmdfesygysBHB=bx7tYqMyry9tSw6E4dOnatTNKcAug@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip per device
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

On Tue, Jul 27, 2021 at 8:02 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Thu, Jul 8, 2021 at 9:04 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > There are some unfortunate cases where the DT representation
> > of the device and the Linux internal representation differs.
> > Such drivers for devices are forced to implement a custom function
> > to avoid the core code 'devprop_gpiochip_set_names' to be executed
> > since in any other case every gpiochip inside will got repeated
> > names through its internal gpiochip banks. To avoid this antipattern
> > this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
> > to get a correct behaviour for every single situation.
> >
> > This series introduces a new 'offset' field in the gpiochip structure
> > that can be used for those unfortunate drivers that must define multiple
> > gpiochips per device.
> >
> > Drivers affected by this situation are also updated. These are
> > 'gpio-mt7621' and 'gpio-brcmstb'.
> >
> > Motivation for this series available at [0].
> >
> > Thanks in advance for your feedback.
> >
> > Best regards,
> >     Sergio Paracuellos
> >
> > [0]: https://lkml.org/lkml/2021/6/26/198
> >
> > Sergio Paracuellos (3):
> >   gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
> >     gpiochip baks per device
> >   gpio: mt7621: support gpio-line-names property
> >   gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
> >
> >  drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
> >  drivers/gpio/gpio-mt7621.c  |  1 +
> >  drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++-----
> >  include/linux/gpio/driver.h |  4 ++++
> >  4 files changed, 34 insertions(+), 50 deletions(-)
>
> Hi!
>
> Linus, Bartosz, any comments on this series?
>

Looks good, but I was thinking you were going to address Gregory's
points first and resend a v2?

Bartosz
