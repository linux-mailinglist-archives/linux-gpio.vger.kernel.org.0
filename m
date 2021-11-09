Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D3544AAAD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 10:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241941AbhKIJnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 04:43:03 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:34764 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbhKIJnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 04:43:02 -0500
Received: by mail-pl1-f179.google.com with SMTP id r5so19927556pls.1;
        Tue, 09 Nov 2021 01:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bi+4EcCOJ07EIdzMMOuINB1xKKX7YpFZJOF2Giniox8=;
        b=Q55Gv9AZ1Ugbxj4x5W4sh7u9Joz9zFr3LMOdPK0nMvb5VE5pbjemU8jCTkXm9pOwWj
         OLCrLLgH9sCsCKYpnj6bFX8Ud5Bm8Ga6TAmMlOeZekokmTc2eYo18PCBaVaEAhJrEFQS
         a/i4TUPm+e3GiYF6q+3Mw/Hk4ygumLMtC+9rGL/5dPTLMKSmPRcpD1r6tLG/0BxoUwSG
         C/ftZn4iDEQnZ56fxHr9/lksupY1emkwE5Og7NKd3t3f2s3npabO7Si9VYjoY1kbGiz8
         rdfN96iigTo33bhhJmoeb4NOCmp6liDdHKufAYLJrMeDtLY2gM/wTJCE8OTR4NVWoPZQ
         rMoQ==
X-Gm-Message-State: AOAM530VoiI9qefsOqeF34Z09oWvJy6Re5G4E2wQoqtufM6bREFJoMwR
        sCzF+BMX2L0VNLEc7/L/+Xt2hq+IlbCu72VyAxs=
X-Google-Smtp-Source: ABdhPJwVbz77xeGB/DO7Z/uALHz4oERmvzBmgKOdVHHAT5yOLcAGrWV4NruNJN0Ckdd1t2k8MomEyPTsH64A2B+ZHeA=
X-Received: by 2002:a17:90b:4b0e:: with SMTP id lx14mr4174899pjb.160.1636450816945;
 Tue, 09 Nov 2021 01:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com> <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
In-Reply-To: <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 9 Nov 2021 10:40:05 +0100
Message-ID: <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 9, 2021 at 11:21 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > Linus any comments on this code (sorry if I missed your reply)? The
> > > > idea behind above is to skip all settings from the same category and
> > > > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > > > disable", ..., "bias set to Y", the hardware will see only the last
> > > > operation, i.e. "bias set to Y". I think it may not be the best
> > > > approach (theoretically?) since the hardware definitely may behave
> > > > differently on the other side in case of such series of the
> > > > configurations (yes, I have seen some interesting implementations of
> > > > the touchpad / touchscreen GPIOs that may be affected).
> > >
> > > That sounds weird. I think we need to look at how other drivers
> > > deal with this.
> > >
> > > To me it seems more natural that
> > > starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > would get called at the end of each iteration of the
> > > for (i = 0; i < num_configs; i++) loop.
> >
> > That would work, but when the loop is done the end result would be
> > exactly the same.
>
> It seems we interpret the term "result" differently. The result when
> we talking about GPIOs is the series of pin state changes incl.
> configuration. This is how it should be recognized when programming
> hardware.
>
> >  The only difference is that the above would rapidly
> > "blink" the different states during the loop until it arrives at the
> > result. This would certainly be different, but it can never be the
> > intended behaviour and only a side-effect on how the pinctrl framework
> > works.
>
> Is it? That's what I'm trying to get an answer to. If you may
> guarantee this (the keywords "intended behaviour" and "side effect"),
> I wouldn't object.
>
> > The order the different states are blinked depends entirely on
> > how the pinctrl framework parses the device tree. I still think it
> > would be more natural to cleanly go to the end result without this
> > blinking.

Hmm.. but if going through the different states is what you want, then
wouldn't you need the device tree to have an ordered list of the
states rather than just a single node and also a way to tune how long
time the different states are blinked?
