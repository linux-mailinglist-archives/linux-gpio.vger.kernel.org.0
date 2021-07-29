Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565013DABA3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 21:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhG2TK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 15:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhG2TK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 15:10:29 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A978CC061765;
        Thu, 29 Jul 2021 12:10:24 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id o12so4116309vst.3;
        Thu, 29 Jul 2021 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EK+RQQzIvJGIypNn7+XU6/k/SR55Rpg31IWG4uCDYMI=;
        b=bvyQButd1d3pw6Jv1xulreK/CzyeKf+SHiW+4oSbQiiQite9588wypA8gCOkmvdav9
         NPRB5bM8dr0olJz9yb5xMWWGFTcG6a2nOna2LJJau4EVZZatNUctpHaKRNWWjnX5V1U7
         Y/vxsWQ0l+9joZZNo0xUHFRODtHrXYsqTSffFJvFDvkNIX4RL/rAC7FeAA027hfpYDbi
         +xf5RARipN22eWvA4bF1J4HrVe2kfxhPMMEIVm6TnaET78sVI6Q6HXkyblX03Caa8pcq
         dSTT+HxiCDaun0LlkdihnHKaPeXfBb6IarHZRlUr9xAaF7Jx6qoCyVS2Q6DyTjqzFpFy
         6Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EK+RQQzIvJGIypNn7+XU6/k/SR55Rpg31IWG4uCDYMI=;
        b=HS2GyyJpMbrLWsXVFj2unWB1prYwzFQqf+Le+briUaDxucpQzVjA2fd5WGFPJn97gl
         Qu9bO952RQyQrsbY2aDWodxbfYG1DELe8EhtGySAczJ0VsBKUB6KosNpsWLojtB9QZe5
         Gzu9eDfTOtrsGCFKl0HPO9IiBYNDjABaP2FZItYZ0yAiTn+KsNhoPmhK3Simi8UM5/s1
         PQJh5erW6vSEZdKexNoW57umVbuEk7DKr3//W+88LntCFWl32gTRGiAMSagQG892srNA
         Vy3QVhNlAOui0wCOxwuhkKSx8J6BwMnUINoK7V2i273OM1nfbgPPh6mTyjIsGaF1mtfw
         oGcg==
X-Gm-Message-State: AOAM532Q+uYNjMX9lfgbF0DP60O4JZqXLXcuL1gnxK1BT3xnHBYUJUWt
        0HSDibV/19t1UyNOJnpaYJzoBRGa+KabT3egzyA=
X-Google-Smtp-Source: ABdhPJxI7C8GwnmztYDPQj1OGETcAJoKnduIzlZK3+vj1jqp7b9pW8/bO0PRFvHR3O7NMGaMjb+D0FgNhVmRnDplD+A=
X-Received: by 2002:a67:fe47:: with SMTP id m7mr3541014vsr.28.1627585823800;
 Thu, 29 Jul 2021 12:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com> <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 29 Jul 2021 21:10:12 +0200
Message-ID: <CAMhs-H93GxOHdD4dNAWeyMOrnU2u3QLYK7v=0XF6DQixjhjxag@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 7:43 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Jul 28, 2021 at 6:12 AM Sergio Paracuellos
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
> > Changes in v4:
> >   - Add comma in warning message for clarity.
> >   - Collect Gregory Fong Reviewed-by for PATCH 1/3.
> >
> > Changes in v3:
> >   - Reflow a string literal to be on one line in PATCH 1/3.
> >   - reflow commit messages PATCH 2/3 and PATCH 3/3 to occupy a little bit
> >     more available space per line.
> >
> > Changes in v2:
> >   - Address Gregory Fong comments in v1 of the series [1].
> >   - Collect Andy Shevchenko Reviewed-by for the series.
> >   - Collect Gregory Fong Acked-by for PATCH 3/3.
> >
> > [0]: https://lkml.org/lkml/2021/6/26/198
> > [1]: https://lkml.org/lkml/2021/7/8/47
> >
> > Sergio Paracuellos (3):
> >   gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
> >     gpiochip banks per device
> >   gpio: mt7621: support gpio-line-names property
> >   gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
> >
> >  drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
> >  drivers/gpio/gpio-mt7621.c  |  1 +
> >  drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++-----
> >  include/linux/gpio/driver.h |  4 ++++
> >  4 files changed, 33 insertions(+), 49 deletions(-)
> >
> > --
> > 2.25.1
> >
>
> Patches queued for next. Thanks!

Thanks!

Best regards,
    Sergio Paracuellos
