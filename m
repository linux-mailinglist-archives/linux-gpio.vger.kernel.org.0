Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF7044A9D6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 09:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244618AbhKIJB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 04:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244616AbhKIJB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 04:01:56 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7222DC061764;
        Tue,  9 Nov 2021 00:59:10 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id f8so73911380edy.4;
        Tue, 09 Nov 2021 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kmkcsLwhqrRlZYiF/o6WGOvaKjRFSvuNPZIr825qDS4=;
        b=B0Nkb/Lxi0ma4Gqty9CoAxpahvSRtZuZt6gtGMcfl+nc1uMbWq8qR6m380Cn1GtcYo
         CE3E5Ovrh+MmdKN0BaVZaUbM764j9Q8purv+cEYsE7jtPS7bPFvvHeJz079iNLi/xS50
         tmY5tAsfSHvM0JsV0+46VXA338tcleeUlItyIbU33JpjEFGzuzuqIvp8ftahGriow6Lm
         6ga1r+wPTMjilwoXyBDuRlEftn3l7MwikhGjtipWEF4yjm7F2gHTBWaG8pSC9BVrpWaG
         fCgx5rL5EcCxwlbNhLvr/fueVV9MpPK1k1e0XYQVDh4pBQGif/GvKh04bDBmH1np8Oul
         zWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kmkcsLwhqrRlZYiF/o6WGOvaKjRFSvuNPZIr825qDS4=;
        b=ThpqunLGSPdaxgSpkXRBf5nGa1GXQjKCxvdqDhlrbY1ahyXEMKwL6rIDIq0QMe9Jtj
         KXeHJIKsrvw3Z3tm9Cq5KA+b3mlUDUHGZWq0ZbX4NSR67XWsws+lEm4YNIX5quXTq/ir
         uduvCCXCPYPN++eTUb+AaRs9Lj1SM+tZ3ZKzoaGBPUfVPwO+7iEuvZA8mEBTr3aBlB/q
         d1vxxGnZBDzrGCyc8qYOQaq/6BM22Ed/0nU+FKpu2cCIH6GbXQt4v/Ic9JRDjH7XRGKK
         rgQElRBnLZB5cNdxQxJamJyNE53zYSZ80imNiLOe6UboJo8esGo7nDhej9CGA9wTPdQm
         SE/A==
X-Gm-Message-State: AOAM530C+KAhpqYUk/1DmwJf02Zc5s6JrVe0OjLEj1nlhh4ajXAZF7oJ
        buH+/WXJv3A+eUM2C6L1u8rM2sYgn+9LYhWtV4c=
X-Google-Smtp-Source: ABdhPJyUtICnxChNmThzPFmd2mxmlxgT2Vf4Uq3J6C6iLge/0z3Zlx6o0pBqiUkPlRNLnjsnz4Jc3nCgip5GrDG9gAs=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr7419521ejc.69.1636448348975;
 Tue, 09 Nov 2021 00:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com> <CACRpkdZOpXC0GvoyS8KexgjxL17rjyNkPuA0KGOvesZMDLvyJg@mail.gmail.com>
In-Reply-To: <CACRpkdZOpXC0GvoyS8KexgjxL17rjyNkPuA0KGOvesZMDLvyJg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Nov 2021 10:58:23 +0200
Message-ID: <CAHp75VcxQ8nWqUTYzhJeUW55bvALHzcxQjMTP5UQwxmwu2aZ3Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
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

On Tue, Nov 9, 2021 at 2:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 2, 2021 at 9:02 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > > +       depends on OF
> >
> > So this descreases test coverage.
> > Linus, can we provide a necessary stub so we may drop this dependency?
>
> Hm it further selects OF_GPIO which depends on OF
> so I don't know how that would work.
>
> But does it decrease compile coverage a lot, even x86 has
> optional OF support so I imagine it appears in x86
> allyesconfig I suppose? Or am I wrong?

I believe so. At least in my environment I have OF enabled (I haven't
looked into what was the change to the config, though).

-- 
With Best Regards,
Andy Shevchenko
