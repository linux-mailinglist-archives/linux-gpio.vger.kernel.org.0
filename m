Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD7044B3F7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 21:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244346AbhKIUcZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 15:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244333AbhKIUcV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 15:32:21 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7621CC061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 12:29:35 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so480597ote.8
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 12:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
        b=OweV8gSNpr/wemLfT5r5RqLdeNQQkyD/5uhlgtWeguJV2kW4kusfjz5uEepsm35Uhz
         zxR38DUI8/IDIgxkpQz0Tr9dwCnxanyqiqv/JOp8GMlFop+gP+rMEs9Mhbm8m9bOx212
         6oyJhJb6BNDTip5qNk1mjb8MZbGv7koOtqGXg1JXtimY92OdEVIub6loTlg0f4f4g9Mp
         U9khgkYKVjZK/5/igWUFPJBklDaIWAgtGhHPLcTG0hS0KLbmatF62yQe54EL0uzApfg7
         x8JIp4TmUBJP4w/9BfWDl1KDTkR5EAu60nNT8PYwktSPJrYlp4yUEqClTkbZC2OlPz8j
         yE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
        b=rErO4UbFS8OlgT300y2H5FJ6vjyTQjd+fJ+1Uwa0lIitRmSTxY6jK+xNezkT0O9kST
         5lpFYu/b+X6nUAp0GgVc3dZv1kqN3GU22BsjiZSJhz+wSohnNu9j/hf7pfCg74BMnizm
         LPK88YG9iupzYqNAJv93K7gv9aah586AVqhiPXTG2t/nL3GLMdES2SwdJQ2XMk8pgRBV
         IyjjsjDglhAiUudgNoP5clu4ZCgGrudxLnaIjREfZPO1LmluQsCi2Kz3xeGq39IvNHzW
         IcpFhK8QxIlFI0k/wCGQ3WVC/6qsDTJ8xJVfhbgGgHyio1ZXkmnqoZUZvqUD1Bu68CqF
         v0OQ==
X-Gm-Message-State: AOAM532uqg77xUq/9+YmRYUwJNqgKEociOIzTPIfcaDeTg9DxG9S2yTh
        8PHoiRmDYNgdnbGLHVDFMLkQGc/54hsbNgYxlmqu3w==
X-Google-Smtp-Source: ABdhPJx79vAz5xo21O8AcZjHZ2iz/cgsFzrU7PqDL77Snjbftb5loWoN2JiL02a01H3N9KzF4bFY81wiDaHO8sIEFIQ=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8156814otj.35.1636489774773;
 Tue, 09 Nov 2021 12:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com> <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
In-Reply-To: <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:29:22 +0100
Message-ID: <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > > The order the different states are blinked depends entirely on
> > > how the pinctrl framework parses the device tree. I still think it
> > > would be more natural to cleanly go to the end result without this
> > > blinking.
>
> Hmm.. but if going through the different states is what you want, then
> wouldn't you need the device tree to have an ordered list of the
> states rather than just a single node and also a way to tune how long
> time the different states are blinked?

In a way you are correct that the DT is a functional language and it's
a bit lite a style sheet or prolog or something in that the end reduction
is what counts.

In this case, I would say something is weird if there are interim states,
the yaml validation should not allow you to set the same thing back
and forth in your DTS file.

Alas we are not perfect as in yaml validation isn't perfect either.
I can't see what the problem is really, just write proper DTS files
and there will not be any interim states, right? And if it is possible
to write DTS files that have states and sequence requirements,
these should be caught in validation. Should be.

Yours,
Linus Walleij
