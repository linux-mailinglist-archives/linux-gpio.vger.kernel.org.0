Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D44C44DE3C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 00:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbhKKXHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 18:07:13 -0500
Received: from mail-pl1-f180.google.com ([209.85.214.180]:37813 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhKKXHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 18:07:12 -0500
Received: by mail-pl1-f180.google.com with SMTP id n8so6959576plf.4;
        Thu, 11 Nov 2021 15:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CErV24ALLmtWHDv6Dg2Qhb0FOh3xq1Wa3w1/GJ4lZbo=;
        b=4e0UX9Qsm72C1ZBGXy0GCqbhzDdMiCMxOKCSgaebGWLoRvDHXdx1NQDxLUtu5gOB49
         JrQb3Fn3YuYICba4SGdiDB2YnIfB7MqQoFBzV8BRBox+2C59Gas/zM7bfkV2yL3jIdpz
         dHhSBf4fxsLWtNdckXQsAuqVgEL8LGMtEpkXTWK/DU0flrRR/El1ZzxmmyJJ4FqcszvK
         9Fbmy0VCOnZxVfrEETwbDEXm9KRenZDDoGhpgtHUAeuZdfXJtj1+DFionx3gT8lzrIvV
         7Y3Vrb3dWr39m5s1B9q9U6htPw+PIHdbj7aHHYSTuMvFbe1KoY3djd9AvRU8Bf+CQKQR
         GpKg==
X-Gm-Message-State: AOAM5338rLX4hI/kKRXnJf8IijQiEPR00RUw9Ebfil579szaG2dVwjrh
        aXC7HBIbctMD0sVXiAB1c+YEOpZlT2ONqCB2HAA=
X-Google-Smtp-Source: ABdhPJwDbzrsxKzE9i1z6gPeh3fpqAXyMhqZWJsKWQps8Fb82bOoN9fZpAP7ITZ8MQCrDHMRtOBbF32CeFI5d3+zvz0=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr2600284pll.33.1636671862963; Thu, 11
 Nov 2021 15:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
In-Reply-To: <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 12 Nov 2021 00:04:11 +0100
Message-ID: <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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
        soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 2, 2021 at 5:12 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >
> > @Linus: I'm really struggling to find a good way to describe how pin
> > muxing works on the JH7100. As you can see I've now resorted to
> > ascii-art to try to explain it, but please let me know if it's still
> > unclear.
>
> This looks perfectly acceptable to me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you.

> As it appears to have some cross dependencies I assume
> it will be merged through the SoC tree?

I don't know. I've never tried this before, so whatever is easiest I
guess. Do I do anything special other than cc'ing soc@kernel.org for
v4 to make that happen?

/Emil
