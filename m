Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBE4453884
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 18:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238852AbhKPRbw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 12:31:52 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:44904 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238725AbhKPRbu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 12:31:50 -0500
Received: by mail-pg1-f177.google.com with SMTP id m15so14347847pgu.11;
        Tue, 16 Nov 2021 09:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkA51tWxSsscDQ4OnDVF0gVKl+TpddKexu+rNB6rga4=;
        b=SGPLW0Gs4GbGKkyxZ5mwFJQ8mK+cSYPURcI1lpwH9R0ikX9PnRvhqq3IhaMSw6cigF
         wYInfhIxvua96lYrJWEGVASX2z5w7WkJfh9tcLr8aUE90WUlcsSJ9qNwENe5gaCVZeLL
         Pe4AV/I+nAhOyb5dpeSlZraDc5Wjm4rvoTGnsxCg2SS4tgIA4v8GndMJNmRzF0lN5wJq
         Ka2m5bbuBmh4MYKHbpmuPuMrhoGD2FCqqyhNjaienJvKNRLGG9vnzpWm/QyBBxyOXQun
         PtH8yqSr0w0YQkPtZnUofhZ73TAuo2/K0dCgqA5XFNCxdaMA1Lr+0e+qWHoB15yUm5LQ
         ZRJQ==
X-Gm-Message-State: AOAM533MpTy5ZOd85TrYgGO4zWHPTqaD5RgKUoISRONCWE3xMX1dkX14
        HGLHJXDF5ZbFa72HCmFZ/TWV7dmE8hKcb2aLAWc=
X-Google-Smtp-Source: ABdhPJztWnQTEvyFBXk/EWoYZuOO/BsO/4j2XiqLi5dCPei8GORqCEcvrDQZtaHkVUqJCHntXdMP/Q0JwesAiwH1PXU=
X-Received: by 2002:a63:3f44:: with SMTP id m65mr422498pga.15.1637083733060;
 Tue, 16 Nov 2021 09:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
In-Reply-To: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 16 Nov 2021 18:28:41 +0100
Message-ID: <CANBLGcykFks+EF2m0bdD+j5w43Qy30LBgVnAYJWU+5-WVJH6PA@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
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
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 16 Nov 2021 at 17:08, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
> > many devices that need non-coherent dma operations to work which isn't
> > upstream yet[1], so this just adds basic support to boot up, get a
> > serial console, blink an LED and reboot itself. Unlike the Allwinner D1
> > this chip doesn't use any extra pagetable bits, but instead the DDR RAM
> > appears twice in the memory map, with and without the cache.
> >
> > The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
> > Starlight Beta boards were sent out with them as part of a now cancelled
> > BeagleBoard.org project. However StarFive has produced more of the
> > JH7100s and more boards will be available[2] to buy. I've seen pictures
> > of the new boards now, so hopefully before the end of the year.
> >
> > This series is also available at
> > https://github.com/esmil/linux/commits/starlight-minimal
> > ..but a more complete kernel including drivers for non-coherent
> > peripherals based on this series can be found at
> > https://github.com/starfive-tech/linux/tree/visionfive
> >
> > [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
> > [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/
>
> Thanks for adding me to Cc, I've had a look at the series and didn't
> see anything
> wrong with it, and I'm happy to merge it through the SoC tree for the
> initial support
> in 5.17, provided you get an Ack from the arch/riscv maintainers for it.

Cool!

@Palmer, do you mind looking through this? Probably patch 1, 15 and 16
are the most relevant to you.

> Regarding the coherency issue, it's a bit sad to see yet another hacky
> workaround
> in the hardware, but as you say this is unrelated to the driver
> series. I'd actually
> argue that this one isn't that different from the other hack you
> describe, except
> this steals the pagetable bits from the address instead of the reserved flags...

Yeah, it's definitely a hack, but at least it's not using bits the
spec said was reserved. Hopefully the JH7110 will be fully coherent or
maybe implement the new Svpbmt extension.

/Emil


/Emil
