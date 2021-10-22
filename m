Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688C7437861
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhJVNwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:52:50 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:38832 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVNwt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:52:49 -0400
Received: by mail-pl1-f181.google.com with SMTP id i5so2735843pla.5;
        Fri, 22 Oct 2021 06:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e4VAlxqjX7tVS4RVU1hVLMwxlt5HBKt4g0cT2A4i/lc=;
        b=CQm86dOsCIjWXawe3/g/e4cs0g6/TUg6PmP6hYoQDl1Zcvv+5uvYJbEtgF6VFROEHr
         oztYhNAeb18MUGa/RK9O1PN0wHysJiez5sHpViiPltj0fPsoGzl20EHJBbyVSdw9iN4b
         hB0PDPM1ECf6uXWbIDITJ9IruZcJ/k3NgdyLqpjp/Yk5a/7hjQPkqgrEaTbzHB5mz5vI
         sBQZzQwXfFSs+B4LYz5G0Jbd1DrTPCek1Wq1XtsFHygBA80wLFl5msAFunQ/PCyp4EZc
         P5GAjBHEaV1WMr7olA4VESK7TpbTsW7OYQUv6KGYd4nCfgx9dBeVu7U5riIfhqMDbMG1
         lFSA==
X-Gm-Message-State: AOAM533TdPzLqSPNeEwH6WCs5XnYRvtS0QbKaN/hVjgLLZXlpooag0tF
        tx15TPh4oYHEHnH8vLpm25KGqz/o4g7r3siSiNU=
X-Google-Smtp-Source: ABdhPJxD84S/qyVc64yZN7zn360JIvYLyRoTZQ+nTLW8NPOh4R0Onceuz8xIbXKjs/Zs0RMr8FooFXCbqrByMUrAzuI=
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr13560608pjb.185.1634910632123;
 Fri, 22 Oct 2021 06:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com> <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
In-Reply-To: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 15:50:21 +0200
Message-ID: <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
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


> > > Can you convert this to simple
> > >
> > >   if (assert)
> > >     ret = readl_...
> > >   else
> > >     ret = readl_...
> > >
> > > below?
> >
> > I don't see how that would work. We're using the done value in in the
> > readl_poll_timeout. Maybe you can be a bit more explicit.
>
> Supply done either == mask or == ^mask. Try it.

So you want this?
if (assert)
  ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
done, 0, 1000);
else
  ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
^done, 0, 1000);

The compiler might be clever enough, but I'd worry the long body of
the readl_poll_timeout_atomic macro is inline twice. Rather than just
flipping the bit in `done`.
