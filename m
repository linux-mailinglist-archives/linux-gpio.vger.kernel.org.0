Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC251390731
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 19:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbhEYRNh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 13:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbhEYRNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 13:13:36 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CDDC061574;
        Tue, 25 May 2021 10:12:07 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id f22so15741005pfn.0;
        Tue, 25 May 2021 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wug7rsiCIoTV/mZ0CpjWys7g8dsVFdTX2MANuBYOeF8=;
        b=j5J+1I6go75C0rL5DZ/yFaE5o0QkohMaSCU1vjEaOV1AtR6pcAc5gNjUvB17djNNQ1
         2gvE0MyqghIfkjLRR+LdEenK+lNOiF4OvLKLXOWJX8EfOKJ9jzM6/o3bVo5BSrHNI/ST
         mGYjYFCFeQgq+K66UsfQ8RhkpbkuYy/c3msAZe/BLDCh8I0PpW/pfjsS9YR6RUaE65U7
         kCG7I4gPeHTLLFtEFvzfy3zqqglljWhayDWUTZN8w2VoaMljkvSpRX5IPyXu1V1swh8m
         1rDYUXUrse58w7/ANmpImgfOVpVx93OmrZEkrJ2ets2mhICxVmelTYNiclKij3LZ2K27
         hJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wug7rsiCIoTV/mZ0CpjWys7g8dsVFdTX2MANuBYOeF8=;
        b=rC1kQ3+A4IhGtrTXoQoLR7AEpklEzcJnKjoPmIvTRscCufak1B6kFpnF259yN0jZlW
         +Z3slgWirM9hIfIiVAHT1sHyhg4n9beMnTeqHHFZ+jb26MbT3oFv5ebLSIbad6s4xdRv
         AegaFqczwZY+88nuLj80A250jVo5jIWp/YnXyOcdGBJNwYfrTgvzJqIx5pr91/jHJ6nq
         t1xjzrc8aLruxm1Cv0Nv1Fp+1CpMQuGcrT3spdZJFrALTod9Qo+S79KNuFcAZLgG0zQl
         IN9XQF4G9Qhl8d6i3b470okEY0OqNGqfNLUjLT5JslP0BSOhYPrxGSAOiV/vTEXmKik+
         gOHQ==
X-Gm-Message-State: AOAM5330v7lwR2DNRziofQRwmM0XTK9xnBQNQV6giy4Ooh+QHh9ANQvl
        n/dPp85zU5lAciXOiUZzQcR9uDi/ExhgAiNf7VI=
X-Google-Smtp-Source: ABdhPJyynW/kmX1WZueKX4wBCXN+ebQo7Ihvp73ZcZbrbyogaAdSMs5P/7nrQUTcjc487cJf4U12mLZwIRdljIeJ1nY=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr20155532pgc.203.1621962726418;
 Tue, 25 May 2021 10:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
 <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net> <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
In-Reply-To: <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 May 2021 20:11:50 +0300
Message-ID: <CAHp75VfCBtcQX4rvmQnRMquM0k7ZBqOgZN15Z7TFNSO60SB9TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 7:30 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 24, 2021 at 6:03 PM Sander Vanheule <sander@svanheule.net> wrote:
> > On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:

...

> > Sadly, I don't. Most of the info we have comes from code archives of switch
> > vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the few
> > leaked datasheets that can be found on the internet aren't exactly thick in
> > information.
> >
> > The RTL8231 datasheet is actually quite useful, but makes no mention of the
> > output value isse. Since this isn't an official resource, I don't think it would
> > be appropriate to link it via a Datasheet: tag.
> > https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
> > 1.2.pdf
> >
> > Looking at the datasheet again, I came up with a... terrible hack to work around
> > the output value issue.
> >
> > The chip also has GPIO_INVERT registers that I hadn't used until now, because
> > the logical inversion is handled in the kernel. However, these inversion
> > registers only apply to the output values. So, I could implement glitch-free
> > output behaviour in the following way:
> >  * After chip reset, and before enabling the output driver (MFD initialisation):
> >     - Mux all pins as GPIO
> >     - Change all pins to outputs,
>
> No. no, no. This is much worse than the glitches. You never know what
> the hardware is connected there and it's potential breakage (on hw
> level) possible.
>
> >  so the data registers (0x1c-0x1e) become writable
> >     - Write value 0 to all pins
> >     - Change all pins to GPI to change them into high-Z
> >  * In the pinctrl/gpio driver:
> >     - Use data registers as input-only
> >     - Use inversion register to determine output value (can be written any time)
> >
> > The above gives glitch-free outputs, but the values that are read back (when
> > configured as output), come from the data registers. They should now be coming
> > from the inversion (reg_set_base) registers, but the code prefers to use the
> > data registers (reg_dat_base).
>
> Lemme read the datasheet and see if I find any clue for the hw behaviour.

Thank you for your patience!

Have you explored the possibility of using En_Sync_GPIO?

-- 
With Best Regards,
Andy Shevchenko
