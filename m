Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE4B4536F3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238868AbhKPQLj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:11:39 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:41079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbhKPQLN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:11:13 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlNYj-1mPXfy1mjF-00loZT; Tue, 16 Nov 2021 17:08:11 +0100
Received: by mail-wr1-f50.google.com with SMTP id u18so38606580wrg.5;
        Tue, 16 Nov 2021 08:08:11 -0800 (PST)
X-Gm-Message-State: AOAM530g4B3TlIcHHBgS9edOyydYsg63LNoa3JO6DXwIfzSEBpZUEo2r
        gtSH5J+QIw0vn03zIhaZqYdsd8SfDTIqda8JkA0=
X-Google-Smtp-Source: ABdhPJzhVa1Gld1OIgwekMITNW9WNUSf74CcnJN4vc2E+/epq+jCDHswwl2sO6HxKGWhIEJta2sjg10rMxFMi1drm9g=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr10808562wrd.369.1637078890957;
 Tue, 16 Nov 2021 08:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 16 Nov 2021 17:07:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
Message-ID: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
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
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0e3I1nOzP5QPE1KCthDekKMR/jZLoOLX9z4OOZ6Lg/EN0QeaLD7
 5XUiawLQZIdohKcukIewfPShgtLfS6+Ju1BVOroM/vv9BIokslt79DoyOauNhpxuIXDFlye
 WHHc6PnZAYfUsRGbRtTMPauoWXyAortdUXaTILo1IEB1NbtGfy4D/RNx5bTZok0SKGTdwW7
 sKw26xYsMQlfd4UWb4y4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:56gPcYPJTP0=:a2b3OTFIE+rsdVvu9ay1dk
 l7wMEDvUiy3aVGaeE55D3HWqfpHHTjBg3uNJHRbtjQ9yc64MIk2QohxksfaomvGhxCDzgmTzH
 4cK7598GNdX3WWw1588DhIOm8vUfasNh57FhsbPBE0elr5nSkGf8ksfX+ly+07Ya4dWxcXQq8
 P3Nzamo1ZUzVpdPY9lFaabfmT13AIS7wQ3FGqF9F540zJZRi7zOdinHv5o1vM+2gVH53kRz5I
 H8g8j3Y0ce7pBzJNGCH960QaTQ/n1N9BLQfxT62W9JOlJHCrFz8SbsuuRZSoTY9nb5FGCX/fz
 BI3NDGh5iExPkSz3EYHfphLX8MNuQCyRHXmzVHaGM82c13W5dGmL9IPIoKm9PSJJyoG+g6nNe
 BD3Kf295tCizPPIPIws/IQRdJIOmx60FXxqzZXrz3+b+Ogk3RHgJlsUre86dWbzuYDA/rVe22
 zocPlnMM/o5p/FcC6ltcOjwJCAtKV68JG2Mldz0lAI76M3QjCoKLqpwkjwOQxnoORl27QbJVo
 gB+vRqOP3wdd0i0xlZl/VCAmnCpq8BSjHNQzOkBpCc2DUCIqFfDZ/MZ/kGyH4W6cMXpPDlLGq
 Yq79fgeLfCKpNQqvfux0zGUGEfMgmEt9meuz2091uw8gNt+PYEWnIcLHobxPa8jXyRNOwaXSw
 zzdBKNVqrrpXDuobk0KJNoS3VWkPeeQtBUyPOMVs1XdYIjKMzNg7BooTvB4Ng0D81Pws=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
> many devices that need non-coherent dma operations to work which isn't
> upstream yet[1], so this just adds basic support to boot up, get a
> serial console, blink an LED and reboot itself. Unlike the Allwinner D1
> this chip doesn't use any extra pagetable bits, but instead the DDR RAM
> appears twice in the memory map, with and without the cache.
>
> The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
> Starlight Beta boards were sent out with them as part of a now cancelled
> BeagleBoard.org project. However StarFive has produced more of the
> JH7100s and more boards will be available[2] to buy. I've seen pictures
> of the new boards now, so hopefully before the end of the year.
>
> This series is also available at
> https://github.com/esmil/linux/commits/starlight-minimal
> ..but a more complete kernel including drivers for non-coherent
> peripherals based on this series can be found at
> https://github.com/starfive-tech/linux/tree/visionfive
>
> [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
> [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/

Thanks for adding me to Cc, I've had a look at the series and didn't
see anything
wrong with it, and I'm happy to merge it through the SoC tree for the
initial support
in 5.17, provided you get an Ack from the arch/riscv maintainers for it.

One general (minor) comment about the patches: please put your own
'Signed-off-by'
into the last line of the patch description, below all the lines you
took from other people, so
instead of:

| Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
| Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
| Acked-by: Rob Herring <robh@kernel.org>

do this:

| Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
| Acked-by: Rob Herring <robh@kernel.org>
| Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Regarding the coherency issue, it's a bit sad to see yet another hacky
workaround
in the hardware, but as you say this is unrelated to the driver
series. I'd actually
argue that this one isn't that different from the other hack you
describe, except
this steals the pagetable bits from the address instead of the reserved flags...

          Arnd
