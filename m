Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FE7453837
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 18:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236996AbhKPREU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 12:04:20 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:39912 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236991AbhKPREU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 12:04:20 -0500
Received: by mail-pl1-f169.google.com with SMTP id t21so17949576plr.6;
        Tue, 16 Nov 2021 09:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2kB/IHHiXlPLoleXGBLCycFQAExYoaFFexggp5bSVo=;
        b=vI6mWUojCcZXj0Xg1yKGHduGy6qGFddmCIlfnelZF/oJsfX/OuKLxOr3JRV0KcNdU4
         voM7P5YGXcv3ACTFWxj7L+CaxtjiE3ZN0Z05C22QUIbI1r2fG2yBWLCTWqt/d3rb8Fxp
         eNdme4YgHUSV04mw5zQLMUPspfEb7eDnGaMSc3103wmznkaaQXpfunpxiGb5zfyKoviI
         NZtVsiQMYiIczVUz39l+OaLHXe5MCDih9RoFpgo9w2K8Wa5ajGW7JnYt0getHxkla6w+
         a31xtzKKWyJzBuJ6Axa3GCNDhGYEpdl1X1cjs5+BKX1yj3KOSLiUTgVA+GyKycc6ZPFl
         y7VQ==
X-Gm-Message-State: AOAM5309DlKdjnIBpw3EJ8i5BhMEhw+W8eF4f42uKiXsIO/PE0tptSxp
        wCb/vwnKRZf3Oz7lGkTY7Su5u4to+pXtWhjJ9A8=
X-Google-Smtp-Source: ABdhPJw0NtCCj4JMiGtWQRMS7H6HN1JmlLLVDM8Xio5FAaX/As3zCBQM5/nUUZvd9N918T/3wjE+WofsTrql8xuMV3M=
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr599032pjq.194.1637082082818;
 Tue, 16 Nov 2021 09:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
 <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com> <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
In-Reply-To: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 16 Nov 2021 18:01:11 +0100
Message-ID: <CANBLGcz5MaEK+i4GwhJK2sJ9qXoW7GhvZXOKEj8_SB_ZnGgGTQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
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

On Tue, 16 Nov 2021 at 17:44, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 5:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Why?
> > Submitting Patches tells about chronological order and last SoB to be
> > from the submitter.
> > These both are correct. Note the difference between 'last SoB' and
> > 'SoB to be last [line]'.
> >
> > Here is the excerpt:
> > "Notably, the last Signed-off-by: must always be that of the developer
> > submitting the patch."
>
> I think having the S-o-b in the final line is far more common, and it does
> help identify who added the other tags, i.e. the person signing off
> immediately below. I don't reject patches that do this the other way round,
> but it's something that felt unusual here.

Then I'll stick to what's most common. In any case patch 12 and 16 got
it wrong by both conventions.

/Emil
