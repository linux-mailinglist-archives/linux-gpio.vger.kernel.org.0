Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A803BF6F0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 10:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGHInO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 04:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhGHInO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 04:43:14 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF04C061574;
        Thu,  8 Jul 2021 01:40:32 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id d7so1220578vkf.2;
        Thu, 08 Jul 2021 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+MsIu4HTrj/2huEKTDaHz6jD9VPX2hMqgTDbcO4VJ0=;
        b=e+4GIyo93XGYjfNvEmxyrPerD236hhqmJhmLXzauGBE/MSAZRFoFWpvRxqQZdX20i9
         /+gMXQQ4X7XHKxV6T8V27KjdUfRvk6P3f4BBbBkaqf7z9MYr4viYs+pGIzsWAVe1JouA
         VA9UlH2VFEXidGNUirgwihy2EiqJgCyHI+q4jj9DnBupctzbr2Xm59/wTdQBIB2V8BoB
         FKBoLbnANwHYbl8oFkVY59g01UDHO5yS/BwAkkP4/FWqPBPG+tLIe/81YplYEY9F2bTT
         NvEE5TfO6EYVdgF+HnIV+r+MBOGDNyv5QAihuIaCLXEJF2Qc7hwCtFv4vFABMQSDJJDj
         Tcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+MsIu4HTrj/2huEKTDaHz6jD9VPX2hMqgTDbcO4VJ0=;
        b=UwWJE69uVOSVZq4UcYuDKfkogIrO0AR8bwZK720/hKH/h40zhh/XeKLQkxV6is0Z7S
         SJTAXmO7mR3KM6Esxh2I+a8E9yfx3VXahH2TQ8a2xiCWX53wyCFOm1YyvfiPiB123DPK
         Bgak7kbClMAzm9Mcbw4PT8mnKkZc7a9+fFDjLZJgOyUKFe66lrB2K1BYG5462kqKDJtO
         ZrduE/P6stT84r/x3vPibMVwUoP5rSlIzyPzMesZYqHy/vGhEWZOUs8WKFGEv1vVgWUg
         hkgxDBS1+Qasle5o2KmGTjOwRaoc4swyKCdg2K5JB5XD7ALurToh5x9NhA0wc5tiX2p7
         Y8Kg==
X-Gm-Message-State: AOAM530hjW9PkgWxSo5cO0nMzAXPLf/sVzCiA8bchmfv/bi+EA1+muql
        B6/YExuVUphL58UtAjwBknBFaE5cu505T7EbNmM=
X-Google-Smtp-Source: ABdhPJye54TwC49OzHXwVGcLiUahK6iR8PqFSoUHqYahFRJWifF3cF5GOQiHSoNSVnYWJbrtoxF87OyVcIEC+GTFirA=
X-Received: by 2002:a1f:20c:: with SMTP id 12mr8027049vkc.21.1625733631886;
 Thu, 08 Jul 2021 01:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com> <CAHp75VeWHt-z_2Lb=mJmm6yz_cAG_ywzH5zbWG2KN1sRvA6KZg@mail.gmail.com>
In-Reply-To: <CAHp75VeWHt-z_2Lb=mJmm6yz_cAG_ywzH5zbWG2KN1sRvA6KZg@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 8 Jul 2021 10:40:20 +0200
Message-ID: <CAMhs-H-kNkM7Rsr0BTp8f_a0OQ3fRVsgQwNP+kXGDS3EU7Mthg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip per device
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregory.0xf0@gmail.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 8, 2021 at 10:02 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 8, 2021 at 10:04 AM Sergio Paracuellos
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
>
> Thanks for doing this!
> LGTM,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for your feedback and support!

>
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
> >
> > --
> > 2.25.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
