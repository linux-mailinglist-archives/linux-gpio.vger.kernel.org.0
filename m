Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6166644AA95
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 10:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242440AbhKIJbR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 04:31:17 -0500
Received: from mail-pg1-f175.google.com ([209.85.215.175]:39588 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241297AbhKIJbQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 04:31:16 -0500
Received: by mail-pg1-f175.google.com with SMTP id g184so17958406pgc.6;
        Tue, 09 Nov 2021 01:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yz8tM/z3N2e7EAzXLrtHRMyDGqdFNyhQg+TbKONS+ZA=;
        b=4bSbSmv8kEHpj6aP/B7nHqiBEUoUqrSIQ7MfuTKndA6u8t/L1A+zUxT0zLGFPVlIFH
         OA4qjotLeOHgDseRpuNARX+49s32XeYazckCoCkpQxEyHPi37Tz0Oag0+jmvO+56ObD9
         /6Htjfs/Y2o+wFlc273iUK7gKO/UZjaiRCYHdXCEPISIiX+T0Fv769Z90qqj0SpdQajR
         gvOsEqNPdSMUgDdr99JcRTdJ0qFRi8bV0AB4lT9tOdKD2tol5GBFdtcCCi/lvU/DCIJC
         jk+K/r0P7RDTeMzBqxsrv+bl3jq38qIbE3wSnkCjldGAUYPie5D3sc0IcJjjzrQcU/Fi
         Mzsw==
X-Gm-Message-State: AOAM5334B28TLT0z58SVWUrN3u63ZYwiJvFRgGcVv0s8jMjt6uCJLjQX
        pvYGek0dP6pXnDNSaO3hav+mR0+4H5eV639bVjg=
X-Google-Smtp-Source: ABdhPJxW3OzBbFwk6SYjQCx51Ta8chEzqW82y4oeq2E/L1Hmmq+pPv46FbGKxh51ekUabxDvqUbynxlLSoh+pPpDjsk=
X-Received: by 2002:a63:b11:: with SMTP id 17mr4847235pgl.51.1636450110959;
 Tue, 09 Nov 2021 01:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
 <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
 <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com> <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
In-Reply-To: <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 9 Nov 2021 10:28:20 +0100
Message-ID: <CANBLGcwwE7u377N-9B4X7Tew9hLUtusZ=0B9GSj-b3mV3r-Sbw@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Yury Norov <yury.norov@gmail.com>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 8 Nov 2021 at 10:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 04, 2021 at 01:15:46PM +0100, Emil Renner Berthing wrote:
> > On Tue, 2 Nov 2021 at 22:17, Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > I'd really like to understand your reasoning here. As far as I can
> > tell reading 2 adjacent 32bit registers with a 64bit read as you're
> > proposing is exactly what would cause endian issues. Eg. on little
> > endian you'd get reg0 | reg1 << 32 whereas on big-endian you'd get
> > reg0 << 32 | reg1.
>
> Nope, it won't. The endianess is a property of both CPU and device.
>
> The I/O accessors, such as readl()/writel() and iowrtieXX()/ioreadXX()
> are _always_ LE.

Aha! Thanks, that's the bit I was missing.
