Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61628437902
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 16:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhJVO1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 10:27:42 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:46723 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhJVO1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 10:27:41 -0400
Received: by mail-pf1-f175.google.com with SMTP id x66so3742087pfx.13;
        Fri, 22 Oct 2021 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jorqKoNvCog+RdJEWLLzk4/vugG3Lx6Xwa7r7jPCqTI=;
        b=FCdcn7vVuIjicwvIn3P4ZQHYD/4ly7txPGIskT4FNCudWWHaUJsbAzrx7pfW6LL83A
         TAhpi3CIUjv5qXNP9a8WpS1/8ylJur1VPW2sRE/aufw+28LLfAWw4OyczRadPZVQ+mbR
         N3cNbhPQ0/vudTJKhugvCJgY7JYdB7ZfyeS+ADjoMd1PVZ/leJ3De19ewjZXwUGFtxTV
         U6ETQuoioD0LK7Ba2iQ5KlwtkkYFnzn0mAF03QL66xz/jRs+yvxgiNvrmO1rjAXypm/6
         Gzrh6cBcD/uD9cgnInElbp1uR/RO2uGJHQvs/AbMQdUkjGK0+E2svQXb6RAhvwFaUtud
         yYsQ==
X-Gm-Message-State: AOAM530C1wF5Y63M0BPsndjMMIeeyk2N+P3SV6WXE8ySGa9sDQ3js9CC
        QXhHofQz+fu2jjHpBRx8Zl+8UjQzBZZi0I0sMJfVnYyjZZVsIA==
X-Google-Smtp-Source: ABdhPJwwiGgg/wAhh2MuTJi/0OlJOC3w8grm3LkhekM9ZxjuDcMopYi54hXrYFPVSp69WJyB7UqQZkgeS1a1t8VrapI=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr12576754pfb.79.1634912723745; Fri, 22
 Oct 2021 07:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com> <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
In-Reply-To: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 16:25:12 +0200
Message-ID: <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > Why all these ugly % 32 against constants?
> >
> > Because the JH7100_RST_ values goes higher than 31. There is a
> > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > machine.
>
> And? It's exactly what you have to use!

So you want me to use an unsigned long array or DECLARE_BITMAP and
juggle two different index and bit offsets?
Also is there a macro for handling that we'd then need 4 commas on
32bit COMPILE_TEST and 2 commas on 64bit?
If you have some other way in mind you'll have to be a lot more explicit again.

The point of the jh7100_reset_asserted array is that it exactly
mirrors the values of the status registers when the lines are
asserted. Maybe writing it like this would be more explicit:

static const u32 jh7100_reset_asserted[4] = {
        /* STATUS0 register */
        BIT(JH7100_RST_U74 % 32) |
        BIT(JH7100_RST_VP6_DRESET % 32) |
        BIT(JH7100_RST_VP6_BRESET % 32),
        /* STATUS1 register */
        BIT(JH7100_RST_HIFI4_DRESET % 32) |
        BIT(JH7100_RST_HIFI4_BRESET % 32),
        /* STATUS2 register */
        BIT(JH7100_RST_E24 % 32),
        /* STATUS3 register */
        0,
};
