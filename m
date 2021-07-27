Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C923D7953
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhG0PHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbhG0PHJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:07:09 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4771BC061757;
        Tue, 27 Jul 2021 08:07:08 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id v16so7286945vss.7;
        Tue, 27 Jul 2021 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FiwZUIMd4FVtw553LRH9en7u+lyoy6bWsRiV2OJrHxw=;
        b=VtOHDo5xKlhLyivf8QKGUl0tZh4txJ4dFuwZrqg3p1z7sZMHSYX4PutqcUtPsV8IgU
         LZFxWVuCYRZ7obeGok+jZS+cPANAmtloiZXBRcH4xgzCcdaomeCg95RzVjXUFdtLWz2N
         6Gzqjee+jrt63cu8S7OV9riPs4o+k5R9GnPn6htzf0bhimt+FtzA/Nw20b1UyZDKUUEI
         8tem/BaZKTsShxx+6rCWgTiYpcWDylCtz/y5bpNpSoFB6oSz+VOUtrcPP6TlAgcMMMyH
         V0hF+JEW6onWUKewv1RomGSlM6uQGmS0OQgHQTvMu6tvoC1FEiyCI+VLvSGvmix1Y59u
         BL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FiwZUIMd4FVtw553LRH9en7u+lyoy6bWsRiV2OJrHxw=;
        b=eBVwmZ9ne/drUjs+JecGYn2QtQEg8iQ9UkT/eAT/FagBwAemfFuDQMf8Pl+vwvH//T
         kwrz36YTCIkcD4IIIpbB7cgXrfxZ5CuZN6gSZjgt1S/4KsKDxP0nJE/QwXzkAelqNryI
         hHmr+7MA6fHjNRHTuN+oh+C6zczX9cdG4QUeu9Bt/GuiCZ6w1IZB54nMoQuh1u4I+XwT
         85qwaNkDRHW3aH6PJtOBF7v9BhC9yxnlA8ZHSvt9PHbuvqTdMZQmFdKx5rNjZPhPRAP0
         r0ikkvhuWGYZxXURvDS+6WFrhhjTe0TVog5Drj1T46TiyKec8YfK9mq3nXK4LNs8nGRt
         zG7A==
X-Gm-Message-State: AOAM531M4FjOLwND8VWcvki3cbk+pQIRXK6aFSqzHQhom8gcQNOcipBl
        Kaj2mIaIIW1hMbgiIUcwEEBf4HMFoFKSKKlKT+8=
X-Google-Smtp-Source: ABdhPJxKH/qV85skBPZE3HBU87CpQAzGR1rQQRDTBzm4LnjjQRjTx+ttXbhWeVcYpqjiAf2U+gdLRNKVTuOEikS+0wg=
X-Received: by 2002:a67:6915:: with SMTP id e21mr16783454vsc.44.1627398427460;
 Tue, 27 Jul 2021 08:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
 <20210727144816.8697-2-sergio.paracuellos@gmail.com> <CAHp75VdxrBbnkBDfhb3q7KM3CkAzyAq86gqjLFD5aaKNzVJCHQ@mail.gmail.com>
In-Reply-To: <CAHp75VdxrBbnkBDfhb3q7KM3CkAzyAq86gqjLFD5aaKNzVJCHQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 27 Jul 2021 17:06:56 +0200
Message-ID: <CAMhs-H_XktfW0PnK3yURS_bVBM10qws3iDp3Xgb602AZim0c=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
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

On Tue, Jul 27, 2021 at 5:05 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 27, 2021 at 5:48 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > The default gpiolib-of implementation does not work with the multiple
> > gpiochip banks per device structure used for example by the gpio-mt7621
> > and gpio-brcmstb drivers. To fix these kind of situations driver code
> > is forced to fill the names to avoid the gpiolib code to set names
> > repeated along the banks. Instead of continue with that antipattern
> > fix the gpiolib core function to get expected behaviour for every
> > single situation adding a field 'offset' in the gpiochip structure.
> > Doing in this way, we can assume this offset will be zero for normal
> > driver code where only one gpiochip bank per device is used but
> > can be set explicitly in those drivers that really need more than
> > one gpiochip.
>
> ...
>
> > +               dev_warn(&gdev->dev, "gpio-line-names too short (length %d) "
> > +                        "cannot map names for the gpiochip at offset %u\n",
>
> Reflow this that string literal will be on one line (it's fine to be
> over even 100).

Ah, ok. Will fix this and send v3.

Thanks,
    Sergio Paracuellos

>
> > +                        count, chip->offset);
>
> --
> With Best Regards,
> Andy Shevchenko
